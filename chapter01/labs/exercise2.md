Primero corremos el nginx.  

Para correrlo, aseguremosno que no tenemos corriendo el contenedor, y sino lo hacemos con el siguiente comando
`podman run -d --name nginx -p 8080:80  docker.io/library/nginx`

Luego creamos este directorio para almacenar las configuraciones

`mkdir -p ~/.config/systemd/user`

Vamos al directorio

`cd && cd .config/systemd/user/`

Vemos que contenedores estan corriendo

`podman ps`

Creamos el archivo de systemd para este contenedor

`podman generate systemd --files --new --name nginx`

Vemos que hay dentro de ese archivo

`cat container-nginx.service` 

Detenemos el contenedor y luego lo borramos para asociarlo con systemd

`podman stop nginx && podman rm nginx`

Primeros pasos, reiniciamos los demonios

`systemctl --user daemon-reload`

Activamos el contenedor, y ahora lo cargamos

`systemctl --user enable --now container-nginx`

Vemos que este activo

`systemctl --user status container-nginx`

Hacemos la prueba

`curl localhost:8080`
