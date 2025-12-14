-r
-m C:\ti\myprojects\Xdais\Debug\g729enc.map
-o C:\ti\myprojects\Xdais\Debug\g729enc.l67
-h
-g _G729ENC_KMITL_IG729ENC
-g _G729ENC_KMITL_IALG
-g _G729ENC_KMITL_alloc
-g _G729ENC_KMITL_free
-g _G729ENC_KMITL_initObj
-g _G729ENC_KMITL_control
-g _G729ENC_KMITL_init
-g _G729ENC_KMITL_exit
-g _G729ENC_KMITL_apply

/* TODO: List all OBJ files which make up the algorithm here */
C:\ti\myprojects\Xdais\Debug\G729ENC_KMITL_ialg.obj
C:\ti\myprojects\Xdais\Debug\G729ENC_KMITL_ialgvt.obj
C:\ti\myprojects\Xdais\Debug\iG729ENC.obj

SECTIONS
{
    .text:algAlloc {}
    .text:algInit {}
    .text:algFree {}
/*
// The G729ENC_KMITL_activate & G729ENC_KMITL_deactivate routines are
// only used if scratch memory is being used.
*/
    .text:algActivate {}
    .text:algDeactivate {}

    .text:algControl {}
    .text:init {}
    .text:exit {}
}
