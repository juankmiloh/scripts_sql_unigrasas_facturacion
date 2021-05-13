"# db_unigrasas"  "# db_unigrasas" 

## COMANDO PARA CREAR BACKUP DE BASE DE DATOS MYSQL
------------------------------------------------
```
mysqldump -u root -p UNIGRASAS > /home/azureuser/scripts_sql_unigrasas_facturacion/backups/2unigrasas13052021.sql
```

## COMANDO PARA RESTAURAR BACKUP BASE DE DATOS MYSQL
-----------------------------------------------
> Primero crear la base de datos en MySQL y luego si se carga...
```
create database UNIGRASAS;

mysql -u root -p UNIGRASAS < /home/azureuser/scripts_sql_unigrasas_facturacion/DDL.sql
```
> Comando para insertar datos
```
mysql -u root -p UNIGRASAS < /home/azureuser/scripts_sql_unigrasas_facturacion/DML.sql
```

<!-- ojo - Crear repositorio con backups -->