path=c:\tasm\bin;c:\
del *.ob0
del *.ex0
ren *.obj *.ob0
ren *.exe *.ex0
tasm /zi testI
tlink /v testI
