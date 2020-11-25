# Práctica docker-compose

## ¿Que es DOCKER?

_La idea detrás de Docker es crear contenedores ligeros y portables para las aplicaciones software que puedan ejecutarse en cualquier máquina con Docker instalado, independientemente del sistema operativo que la máquina tenga por debajo, facilitando así también los despliegues._

**¿Qué es un contenedor?**

_Imagina un contenedor de carga cualquiera, que lleva dentro algo que puedes llevarte a cualquier lado. Es algo auto contenido en sí, que se puede llevar de un lado a otro de forma independiente, es portable._

**Beneficios**
En el caso de los desarrolladores, el uso de Docker hace que puedan centrarse en desarrollar su código sin preocuparse de si dicho código funcionará en la máquina en la que se ejecutará.
 
## ¿Que es DOCKER-COMPOSE?
_Docker Compose es una herramienta que permite simplificar el uso de Docker. A partir de archivos YAML es mas sencillo crear contendores, conectarlos, habilitar puertos, volumenes, etc. Está hecho pensando en que no todas las aplicaciones son tan sencillas como para utilizar solamente un dockerfile, docker-compose trae la solución a ese problema_

## Objetivo de la práctica

En esta practica aprenderemos a monitorizar los endpoints de nuestra aplicación, para así tener un control mas claro de los procesos que realizan los usuarios en
nuestra web. Para ello utilizaremos grafana y prometheus, que veremos más adelante.

## Servidor

_Vamos a realizar la instalación de un servidor para nuestra aplicación, para ellos utilizaremos el servicio express partiendo de una imagen de node alpine_

Primero configuraremos nuestro Dockerfile de la siguiente manera:

![alt text](./img/1.png)

Metemos los archivos necesarios para la aplicación en una carpeta llamada src

![alt text](./img/2.png)

Hacemos el build para comprobar que está todo correcto

```
sudo docker build -t express_app .
```
![alt text](./img/3.png)

Comprobamos que funciona correctamente para evitar futuros problemas

```
sudo docker run -p 6600:3000 --name contenedor_node_prueba express_app
```

Accedemos al puerto 6600 para comprobar que funciona correctamente:

```
localhost:6600
```
![alt text](./img/4.png)

Nuestro docker-compose quedaria de la siguiente manera por el momento:

![alt text](./img/5.png)

## Prometheus

_Prometheus es un sistema de monitorización y de alerta, que cumple una serie de objetivos_

- Consultar y almacenar la series de datos.
- Un Pushgateway para permitir que los trabajos efímeros y por lotes expongan sus métricas a Prometheus.
- Exporters útil para casos donde no es factible instrumentar un sistema dado con métricas Prometheus directamente.
- Un sistema de manejo de alarmado.
- Un sistema de discovery.

Para empezar, creamos una carpeta llamada “prometheus” y metemos los archivos necesarios dentro:
![alt text](./img/a.png)

Configuramos nuestro docker-compose de la siguiente manera

![alt text](./img/6.png)

Ejecutamos nuestro docker-compose para comprobar que está todo correcto
```
sudo docker-compose up
```
Verificamos que funciona correctamente accediendo al puerto:

- localhost:9090

![alt text](./img/7.png)
