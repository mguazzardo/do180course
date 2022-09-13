### Mysql - Persistente Podman

Basado en 

https://techviewleo.com/run-mysql-database-in-docker-container/

https://plataforma.josedomingo.org/pledin/cursos/openshift/curso/u05/index.html



Genero el directorio donde alojare el volumen persistente y Luego le doy el contexto de selinux

```
 mkdir /tmp/mysql
 sudo semanage fcontext -a -t container_file_t /tmp/mysql
```

Ahora la ejecucion de podman

```
podman run -d \
--name mysql-8 \
-p 3306:3306 \
-v /tmp/mysql:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD='Master' \
-e MYSQL_USER=user1 \
-e MYSQL_PASSWORD='master' \
-e MYSQL_DATABASE=testdb \
mysql:8

```

Pero nos falla


y esto es por el tema de selinux, asi que vamos a hacerlo mas sencillo

```
mkdir ~/db_dir
```

y luego 

```
podman run -d --name mysqlZ -v ~/db_dir:/var/lib/mysql:Z -e MYSQL_ROOT_PASSWORD=master mysql
```

y ahora si vemos que esto anduvo!!!



## Agregando un volumen 


Vamos a agregar un volumen y lo que haremos es luego inspeccionarlo


```
podman volume create db
```

```
podman volume list
```

y ahora

```
podman volume inspect db
```


Y ahora lo ejecutamos de nuevo al contenedor , olvidandonos el problema de selinux.


```
podman run -d --name mysqlZ -v db:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=master mysql
```


Luego vemos que este todo corriendo como corresponde

```
podman ps
```

