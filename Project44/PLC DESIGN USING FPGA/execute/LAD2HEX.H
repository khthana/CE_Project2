/*
*   Program : lad2hex.exe (Ladder to HEX Code)
*   Author  : Siri Chongasamethaworn 41014417 4D
*   Date    : 23-02-02
*   Descripion : This program use in my project Design PLC Using FPGA.
*                Program must convert Ladder Language into HEX Code for
*                Xilinx XS40
*/
/* Instruction */
#define LD        0x00
#define LDI       0x01
#define AND       0x02
#define ANI       0x03
#define OR        0x04
#define ORI       0x05
#define OUT       0x06
#define OUI       0x07
#define TIM       0x40
#define CNT       0x41
#define ANB       0x80
#define ORB       0x81
#define END       0xFF

/* relay type */
#define X         0x00
#define Y         0x40
#define M         0x80
#define T         0xC0

#define _LD        0x0000
#define _LDI       0x0100
#define _AND       0x0200
#define _ANI       0x0300
#define _OR        0x0400
#define _ORI       0x0500
#define _OUT       0x0600
#define _OUI       0x0700
#define _TIM       0x4000
#define _CNT       0x4100
#define _ANB       0x8000
#define _ORB       0x8100
#define _END       0xFF00

/* relay type */
#define _X         0x0000
#define _Y         0x0020
#define _M         0x0040
#define _T         0x00C0

/* error type */
#define INSTRUCTION     1
#define RELAYTYPE       2
#define RELAYNUM        3
#define VALUES          4
