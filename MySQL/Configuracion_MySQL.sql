----------------------------
-- COMANDO PARA INSTALAR MYSQL EN LINUX
----------------------------
-- https://www.digitalocean.com/community/tutorials/como-instalar-mysql-en-ubuntu-18-04-es
-- 1. sudo apt update
-- 2. sudo apt install mysql-server
-- 3. sudo mysql
-- 4. SELECT user,authentication_string,plugin,host FROM mysql.user;
-- 5. ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
-- 6. FLUSH PRIVILEGES;
-- 7. SELECT user,authentication_string,plugin,host FROM mysql.user;

----------------------------
-- COMANDOS PARA HABILITAR ACCESO REMOTO EN MYSQL
----------------------------
-- 1. Para habilitarlo, edita el archivo de configuración /etc/mysql/mysql.conf.d/mysqld.cnf --
-- sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
-- 2. Bajo la entrada [mysqld], comenta las entradas «bind-address» y «skip-external-locking» añadiendo # al principio. --
-- Debe quedar así:
    -- [mysqld]
    -- ...
    -- #skip-external-locking
    -- #bind-address 127.0.0.1
    -- ...
-- Guarda y cierra.
-- 3. Solo queda reiniciar el servicio mysql --
-- sudo /etc/init.d/mysql restart

----------------------------
-- COMANDO PARA DES-INSTALAR MYSQL EN LINUX
----------------------------
-- https://cursoprogramador.wordpress.com/2016/05/01/desinstalar-completamente-mysql-en-ubuntu/

----------------------------
-- COMANDO PARA ABRIR MYSQL EN LINUX
----------------------------
-- sudo mysql -u root -p

----------------------------
-- CONEXIONES ACTIVAS A LA BASE DE DATOS
----------------------------
-- show status like 'Threads%';

----------------------------
-- COMANDO PARA ABRIR MYSQL EN windows
----------------------------
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p

----------------------------
-- VERSION DE MYSQL
----------------------------
-- SELECT @@version;

----------------------------
-- COMANDO PARA CREAR USUARIO MYSQL QUE PERMITA CONEXIONES AL SERVIDOR DE BASE DE DATOS DESDE OTROS EQUIPOS
-- SISTEMA OPERATIVO WINDOWS - LINUX
----------------------------
SELECT user,authentication_string,plugin,host FROM mysql.user; -- Privilegios de usuario
CREATE USER 'root'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
-- Borrar usuario
drop user 'root'@'localhost';
drop user '<user>'@'<hostname>';
---------------------------------------------------------------------------
-- permitir conexiones remotas mysql ubuntu (documentacion)
-- https://www.altaruru.com/habilitar-acceso-remoto-a-mysql/
---------------------------------------------------------------------------

-- si aparece el error ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
-- hacer lo siguiente
SHOW VARIABLES LIKE 'validate_password%';
SET GLOBAL validate_password_length = 6;
SET GLOBAL validate_password_number_count = 0;
SET GLOBAL validate_password_policy=LOW;