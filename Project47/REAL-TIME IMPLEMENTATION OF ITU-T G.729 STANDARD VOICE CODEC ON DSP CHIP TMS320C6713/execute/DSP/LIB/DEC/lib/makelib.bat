@echo NOTE: Please execute the c:\ti\DosRun.bat file located in
@echo       your CCS installation directory before running this batch file.
lnk6x g729dec.cmd
erase g729dec_kmitl.l67
erase g729dec.l67
ar6x -r g729dec_kmitl.l67 ..\Release\g729dec.o67
ar6x -r g729dec.l67 ..\Release\g729dec.obj
