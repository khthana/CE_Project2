.AUTODEPEND

#		*Translator Definitions*
CC = bcc +CHAT.CFG
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
 chat.obj

#		*Explicit Rules*
chat.exe: chat.cfg $(EXE_dependencies)
  $(TLINK) /s/c/d/P-/L$(LIBPATH) @&&|
c0s.obj+
chat.obj
chat,chat
cs.lib
|


#		*Individual File Dependencies*
chat.obj: chat.cfg chat.c 

#		*Compiler Configuration File*
chat.cfg: chat.mak
  copy &&|
-f-
-ff-
-C
-w+
-j0
-g0
-O
-Og
-Oe
-Ob
-Z
-k-
-d
-vi-
-I$(INCLUDEPATH)
-L$(LIBPATH)
| chat.cfg


