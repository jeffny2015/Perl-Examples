
## Ambiente de Desarrollo
  - Sistema operativo: Distribución linux Ubuntu 16.1
  - Lenguaje de programación: Perl
  - Editor de texto: Atom



### Contenido
 * [cliente.pl - cliente en perl](cliente.pl)
 * [Descripcion del archivo](README.md)



#### Correr Programa

Para correr el programa vamos a la dirección donde se encuentra la carpeta que contiene los programas descargados del repositorio de git en la terminal, y ejecutamos lo siguiente.

Instalar el modulo de TableExtract, en Ubuntu(puede que funcione para otras distros):

Primero ejecutamos
```bash
sudo apt-cache search TableExtract
```
Segundo
> ```Bash
sudo apt-get install libhtml-tableextract-perl 
```

Ejecutar programa:

Para ayuda:
> ```Bash
perl cliente.pl -h
```
Para buscar general:
> ```Bash
perl cliente.pl -t_q texto-a-buscar
```
Para buscar mail is from:
> ```Bash
perl cliente.pl -t_mfrom texto-a-buscar
```
Para buscar mail is to:
> ```Bash
perl cliente.pl -t_mto texto-a-buscar
```

