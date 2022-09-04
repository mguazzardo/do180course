#Proyecto Multitier

Usando mysql y nodejs

## Creando la base de datos mysql

El primer paso sera crear la base de datos Mysql


```
oc new-app mariadb --name mariadb -e MYSQL_DATABASE=sampledb -e MYSQL_USER=user1 -e MYSQL_PASSWORD=master

```

Una vez que hicimos esto, nos vamos a clonar un repo con la aplicacion de NodeJS.

```
git clone https://github.com/mguazzardo/nodejs-mysql-1
```

una vez que tenemos el pod de mariadb corriendo, esta vez vamos a hacer un port-forward.
Recordemos que hay varias formas de hacer esto.
Pero usaremos esta vez port-forward

```
nohup oc port-forward <POD> 3306:3306 &
````

Populamos la base para las quotes

```
mysql -u user1 -pmaster -h 127.0.0.1 < init.sql

```

## Lanzando el deploy de NodeJS


```
oc new-app https://github.com/mguazzardo/nodejs-mysql-1 --name node
```

Y exponiendo el servicio

```
oc expose svc node
```


Y lo que nos queda es averiguar la ruta

```
oc get route
```
