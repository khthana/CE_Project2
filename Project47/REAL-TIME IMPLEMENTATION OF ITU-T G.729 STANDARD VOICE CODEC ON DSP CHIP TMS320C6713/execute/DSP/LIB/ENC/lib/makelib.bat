@echo NOTE: Please execute the c:\ti\DosRun.bat file located in
@echo       your CCS installation directory before running this batch file.
lnk6x g729enc.cmd
erase g729enc_kmitl.l67
erase g729enc.l67
ar6x -r g729enc_kmitl.l67 ..\Release\g729enc.o67
ar6x -r g729enc.l67 ..\Release\g729enc.obj
