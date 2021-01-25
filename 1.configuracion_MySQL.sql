----------------------------
-- COMANDO PARA ABRIR MYSQL EN LINUX
----------------------------
-- sudo mysql -u root -p

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
-- SISTEMA OPERATIVO WINDOWS
----------------------------
SELECT user,authentication_string,plugin,host FROM mysql.user; -- Privilegios de usuario
CREATE USER 'root'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
-- Borrar usuario
drop user '<user>'@'<hostname>';
drop user 'root'@'localhost';
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