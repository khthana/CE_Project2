.AUTODEPEND

#		*Translator Definitions*
CC = bcc +TESTUART.CFG
TASM = TASM
TLIB = tlib
TLINK = tlink
LIBPATH = D:\LANGS\BC\LIB
INCLUDEPATH = D:\LANGS\BC\INCLUDE


#		*Implicit Rules*
.c.obj:
  $(CC) -c {$< }

.cpp.obj:
  $(CC) -c {$< }

#		*List Macros*


EXE_dependencies =  \
 lowlevel.obj \
 am186ser.obj \
 testuart.obj

#		*Explicit Rules*
testuart.exe: testuart.cfg $(EXE_dependencies)
  $(TLINK) /x/c/P-/L$(LIBPATH) @&&|
c0c.obj+
lowlevel.obj+
am186ser.obj+
testuart.obj
testuart
		# no map file
cc.lib
|


#		*Individual File Dependencies*
lowlevel.obj: testuart.cfg lowlevel.asm 
        $(TASM) /MX /ZI /O LOWLEVEL.ASM,LOWLEVEL.OBJ /DUARTDRV_TEST=1

am186ser.obj: testuart.cfg am186ser.c 

testuart.obj: testuart.cfg testuart.c 

#		*Compiler Configuration File*
testuart.cfg: testuart.mak
  copy &&|
-mc
-f-
-ff-
-G
-O
-Oe
-Ol
-Ob
-Z
-k-
-d
-vi-
-wpro
-weas
-wpre
-I$(INCLUDEPATH)
-L$(LIBPATH)
-DIOMACROS=1;UARTDRV_TEST=1;DEBUGTTY=1
| testuart.cfg


