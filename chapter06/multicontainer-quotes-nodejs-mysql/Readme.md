#Proyecto Multitier

Usando mysql y nodejs

## Creando la base de datos mysql

El primer paso sera crear la base de datos Mysql


```
oc new-app mariadb --name mariadb -e MYSQL_DATABASE=sampledb -e MYSQL_USER=user1 -e MYSQL_PASSWORD=master

```
