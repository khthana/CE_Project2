/****************************************************************************
*
*  FILE        : Am186CC.h
*
*  DESCRIPTION : This file contains hardware-specific declarations for
*                the Am186CC Embedded Communications Controller. 
*
*  AUTHOR      : Bob Black 03/19/98
*
*  NOTES       : The file is divided into the following sections
*                 - PCB REGISTER OFFSET VALUES
*                 - PCB REGISTER (BASE + OFFSET)
*                 - REGISTER BIT DEFINITIONS
*                 - BUFFER DESCRIPTORS NMEMONICS 
*                 - REGISTER CONSTANTS
*                 - REGISTER MASK VALUES
*
*  $Revision: 1.1 $
*  $Date: 2003/01/23 10:57:42 $
*  $Modtime   $
*  $Author: suriyan $
*  $Workfile  $
*  $Logfile   $
*
* ===========================================================================
*                                                                             
*  Copyright 1998 Advanced Micro Devices, Inc.                                
*                                                                             
*  This software is the property of Advanced Micro Devices, Inc  (AMD)  which 
*  specifically  grants the user the right to modify, use and distribute this 
*  software provided this notice is not removed or altered.  All other rights 
*  are reserved by AMD.                                                       
*                                                                             
*  AMD MAKES NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, WITH REGARD TO THIS 
*  SOFTWARE.  IN NO EVENT SHALL AMD BE LIABLE FOR INCIDENTAL OR CONSEQUENTIAL 
*  DAMAGES IN CONNECTION WITH OR ARISING FROM THE FURNISHING, PERFORMANCE, OR 
*  USE OF THIS SOFTWARE.                                                      
*                                                                             
*  So that all may benefit from your experience, please report  any  problems 
*  or suggestions about this software back to AMD.  Please include your name, 
*  company,  telephone number,  AMD product requiring support and question or 
*  problem encountered.                                                       
*                                                                             
*  Advanced Micro Devices, Inc.       Worldwide support and contact           
*  Logic Products Division            information available at:               
*  Systems Engineering                                                        
*  5204 E. Ben White Blvd.     http://www.amd.com/html/support/techsup.html   
*  Austin, TX 78741                                                           
*
*****************************************************************************/

#ifndef AM186CC_H
#define AM186CC_H

// Ctl reg offset for peripherals
#define CTL_OFF                  0xfc00                     // Default location for PCB at reset                     

//
// -----------------------------------------------------------------------------
// Am186CC PCB REGISTER OFFSET VALUE
// -----------------------------------------------------------------------------
//

//
// Relocation
//
#define   OFFS_RELOC             0x03fe                     // Peripheral Control Block (PCB) Relocation Register

//
// Miscellaneous
//
#define   OFFS_PRL               0x03f4                     // Processor Release Level Register
#define   OFFS_SYSCON            0x03f0                     // System Configuration Register

//
// Watchdog Timer
//
#define   OFFS_WDTCNTH           0x03e4                     // WatchDog Timer Count High Register
#define   OFFS_WDTCNTL           0x03e2                     // WatchDog Timer Count Low Register
#define   OFFS_WDTCON            0x03e0                     // Watchdog Timer Control Register

//
// PADs
//
#define   OFFS_RESCON            0x03de                     // Reset Configuration Register
#define   OFFS_PIOCLR2           0x03dc                     // PIO Clear 2 Register
#define   OFFS_PIOSET2           0x03da                     // PIO Set 2 Register
#define   OFFS_PIODATA2          0x03d8                     // PIO Data 2 Register
#define   OFFS_PIODIR2           0x03d6                     // PIO Direction 2 Register
#define   OFFS_PIOMODE2          0x03d4                     // PIO Mode 2 Register
#define   OFFS_PIOCLR1           0x03d2                     // PIO Clear 1 Register
#define   OFFS_PIOSET1           0x03d0                     // PIO Set 1 Register 
#define   OFFS_PIODATA1          0x03ce                     // PIO Data 1 Register
#define   OFFS_PIODIR1           0x03cc                     // PIO Direction 1 Register
#define   OFFS_PIOMODE1          0x03ca                     // PIO Mode 1 Register
#define   OFFS_PIOCLR0           0x03c8                     // PIO Clear 0 Register
#define   OFFS_PIOSET0           0x03c6                     // PIO Set 0 Register
#define   OFFS_PIODATA0          0x03c4                     // PIO Data 0 Register
#define   OFFS_PIODIR0           0x03c2                     // PIO Direction 0 Register
#define   OFFS_PIOMODE0          0x03c0                     // PIO Mode 0 Register

//
// Chip Selects
//
#define   OFFS_EDRAM             0x03ac                     // Enable refresh Control Register
#define   OFFS_CDRAM             0x03aa                     // Refresh Clock Prescaler Register
#define   OFFS_MPCS              0x03a8                     // PCS and MCS Auxiliary Register
#define   OFFS_MMCS              0x03a6                     // Midrange Memory Chip Select Register
#define   OFFS_PACS              0x03a4                     // Peripheral Chip Select Register
#define   OFFS_LMCS              0x03a2                     // Low Memory Chip Select Register
#define   OFFS_UMCS              0x03a0                     // Upper Memory Chip Select Register

//
// Timers
//
#define   OFFS_T2CMPA            0x0354                     // Timer 2 Maxcount Compare A Register
#define   OFFS_T2CNT             0x0352                     // Timer 2 Count Register
#define   OFFS_T2CON             0x0350                     // Timer 2 Mode / Control Register
#define   OFFS_T1CMPB            0x034e                     // Timer 1 Maxcount Compare B Register
#define   OFFS_T1CMPA            0x034c                     // Timer 1 Maxcount Compare A Register
#define   OFFS_T1CNT             0x034a                     // Timer 1 Count Register
#define   OFFS_T1CON             0x0348                     // Timer 1 Mode / Control Register
#define   OFFS_T0CMPB            0x0346                     // Timer 0 Maxcount Compare B Register
#define   OFFS_T0CMPA            0x0344                     // Timer 0 Maxcount Compare A Register
#define   OFFS_T0CNT             0x0342                     // Timer 0 Count Register
#define   OFFS_T0CON             0x0340                     // Timer 0 Mode / Control Register

//
// Interrupt Controller
//
#define   OFFS_PIOPOL            0x0338                     // PIO Polarity Register
#define   OFFS_INTPOL            0x0336                     // Interrupt Polarity Register
#define   OFFS_SHMASK            0x0334                     // Interrupt Shared Mask Register
#define   OFFS_SHREQ             0x0332                     // Interrupt Shared Request Register
#define   OFFS_DMAHLT            0x0330                     // DMA Halt
#define   OFFS_INTSTS            0x032e                     // Interrupt Status Register
#define   OFFS_REQST             0x032c                     // Interrupt Request Register
#define   OFFS_INSERV            0x032a                     // In-service Register
#define   OFFS_PRIMSK            0x0328                     // Priority Mask Register
#define   OFFS_IMASK             0x0326                     // Interrupt Mask Register
#define   OFFS_POLLST            0x0324                     // Poll Status Register
#define   OFFS_POLL              0x0322                     // Poll Register
#define   OFFS_EOI               0x0320                     // End-of-Interrupt Register
#define   OFFS_CH14CON           0x031c                     // Interrupt Channel 14 Control Register
#define   OFFS_CH13CON           0x031a                     // Interrupt Channel 13 Control Register
#define   OFFS_CH12CON           0x0318                     // Interrupt Channel 12 Control Register
#define   OFFS_CH11CON           0x0316                     // Interrupt Channel 11 Control Register
#define   OFFS_CH10CON           0x0314                     // Interrupt Channel 10 Control Register
#define   OFFS_CH9CON            0x0312                     // Interrupt Channel 9 Control Register
#define   OFFS_CH8CON            0x0310                     // Interrupt Channel 8 Control Register
#define   OFFS_CH7CON            0x030e                     // Interrupt Channel 7 Control Register
#define   OFFS_CH6CON            0x030c                     // Interrupt Channel 6 Control Register
#define   OFFS_CH5CON            0x030a                     // Interrupt Channel 5 Control Register
#define   OFFS_CH4CON            0x0308                     // Interrupt Channel 4 Control Register
#define   OFFS_CH3CON            0x0306                     // Interrupt Channel 3 Control Register
#define   OFFS_CH2CON            0x0304                     // Interrupt Channel 2 Control Register
#define   OFFS_CH1CON            0x0302                     // Interrupt Channel 1 Control Register
#define   OFFS_CH0CON            0x0300                     // Interrupt Channel 0 Control Register

//
// Synchronous Serial Interface
//
#define   OFFS_SSRXD             0x02f8                     // Synchronous Serial Interface Receive Register
#define   OFFS_SSTXD0            0x02f6                     // Synchronous Serial Interface Transmit 0 Register
#define   OFFS_SSTXD1            0x02f4                     // Synchronous Serial Interface Transmit 1 Register
#define   OFFS_SSCON             0x02f2                     // Synchronous Serial Interface Control
#define   OFFS_SSSTAT            0x02f0                     // Synchronous Serial Interface Mode/Status

//
// GCI
//
#define   OFFS_GMRDP             0x02be                     // GCI Monitor Receive Data Peek Register
#define   OFFS_GMRD              0x02bc                     // GCI Monitor Receive Data Register
#define   OFFS_GMTD              0x02ba                     // GCI Monitor Transmit Data Register
#define   OFFS_GCIRD1P           0x02b8                     // GCI Command/Indicate Receive Data 1 Peek Register
#define   OFFS_GCIRD1            0x02b6                     // GCI Command/Indicte Receive Data 1 Register
#define   OFFS_GCITD1            0x02b4                     // GCI Command/Indicate Transmit Data 1 Register
#define   OFFS_GCIRD0P           0x02b2                     // GCI Command/Indicate Receive Data 0 Peek Register
#define   OFFS_GCIRD0            0x02b0                     // GCI Command/Indicate Receive Data 0 Register
#define   OFFS_GCITD0            0x02ae                     // GCI Command/Indicate Transmit Data 0 Register
#define   OFFS_GICRDP            0x02ac                     // GCI Intercommunication Receive Data Peek Register
#define   OFFS_GICRD             0x02aa                     // GCI Intercommunication Receive Data Register
#define   OFFS_GICTD             0x02a8                     // GCI Intercomminication Transmit Data Register
#define   OFFS_GTIC              0x02a6                     // GCI TIC Bus Address Register
#define   OFFS_GIMSK             0x02a4                     // GCI Interrupt Mask Register
#define   OFFS_GISTAT            0x02a2                     // GCI Interrupt Status Register
#define   OFFS_GPCON             0x02a0                     // GCI Control Register

//
// Serial Port
//
#define   OFFS_SPBDV             0x028e                     // Serial Port Baud Rate Divisor Register
#define   OFFS_SPRXDP            0x028c                     // Serial Port Receive Data Peek Register
#define   OFFS_SPRXD             0x028a                     // Serial Port Receive Data Register
#define   OFFS_SPTXD             0x0288                     // Serial Port Transmit Data Register
#define   OFFS_SPIMSK            0x0286                     // Serial Port Interrupt Mask Register
#define   OFFS_SPSTAT            0x0284                     // Serial Port Status Register
#define   OFFS_SPCON1            0x0282                     // Serial Port Control 1 Register
#define   OFFS_SPCON0            0x0280                     // Serial Port Control 0 Register

//
// High Speed Serial Port
//

#define	  OFFS_HSPAB3		 0x027c			    // High Speed Serial Port Autobaud 3	
#define	  OFFS_HSPAB2		 0x027a			    // High Speed Serial Port Autobaud 2	
#define	  OFFS_HSPAB1		 0x0278			    // High Speed Serial Port Autobaud 1	
#define	  OFFS_HSPAB0		 0x0276			    // High Speed Serial Port Autobaud 0	
#define   OFFS_HSPM2             0x0274                     // High Speed Serial Port Character Match 2 Register
#define   OFFS_HSPM1             0x0272                     // High Speed Serial Port Character Match 1 Register
#define   OFFS_HSPM0             0x0270                     // High Speed Serial Port Character Match 0 Register
#define   OFFS_HSPBDV            0x026e                     // High Speed Serial Port Baud Rate Divisor Register
#define   OFFS_HSPRXDP           0x026c                     // High Speed Serial Port Receive Data Peek Register
#define   OFFS_HSPRXD            0x026a                     // High Speed Serial Port Receive Data Register
#define   OFFS_HSPTXD            0x0268                     // High Speed Serial Port Transmit Data Register
#define   OFFS_HSPIMSK           0x0266                     // High Speed Serial Port Interrupt Mask Register
#define   OFFS_HSPSTAT           0x0264                     // High Speed Serial Port Status Register
#define   OFFS_HSPCON1           0x0262                     // High Speed Serial Port Control 1 Register
#define   OFFS_HSPCON0           0x0260                     // High Speed Serial Port Control 0 Register

//
// USB
//
#define   OFFS_UDEPDEF3          0x025e                     // USB D Endpoint Definition Register 3
#define   OFFS_UDEPDEF2          0x025c                     // USB D Endpoint Definition Register 2
#define   OFFS_UDEPDEF1          0x025a                     // USB D Endpoint Definition Register 1
#define   OFFS_UDRCVPK           0x0258                     // USB D Endpoint Received Data Port PEEK Register
#define   OFFS_UDEPDAT           0x0256                     // USB D Endpoint Data Port Register
#define   OFFS_UDEPBUFS          0x0254                     // USB D Endpoint Buffer Status Register
#define   OFFS_UDEPSIZ           0x0252                     // USB D Endpoint Received Pkt Size Register
#define   OFFS_UDEPCTL           0x0250                     // USB D Endpoint Control/Status Register
#define   OFFS_UCEPDEF3          0x024e                     // USB C Endpoint Definition Register 3
#define   OFFS_UCEPDEF2          0x024c                     // USB C Endpoint Definition Register 2
#define   OFFS_UCEPDEF1          0x024a                     // USB C Endpoint Definition Register 1
#define   OFFS_UCRCVPK           0x0248                     // USB C Endpoint Received Data Port PEEK Register
#define   OFFS_UCEPDAT           0x0246                     // USB C Endpoint Data Port Register
#define   OFFS_UCEPBUFS          0x0244                     // USB C Endpoint Buffer Status Register
#define   OFFS_UCEPSIZ           0x0242                     // USB C Endpoint Received Pkt Size Register
#define   OFFS_UCEPCTL           0x0240                     // USB C Endpoint Control/Status Register
#define   OFFS_UBEPDEF3          0x023e                     // USB B Endpoint Definition Register 3
#define   OFFS_UBEPDEF2          0x023c                     // USB B Endpoint Definition Register 2
#define   OFFS_UBEPDEF1          0x023a                     // USB B Endpoint Definition Register 1
#define   OFFS_UBRCVPK           0x0238                     // USB B Endpoint Received Data Port PEEK Register
#define   OFFS_UBEPDAT           0x0236                     // USB B Endpoint Data Port Register
#define   OFFS_UBEPBUFS          0x0234                     // USB B Endpoint Buffer Status Register
#define   OFFS_UBEPSIZ           0x0232                     // USB B Endpoint Received Pkt Size Register
#define   OFFS_UBEPCTL           0x0230                     // USB B Endpoint Control/Status Register
#define   OFFS_UAEPDEF3          0x022e                     // USB A Endpoint Definition Register 3
#define   OFFS_UAEPDEF2          0x022c                     // USB A Endpoint Definition Register 2
#define   OFFS_UAEPDEF1          0x022a                     // USB A Endpoint Definition Register 1
#define   OFFS_UARCVPK           0x0228                     // USB A Endpoint Received Data Port PEEK Register
#define   OFFS_UAEPDAT           0x0226                     // USB A Endpoint Data Port Register
#define   OFFS_UAEPBUFS          0x0224                     // USB A Endpoint Buffer Status Register
#define   OFFS_UAEPSIZ           0x0222                     // USB A Endpoint Received Pkt Size Register
#define   OFFS_UAEPCTL           0x0220                     // USB A Endpoint Control/Status Register
#define   OFFS_UIEPDEF2          0x021c                     // USB Interrupt Endpoint Definition Register 2
#define   OFFS_UIEPDEF1          0x021a                     // USB Interrupt Endpoint Definition Register 1
#define   OFFS_UIEPDAT           0x0216                     // USB Interrupt Endpoint Data Port Register
#define   OFFS_UIEPCTL           0x0210                     // USB Interrupt Endpoint Control/Status Register
#define   OFFS_UCNTDEF2          0x020c                     // USB Control Endpoint Definition Register 2
#define   OFFS_UCNTDEF1          0x020a                     // USB Control Endpoint Definition Register 1
#define   OFFS_UCNTRPK           0x0208                     // USB Control Endpoint Receive Data Port PEEK Register 
#define   OFFS_UCNTDAT           0x0206                     // USB Control Endpoint Data Port Register
#define   OFFS_UCNTSIZ           0x0202                     // USB Control Endpoint Received Pkt Size Register
#define   OFFS_UCNTCTL           0x0200                     // USB Control Endpoint Control/Status Register
#define   OFFS_USBTMD            0x01fe                     // USB Test Mode Register
#define   OFFS_UFPMCNT           0x01f2                     // USB Frame Position Monitor Count Register
#define   OFFS_UISCTL            0x01f0                     // USB Isochronous Synchronization control Register
#define   OFFS_UTSTMPM           0x01ee                     // USB Time Stamp Match Register
#define   OFFS_UTSTMP            0x01ec                     // USB Time Stamp Register
#define   OFFS_URTFMCNT          0x01ea                     // USB Real Time Monitor Count Register
#define   OFFS_USBMFR            0x01e8                     // USB Device Miscellaneous Functions Register
#define   OFFS_UIMASK2           0x01e6                     // USB Interrupt Mask Register #2
#define   OFFS_UISTAT2           0x01e4                     // USB Interrupt Status Register #2
#define   OFFS_UIMASK1           0x01e2                     // USB Interrupt Mask Register #1
#define   OFFS_UISTAT1           0x01e0                     // USB Interrupt Status Register #1

//
// SmartDMAs
//
#define   OFFS_SD3CRAD           0x0198                     // SmartDMA3 Current Receive Address
#define   OFFS_SD3CTAD           0x0196                     // SmartDMA3 Current Transmit Address
#define   OFFS_SD3CBD            0x0194                     // SmartDMA3 Current Buffer Descriptor Register
#define   OFFS_SD3STAT           0x0192                     // SmartDMA3 Status Register
#define   OFFS_SD3RRAH           0x0190                     // SmartDMA3 Receive Ring Adress High Register
#define   OFFS_SD3RRCAL          0x018e                     // SmartDMA3 Receive Ring Count / Address Low Register
#define   OFFS_SD3TRAH           0x018c                     // SmartDMA3 Transmit Ring Address High Register
#define   OFFS_SD3TRCAL          0x018a                     // SmartDMA3 Transmit Ring Count / Address Low Register
#define   OFFS_SD3CON            0x0188                     // SmartDMA3 Control Register
#define   OFFS_SD2CRAD           0x0180                     // SmartDMA2 Current Receive Address
#define   OFFS_SD2CTAD           0x017e                     // SmartDMA2 Current Transmit Address
#define   OFFS_SD2CBD            0x017c                     // SmartDMA2 Current Buffer Descriptor Register
#define   OFFS_SD2STAT           0x017a                     // SmartDMA2 Status Register
#define   OFFS_SD2RRAH           0x0178                     // SmartDMA2 Receive Ring Address High Register
#define   OFFS_SD2RRCAL          0x0176                     // SmartDMA2 Receive Ring Count / Address Low Register
#define   OFFS_SD2TRAH           0x0174                     // SmartDMA2 Transmit Ring Address High Register
#define   OFFS_SD2TRCAL          0x0172                     // SmartDMA2 Transmit Ring Count / Address Low Register
#define   OFFS_SD2CON            0x0170                     // SmartDMA2 Control Register
#define   OFFS_SD1CRAD           0x0168                     // SmartDMA1 Current Receive Address
#define   OFFS_SD1CTAD           0x0166                     // SmartDMA1 Current Transmit Address
#define   OFFS_SD1CBD            0x0164                     // SmartDMA1 Current Buffer Descriptor Register
#define   OFFS_SD1STAT           0x0162                     // SmartDMA1 Status Register
#define   OFFS_SD1RRAH           0x0160                     // SmartDMA1 Receive Ring Address High Register
#define   OFFS_SD1RRCAL          0x015e                     // SmartDMA1 Receive Ring Count / Address Low Register
#define   OFFS_SD1TRAH           0x015c                     // SmartDMA1 Transmit Ring Address High Register
#define   OFFS_SD1TRCAL          0x015a                     // SmartDMA1 Transmit Ring Count / Address Low Register
#define   OFFS_SD1CON            0x0158                     // SmartDMA1 Control Register
#define   OFFS_SD0CRAD           0x0150                     // SmartDMA0 Current Receive Address
#define   OFFS_SD0CTAD           0x014e                     // SmartDMA0 Current Transmit Address
#define   OFFS_SD0CBD            0x014c                     // SmartDMA0 Current Buffer Descriptor Register
#define   OFFS_SD0STAT           0x014a                     // SmartDMA0 Status Register
#define   OFFS_SD0RRAH           0x0148                     // SmartDMA0 Receive Ring Address High Register
#define   OFFS_SD0RRCAL          0x0146                     // SmartDMA0 Receive Ring Count / Address Low Register
#define   OFFS_SD0TRAH           0x0144                     // SmartDMA0 Transmit Ring Address Low Register
#define   OFFS_SD0TRCAL          0x0142                     // SmartDMA0 Transmit Ring Count / Address Low Register
#define   OFFS_SD0CON            0x0140                     // SmartDMA0 Control Register

//
// General Purpose DMAs
//
#define   OFFS_GD3TC             0x013c                     // General Purpose DMA3 Transfer Count Register
#define   OFFS_GD3DSTH           0x013a                     // General Purpose DMA3 Destination Address High Register
#define   OFFS_GD3DSTL           0x0138                     // General Purpose DMA3 Destination Address Low Register
#define   OFFS_GD3SRCH           0x0136                     // General Purpose DMA3 Source Address High Register
#define   OFFS_GD3SRCL           0x0134                     // General Purpose DMA3 Source Address Low Register
#define   OFFS_GD3CON1           0x0132                     // General Purpose DMA3 Control 1 Register
#define   OFFS_GD3CON0           0x0130                     // General Purpose DMA3 Control 0 Register
#define   OFFS_GD2TC             0x012c                     // General Purpose DMA2 Transfer Count Register
#define   OFFS_GD2DSTH           0x012a                     // General Purpose DMA2 Destination Address High Register
#define   OFFS_GD2DSTL           0x0128                     // General Purpose DMA2 Destination Address Low Register
#define   OFFS_GD2SRCH           0x0126                     // General Purpose DMA2 Source Address High Register
#define   OFFS_GD2SRCL           0x0124                     // General Purpose DMA2 Source Address Low Register
#define   OFFS_GD2CON1           0x0122                     // General Purpose DMA2 Control 1 Register
#define   OFFS_GD2CON0           0x0120                     // General Purpose DMA2 Control 0 Register
#define   OFFS_GD1TC             0x011c                     // General Purpose DMA1 Transfer Count Register
#define   OFFS_GD1DSTH           0x011a                     // General Purpose DMA1 Destination Address High Register
#define   OFFS_GD1DSTL           0x0118                     // General Purpose DMA1 Destination Address Low Register
#define   OFFS_GD1SRCH           0x0116                     // General Purpose DMA1 Source Address High Register
#define   OFFS_GD1SRCL           0x0114                     // General Purpose DMA1 Source Address Low Register
#define   OFFS_GD1CON1           0x0112                     // General Purpose DMA1 Control 1 Register
#define   OFFS_GD1CON0           0x0110                     // General Purpose DMA1 Control 0 Register
#define   OFFS_GD0TC             0x010c                     // General Purpose DMA0 Transfer Count Register
#define   OFFS_GD0DSTH           0x010a                     // General Purpose DMA0 Destination Address High Register
#define   OFFS_GD0DSTL           0x0108                     // General Purpose DMA0 Destination Address Low Register
#define   OFFS_GD0SRCH           0x0106                     // General Purpose DMA0 Source Address High Register
#define   OFFS_GD0SRCL           0x0104                     // General Purpose DMA0 Source Address Low Register
#define   OFFS_GD0CON1           0x0102                     // General Purpose DMA0 Control 1 Register
#define   OFFS_GD0CON0           0x0100                     // General Purpose DMA0 Control 0 Register

//
// Time Slot Assigner D
//
#define   OFFS_TSDSTOP           0x02dc                     // Time Slot Assigner Channel D Bit Stop Position Register
#define   OFFS_TSDSTART          0x02da                     // Time Slot Assigner Channel D Bit Start Position Register
#define   OFFS_TSDCON            0x02d8                     // Time Slot Assigner Channel D Control Regiser

//
// HDLC D
//
#define   OFFS_HDA3              0x00ee                     // HDLC Channel D Address 3 Register
#define   OFFS_HDA3MSK           0x00f0                     // HDLC Channel D Address 3 Mask Register
#define   OFFS_HDA2              0x00ec                     // HDLC Channel D Address 2 Register
#define   OFFS_HDA2MSK           0x00e8                     // HDLC Channel D Address 2 Mask Register
#define   OFFS_HDA1              0x00ea                     // HDLC Channel D Address 1 Register
#define   OFFS_HDA1MSK           0x00e4                     // HDLC Channel D Address 1 Mask Register
#define   OFFS_HDA0              0x00e6                     // HDLC Channel D Address 0 Register
#define   OFFS_HDA0MSK           0x00e0                     // HDLC Channel D Address 0 Mask Register
#define   OFFS_HDMACNTP          0x00e2                     // HDLC Channel D Mismatch Address Count Peek Register
#define   OFFS_HDMACNT           0x00de                     // HDLC Channel D Mismatch Address Count Register
#define   OFFS_HDSFCNTP          0x00dc                     // HDLC Channel D Short Frame Count Peek Register
#define   OFFS_HDSFCNT           0x00da                     // HDLC Channel D Short Frame Count Register
#define   OFFS_HDRDP             0x00d8                     // HDLC Channel D Receive Data Peek Register
#define   OFFS_HDRD              0x00d6                     // HDLC Channel D Receive Data Register
#define   OFFS_HDTD              0x00d4                     // HDLC Channel D Transmit Data Register
#define   OFFS_HDISTAT1          0x00d0                     // HDLC Channel D Status Register 1
#define   OFFS_HDIMSK1           0x00d2                     // HDLC Channel D Interrupt Mask Register 1
#define   OFFS_HDIMSK0           0x00ce                     // HDLC Channel D Interrupt Status 0
#define   OFFS_HDISTAT0          0x00cc                     // HDLC Channel D Interrupt Mask Register 0
#define   OFFS_HDSTATE           0x00ca                     // HDLC Channel D Status Register
#define   OFFS_HDRCON1           0x00c8                     // HDLC Channel D Receive Max Length Registe
#define   OFFS_HDRCON0           0x00c6                     // HDLC Channel D Receive Control Register
#define   OFFS_HDTCON1           0x00c4                     // HDLC Channel D Transmit Control 1 Register
#define   OFFS_HDTCON0           0x00c2                     // HDLC Channel D Transmit Control 0 Register
#define   OFFS_HDCON             0x00c0                     // HDLC Channel D Control Register

//
// Time Slot Assigner C
//
#define   OFFS_TSCSTOP           0x02d4                     // Time Slot Assigner Channel C Bit Stop Position Register
#define   OFFS_TSCSTART          0x02d2                     // Time Slot Assigner Channel C Bit Start Position Register
#define   OFFS_TSCCON            0x02d0                     // Time Slot Assigner Channel C Control Regiser

//
// HDLC C
//
#define   OFFS_HCA3              0x00ae                     // HDLC Channel C Address 3 Register
#define   OFFS_HCA3MSK           0x00b0                     // HDLC Channel C Address 3 Mask Register
#define   OFFS_HCA2              0x00aa                     // HDLC Channel C Address 2 Register
#define   OFFS_HCA2MSK           0x00ac                     // HDLC Channel C Address 2 Mask Register
#define   OFFS_HCA1              0x00a6                     // HDLC Channel C Address 1 Register
#define   OFFS_HCA1MSK           0x00a8                     // HDLC Channel C Address 1 Mask Register
#define   OFFS_HCA0              0x00a2                     // HDLC Channel C Address 0 Register
#define   OFFS_HCA0MSK           0x00a4                     // HDLC Channel C Address 0 Mask Register
#define   OFFS_HCMACNTP          0x00a0                     // HDLC Channel C Mismatch Address Count Peek Register
#define   OFFS_HCMACNT           0x009e                     // HDLC Channel C Mismatch Address Count Register
#define   OFFS_HCSFCNTP          0x009c                     // HDLC Channel C Short Frame Count Peek Register
#define   OFFS_HCSFCNT           0x009a                     // HDLC Channel C Short Frame Count Register
#define   OFFS_HCRDP             0x0098                     // HDLC Channel C Receive Data Peek Register
#define   OFFS_HCRD              0x0096                     // HDLC Channel C Receive Data Register
#define   OFFS_HCTD              0x0094                     // HDLC Channel C Transmit Data Register
#define   OFFS_HCISTAT1          0x0090                     // HDLC Channel C Status Register 1
#define   OFFS_HCIMSK1           0x0092                     // HDLC Channel C Interrupt Mask Register 1
#define   OFFS_HCIMSK0           0x008e                     // HDLC Channel C Interrupt Status 0
#define   OFFS_HCISTAT0          0x008c                     // HDLC Channel C Interrupt Mask Register 0
#define   OFFS_HCSTATE           0x008a                     // HDLC Channel C Status Register
#define   OFFS_HCRCON1           0x0088                     // HDLC Channel C Receive Max Length Registe
#define   OFFS_HCRCON0           0x0086                     // HDLC Channel C Receive Control Register
#define   OFFS_HCTCON1           0x0084                     // HDLC Channel C Transmit Control 1 Register
#define   OFFS_HCTCON0           0x0082                     // HDLC Channel C Transmit Control 0 Register
#define   OFFS_HCCON             0x0080                     // HDLC Channel C Control Register

//
// Time Slot Assigner B
//
#define   OFFS_TSBSTOP           0x02cc                     // Time Slot Assigner Channel B Bit Stop Position Register
#define   OFFS_TSBSTART          0x02ca                     // Time Slot Assigner Channel B Bit Start Position Register
#define   OFFS_TSBCON            0x02c8                     // Time Slot Assigner Channel B Control Regiser

//
// HDLC B
//
#define   OFFS_HBA3              0x006e                     // HDLC Channel B Address 3 Register
#define   OFFS_HBA3MSK           0x0070                     // HDLC Channel B Address 3 Mask Register
#define   OFFS_HBA2              0x006a                     // HDLC Channel B Address 2 Register
#define   OFFS_HBA2MSK           0x006c                     // HDLC Channel B Address 2 Mask Register
#define   OFFS_HBA1              0x0066                     // HDLC Channel B Address 1 Register
#define   OFFS_HBA1MSK           0x0068                     // HDLC Channel B Address 1 Mask Register
#define   OFFS_HBA0              0x0062                     // HDLC Channel B Address 0 Register
#define   OFFS_HBA0MSK           0x0064                     // HDLC Channel B Address 0 Mask Register
#define   OFFS_HBMACNTP          0x0060                     // HDLC Channel B Mismatch Address Count Peek Register
#define   OFFS_HBMACNT           0x005e                     // HDLC Channel B Mismatch Address Count Register
#define   OFFS_HBSFCNTP          0x005c                     // HDLC Channel B Short Frame Count Peek Register
#define   OFFS_HBSFCNT           0x005a                     // HDLC Channel B Short Frame Count Register
#define   OFFS_HBRDP             0x0058                     // HDLC Channel B Receive Data Peek Register
#define   OFFS_HBRD              0x0056                     // HDLC Channel B Receive Data Register
#define   OFFS_HBTD              0x0054                     // HDLC Channel B Transmit Data Register
#define   OFFS_HBISTAT1          0x0050                     // HDLC Channel B Status Register 1
#define   OFFS_HBIMSK1           0x0052                     // HDLC Channel B Interrupt Mask Register 1
#define   OFFS_HBIMSK0          0x004e                     // HDLC Channel B Interrupt Status 0
#define   OFFS_HBISTAT0          0x004c                     // HDLC Channel B Interrupt Mask Register 0
#define   OFFS_HBSTATE           0x004a                     // HDLC Channel B Status Register
#define   OFFS_HBRCON1           0x0048                     // HDLC Channel B Receive Max Length Registe
#define   OFFS_HBRCON0           0x0046                     // HDLC Channel B Receive Control Register
#define   OFFS_HBTCON1           0x0044                     // HDLC Channel B Transmit Control 1 Register
#define   OFFS_HBTCON0           0x0042                     // HDLC Channel B Transmit Control 0 Register
#define   OFFS_HBCON             0x0040                     // HDLC Channel B Control Register

//
// Time Slot Assigner A
//
#define   OFFS_TSASTOP           0x02c4                     // Time Slot Assinger Channel A Bit Stop Position Register
#define   OFFS_TSASTART          0x02c2                     // Time Slot Assigner Channel A Bit Start Position Register
#define   OFFS_TSACON            0x02c0                     // Time Slot Assigner Channel A Control Regiser

//
// HDLC A
//
#define   OFFS_HAA3              0x002e                     // HDLC Channel A Address 3 Register
#define   OFFS_HAA3MSK           0x0030                     // HDLC Channel A Address 3 Mask Register
#define   OFFS_HAA2              0x002a                     // HDLC Channel A Address 2 Register
#define   OFFS_HAA2MSK           0x002c                     // HDLC Channel A Address 2 Mask Register
#define   OFFS_HAA1              0x0026                     // HDLC Channel A Address 1 Register
#define   OFFS_HAA1MSK           0x0028                     // HDLC Channel A Address 1 Mask Register
#define   OFFS_HAA0              0x0022                     // HDLC Channel A Address 0 Register
#define   OFFS_HAA0MSK           0x0024                     // HDLC Channel A Address 0 Mask Register
#define   OFFS_HAMACNTP          0x0020                     // HDLC Channel A Mismatch Address Count Peek Register
#define   OFFS_HAMACNT           0x001e                     // HDLC Channel A Mismatch Address Count Register
#define   OFFS_HASFCNTP          0x001c                     // HDLC Channel A Short Frame Count Peek Register
#define   OFFS_HASFCNT           0x001a                     // HDLC Channel A Short Frame Count Register
#define   OFFS_HARDP             0x0018                     // HDLC Channel A Receive Data Peek Register
#define   OFFS_HARD              0x0016                     // HDLC Channel A Receive Data Register
#define   OFFS_HATD              0x0014                     // HDLC Channel A Transmit Data Register
#define   OFFS_HAISTAT1          0x0010                     // HDLC Channel A Status Register 1
#define   OFFS_HAIMSK1           0x0012                     // HDLC Channel A Interrupt Mask Register 1
#define   OFFS_HAIMSK0           0x000e                     // HDLC Channel A Interrupt Status 0
#define   OFFS_HAISTAT0          0x000c                     // HDLC Channel A Interrupt Mask Register 0
#define   OFFS_HASTATE           0x000a                     // HDLC Channel A Status Register
#define   OFFS_HARCON1           0x0008                     // HDLC Channel A Receive Max Length Registe
#define   OFFS_HARCON0           0x0006                     // HDLC Channel A Receive Control Register
#define   OFFS_HATCON1           0x0004                     // HDLC Channel A Transmit Control 1 Register
#define   OFFS_HATCON0           0x0002                     // HDLC Channel A Transmit Control 0 Register
#define   OFFS_HACON             0x0000                     // HDLC Channel A Control Register

//
// -----------------------------------------------------------------------------
// Am186CC PCB REGISTER (BASE + OFFSET)
// -----------------------------------------------------------------------------
//

//
// Relocation
//
#define   RELOC                  (CTL_OFF+OFFS_RELOC)       // Peripheral Control Block (PCB) Relocation Register

//
// Miscellaneous
//
#define   PRL                    (CTL_OFF+OFFS_PRL)         // Processor Release Level Register
#define   SYSCON                 (CTL_OFF+OFFS_SYSCON)      // System Configuration Register

//
// Watchdog Timer
//
#define   WDTCNTH                (CTL_OFF+OFFS_WDTCNTH)     // WatchDog Timer Count High Register
#define   WDTCNTL                (CTL_OFF+OFFS_WDTCNTL)     // WatchDog Timer Count Low Register
#define   WDTCON                 (CTL_OFF+OFFS_WDTCON)      // Watchdog Timer Control Register

//
// PADs
//
#define   RESCON                 (CTL_OFF+OFFS_RESCON)      // Reset Configuration Register
#define   PIOCLR2                (CTL_OFF+OFFS_PIOCLR2)     // PIO Clear 2 Register
#define   PIOSET2                (CTL_OFF+OFFS_PIOSET2)     // PIO Set 2 Register
#define   PIODATA2               (CTL_OFF+OFFS_PIODATA2)    // PIO Data 2 Register
#define   PIODIR2                (CTL_OFF+OFFS_PIODIR2)     // PIO Direction 2 Register
#define   PIOMODE2               (CTL_OFF+OFFS_PIOMODE2)    // PIO Mode 2 Register
#define   PIOCLR1                (CTL_OFF+OFFS_PIOCLR1)     // PIO Clear 1 Register
#define   PIOSET1                (CTL_OFF+OFFS_PIOSET1)     // PIO Set 1 Register 
#define   PIODATA1               (CTL_OFF+OFFS_PIODATA1)    // PIO Data 1 Register
#define   PIODIR1                (CTL_OFF+OFFS_PIODIR1)     // PIO Direction 1 Register
#define   PIOMODE1               (CTL_OFF+OFFS_PIOMODE1)    // PIO Mode 1 Register
#define   PIOCLR0                (CTL_OFF+OFFS_PIOCLR0)     // PIO Clear 0 Register
#define   PIOSET0                (CTL_OFF+OFFS_PIOSET0)     // PIO Set 0 Register
#define   PIODATA0               (CTL_OFF+OFFS_PIODATA0)    // PIO Data 0 Register
#define   PIODIR0                (CTL_OFF+OFFS_PIODIR0)     // PIO Direction 0 Register
#define   PIOMODE0               (CTL_OFF+OFFS_PIOMODE0)    // PIO Mode 0 Register

//
// Chip Selects
//
#define   EDRAM                  (CTL_OFF+OFFS_EDRAM)       // Enable refresh Control Register
#define   CDRAM                  (CTL_OFF+OFFS_CDRAM)       // Refresh Clock Prescaler Register
#define   MPCS                   (CTL_OFF+OFFS_MPCS)        // PCS and MCS Auxiliary Register
#define   MMCS                   (CTL_OFF+OFFS_MMCS)        // Midrange Memory Chip Select Register
#define   PACS                   (CTL_OFF+OFFS_PACS)        // Peripheral Chip Select Register
#define   LMCS                   (CTL_OFF+OFFS_LMCS)        // Low Memory Chip Select Register
#define   UMCS                   (CTL_OFF+OFFS_UMCS)        // Upper Memory Chip Select Register

//
// Timers
//
#define   T2CMPA                 (CTL_OFF+OFFS_T2CMPA)      // Timer 2 Maxcount Compare A Register
#define   T2CNT                  (CTL_OFF+OFFS_T2CNT)       // Timer 2 Count Register
#define   T2CON                  (CTL_OFF+OFFS_T2CON)       // Timer 2 Mode / Control Register
#define   T1CMPB                 (CTL_OFF+OFFS_T1CMPB)      // Timer 1 Maxcount Compare B Register
#define   T1CMPA                 (CTL_OFF+OFFS_T1CMPA)      // Timer 1 Maxcount Compare A Register
#define   T1CNT                  (CTL_OFF+OFFS_T1CNT)       // Timer 1 Count Register
#define   T1CON                  (CTL_OFF+OFFS_T1CON)       // Timer 1 Mode / Control Register
#define   T0CMPB                 (CTL_OFF+OFFS_T0CMPB)      // Timer 0 Maxcount Compare B Register
#define   T0CMPA                 (CTL_OFF+OFFS_T0CMPA)      // Timer 0 Maxcount Compare A Register
#define   T0CNT                  (CTL_OFF+OFFS_T0CNT)       // Timer 0 Count Register
#define   T0CON                  (CTL_OFF+OFFS_T0CON)       // Timer 0 Mode / Control Register

//
// Interrupt Controller
//
#define   PIOPOL                 (CTL_OFF+OFFS_PIOPOL)      // PIO Polarity Register
#define   INTPOL                 (CTL_OFF+OFFS_INTPOL)      // Interrupt Polarity Register
#define   SHMASK                 (CTL_OFF+OFFS_SHMASK)      // Interrupt Shared Mask Register
#define   SHREQ                  (CTL_OFF+OFFS_SHREQ)       // Interrupt Shared Request Register
#define   DMAHLT                 (CTL_OFF+OFFS_DMAHLT)      // DMA Halt
#define   INTSTS                 (CTL_OFF+OFFS_INTSTS)      // Interrupt Status Register
#define   REQST                  (CTL_OFF+OFFS_REQST)       // Interrupt Request Register
#define   INSERV                 (CTL_OFF+OFFS_INSERV)      // In-service Register
#define   PRIMSK                 (CTL_OFF+OFFS_PRIMSK)      // Priority Mask Register
#define   IMASK                  (CTL_OFF+OFFS_IMASK)       // Interrupt Mask Register
#define   POLLST                 (CTL_OFF+OFFS_POLLST)      // Poll Status Register
#define   POLL                   (CTL_OFF+OFFS_POLL)        // Poll Register
#define   EOI                    (CTL_OFF+OFFS_EOI)         // End-of-Interrupt Register
#define   CH14CON                (CTL_OFF+OFFS_CH14CON)     // Interrupt Channel 14 Control Register
#define   CH13CON                (CTL_OFF+OFFS_CH13CON)     // Interrupt Channel 13 Control Register
#define   CH12CON                (CTL_OFF+OFFS_CH12CON)     // Interrupt Channel 12 Control Register
#define   CH11CON                (CTL_OFF+OFFS_CH11CON)     // Interrupt Channel 11 Control Register
#define   CH10CON                (CTL_OFF+OFFS_CH10CON)     // Interrupt Channel 10 Control Register
#define   CH9CON                 (CTL_OFF+OFFS_CH9CON)      // Interrupt Channel 9 Control Register
#define   CH8CON                 (CTL_OFF+OFFS_CH8CON)      // Interrupt Channel 8 Control Register
#define   CH7CON                 (CTL_OFF+OFFS_CH7CON)      // Interrupt Channel 7 Control Register
#define   CH6CON                 (CTL_OFF+OFFS_CH6CON)      // Interrupt Channel 6 Control Register
#define   CH5CON                 (CTL_OFF+OFFS_CH5CON)      // Interrupt Channel 5 Control Register
#define   CH4CON                 (CTL_OFF+OFFS_CH4CON)      // Interrupt Channel 4 Control Register
#define   CH3CON                 (CTL_OFF+OFFS_CH3CON)      // Interrupt Channel 3 Control Register
#define   CH2CON                 (CTL_OFF+OFFS_CH2CON)      // Interrupt Channel 2 Control Register
#define   CH1CON                 (CTL_OFF+OFFS_CH1CON)      // Interrupt Channel 1 Control Register
#define   CH0CON                 (CTL_OFF+OFFS_CH0CON)      // Interrupt Channel 0 Control Register

//
// Synchronous Serial Interface
//
#define   SSRXD                  (CTL_OFF+OFFS_SSRXD)       // Synchronous Serial Interface Receive Register
#define   SSTXD0                 (CTL_OFF+OFFS_SSTXD0)      // Synchronous Serial Interface Transmit 0 Register
#define   SSTXD1                 (CTL_OFF+OFFS_SSTXD1)      // Synchronous Serial Interface Transmit 1 Register
#define   SSCON                  (CTL_OFF+OFFS_SSCON)       // Synchronous Serial Interface Control
#define   SSSTAT                 (CTL_OFF+OFFS_SSSTAT)      // Synchronous Serial Interface Mode/Status

//
// GCI
//
#define   GMRDP                  (CTL_OFF+OFFS_GMRDP)       // GCI Monitor Receive Data Peek Register
#define   GMRD                   (CTL_OFF+OFFS_GMRD)        // GCI Monitor Receive Data Register
#define   GMTD                   (CTL_OFF+OFFS_GMTD)        // GCI Monitor Transmit Data Register
#define   GCIRD1P                (CTL_OFF+OFFS_GCIRD1P)     // GCI Command/Indicate Receive Data 1 Peek Register
#define   GCIRD1                 (CTL_OFF+OFFS_GCIRD1)      // GCI Command/Indicte Receive Data 1 Register
#define   GCITD1                 (CTL_OFF+OFFS_GCITD1)      // GCI Command/Indicate Transmit Data 1 Register
#define   GCIRD0P                (CTL_OFF+OFFS_GCIRD0P)     // GCI Command/Indicate Receive Data 0 Peek Register
#define   GCIRD0                 (CTL_OFF+OFFS_GCIRD0)      // GCI Command/Indicate Receive Data 0 Register
#define   GCITD0                 (CTL_OFF+OFFS_GCITD0)      // GCI Command/Indicate Transmit Data 0 Register
#define   GICRDP                 (CTL_OFF+OFFS_GICRDP)      // GCI Intercommunication Receive Data Peek Register
#define   GICRD                  (CTL_OFF+OFFS_GICRD)       // GCI Intercommunication Receive Data Register
#define   GICTD                  (CTL_OFF+OFFS_GICTD)       // GCI Intercomminication Transmit Data Register
#define   GTIC                   (CTL_OFF+OFFS_GTIC)        // GCI TIC Bus Address Register
#define   GIMSK                  (CTL_OFF+OFFS_GIMSK)       // GCI Interrupt Mask Register
#define   GISTAT                 (CTL_OFF+OFFS_GISTAT)      // GCI Interrupt Status Register
#define   GPCON                  (CTL_OFF+OFFS_GPCON)       // GCI Control Register

//
// Serial Port
//
#define   SPBDV                  (CTL_OFF+OFFS_SPBDV)       // Serial Port Baud Rate Divisor Register
#define   SPRXDP                 (CTL_OFF+OFFS_SPRXDP)      // Serial Port Receive Data Peek Register
#define   SPRXD                  (CTL_OFF+OFFS_SPRXD)       // Serial Port Receive Data Register
#define   SPTXD                  (CTL_OFF+OFFS_SPTXD)       // Serial Port Transmit Data Register
#define   SPIMSK                 (CTL_OFF+OFFS_SPIMSK)      // Serial Port Interrupt Mask Register
#define   SPSTAT                 (CTL_OFF+OFFS_SPSTAT)      // Serial Port Status Register
#define   SPCON1                 (CTL_OFF+OFFS_SPCON1)      // Serial Port Control 1 Register
#define   SPCON0                 (CTL_OFF+OFFS_SPCON0)      // Serial Port Control 0 Register

//
// High Speed Serial Port
//

#define   HSPAB3                 (CTL_OFF+OFFS_HSPAB3)      // High Speed Serial Port Autobaud 3
#define   HSPAB2                 (CTL_OFF+OFFS_HSPAB2)      // High Speed Serial Port Autobaud 2
#define   HSPAB1                 (CTL_OFF+OFFS_HSPAB1)      // High Speed Serial Port Autobaud 1
#define   HSPAB0                 (CTL_OFF+OFFS_HSPAB0)      // High Speed Serial Port Autobaud 0
#define   HSPM2                  (CTL_OFF+OFFS_HSPM2)       // High Speed Serial Port Character Match 2 Register
#define   HSPM1                  (CTL_OFF+OFFS_HSPM1)       // High Speed Serial Port Character Match 1 Register
#define   HSPM0                  (CTL_OFF+OFFS_HSPM0)       // High Speed Serial Port Character Match 0 Register
#define   HSPBDV                 (CTL_OFF+OFFS_HSPBDV)      // High Speed Serial Port Baud Rate Divisor Register
#define   HSPRXDP                (CTL_OFF+OFFS_HSPRXDP)     // High Speed Serial Port Receive Data Peek Register
#define   HSPRXD                 (CTL_OFF+OFFS_HSPRXD)      // High Speed Serial Port Receive Data Register
#define   HSPTXD                 (CTL_OFF+OFFS_HSPTXD)      // High Speed Serial Port Transmit Data Register
#define   HSPIMSK                (CTL_OFF+OFFS_HSPIMSK)     // High Speed Serial Port Interrupt Mask Register
#define   HSPSTAT                (CTL_OFF+OFFS_HSPSTAT)     // High Speed Serial Port Status Register
#define   HSPCON1                (CTL_OFF+OFFS_HSPCON1)     // High Speed Serial Port Control 1 Register
#define   HSPCON0                (CTL_OFF+OFFS_HSPCON0)     // High Speed Serial Port Control 0 Register

//
// USB
//
#define   UDEPDEF3               (CTL_OFF+OFFS_UDEPDEF3)    // USB D Endpoint Definition Register 3
#define   UDEPDEF2               (CTL_OFF+OFFS_UDEPDEF2)    // USB D Endpoint Definition Register 2
#define   UDEPDEF1               (CTL_OFF+OFFS_UDEPDEF1)    // USB D Endpoint Definition Register 1
#define   UDRCVPK                (CTL_OFF+OFFS_UDRCVPK)     // USB D Endpoint Received Data Port PEEK Register
#define   UDEPDAT                (CTL_OFF+OFFS_UDEPDAT)     // USB D Endpoint Data Port Register
#define   UDEPBUFS               (CTL_OFF+OFFS_UDEPBUFS)    // USB D Endpoint Buffer Status Register
#define   UDEPSIZ                (CTL_OFF+OFFS_UDEPSIZ)     // USB D Endpoint Received Pkt Size Register
#define   UDEPCTL                (CTL_OFF+OFFS_UDEPCTL)     // USB D Endpoint Control/Status Register
#define   UCEPDEF3               (CTL_OFF+OFFS_UCEPDEF3)    // USB C Endpoint Definition Register 3
#define   UCEPDEF2               (CTL_OFF+OFFS_UCEPDEF2)    // USB C Endpoint Definition Register 2
#define   UCEPDEF1               (CTL_OFF+OFFS_UCEPDEF1)    // USB C Endpoint Definition Register 1
#define   UCRCVPK                (CTL_OFF+OFFS_UCRCVPK)     // USB C Endpoint Received Data Port PEEK Register
#define   UCEPDAT                (CTL_OFF+OFFS_UCEPDAT)     // USB C Endpoint Data Port Register
#define   UCEPBUFS               (CTL_OFF+OFFS_UCEPBUFS)    // USB C Endpoint Buffer Status Register
#define   UCEPSIZ                (CTL_OFF+OFFS_UCEPSIZ)     // USB C Endpoint Received Pkt Size Register
#define   UCEPCTL                (CTL_OFF+OFFS_UCEPCTL)     // USB C Endpoint Control/Status Register
#define   UBEPDEF3               (CTL_OFF+OFFS_UBEPDEF3)    // USB B Endpoint Definition Register 3
#define   UBEPDEF2               (CTL_OFF+OFFS_UBEPDEF2)    // USB B Endpoint Definition Register 2
#define   UBEPDEF1               (CTL_OFF+OFFS_UBEPDEF1)    // USB B Endpoint Definition Register 1
#define   UBRCVPK                (CTL_OFF+OFFS_UBRCVPK)     // USB B Endpoint Received Data Port PEEK Register
#define   UBEPDAT                (CTL_OFF+OFFS_UBEPDAT)     // USB B Endpoint Data Port Register
#define   UBEPBUFS               (CTL_OFF+OFFS_UBEPBUFS)    // USB B Endpoint Buffer Status Register
#define   UBEPSIZ                (CTL_OFF+OFFS_UBEPSIZ)     // USB B Endpoint Received Pkt Size Register
#define   UBEPCTL                (CTL_OFF+OFFS_UBEPCTL)     // USB B Endpoint Control/Status Register
#define   UAEPDEF3               (CTL_OFF+OFFS_UAEPDEF3)    // USB A Endpoint Definition Register 3
#define   UAEPDEF2               (CTL_OFF+OFFS_UAEPDEF2)    // USB A Endpoint Definition Register 2
#define   UAEPDEF1               (CTL_OFF+OFFS_UAEPDEF1)    // USB A Endpoint Definition Register 1
#define   UARCVPK                (CTL_OFF+OFFS_UARCVPK)     // USB A Endpoint Received Data Port PEEK Register
#define   UAEPDAT                (CTL_OFF+OFFS_UAEPDAT)     // USB A Endpoint Data Port Register
#define   UAEPBUFS               (CTL_OFF+OFFS_UAEPBUFS)    // USB A Endpoint Buffer Status Register
#define   UAEPSIZ                (CTL_OFF+OFFS_UAEPSIZ)     // USB A Endpoint Received Pkt Size Register
#define   UAEPCTL                (CTL_OFF+OFFS_UAEPCTL)     // USB A Endpoint Control/Status Register
#define   UIEPDEF2               (CTL_OFF+OFFS_UIEPDEF2)    // USB Interrupt Endpoint Definition Register 2
#define   UIEPDEF1               (CTL_OFF+OFFS_UIEPDEF1)    // USB Interrupt Endpoint Definition Register 1
#define   UIEPDAT                (CTL_OFF+OFFS_UIEPDAT)     // USB Interrupt Endpoint Data Port Register
#define   UIEPCTL                (CTL_OFF+OFFS_UIEPCTL)     // USB Interrupt Endpoint Control/Status Register
#define   UCNTDEF2               (CTL_OFF+OFFS_UCNTDEF2)    // USB Control Endpoint Definition Register 2
#define   UCNTDEF1               (CTL_OFF+OFFS_UCNTDEF1)    // USB Control Endpoint Definition Register 1
#define   UCNTRPK                (CTL_OFF+OFFS_UCNTRPK)     // USB Control Endpoint Receive Data Port PEEK Register 
#define   UCNTDAT                (CTL_OFF+OFFS_UCNTDAT)     // USB Control Endpoint Data Port Register
#define   UCNTSIZ                (CTL_OFF+OFFS_UCNTSIZ)     // USB Control Endpoint Received Pkt Size Register
#define   UCNTCTL                (CTL_OFF+OFFS_UCNTCTL)     // USB Control Endpoint Control/Status Register
#define   USBTMD                 (CTL_OFF+OFFS_USBTMD)      // USB Test Mode Register
#define   UFPMCNT                (CTL_OFF+OFFS_UFPMCNT)     // USB Frame Position Monitor Count Register
#define   UISCTL                 (CTL_OFF+OFFS_UISCTL)      // USB Isochronous Synchronization control Register
#define   UTSTMPM                (CTL_OFF+OFFS_UTSTMPM)     // USB Time Stamp Match Register
#define   UTSTMP                 (CTL_OFF+OFFS_UTSTMP)      // USB Time Stamp Register
#define   URTFMCNT               (CTL_OFF+OFFS_URTFMCNT)    // USB Real Time Monitor Count Register
#define   USBMFR                 (CTL_OFF+OFFS_USBMFR)      // USB Device Miscellaneous Functions Register
#define   UIMASK2                (CTL_OFF+OFFS_UIMASK2)     // USB Interrupt Mask Register #2
#define   UISTAT2                (CTL_OFF+OFFS_UISTAT2)     // USB Interrupt Status Register #2
#define   UIMASK1                (CTL_OFF+OFFS_UIMASK1)     // USB Interrupt Mask Register #1
#define   UISTAT1                (CTL_OFF+OFFS_UISTAT1)     // USB Interrupt Status Register #1

//
// SmartDMAs
//
#define   SD3CRAD                (CTL_OFF+OFFS_SD3CRAD)     // SmartDMA3 Current Receive Address
#define   SD3CTAD                (CTL_OFF+OFFS_SD3CTAD)     // SmartDMA3 Current Transmit Address
#define   SD3CBD                 (CTL_OFF+OFFS_SD3CBD)      // SmartDMA3 Current Buffer Descriptor Register
#define   SD3STAT                (CTL_OFF+OFFS_SD3STAT)     // SmartDMA3 Status Register
#define   SD3RRAH                (CTL_OFF+OFFS_SD3RRAH)     // SmartDMA3 Receive Ring Adress High Register
#define   SD3RRCAL               (CTL_OFF+OFFS_SD3RRCAL)    // SmartDMA3 Receive Ring Count / Address Low Register
#define   SD3TRAH                (CTL_OFF+OFFS_SD3TRAH)     // SmartDMA3 Transmit Ring Address High Register
#define   SD3TRCAL               (CTL_OFF+OFFS_SD3TRCAL)    // SmartDMA3 Transmit Ring Count / Address Low Register
#define   SD3CON                 (CTL_OFF+OFFS_SD3CON)      // SmartDMA3 Control Register
#define   SD2CRAD                (CTL_OFF+OFFS_SD2CRAD)     // SmartDMA2 Current Receive Address
#define   SD2CTAD                (CTL_OFF+OFFS_SD2CTAD)     // SmartDMA2 Current Transmit Address
#define   SD2CBD                 (CTL_OFF+OFFS_SD2CBD)      // SmartDMA2 Current Buffer Descriptor Register
#define   SD2STAT                (CTL_OFF+OFFS_SD2STAT)     // SmartDMA2 Status Register
#define   SD2RRAH                (CTL_OFF+OFFS_SD2RRAH)     // SmartDMA2 Receive Ring Address High Register
#define   SD2RRCAL               (CTL_OFF+OFFS_SD2RRCAL)    // SmartDMA2 Receive Ring Count / Address Low Register
#define   SD2TRAH                (CTL_OFF+OFFS_SD2TRAH)     // SmartDMA2 Transmit Ring Address High Register
#define   SD2TRCAL               (CTL_OFF+OFFS_SD2TRCAL)    // SmartDMA2 Transmit Ring Count / Address Low Register
#define   SD2CON                 (CTL_OFF+OFFS_SD2CON)      // SmartDMA2 Control Register
#define   SD1CRAD                (CTL_OFF+OFFS_SD1CRAD)     // SmartDMA1 Current Receive Address
#define   SD1CTAD                (CTL_OFF+OFFS_SD1CTAD)     // SmartDMA1 Current Transmit Address
#define   SD1CBD                 (CTL_OFF+OFFS_SD1CBD)      // SmartDMA1 Current Buffer Descriptor Register
#define   SD1STAT                (CTL_OFF+OFFS_SD1STAT)     // SmartDMA1 Status Register
#define   SD1RRAH                (CTL_OFF+OFFS_SD1RRAH)     // SmartDMA1 Receive Ring Address High Register
#define   SD1RRCAL               (CTL_OFF+OFFS_SD1RRCAL)    // SmartDMA1 Receive Ring Count / Address Low Register
#define   SD1TRAH                (CTL_OFF+OFFS_SD1TRAH)     // SmartDMA1 Transmit Ring Address High Register
#define   SD1TRCAL               (CTL_OFF+OFFS_SD1TRCAL)    // SmartDMA1 Transmit Ring Count / Address Low Register
#define   SD1CON                 (CTL_OFF+OFFS_SD1CON)      // SmartDMA1 Control Register
#define   SD0CRAD                (CTL_OFF+OFFS_SD0CRAD)     // SmartDMA0 Current Receive Address
#define   SD0CTAD                (CTL_OFF+OFFS_SD0CTAD)     // SmartDMA0 Current Transmit Address
#define   SD0CBD                 (CTL_OFF+OFFS_SD0CBD)      // SmartDMA0 Current Buffer Descriptor Register
#define   SD0STAT                (CTL_OFF+OFFS_SD0STAT)     // SmartDMA0 Status Register
#define   SD0RRAH                (CTL_OFF+OFFS_SD0RRAH)     // SmartDMA0 Receive Ring Address High Register
#define   SD0RRCAL               (CTL_OFF+OFFS_SD0RRCAL)    // SmartDMA0 Receive Ring Count / Address Low Register
#define   SD0TRAH                (CTL_OFF+OFFS_SD0TRAH)     // SmartDMA0 Transmit Ring Address Low Register
#define   SD0TRCAL               (CTL_OFF+OFFS_SD0TRCAL)    // SmartDMA0 Transmit Ring Count / Address Low Register
#define   SD0CON                 (CTL_OFF+OFFS_SD0CON)      // SmartDMA0 Control Register

//
// General Purpose DMAs
//
#define   GD3TC                  (CTL_OFF+OFFS_GD3TC)       // General Purpose DMA3 Transfer Count Register
#define   GD3DSTH                (CTL_OFF+OFFS_GD3DSTH)     // General Purpose DMA3 Destination Address High Register
#define   GD3DSTL                (CTL_OFF+OFFS_GD3DSTL)     // General Purpose DMA3 Destination Address Low Register
#define   GD3SRCH                (CTL_OFF+OFFS_GD3SRCH)     // General Purpose DMA3 Source Address High Register
#define   GD3SRCL                (CTL_OFF+OFFS_GD3SRCL)     // General Purpose DMA3 Source Address Low Register
#define   GD3CON1                (CTL_OFF+OFFS_GD3CON1)     // General Purpose DMA3 Control 1 Register
#define   GD3CON0                (CTL_OFF+OFFS_GD3CON0)     // General Purpose DMA3 Control 0 Register
#define   GD2TC                  (CTL_OFF+OFFS_GD2TC)       // General Purpose DMA2 Transfer Count Register
#define   GD2DSTH                (CTL_OFF+OFFS_GD2DSTH)     // General Purpose DMA2 Destination Address High Register
#define   GD2DSTL                (CTL_OFF+OFFS_GD2DSTL)     // General Purpose DMA2 Destination Address Low Register
#define   GD2SRCH                (CTL_OFF+OFFS_GD2SRCH)     // General Purpose DMA2 Source Address High Register
#define   GD2SRCL                (CTL_OFF+OFFS_GD2SRCL)     // General Purpose DMA2 Source Address Low Register
#define   GD2CON1                (CTL_OFF+OFFS_GD2CON1)     // General Purpose DMA2 Control 1 Register
#define   GD2CON0                (CTL_OFF+OFFS_GD2CON0)     // General Purpose DMA2 Control 0 Register
#define   GD1TC                  (CTL_OFF+OFFS_GD1TC)       // General Purpose DMA1 Transfer Count Register
#define   GD1DSTH                (CTL_OFF+OFFS_GD1DSTH)     // General Purpose DMA1 Destination Address High Register
#define   GD1DSTL                (CTL_OFF+OFFS_GD1DSTL)     // General Purpose DMA1 Destination Address Low Register
#define   GD1SRCH                (CTL_OFF+OFFS_GD1SRCH)     // General Purpose DMA1 Source Address High Register
#define   GD1SRCL                (CTL_OFF+OFFS_GD1SRCL)     // General Purpose DMA1 Source Address Low Register
#define   GD1CON1                (CTL_OFF+OFFS_GD1CON1)     // General Purpose DMA1 Control 1 Register
#define   GD1CON0                (CTL_OFF+OFFS_GD1CON0)     // General Purpose DMA1 Control 0 Register
#define   GD0TC                  (CTL_OFF+OFFS_GD0TC)       // General Purpose DMA0 Transfer Count Register
#define   GD0DSTH                (CTL_OFF+OFFS_GD0DSTH)     // General Purpose DMA0 Destination Address High Register
#define   GD0DSTL                (CTL_OFF+OFFS_GD0DSTL)     // General Purpose DMA0 Destination Address Low Register
#define   GD0SRCH                (CTL_OFF+OFFS_GD0SRCH)     // General Purpose DMA0 Source Address High Register
#define   GD0SRCL                (CTL_OFF+OFFS_GD0SRCL)     // General Purpose DMA0 Source Address Low Register
#define   GD0CON1                (CTL_OFF+OFFS_GD0CON1)     // General Purpose DMA0 Control 1 Register
#define   GD0CON0                (CTL_OFF+OFFS_GD0CON0)     // General Purpose DMA0 Control 0 Register

//
// Time Slot Assigner D
//
#define   TSDSTOP                (CTL_OFF+OFFS_TSDSTOP)     // Time Slot Assigner Channel D Bit Stop Position Register
#define   TSDSTART               (CTL_OFF+OFFS_TSDSTART)    // Time Slot Assigner Channel D Bit Start Position Register
#define   TSDCON                 (CTL_OFF+OFFS_TSDCON)      // Time Slot Assigner Channel D Control Regiser

//
// HDLC D
//
#define   HDA3                   (CTL_OFF+OFFS_HDA3)        // HDLC Channel D Address 3 Register
#define   HDA3MSK                (CTL_OFF+OFFS_HDA3MSK)     // HDLC Channel D Address 3 Mask Register
#define   HDA2                   (CTL_OFF+OFFS_HDA2)        // HDLC Channel D Address 2 Register
#define   HDA2MSK                (CTL_OFF+OFFS_HDA2MSK)     // HDLC Channel D Address 2 Mask Register
#define   HDA1                   (CTL_OFF+OFFS_HDA1)        // HDLC Channel D Address 1 Register
#define   HDA1MSK                (CTL_OFF+OFFS_HDA1MSK)     // HDLC Channel D Address 1 Mask Register
#define   HDA0                   (CTL_OFF+OFFS_HDA0)        // HDLC Channel D Address 0 Register
#define   HDA0MSK                (CTL_OFF+OFFS_HDA0MSK)     // HDLC Channel D Address 0 Mask Register
#define   HDMACNTP               (CTL_OFF+OFFS_HDMACNTP)    // HDLC Channel D Mismatch Address Count Peek Register
#define   HDMACNT                (CTL_OFF+OFFS_HDMACNT)     // HDLC Channel D Mismatch Address Count Register
#define   HDSFCNTP               (CTL_OFF+OFFS_HDSFCNTP)    // HDLC Channel D Short Frame Count Peek Register
#define   HDSFCNT                (CTL_OFF+OFFS_HDSFCNT)     // HDLC Channel D Short Frame Count Register
#define   HDRDP                  (CTL_OFF+OFFS_HDRDP)       // HDLC Channel D Receive Data Peek Register
#define   HDRD                   (CTL_OFF+OFFS_HDRD)        // HDLC Channel D Receive Data Register
#define   HDTD                   (CTL_OFF+OFFS_HDTD)        // HDLC Channel D Transmit Data Register
#define   HDISTAT1               (CTL_OFF+OFFS_HDISTAT1)    // HDLC Channel D Status Register 1
#define   HDIMSK1                (CTL_OFF+OFFS_HDIMSK1)     // HDLC Channel D Interrupt Mask Register 1
#define   HDISTAT0               (CTL_OFF+OFFS_HDISTAT0)    // HDLC Channel D Interrupt Status 0
#define   HDIMSK0                (CTL_OFF+OFFS_HDIMSK0)     // HDLC Channel D Interrupt Mask Register 0
#define   HDSTATE                (CTL_OFF+OFFS_HDSTATE)     // HDLC Channel D Status Register
#define   HDRCON1                (CTL_OFF+OFFS_HDRCON1)     // HDLC Channel D Receive Max Length Registe
#define   HDRCON0                (CTL_OFF+OFFS_HDRCON0)     // HDLC Channel D Receive Control Register
#define   HDTCON1                (CTL_OFF+OFFS_HDTCON1)     // HDLC Channel D Transmit Control 1 Register
#define   HDTCON0                (CTL_OFF+OFFS_HDTCON0)     // HDLC Channel D Transmit Control 0 Register
#define   HDCON                  (CTL_OFF+OFFS_HDCON)       // HDLC Channel D Control Register

//
// Time Slot Assigner C
//
#define   TSCSTOP                (CTL_OFF+OFFS_TSCSTOP)     // Time Slot Assigner Channel C Bit Stop Position Register
#define   TSCSTART               (CTL_OFF+OFFS_TSCSTART)    // Time Slot Assigner Channel C Bit Start Position Register
#define   TSCCON                 (CTL_OFF+OFFS_TSCCON)      // Time Slot Assigner Channel C Control Regiser

//
// HDLC C
//
#define   HCA3                   (CTL_OFF+OFFS_HCA3)        // HDLC Channel C Address 3 Register
#define   HCA3MSK                (CTL_OFF+OFFS_HCA3MSK)     // HDLC Channel C Address 3 Mask Register
#define   HCA2                   (CTL_OFF+OFFS_HCA2)        // HDLC Channel C Address 2 Register
#define   HCA2MSK                (CTL_OFF+OFFS_HCA2MSK)     // HDLC Channel C Address 2 Mask Register
#define   HCA1                   (CTL_OFF+OFFS_HCA1)        // HDLC Channel C Address 1 Register
#define   HCA1MSK                (CTL_OFF+OFFS_HCA1MSK)     // HDLC Channel C Address 1 Mask Register
#define   HCA0                   (CTL_OFF+OFFS_HCA0)        // HDLC Channel C Address 0 Register
#define   HCA0MSK                (CTL_OFF+OFFS_HCA0MSK)     // HDLC Channel C Address 0 Mask Register
#define   HCMACNTP               (CTL_OFF+OFFS_HCMACNTP)    // HDLC Channel C Mismatch Address Count Peek Register
#define   HCMACNT                (CTL_OFF+OFFS_HCMACNT)     // HDLC Channel C Mismatch Address Count Register
#define   HCSFCNTP               (CTL_OFF+OFFS_HCSFCNTP)    // HDLC Channel C Short Frame Count Peek Register
#define   HCSFCNT                (CTL_OFF+OFFS_HCSFCNT)     // HDLC Channel C Short Frame Count Register
#define   HCRDP                  (CTL_OFF+OFFS_HCRDP)       // HDLC Channel C Receive Data Peek Register
#define   HCRD                   (CTL_OFF+OFFS_HCRD)        // HDLC Channel C Receive Data Register
#define   HCTD                   (CTL_OFF+OFFS_HCTD)        // HDLC Channel C Transmit Data Register
#define   HCISTAT1               (CTL_OFF+OFFS_HCISTAT1)    // HDLC Channel C Status Register 1
#define   HCIMSK1                (CTL_OFF+OFFS_HCIMSK1)     // HDLC Channel C Interrupt Mask Register 1
#define   HCISTAT0               (CTL_OFF+OFFS_HCISTAT0)    // HDLC Channel C Interrupt Status 0
#define   HCIMSK0                (CTL_OFF+OFFS_HCIMSK0)     // HDLC Channel C Interrupt Mask Register 0
#define   HCSTATE                (CTL_OFF+OFFS_HCSTATE)     // HDLC Channel C Status Register
#define   HCRCON1                (CTL_OFF+OFFS_HCRCON1)     // HDLC Channel C Receive Max Length Registe
#define   HCRCON0                (CTL_OFF+OFFS_HCRCON0)     // HDLC Channel C Receive Control Register
#define   HCTCON1                (CTL_OFF+OFFS_HCTCON1)     // HDLC Channel C Transmit Control 1 Register
#define   HCTCON0                (CTL_OFF+OFFS_HCTCON0)     // HDLC Channel C Transmit Control 0 Register
#define   HCCON                  (CTL_OFF+OFFS_HCCON)       // HDLC Channel C Control Register

//
// Time Slot Assigner B
//
#define   TSBSTOP                (CTL_OFF+OFFS_TSBSTOP)     // Time Slot Assigner Channel B Bit Stop Position Register
#define   TSBSTART               (CTL_OFF+OFFS_TSBSTART)    // Time Slot Assigner Channel B Bit Start Position Register
#define   TSBCON                 (CTL_OFF+OFFS_TSBCON)      // Time Slot Assigner Channel B Control Regiser

//
// HDLC B
//
#define   HBA3                   (CTL_OFF+OFFS_HBA3)        // HDLC Channel B Address 3 Register
#define   HBA3MSK                (CTL_OFF+OFFS_HBA3MSK)     // HDLC Channel B Address 3 Mask Register
#define   HBA2                   (CTL_OFF+OFFS_HBA2)        // HDLC Channel B Address 2 Register
#define   HBA2MSK                (CTL_OFF+OFFS_HBA2MSK)     // HDLC Channel B Address 2 Mask Register
#define   HBA1                   (CTL_OFF+OFFS_HBA1)        // HDLC Channel B Address 1 Register
#define   HBA1MSK                (CTL_OFF+OFFS_HBA1MSK)     // HDLC Channel B Address 1 Mask Register
#define   HBA0                   (CTL_OFF+OFFS_HBA0)        // HDLC Channel B Address 0 Register
#define   HBA0MSK                (CTL_OFF+OFFS_HBA0MSK)     // HDLC Channel B Address 0 Mask Register
#define   HBMACNTP               (CTL_OFF+OFFS_HBMACNTP)    // HDLC Channel B Mismatch Address Count Peek Register
#define   HBMACNT                (CTL_OFF+OFFS_HBMACNT)     // HDLC Channel B Mismatch Address Count Register
#define   HBSFCNTP               (CTL_OFF+OFFS_HBSFCNTP)    // HDLC Channel B Short Frame Count Peek Register
#define   HBSFCNT                (CTL_OFF+OFFS_HBSFCNT)     // HDLC Channel B Short Frame Count Register
#define   HBRDP                  (CTL_OFF+OFFS_HBRDP)       // HDLC Channel B Receive Data Peek Register
#define   HBRD                   (CTL_OFF+OFFS_HBRD)        // HDLC Channel B Receive Data Register
#define   HBTD                   (CTL_OFF+OFFS_HBTD)        // HDLC Channel B Transmit Data Register
#define   HBISTAT1               (CTL_OFF+OFFS_HBISTAT1)    // HDLC Channel B Status Register 1
#define   HBIMSK1                (CTL_OFF+OFFS_HBIMSK1)     // HDLC Channel B Interrupt Mask Register 1
#define   HBISTAT0               (CTL_OFF+OFFS_HBISTAT0)    // HDLC Channel B Interrupt Status 0
#define   HBIMSK0                (CTL_OFF+OFFS_HBIMSK0)     // HDLC Channel B Interrupt Mask Register 0
#define   HBSTATE                (CTL_OFF+OFFS_HBSTATE)     // HDLC Channel B Status Register
#define   HBRCON1                (CTL_OFF+OFFS_HBRCON1)     // HDLC Channel B Receive Max Length Registe
#define   HBRCON0                (CTL_OFF+OFFS_HBRCON0)     // HDLC Channel B Receive Control Register
#define   HBTCON1                (CTL_OFF+OFFS_HBTCON1)     // HDLC Channel B Transmit Control 1 Register
#define   HBTCON0                (CTL_OFF+OFFS_HBTCON0)     // HDLC Channel B Transmit Control 0 Register
#define   HBCON                  (CTL_OFF+OFFS_HBCON)       // HDLC Channel B Control Register

//
// Time Slot Assigner A
//
#define   TSASTOP                (CTL_OFF+OFFS_TSASTOP)     // Time Slot Assinger Channel A Bit Stop Position Register
#define   TSASTART               (CTL_OFF+OFFS_TSASTART)    // Time Slot Assigner Channel A Bit Start Position Register
#define   TSACON                 (CTL_OFF+OFFS_TSACON)      // Time Slot Assigner Channel A Control Regiser

//
// HDLC A
//
#define   HAA3                   (CTL_OFF+OFFS_HAA3)        // HDLC Channel A Address 3 Register
#define   HAA3MSK                (CTL_OFF+OFFS_HAA3MSK)     // HDLC Channel A Address 3 Mask Register
#define   HAA2                   (CTL_OFF+OFFS_HAA2)        // HDLC Channel A Address 2 Register
#define   HAA2MSK                (CTL_OFF+OFFS_HAA2MSK)     // HDLC Channel A Address 2 Mask Register
#define   HAA1                   (CTL_OFF+OFFS_HAA1)        // HDLC Channel A Address 1 Register
#define   HAA1MSK                (CTL_OFF+OFFS_HAA1MSK)     // HDLC Channel A Address 1 Mask Register
#define   HAA0                   (CTL_OFF+OFFS_HAA0)        // HDLC Channel A Address 0 Register
#define   HAA0MSK                (CTL_OFF+OFFS_HAA0MSK)     // HDLC Channel A Address 0 Mask Register
#define   HAMACNTP               (CTL_OFF+OFFS_HAMACNTP)    // HDLC Channel A Mismatch Address Count Peek Register
#define   HAMACNT                (CTL_OFF+OFFS_HAMACNT)     // HDLC Channel A Mismatch Address Count Register
#define   HASFCNTP               (CTL_OFF+OFFS_HASFCNTP)    // HDLC Channel A Short Frame Count Peek Register
#define   HASFCNT                (CTL_OFF+OFFS_HASFCNT)     // HDLC Channel A Short Frame Count Register
#define   HARDP                  (CTL_OFF+OFFS_HARDP)       // HDLC Channel A Receive Data Peek Register
#define   HARD                   (CTL_OFF+OFFS_HARD)        // HDLC Channel A Receive Data Register
#define   HATD                   (CTL_OFF+OFFS_HATD)        // HDLC Channel A Transmit Data Register
#define   HAISTAT1               (CTL_OFF+OFFS_HAISTAT1)    // HDLC Channel A Status Register 1
#define   HAIMSK1                (CTL_OFF+OFFS_HAIMSK1)     // HDLC Channel A Interrupt Mask Register 1
#define   HAISTAT0               (CTL_OFF+OFFS_HAISTAT0)    // HDLC Channel A Interrupt Status 0
#define   HAIMSK0                (CTL_OFF+OFFS_HAIMSK0)     // HDLC Channel A Interrupt Mask Register 0
#define   HASTATE                (CTL_OFF+OFFS_HASTATE)     // HDLC Channel A Status Register
#define   HARCON1                (CTL_OFF+OFFS_HARCON1)     // HDLC Channel A Receive Max Length Registe
#define   HARCON0                (CTL_OFF+OFFS_HARCON0)     // HDLC Channel A Receive Control Register
#define   HATCON1                (CTL_OFF+OFFS_HATCON1)     // HDLC Channel A Transmit Control 1 Register
#define   HATCON0                (CTL_OFF+OFFS_HATCON0)     // HDLC Channel A Transmit Control 0 Register
#define   HACON                  (CTL_OFF+OFFS_HACON)       // HDLC Channel A Control Register

//
// -----------------------------------------------------------------------------
// Am186CC REGISTER BIT DEFINITION 
// -----------------------------------------------------------------------------
//

//
// PCB Relocation Register (RELOC - offset 03FE hex) Bits
//
#define   RELOC_MEM              0x1000                     // Locating PCB in memory space
#define   RELOC_IO               0x0000                     // Locating PCB in I/O space

//
// Processor release level (PRL - offset 03F4 hex) Bits
//

#define   PRL_REVA0              0x4000                     // Processor revision level A0
#define   PRL_DEFAULT            PRL_REVA0                  // Default PRL value is rev A0

//
// System Configuration Register (SYSCON - offset 03F0 hex) Bits
//
#define   SYSCON_ICEMODE         0x8000                     // ICE Mode
#define   SYSCON_TMODE           0x4000                     // Test Mode
#define   SYSCON_DSDEN           0x2000                     // DS/DEN Select
#define   SYSCON_PWD             0x1000                     // Pulse Width Demodulation
#define   SYSCON_DISMEM          0x0800                     // Disable Memory Addresses
#define   SYSCON_DISIO           0x0400                     // Disable I/O Addresses
#define   SYSCON_UART_W_HSUART_W 0x0200                     // No HDLC
#define   SYSCON_HDLC_WO_UART_W_ 0x0100                     // HDLC w/o flow
#define   SYSCON_HDLC_W_UART_WO_ 0x0000                     // Full HDLC w/flow
#define   SYSCON_EXSYNC          0x0080                     // Clock and fram info being driven out of HDLC interface #3.
#define   SYSCON_DISCLK          0x0008                     // Disable Clock

//
// WatchDog Timer Control Register (WDTCON - offset 03E0 hex) Bits
//
#define   WDTCON_ENA             0x8000                     // WatchDog Timer Enable
#define   WDTCON_WRST            0x4000                     // Watchdog Reset
#define   WDTCON_RSTFLAG         0x2000                     // Reset Flag
#define   WDTCON_NMIFLAG         0x1000                     // NMI Flag
#define   WDTCON_EXRST           0x0100                     // WatchDog Timer External Reset Enable
#define   WDTCON_ES_10           0x0001                     // Exponent Select Field for 2^10
#define   WDTCON_ES_20           0x0002                     // Exponent Select Field for 2^20
#define   WDTCON_ES_21           0x0003                     // Exponent Select Field for 2^21
#define   WDTCON_ES_22           0x0004                     // Exponent Select Field for 2^22
#define   WDTCON_ES_23           0x0010                     // Exponent Select Field for 2^23
#define   WDTCON_ES_24           0x0020                     // Exponent Select Field for 2^24
#define   WDTCON_ES_25           0x0030                     // Exponent Select Field for 2^25
#define   WDTCON_ES_26           0x0040                     // Exponent Select Field for 2^26

//
// Enable Refresh Control Register (EDRAM - 03AC hex) Bits
//
#define   EDRAM_EN               0x8000                     // Enable Refresh

//
// PCS and MCS Auxiliary Register (MPCS - offset 03A8 hex) Bits
//
#define   MPCS_8K                0x0100                     // MCS block size = 8Kbyte
#define   MPCS_16K               0x0200                     // MCS block size = 16Kbyte
#define   MPCS_32K               0x0400                     // MCS block size = 32Kbyte
#define   MPCS_64K               0x0800                     // MCS block size = 64Kbyte
#define   MPCS_128K              0x1000                     // MCS block size = 128Kbyte
#define   MPCS_256K              0x2000                     // MCS block size = 256Kbyte
#define   MPCS_512K              0x4000                     // MCS block size = 512Kbyte
#define   MPCS_MS                0x0040                     // Memory or I/O Space Selector
#define   MPCS_OMSIZ             0x0020                     // Non-UCS and Non-LCS Memory (Other Memory Data Bus Size)
#define   MPCS_IOSIZ             0x0010                     // I/O Space Data Bus Size

//
// Midrange Memory Chip Select Register (MMCS - offset 03A6 hex) Bits
//
#define   MMCS_MCS0_ONLY         0x0020                     // MCS0 Only mode bit

//
// Lower Memory Chip Select Register (LMCS - offset 03A2 hex) Bits
//
#define   LMCS_UB_64K            0x0000                     // Upper Bound is 64Kbyte
#define   LMCS_UB_128K           0x1000                     // Upper Bound is 128Kbyte
#define   LMCS_UB_256K           0x3000                     // Upper Bound is 256Kbyte
#define   LMCS_UB_512K           0x7000                     // Upper Bound is 512Kbyte
#define   LMCS_DA                0x0080                     // Disable Address
#define   LMCS_LDEN              0x0040                     // LCS DRAM Enable
#define   LMCS_LSIZ8             0x0020                     // Lower Memory Data Bus Size is 8 bit
#define   LMCS_LSIZ16            0x0000                     // Lower Memory Data Bus Size is 16 bit

//
// Upper Memory Chip Select Register (UMCS - offset 03A0 hex) Bits
//
#define   UMCS_LB_64K            0x7000                     // Lower Bound is 64Kbyte
#define   UMCS_LB_128K           0x6000                     // Lower Bound is 128Kbyte
#define   UMCS_LB_256K           0x4000                     // Lower Bound is 256Kbyte
#define   UMCS_LB_512K           0x0000                     // Lower Bound is 512Kbyte
#define   UMCS_DA                0x0080                     // Disable Address
#define   UMCS_UDEN              0x0040                     // UCS DRAM Enable
#define   UMCS_USIZ8             0x0020                     // Upper Memory Data Bus Size is 8 bit
#define   UMCS_USIZ16            0x0000                     // Upper Memory Data Bus Size is 16 bit

//
// Common Bits between chip selects
//
#define   CS_WAIT0               0x0000                     // 0 wait state
#define   CS_WAIT1               0x0001                     // 1 wait state
#define   CS_WAIT2               0x0002                     // 2 wait states
#define   CS_WAIT3               0x0003                     // 3 wait states
#define   CS_WAIT5               0x0008                     // 8 wait states (valid for PCS7-0 only)
#define   CS_WAIT7               0x0009                     // 9 wait states (valid for PCS7-0 only)
#define   CS_WAIT9               0x000a                     // A wait states (valid for PCS7-0 only)
#define   CS_WAIT15              0x000b                     // B wait states (valid for PCS7-0 only)
#define   CS_IGXRDY              0x0004                     // Ignore external ready

//
// Timer 2 Mode / Control Register (T2CON - offset 0350 hex) Bits
// Timer 1 Mode / Control Register (T1CON - offset 0348 hex) Bits
// Timer 0 Mode / Control Register (T0CON - offset 0340 hex) Bits
//
#define   TCON_EN                0x8000                     // Enable Bit
#define   TCON_INH               0x4000                     // Inhibit Bit
#define   TCON_INT               0x2000                     // Interrupt Bit
#define   TCON_RIU               0x1000                     // Register In Use Bit (Available for T0CON & T1CON only)
#define   TCON_MC                0x0020                     // Maximum Count Bit
#define   TCON_RTG               0x0010                     // Retrigger Bit (Available for T0CON & T1CON only)
#define   TCON_P                 0x0008                     // Prescaler Bit (Available for T0CON & T1CON only)
#define   TCON_EXT               0x0004                     // External Clock Bit (Available for T0CON & T1CON only)
#define   TCON_ALT               0x0002                     // Alternate Compare Bit (Available for T0CON & T1CON only)
#define   TCON_CONT              0x0001                     // Continuous Mode Bit

//
// PIO Polarity Register (PIOPOL - offset 0338 hex) Bits
//
#define   PIOPOL_PIO35           0x8000                     // PIO35 active high
#define   PIOPOL_PIO34           0x4000                     // PIO34 active high
#define   PIOPOL_PIO33           0x2000                     // PIO33 active high
#define   PIOPOL_PIO30           0x1000                     // PIO30 active high
#define   PIOPOL_PIO29           0x0800                     // PIO29 active high
#define   PIOPOL_PIO27           0x0400                     // PIO27 active high
#define   PIOPOL_PIO15           0x0200                     // PIO15 active high
#define   PIOPOL_PIO5            0x0100                     // PIO5 active high

//
// Interrupt Polarity Register (INTPOL - offset 0336 hex) Bits
//
#define   INTPOL_INT8            0x0100                     // INT8 active high
#define   INTPOL_INT7            0x0080                     // INT7 active high
#define   INTPOL_INT6            0x0040                     // INT6 active high
#define   INTPOL_INT5            0x0020                     // INT5 active high
#define   INTPOL_INT4            0x0010                     // INT4 active high
#define   INTPOL_INT3            0x0008                     // INT3 active high
#define   INTPOL_INT2            0x0004                     // INT2 active high
#define   INTPOL_INT1            0x0002                     // INT1 active high
#define   INTPOL_INT0            0x0001                     // INT0 active high

//
// Shared Mask Register (SHMASK - offset 0334 hex) Bits
//
#define   SHMASK_PIO35           0x8000                     // Mask PIO35
#define   SHMASK_PIO34           0x4000                     // Mask PIO34
#define   SHMASK_PIO33           0x2000                     // Mask PIO33
#define   SHMASK_PIO30           0x1000                     // Mask PIO30
#define   SHMASK_PIO29           0x0800                     // Mask PIO29
#define   SHMASK_PIO27           0x0400                     // Mask PIO27
#define   SHMASK_PIO15           0x0200                     // Mask PIO15
#define   SHMASK_PIO5            0x0100                     // Mask PIO5
#define   SHMASK_INT7            0x0080                     // Mask INT7
#define   SHMASK_INT6            0x0040                     // Mask INT6
#define   SHMASK_INT5            0x0020                     // Mask INT5
#define   SHMASK_INT4            0x0010                     // Mask INT4
#define   SHMASK_INT3            0x0008                     // Mask INT3
#define   SHMASK_INT2            0x0004                     // Mask INT2
#define   SHMASK_INT1            0x0002                     // Mask INT1

//
// Shared Request Register (SHREQ - offset 0332 hex) Bits
//
#define   SHREQ_PIO35            0x8000                     // PIO35 Shared Request
#define   SHREQ_PIO34            0x4000                     // PIO34 Shared Request
#define   SHREQ_PIO33            0x2000                     // PIO33 Shared Request
#define   SHREQ_PIO30            0x1000                     // PIO30 Shared Request
#define   SHREQ_PIO29            0x0800                     // PIO29 Shared Request
#define   SHREQ_PIO27            0x0400                     // PIO27 Shared Request
#define   SHREQ_PIO15            0x0200                     // PIO15 Shared Request
#define   SHREQ_PIO5             0x0100                     // PIO5 Shared Request
#define   SHREQ_INT7             0x0080                     // INT7 Shared Request
#define   SHREQ_INT6             0x0040                     // INT6 Shared Request
#define   SHREQ_INT5             0x0020                     // INT5 Shared Request
#define   SHREQ_INT4             0x0010                     // INT4 Shared Request
#define   SHREQ_INT3             0x0008                     // INT3 Shared Request
#define   SHREQ_INT2             0x0004                     // INT2 Shared Request
#define   SHREQ_INT1             0x0002                     // INT1 Shared Request

//
// DMA Halt Register (DMAHLT - offset 0330 hex) bits
//
#define   DMAHLT_DHLT            0x8000                     // DMA Halt

//
// Interrupt Status Register (INTSTS - offset 032E hex) Bits
//
#define   INTSTS_DMA3            0x0040                     // GPDMA3 has request pending
#define   INTSTS_DMA2            0x0020                     // GPDMA2 has request pending
#define   INTSTS_DMA1            0x0010                     // GPDMA1 has request pending
#define   INTSTS_DMA0            0x0008                     // GPDMA0 has request pending
#define   INTSTS_TMR2            0x0004                     // Timer 2 has interrupt request pending
#define   INTSTS_TMR1            0x0002                     // Timer 1 has interrupt request pending
#define   INTSTS_TMR0            0x0001                     // Timer 0 has interrupt request pending

//
// Interrupt Request Register (REQST - offset 032C hex) bits
//
#define   REQST_CH0              0x0001                     // Channel 0 Interrupt Request bit
#define   REQST_CH1              0x0002                     // Channel 1 Interrupt Request bit
#define   REQST_CH2              0x0004                     // Channel 2 Interrupt Request bit
#define   REQST_CH3              0x0008                     // Channel 3 Interrupt Request bit
#define   REQST_CH4              0x0010                     // Channel 4 Interrupt Request bit
#define   REQST_CH5              0x0020                     // Channel 5 Interrupt Request bit
#define   REQST_CH6              0x0040                     // Channel 6 Interrupt Request bit
#define   REQST_CH7              0x0080                     // Channel 7 Interrupt Request bit
#define   REQST_CH8              0x0100                     // Channel 8 Interrupt Request bit
#define   REQST_CH9              0x0200                     // Channel 9 Interrupt Request bit
#define   REQST_CH10             0x0400                     // Channel 10 Interrupt Request bit
#define   REQST_CH11             0x0800                     // Channel 11 Interrupt Request bit
#define   REQST_CH12             0x1000                     // Channel 12 Interrupt Request bit
#define   REQST_CH13             0x2000                     // Channel 13 Interrupt Request bit
#define   REQST_CH14             0x4000                     // Channel 14 Interrupt Request bit

//
// Inservice Register (INSERV - offset 032A hex) bits
//
#define   INSERV_CH0             0x0001                     // Channel 0 Inservice bit
#define   INSERV_CH1             0x0002                     // Channel 1 Inservice bit
#define   INSERV_CH2             0x0004                     // Channel 2 Inservice bit
#define   INSERV_CH3             0x0008                     // Channel 3 Inservice bit
#define   INSERV_CH4             0x0010                     // Channel 4 Inservice bit
#define   INSERV_CH5             0x0020                     // Channel 5 Inservice bit
#define   INSERV_CH6             0x0040                     // Channel 6 Inservice bit
#define   INSERV_CH7             0x0080                     // Channel 7 Inservice bit
#define   INSERV_CH8             0x0100                     // Channel 8 Inservice bit
#define   INSERV_CH9             0x0200                     // Channel 9 Inservice bit
#define   INSERV_CH10            0x0400                     // Channel 10 Inservice bit
#define   INSERV_CH11            0x0800                     // Channel 11 Inservice bit
#define   INSERV_CH12            0x1000                     // Channel 12 Inservice bit
#define   INSERV_CH13            0x2000                     // Channel 13 Inservice bit
#define   INSERV_CH14            0x4000                     // Channel 14 Inservice bit

//
// Priority Mask Register (PRIMSK - offset 0328 hex) Bits
//
#define   PRIMSK_PRM0            0x0000                     // Priority 0
#define   PRIMSK_PRM1            0x0001                     // Priority 1
#define   PRIMSK_PRM2            0x0002                     // Priority 2
#define   PRIMSK_PRM3            0x0003                     // Priority 3
#define   PRIMSK_PRM4            0x0004                     // Priority 4
#define   PRIMSK_PRM5            0x0005                     // Priority 5
#define   PRIMSK_PRM6            0x0006                     // Priority 6
#define   PRIMSK_PRM7            0x0007                     // Priority 7

//
// Interrupt Mask Register (IMASK - offset 0326 hex) bits
//
#define   IMASK_CH0              0x0001                     // Channel 0 mask
#define   IMASK_CH1              0x0002                     // Channel 1 mask
#define   IMASK_CH2              0x0004                     // Channel 2 mask
#define   IMASK_CH3              0x0008                     // Channel 3 mask
#define   IMASK_CH4              0x0010                     // Channel 4 mask
#define   IMASK_CH5              0x0020                     // Channel 5 mask
#define   IMASK_CH6              0x0040                     // Channel 6 mask
#define   IMASK_CH7              0x0080                     // Channel 7 mask
#define   IMASK_CH8              0x0100                     // Channel 8 mask
#define   IMASK_CH9              0x0200                     // Channel 9 mask
#define   IMASK_CH10             0x0400                     // Channel 10 mask
#define   IMASK_CH11             0x0800                     // Channel 11 mask
#define   IMASK_CH12             0x1000                     // Channel 12 mask
#define   IMASK_CH13             0x2000                     // Channel 13 mask
#define   IMASK_CH14             0x4000                     // Channel 14 mask

//
// Poll Status Register (POLLST - offset 0324 hex) Bits
//
#define   POLLST_IREQ            0x8000                     // Interrupt request

//
// Poll Register (POLL - offset 0322 hex) Bits
//
#define   POLL_IREQ              0x8000                     // Interrupt request

//
// End of Interrupt Register (EOI - offset 0320 hex) Bits
//
#define   EOI_NSPEC              0x8000                     // Non-specific EOI

//
// Channel 14 Control Register (CH14CON - offset 031C hex) Bits
// Channel 13 Control Register (CH13CON - offset 031A hex) Bits
// Channel 12 Control Register (CH12CON - offset 0318 hex) Bits
// Channel 11 Control Register (CH11CON - offset 0316 hex) Bits
// Channel 10 Control Register (CH10CON - offset 0314 hex) Bits
// Channel 9 Control Register (CH9CON - offset 0312 hex) Bits
// Channel 8 Control Register (CH8CON - offset 0310 hex) Bits
// Channel 7 Control Register (CH7CON - offset 030E hex) Bits
// Channel 6 Control Register (CH6CON - offset 030C hex) Bits
// Channel 5 Control Register (CH5CON - offset 030A hex) Bits
// Channel 4 Control Register (CH4CON - offset 0308 hex) Bits
// Channel 3 Control Register (CH3CON - offset 0306 hex) Bits
// Channel 2 Control Register (CH2CON - offset 0304 hex) Bits
// Channel 1 Control Register (CH1CON - offset 0302 hex) Bits
// Channel 0 Control Register (CH0CON - offset 0300 hex) Bits
//
#define   CHCON_SRC_INTERNAL     0x0020                     // 1 = internal source, 0 = external source
// (Available for channels:  2,3,8,9,10,11, and 12 only)
#define   CHCON_LTM              0x0010                     // Level Triggered Mode (Available for channels:
// 1,2,3,8,9,10,11,12, and 13 only)
#define   CHXCON_SRC_INT     	0x0030                     // internal level triggered source
#define   CHCON_MSK              0x0008                     // Interrupt Mask
#define   CHCON_PR0              0x0000                     // Priority Level 0 (highest)
#define   CHCON_PR1              0x0001                     // Priority Level 1
#define   CHCON_PR2              0x0002                     // Priority Level 2
#define   CHCON_PR3              0x0003                     // Priority Level 3
#define   CHCON_PR4              0x0004                     // Priority Level 4
#define   CHCON_PR5              0x0005                     // Priority Level 5
#define   CHCON_PR6              0x0006                     // Priority Level 6
#define   CHCON_PR7              0x0007                     // Priority Level 7 (lowest)

//
// Interrupt Types
//
#define   ITYPE_DIV              0x0000                     // Divid Error
#define   ITYPE_TRACE            0x0001                     // Trace
#define   ITYPE_NMI              0x0002                     // Non-maskable Interrupt
#define   ITYPE_WATCHDOG         ITYPE_NMI                  // WatchDog Timer
#define   ITYPE_BRKP             0x0003                     // Breakpoint
#define   ITYPE_OVERFLOW         0x0004                     // Detected Overflow Exception
#define   ITYPE_BOUNDS           0x0005                     // Array Bounds
#define   ITYPE_ILLOP            0x0006                     // Unused Opcode (Illegal Opcode)
#define   ITYPE_ESC              0x0007                     // ESC Opcode
#define   ITYPE_TMR0             0x0008                     // Timer 0
#define   ITYPE_TMR1             0x0009                     // Timer 1
#define   ITYPE_TMR2             0x000a                     // Timer 2
#define   ITYPE_INT0             0x000b                     // INT0
#define   ITYPE_INT1             0x000c                     // INT1
#define   ITYPE_USB              ITYPE_INT1                 // USB / INT1
#define   ITYPE_INT2             0x000d                     // INT2
#define   ITYPE_HSUART           ITYPE_INT2                 // High Speed UART
#define   ITYPE_HDLC_A           0x000e                     // HDLC A
#define   ITYPE_SDMA0            0x000f                     // Smart DMA 0
#define   ITYPE_HDLC_B           0x0010                     // HDLC B
#define   ITYPE_SDMA1            0x0011                     // Smart DMA 1
#define   ITYPE_HDLC_C           0x0012                     // HDLC C
#define   ITYPE_SDMA2            0x0013                     // Smart DMA 2
#define   ITYPE_HDLC_D           0x0014                     // HDLC D
#define   ITYPE_SDMA3            0x0015                     // Smart DMA 3
#define   ITYPE_INT3             0x0016                     // INT3
#define   ITYPE_GCI              ITYPE_INT3                 // GCI
#define   ITYPE_INT4             0x0017                     // INT4
#define   ITYPE_GDMA0            ITYPE_INT4                 // General Purpose DMA0
#define   ITYPE_GDMA1            0x0018                     // General Purpose DMA1
#define   ITYPE_INT5             0x0019                     // INT5
#define   ITYPE_GDMA2            ITYPE_INT5                 // General Purpose DMA2
#define   ITYPE_GDMA3            0x001a                     // General Purpose DMA3
#define   ITYPE_INT6             0x001b                     // INT6
#define   ITYPE_UART             ITYPE_INT6                 // UART
#define   ITYPE_INT7             0x001c                     // INT7
#define   ITYPE_INT8             0x001d                     // INT8
#define   ITYPE_SHARED           0x001e                     // Shared Interrupt (channel 14)

//
// End of Interrupt Type Register (EOI - offset 0320 hex) Bits
// These are the values to write to the EOI Register
//
#define   EOITYPE_TMR0           ITYPE_TMR0                 // Timer 0
#define   EOITYPE_TMR1           ITYPE_TMR1                 // Timer 1
#define   EOITYPE_TMR2           ITYPE_TMR2                 // Timer 2
#define   EOITYPE_INT0           ITYPE_INT0                 // INT0
#define   EOITYPE_INT1           ITYPE_INT1                 // INT1
#define   EOITYPE_USB            ITYPE_INT1                 // USB
#define   EOITYPE_INT2           ITYPE_INT2                 // INT2
#define   EOITYPE_HSUART         ITYPE_INT2                 // High Speed UART
#define   EOITYPE_HDLC_A         ITYPE_HDLC_A               // HDLC A
#define   EOITYPE_SDMA0          ITYPE_SDMA0                // Smart DMA 0
#define   EOITYPE_HDLC_B         ITYPE_HDLC_B               // HDLC B
#define   EOITYPE_SDMA1          ITYPE_SDMA1                // Smart DMA 1
#define   EOITYPE_HDLC_C         ITYPE_HDLC_C               // HDLC C
#define   EOITYPE_SDMA2          ITYPE_SDMA2                // Smart DMA 2
#define   EOITYPE_HDLC_D         ITYPE_HDLC_D               // HDLC D
#define   EOITYPE_SDMA3          ITYPE_SDMA3                // Smart DMA 3
#define   EOITYPE_INT3           ITYPE_INT3                 // INT3
#define   EOITYPE_GCI            ITYPE_INT3                 // GCI
#define   EOITYPE_INT4           ITYPE_INT4                 // INT4
#define   EOITYPE_GDMA0          ITYPE_INT4                 // General DMA 0
#define   EOITYPE_GDMA1          ITYPE_GDMA1                // General DMA 1
#define   EOITYPE_INT5           ITYPE_INT5                 // INT5
#define   EOITYPE_GDMA2          ITYPE_GDMA2                // General DMA 2 
#define   EOITYPE_GDMA3          ITYPE_GDMA3                // General DMA 3
#define   EOITYPE_INT6           ITYPE_INT6                 // INT6
#define   EOITYPE_UART           ITYPE_INT6                 // UART
#define   EOITYPE_INT7           ITYPE_INT7                 // INT7
#define   EOITYPE_INT8           ITYPE_INT8                 // INT8
#define   EOITYPE_SHARED         ITYPE_SHARED               // Shared Ints

//
// Synchronous Serial Interface Control (SSSCON - offset 02F2 hex) Bits
//
#define   SSCON_CLKP1            0x0800                     // Active Clock Polarity is 1
#define   SSCON_CLKP0            0x0000                     // Active Clock Polarity is 0
#define   SSCON_DENP1            0x0400                     // Device Enable Polarity is 1
#define   SSCON_DENP0            0x0000                     // Device Enable Polarity is 0
#define   SSCON_MSBF             0x0100                     // MSB will be transmitted first
#define   SSCON_LSBF             0x0000                     // LSB will be transmitted and received first
#define   SSCON_CLKDIV2          0x0000                     // SSI clock = 1/2 CPU clock
#define   SSCON_CLKDIV4          0x0010                     // SSI clock = 1/4 CPU clock
#define   SSCON_CLKDIV8          0x0020                     // SSI clock = 1/8 CPU clock
#define   SSCON_CLKDIV16         0x0030                     // SSI clock = 1/16 CPU clock
#define   SSCON_CLKDIV32         0x0040                     // SSI clock = 1/32 CPU clock
#define   SSCON_CLKDIV64         0x0050                     // SSI clock = 1/64 CPU clock
#define   SSCON_CLKDIV128        0x0060                     // SSI clock = 1/128 CPU clock
#define   SSCON_CLKDIV256        0x0070                     // SSI clock = 1/256 CPU clock
#define   SSCON_DEN1             0x0002                     // SSI SDEN1 Enable
#define   SSCON_DEN0             0x0001                     // SSI SDEN0 Enable

//
// Synchronous Serial Interface Mode/Status (SSSTAT - offset 02F0 hex) Bits
//
#define   SSSTAT_ENHCTL          0x8000                     // Enhanced Control
#define   SSSTAT_ERR             0x0004                     // Receive/Transmit Error Detect
#define   SSSTAT_COMPLETE        0x0002                     // Data Receive/Transmit Complete
#define   SSSTAT_PB              0x0001                     // Port Busy

//
// GCI Command/Indicate Transmit Data Register 0 (GCITD0 - offset 02AE hex) Bits
//
#define   GCITD0_BAR             0x0080                     // Bus Access Request

//
// GCI TIC Bus Address Register (GTIC - offset 02A6 hex) Bits
//
#define   GTIC_TICEN             0x0080                     // TIC Bus Enable
#define   GTIC_ECHOEN            0x0040                     // TIC Echo Enable
#define   GTIC_TICAD_0           0x0000                     // TIC Bus Address = 0
#define   GTIC_TICAD_1           0x0001                     // TIC Bus Address = 1
#define   GTIC_TICAD_2           0x0002                     // TIC Bus Address = 2
#define   GTIC_TICAD_3           0x0003                     // TIC Bus Address = 3
#define   GTIC_TICAD_4           0x0004                     // TIC Bus Address = 4
#define   GTIC_TICAD_5           0x0005                     // TIC Bus Address = 5
#define   GTIC_TICAD_6           0x0006                     // TIC Bus Address = 6
#define   GTIC_TICAD_7           0x0007                     // TIC Bus Address = 7

//
// GCI Interrupt Mask Register (GIMSK - offset 02A4 hex) Bits
//
#define   GIMSK_IC               0x0200                     // IC Interrupt Enable 
#define   GIMSK_DCLST            0x0100                     // DCL Start Enable
#define   GIMSK_CHGCI1           0x0080                     // Change in C/I1 Channel Status Enable
#define   GIMSK_CHGCI0           0x0040                     // Change in C/I0 Channel Status Enable
#define   GIMSK_MRAD             0x0020                     // Monitor Channel Receive Abort Detected Enable
#define   GIMSK_MCD              0x0010                     // Monitor Channel Collision Detected Enabled
#define   GIMSK_MTARD            0x0008                     // Monitor Channel Transmit Abort Request Received Enable
#define   GIMSK_MEOMRD           0x0004                     // Monitor Channel End-of-Message Indication Received Enable
#define   GIMSK_MXBA             0x0002                     // Monitor Channel Transmit Buffer Available Enable
#define   GIMSK_MRDA             0x0001                     // Monitor Channel Receive Data Available Interrupt Enable

//
// GCI Interrupt Status Register (GISTAT - offset 02A2 hex) Bits
//
#define   GISTAT_IC              GIMSK_IC                   // IC Interrupt
#define   GISTAT_DCLST           GIMSK_DCLST                // DCL Start
#define   GISTAT_CHGCI1          GIMSK_CHGCI1               // Change in C/I1 Channel Status
#define   GISTAT_CHGCI0          GIMSK_CHGCI0               // Change in C/I0 Channel Status
#define   GISTAT_MRAD            GIMSK_MRAD                 // Monitor Channel Receive Abort Detected
#define   GISTAT_MCD             GIMSK_MCD                  // Monitor Channel Collision Detected
#define   GISTAT_MTARD           GIMSK_MTARD                // Monitor Channel Transmit Abort Request Received
#define   GISTAT_MEOMRD          GIMSK_MEOMRD               // Monitor Channel End-of-Message Indication Received
#define   GISTAT_MXBA            GIMSK_MXBA                 // Monitor Channel Transmit Buffer Available
#define   GISTAT_MRDA            GIMSK_MRDA                 // Monitor Channel Receive Data Available Interrupt

//
// GCI Peripheral Control Register (GPCON - offset 02A0 hex) Bits
//
#define   GPCON_PCMFSC           0x0100                     // PCM B Channel Frame Sync Select
#define   GPCON_MCARV            0x0080                     // Monitor Channel Address Received Valid
#define   GPCON_MARQ             0x0040                     // Monitor Channel Abort Request
#define   GPCON_MCHEN            0x0020                     // Monitor Channel Enable
#define   GPCON_MCHSEL           0x0010                     // Monitor Channel Select
#define   GPCON_MEOMRQ           0x0008                     // Monitor Channel EOM Request
#define   GPCON_ICSEL            0x0004                     // IC Channel Select
#define   GPCON_GCIACT           0x0002                     // GCI Activation
#define   GPCON_BRDIS            0x0001                     // Bus Reversal Disable

//
// Serial Port Receive Data Peek (SPRXDP - offset 028C hex) Bits
//
#define   SPRXDP_RDR             SPRXD_RDR                  // Receive Data Ready
#define   SPRXDP_THRE            SPRXD_THRE                 // Transmit Holding Register Empty
#define   SPRXDP_FER             SPRXD_FER                  // Framing Error
#define   SPRXDP_OER             SPRXD_OER                  // Overrun Error
#define   SPRXDP_PER             SPRXD_PER                  // Parity Error
#define   SPRXDP_BRK             SPRXD_BRK                  // Break
#define   SPRXDP_AB              SPRXD_AB                   // Address Bit

//
// Serial Port Receive Data Register (SPRXD - offset 028A hex) Bits
//
#define   SPRXD_RDR              0x8000                     // Receive Data Ready
#define   SPRXD_THRE             0x4000                     // Transmit Holding Register Empty
#define   SPRXD_FER              0x2000                     // Framing Error
#define   SPRXD_OER              0x1000                     // Overrun Error
#define   SPRXD_PER              0x0800                     // Parity Error
#define   SPRXD_BRK              0x0200                     // Break
#define   SPRXD_AB               0x0100                     // Address Bit

//
// Serial Port Transmit Data Register (SPTXD - offset 0288 hex) Bits
//
#define   SPTXD_AB               0x0100                     // Address bit

//
// Serial Port Interrupt Mask (SPIMSK - offset 0286 hex) Bits
//
#define   SPIMSK_BRK             0x0200                     // Break Interrupt Enable
#define   SPIMSK_AB              0x0100                     // Address Bit Interrupt Enable
#define   SPIMSK_RDR             0x0080                     // Receive Data Ready Interrupt Enable
#define   SPIMSK_THRE            0x0040                     // Transmit Holding Register Empty Interrupt Enable
#define   SPIMSK_FER             0x0020                     // Framing Error Interrupt Enable
#define   SPIMSK_OER             0x0010                     // Overrun Error Interrupt Enable
#define   SPIMSK_PER             0x0008                     // Parity Error Interrupt Enable
#define   SPIMSK_TEMT            0x0004                     // Transmitter Empty Interrupt Enable
#define   SPIMSK_IDLED           0x0002                     // Receive Line Idle Detected Interrupt Enable
#define   SPIMSK_IDLE            0x0001                     // Receive Line Idle Interrupt Enable

//
// Serial Port Status Register (SPSTAT - offset 0284 hex) Bits
//
#define   SPSTAT_BRK             0x0200                     // Break Detected
#define   SPSTAT_AB              0x0100                     // Address Bit Detected
#define   SPSTAT_RDR             0x0080                     // Receive Data Ready
#define   SPSTAT_THRE            0x0040                     // Transmit Holding Register Empty
#define   SPSTAT_FER             0x0020                     // Framing Error Detected
#define   SPSTAT_OER             0x0010                     // Overrun Error Detected
#define   SPSTAT_PER             0x0008                     // Parity Error Detected
#define   SPSTAT_TEMT            0x0004                     // Transmitter Empty
#define   SPSTAT_IDLED           0x0002                     // Receive Line Idle Detected
#define   SPSTAT_IDLE            0x0001                     // Receive Line Idle

//
// Serial Port Control 1 (SPCON1 - offset 0282 hex) Bits
//
#define   SPCON1_BRKVAL          0x0008                     // Break Value
#define   SPCON1_EXDWR           0x0004                     // Extended Write
#define   SPCON1_EXDRD           0x0002                     // Extended Read
#define   SPCON1_XTRN            0x0001                     // External Clock

//
// Serial Port Control 0 (SPCON0 - offset 0280 hex) Bits
//
#define   SPCON0_RSIE            0x1000                     // Receive Status Interrupt Enable
#define   SPCON0_BRK             0x0800                     // Send Break
#define   SPCON0_AB              0x0400                     // Address Bit
#define   SPCON0_FC              0x0200                     // Flow Control Enable
#define   SPCON0_TXIE            0x0100                     // Transmit Interrupt Enable
#define   SPCON0_RXIE            0x0080                     // Receive Data Interrupt Enable
#define   SPCON0_TMODE           0x0040                     // Transmitter Enable
#define   SPCON0_RMODE           0x0020                     // Receiver Enable
#define   SPCON0_EVN             0x0010                     // Even Parity
#define   SPCON0_PEN             0x0008                     // Parity Enable
#define   SPCON0_ABEN            0x0004                     // Address Bit Enable
#define   SPCON0_D7              0x0002                     // Data 7 Bits
#define   SPCON0_STP2            0x0001                     // Stop Bit Length

//
// High Speed Serial Port Receive Data Peek (HSPRXDP - offset 026C hex) Bits
//
#define   HSPRXDP_RDR            HSPRXD_RDR                 // Receive Data Ready
#define   HSPRXDP_THRE           HSPRXD_THRE                // Transmit Holding Register Empty
#define   HSPRXDP_FER            HSPRXD_FER                 // Framing Error
#define   HSPRXDP_OER            HSPRXD_OER                 // Overrun Error
#define   HSPRXDP_PER            HSPRXD_PER                 // Parity Error
#define   HSPRXDP_MATCH          HSPRXD_MATCH               // Match
#define   HSPRXDP_BRK            HSPRXD_BRK                 // Break
#define   HSPRXDP_AB             HSPRXD_AB                  // Address Bit

//
// High Speed Serial Port Receive Data (HSPRXD - offset 026A hex) Bits
//
#define   HSPRXD_RDR             0x8000                     // Receive Data Ready
#define   HSPRXD_THRE            0x4000                     // Transmit Holding Register Empty
#define   HSPRXD_FER             0x2000                     // Framing Error
#define   HSPRXD_OER             0x1000                     // Overrun Error
#define   HSPRXD_PER             0x0800                     // Parity Error
#define   HSPRXD_MATCH           0x0400                     // Match
#define   HSPRXD_BRK             0x0200                     // Break
#define   HSPRXD_AB              0x0100                     // Address Bit

//
// High Speed Serial Port Transmit Data (HSPTXD - offset 0268 hex) Bits
//
#define   HSPTXD_AB              0x0100                     // Address Bit

//
// High Speed Serial Port Interrupt Mask (HSPIMSK - offset 0266 hex) Bits
//
#define   HSPIMSK_RTHRSH         0x8000                     // Receive FIFO Threshold Interrupt Enable
#define   HSPIMSK_TTHRSH         0x4000                     // Transmit FIFO Threshold Interrupt Enable
#define   HSPIMSK_OERIM          0x1000                     // Overrun Error Detected Immediate Enable
#define   HSPIMSK_MATCH          0x0400                     // Character Match Interrupt Enable
#define   HSPIMSK_BRK            0x0200                     // Break Interrupt Enable
#define   HSPIMSK_AB             0x0100                     // Address Bit Interrupt Enable
#define   HSPIMSK_RDR            0x0080                     // Receive Data Ready Interrupt Enable
#define   HSPIMSK_THRE           0x0040                     // Tranmit Holding Register Empty Interrupt Enable
#define   HSPIMSK_FER            0x0020                     // Framing Error Interrupt Enable
#define   HSPIMSK_OER            0x0010                     // Overrun Error Interrupt Enable
#define   HSPIMSK_PER            0x0008                     // Parity Error Interrupt
#define   HSPIMSK_TEMT           0x0004                     // Transmitter Empty Interrupt Enable
#define   HSPIMSK_IDLED          0x0002                     // Receive Line Idle Detected Interrupt Enable
#define   HSPIMSK_IDLE           0x0001                     // Receive Line Idle Interrupt Enable

//
// High Speed Serial Port Status (HSPSTAT - offset 0264 hex) Bits
//
#define   HSPSTAT_RTHRSH         0x8000                     // Receive FIFO Threshold Reached
#define   HSPSTAT_TTHRSH         0x4000                     // Transmit FIFO Threshold Reached
#define   HSPSTAT_OERIM          0x1000                     // Overrun Error Detected Immediate
#define   HSPSTAT_MATCH          0x0400                     // Address Match Detected
#define   HSPSTAT_BRK            0x0200                     // Break Detected
#define   HSPSTAT_AB             0x0100                     // Address Bit Detected
#define   HSPSTAT_RDR            0x0080                     // Recevie Data Ready
#define   HSPSTAT_THRE           0x0040                     // Transmit Holding Register Empty
#define   HSPSTAT_FER            0x0020                     // Framing Error Detected
#define   HSPSTAT_OER            0x0010                     // Overrun Error Detected
#define   HSPSTAT_PER            0x0008                     // Parity Error Detected
#define   HSPSTAT_TEMT           0x0004                     // Transmitter Empty
#define   HSPSTAT_IDLED          0x0002                     // Receive Line Idle Detected
#define   HSPSTAT_IDLE           0x0001                     // Receive Line Idle

//
// High Speed Serial Port Control 1 (HSPCON1 - offset 0262 hex) Bits
//
#define   HSPCON1_TFEN           0x8000                     // Transmit FIFO Enable
#define   HSPCON1_RFEN           0x4000                     // Receive FIFO Enable
#define   HSPCON1_TFLUSH         0x2000                     // Transmit FIFO Flush
#define   HSPCON1_RFLUSH         0x1000                     // Receive FIFO Flush
#define   HSPCON1_ABAUD          0x0800                     // Auto Baud Enable
#define   HSPCON1_MEN            0x0080                     // Character Match Enable
#define   HSPCON1_MAB2           0x0040                     // Match Address Bit 2
#define   HSPCON1_MAB1           0x0020                     // Match Address Bit 1
#define   HSPCON1_MAB0           0x0010                     // Match Address Bit 0
#define   HSPCON1_BRKVAL         0x0008                     // Break Value
#define   HSPCON1_EXDWR          0x0004                     // Extended Write
#define   HSPCON1_EXDRD          0x0002                     // Extended Read
#define   HSPCON1_XTRN           0x0001                     // External Clock

//
// High Speed Serial Port Control 0 (HSPCON0 - offset 0260 hex) Bits
//
#define   HSPCON0_RSIE           0x1000                     // Receive Status Interrupt Enable
#define   HSPCON0_BRK            0x0800                     // Send Break
#define   HSPCON0_AB             0x0400                     // Address bit
#define   HSPCON0_FC             0x0200                     // Flow Control Enable
#define   HSPCON0_TXIE           0x0100                     // Transmit Interrupt Enable
#define   HSPCON0_RXIE           0x0080                     // Receive Data Interrupt Enable
#define   HSPCON0_TMODE          0x0040                     // Transmitter Enable
#define   HSPCON0_RMODE          0x0020                     // Receiver Enable
#define   HSPCON0_EVN            0x0010                     // Even Parity
#define   HSPCON0_PEN            0x0008                     // Parity Enable
#define   HSPCON0_ABEN           0x0004                     // Address Bit Enable
#define   HSPCON0_D7             0x0002                     // Data 7 Bits
#define   HSPCON0_STP2           0x0001                     // Stop Bit Length

//
// UART/HSUART Baud rate Constants (Baud Rate Divisor)
// Baud rate divisor = serial port frequency / (16 * Baud_rate)
//
#define   BAUD300AT20            0x1047                     // Baud rate 300 at 20 Mhz
#define   BAUD600AT20            0x0823                     // Baud rate 600 at 20 Mhz
#define   BAUD1200AT20           0x0412                     // Baud rate 1200 at 20 Mhz
#define   BAUD2400AT20           0x0209                     // Baud rate 2400 at 20 Mhz
#define   BAUD9600AT20           0x0082                     // Baud rate 9600 at 20 Mhz
#define   BAUD19200AT20          0x0041                     // Baud rate 19200 at 20 Mhz
#define   BAUD38400AT20          0x0021                     // Baud rate 38400 at 20 Mhz
#define   BAUD56800AT20          0x0016                     // Baud rate 56800 at 20 Mhz
#define   BAUD113600AT20         0x000b                     // Baud rate 113600 at 20 Mhz

#define   BAUD300AT25            0x1458                     // Baud rate 300 at 25 Mhz
#define   BAUD600AT25            0x0a2c                     // Baud rate 600 at 25 Mhz
#define   BAUD1200AT25           0x0516                     // Baud rate 1200 at 25 Mhz
#define   BAUD2400AT25           0x028b                     // Baud rate 2400 at 25 Mhz
#define   BAUD9600AT25           0x00a3                     // Baud rate 9600 at 25 Mhz
#define   BAUD19200AT25          0x0051                     // Baud rate 19200 at 25 Mhz
#define   BAUD38400AT25          0x0029                     // Baud rate 38400 at 25 Mhz
#define   BAUD56800AT25          0x001c                     // Baud rate 56800 at 25 Mhz
#define   BAUD113600AT25         0x000e                     // Baud rate 113600 at 25 Mhz

#define   BAUD300AT33            0x1adb                     // Baud rate 300 at 33 Mhz
#define   BAUD600AT33            0x0d6e                     // Baud rate 600 at 33 Mhz
#define   BAUD1200AT33           0x06b7                     // Baud rate 1200 at 33 Mhz
#define   BAUD2400AT33           0x035b                     // Baud rate 2400 at 33 Mhz
#define   BAUD9600AT33           0x00d7                     // Baud rate 9600 at 33 Mhz
#define   BAUD19200AT33          0x006b                     // Baud rate 19200 at 33 Mhz
#define   BAUD38400AT33          0x0036                     // Baud rate 38400 at 33 Mhz
#define   BAUD56800AT33          0x0024                     // Baud rate 56800 at 33 Mhz
#define   BAUD113600AT33         0x0012                     // Baud rate 113600 at 33 Mhz

#define   BAUD300AT40            0x208d                     // Baud rate 300 at 40 Mhz
#define   BAUD600AT40            0x1047                     // Baud rate 600 at 40 Mhz
#define   BAUD1200AT40           0x0823                     // Baud rate 1200 at 40 Mhz
#define   BAUD2400AT40           0x0412                     // Baud rate 2400 at 40 Mhz
#define   BAUD9600AT40           0x0104                     // Baud rate 9600 at 40 Mhz
#define   BAUD19200AT40          0x0082                     // Baud rate 19200 at 40 Mhz
#define   BAUD38400AT40          0x0041                     // Baud rate 38400 at 40 Mhz
#define   BAUD56800AT40          0x002c                     // Baud rate 56800 at 40 Mhz
#define   BAUD113600AT40         0x0016                     // Baud rate 113600 at 40 Mhz

#define   BAUD300AT50            0x20b1                     // Baud rate 300 at 50 Mhz
#define   BAUD600AT50            0x1458                     // Baud rate 600 at 50 Mhz
#define   BAUD1200AT50           0x0a2c                     // Baud rate 1200 at 50 Mhz
#define   BAUD2400AT50           0x0516                     // Baud rate 2400 at 50 Mhz
#define   BAUD9600AT50           0x0146                     // Baud rate 9600 at 50 Mhz
#define   BAUD19200AT50          0x00a3                     // Baud rate 19200 at 50 Mhz
#define   BAUD38400AT50          0x0051                     // Baud rate 38400 at 50 Mhz
#define   BAUD56800AT50          0x0037                     // Baud rate 56800 at 50 Mhz
#define   BAUD113600AT50         0x001c                     // Baud rate 113600 at 50 Mhz

//
// USB A Endpoint Definition Register #3         (AEPDEF3 - offset 022E hex) Bits
// USB B Endpoint Definition Register #3         (BEPDEF3 - offset 023E hex) Bits
// USB C Endpoint Definition Register #3         (CEPDEF3 - offset 024E hex) Bits
// USB D Endpoint Definition Register #3         (DEPDEF3 - offset 025E hex) Bits
//
#define UEPDEF3_AUTO_RATE_EN     0x2000                     // Auto Rate Control Enable
#define UEPDEF3_INT_MASK_MASK    0x1f00                     // Interrupt Mask
#define UEPDEF3_MODE_NON_DMA     0x0000                     // Transfer Mode - Non DMA
#define UEPDEF3_MODE_GPDMA       0x0040                     // Transfer Mode - GPDMA w/o Terminal Count
#define UEPDEF3_MODE_GPDMA_TC    0x0060                     // Transfer Mode - GPDMA with Terminal Count
#define UEPDEF3_MODE_SDMA        0x0080                     // Transfer Mode - SmartDMA w/o Stored Status
#define UEPDEF3_MODE_SDMA_STAT   0x0090                     // Transfer Mode - SmartDMA with Stored Status
#define UEPDEF3_MODE_MASK        0x00e0                     // Transfer Mode Bit Mask
#define UEPDEF3_STOP_MASK_MASK   0x001f                     // Stop Mask Bit Mask

//
// USB A Endpoint Definition Register #2         (AEPDEF2 - offset 022C hex) Bits
// USB B Endpoint Definition Register #2         (BEPDEF2 - offset 023C hex) Bits
// USB C Endpoint Definition Register #2         (CEPDEF2 - offset 024C hex) Bits
// USB D Endpoint Definition Register #2         (DEPDEF2 - offset 025C hex) Bits
//
#define UEPDEF2_FIFO_SIZE_8      0x0000                     // FIFO Size 8 bytes deep
#define UEPDEF2_FIFO_SIZE_16     0x0200                     // FIFO Size 16 bytes deep
#define UEPDEF2_FIFO_SIZE_32     0x0400                     // FIFO Size 32 bytes deep
#define UEPDEF2_FIFO_SIZE_64     0x0600                     // FIFO Size 64 bytes deep
#define UEPDEF2_FIFO_SIZE_MASK   UEPDEF2_FIFO_SIZE_64       // FIFO Size Bit Mask
#define UEPDEF2_EP_MX_PCT_MASK   0x03ff                     // Endpoint Max Packet Bit Mask

//
// USB A Endpoint Definition Register #1         (AEPDEF1 - offset 022A hex) Bits
// USB B Endpoint Definition Register #1         (BEPDEF1 - offset 023A hex) Bits
// USB C Endpoint Definition Register #1         (CEPDEF1 - offset 024A hex) Bits
// USB D Endpoint Definition Register #1         (DEPDEF1 - offset 025A hex) Bits
//
#define UEPDEF1_EP_NUM_MASK      0xf000                     // USB Endpoint Number Bit Mask
#define UEPDEF1_EP_CFG_0         0x0000                     // USB Endpoint Configuration - 0
#define UEPDEF1_EP_CFG_1         0x0400                     // USB Endpoint Configuration - 1
#define UEPDEF1_EP_CFG_2         0x0800                     // USB Endpoint Configuration - 2
#define UEPDEF1_EP_CFG_3         0x0c00                     // USB Endpoint Configuration - 3
#define UEPDEF1_EP_CFG_MASK      UEPDEF1_EP_CFG_3           // USB Endpoint Configuration Bit Mask
#define UEPDEF1_EP_INT_0         0x0000                     // USB Endpoint Interface - 0
#define UEPDEF1_EP_INT_1         0x0080                     // USB Endpoint Interface - 1
#define UEPDEF1_EP_INT_2         0x0100                     // USB Endpoint Interface - 2
#define UEPDEF1_EP_INT_3         0x0180                     // USB Endpoint Interface - 3
#define UEPDEF1_EP_INT_MASK      UEPDEF1_EP_INT_3           // USB Endpoint Interface Bit Mask
#define UEPDEF1_EP_ASET_0        0x0000                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_1        0x0008                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_2        0x0010                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_3        0x0018                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_4        0x0020                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_5        0x0028                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_6        0x0030                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_7        0x0038                     // USB Alternate Setting - 0
#define UEPDEF1_EP_ASET_MASK     UEPDEF1_EP_ASET_7          // USB Alternate Setting Bit Mask
#define UEPDEF1_EP_DIR_IN        0x0000                     // USB Direction - IN (to the host)
#define UEPDEF1_EP_DIR_OUT       0x0001                     // USB Direction - OUT (from the host)
#define UEPDEF1_EP_DIR_MASK      UEPDEF1_EP_DIR_OUT         // USB Direction Bit Mask
#define UEPDEF1_EP_TYPE_CNT      0x0000                     // USB Endpoint Type - Control
#define UEPDEF1_EP_TYPE_ISOC     0x0001                     // USB Endpoint Type - Isocronous
#define UEPDEF1_EP_TYPE_BULK     0x0002                     // USB Endpoint Type - Bulk
#define UEPDEF1_EP_TYPE_INT      0x0003                     // USB Endpoint Type - Interrupt
#define UEPDEF1_EP_TYPE_MASK     UEPDEF1_EP_TYPE_INT        // USB Endpoint Type Bit Mask

//
// USB A Endpoint Control/Status Register         (AEPCTL - offset 0220 hex) Bits
// USB B Endpoint Control/Status Register         (BEPCTL - offset 0230 hex) Bits
// USB C Endpoint Control/Status Register         (CEPCTL - offset 0240 hex) Bits
// USB D Endpoint Control/Status Register         (DEPCTL - offset 0250 hex) Bits
//
#define UEPCTL_EP_EN             0x8000                     // Endpoint Enable
#define UEPCTL_EP_NOT_STALLED    0x4000                     // Endpoint is not Stalled
#define UEPCTL_NOT_FLUSH         0x2000                     // Endpoint Buffer is not Flushed
#define UEPCTL_ACT_REQ           0x1000                     // Endpoint Buffer Action Required
#define UEPCTL_STAT_INT          0x0800                     // Endpoint Status Interrupt
#define UEPCTL_NOT_ZERO          0x0200                     // Not Zero Length Packet
#define UEPCTL_NOT_LAST_BYTE     0x0100                     // Not Last Byte of Packet
#define UEPCTL_ISO_START         0x0040                     // Isocronous Packet Transfer Has Started
#define UEPCTL_ISO_STOP          0x0020                     // Isocronous Packet Transfer Has Ended
#define UEPCTL_ISO_MS            0x0010                     // Isocronous Packet Missed
#define UEPCTL_FULL_PKT          0x0008                     // Full Data Packet Received
#define UEPCTL_SHOR_PKT          0x0004                     // Short Data Packet Received
#define UEPCTL_BUF_ERR           0x0002                     // Buffer Error
#define UEPCTL_OTHER_ERR         0x0001                     // Other Error

//
// USB Interrupt Endpoint Definition Register #2 (IEDEF2 - offset 021C hex) Bits
//
#define UIEPDEF2_FIFO_SIZE_MASK  UEPDEF2_FIFO_SIZE_MASK     // FIFO Size Bit Mask  
#define UIEDEF2_EP_MX_PCT_MASK   UEPDEF2_EP_MX_PCT_MASK     // Endpoint Max Packet Bit Mask

//
// USB Interrupt Endpoint Definition Register #1 (IEDEF1 - offset 021A hex) Bits
//
#define UIEPDEF1_EP_NUM_MASK     UEPDEF1_EP_NUM_MASK       // USB Endpoint Number Bit Mask
#define UIEPDEF1_EP_CFG_0        UEPDEF1_EP_CFG_0          // USB Endpoint Configuration - 0
#define UIEPDEF1_EP_CFG_1        UEPDEF1_EP_CFG_1          // USB Endpoint Configuration - 1
#define UIEPDEF1_EP_CFG_2        UEPDEF1_EP_CFG_2          // USB Endpoint Configuration - 2
#define UIEPDEF1_EP_CFG_3        UEPDEF1_EP_CFG_3          // USB Endpoint Configuration - 3
#define UIEPDEF1_EP_CFG_MASK     UEPDEF1_EP_CFG_MASK       // USB Endpoint Configuration Bit Mask
#define UIEPDEF1_EP_INT_0        UEPDEF1_EP_INT_0          // USB Endpoint Interface - 0
#define UIEPDEF1_EP_INT_1        UEPDEF1_EP_INT_1          // USB Endpoint Interface - 1
#define UIEPDEF1_EP_INT_2        UEPDEF1_EP_INT_2          // USB Endpoint Interface - 2
#define UIEPDEF1_EP_INT_3        UEPDEF1_EP_INT_3          // USB Endpoint Interface - 3
#define UIEPDEF1_EP_INT_MASK     UEPDEF1_EP_INT_MASK       // USB Endpoint Interface Bit Mask
#define UIEPDEF1_EP_ASET_0       UEPDEF1_EP_ASET_0         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_1       UEPDEF1_EP_ASET_1         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_2       UEPDEF1_EP_ASET_2         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_3       UEPDEF1_EP_ASET_3         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_4       UEPDEF1_EP_ASET_4         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_5       UEPDEF1_EP_ASET_5         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_6       UEPDEF1_EP_ASET_6         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_7       UEPDEF1_EP_ASET_7         // USB Alternate Setting - 0
#define UIEPDEF1_EP_ASET_MASK    UEPDEF1_EP_ASET_MASK      // USB Alternate Setting Bit Mask
#define UIEPDEF1_EP_DIR_MASK     UEPDEF1_EP_DIR_MASK       // USB Direction Bit Mask
#define UIEPDEF1_EP_TYPE_MASK    UEPDEF1_EP_TYPE_MASK      // USB Endpoint Type Bit Mask

//
// USB Interrupt Endpoint Control/Status Register (IEPCTL - offset 0210 hex) Bits
//
#define UIEPCTL_EP_EN            UEPCTL_EP_EN              // Endpoint Enable
#define UIEPCTL_EP_NOT_STALLED   UEPCTL_EP_NOT_STALLED     // Endpoint is not Stalled
#define UIEPCTL_NOT_FLUSH        UEPCTL_NOT_FLUSH          // Endpoint Buffer is not Flushed
#define UIEPCTL_ACT_REQ          UEPCTL_ACT_REQ            // Endpoint Buffer Action Required

//
// USB Control Endpoint Definition Register #2  (CNTCTL - offset 020A hex) Bits
//
#define UCNTPDEF2_FIFO_SIZE_MASK UEPDEF2_FIFO_SIZE_MASK    // FIFO Size Bit Mask     
#define UCNTDEF2_EP_MX_PCT_MASK  UEPDEF2_EP_MX_PCT_MASK    // Endpoint Max Packet Bit Mask

//
// USB Control Endpoint Definition Register #1  (CNTCTL - offset 020A hex) Bits
//
#define UCNTDEF1_EP_NUM_MASK     UEPDEF1_EP_NUM_MASK       // USB Endpoint Number Bit Mask
#define UCNTDEF1_EP_CFG_MASK     UEPDEF1_EP_CFG_MASK       // USB Endpoint Configuration Bit Mask
#define UCNTDEF1_EP_INT_MASK     UEPDEF1_EP_INT_MASK       // USB Endpoint Interface Bit Mask
#define UCNTDEF1_EP_ASET_MASK    UEPDEF1_EP_ASET_MASK      // USB Alternate Setting Bit Mask
#define UCNTDEF1_EP_DIR_MASK     UEPDEF1_EP_DIR_MASK       // USB Direction Bit Mask
#define UCNTDEF1_EP_TYPE_MASK    UEPDEF1_EP_TYPE_MASK      // USB Endpoint Type Bit Mask

//
// USB Control Endpoint Control/Status Register   (CNTCTL - offset 0200 hex) Bits
//
#define UCNTCTL_EP_EN            UEPCTL_EP_EN             // Endpoint Enable
#define UCNTCTL_EP_NOT_STALLED   UEPCTL_EP_NOT_STALLED    // Endpoint is not Stalled    
#define UCNTCTL_NOT_FLUSH        UEPCTL_NOT_FLUSH         // Endpoint Buffer is not Flushed
#define UCNTCTL_ACT_REQ          UEPCTL_ACT_REQ           // Endpoint Buffer Action Required
#define UCNTCTL_NEW_COMMAND      0x0800                   // New Command Received Status
#define UCNTCTL_COMMAND_BUSY     0x0400                   // Current Command Busy Status

//
// USB Isocronous Syncronization Control Register (UISCTL - offset 01f0 hex) Bits
//
#define ISCTL_ESOF_EN            0x8000                   // External SOF Enable

//
// USB Device Miscellaneous Functions Register (USBMFR - offset 01E8 hex) Bits
//
#define USBMFR_PUP_XCVER         0x0040                   // Power Up Transceiver 
#define USBMRF_SUSP              0x0020                   // USB Bus Suspend Status 
#define USBMFR_S_RES             0x0010                   // USB Hardware Soft Reset
#define USBMFR_S_POWER           0x0008                   // Self Powered USB Device 
#define USBMFR_DIS_XCVER         0x0004                   // Disable USB Transceiver
#define USBMFR_RWAKE             0x0002                   // USB Remote Wakeup
#define USBMFR_RWAKE_EN          0x0001                   // USB Remote Wakeup Enable

//
// USB Interrupt Status Register #2 (UISTAT2 - offset 01E4 hex) Bits
//
#define UISTAT2_USB_RST          0x8000                   // USB Bus Reset 
#define UISTAT2_USB_SUS          0x4000                   // USB Bus Suspended
#define UISTAT2_USB_RES          0x2000                   // USB Bus Resume
#define UISTAT2_TSTMP_M          0x0008                   // USB Timestamp Match
#define UISTAT2_POS_UP           0x0004                   // Position Update
#define UISTAT2_SOF_GEN          0x0002                   // Start of Frame Generated
#define UISTAT2_MS_SOF           0x0001                   // Missed Start of Frame Packet

//
// USB Interrupt Mask Register #2 (UIMASK2 - offset 01E6 hex) Bits
//
#define UIMASK2_USB_RST          UISTAT2_USB_RST          // USB Bus Reset
#define UIMASK2_USB_SUS          UISTAT2_USB_SUS          // USB Bus Suspended
#define UIMASK2_USB_RES          UISTAT2_USB_RES          // USB Bus Resume
#define UIMASK2_TSTMP_M          UISTAT2_TSTMP_M          // USB Timestamp Match
#define UIMASK2_POS_UP           UISTAT2_POS_UP           // Position Update
#define UIMASK2_SOF_GEN          UISTAT2_SOF_GEN          // Start of Frame Generated
#define UIMASK2_MS_SOF           UISTAT2_MS_SOF           // Missed Start of Frame Packet

//
// USB Interrupt Status Register #1 (UISTAT1 - offset 01E0 hex) Bits
//
#define UISTAT1_D_EP_STATINT     0x0800                   // Endpoint D Status Interrupt Set
#define UISTAT1_D_EP_ACT         0x0400                   // Endpoint D Action Requires Bit Set
#define UISTAT1_C_EP_STATINT     0x0200                   // Endpoint C Status Interrupt Set
#define UISTAT1_C_EP_ACT         0x0100                   // Endpoint C Action Requires Bit Set
#define UISTAT1_B_EP_STATINT     0x0080                   // Endpoint B Status Interrupt Set
#define UISTAT1_B_EP_ACT         0x0040                   // Endpoint B Action Requires Bit Set
#define UISTAT1_A_EP_STATINT     0x0020                   // Endpoint A Status Interrupt Set
#define UISTAT1_A_EP_ACT         0x0010                   // Endpoint A Action Requires Bit Set
#define UISTAT1_OTHER_INT        0x0008                   // Other Interrupt Sources Have Been Set
#define UISTAT1_INT_EP_ACT       0x0004                   // Interrupt Endpoint Action Required
#define UISTAT1_CNT_EP_NEW       0x0002                   // Control Endpoint New Command Bit Set
#define UISTAT1_CNT_EP_ACT       0x0001                   // Control Endpoint Action Required Bit Set

//
// USB Interrupt Mask Register #1 (UIMASK1 - offset 01E2 hex) Bits
//
#define UIMASK1_D_EP_STATINT     UISTAT1_D_EP_STATINT     // Endpoint D Status Interrupt Set
#define UIMASK1_D_EP_ACT         UISTAT1_D_EP_ACT         // Endpoint D Action Requires Bit Set
#define UIMASK1_C_EP_STATINT     UISTAT1_C_EP_STATINT     // Endpoint C Status Interrupt Set
#define UIMASK1_C_EP_ACT         UISTAT1_C_EP_ACT         // Endpoint C Action Requires Bit Set
#define UIMASK1_B_EP_STATINT     UISTAT1_B_EP_STATINT     // Endpoint B Status Interrupt Set
#define UIMASK1_B_EP_ACT         UISTAT1_B_EP_ACT         // Endpoint B Action Requires Bit Set
#define UIMASK1_A_EP_STATINT     UISTAT1_A_EP_STATINT     // Endpoint A Status Interrupt Set
#define UIMASK1_A_EP_ACT         UISTAT1_A_EP_ACT         // Endpoint A Action Requires Bit Set
#define UIMASK1_OTHER_INT        UISTAT1_OTHER_INT        // Other Interrupt Sources Have Been Set
#define UIMASK1_INT_EP_ACT       UISTAT1_INT_EP_ACT       // Interrupt Endpoint Action Required
#define UIMASK1_CNT_EP_NEW       UISTAT1_CNT_EP_NEW       // Control Endpoint New Command Bit Set
#define UIMASK1_CNT_EP_ACT       UISTAT1_CNT_EP_ACT       // Control Endpoint Action Required Bit Set

//
// SmartDMA3 Status Register (SD3STAT - offset 0192 hex) Bits
// SmartDMA2 Status Register (SD2STAT - offset 017A hex) Bits
// SmartDMA1 Status Register (SD1STAT - offset 0162 hex) Bits
// SmartDMA0 Status Register (SD0STAT - offset 014A hex) Bits
//
#define   SDSTAT_TEP             0x2000                     // Transmit End-of-Packet
#define   SDSTAT_TBU             0x1000                     // Transmit Buffer Unavailable
#define   SDSTAT_TTC             0x0800                     // Transmit Terminal Count
#define   SDSTAT_REP             0x0400                     // Receive End-of-Packet
#define   SDSTAT_RBU             0x0200                     // Receive Buffer Unavailable
#define   SDSTAT_RTC             0x0100                     // Receive Terminal Count

//
// SmartDMA3 Receive Ring Count / Address Low Register (SD3RRCAL - offset 018E hex) Bits
// SmartDMA2 Receive Ring Count / Address Low Register (SD2RRCAL - offset 0176 hex) Bits
// SmartDMA1 Receive Ring Count / Address Low Register (SD1RRCAL - offset 015E hex) Bits
// SmartDMA0 Receive Ring Count / Address Low Register (SD0RRCAL - offset 0146 hex) Bits
//
#define   SDRRCAL_RRC_1          0x0000                     // SmartDMA Receive Ring Count = 1
#define   SDRRCAL_RRC_2          0x0001                     // SmartDMA Receive Ring Count = 2
#define   SDRRCAL_RRC_4          0x0002                     // SmartDMA Receive Ring Count = 4
#define   SDRRCAL_RRC_8          0x0003                     // SmartDMA Receive Ring Count = 8
#define   SDRRCAL_RRC_16         0x0004                     // SmartDMA Receive Ring Count = 16
#define   SDRRCAL_RRC_32         0x0005                     // SmartDMA Receive Ring Count = 32
#define   SDRRCAL_RRC_64         0x0006                     // SmartDMA Receive Ring Count = 64
#define   SDRRCAL_RRC_128        0x0007                     // SmartDMA Receive Ring Count = 128

//
// SmartDMA3 Transmit Ring Count / Address Low Register (SD3TRCAL - offset 018A hex) Bits
// SmartDMA2 Transmit Ring Count / Address Low Register (SD2TRCAL - offset 0172 hex) Bits
// SmartDMA1 Transmit Ring Count / Address Low Register (SD1TRCAL - offset 015A hex) Bits
// SmartDMA0 Transmit Ring Count / Address Low Register (SD0TRCAL - offset 0142 hex) Bits
//
#define   SDTRCAL_TRC_1          0x0000                     // SmartDMA Transmit Ring Count = 1
#define   SDTRCAL_TRC_2          0x0001                     // SmartDMA Transmit Ring Count = 2
#define   SDTRCAL_TRC_4          0x0002                     // SmartDMA Transmit Ring Count = 4
#define   SDTRCAL_TRC_8          0x0003                     // SmartDMA Transmit Ring Count = 8
#define   SDTRCAL_TRC_16         0x0004                     // SmartDMA Transmit Ring Count = 16
#define   SDTRCAL_TRC_32         0x0005                     // SmartDMA Transmit Ring Count = 32
#define   SDTRCAL_TRC_64         0x0006                     // SmartDMA Transmit Ring Count = 64
#define   SDTRCAL_TRC_128        0x0007                     // SmartDMA Transmit Ring Count = 12

//
// SmartDMA3 Control Register (SD3CON - offset 0188 hex) Bits
// SmartDMA2 Control Register (SD2CON - offset 0170 hex) Bits
// SmartDMA1 Control Register (SD1CON - offset 0158 hex) Bits
// SmartDMA0 Control Register (SD0CON - offset 0140 hex) Bits
//
#define   SDCON_TEPI             0x2000                     // Transmit End-of-Packet Interrupt
#define   SDCON_TBUI             0x1000                     // Transmit Buffer Unavailable Interrupt
#define   SDCON_TTCI             0x0800                     // Transmit Terminal Count Interrupt 
#define   SDCON_REPI             0x0400                     // Receive End-of-Packet Interrupt
#define   SDCON_RBUI             0x0200                     // Receive Buffer Unavailable Interrupt
#define   SDCON_RTCI             0x0100                     // Receive Terminal Count Interrupt
#define   SDCON_TXSO_SDMA_NCO    0x0080                     // SDMA will not clear OWN bit when it finishes the current transmit buffer
// (Available with SD2CON and SD3CON only) 
#define   SDCON_TXSO_SDMA_CO     0x0000                     // SDMA will clear OWN bit when it finishes the current transmit buffer
// (Available with SD2CON and SD3CON only) 
#define   SDCON_RXSO_SDMA_NCO    0x0040                     // SDMA will not clear OWN bit when it finishes the current receive buffer
// (Available with SD2CON and SD3CON only) 
#define   SDCON_RXSO_SDMA_CO     0x0000                     // SDMA will clear OWN bit when it finishes the current receive buffer
// (Available with SD2CON and SD3CON only) 
#define   SDCON_P_LOW            0x0000                     // Relative Priority = Low
#define   SDCON_P_MED            0x0010                     // Relative Priority = Medium
#define   SDCON_P_HIGH           0x0020                     // Relative Priority = High
#define   SDCON_POLL             0x0008                     // Forced Poll
#define   SDCON_DSEL_USB         0x0004                     // Requesting Source Select = USB (available with SD2CON and SD3CON only)
#define   SDCON_DSEL_HDLC        0x0000                     // Requesting Source Select = HDLC (available with SD2CON and SD3CON only) 
#define   SDCON_TXST             0x0002                     // Start SmartDMA Transmit channel
#define   SDCON_TXSTOP           0x0000                     // Stop SmartDMA Transmit channel
#define   SDCON_RXST             0x0001                     // Start SmartDMA Receive channel
#define   SDCON_RXSTOP           0x0000                     // Stop SmartDMA Receive channel

//
// General Purpose DMA3 Control 1 Register (GD3CON1 - offset 0132 hex) Bits
// General Purpose DMA2 Control 1 Register (GD2CON1 - offset 0122 hex) Bits
// General Purpose DMA1 Control 1 Register (GD1CON1 - offset 0112 hex) Bits
// General Purpose DMA0 Control 1 Register (GD0CON1 - offset 0102 hex) Bits
//
#define   GDCON1_SIO             0x0000                     // Source address is in I/O space
#define   GDCON1_SM              0x8000                     // Source address is in memory space
#define   GDCON1_SAW_NWRAP       0x0000                     // Source address Wrap is normal.  No wrap
#define   GDCON1_SAW_1K          0x1000                     // Source Wrap Address is a 1K circular buffer on a 1K boundary
#define   GDCON1_SAW_2K          0x2000                     // Source Wrap Address is a 2K circular buffer on a 2K boundary
#define   GDCON1_SAW_4K          0x3000                     // Source Wrap Address is a 4K circular buffer on a 4K boundary
#define   GDCON1_SAW_8K          0x4000                     // Source Wrap Address is a 8K circular buffer on a 8K boundary
#define   GDCON1_SAW_16K         0x5000                     // Source Wrap Address is a 16K circular buffer on a 16K boundary
#define   GDCON1_SAW_32K         0x6000                     // Source Wrap Address is a 32K circular buffer on a 32K boundary
#define   GDCON1_SAW_64K         0x7000                     // Source Wrap Address is a 64K circular buffer on a 64K boundary
#define   GDCON1_SINC_NONE       0x0000                     // No source increment/decrement
#define   GDCON1_SINC_1B         0x0100                     // Source increment by 1 byte
#define   GDCON1_SINC_2B         0x0200                     // Source increment by 2 bytes
#define   GDCON1_SDEC_1B         0x0f00                     // Source decrement by 1 byte
#define   GDCON1_SDEC_2B         0x0e00                     // Source decrement by 2 bytes
#define   GDCON1_DIO             0x0000                     // Destination is in I/O space
#define   GDCON1_DM              0x0080                     // Destination is in memory space
#define   GDCON1_DAW_NWRAP       0x0000                     // Destination Address Wrap is normal.  No wrap
#define   GDCON1_DAW_1K          0x0010                     // Destination Address is a 1K circular buffer on a 1K boundary
#define   GDCON1_DAW_2K          0x0020                     // Destination Address is a 2K circular buffer on a 2K boundary
#define   GDCON1_DAW_4K          0x0030                     // Destination Address is a 4K circular buffer on a 4K boundary
#define   GDCON1_DAW_8K          0x0040                     // Destination Address is a 8K circular buffer on a 8K boundary
#define   GDCON1_DAW_16K         0x0050                     // Destination Address is a 16K circular buffer on a 16K boundary
#define   GDCON1_DAW_32K         0x0060                     // Destination Address is a 32K circular buffer on a 32K boundary
#define   GDCON1_DAW_64K         0x0070                     // Destination Address is a 64K circular buffer on a 64K boundary
#define   GDCON1_DINC_NONE       0x0000                     // No destination increment/decrement
#define   GDCON1_DINC_1B         0x0001                     // Destination Increment by 1 byte
#define   GDCON1_DINC_2B         0x0002                     // Destination Increment by 2 bytes
#define   GDCON1_DDEC_1B         0x000f                     // Destination Decrement by 1 byte
#define   GDCON1_DDEC_2B         0x000e                     // Destination Decrement by 2 bytes

//
// General Purpose DMA3 Control 0 Register (GD3CON0 - offset 0130 hex) Bits
// General Purpose DMA2 Control 0 Register (GD2CON0 - offset 0120 hex) Bits
// General Purpose DMA1 Control 0 Register (GD1CON0 - offset 0110 hex) Bits
// General Purpose DMA0 Control 0 Register (GD0CON0 - offset 0100 hex) Bits
//
#define   GDCON0_ST              0x8000                     // Start/Stop DMA Channel
#define   GDCON0_AST             0x4000                     // Auto Start
#define   GDCON0_TC              0x2000                     // Terminal Count
#define   GDCON0_INT             0x1000                     // Interrupt
#define   GDCON0_P_LOW           0x0000                     // Relative Priority = Low
#define   GDCON0_P_MED           0x0100                     // Relative Priority = Medium
#define   GDCON0_P_HIGH          0x0200                     // Relative Priority = High
#define   GDCON0_TS_B            0x0000                     // Select byte transfer
#define   GDCON0_TS_W            0x0040                     // Select word transfer
#define   GDCON0_DSEL_UNSYN      0x0000                     // Unsynchronized
#define   GDCON0_DSEL_TMR2_SSYN  0x0002                     // Timer2, source synchronized
#define   GDCON0_DSEL_XDRQ0_SSYN 0x0008                     // External DRQ0, source synchronized
#define   GDCON0_DSEL_XDRQ0_DSYN 0x0009                     // External DRQ0, destination synchronized
#define   GDCON0_DSEL_XDRQ1_SSYN 0x000a                     // External DRQ1, source synchronized
#define   GDCON0_DSEL_XDRQ1_DSYN 0x000b                     // External DRQ1, destination synchronized
#define   GDCON0_DSEL_UART_RX    0x0010                     // UART Receiver
#define   GDCON0_DSEL_UART_TX    0x0011                     // UART Transmitter
#define   GDCON0_DSEL_HSUART_RX  0x0012                     // HS UART Receiver
#define   GDCON0_DSEL_HSUART_TX  0x0013                     // HS UART Transmitter
#define   GDCON0_DSEL_UEPA_SSYN  0x0018                     // USB Endpoint A, source synchronized
#define   GDCON0_DSEL_UEPA_DSYN  0x0019                     // USB Endpoint A, destination synchronized
#define   GDCON0_DSEL_UEPB_SSYN  0x001a                     // USB Endpoint B, source synchronized
#define   GDCON0_DSEL_UEPB_DSYN  0x001b                     // USB Endpoint B, destination synchronized
#define   GDCON0_DSEL_UEPC_SSYN  0x001c                     // USB Endpoint C, source synchronized
#define   GDCON0_DSEL_UEPC_DSYN  0x001d                     // USB Endpoint C, destination synchronized
#define   GDCON0_DSEL_UEPD_SSYN  0x001e                     // USB Endpoint D, source synchronized
#define   GDCON0_DSEL_UEPD_DSYN  0x001f                     // USB Endpoint D, destination synchronized

//
// TSA Channel D Configuration Register (TSDCON - offset 02D8 hex) Bits
// TSA Channel C Configuration Register (TSCCON - offset 02D0 hex) Bits
// TSA Channel B Configuration Register (TSBCON - offset 02C8 hex) Bits
// TSA Channel A Configuration Register (TSACON - offset 02C0 hex) Bits
//
#define   TSCON_EN               0x8000                     // TSA channel enable
#define   TSCON_MODE_RAW_DCE     0x0000                     // Channel Mode = Raw DCE
#define   TSCON_MODE_RAW_PCM_HWY 0x0100                     // Channel Mode = Raw PCM highway
#define   TSCON_MODE_MUX_GCI_ON_ 0x0200                     // Channel Mode = GCI/Multiplexed GCI on channel A
#define   TSCON_MODE_MUX_PCM_ON_ 0x0300                     // Channel Mode = Multiplex PCM highway on channel A
#define   TSCON_FSCP             0x0020                     // Channel frame sync pulse polarity detect
#define   TSCON_DRVLVL           0x0010                     // Channel adjust bit drive level
#define   TSCON_ESADJ_0BPSTOP    0x0000                     // Channel end slot bit adjust = No bit after BPSTOP is driven
#define   TSCON_ESADJ_1BPSTOP    0x0001                     // Channel end slot bit adjust = 1 bit after BPSTOP is driven
#define   TSCON_ESADJ_2BPSTOP    0x0002                     // Channel end slot bit adjust = 2 bit after BPSTOP is driven
#define   TSCON_ESADJ_3BPSTOP    0x0003                     // Channel end slot bit adjust = 3 bit after BPSTOP is driven
#define   TSCON_ESADJ_4BPSTOP    0x0004                     // Channel end slot bit adjust = 4 bit after BPSTOP is driven
#define   TSCON_ESADJ_5BPSTOP    0x0005                     // Channel end slot bit adjust = 5 bit after BPSTOP is driven
#define   TSCON_ESADJ_6BPSTOP    0x0006                     // Channel end slot bit adjust = 6 bit after BPSTOP is driven
#define   TSCON_ESADJ_7BPSTOP    0x0007                     // Channel end slot bit adjust = 7 bit after BPSTOP is driven

//
// HDLC Channel D Receive Data Peek (HDRDP - offset 00D8 hex) Bits
// HDLC Channel C Receive Data Peek (HCRDP - offset 0098 hex) Bits
// HDLC Channel B Receive Data Peek (HBRDP - offset 0058 hex) Bits
// HDLC Channel A Receive Data Peek (HARDP - offset 0018 hex) Bits
//
#define   HRDP_STAT1A            HRD_STAT1A                 // Any of the unmasked interrupts in status register 1 are set
#define   HRDP_STAT0A            HRD_STAT0A                 // Any of the unmasked interrupts in status register 0 are set
// (excluding REOF, RTHRES, RDATA1, TTHRES, and TDATA1)
#define   HRDP_STATNUM_0         HRD_STATNUM_0              // REOF and  RDATA1 is not 10 
#define   HRDP_STATNUM_1         HRD_STATNUM_1              // REOF and RDATA1 is 10, and the 1st byte of status is present
#define   HRDP_STATNUM_2         HRD_STATNUM_2              // REOF and RDATA1 is 10, and the 2nd byte of status is present
#define   HRDP_STATNUM_3         HRD_STATNUM_3              // REOF and RDATA1 is 10, and the 3nd byte of status is present
#define   HRDP_RTHRES            HRD_RTHRES                 // Correct data in receive FIFO and there are no status's
#define   HRDP_RDATA1            HRD_RDATA1                 // Receive FIFO has a byte of data available
#define   HRDP_TTHRES            HRD_TTHRES                 // Transmit Threshold
#define   HRDP_TDATA1            HRD_TDATA1                 // Transmit FIFO has room for at least one more byte of data

//
// HDLC Channel D Receive Data (HDRD - offset 00D8 hex) Bits
// HDLC Channel C Receive Data (HCRD - offset 0098 hex) Bits
// HDLC Channel B Receive Data (HBRD - offset 0058 hex) Bits
// HDLC Channel A Receive Data (HARD - offset 0018 hex) Bits
//
#define   HRD_STAT1A             0x8000                     // Any of the unmasked interrupts in status register 1 are set
#define   HRD_STAT0A             0x4000                     // Any of the unmasked interrupts in status register 0 are set 
// (excluding REOF, RTHRES, RDATA1, TTHRES, and TDATA1)
#define   HRD_STATNUM_0          0x0000                     // REOF and  RDATA1 is not 10
#define   HRD_STATNUM_1          0x1000                     // REOF and RDATA1 is 10, and the 1st byte of status is present 
#define   HRD_STATNUM_2          0x2000                     // REOF and RDATA1 is 10, and the 2nd byte of status is present 
#define   HRD_STATNUM_3          0x3000                     // REOF and RDATA1 is 10, and the 3nd byte of status is present 
#define   HRD_RTHRES             0x0800                     // Correct data in receive FIFO and there are no status's
#define   HRD_RDATA1             0x0400                     // Receive FIFO has a byte of data available 
#define   HRD_TTHRES             0x0200                     // Transmit Threshold
#define   HRD_TDATA1             0x0100                     // Transmit FIFO has room for at least one more byte of data

//
// HDLC Channel D Receive Control (HDRCON - offset 00D6 hex) Bits
// HDLC Channel C Receive Control (HCRCON - offset 0096 hex) Bits
// HDLC Channel B Receive Control (HBRCON - offset 0056 hex) Bits
// HDLC Channel A Receive Control (HARCON - offset 0016 hex) Bits
//
#define   HRCON_RTHRSH_1BYTE     0x0000                     // 1 byte free in the Receive FIFO before an INT issue
#define   HRCON_RTHRSH_8BYTE     0x0400                     // 8 bytes free in the Receive FIFO before an INT issue
#define   HRCON_RTHRSH_16BYTE    0x0800                     // 16 bytes free in the Receive FIFO before an INT issue
#define   HRCON_RTHRSH_32BYTE	 0x0C00  		    // 32 bytes free in the Receive FIFO before an INT issue
#define   HRCON_RCPST            0x0200                     // Receive Copy Status
#define   HRCON_RMSBF            0x0100                     // Receive MSB First
#define   HRCON_RXCINV           0x0080                     // Receive Clock Invert
#define   HRCON_RREJECT          0x0040                     // Receiver Reject
#define   HRCON_RSTOP            0x0020                     // Receiver Stop
#define   HRCON_HREN             0x0010                     // Receiver Enable
#define   HRCON_MINRL_2B         0x0002                     // Minimum Receive Length = 2 bytes
#define   HRCON_MINRL_3B         0x0003                     // Minimum Receive Length = 3 bytes
#define   HRCON_MINRL_4B         0x0004                     // Minimum Receive Length = 4 bytes
#define   HRCON_MINRL_5B         0x0005                     // Minimum Receive Length = 5 bytes
#define   HRCON_MINRL_6B         0x0006                     // Minimum Receive Length = 6 bytes
#define   HRCON_MINRL_7B         0x0007                     // Minimum Receive Length = 7 bytes
#define   HRCON_MINRL_8B         0x0008                     // Minimum Receive Length = 8 bytes
#define   HRCON_MINRL_9B         0x0009                     // Minimum Receive Length = 9 bytes
#define   HRCON_MINRL_10B        0x000a                     // Minimum Receive Length = 10 bytes
#define   HRCON_MINRL_11B        0x000b                     // Minimum Receive Length = 11 bytes
#define   HRCON_MINRL_12B        0x000c                     // Minimum Receive Length = 12 bytes
#define   HRCON_MINRL_13B        0x000d                     // Minimum Receive Length = 13 bytes
#define   HRCON_MINRL_14B        0x000e                     // Minimum Receive Length = 14 bytes
#define   HRCON_MINRL_15B        0x000f                     // Minimum Receive Length = 15 bytes

//
// HDLC Channel D Interrupt Status 1 (HDISTAT1 - offset 00D2 hex) Bits
// HDLC Channel C Interrupt Status 1 (HCISTAT1 - offset 0092 hex) Bits
// HDLC Channel B Interrupt Status 1 (HBISTAT1 - offset 0052 hex) Bits
// HDLC Channel A Interrupt Status 1 (HAISTAT1 - offset 0012 hex) Bits
//
#define   HISTAT1_MAMC           0x0200                     // Mismatch Address Max Count
#define   HISTAT1_SFMC           0x0100                     // Short Frame Max Count
#define   HISTAT1_SHORT          0x0080                     // Short Frame Received
#define   HISTAT1_VSHORT         0x0040                     // Very Short frame Received
#define   HISTAT1_RTRDES         0x0020                     // RTR Deasserted
#define   HISTAT1_ROFLO          0x0010                     // Receive Over Flow
#define   HISTAT1_ABORTE         0x0008                     // Abort Entered
#define   HISTAT1_MARKIE         0x0004                     // Mark Idle Entered
#define   HISTAT1_FLAGE          0x0002                     // Flag Entered
#define   HISTAT1_FRAMEE         0x0001                     // Frame Entered

//
// HDLC Channel D Interrupt Status 0 (HDISTAT0 - offset 00CE hex) Bits
// HDLC Channel C Interrupt Status 0 (HCISTAT0 - offset 008E hex) Bits
// HDLC Channel B Interrupt Status 0 (HBISTAT0 - offset 004E hex) Bits
// HDLC Channel A Interrupt Status 0 (HAISTAT0 - offset 000E hex) Bits
//
#define   HISTAT0_REOF           0x1000                     // Receive End of Frame
#define   HISTAT0_RTHRES         0x0800                     // Correct data in receive FIFO and there are no status's
#define   HISTAT0_RDATA1         0x0400                     // Receive FIFO has a byte of data available
#define   HISTAT0_TTHRES         0x0200                     // Transmit Threshold
#define   HISTAT0_TDATA1         0x0100                     // Transmit FIFO has room for at least one more byte of data
#define   HISTAT0_ABRSNT         0x0010                     // Abort Sent
#define   HTFSTAT_CTSLST         0x0008                     // CTS Lost
#define   HTFSTAT_TUFLO          0x0004                     // Transmit Under Flow 
#define   HTFSTAT_TGOODF         0x0002                     // Transmit Good Frame 
#define   HTFSTAT_TSTOP          0x0001                     // Transmit Stop 

//
// HDLC Channel D Status (HDSTATE - offset 00CA hex) Bits
// HDLC Channel C Status (HCSTATE - offset 008A hex) Bits
// HDLC Channel B Status (HBSTATE - offset 004A hex) Bits
// HDLC Channel A Status (HASTATE - offset 000A hex) Bits
//
#define   HSTATE_CTSS            0x0020                     // CTS State
#define   HSTATE_RTRS            0x0010                     // RTR State
#define   HSTATE_ABORTS          0x0008                     // Abort State
#define   HSTATE_MARKIS          0x0004                     // Mark Idle State
#define   HSTATE_FLAGS           0x0002                     // Flag State
#define   HSTATE_FRAMES          0x0001                     // Frame State

//
// HDLC Channel D Transmit Control 1 (HDTCON1 - offset 00C4 hex) Bits
// HDLC Channel C Transmit Control 1 (HCTCON1 - offset 0084 hex) Bits
// HDLC Channel B Transmit Control 1 (HBTCON1 - offset 0044 hex) Bits
// HDLC Channel A Transmit Control 1 (HATCON1 - offset 0004 hex) Bits
//
#define   HTCON1_FLAGIDL         0x0800                     // Flag Idle
#define   HTCON1_MLTDRP          0x0400                     // Multidrop
#define   HTCON1_AUTOCTS         0x0200                     // Automatic CTS
#define   HTCON1_TMSBF           0x0100                     // Transmit MSB First
#define   HTCON1_TXCINV          0x0080                     // Transmit Clock Invert
#define   HTCON1_GCIDEN          0x0040                     // GCI D Channel Enable
#define   HTCON1_ODRV_TRI        0x0000                     // Ouput Drive = Three state
#define   HTCON1_ODRV_T_OR_N     0x0010                     // Ouput Drive = Totem pole or normal drive
#define   HTCON1_ODRV_NORMAL	 0x0010  		    // enable Totem pole Output Drive
#define   HTCON1_ODRV_OPEN       0x0020                     // Ouput Drive = Open drain
#define   HTCON1_TDELAY_0_ONE    0x0000                     // Output Drive = Do not wait
#define   HTCON1_TDELAY_1_ONE    0x0001                     // Output Drive = Wait for 1 one
#define   HTCON1_TDELAY_2_ONES   0x0002                     // Output Drive = Wait for 2 ones
#define   HTCON1_TDELAY_3_ONES   0x0003                     // Output Drive = Wait for 3 ones
#define   HTCON1_TDELAY_4_ONES   0x0004                     // Output Drive = Wait for 4 ones
#define   HTCON1_TDELAY_5_ONES   0x0005                     // Output Drive = Wait for 5 ones
#define   HTCON1_TDELAY_6_ONES   0x0006                     // Output Drive = Wait for 6 ones
#define   HTCON1_TDELAY_7_ONES   0x0007                     // Output Drive = Wait for 7 ones
#define   HTCON1_TDELAY_8_ONES   0x0008                     // Output Drive = Wait for 8 ones
#define   HTCON1_TDELAY_9_ONES   0x0009                     // Output Drive = Wait for 9 ones
#define   HTCON1_TDELAY_10_ONES  0x000a                     // Output Drive = Wait for 10 ones
#define   HTCON1_TDELAY_11_ONES  0x000b                     // Output Drive = Wait for 11 ones
#define   HTCON1_TDELAY_12_ONES  0x000c                     // Output Drive = Wait for 12 ones
#define   HTCON1_TDELAY_13_ONES  0x000d                     // Output Drive = Wait for 13 ones
#define   HTCON1_TDELAY_14_ONES  0x000e                     // Output Drive = Wait for 14 ones
#define   HTCON1_TDELAY_15_ONES  0x000f                     // Output Drive = Wait for 15 ones

//
// HDLC Channel D Transmit Control0 (HDTCON0 - offset 00C2 hex) Bits
// HDLC Channel C Transmit Control0 (HCTCON0 - offset 0082 hex) Bits
// HDLC Channel B Transmit Control0 (HBTCON0 - offset 0042 hex) Bits
// HDLC Channel A Transmit Control0 (HATCON0 - offset 0002 hex) Bits
//
#define   HTCON0_TTHRSH_1BYTE    0x0000                     // 1 byte free in the transmit FIFO before INT issue
#define   HTCON0_TTHRSH_8BYTE    0x0400                     // 8 bytes free in the transmit FIFO before INT issue
#define   HTCON0_TTHRSH_16BYTE   0x0800                     // 16 bytes free in the transmit FIFO before INT issue
#define   HTCON0_TFIFOEN         0x0040                     // Transmit FIFO Enable
#define   HTCON0_FORABR          0x0020                     // Force Abort
#define   HTCON0_HTEN            0x0010                     // Transmit Enable
#define   HTCON0_IMSTART         0x0008                     // Immediate Start
#define   HTCON0_CRCDIS          0x0004                     // CRC Disable
#define   HTCON0_LBREAD          0x0002                     // Last byte written to the transmit FIFO is last byte in frame
#define   HTCON0_LBNOW           0x0001                     // Last byte has been put in transmit FIFO

//
// HDLC Channel D Control (HDCON - offset 00C0 hex) Bits
// HDLC Channel C Control (HCCON - offset 0080 hex) Bits
// HDLC Channel B Control (HBCON - offset 0040 hex) Bits
// HDLC Channel A Control (HACON - offset 0000 hex) Bits
//
#define   HCON_HRESET            0x0080                     // HDLC Reset
#define   HCON_NRZI              0x0020                     // Non-Return to Zero Invert
#define   HCON_TRANSM            0x0010                     // Transparent Mode
#define   HCON_LOOPR             0x0008                     // Loop Remote
#define   HCON_LOOPL             0x0004                     // Loop Local
#define   HCON_CRC_CCITT         0x0000                     // CRC Type = CRC-CCITT
#define   HCON_CRC_16BIT         0x0001                     // CRC Type = CRC-16BIT
#define   HCON_CRC_32BIT         0x0002                     // CRC Type = CRC-32BIT

// HDLC  Receive Frame Status 1,2, 3   Bits
//  These are either included in the data stream, or read from HxRD after packet
//  reception is complete.
//
#define   HXRFS_FRAM             0x0080                     // Framing Error
#define   HXRFS_FOFLO            0x0040                     // Frame Overflow
#define   HXRFS_CRCE             0x0020                     // CRC Error
#define   HXRFS_MTCH             0x0018                     // Address Match
#define   HXRFS_FABORT           0x0004                     // Frame Aborted
#define   HXRFS_FLONG            0x0002                     // Frame Too Long
#define   HXRFS_FSHORT           0x0001                     // Frame Too Short

//
// -----------------------------------------------------------------------------
// Am186CC BUFFER DESCRIPTORS NMEMONICS 
// -----------------------------------------------------------------------------
//

//
// SmartDMA Transmit Descriptor (word 1)
//
#define   SDMA_TXBD_OWN_SET      0x8000                     // Receive Transmit Descriptor OWN bit set 
#define   SDMA_TXBD_OWN_CLEAR    0x0000                     // Receive Transmit Descriptor OWN bit clear 
#define   SDMA_TXBD_STP          0x0200                     // Start of packet 
#define   SDMA_TXBD_ENP          0x0100                     // End of packet 

//
// SmartDMA Transmit Descriptor (word 2)
//
#define   SDMA_TXBD_TTCE         0x8000                     // Enable Transmit Terminal Count Interrupt 

//
// SmartDMA Receive Descriptor (word 1)
//
#define   SDMA_RXBD_OWN_SET      0x8000                     // Receive Buffer Descriptor OWN bit set 
#define   SDMA_RXBD_OWN_CLEAR    0x0000                     // Receive Buffer Descriptor OWN bit clear 
#define   SDMA_RXBD_ERR          0x4000                     // Summary is the OR of FRAM, OFLO, CRC, and HBUF 
#define   SDMA_RXBD_FRAME        0x2000                     // Received frame did not contain a mult of 8 bits 
#define   SDMA_RXBD_OFLO         0x1000                     // Internal receive FIFO has detected an overflow 
#define   SDMA_RXBD_CRC          0x0800                     // CRC error 
#define   SDMA_RXBD_HBUF         0x0400                     // Buffer erro 
#define   SDMA_RXBD_STP          0x0200                     // Start of packet 
#define   SDMA_RXBD_ENP          0x0100                     // End of packet 

//
// SmartDMA Receive Descriptor (word 2)
//
#define   SDMA_RXBD_RTCE         0x8000                     // Enable Receive Terminal Count Interrupt 

//
// -----------------------------------------------------------------------------
// Am186CC REGISTER CONSTANT 
// -----------------------------------------------------------------------------
//

//
// WatchDog Timer Control Register (WDTCON - offset 03E0 hex) Constant
//
#define   WDT_WR_KEY1            0x3333                     // Write Enable Key 1
#define   WDT_WR_KEY2            0xcccc                     // Write Enable Key 2
#define   WDT_CLR_KEY1           0xaaaa                     // Current Count Clear Key 1
#define   WDT_CLR_KEY2           0x5555                     // Current Count Clear Key 2

//
// -----------------------------------------------------------------------------
// Am186CC REGISTER MASK VALUE
// -----------------------------------------------------------------------------
//

//
// Mask Value for System Configuration
//
#define   RELOC_MASK             0x1ffc                     // RELOC Mask Value
#define   RCFGR_MASK             0xffff                     // RCFGR Mask Value
#define   PRL_MASK               0x7e00                     // PRL Mask Value
#define   COMCON_MASK            0x7b33                     // COMCON Mask Value
#define   SYSCON_MASK            0x7c08                     // SYSCON Mask Value

//
// Mask Value for Watchdog Timer
//
#define   WDTCNTL_MASK           0xffff                     // WDTCNTL Mask Value
#define   WDTCNTH_MASK           0xffff                     // WDTCNTH Mask Value
#define   WDTCON_MASK            0xf1ff                     // WDTCON Mask Value

//
// Mask Value for Timers
//
#define   T2CMPA_MASK            0xffff                     // T2CMPA Mask Value
#define   T2CNT_MASK             0xffff                     // T2CNT Mask Value
#define   T2CON_MASK             0xe041                     // T2CON Mask Value
#define   T1CMPB_MASK            0xffff                     // T1CMPB Mask Value
#define   T1CMPA_MASK            0xffff                     // T1CMPA Mask Value
#define   T1CNT_MASK             0xffff                     // T1CNT Mask Value
#define   T1CON_MASK             0xf03f                     // T1CON Mask Value
#define   T0CMPB_MASK            0xffff                     // T0CMPB Mask Value
#define   T0CMPA_MASK            0xffff                     // T0CMPA Mask Value
#define   T0CNT_MASK             0xffff                     // T0CNT Mask Value
#define   T0CON_MASK             0xf01f                     // T0CON Mask Value

//
// Mask Value for PIOs
//
#define   PIOCLEAR2_MASK         0xffff                     // PIOCLEAR2 Mask Value
#define   PIOCLEAR1_MASK         0xffff                     // PIOCLEAR1 Mask Value
#define   PIOCLEAR0_MASK         0xffff                     // PIOCLEAR0 Mask Value
#define   PIOSET2_MASK           0xffff                     // PIOSET2 Mask Value
#define   PIOSET1_MASK           0xffff                     // PIOSET1 Mask Value
#define   PIOSET0_MASK           0xffff                     // PIOSET0 Mask Value
#define   PIODATA2_MASK          0xffff                     // PIODATA2 Mask Value
#define   PIODATA1_MASK          0xffff                     // PIODATA1 Mask Value
#define   PIODATA0_MASK          0xffff                     // PIODATA0 Mask Value
#define   PIODIR2_MASK           0xffff                     // PIODIR2 Mask Value
#define   PIODIR1_MASK           0xffff                     // PIODIR1 Mask Value
#define   PIODIR0_MASK           0xffff                     // PIODIR0 Mask Value
#define   PIOMODE2_MASK          0xffff                     // PIOMODE2 Mask Value
#define   PIOMODE1_MASK          0xffff                     // PIOMODE1 Mask Value
#define   PIOMODE0_MASK          0xffff                     // PIOMODE0 Mask Value

//
// Mask Value for Chip Selects
//
#define   EDRAM_MASK             0x9fff                     // EDRAM Mask Value
#define   CDRAM_MASK             0x1fff                     // CDRAM Mask Value
#define   MPCS_MASK              0x7f7f                     // MPCS Mask Value
#define   MMCS_MASK              0xfe27                     // MMCS Mask Value
#define   PACS_MASK              0xff8f                     // PACS Mask Value
#define   LMCS_MASK              0x70e7                     // LMCS Mask Value
#define   UMCS_MASK              0x70e7                     // UMCS Mask Value

//
// Mask Value for Interrupt Controller
//
#define   CH14CON_MASK           0x000f                     // CH14CON Mask Value
#define   CH13CON_MASK           0x001f                     // CH13CON Mask Value
#define   CH12CON_MASK           0x001f                     // CH12CON Mask Value
#define   CH11CON_MASK           0x003f                     // CH11CON Mask Value
#define   CH10CON_MASK           0x003f                     // CH10CON Mask Value
#define   CH9CON_MASK            0x003f                     // CH9CON Mask Value
#define   CH8CON_MASK            0x003f                     // CH8CON Mask Value
#define   CH7CON_MASK            0x000f                     // CH7CON Mask Value
#define   CH6CON_MASK            0x000f                     // CH6CON Mask Value
#define   CH5CON_MASK            0x000f                     // CH5CON Mask Value
#define   CH4CON_MASK            0x000f                     // CH4CON Mask Value
#define   CH3CON_MASK            0x003f                     // CH3CON Mask Value
#define   CH2CON_MASK            0x003f                     // CH2CON Mask Value
#define   CH1CON_MASK            0x001f                     // CH1CON Mask Value
#define   CH0CON_MASK            0x000f                     // CH0CON Mask Value
#define   PIOPOL_MASK            0xffff                     // PIOPOL Mask Value
#define   INTPOL_MASK            0xffff                     // INTPOL Mask Value
#define   SHMASK_MASK            0xfffe                     // SHMASK Mask Value
#define   SHREQ_MASK             0xfffe                     // SHREQ Mask Value
#define   INTSTS_MASK            0x807f                     // INTSTS Mask Value
#define   REQST_MASK             0x7fff                     // REQST Mask Value
#define   INSERV_MASK            0x7fff                     // INSERV Mask Value
#define   PRIMSK_MASK            0x0007                     // PRIMSK Mask Value
#define   IMASK_MASK             0x7fff                     // IMASK Mask Value
#define   POLLST_MASK            0x801f                     // POLLST Mask Value
#define   POLL_MASK              0x801f                     // POLL Mask Value
#define   EOI_MASK               0x801f                     // EOI Mask Value

//
// Mask Value for GCI
//
#define   GMRDP_MASK             0x00ff                     // GMRDP Mask Value
#define   GMRD_MASK              0x00ff                     // GMRD Mask Value
#define   GMTD_MASK              0x00ff                     // GMTD Mask Value
#define   GCIRD1P_MASK           0x003f                     // GCIRD1P Mask Value
#define   GCIRD1_MASK            0x003f                     // GCIRD1 Mask Value
#define   GCITD1_MASK            0x003f                     // GCITD1 Mask Value
#define   GCIRD0P_MASK           0x000f                     // GCIRD0P Mask Value
#define   GCIRD0_MASK            0x000f                     // GCIRD0 Mask Value
#define   GCITD0_MASK            0x008f                     // GCITD0 Mask Value
#define   GICRDP_MASK            0x00ff                     // GICRDP Mask Value
#define   GICRD_MASK             0x00ff                     // GICRD Mask Value
#define   GICTD_MASK             0x00ff                     // GICTD Mask Value
#define   GTIC_MASK              0x00c7                     // GTIC Mask Value
#define   GIMSK_MASK             0x03ff                     // GIMSK Mask Value
#define   GISTAT_MASK            0x03ff                     // GISTAT Mask Value
#define   GPCON_MASK             0x01ff                     // GPCON Mask Value

//
// Mask Value for Serial Port
//
#define   SPBDV_MASK             0xffff                     // SPBDV Mask Value
#define   SPRXDP_MASK            0xfbff                     // SPRXDP Mask Value
#define   SPRXD_MASK             0xfbff                     // SPRXD Mask Value
#define   SPTXD_MASK             0x01ff                     // SPTXD Mask Value
#define   SPIMSK_MASK            0x03ff                     // SPIMSK Mask Value
#define   SPSTAT_MASK            0x03ff                     // SPSTAT Mask Value
#define   SPCON1_MASK            0x000f                     // SPCON1 Mask Value
#define   SPCON0_MASK            0x1fff                     // SPCON0 Mask Value

//
// Mask Value for High Speed Serial Port
//
#define   HSPM2_MASK             0xffff                     // HSPM2 Mask Value
#define   HSPM1_MASK             0xffff                     // HSPM1 Mask Value
#define   HSPM0_MASK             0xffff                     // HSPM0 Mask Value
#define   HSPBDV_MASK            0xffff                     // HSPBDV Mask Value
#define   HSPRXDP_MASK           0xffff                     // HSPRXDP Mask Value
#define   HSPRXD_MASK            0xffff                     // HSPRXD Mask Value
#define   HSPTXD_MASK            0x01ff                     // HSPTXD Mask Value
#define   HSPIMSK_MASK           0xd7ff                     // HSPIMSK Mask Value
#define   HSPSTAT_MASK           0xd7ff                     // HSPSTAT Mask Value
#define   HSPCON1_MASK           0xf8ff                     // HSPCON1 Mask Value
#define   HSPCON0_MASK           0x1fff                     // HSPCON0 Mask Value

//
// Mask Value for USB
//
#define   UDEPDEF3_MASK          0x37ff                     // DEPDEF3 Mask Value
#define   UDEPDEF2_MASK          0x0fff                     // DEPDEF2 Mask Value
#define   UDEPDEF1_MASK          0xfdbf                     // DEPDEF1 Mask Value
#define   UDRCVPK_MASK           0x00ff                     // DRCVPK Mask Value
#define   UDEPDAT_MASK           0x00ff                     // DEPDAT Mask Value
#define   UDEPSIZ_MASK           0x03ff                     // DEPSIZ Mask Value
#define   UDEPCTL_MASK           0xfa0f                     // DEPCTL Mask Value
#define   UCEPDEF3_MASK          0x37ff                     // CEPDEF3 Mask Value
#define   UCEPDEF2_MASK          0x0fff                     // CEPDEF2 Mask Value
#define   UCEPDEF1_MASK          0xfdbf                     // CEPDEF1 Mask Value
#define   UCRCVPK_MASK           0x00ff                     // CRCVPK Mask Value
#define   UCEPDAT_MASK           0x00ff                     // CEPDAT Mask Value
#define   UCEPSIZ_MASK           0x03ff                     // CEPSIZ Mask Value
#define   UCEPCTL_MASK           0xfa0f                     // CEPCTL Mask Value
#define   UBEPDEF3_MASK          0x37ff                     // BEPDEF3 Mask Value
#define   UBEPDEF2_MASK          0x0fff                     // BEPDEF2 Mask Value
#define   UBEPDEF1_MASK          0xfdbf                     // BEPDEF1 Mask Value
#define   UBRCVPK_MASK           0x00ff                     // BRCVPK Mask Value
#define   UBEPDAT_MASK           0x00ff                     // BEPDAT Mask Value
#define   UBEPSIZ_MASK           0x03ff                     // BEPSIZ Mask Value
#define   UBEPCTL_MASK           0xfa0f                     // BEPCTL Mask Value
#define   UAEPDEF3_MASK          0x37ff                     // AEPDEF3 Mask Value
#define   UAEPDEF2_MASK          0x0fff                     // AEPDEF2 Mask Value
#define   UAEPDEF1_MASK          0xfdbf                     // AEPDEF1 Mask Value
#define   UARCVPK_MASK           0x00ff                     // ARCVPK Mask Value
#define   UAEPDAT_MASK           0x00ff                     // AEPDAT Mask Value
#define   UAEPSIZ_MASK           0x03ff                     // AEPSIZ Mask Value
#define   UAEPCTL_MASK           0xfa0f                     // AEPCTL Mask Value
#define   UIEPDEF2_MASK          0x0fff                     // IEPDEF2 Mask Value
#define   UIEPDEF1_MASK          0xfdbf                     // IEPDEF1 Mask Value
#define   UIEPDAT_MASK           0x00ff                     // IEPDAT Mask Value
#define   UIEPCTL_MASK           0xf000                     // IEPCTL Mask Value
#define   UCNTDEF2_MASK          0x0fff                     // CNTDEF2 Mask Value
#define   UCNTDEF1_MASK          0xfdbf                     // CNTDEF1 Mask Value
#define   UCNTRPK_MASK           0x00ff                     // CNTRPK Mask Value
#define   UCNTDAT_MASK           0x00ff                     // CNTDAT Mask Value
#define   UCNTCTL_MASK           0xfc0f                     // CNTCTL Mask Value
#define   USBTMD_MASK            0x0001                     // USBTMD Mask Value
#define   UFPMCNT_MASK           0x3fff                     // UFPMCNT Mask Value
#define   UISCTL_MASK            0x831f                     // UISCTL Mask Value
#define   UTSTMPM_MASK           0x07ff                     // UTSTMPM Mask Value
#define   UTSTMP_MASK            0x07ff                     // UTSTMP Mask Value
#define   URTFMCNT_MASK          0x3fff                     // URTFMCNT Mask Value
#define   USBMFR_MASK            0x000f                     // USBMFR Mask Value
#define   UIMASK2_MASK           0xe00f                     // UIMASK2 Mask Value
#define   UISTAT2_MASK           0xf00f                     // UISTAT2 Mask Value
#define   UIMASK1_MASK           0x0fff                     // UIMASK1 Mask Value
#define   UISTAT1_MASK           0x0fff                     // UISTAT1 Mask Value

//
// Mask Value for SmartDMAs
//
#define   SD3CBD_MASK            0x7f7f                     // SD3CBD Mask Value
#define   SD3STAT_MASK           0x3f00                     // SD3STAT Mask Value
#define   SD3RRAH_MASK           0x000f                     // SD3RRAH Mask Value
#define   SD3RRCAL_MASK          0xfff7                     // SD3RRCAL Mask Value
#define   SD3TRAH_MASK           0x000f                     // SD3TRAH Mask Value
#define   SD3TRCAL_MASK          0xfff7                     // SD3TRCAL Mask Value
#define   SD3CON_MASK            0x3fff                     // SD3CON Mask Value
#define   SD2CBD_MASK            0x7f7f                     // SD2CBD Mask Value
#define   SD2STAT_MASK           0x3f00                     // SD2STAT Mask Value
#define   SD2RRAH_MASK           0x000f                     // SD2RRAH Mask Value
#define   SD2RRCAL_MASK          0xfff7                     // SD2RRCAL Mask Value
#define   SD2TRAH_MASK           0x000f                     // SD2TRAH Mask Value
#define   SD2TRCAL_MASK          0xfff7                     // SD2TRCAL Mask Value
#define   SD2CON_MASK            0x3fff                     // SD2CON Mask Value
#define   SD1CBD_MASK            0x7f7f                     // SD1CBD Mask Value
#define   SD1STAT_MASK           0x3f00                     // SD1STAT Mask Value
#define   SD1RRAH_MASK           0x000f                     // SD1RRAH Mask Value
#define   SD1RRCAL_MASK          0xfff7                     // SD1RRCAL Mask Value
#define   SD1TRAH_MASK           0x000f                     // SD1TRAH Mask Value
#define   SD1TRCAL_MASK          0xfff7                     // SD1TRCAL Mask Value
#define   SD1CON_MASK            0x3f3b                     // SD1CON Mask Value
#define   SD0CBD_MASK            0x7f7f                     // SD0CBD Mask Value
#define   SD0STAT_MASK           0x3f00                     // SD0STAT Mask Value
#define   SD0RRAH_MASK           0x000f                     // SD0RRAH Mask Value
#define   SD0RRCAL_MASK          0xfff7                     // SD0RRCAL Mask Value
#define   SD0TRAH_MASK           0x000f                     // SD0TRAH Mask Value
#define   SD0TRCAL_MASK          0xfff7                     // SD0TRCAL Mask Value
#define   SD0CON_MASK            0x3f3b                     // SD0CON Mask Value

//
// Mask Value for General Purpose DMAs
//
#define   GD3TC_MASK             0xffff                     // GD3TC Mask Value
#define   GD3DSTH_MASK           0x000f                     // GD3DSTH Mask Value
#define   GD3DSTL_MASK           0xffff                     // GD3DSTL Mask Value
#define   GD3SRCH_MASK           0x000f                     // GD3SRCH Mask Value
#define   GD3SRCL_MASK           0xffff                     // GD3SRCL Mask Value
#define   GD3CON1_MASK           0xffff                     // GD3CON1 Mask Value
#define   GD3CON0_MASK           0xf35f                     // GD3CON0 Mask Value
#define   GD2TC_MASK             0xffff                     // GD2TC Mask Value
#define   GD2DSTL_MASK           0xffff                     // GD2DSTL Mask Value
#define   GD2DSTH_MASK           0x000f                     // GD2DSTH Mask Value
#define   GD2SRCH_MASK           0x000f                     // GD2SRCH Mask Value
#define   GD2SRCL_MASK           0xffff                     // GD2SRCL Mask Value
#define   GD2CON1_MASK           0xffff                     // GD2CON1 Mask Value
#define   GD2CON0_MASK           0xf35f                     // GD2CON0 Mask Value
#define   GD1TC_MASK             0xffff                     // GD1TC Mask Value
#define   GD1DSTH_MASK           0x000f                     // GD1DSTH Mask Value
#define   GD1DSTL_MASK           0xffff                     // GD1DSTL Mask Value
#define   GD1SRCH_MASK           0x000f                     // GD1SRCH Mask Value
#define   GD1SRCL_MASK           0xffff                     // GD1SRCL Mask Value
#define   GD1CON1_MASK           0xffff                     // GD1CON1 Mask Value
#define   GD1CON0_MASK           0xf35f                     // GD1CON0 Mask Value
#define   GD0TC_MASK             0xffff                     // GD0TC Mask Value
#define   GD0DSTH_MASK           0x000f                     // GD0DSTH Mask Value
#define   GD0DSTL_MASK           0xffff                     // GD0DSTL Mask Value
#define   GD0SRCH_MASK           0x000f                     // GD0SRCH Mask Value
#define   GD0SRCL_MASK           0xffff                     // GD0SRCL Mask Value
#define   GD0CON1_MASK           0xffff                     // GD0CON1 Mask Value
#define   GD0CON0_MASK           0xf35f                     // GD0CON0 Mask Value

//
// Mask Value for Time Slot Assigner D
//
#define   TSDSTOP_MASK           0x01ff                     // TSDSTOP Mask Value
#define   TSDSTART_MASK          0x01ff                     // TSDSTART Mask Value
#define   TSDCON_MASK            0x0337                     // TSDCON Mask Value

//
// Mask Value for HDLC D
//
#define   HDA3_MASK              0xffff                     // HDA3 Mask Value
#define   HDA3MSK_MASK           0xffff                     // HDA3MSK Mask Value
#define   HDA2_MASK              0xffff                     // HDA2 Mask Value
#define   HDA2MSK_MASK           0xffff                     // HDA2MSK Mask Value
#define   HDA1_MASK              0xffff                     // HDA1 Mask Value
#define   HDA1MSK_MASK           0xffff                     // HDA1MSK Mask Value
#define   HDA0_MASK              0xffff                     // HDA0 Mask Value
#define   HDA0MSK_MASK           0xffff                     // HDA0MSK Mask Value
#define   HDMACNTP_MASK          0xffff                     // HDMACNTP Mask Value
#define   HDMACNT_MASK           0xffff                     // HDMACNT Mask Value
#define   HDSFCNTP_MASK          0xffff                     // HDSFCNTP Mask Value
#define   HDSFCNT_MASK           0xffff                     // HDSFCNT Mask Value
#define   HDRDP_MASK             0xffff                     // HDRDP Mask Value
#define   HDRD_MASK              0xffff                     // HDRD Mask Value
#define   HDTD_MASK              0x00ff                     // HDTD Mask Value
#define   HDISTAT1_MASK          0x03ff                     // HDISTAT1 Mask Value
#define   HDIMSK1_MASK           0xffff                     // HDIMSK1 Mask Value
#define   HDISTAT0_MASK          0x1f1f                     // HDISTAT0 Mask Value
#define   HDIMSK0_MASK           0xffff                     // HDIMSK0 Mask Value
#define   HDSTATE_MASK           0x003f                     // HDSTATE Mask Value
#define   HDRCON1_MASK           0xffff                     // HDRCON1 Mask Value
#define   HDRCON0_MASK           0x0fff                     // HDRCON0 Mask Value
#define   HDTCON1_MASK           0x0fff                     // HDTCON1 Mask Value
#define   HDTCON0_MASK           0x0c7f                     // HDTCON0 Mask Value
#define   HDCON_MASK             0x00bf                     // HDCON Mask Value

//
// Mask Value for Time Slot Assigner C
//
#define   TSCSTOP_MASK           TSDSTOP_MASK               // TSCSTOP Mask Value
#define   TSCSTART_MASK          TSDSTART_MASK              // TSCSTART Mask Value
#define   TSCCON_MASK            TSDCON_MASK                // TSCCON Mask Value

//
// Mask Value for HDLC C
//
#define   HCA3_MASK              HDA3_MASK                  // HCA3 Mask Value
#define   HCA3MSK_MASK           HDA3MSK_MASK               // HCA3MSK Mask Value
#define   HCA2_MASK              HDA2_MASK                  // HCA2 Mask Value
#define   HCA2MSK_MASK           HDA2MSK_MASK               // HCA2MSK Mask Value
#define   HCA1_MASK              HDA1_MASK                  // HCA1 Mask Value
#define   HCA1MSK_MASK           HDA1MSK_MASK               // HCA1MSK Mask Value
#define   HCA0_MASK              HDA0_MASK                  // HCA0 Mask Value
#define   HCA0MSK_MASK           HDA0MSK_MASK               // HCA0MSK Mask Value
#define   HCMACNTP_MASK          HDMACNTP_MASK              // HCMACNTP Mask Value
#define   HCMACNT_MASK           HDMACNT_MASK               // HCMACNT Mask Value
#define   HCSFCNTP_MASK          HDSFCNTP_MASK              // HCSFCNTP Mask Value
#define   HCSFCNT_MASK           HDSFCNT_MASK               // HCSFCNT Mask Value
#define   HCRDP_MASK             HDRDP_MASK                 // HCRDP Mask Value
#define   HCRD_MASK              HDRD_MASK                  // HCRD Mask Value
#define   HCTD_MASK              HDTD_MASK                  // HCTD Mask Value
#define   HCISTAT1_MASK          HDISTAT1_MASK              // HCISTAT1 Mask Value
#define   HCIMSK1_MASK           HDIMSK1_MASK               // HCIMSK1 Mask Value
#define   HCISTAT0_MASK          HDISTAT0_MASK              // HCISTAT0 Mask Value
#define   HCIMSK0_MASK           HDIMSK0_MASK               // HCIMSK0 Mask Value
#define   HCSTATE_MASK           HDSTATE_MASK               // HCSTATE Mask Value
#define   HCRCON1_MASK           HDRCON1_MASK               // HCRCON1 Mask Value
#define   HCRCON0_MASK           HDRCON0_MASK               // HCRCON0 Mask Value
#define   HCTCON1_MASK           HDTCON1_MASK               // HCTCON1 Mask Value
#define   HCTCON0_MASK           HDTCON0_MASK               // HCTCON0 Mask Value
#define   HCCON_MASK             HDCON_MASK                 // HCCON Mask Value

//
// Mask Value for Time Slot Assigner B
//
#define   TSBSTOP_MASK           TSDSTOP_MASK               // TSBSTOP Mask Value
#define   TSBSTART_MASK          TSDSTART_MASK              // TSBSTART Mask Value
#define   TSBCON_MASK            TSDCON_MASK                // TSBCON Mask Value

//
// Mask Value for HDLC B
//
#define   HBA3_MASK              HDA3_MASK                  // HBA3 Mask Value
#define   HBA3MSK_MASK           HDA3MSK_MASK               // HBA3MSK Mask Value
#define   HBA2_MASK              HDA2_MASK                  // HBA2 Mask Value
#define   HBA2MSK_MASK           HDA2MSK_MASK               // HBA2MSK Mask Value
#define   HBA1_MASK              HDA1_MASK                  // HBA1 Mask Value
#define   HBA1MSK_MASK           HDA1MSK_MASK               // HBA1MSK Mask Value
#define   HBA0_MASK              HDA0_MASK                  // HBA0 Mask Value
#define   HBA0MSK_MASK           HDA0MSK_MASK               // HBA0MSK Mask Value
#define   HBMACNTP_MASK          HDMACNTP_MASK              // HBMACNTP Mask Value
#define   HBMACNT_MASK           HDMACNT_MASK               // HBMACNT Mask Value
#define   HBSFCNTP_MASK          HDSFCNTP_MASK              // HBSFCNTP Mask Value
#define   HBSFCNT_MASK           HDSFCNT_MASK               // HBSFCNT Mask Value
#define   HBRDP_MASK             HDRDP_MASK                 // HBRDP Mask Value
#define   HBRD_MASK              HDRD_MASK                  // HBRD Mask Value
#define   HBTD_MASK              HDTD_MASK                  // HBTD Mask Value
#define   HBISTAT1_MASK          HDISTAT1_MASK              // HBISTAT1 Mask Value
#define   HBIMSK1_MASK           HDIMSK1_MASK               // HBIMSK1 Mask Value
#define   HBISTAT0_MASK          HDISTAT0_MASK              // HBISTAT0 Mask Value
#define   HBIMSK0_MASK           HDIMSK0_MASK               // HBIMSK0 Mask Value
#define   HBSTATE_MASK           HDSTATE_MASK               // HBSTATE Mask Value
#define   HBRCON1_MASK           HDRCON1_MASK               // HBRCON1 Mask Value
#define   HBRCON0_MASK           HDRCON0_MASK               // HBRCON0 Mask Value
#define   HBTCON1_MASK           HDTCON1_MASK               // HBTCON1 Mask Value
#define   HBTCON0_MASK           HDTCON0_MASK               // HBTCON0 Mask Value
#define   HBCON_MASK             HDCON_MASK                 // HBCON Mask Value

//
// Mask Value for Time Slot Assigner A
//
#define   TSASTOP_MASK           TSDSTOP_MASK               // TSASTOP Mask Value
#define   TSASTART_MASK          TSDSTART_MASK              // TSASTART Mask Value
#define   TSACON_MASK            TSDCON_MASK                // TSACON Mask Value

//
// Mask Value for HDLC A
//
#define   HAA3_MASK              HDA3_MASK                  // HAA3 Mask Value
#define   HAA3MSK_MASK           HDA3MSK_MASK               // HAA3MSK Mask Value
#define   HAA2_MASK              HDA2_MASK                  // HAA2 Mask Value
#define   HAA2MSK_MASK           HDA2MSK_MASK               // HAA2MSK Mask Value
#define   HAA1_MASK              HDA1_MASK                  // HAA1 Mask Value
#define   HAA1MSK_MASK           HDA1MSK_MASK               // HAA1MSK Mask Value
#define   HAA0_MASK              HDA0_MASK                  // HAA0 Mask Value
#define   HAA0MSK_MASK           HDA0MSK_MASK               // HAA0MSK Mask Value
#define   HAMACNTP_MASK          HDMACNTP_MASK              // HAMACNTP Mask Value
#define   HAMACNT_MASK           HDMACNT_MASK               // HAMACNT Mask Value
#define   HASFCNTP_MASK          HDSFCNTP_MASK              // HASFCNTP Mask Value
#define   HASFCNT_MASK           HDSFCNT_MASK               // HASFCNT Mask Value
#define   HARDP_MASK             HDRDP_MASK                 // HARDP Mask Value
#define   HARD_MASK              HDRD_MASK                  // HARD Mask Value
#define   HATD_MASK              HDTD_MASK                  // HATD Mask Value
#define   HAISTAT1_MASK          HDISTAT1_MASK              // HAISTAT1 Mask Value
#define   HAIMSK1_MASK           HDIMSK1_MASK               // HAIMSK1 Mask Value
#define   HAISTAT0_MASK          HDISTAT0_MASK              // HAISTAT0 Mask Value
#define   HAIMSK0_MASK           HDIMSK0_MASK               // HAIMSK0 Mask Value
#define   HASTATE_MASK           HDSTATE_MASK               // HASTATE Mask Value
#define   HARCON1_MASK           HDRCON1_MASK               // HARCON1 Mask Value
#define   HARCON0_MASK           HDRCON0_MASK               // HARCON0 Mask Value
#define   HATCON1_MASK           HDTCON1_MASK               // HATCON1 Mask Value
#define   HATCON0_MASK           HDTCON0_MASK               // HATCON0 Mask Value
#define   HACON_MASK             HDCON_MASK                 // HACON Mask Value

#endif    // #ifdef AM186CC

/****************************************************************************
* ENDOF   : Am186CC.h
* ===========================================================================
* HISTORY :
* $Log: AM186CC.H,v $
* Revision 1.1  2003/01/23 10:57:42  suriyan
* Strip out from POS-NAC V1.0 project.
*
* Revision 1.1.1.1  2002/07/26 04:41:05  suriyan
* Initail release.
*
* Revision 1.1.1.1  2002/07/25 19:34:20  suriyan
* Initial release.
*
* Revision 1.1  1998/03/20 22:58:14  bblack
* Initial revision
* Revision 1.2  1998/03/20 22:58:14  bblack
* Added default PCB location  CTL_OFF
* Revision 1.1  1998/03/20 17:24:06  bblack
* Initial revision
*
*****************************************************************************/
