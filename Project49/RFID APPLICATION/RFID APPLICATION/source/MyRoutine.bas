Attribute VB_Name = "MyRoutine"
'=========================================================================================
'
'   Company:  Advanced Card Systems LTD.
'
'   Module :  MyRoutine Module
'
'   Author :  Richard C. Siman
'
'   Date   :  January 21, 2004
'
'   Description:
'             Module of Common Routines
'             ®ichard C. Siman ©
'
'=======================================================================================






Global sel As Boolean
Global sel2 As Integer
Global tmp_time As Integer
Global rHandle As Integer
Global retcode As Integer
Global SID As Byte
Global Sec As Integer
Global pKey(0 To 5) As Byte






'=======================================================================================
'
' String Definition of Error Codes
'
'=======================================================================================

Public Function ErrDef(ByVal ErrCode As Integer) As String
          
          
          Select Case (ErrCode)
                
                Case -1000: ErrDef = "( X ) Unexpected Internal Library Error : -1000"

                Case -2000: ErrDef = "( X ) Invalid Port : -2000"

                Case -2010: ErrDef = "( X ) Port Occupied by Another Application : -2010"

                Case -2020: ErrDef = "( X ) Invalid Handle : -2020"
                
                Case -2030: ErrDef = "( X ) Incorrect Parameter : -2030"
                
                Case -3000: ErrDef = "( X ) No TAG Selected or in Reachable Range : -3000"
                                
                Case -3010: ErrDef = "( X ) Read Failed after Operation : -3010"

                Case -3020: ErrDef = "( X ) Block doesn't contain value : -3020"

                Case -3030: ErrDef = "( X ) Operation Failed : -3030"
                
                Case -3040: ErrDef = "( X ) Unknown Reader Error : -3040"
                
                Case -4010: ErrDef = "( X ) Invalid stored key format in login process : -4010"

                Case -4020: ErrDef = "( X ) Reader can't read after write operation : -4020"
                
                Case -4030: ErrDef = "( X ) Decrement Failure (Empty) : -4030"

           End Select
           
          
End Function









'=========================================
'  Routine for Verifying the Inputed
'  Character as member of HEX value
'  In Short It will allow Hex and backspace
'  Input only
'=========================================
Public Function KeyVerify(ByVal key As Integer) As Integer

    If key >= 48 And key <= 57 Or key >= 65 And key <= 70 Then
             key = key
    ElseIf key >= 97 And key <= 102 Then
             key = (Asc(UCase(Chr(key))))
    ElseIf key = 8 Then
             key = key
    Else
             key = 13
    End If

    KeyVerify = key
    
End Function








'======================================================
'  Routine for converting Hex Significant Byte value
'  to it's Decimal value.
'======================================================
Public Function StrHEX_Dec(ByVal StrHex As String) As Integer


      Select Case StrHex
      
        Case "1"
            StrHEX_Dec = 1
        Case "2"
            StrHEX_Dec = 2
        Case "3"
            StrHEX_Dec = 3
        Case "4"
            StrHEX_Dec = 4
        Case "5"
            StrHEX_Dec = 5
        Case "6"
            StrHEX_Dec = 6
        Case "7"
            StrHEX_Dec = 7
        Case "8"
            StrHEX_Dec = 8
        Case "9"
            StrHEX_Dec = 9
        Case "0"
            StrHEX_Dec = 0
        Case "A"
            StrHEX_Dec = 10
        Case "B"
            StrHEX_Dec = 11
        Case "C"
            StrHEX_Dec = 12
        Case "D"
            StrHEX_Dec = 13
        Case "E"
            StrHEX_Dec = 14
        Case "F"
            StrHEX_Dec = 15
      End Select
      
End Function






'======================================================
'  Routine for converting Hex to Decimal value.
'======================================================

Public Function Hex_Dec(val As TextBox, ByVal start As Byte) As Byte
Dim MSB As Byte
Dim LSB As Byte
Dim Fbyte As Byte

              Fbyte = 0
              MSB = 0
              LSB = 0
              
              MSB = StrHEX_Dec(Mid(val.Text, start, 1))
              LSB = StrHEX_Dec(Mid(val.Text, start + 1, 1))
              Fbyte = (MSB * 16) + LSB

Hex_Dec = Fbyte

End Function
