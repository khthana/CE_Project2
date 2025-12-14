Option Strict Off
Option Explicit On
Module ACR120

	
	'=============================== Error Code ===============================
	
	Public Const ERR_ACR120_INTERNAL_UNEXPECTED As Short = -1000
	Public Const ERR_ACR120_PORT_INVALID As Short = -2000
	Public Const ERR_ACR120_PORT_OCCUPIED As Short = -2010
	Public Const ERR_ACR120_HANDLE_INVALID As Short = -2020
	Public Const ERR_ACR120_INCORRECT_PARAM As Short = -2030
	Public Const ERR_ACR120_READER_NO_TAG As Short = -3000
	Public Const ERR_ACR120_READER_READ_FAIL_AFTER_OP As Short = -3010
	Public Const ERR_ACR120_READER_NO_VALUE_BLOCK As Short = -3020
	Public Const ERR_ACR120_READER_OP_FAILURE As Short = -3030
	Public Const ERR_ACR120_READER_UNKNOWN As Short = -3040
	Public Const ERR_ACR120_READER_LOGIN_INVALID_STORED_KEY_FORMAT As Short = -4010
	Public Const ERR_ACR120_READER_WRITE_READ_AFTER_WRITE_ERROR As Short = -4020
	Public Const ERR_ACR120_READER_DEC_FAILURE_EMPTY As Short = -4030
	

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
		ACR120_LOGIN_KEYTYPE_BB = (KEYTYPES.ACR120_LOGIN_KEYTYPE_AA + 1)
		ACR120_LOGIN_KEYTYPE_FF = (KEYTYPES.ACR120_LOGIN_KEYTYPE_BB + 1)
		ACR120_LOGIN_KEYTYPE_STORED_A = (KEYTYPES.ACR120_LOGIN_KEYTYPE_FF + 1)
		ACR120_LOGIN_KEYTYPE_STORED_B = (KEYTYPES.ACR120_LOGIN_KEYTYPE_STORED_A + 1)
	End Enum

	
	'======================================
	'Global AC_ACR120_SN_LEN(0 To 3) As Byte
	'Global AC_ACR120_DATA_LEN(0 To 15) As Byte
	'Global AC_ACR120_KEY_LEN(0 To 5) As Byte
	'Global AC_ACR120_MAX_TAG_LIST(0 To 16) As Byte

	
	'------------------------------------------------------------------------------------------
	'Prototype section
	'------------------------------------------------------------------------------------------
	
	
	'UPGRADE_WARNING: Structure BAUDRATES may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1050"'
	'UPGRADE_WARNING: Structure PORTS may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1050"'
	Declare Function ACR120_Open Lib "ACR120.DLL" (ByVal ReaderPort As PORTS, ByVal BaudRate As BAUDRATES) As Short
	
	Declare Function ACR120_Close Lib "ACR120.DLL" (ByVal hReader As Short) As Short
	
	Declare Function ACR120_Reset Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte) As Short
	
	Declare Function ACR120_Select Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByRef pHaveTag As Boolean, ByRef pTag As Byte, ByRef pSN As Byte) As Short
	
	'UPGRADE_WARNING: Structure KEYTYPES may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1050"'
	Declare Function ACR120_Login Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal sector As Byte, ByVal keyType As KEYTYPES, ByVal storedNo As Integer, ByRef pKey As Byte) As Short

	
	Declare Function ACR120_Read Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal block As Byte, ByRef pBlockData As Byte) As Short
	
	
	Declare Function ACR120_ReadValue Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal block As Byte, ByRef pValueData As Integer) As Short
	

	Declare Function ACR120_ReadEEPROM Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal reg As Byte, ByRef pEEPROMData As Byte) As Short

	
	Declare Function ACR120_ReadLowLevelRegister Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal reg As Byte, ByRef pRegData As Byte) As Short
	

	Declare Function ACR120_RequestVersionInfo Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByRef pVersionInfoLen As Byte, ByRef pVersionInfo As Byte) As Short
	
	
	Declare Function ACR120_RequestDLLVersion Lib "ACR120.DLL" (ByRef pVersionInfoLen As Byte, ByRef pVersionInfo As Byte) As Short

	
	Declare Function ACR120_Write Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal block As Byte, ByRef pBlockData As Byte) As Short

	
	Declare Function ACR120_WriteValue Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal block As Byte, ByVal valueData As Integer) As Short
	

	Declare Function ACR120_WriteEEPROM Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal reg As Byte, ByVal eePROMData As Byte) As Short
	
	
	Declare Function ACR120_WriteMasterKey Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal keyNo As Byte, ByRef pKey As Byte) As Short
	

	Declare Function ACR120_WriteLowLevelRegister Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal reg As Byte, ByVal registerData As Byte) As Short
	

	Declare Function ACR120_Inc Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal block As Byte, ByVal value As Integer, ByRef pNewValue As Integer) As Short
	
	
	Declare Function ACR120_Dec Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal block As Byte, ByVal value As Integer, ByRef pNewValue As Integer) As Short
	

	Declare Function ACR120_Copy Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal srcBlock As Byte, ByVal desBlock As Byte, ByRef pNewValue As Integer) As Short
	

	Declare Function ACR120_Power Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal bOn As Boolean) As Short

	
	Declare Function ACR120_ReadUserPort Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByRef pUserPortState As Byte) As Short

	
	Declare Function ACR120_WriteUserPort Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal userPortState As Byte) As Short

	
	Declare Function ACR120_GetID Lib "ACR120.DLL" (ByVal hReader As Short, ByRef pNumID As Byte, ByRef pStationID As Byte) As Short
	

	Declare Function ACR120_MultiTagSelect Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByRef pSN As Byte, ByRef pHaveTag As Boolean, ByRef pTag As Byte, ByRef pResultSN As Byte) As Short
	

	Declare Function ACR120_ListTag Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByRef pNumTagFound As Byte, ByRef pHaveTag As Boolean, ByRef pTag As Byte, ByRef pSN As Byte) As Short


	Declare Function ACR120_TxDataTelegram Lib "ACR120.DLL" (ByVal hReader As Short, ByVal stationID As Byte, ByVal length As Byte, ByVal bParity As Boolean, ByVal bOddParity As Boolean, ByVal bCRCGen As Boolean, ByVal bCRCCheck As Boolean, ByVal bCryptoInactive As Boolean, ByVal bitFrame As Byte, ByRef data As Byte, ByRef pRecvLen As Byte, ByRef recvData As Byte) As Short
End Module