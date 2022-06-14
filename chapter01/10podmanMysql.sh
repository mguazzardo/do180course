 sudo podman run --name mysql-custom  -e MYSQL_USER=user1 -e MYSQL_PASSWORD=master  -e MYSQL_ROOT_PASSWORD=master -d --name mysql registry.fedoraproject.org/f32/mysql
