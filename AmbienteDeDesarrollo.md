# Preparación de Ambiente de Desarrollo #

# Introducción #

Para preparar el ambiente de desarrollo, en windows o linux básicamente son las mismas operaciones con las diferencias propias de cada sistema operativo, en el presente wiki se explicará ambos procedimientos.


---

# Preparación Ambiente en Linux #

**Instalar el JDK de Sun, preferiblemente desde linea de comandos:**

`$sudo aptitude install sun-java6-jdk`

**Descargar grails (version 2.0.1)
Enlace de Descarga
[Aquí](http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.0.1.zip)**


**Descomprimir la el ZIP en la carpeta deseada.
A manera de ejemplo lo descomprimimos dentro de una carpeta llamada grails en el home del usuario.**


`$cd ~/grails`

`$unzip grails-2.0.1.zip`



**Creación de las variables de entorno:
Con un editor de texto abrir el archivo oculto .bashrc que esta ubicado en la carpeta del usuario.**

Ubicar la ruta completa donde esta el jdk, por ejemplo:

`$which java`

`/usr/bin/java`

El resultado del comando which es la ruta donde se encuentra el ejecutable que se pasa como parametro, en este caso es java.

`$ls -l /usr/bin/java`

`lrwxrwxrwx 1 root 0 22 2009-05-25 23:49 /usr/bin/java -> /etc/alternatives/java*`

El comando anterior (ls -l ruta) permite ver que el ejecutable se trata de un enlace, por lo que, en este caso, no hemos encontrado la ruta del ejecutable real, asi que se sigue buscano.

`$ls -l /etc/alternatives/java`

`lrwxrwxrwx 1 root 0 40 2010-04-09 11:30 /etc/alternatives/java -> /usr/lib/jvm/java-6-openjdk/jre/bin/java*`

El anterior comando me permite encontrar la ruta real del ejecutable java, por lo tanto la ruta de la carpeta donde esta el jdk (/usr/lib/jvm/java-6-openjdk) esta será la ruta que tomaremos para el JAVA\_HOME.


Para abrir el editor desde la linea de comandos o presionando `Alt+F2` escriba lo siguiente:


`$gedit ~/.bashrc`


AGREGAR AL FINAL de ese archivo las siguientes lineas.
```
export GRAILS_HOME=$HOME/grails/grails-2.0.1
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export PATH=$PATH:$GRAILS_HOME/bin
```
Guardar el archivo y cerrar esa consola para probar con el siguiente comando en una nueva consola:

`$grails help`

Crear Base de Datos En Postgres

**Crear Rol**


CREATE ROLE ekklesis LOGIN ENCRYPTED PASSWORD 'ekklesis';


**Crear Base de Datos:**


CREATE DATABASE ekklesis WITH ENCODING='UTF8' OWNER=ekklesis CONNECTION LIMIT=-1;



---

# Preparación Ambiente en Windows #