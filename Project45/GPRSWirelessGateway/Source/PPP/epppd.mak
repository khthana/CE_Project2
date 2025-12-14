.AUTODEPEND

#		*Translator Definitions*
CC = bcc +EPPPD.CFG
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
 critical.obj \
 lowlevel.obj \
 byteorde.obj \
 pktdrvre.obj \
 optsdos.obj \
 am186ser.obj \
 dosmain.obj

#		*Explicit Rules*
epppd.exe: epppd.cfg $(EXE_dependencies)
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
critical.obj+
lowlevel.obj+
byteorde.obj+
pktdrvre.obj+
optsdos.obj+
am186ser.obj+
dosmain.obj
epppd,epppd
cs.lib
|


#		*Individual File Dependencies*
slhc.obj: epppd.cfg slhc.c 

chap.obj: epppd.cfg chap.c 

md5.obj: epppd.cfg md5.c 

auth.obj: epppd.cfg auth.c 

magic.obj: epppd.cfg magic.c 

ipcp.obj: epppd.cfg ipcp.c 

upap.obj: epppd.cfg upap.c 

lcp.obj: epppd.cfg lcp.c 

fsm.obj: epppd.cfg fsm.c 

ppp.obj: epppd.cfg ppp.c 

critical.obj: epppd.cfg critical.asm 
	$(TASM) /MX /ZI CRITICAL.ASM,CRITICAL.OBJ

lowlevel.obj: epppd.cfg lowlevel.asm 
	$(TASM) /MX /ZI LOWLEVEL.ASM,LOWLEVEL.OBJ

byteorde.obj: epppd.cfg byteorde.asm 
	$(TASM) /MX /ZI BYTEORDE.ASM,BYTEORDE.OBJ

pktdrvre.obj: epppd.cfg pktdrvre.c 

optsdos.obj: epppd.cfg optsdos.c 

am186ser.obj: epppd.cfg am186ser.c 

dosmain.obj: epppd.cfg dosmain.c 

#		*Compiler Configuration File*
epppd.cfg: epppd.mak
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
-DALLOWVJ=1;
| epppd.cfg


