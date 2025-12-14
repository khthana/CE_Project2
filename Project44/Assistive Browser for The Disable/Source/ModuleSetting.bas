Attribute VB_Name = "ModuleSetting"
Sub SetButtonAndMouse()

    Dim iFileNum As Integer
    Dim s(7) As String
    Dim i As Integer
    
    iFileNum = FreeFile
    filename = App.Path & "\start.sbm"
    Open filename For Input As #iFileNum
    Line Input #iFileNum, s(1) 'OnekeyFlag
    Line Input #iFileNum, s(2) 'KeyUpDown
    Line Input #iFileNum, s(3) 'KeyLeftRight
    Line Input #iFileNum, s(4) 'OneKey
    Line Input #iFileNum, s(5) 'MaxTimeDb
    Line Input #iFileNum, s(6) 'mouse_click_period
    Line Input #iFileNum, s(7) 'MaxSpeed
    Close #iFileNum
    filename = ""
    
    If s(1) = "True" Then
        OnekeyFlag = True
    Else
        OnekeyFlag = False
    End If
    KeyUpDown = Int(s(2))
    KeyLeftRight = Int(s(3))
    OneKey = Int(s(4))
    MaxTimeDb = Val(s(5))
    mouse_click_period = Val(s(6))
    MaxSpeed = Val(s(7))
End Sub

Sub SetColor()
    Dim iFileNum As Integer
    Dim s(10) As String
    Dim i As Integer
    
    iFileNum = FreeFile
    filename = App.Path & "\start.cor"
    Open filename For Input As #iFileNum
    Line Input #iFileNum, s(1)
    Line Input #iFileNum, s(2)
    Line Input #iFileNum, s(3)
    Line Input #iFileNum, s(4)
    Line Input #iFileNum, s(5)
    Line Input #iFileNum, s(6)
    Line Input #iFileNum, s(7)
    Line Input #iFileNum, s(8)
    Line Input #iFileNum, s(9)
    Line Input #iFileNum, s(10)
    Close #iFileNum
    filename = ""
    
    ColorChar = Val(s(1))
    ColorTab = Val(s(2))
    ColorSpace = Val(s(3))
    ColorEsc = Val(s(4))
    ColorPrint = Val(s(5))
    ColorInsert = Val(s(6))
    ColorNum = Val(s(7))
    ColorOperator = Val(s(8))
    ColorNumlock = Val(s(9))
    ColorForm = Val(s(10))
    Change_col = True
    
End Sub

