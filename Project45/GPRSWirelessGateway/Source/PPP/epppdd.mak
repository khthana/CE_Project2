.AUTODEPEND

#		*Translator Definitions*
CC = bcc +EPPPDD.CFG
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
 slhc.obj \
 chap.obj \
 md5.obj \
 auth.obj \
 magic.obj \
 ipcp.obj \
 upap.obj \
 lcp.obj \
 fsm.obj \
 ppp.obj \
 am186ser.obj \
 critical.obj \
 lowlevel.obj \
 byteorde.obj \
 pktdrvre.obj \
 optsdos.obj \
 dosmain.obj

#		*Explicit Rules*
epppdd.exe: epppdd.cfg $(EXE_dependencies)
  $(TLINK) /s/c/d/P-/L$(LIBPATH) @&&|
c0s.obj+
slhc.obj+
chap.obj+
md5.obj+
auth.obj+
magic.obj+
ipcp.obj+
upap.obj+
lcp.obj+
fsm.obj+
ppp.obj+
am186ser.obj+
critical.obj+
lowlevel.obj+
byteorde.obj+
pktdrvre.obj+
optsdos.obj+
dosmain.obj
epppdd,epppdd
cs.lib
|


#		*Individual File Dependencies*
slhc.obj: epppdd.cfg slhc.c 

chap.obj: epppdd.cfg chap.c 

md5.obj: epppdd.cfg md5.c 

auth.obj: epppdd.cfg auth.c 

magic.obj: epppdd.cfg magic.c 

ipcp.obj: epppdd.cfg ipcp.c 

upap.obj: epppdd.cfg upap.c 

lcp.obj: epppdd.cfg lcp.c 

fsm.obj: epppdd.cfg fsm.c 

ppp.obj: epppdd.cfg ppp.c 

am186ser.obj: epppdd.cfg am186ser.c 

critical.obj: epppdd.cfg critical.asm 
	$(TASM) /MX /ZI CRITICAL.ASM,CRITICAL.OBJ

lowlevel.obj: epppdd.cfg lowlevel.asm 
	$(TASM) /MX /ZI LOWLEVEL.ASM,LOWLEVEL.OBJ

byteorde.obj: epppdd.cfg byteorde.asm 
	$(TASM) /MX /ZI BYTEORDE.ASM,BYTEORDE.OBJ

pktdrvre.obj: epppdd.cfg pktdrvre.c 

optsdos.obj: epppdd.cfg optsdos.c 

dosmain.obj: epppdd.cfg dosmain.c 

#		*Compiler Configuration File*
epppdd.cfg: epppdd.mak
  copy &&|
-f-
-ff-
-C
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
-wpin
-wamb
-wamp
-wasm
-wpro
-wcln
-wdef
-wsig
-wnod
-wstv
-wucp
-wuse
-weas
-wpre
-I$(INCLUDEPATH)
-L$(LIBPATH)
-DALLOWVJ=1;DEBUGALL=1;
| epppdd.cfg


