"# db_unigrasas"  "# db_unigrasas" 

## COMANDO PARA CREAR BACKUP DE BASE DE DATOS MYSQL
------------------------------------------------
```
mysqldump -u root -p unigrasas > /home/azureuser/unigrasas.sql
```

## COMANDO PARA RESTAURAR BACKUP BASE DE DATOS MYSQL
-----------------------------------------------
> Primero crear la base de datos en MySQL y luego si se carga...
```
create database UNIGRASAS;
mysql -u root -p proyecto < mysql -u root -p unigrasas < /home/azureuser/db_unigrasas/unigrasas.sql
```
