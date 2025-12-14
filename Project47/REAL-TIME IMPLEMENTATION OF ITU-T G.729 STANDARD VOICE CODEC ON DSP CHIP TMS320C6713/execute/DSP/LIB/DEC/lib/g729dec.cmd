-r
-m ..\Release\g729dec.map
-o ..\Release\g729dec.o67
-h
-g _G729DEC_KMITL_IG729DEC
-g _G729DEC_KMITL_IALG
-g _G729DEC_KMITL_alloc
-g _G729DEC_KMITL_free
-g _G729DEC_KMITL_initObj
-g _G729DEC_KMITL_control
-g _G729DEC_KMITL_init
-g _G729DEC_KMITL_exit
-g _G729DEC_KMITL_apply

/* TODO: List all OBJ files which make up the algorithm here */
..\Release\G729DEC_KMITL_ialg.obj
..\Release\G729DEC_KMITL_ialgvt.obj
..\Release\iG729DEC.obj

SECTIONS
{
    .text:algAlloc {}
    .text:algInit {}
    .text:algFree {}
/*
// The G729DEC_KMITL_activate & G729DEC_KMITL_deactivate routines are
// only used if scratch memory is being used.
    .text:algActivate {}
    .text:algDeactivate {}
*/
    .text:algControl {}
    .text:init {}
    .text:exit {}
}
