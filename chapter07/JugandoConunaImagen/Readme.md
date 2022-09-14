### Jugando con una Imagen

Mientras buscaba contenido para la red, me encontre con esto, y fue un poco divertido, tanto que hice un video.



## Descargando la imagen


```
podman pull quay.io/ajiww/do180-quote-php

```

Una vez que hicimos esto, vamos a ver la anatomia de esta imagen

```
podman save quay.io/ajiww/do180-quote-php -o do180-quote-php.tar
```

Tenemos esta imagen, pero ahora lo que queremos hacer es ver que hay, como es un fichero .tar, creamos un nuevo directorio
y la extreamos

```
mkdir do180-quote-php && mv do180-quote-php.tar do180-quote-php && cd do180-quote-php && tar xpf do180-quote-php.tar
````

Tiramos un ls 

```
ls -l *.tar

```

## Enjoy!

