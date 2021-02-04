# Actividad colaborativa - Manejo de directorios
Escribe un programa llamado *find* que recibe de línea de comando una cadena de texto a buscar, un directorio base y, de forma opcional, si queremos que la búsqueda sea recursiva o no.

```
$ .\find string initial_directory [-r]
```

Ejemplos de uso:
```
$ .\find
usage: find string initial_directory [-r]
--------------------------------------------------------------------------
$ .\find cha no_existe
find: No such file or directory
--------------------------------------------------------------------------
$ find cha find.c
find: Not a directory
--------------------------------------------------------------------------
$ .\find cha dir1 -x
usage: find string initial_directory [-r]
--------------------------------------------------------------------------
$ .\find cha dir1
Name: chapter2.txt
Path: dir1
Last access: Tue Jun 4 11:51:30 2019
Last modification: Wed May 8 11:03:18 2019

Name: chapter1.txt
Path: dir1
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 12:02:50 2019
--------------------------------------------------------------------------
$ .\find cha dir1 -r
Name: chapter2.txt
Path: dir1
Last access: Tue Jun 4 11:51:30 2019
Last modification: Wed May 8 11:03:18 2019

Name: chapter1.txt
Path: dir1
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 12:02:50 2019

Name: chapter3.txt
Path: dir1/dir2
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 11:03:44 2019

Name: chapter4.txt
Path: dir1/dir2
Last access: Tue Jun 4 11:51:30 2019
Last modification: Wed May 8 11:04:33 2019

Name: chapter6.txt
Path: dir1/dir2/dir3
Last access: Tue Jun 4 11:51:30 2019
Last modification: Wed May 8 11:06:35 2019

Name: chapter5.txt
Path: dir1/dir2/dir3
Last access: Tue Jun 4 11:51:30 2019
Last modification: Wed May 8 11:05:28 2019

Name: chapter8.txt
Path: dir1/dir2/dir3/dir4
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 11:08:32 2019

Name: chapter7.txt
Path: dir1/dir2/dir3/dir4
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 11:07:24 2019

Name: chapter9.txt
Path: dir1/dir2/dir3/dir4/dir5
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 11:09:09 2019

Name: chapter10.txt
Path: dir1/dir2/dir3/dir4/dir5
Last access: Tue Jun 4 11:51:29 2019
Last modification: Wed May 8 11:16:29 2019
```
|     | Ponderación                                                                                                                                                                                                   |
|-----|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| +10 | Verifica que el programa reciba la cantidad correcta de<br>parámetros. En caso de que no sea así, el programa<br>despliega un mensaje adecuado y termina, regresando<br>-2 como resultado de su ejecución.    |
| +10 | Verifica que el directorio exista. En caso de que no<br>sea un directorio o no exista, el programa despliega<br>un mensaje adecuado y termina, regresando -3 como<br>resultado de su ejecución.               |
| +10 | Verifica que el parámetro para indicar la recursión sea<br>correcto. En caso de que no sea correcto, el programa<br>despliega un mensaje adecuado y termina, regresando<br>-4 como resultado de su ejecución. |
| +30 | Busca **SOLO** dentro del directorio *initial_directory*<br>y muestra los archivos que contienen dentro de su<br>nombre la cadena *string*. Regresa 0 como resultado<br>de su ejecución.                      |
| +30 | Busca **RECURSIVAMENTE** dentro del directorio<br>*initial_directory* y muestra los archivos que contienen<br>dentro de su nombre la cadena *string*. Regresa<br>0 como resultado de su ejecución.            |
