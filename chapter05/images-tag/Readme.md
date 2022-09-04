# Images tag


Que es una tag en una imagen?

es lo que nos permite llevar mejor las versiones.

Por ejemplo, version v1, v0.2 , v0.3

```
[devops@podman do180course]$ podman images
REPOSITORY                                   TAG           IMAGE ID      CREATED        SIZE
localhost/mysql-populated                    latest        625cf5d178f7  4 days ago     414 MB
<none>                                       <none>        39a7e4dcbb2a  4 days ago     414 MB
<none>                                       <none>        28d05b1db1d8  4 days ago     467 MB
<none>                                       <none>        d67beee6e7c4  4 days ago     414 MB
localhost/mysql-mio                          latest        a54dcf0d0458  4 days ago     414 MB
<none>                                       <none>        2cb63824a092  4 days ago     414 MB
localhost/quotes-api                         latest        52c69fa85696  4 days ago     130 MB
<none>                                       <none>        a8b96fed9595  4 days ago     432 MB
localhost/mysql-img                          latest        c254527b9e54  4 days ago     523 MB
docker.io/mguazzardo/mysql-image-custom      latest        c254527b9e54  4 days ago     523 MB
docker.io/library/mysql                      latest        ff3b5098b416  5 days ago     458 MB
docker.io/library/mysql                      8.0           ff3b5098b416  5 days ago     458 MB
docker.io/library/nginx                      latest        2b7d6430f78d  12 days ago    146 MB
docker.io/library/httpd                      latest        a981c8992512  12 days ago    149 MB
docker.io/library/node                       16-alpine     5dcd1f6157bd  2 weeks ago    118 MB
quay.io/redhattraining/do180-todonodejs-12   latest        874cf51f480f  16 months ago  852 MB
docker.io/library/php                        8.0.0-apache  e97a1581dd75  21 months ago  426 MB
registry.centos.org/centos/mysql-57-centos7  latest        8be37f2e9de0  2 years ago    467 MB
registry.fedoraproject.org/f29/httpd         latest        25c76f9dcdb5  3 years ago    482 MB
docker.io/library/mysql                      5.7.17        9546ca122d3a  5 years ago    414 MB
```

Generalmente, y por defecto, el tag apunta a latest. Pero no es que sea asi siempre.

### Viendo las tags existentes de una misma imagen.

Para esto, necesitamos tener en mente otra que se llama skopeo.
Por si no la tenemos instalada.

```
[devops@podman images-tag]$ sudo yum -y install skopeo
Last metadata expiration check: 0:27:02 ago on Sun 04 Sep 2022 07:03:27 PM -03.
Dependencies resolved.
==================================================================================================================================
 Package               Architecture          Version                                               Repository                Size
==================================================================================================================================
Installing:
 skopeo                x86_64                2:1.9.2-1.module_el8.7.0+1196+721f4eb0                appstream                6.8 M

Transaction Summary
==================================================================================================================================
Install  1 Package

Total download size: 6.8 M
Installed size: 22 M
Downloading Packages:
```

Y ahora hacemos la busqueda de los tags, por ejemplo de mongodb

```
skopeo inspect docker://docker.io/library/mongo
{
    "Name": "docker.io/library/mongo",
    "Digest": "sha256:2b527cb8eafb4a97a896eb05a2e88c75f0033d4be4bf94fad205299659147c13",
    "RepoTags": [
        "2",
        "2.2",
        "2.2.7",
        "2.4",
        "2.4.10",
        "2.4.11",
        "2.4.12",
```


### Inspeccionando las Imagenes bajadas


```
podman inspect nginx:latest
[
     {
          "Id": "2b7d6430f78d432f89109b29d88d4c36c868cdbf15dc31d2132ceaa02b993763",
          "Digest": "sha256:b95a99feebf7797479e0c5eb5ec0bdfa5d9f504bc94da550c2f58e839ea6914f",
          "RepoTags": [
               "docker.io/library/nginx:latest"
          ],
          "RepoDigests": [
               "docker.io/library/nginx@sha256:89020cd33be2767f3f894484b8dd77bc2e5a1ccc864350b92c53262213257dfc",
               "docker.io/library/nginx@sha256:b95a99feebf7797479e0c5eb5ec0bdfa5d9f504bc94da550c2f58e839ea6914f"
          ],
          "Parent": "",
          "Comment": "",
          "Created": "2022-08-23T03:59:02.789512663Z",
          "Config": {
               "ExposedPorts": {
                    "80/tcp": {}
               },
               "Env": [
                    "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                    "NGINX_VERSION=1.23.1",
                    "NJS_VERSION=0.7.6",
                    "PKG_RELEASE=1~bullseye"
               ],
               "Entrypoint": [
                    "/docker-entrypoint.sh"
```

### Revisando otras Imagenes

Ahora veremos por ejemplo, como revisar otras Imagenes, como podrian ser las Imagenes de centos.


```
skopeo inspect docker://docker.io/library/centos
{
    "Name": "docker.io/library/centos",
    "Digest": "sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177",
    "RepoTags": [
        "5",
        "5.11",
        "6",
        "6.10",
        "6.6",
        "6.7",
        "6.8",
        "6.9",
        "7",
        "7.0.1406",
        "7.1.1503",
        "7.2.1511",
        "7.3.1611",
        "7.4.1708",
        "7.5.1804",
        "7.6.1810",
        "7.7.1908",
        "7.8.2003",
        "7.9.2009",
        "8",
        "8.1.1911",
        "8.2.2004",
        "8.3.2011",
```


