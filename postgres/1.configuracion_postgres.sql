-- https://www.linuxito.com/programacion/337-como-listar-tablas-y-bases-de-datos-en-postgres
-- https://stackoverflow.com/questions/32439167/psql-could-not-connect-to-server-connection-refused-error-when-connecting-to
-- https://www.digitalocean.com/community/tutorials/como-instalar-y-utilizar-postgresql-en-ubuntu-18-04-es
-- https://www.todopostgresql.com/crear-usuarios-en-postgresql/
-- https://enterprise.arcgis.com/es/server/10.4/cloud/amazon/change-default-database-passwords-on-linux.htm#:~:text=Inicie%20sesi%C3%B3n%20en%20psql%20con,la%20base%20de%20datos%20postgres.&text=Emita%20el%20comando%20%5Cpassword%20para,es%20%5Cpassword%20.

----------------------------
-- COMANDO PARA INSTALAR POSTGRES EN LINUX
----------------------------
sudo apt update
sudo apt install postgresql postgresql-contrib

----------------------------
-- COMANDOS PARA HABILITAR ACCESO REMOTO EN POSTGRES
-- https://stackoverflow.com/questions/32439167/psql-could-not-connect-to-server-connection-refused-error-when-connecting-to#comment108219128_32439167
----------------------------
1. cd /etc/postgresql/10/main/
2. open file named postgresql.conf   -> sudo vi postgresql.conf
    - add this line to that file     -> listen_addresses = '*'
3. open file named pg_hba.conf       -> sudo vi pg_hba.conf
    - and add this line to that file -> host  all  all 0.0.0.0/0 md5
4. sudo /etc/init.d/postgresql restart

----------------------------
-- COMANDO PARA ABRIR POSTGRES EN LINUX (CON EL USUARIO POR DEFECTO 'postgres')
-- https://www.digitalocean.com/community/tutorials/como-instalar-y-utilizar-postgresql-en-ubuntu-18-04-es
----------------------------
sudo -i -u postgres
postgres@server:~$ psql

----------------------------
-- COMANDO PARA CERRAR POSTGRES EN LINUX
----------------------------
postgres=# \q

----------------------------
-- COMANDO PARA CREAR UNA BASE DE DATOS
----------------------------
1. sudo -i -u postgres
2. createdb unigrasas
----
sudo -u postgres createdb unigrasas -- (Otra manera de crear la BD)

----------------------------
-- COMANDO PARA ACCEDER A UNA BASE DE DATOS (unigrasas)
----------------------------
1. sudo -i -u postgres
2. postgres@vmunigrasas:~$ psql -d unigrasas

----------------------------
-- COMANDO PARA CREAR USUARIO POSTGRES (Necesario para poder acceder desde afuera de la máquina virtual (VM)) (Hay tres formas)
-- https://enterprise.arcgis.com/es/server/10.4/cloud/amazon/change-default-database-passwords-on-linux.htm#:~:text=Inicie%20sesi%C3%B3n%20en%20psql%20con,la%20base%20de%20datos%20postgres.&text=Emita%20el%20comando%20%5Cpassword%20para,es%20%5Cpassword%20.
----------------------------
1. sudo -i -u postgres
2. postgres@server:~$ createuser --interactive -- (1ra forma - Esta fue la que se utilizo)
    Output
    Enter name of role to add: root
    Shall the new role be a superuser? (y/n) y
3. postgres@server:~$ psql
4. postgres=# \password root -- COMANDO PARA ASIGNAR CONTRASEÑA AL USUARIO

-------- (2da forma)

1. sudo -u postgres createuser --interactive -- (2da forma)
2. sudo -i -u postgres
3. postgres@server:~$ psql
4. postgres=# \password root -- COMANDO PARA ASIGNAR CONTRASEÑA AL USUARIO

-------- (3ra forma) - no probada

1. CREATE USER emilio WITH PASSWORD 'password-del-usuario-emilio'; -- (3ra forma)
2. GRANT ALL PRIVILEGES ON DATABASE unigrasas to emilio;
-- COMANDO PARA CONECTARSE A LA BASE DE DATOS CON EL USUARIO CREADDO
3. psql -d facturas -U emilio

----------------------------
-- COMANDO PARA LISTAR BASES DE DATOS POSTGRES
-- https://www.linuxito.com/programacion/337-como-listar-tablas-y-bases-de-datos-en-postgres
----------------------------
postgres=# \l

----------------------------
-- COMANDO PARA SABER EL USUARIO CONECTADO A LA BASE DE DATOS
----------------------------
postgres=# \conninfo

----------------------------
-- COMANDO PARA LISTAR USUARIOS DE LA BASE DE DATOS
-- https://www.linuxito.com/gnu-linux/nivel-basico/1246-listar-todos-los-usuarios-en-postgres
----------------------------
postgres=# \du
SELECT * from pg_shadow;

----------------------------
-- COMANDO PARA CERRAR CONEXIONES A LA BASE DE DATOS
-- https://www.aradaen.com/sysadmin/tips-y-trucos/cerrando-conexiones-en-postgresql/
----------------------------
SELECT  * FROM pg_stat_activity WHERE datname='unigrasas'; -- LISTAR CONEXIONES A LA BASE DE DATOS 'unigrasas'
SELECT pg_terminate_backend(3480) FROM pg_stat_activity WHERE datname='unigrasas'; -- ELIMINAR UNA CONEXION ESPECIFICA A LA BASE DE DATOS
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='unigrasas'; -- ELIMINAR TODAS LAS CONEXIONES A LA BD
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='unigrasas' and state = 'idle'; -- ELIMINAR TODAS LAS CONEXIONES A LA BD INACTIVAS
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='unigrasas' AND pid<>pg_backend_pid(); -- ELIMINAR LAS DEMAS CONEXIONES A LA BD EXCEPTO LA ACTIVA

----------------------------
-- COMANDO PARA CREAR BACKUP DE LA BASE DE DATOS
-- https://platzi.com/tutoriales/1480-postgresql/2252-como-generar-una-backup-de-postgresql-y-como-restaurarla/
----------------------------
pg_dump -U root -W -h localhost unigrasas > 1_unigrasaspsql16052021.sql

----------------------------
-- COMANDO PARA RESTAURAR BACKUP DE LA BASE DE DATOS
----------------------------
1. sudo -i -u postgres
2. postgres@vmunigrasas:~$ createdb juank
3. psql -U root -W -h localhost juank < 1_unigrasaspsql16052021.sql
