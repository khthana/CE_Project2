Attribute VB_Name = "ACR120"
'=========================================================================================
'
'   Company:  Advanced Card Systems LTD.
'
'   Module :  ACR120API
'
'   Author :  Richard C. Siman
'
'   Date   :  January 09, 2004
'
'             ®ichard C. Siman ©
'
'=======================================================================================
'Revision Trail
'=======================================================================================
'
'   Company:  Advanced Card Systems LTD.
'
'   Module :  ACR120API
'
'   Author :  Richard C. Siman
'
'   Date   :  April 19, 2004
'
'             ®ichard C. Siman ©
'
'=======================================================================================
'
'   Company:  ACS Technologies LTD.
'
'   Module :  ACR120API
'
'   Author :  Richard C. Siman
'
'   Date   :  February 17, 2005
'
'             ®ichard C. Siman ©
'=======================================================================================
'
'   Company:  ACS Technologies LTD.
'
'   Module :  ACR120API
'
'   Author :  Richard C. Siman
'
'   Date   :  April 11, 2005
'
'             ®ichard C. Siman ©
'=======================================================================================






'=============================== Error Code ===============================
    
Global Const ERR_ACR120_INTERNAL_UNEXPECTED = -1000
Global Const ERR_ACR120_PORT_INVALID = -2000
Global Const ERR_ACR120_PORT_OCCUPIED = -2010
Global Const ERR_ACR120_HANDLE_INVALID = -2020
Global Const ERR_ACR120_INCORRECT_PARAM = -2030
Global Const ERR_ACR120_READER_NO_TAG = -3000
Global Const ERR_ACR120_READER_READ_FAIL_AFTER_OP = -3010
Global Const ERR_ACR120_READER_NO_VALUE_BLOCK = -3020
Global Const ERR_ACR120_READER_OP_FAILURE = -3030
Global Const ERR_ACR120_READER_UNKNOWN = -3040
Global Const ERR_ACR120_READER_LOGIN_INVALID_STORED_KEY_FORMAT = -4010
Global Const ERR_ACR120_READER_WRITE_READ_AFTER_WRITE_ERROR = -4020
Global Const ERR_ACR120_READER_DEC_FAILURE_EMPTY = -4030

    
    
    


'======================= Reader Port for AC_Open ==========================
Enum PORTS
ACR120_COM1 = 0
ACR120_COM2 = 1
ACR120_COM3 = 2
ACR120_COM4 = 3
ACR120_COM5 = 4
ACR120_COM6 = 5
ACR120_COM7 = 6
ACR120_COM8 = 7
End Enum

'========================= Baud Rate Supported ============================

Enum BAUDRATES
ACR120_COM_BAUDRATE_9600 = 0
ACR120_COM_BAUDRATE_19200 = 1
ACR120_COM_BAUDRATE_38400 = 2
ACR120_COM_BAUDRATE_57600 = 3
ACR120_COM_BAUDRATE_115200 = 4
End Enum

'======================== Key Type for AC_Login ===========================
    
Enum KEYTYPES
ACR120_LOGIN_KEYTYPE_AA = 0
ACR120_LOGIN_KEYTYPE_BB = (ACR120_LOGIN_KEYTYPE_AA + 1)
ACR120_LOGIN_KEYTYPE_FF = (ACR120_LOGIN_KEYTYPE_BB + 1)
ACR120_LOGIN_KEYTYPE_STORED_A = (ACR120_LOGIN_KEYTYPE_FF + 1)
ACR120_LOGIN_KEYTYPE_STORED_B = (ACR120_LOGIN_KEYTYPE_STORED_A + 1)
End Enum



'======================================
'Global AC_ACR120_SN_LEN(0 To 3) As Byte
'Global AC_ACR120_DATA_LEN(0 To 15) As Byte
'Global AC_ACR120_KEY_LEN(0 To 5) As Byte
'Global AC_ACR120_MAX_TAG_LIST(0 To 16) As Byte



'------------------------------------------------------------------------------------------
'Prototype section
'------------------------------------------------------------------------------------------


Declare Function ACR120_Open Lib "ACR120.DLL" (ByVal ReaderPort As PORTS, _
                                                   ByVal BaudRate As BAUDRATES) As Integer
                                                  
Declare Function ACR120_Close Lib "ACR120.DLL" (ByVal hReader As Integer) _
                                     As Integer
                                                   
Declare Function ACR120_Reset Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte) As Integer
                                              
Declare Function ACR120_Select Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByRef pHaveTag _
                                     As Boolean, ByRef pTag As Byte, ByRef pSN _
                                     As Byte) As Integer

Declare Function ACR120_Login Lib "ACR120.DLL" (ByVal hReader As Integer, _
                          ByVal stationID As Byte, ByVal sector As Byte, ByVal keyType As KEYTYPES, _
                          ByVal storedNo As Long, ByRef pKey As Byte) As Integer



Declare Function ACR120_Read Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal block As Byte, _
                                     ByRef pBlockData As Byte) As Integer


Declare Function ACR120_ReadValue Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal block As Byte, _
                                     ByRef pValueData As Long) As Integer



Declare Function ACR120_ReadEEPROM Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal reg As Byte, _
                                     ByRef pEEPROMData As Byte) As Integer



Declare Function ACR120_ReadLowLevelRegister Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal reg As Byte, _
                                     ByRef pRegData As Byte) As Integer
                                     


Declare Function ACR120_RequestVersionInfo Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByRef pVersionInfoLen As Byte, _
                                     ByRef pVersionInfo As Byte) As Integer
                                     

Declare Function ACR120_RequestDLLVersion Lib "ACR120.DLL" (ByRef pVersionInfoLen As Byte, _
                                     ByRef pVersionInfo As Byte) As Integer




Declare Function ACR120_Write Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal block As Byte, _
                                     ByRef pBlockData As Byte) As Integer



Declare Function ACR120_WriteValue Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal block As Byte, _
                                     ByVal valueData As Long) As Integer



Declare Function ACR120_WriteEEPROM Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, ByVal reg As Byte, _
                                     ByVal eePROMData As Byte) As Integer
                                     
                                     
Declare Function ACR120_WriteMasterKey Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal keyNo As Byte, _
                                     ByRef pKey As Byte) As Integer
                                     
                                     
                                     
Declare Function ACR120_WriteLowLevelRegister Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal reg As Byte, _
                                     ByVal registerData As Byte) As Integer
                                     
                                    
                                     
                                     
Declare Function ACR120_Inc Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal block As Byte, _
                                     ByVal value As Long, _
                                     ByRef pNewValue As Long) As Integer
                                     
                                     
Declare Function ACR120_Dec Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal block As Byte, _
                                     ByVal value As Long, _
                                     ByRef pNewValue As Long) As Integer
                                     


Declare Function ACR120_Copy Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal srcBlock As Byte, _
                                     ByVal desBlock As Byte, _
                                     ByRef pNewValue As Long) As Integer


                            
Declare Function ACR120_Power Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal bOn As Boolean) As Integer
                            
                            
                            
                            
Declare Function ACR120_ReadUserPort Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByRef pUserPortState As Byte) As Integer
                            
                            
                            
                            
Declare Function ACR120_WriteUserPort Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal userPortState As Byte) As Integer
                            
                            
                            
Declare Function ACR120_GetID Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByRef pNumID As Byte, _
                                     ByRef pStationID As Byte) As Integer
                            
                            
                            

                            
Declare Function ACR120_MultiTagSelect Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByRef pSN As Byte, _
                                     ByRef pHaveTag As Boolean, _
                                     ByRef pTag As Byte, _
                                     ByRef pResultSN As Byte) As Integer
                                     
                                     


Declare Function ACR120_ListTag Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByRef pNumTagFound As Byte, _
                                     ByRef pHaveTag As Boolean, _
                                     ByRef pTag As Byte, _
                                     ByRef pSN As Byte) As Integer
 
                                     
                            



Declare Function ACR120_TxDataTelegram Lib "ACR120.DLL" (ByVal hReader As Integer, _
                                     ByVal stationID As Byte, _
                                     ByVal length As Byte, _
                                     ByVal bParity As Boolean, _
                                     ByVal bEvenParity As Boolean, _
                                     ByVal bCRCGen As Boolean, _
                                     ByVal bCRCCheck As Boolean, _
                                     ByVal bCryptoInactive As Boolean, _
                                     ByVal bitFrame As Byte, _
                                     ByRef data As Byte, _
                                     ByRef pRecvLen As Byte, _
                                     ByRef recvData As Byte) As Integer


                            
                            
                            
                            
                            
                            
                            
                            











