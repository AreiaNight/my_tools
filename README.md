# my tools

<img src="https://4.bp.blogspot.com/-n27YlmFhCqY/Utathti8NvI/AAAAAAAAUqI/4-2ZDRQ0BTA/s200/blackarchlinux.png" alt="img" align="right" width="400px">

Auto installer para mis herramientas de mayor uso para distros basadas en debian/ubuntu.
Este script trabaja mejor en instalaciones frescas o nuevas de distros. 
Evita usarlas en distro como Kali o Parrot, éstas ya tienen las herramientras pre-instaladas. 

## Instalación:

```bash
$ git clone https://github.com/AreiaNight/mytools.git
$ cd mytools
$ chmod +x mytools.sh
$ ./mytools.sh
```

## Updates

He agregado un pequeño script nuevo llamado blackarchinstall.sh por si se presentan problemas al querer hacer el upgrade de cualquier distor linux a blackarch (problemas con los paquetes y conflictos de compatibilidad). El simple, solamente automatiza la instalación manual de dichas herramientas quitando las posibles causantes de errores de instalación e instalando paquete por paquete cada una.


## Opciones

Al inicio te van a pedir que elijas una de las tres posibles opciones:
- [X] Herramientas básicas
- [X] Mis herramientas más usadas.
- [X] Todas mis herramientas.


