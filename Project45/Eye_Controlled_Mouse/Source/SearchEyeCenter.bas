Attribute VB_Name = "SearchEyeCenter"
'Option Explicit

'-------------------------Declare For Manage Device Context--------------------------------------
Public Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hDC As Long) As Long
Public Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hDC As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Public Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Public Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Public Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Public Declare Function SetPixel Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Public Declare Function GetPixel Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchBlt Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long

'---------------------------------Declare For Paint---------------------------------------------
Public Declare Function MoveToEx Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, lpPoint As POINTAPI) As Long
Public Declare Function LineTo Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function GetStockObject Lib "gdi32" (ByVal nIndex As Long) As Long
Public Declare Function CreatePen Lib "gdi32.dll" (ByVal fnPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
'Public Declare Function SetDCPenColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long

Public Sub PaintBorder(ByRef hDC As Long, ByVal ModeCap As Integer)
'****************Print Border Line**********************************
'-------------------------case 1---------------------------------------
    Dim Bpen As Long
    Dim pt As POINTAPI
    Bpen = CreatePen(PS_SOLID, 1, RGB(255, 0, 0))
    Call SelectObject(hDC, Bpen)
    'Call SelectObject(hDC, GetStockObject(WHITE_PEN)
    If ModeCap = 0 Then
        MoveToEx hDC, 30, 71, pt
        LineTo hDC, 30, 169
        LineTo hDC, 160, 169
        LineTo hDC, 160, 71
        LineTo hDC, 30, 71
    ElseIf ModeCap = 1 Then
        MoveToEx hDC, 94, 71, pt
        LineTo hDC, 94, 169
        LineTo hDC, 224, 169
        LineTo hDC, 224, 71
        LineTo hDC, 94, 71
    
    ElseIf ModeCap = 2 Then
        MoveToEx hDC, 62, 23, pt
        LineTo hDC, 62, 121
        LineTo hDC, 192, 121
        LineTo hDC, 192, 23
        LineTo hDC, 62, 23
    End If
    DeleteObject Bpen

'-------------------------case 2---------------------------------------
'    For x = 31 To 159
'        SetPixel hDCMaster, x, 72, RGB(255, 0, 0)  'use
'        SetPixel hDCMaster, x, 168, RGB(255, 0, 0) 'use
'    Next x
'    For y = 72 To 168
'        SetPixel hDCMaster, 31, y, RGB(0, 255, 0)  'use
'        SetPixel hDCMaster, 159, y, RGB(0, 255, 0) 'use
'    Next y
'*******************************************************************
End Sub

'*****************************************************************************************************
'***********************************Search Center ************************************************
'*****************************************************************************************************

Public Function SearchCenter(ByRef hDC As Long, ByVal px As Long, ByVal py As Long, ByVal ModeCap As Integer, ByVal OptionCap As Integer) As Position
    Dim TopBottom As PointTopBottom
    Dim LeftRight As PointLeftRight
    Dim Center As Position
    
    Dim ScopeLeft As Integer
    Dim ScopeRight As Integer
    Dim RWhite As RangeRGB
    RWhite.one = 20
    RWhite.two = 20
    RWhite.three = 20

    '------------------------------LeftEye--------------------------------
    If (ModeCap = 0) Then
        If (OptionCap = 0) Then
            'Step 1 Find Top Bottom
            TopBottom = FindTopBottom(hDC, 20, 0)
'            Eyeform.Label3.Caption = TopBottom.Top
'            Eyeform.Label4.Caption = TopBottom.Bottom
            'Step 2 Find Right Left
        '    LeftRight = FindLeftRight(hDC, TopBottom, 30, 35, 0)
        '    Eyeform.Label5.Caption = LeftRight.Left
        '    Eyeform.Label6.Caption = LeftRight.Right
            LeftRight = FindLeftRightNew(hDC, 1, 254, TopBottom, 30)
            LeftRight.Left = LeftRight.Left - 20
            LeftRight.Right = LeftRight.Right - 20
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
            'Step 3 FindCenter
            Center = FindCenter(TopBottom, LeftRight)
'            Eyeform.Label7.Caption = Center.X
'            Eyeform.Label8.Caption = Center.Y
        ElseIf (OptionCap = 1) Then
            'Step 1 Find Top Bottom
            TopBottom = FindTopBottom(hDC, 20, 0)
'            Eyeform.Label3.Caption = TopBottom.Top
'            Eyeform.Label4.Caption = TopBottom.Bottom
            'Step 2 Find Right Left
            LeftRight = FindLeftRight(hDC, TopBottom, 30, 35, 0)
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
'            LeftRight = FindLeftRightNew(hDC, 1, 254, TopBottom, 30)
'            LeftRight.Left = LeftRight.Left + 10
'            LeftRight.Right = LeftRight.Right + 10
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
            'Step 3 FindCenter
            Center = FindCenter(TopBottom, LeftRight)
'            Eyeform.Label7.Caption = Center.X
'            Eyeform.Label8.Caption = Center.Y
        ElseIf (OptionCap = 2) Then
            'Step '0
            Call FindScope(hDC, 20, 120, RWhite, 40, ScopeLeft, ScopeRight)
        
        
            '--------------Paint Scope--------------
            For Y = 0 To py
                SetPixel hDC, ScopeLeft, Y, RGB(0, 0, 255)
                SetPixel hDC, ScopeRight, Y, RGB(0, 0, 255)
            '    SetPixel hDC5, 63, Y, RGB(0, 255, 0)
            '    SetPixel hDC5, 127, Y, RGB(0, 255, 0)
            '   SetPixel hDC5, 191, Y, RGB(0, 255, 0)
            Next Y
        End If
   '----------------------------------------------------------------------------
    ElseIf (ModeCap = 1) Then
        If (OptionCap = 0) Then
            'Step 1 Find Top Bottom
            TopBottom = FindTopBottom(hDC, 20, 0)
'            Eyeform.Label3.Caption = TopBottom.Top
'            Eyeform.Label4.Caption = TopBottom.Bottom
            'Step 2 Find Right Left
        '    LeftRight = FindLeftRight(hDC, TopBottom, 30, 35, 0)
        '    Eyeform.Label5.Caption = LeftRight.Left
        '    Eyeform.Label6.Caption = LeftRight.Right
            LeftRight = FindLeftRightNew2(hDC, 254, 1, TopBottom, 30)
            LeftRight.Left = LeftRight.Left + 10
            LeftRight.Right = LeftRight.Right + 10
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
            'Step 3 FindCenter
            Center = FindCenter(TopBottom, LeftRight)
'            Eyeform.Label7.Caption = Center.X
'            Eyeform.Label8.Caption = Center.Y
        ElseIf (OptionCap = 1) Then
            'Step 1 Find Top Bottom
            TopBottom = FindTopBottom(hDC, 20, 0)
'            Eyeform.Label3.Caption = TopBottom.Top
'            Eyeform.Label4.Caption = TopBottom.Bottom
            'Step 2 Find Right Left
            LeftRight = FindLeftRight2(hDC, TopBottom, 30, 35, 0)
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
'            LeftRight = FindLeftRightNew(hDC, 1, 254, TopBottom, 30)
'            LeftRight.Left = LeftRight.Left + 10
'            LeftRight.Right = LeftRight.Right + 10
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
            'Step 3 FindCenter
            Center = FindCenter(TopBottom, LeftRight)
'            Eyeform.Label7.Caption = Center.X
'            Eyeform.Label8.Caption = Center.Y
        ElseIf (OptionCap = 2) Then
            'Step '0
            Call FindScope(hDC, 20, 120, RWhite, 40, ScopeLeft, ScopeRight)
        
        
            '--------------Paint Scope--------------
            For Y = 0 To py
                SetPixel hDC, ScopeLeft, Y, RGB(0, 0, 255)
                SetPixel hDC, ScopeRight, Y, RGB(0, 0, 255)
            '    SetPixel hDC5, 63, Y, RGB(0, 255, 0)
            '    SetPixel hDC5, 127, Y, RGB(0, 255, 0)
            '   SetPixel hDC5, 191, Y, RGB(0, 255, 0)
            Next Y
        End If
    ElseIf (ModeCap = 2) Then
        If (OptionCap = 0) Then
            'Step 1 Find Top Bottom
            TopBottom = FindTopBottom3(hDC, 245, 0)
'            Eyeform.Label3.Caption = TopBottom.Top
'            Eyeform.Label4.Caption = TopBottom.Bottom
            'Step 2 Find Right Left
        '    LeftRight = FindLeftRight(hDC, TopBottom, 30, 35, 0)
        '    Eyeform.Label5.Caption = LeftRight.Left
        '    Eyeform.Label6.Caption = LeftRight.Right
            LeftRight = FindLeftRightNew3(hDC, 1, 255, TopBottom, 245)
            LeftRight.Left = LeftRight.Left - 10
            LeftRight.Right = LeftRight.Right - 10
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
            'Step 3 FindCenter
            Center = FindCenter(TopBottom, LeftRight)
'            Eyeform.Label7.Caption = Center.X
'            Eyeform.Label8.Caption = Center.Y
        ElseIf (OptionCap = 1) Then
            'Step 1 Find Top Bottom
            TopBottom = FindTopBottom(hDC, 20, 0)
'            Eyeform.Label3.Caption = TopBottom.Top
'            Eyeform.Label4.Caption = TopBottom.Bottom
            'Step 2 Find Right Left
            LeftRight = FindLeftRight(hDC, TopBottom, 30, 35, 0)
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
'            LeftRight = FindLeftRightNew(hDC, 1, 254, TopBottom, 30)
'            LeftRight.Left = LeftRight.Left + 10
'            LeftRight.Right = LeftRight.Right + 10
'            Eyeform.Label5.Caption = LeftRight.Left
'            Eyeform.Label6.Caption = LeftRight.Right
            'Step 3 FindCenter
            Center = FindCenter(TopBottom, LeftRight)
'            Eyeform.Label7.Caption = Center.X
'            Eyeform.Label8.Caption = Center.Y
        ElseIf (OptionCap = 2) Then
            'Step '0
            Call FindScope(hDC, 20, 120, RWhite, 40, ScopeLeft, ScopeRight)
        
        
            '--------------Paint Scope--------------
            For Y = 0 To py
                SetPixel hDC, ScopeLeft, Y, RGB(0, 0, 255)
                SetPixel hDC, ScopeRight, Y, RGB(0, 0, 255)
            '    SetPixel hDC5, 63, Y, RGB(0, 255, 0)
            '    SetPixel hDC5, 127, Y, RGB(0, 255, 0)
            '   SetPixel hDC5, 191, Y, RGB(0, 255, 0)
            Next Y
        End If
    
    End If


    '----------------------------Paint------------------------------------
    Dim Bpen As Long
    Dim pt As POINTAPI
    Bpen = CreatePen(PS_SOLID, 1, RGB(0, 0, 255))
    Call SelectObject(hDC, Bpen)

    '-------------Paint Bottom------------------
    MoveToEx hDC, 0, TopBottom.Bottom, pt
    LineTo hDC, px, TopBottom.Bottom
    '---------------Paint Top--------------------
    MoveToEx hDC, 0, TopBottom.Top, pt
    LineTo hDC, px, TopBottom.Top
    '----------------Paint Left--------------------
    MoveToEx hDC, LeftRight.Left, 0, pt
    LineTo hDC, LeftRight.Left, py
    '----------------Paint  Right----------------
    MoveToEx hDC, LeftRight.Right, 0, pt
    LineTo hDC, LeftRight.Right, py

'---------------------------Paint old-------------------------
'    For x = 0 To px
'        SetPixel hDC, x, TopBottom.Top, RGB(0, 0, 255)
'        SetPixel hDC, x, TopBottom.Bottom, RGB(0, 0, 255)
'
'    '    SetPixel hDC5, X, 48, RGB(255, 0, 0)
'    '    SetPixel hDC5, X, 96, RGB(255, 0, 0)
'    '   SetPixel hDC5, X, 144, RGB(255, 0, 0)
'    Next x
'    For y = 0 To py
'        SetPixel hDC, LeftRight.Left, y, RGB(0, 0, 255)
'        SetPixel hDC, LeftRight.Right, y, RGB(0, 0, 255)
'    '    SetPixel hDC5, 63, Y, RGB(0, 255, 0)
'    '    SetPixel hDC5, 127, Y, RGB(0, 255, 0)
'    '   SetPixel hDC5, 191, Y, RGB(0, 255, 0)
'    Next y

    SearchCenter = Center
End Function

'*****************************************************************************************
'----------------------------------Function Find Scope------------------------------------
Private Function FindScope(ByRef hDC As Long, ByVal UB_Black As Integer, ByVal LB_White As Integer, ByRef RangeWhite As RangeRGB, ByVal PercentSMWin As Integer _
, ByRef ScopeLeft As Integer, ByRef ScopeRight As Integer) As Boolean
Dim LX, RX, Y, i As Integer
Dim CheckLeft, CheckRight As Boolean
Dim r, g, b As Integer
Dim color As Long
Dim DetectSkinL, DetectSkinR As Boolean
Dim PosL As Position
Dim PosR As Position

'----------------initial--------------------
'----------Primary--------------
CheckLeft = False
CheckRight = False
LX = 5
'---------Secondary-------------
DetectSkinL = False
DetectSkinR = False
'LY = 0
'RY = 0

Do
    For Y = 190 To 1 Step -1
        color = GetPixel(hDC, LX, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        '************************Section Left**************************
        If Not CheckLeft Then
            If (r - b > 38) Or (g - b > 38) Then
                DetectSkinL = True
            End If
            If DetectSkinL Then
                If (r >= LB_White And g >= LB_White And b >= LB_White) And _
                    (Abs(r - g) < RangeWhite.one And _
                    Abs(r - b) < RangeWhite.two And _
                    Abs(g - b) < RangeWhite.three) _
                Then
                    PosL.X = LX
                    PosL.Y = Y
                    If SmallWindowLeft(hDC, PosL, 0, UB_Black, LB_White, RangeWhite, PercentSMWin) Then
                        CheckLeft = True
                        ScopeLeft = PosL.X
                    End If
                ElseIf _
                    (r <= UB_Black And g <= UB_Black And b <= UB_Black) _
                Then
                    PosL.X = LX
                    PosL.Y = Y
                    If SmallWindowLeft(hDC, PosL, 1, UB_Black, LB_White, RangeWhite, PercentSMWin) Then
                        CheckLeft = True
                        ScopeLeft = PosL.X
                    End If
                End If
            End If
        End If
        
    Next
    If (LX = 254) Then
        Exit Do
    End If
    LX = LX + 1
Loop Until (CheckLeft) ' And CheckRight)

If CheckLeft Then
    For RX = 254 To PosL.X + 10 Step -1
        For Y = PosL.Y + 10 To PosL.Y - 10 Step -1
            color = GetPixel(hDC, RX, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
            r = color Mod 256
            g = Int(color / 256) Mod 256
            b = Int(color / 65536)
            '************************Section Right*************************
            If Not CheckRight Then
                If ((r - b > 38) Or (g - b > 38)) Then
                    DetectSkinR = True
                End If
                If DetectSkinR Then
                    If ((r >= LB_White And g >= LB_White And b >= LB_White) And _
                        (Abs(r - g) < RangeWhite.one And _
                        Abs(r - b) < RangeWhite.two And _
                        Abs(g - b) < RangeWhite.three)) _
                    Then
                        PosR.X = RX
                        PosR.Y = Y
                        If SmallWindowRight(hDC, PosR, LB_White, RangeWhite, PercentSMWin) Then
                            CheckRight = True
                            ScopeRight = PosR.X + 20
                            If ScopeRight > 254 Then
                                ScopeRight = 254
                            End If
                        End If
                    End If
                End If
            End If
        Next
    Next
End If
If CheckLeft And CheckRight Then
    FindScope = True
Else
    FindScope = False
End If
End Function


'----SmalWindow 5 Pixel (0 is White) (1 is Black)
Private Function SmallWindowLeft(ByRef hDC As Long, ByRef PosStart As Position, ByVal TypeColor As Integer, ByVal UB_Black As Integer, ByVal LB_White As Integer, ByRef RangeWhite As RangeRGB, ByVal PercentSMWin As Integer) As Boolean
Dim X, Y, SY As Integer
Dim Sum As Integer
Dim r, g, b As Integer
Dim color As Long
Dim BufferCompare, B1, P1 As Double
B1 = 5
P1 = PercentSMWin
BufferCompare = Fix((B1 * B1) * (P1 / 100))
'-----------------initial--------------------
Sum = 0
If PosStart.Y >= 478 And PosStart.Y <= 479 Then
    SY = 477
ElseIf PosStart.Y <= 1 And PosStart.Y >= 0 Then
    SY = 2
Else
    SY = PosStart.Y
End If
'--------------Create Window 5 Pixel-----------------
If TypeColor = 0 Then
    For X = PosStart.X To PosStart.X + 4 Step 1
        For Y = SY - 2 To SY + 2 Step 1
            color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
            r = color Mod 256
            g = Int(color / 256) Mod 256
            b = Int(color / 65536)
            '--White
            If ((r >= LB_White And g >= LB_White And b >= LB_White) And _
                (Abs(r - g) < RangeWhite.one And _
                Abs(r - b) < RangeWhite.two And _
                Abs(g - b) < RangeWhite.three)) _
            Then
                Sum = Sum + 1
            End If
        Next
    Next
ElseIf TypeColor = 1 Then
    For X = PosStart.X To PosStart.X + 4 Step 1
        For Y = SY - 2 To SY + 2 Step 1
            color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
            r = color Mod 256
            g = Int(color / 256) Mod 256
            b = Int(color / 65536)
            '--Black
            If (r <= UB_Black And g <= UB_Black And b <= UB_Black) Then
                Sum = Sum + 1
            End If
        Next
    Next
End If
'-----------------Check-------------------
If Sum >= BufferCompare Then
    SmallWindowLeft = True
Else
    SmallWindowLeft = False
End If
End Function

'----SmalWindow 5 Pixel (0 is White) (1 is Black)
Private Function SmallWindowRight(ByRef hDC As Long, ByRef PosStart As Position, ByVal LB_White As Integer, ByRef RangeWhite As RangeRGB, ByVal PercentSMWin As Integer) As Boolean
Dim X, Y, SY As Integer
Dim Sum As Integer
Dim r, g, b As Integer
Dim color As Long
Dim BufferCompare, B1, P1 As Double
B1 = 5
P1 = PercentSMWin
BufferCompare = Fix((B1 * B1) * (P1 / 100))
'-----------------initial--------------------
Sum = 0
If PosStart.Y >= 478 And PosStart.Y <= 479 Then
    SY = 477
ElseIf PosStart.Y <= 1 And PosStart.Y >= 0 Then
    SY = 2
Else
    SY = PosStart.Y
End If
'--------------Create Window 5 Pixel-----------------
For X = PosStart.X To PosStart.X + 4 Step 1
    For Y = SY - 2 To SY + 2 Step 1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        '--White
        If ((r >= LB_White And g >= LB_White And b >= LB_White) And _
            (Abs(r - g) < RangeWhite.one And _
            Abs(r - b) < RangeWhite.two And _
            Abs(g - b) < RangeWhite.three)) _
        Then
            Sum = Sum + 1
        End If
    Next
Next
'-----------------Check-------------------
If Sum >= BufferCompare Then
    SmallWindowRight = True
Else
    SmallWindowRight = False
End If
End Function


'****************************************************************************************
'-------------------------------Function Find TopBottom----------------------------------
Public Function FindTopBottomNew(ByRef hDC As Long, ByVal ScopeFirst As Integer, ByVal ScopeLast As Integer, ByVal UB As Integer, ByVal SetErrorTopEye As Integer) As PointTopBottom
Dim r, g, b, X, Y, i, BuffY, CheckRealBottom As Integer
Dim color As Long
Dim CheckExit, CheckBlack As Boolean
Dim out As PointTopBottom
CheckExit = False
'------------------------------------Find Bottom-----------------------------------------
For Y = 190 To 1 Step -1
    For X = ScopeFirst To ScopeLast Step 1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= UB And g <= UB And b <= UB Then
            'Count Start At Position Is Found
            CheckRealBottom = 1
            For i = 1 To 4 Step 1 '19
                color = GetPixel(hDC, X, Y + i) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
                r = color Mod 256
                g = Int(color / 256) Mod 256
                b = Int(color / 65536)
                If r <= UB And g <= UB And b <= UB Then
                    CheckRealBottom = CheckRealBottom + 1
                End If
            Next
            If CheckRealBottom > 3 Then
                'Skip search
                'BuffY = Y + 15 '60
                BuffY = Y
                out.Bottom = Y
                CheckExit = True
                Exit For
            End If
        End If
    Next
    If CheckExit Then
     Exit For
    End If
Next
'-----------------------------------Find Top-------------------------------------------
For Y = BuffY To 1 Step -1
    CheckBlack = False
    For X = ScopeFirst To ScopeLast Step 1
        'If pic(X, Y, 0) <> 255 Then
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= UB And g <= UB And b <= UB Then
            CheckBlack = True
            Exit For
        End If
    Next
    If CheckBlack = False Then
        'Decrease Error
        out.Top = Y + (SetErrorTopEye + 1)
        Exit For
    End If
Next
FindTopBottomNew = out
End Function

'-------------------------------Function Find LeftRight----------------------------------
'Pass 4 Parameter is TopBottomValue , UpperBound range black color, Percent black pixel in eyes(square), Percent Exit(Black pixel less than % -> exit
Public Function FindLeftRightNew(ByRef hDC As Long, ByVal ScopeFirst As Integer, ByVal ScopeLast As Integer, ByRef TopBottom As PointTopBottom, ByVal UB As Integer) As PointLeftRight
Dim rL1, gL1, bL1, rL2, gL2, bL2, rL3, gL3, bL3 As Integer
'Dim r, g, b As Integer
Dim Line1Y, AvgY, Line3Y, X, i, BuffStartCheckSquare, size As Integer
Dim color As Long
Dim AmountBlack As Long
Dim Pointer As Integer
Dim SumColumn() As Integer 'Sum Amoung Black Pixels Each Column
Dim PosEye_Error As PositionWindow
Dim out As PointLeftRight
'------------------------------------Find Black Point-----------------------------------------
'**********************Set initial Value***************************
Line1Y = (Round(((TopBottom.Top - TopBottom.Bottom) * 3) / 4) + TopBottom.Bottom)
AvgY = Round((TopBottom.Top + TopBottom.Bottom) / 2) '**Line2Y**
Line3Y = (Round((TopBottom.Top - TopBottom.Bottom) / 4) + TopBottom.Bottom)
PosEye_Error.MaxBlack = 0
PosEye_Error.Y = TopBottom.Top
size = (TopBottom.Bottom - TopBottom.Top) + 1
ReDim SumColumn(size - 1) As Integer '**Set Size for Array**
Pointer = 0
'******************************************************************
For X = ScopeFirst To ScopeLast Step 1
    color = GetPixel(hDC, X, Line1Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL1 = color Mod 256
    gL1 = Int(color / 256) Mod 256
    bL1 = Int(color / 65536)
    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL2 = color Mod 256
    gL2 = Int(color / 256) Mod 256
    bL2 = Int(color / 65536)
    color = GetPixel(hDC, X, Line3Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL3 = color Mod 256
    gL3 = Int(color / 256) Mod 256
    bL3 = Int(color / 65536)
'    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
'    r = color Mod 256
'    g = Int(color / 256) Mod 256
'    b = Int(color / 65536)
                
    If (rL1 <= UB And gL1 <= UB And bL1 <= UB) _
        Or (rL2 <= UB And gL2 <= UB And bL2 <= UB) _
        Or (rL3 <= UB And gL3 <= UB And bL3 <= UB) Then
'    If r <= UB And g <= UB And b <= UB Then
        BuffStartCheckSquare = X
        Exit For
    End If
Next

'---------------------------------------Find Eye---------------------------------------------
'**********************Step 1****************************
'**************Scan All Silding Window********************
Call CheckBlackEyeAll(hDC, BuffStartCheckSquare, TopBottom.Top, UB, size, 35, SumColumn, AmountBlack)
If AmountBlack > PosEye_Error.MaxBlack Then
    PosEye_Error.X = BuffStartCheckSquare
    PosEye_Error.MaxBlack = AmountBlack
End If

'**********************Step 2****************************
Dim StopSlidWnd As Integer
StopSlidWnd = ScopeLast
If StopSlidWnd + size > 254 Then
    StopSlidWnd = 254 - size
End If
For X = BuffStartCheckSquare + 1 To StopSlidWnd Step 1 '**
    Call CheckBlackEyeOneColumn(hDC, X, TopBottom.Top, UB, size, 35, SumColumn, Pointer, AmountBlack)
    If AmountBlack > PosEye_Error.MaxBlack Then
        PosEye_Error.X = X
        PosEye_Error.MaxBlack = AmountBlack
    End If
Next

out.Left = PosEye_Error.X
out.Right = PosEye_Error.X + size - 1

FindLeftRightNew = out
End Function


'****************************************************************************************
'-------------------------------Function Find TopBottom----------------------------------
Public Function FindTopBottom(ByRef hDC As Long, ByVal UB As Integer, ByVal SetErrorTopEye As Integer) As PointTopBottom
Dim r, g, b, X, Y, i, BuffY, CheckRealBottom As Integer
Dim color As Long
Dim CheckExit, CheckBlack As Boolean
Dim out As PointTopBottom
CheckExit = False
'------------------------------------Find Bottom-----------------------------------------
For Y = 190 To 1 Step -1
    For X = 1 To 254 Step 1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= UB And g <= UB And b <= UB Then
            'Count Start At Position Is Found
            CheckRealBottom = 1
            For i = 1 To 4 Step 1 '19
                color = GetPixel(hDC, X, Y + i) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
                r = color Mod 256
                g = Int(color / 256) Mod 256
                b = Int(color / 65536)
                If r <= UB And g <= UB And b <= UB Then
                    CheckRealBottom = CheckRealBottom + 1
                End If
            Next
            If CheckRealBottom > 3 Then
                'Skip search
                'BuffY = Y + 15 '60
                BuffY = Y
                out.Bottom = Y
                CheckExit = True
                Exit For
            End If
        End If
    Next
    If CheckExit Then
     Exit For
    End If
Next
'-----------------------------------Find Top-------------------------------------------
For Y = BuffY To 1 Step -1
    CheckBlack = False
    For X = 1 To 254 Step 1
        'If pic(X, Y, 0) <> 255 Then
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= UB And g <= UB And b <= UB Then
            CheckBlack = True
            Exit For
        End If
    Next
    If CheckBlack = False Then
        'Decrease Error
        out.Top = Y + (SetErrorTopEye + 1)
        Exit For
    End If
Next
FindTopBottom = out
End Function

'-------------------------------Function Find LeftRight----------------------------------
'Pass 4 Parameter is TopBottomValue , UpperBound range black color, Percent black pixel in eyes(square), Percent Exit(Black pixel less than % -> exit
Public Function FindLeftRight(ByRef hDC As Long, ByRef TopBottom As PointTopBottom, ByVal UB As Integer, ByVal PercentBlack As Integer, ByVal PercentExit As Integer) As PointLeftRight
Dim rL1, gL1, bL1, rL2, gL2, bL2, rL3, gL3, bL3 As Integer
'Dim r, g, b As Integer
Dim Line1Y, AvgY, Line3Y, X, i, BuffStartCheckSquare, size As Integer
Dim color As Long
Dim AmountBlack As Long
Dim Pointer As Integer
Dim SumColumn() As Integer 'Sum Amoung Black Pixels Each Column
Dim CheckBuffer, First As Boolean
Dim PosEyeFirst As Position
Dim PosEyeLast As Position
Dim PosEye_Error As PositionWindow
Dim out As PointLeftRight
'------------------------------------Find Black Point-----------------------------------------
'**********************Set initial Value***************************
Line1Y = (Round(((TopBottom.Top - TopBottom.Bottom) * 3) / 4) + TopBottom.Bottom)
AvgY = Round((TopBottom.Top + TopBottom.Bottom) / 2) '**Line2Y**
Line3Y = (Round((TopBottom.Top - TopBottom.Bottom) / 4) + TopBottom.Bottom)
PosEye_Error.MaxBlack = 0
PosEye_Error.Y = TopBottom.Top
size = (TopBottom.Bottom - TopBottom.Top) + 1
ReDim SumColumn(size - 1) As Integer '**Set Size for Array**
Pointer = 0
First = False
'******************************************************************
For X = 1 To 254 Step 1
    color = GetPixel(hDC, X, Line1Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL1 = color Mod 256
    gL1 = Int(color / 256) Mod 256
    bL1 = Int(color / 65536)
    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL2 = color Mod 256
    gL2 = Int(color / 256) Mod 256
    bL2 = Int(color / 65536)
    color = GetPixel(hDC, X, Line3Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL3 = color Mod 256
    gL3 = Int(color / 256) Mod 256
    bL3 = Int(color / 65536)
'    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
'    r = color Mod 256
'    g = Int(color / 256) Mod 256
'    b = Int(color / 65536)
                
    If (rL1 <= UB And gL1 <= UB And bL1 <= UB) _
        Or (rL2 <= UB And gL2 <= UB And bL2 <= UB) _
        Or (rL3 <= UB And gL3 <= UB And bL3 <= UB) Then
'    If r <= UB And g <= UB And b <= UB Then
        BuffStartCheckSquare = X
        Exit For
    End If
Next

'---------------------------------------Find Eye---------------------------------------------
'**********************Step 1****************************
'**************Scan All Sildin Window********************
If CheckBlackEyeAll(hDC, BuffStartCheckSquare, TopBottom.Top, UB, size, PercentBlack, SumColumn, AmountBlack) Then
'    PosEyeFirst.X = X
'    PosEyeFirst.Y = TopBottom.Top
'    First = True
'ElseIf Not First Then
    If AmountBlack > PosEye_Error.MaxBlack Then
        PosEye_Error.X = BuffStartCheckSquare
        PosEye_Error.MaxBlack = AmountBlack
    End If
End If

'**********************Step 2****************************
For X = BuffStartCheckSquare + 1 To 254 - size Step 1 '**
    CheckBuffer = CheckBlackEyeOneColumn(hDC, X, TopBottom.Top, UB, size, PercentBlack, SumColumn, Pointer, AmountBlack)
    If CheckBuffer And (Not First) Then
        PosEyeFirst.X = X
        PosEyeFirst.Y = TopBottom.Top
        First = True
    'it is cause to Delay
    ElseIf Not CheckBuffer And First Then
        PosEyeLast.X = X - 1
        PosEyeLast.Y = TopBottom.Top
        Exit For
    'Case: Use Highest Black point
    ElseIf Not First Then
        If AmountBlack > PosEye_Error.MaxBlack Then
            PosEye_Error.X = X
            PosEye_Error.MaxBlack = AmountBlack
        'Decrease Scan pic
        ElseIf AmountBlack < (size * size) * (PercentExit / 100) And (PosEye_Error.MaxBlack > (size * size) * (PercentExit / 100)) Then
            Exit For
        End If
    End If
Next

'-------------------------------------------------------------
If First Then
    out.Left = Round((PosEyeFirst.X + PosEyeLast.X) / 2)
    out.Right = (Round(PosEyeFirst.X + PosEyeLast.X) / 2) + size - 1
Else
    out.Left = PosEye_Error.X
    out.Right = PosEye_Error.X + size - 1
End If
FindLeftRight = out
End Function

'pass parameter X,Y is start square and k is pixel value
Public Function CheckBlackEyeAll(ByRef hDC As Long, ByVal StartX As Integer, ByVal StartY As Integer, ByVal UB As Integer _
, ByVal size As Integer, ByVal PercentBlack As Integer, ByRef SumColumn() As Integer, ByRef AmountBlack As Long) As Boolean
Dim color As Long
Dim r, g, b, X, Y, i As Integer
Dim SumS As Long
Dim BufferCompare, B1, P1 As Double
i = 0
SumS = 0
B1 = size
P1 = PercentBlack
BufferCompare = Fix((B1 * B1) * (P1 / 100))
'VB is Not immediate Return Value will Return at End Function
CheckBlackEyeAll = False
If StartX + size < 254 Then
    For X = StartX To (StartX + size) - 1 Step 1
        SumColumn(i) = 0
        For Y = StartY To (StartY - size) + 1 Step -1
            color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
            r = color Mod 256
            g = Int(color / 256) Mod 256
            b = Int(color / 65536)
            If r <= UB And g <= UB And b <= UB Then
                SumS = SumS + 1
                SumColumn(i) = SumColumn(i) + 1
            End If
        Next
        i = i + 1
    Next
AmountBlack = SumS 'have error
End If
If SumS >= BufferCompare Then
    CheckBlackEyeAll = True
Else
    CheckBlackEyeAll = False
End If
End Function

'pass parameter X,Y is start square and k is pixel value
Public Function CheckBlackEyeOneColumn(ByRef hDC As Long, ByVal StartX As Integer, ByVal StartY As Integer, ByVal UB As Integer, _
ByVal size As Integer, ByVal PercentBlack As Integer, ByRef SumColumn() As Integer, ByRef Pointer As Integer, ByRef AmountBlack As Long) As Boolean
Dim color As Long
Dim r, g, b, X, Y As Integer
Dim SumOneColumn As Long
Dim BufferCompare, B1, P1 As Double
B1 = size
P1 = PercentBlack
BufferCompare = Fix((B1 * B1) * (P1 / 100))
SumOneColumn = 0
X = StartX + size
'VB is Not immediate Return Value will Return at End Function
CheckBlackEyeOneColumn = False
'Sum 1 Column
If X < 254 Then
    For Y = StartY To (StartY - size) + 1 Step -1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= UB And g <= UB And b <= UB Then
            SumOneColumn = SumOneColumn + 1
        End If
    Next
    AmountBlack = (AmountBlack - SumColumn(Pointer)) + SumOneColumn
    SumColumn(Pointer) = SumOneColumn
    If Pointer = size - 1 Then
        Pointer = 0
    ElseIf Pointer < size - 1 Then
        Pointer = Pointer + 1
    End If
End If
If AmountBlack >= BufferCompare Then
    CheckBlackEyeOneColumn = True
Else
    CheckBlackEyeOneColumn = False
End If
End Function

'***************************************************************************************************************
'********************************************For Right Eye***************************************************
'***************************************************************************************************************
'-------------------------------Function Find LeftRight----------------------------------
'Pass 4 Parameter is TopBottomValue , UpperBound range black color, Percent black pixel in eyes(square), Percent Exit(Black pixel less than % -> exit
Public Function FindLeftRight2(ByRef hDC As Long, ByRef TopBottom As PointTopBottom, ByVal UB As Integer, ByVal PercentBlack As Integer, ByVal PercentExit As Integer) As PointLeftRight
Dim rL1, gL1, bL1, rL2, gL2, bL2, rL3, gL3, bL3 As Integer
'Dim r, g, b As Integer
Dim Line1Y, AvgY, Line3Y, X, i, BuffStartCheckSquare, size As Integer
Dim color As Long
Dim AmountBlack As Long
Dim Pointer As Integer
Dim SumColumn() As Integer 'Sum Amoung Black Pixels Each Column
Dim CheckBuffer, First As Boolean
Dim PosEyeFirst As Position
Dim PosEyeLast As Position
Dim PosEye_Error As PositionWindow
Dim out As PointLeftRight
'------------------------------------Find Black Point-----------------------------------------
'**********************Set initial Value***************************
Line1Y = (Round(((TopBottom.Top - TopBottom.Bottom) * 3) / 4) + TopBottom.Bottom)
AvgY = Round((TopBottom.Top + TopBottom.Bottom) / 2) '**Line2Y**
Line3Y = (Round((TopBottom.Top - TopBottom.Bottom) / 4) + TopBottom.Bottom)
PosEye_Error.MaxBlack = 0
PosEye_Error.Y = TopBottom.Top
size = (TopBottom.Bottom - TopBottom.Top) + 1
ReDim SumColumn(size - 1) As Integer '**Set Size for Array**
Pointer = 0
First = False
'******************************************************************
For X = 254 To 1 Step -1
    color = GetPixel(hDC, X, Line1Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL1 = color Mod 256
    gL1 = Int(color / 256) Mod 256
    bL1 = Int(color / 65536)
    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL2 = color Mod 256
    gL2 = Int(color / 256) Mod 256
    bL2 = Int(color / 65536)
    color = GetPixel(hDC, X, Line3Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL3 = color Mod 256
    gL3 = Int(color / 256) Mod 256
    bL3 = Int(color / 65536)
'    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
'    r = color Mod 256
'    g = Int(color / 256) Mod 256
'    b = Int(color / 65536)
                
    If (rL1 <= UB And gL1 <= UB And bL1 <= UB) _
        Or (rL2 <= UB And gL2 <= UB And bL2 <= UB) _
        Or (rL3 <= UB And gL3 <= UB And bL3 <= UB) Then
'    If r <= UB And g <= UB And b <= UB Then
        BuffStartCheckSquare = X
        Exit For
    End If
Next

'---------------------------------------Find Eye---------------------------------------------
'**********************Step 1****************************
'**************Scan All Sildin Window********************
If CheckBlackEyeAll2(hDC, BuffStartCheckSquare, TopBottom.Top, UB, size, PercentBlack, SumColumn, AmountBlack) Then
'    PosEyeFirst.X = X
'    PosEyeFirst.Y = TopBottom.Top
'    First = True
'ElseIf Not First Then
    If AmountBlack > PosEye_Error.MaxBlack Then
        PosEye_Error.X = BuffStartCheckSquare
        PosEye_Error.MaxBlack = AmountBlack
    End If
End If

'**********************Step 2****************************
For X = BuffStartCheckSquare - 1 To 1 + size Step -1 '**
    CheckBuffer = CheckBlackEyeOneColumn2(hDC, X, TopBottom.Top, UB, size, PercentBlack, SumColumn, Pointer, AmountBlack)
    If CheckBuffer And (Not First) Then
        PosEyeFirst.X = X
        PosEyeFirst.Y = TopBottom.Top
        First = True
    'it is cause to Delay
    ElseIf Not CheckBuffer And First Then
        PosEyeLast.X = X + 1
        PosEyeLast.Y = TopBottom.Top
        Exit For
    'Case: Use Highest Black point
    ElseIf Not First Then
        If AmountBlack > PosEye_Error.MaxBlack Then
            PosEye_Error.X = X
            PosEye_Error.MaxBlack = AmountBlack
        'Decrease Scan pic
        ElseIf AmountBlack < (size * size) * (PercentExit / 100) And (PosEye_Error.MaxBlack > (size * size) * (PercentExit / 100)) Then
            Exit For
        End If
    End If
Next

'-------------------------------------------------------------
If First Then
    out.Left = (Round(PosEyeFirst.X + PosEyeLast.X) / 2) - size + 1
    out.Right = Round((PosEyeFirst.X + PosEyeLast.X) / 2)
Else
    out.Left = PosEye_Error.X + size - 1
    out.Right = PosEye_Error.X
End If
FindLeftRight2 = out
End Function

'pass parameter X,Y is start square and k is pixel value
Public Function CheckBlackEyeAll2(ByRef hDC As Long, ByVal StartX As Integer, ByVal StartY As Integer, ByVal UB As Integer _
, ByVal size As Integer, ByVal PercentBlack As Integer, ByRef SumColumn() As Integer, ByRef AmountBlack As Long) As Boolean
Dim color As Long
Dim r, g, b, X, Y, i As Integer
Dim SumS As Long
Dim BufferCompare, B1, P1 As Double
i = 0
SumS = 0
B1 = size
P1 = PercentBlack
BufferCompare = Fix((B1 * B1) * (P1 / 100))
'VB is Not immediate Return Value will Return at End Function
CheckBlackEyeAll2 = False
If StartX - size > 1 Then
    For X = StartX To (StartX - size) + 1 Step -1
        SumColumn(i) = 0
        For Y = StartY To (StartY - size) + 1 Step -1
            color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
            r = color Mod 256
            g = Int(color / 256) Mod 256
            b = Int(color / 65536)
            If r <= UB And g <= UB And b <= UB Then
                SumS = SumS + 1
                SumColumn(i) = SumColumn(i) + 1
            End If
        Next
        i = i + 1
    Next
AmountBlack = SumS 'have error
End If
If SumS >= BufferCompare Then
    CheckBlackEyeAll2 = True
Else
    CheckBlackEyeAll2 = False
End If
End Function

'pass parameter X,Y is start square and k is pixel value
Public Function CheckBlackEyeOneColumn2(ByRef hDC As Long, ByVal StartX As Integer, ByVal StartY As Integer, ByVal UB As Integer, _
ByVal size As Integer, ByVal PercentBlack As Integer, ByRef SumColumn() As Integer, ByRef Pointer As Integer, ByRef AmountBlack As Long) As Boolean
Dim color As Long
Dim r, g, b, X, Y As Integer
Dim SumOneColumn As Long
Dim BufferCompare, B1, P1 As Double
B1 = size
P1 = PercentBlack
BufferCompare = Fix((B1 * B1) * (P1 / 100))
SumOneColumn = 0
X = StartX - size
'VB is Not immediate Return Value will Return at End Function
CheckBlackEyeOneColumn2 = False
'Sum 1 Column
If X > 1 Then
    For Y = StartY To (StartY - size) + 1 Step -1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= UB And g <= UB And b <= UB Then
            SumOneColumn = SumOneColumn + 1
        End If
    Next
    AmountBlack = (AmountBlack - SumColumn(Pointer)) + SumOneColumn
    SumColumn(Pointer) = SumOneColumn
    If Pointer = size - 1 Then
        Pointer = 0
    ElseIf Pointer < size - 1 Then
        Pointer = Pointer + 1
    End If
End If
If AmountBlack >= BufferCompare Then
    CheckBlackEyeOneColumn2 = True
Else
    CheckBlackEyeOneColumn2 = False
End If
End Function

'-------------------------------Function Find LeftRight----------------------------------
'Pass 4 Parameter is TopBottomValue , UpperBound range black color, Percent black pixel in eyes(square), Percent Exit(Black pixel less than % -> exit
Public Function FindLeftRightNew2(ByRef hDC As Long, ByVal ScopeFirst As Integer, ByVal ScopeLast As Integer, ByRef TopBottom As PointTopBottom, ByVal UB As Integer) As PointLeftRight
Dim rL1, gL1, bL1, rL2, gL2, bL2, rL3, gL3, bL3 As Integer
'Dim r, g, b As Integer
Dim Line1Y, AvgY, Line3Y, X, i, BuffStartCheckSquare, size As Integer
Dim color As Long
Dim AmountBlack As Long
Dim Pointer As Integer
Dim SumColumn() As Integer 'Sum Amoung Black Pixels Each Column
Dim PosEye_Error As PositionWindow
Dim out As PointLeftRight
'------------------------------------Find Black Point-----------------------------------------
'**********************Set initial Value***************************
Line1Y = (Round(((TopBottom.Top - TopBottom.Bottom) * 3) / 4) + TopBottom.Bottom)
AvgY = Round((TopBottom.Top + TopBottom.Bottom) / 2) '**Line2Y**
Line3Y = (Round((TopBottom.Top - TopBottom.Bottom) / 4) + TopBottom.Bottom)
PosEye_Error.MaxBlack = 0
PosEye_Error.Y = TopBottom.Top
size = (TopBottom.Bottom - TopBottom.Top) + 1
ReDim SumColumn(size - 1) As Integer '**Set Size for Array**
Pointer = 0
'******************************************************************
For X = ScopeFirst To ScopeLast Step -1
    color = GetPixel(hDC, X, Line1Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL1 = color Mod 256
    gL1 = Int(color / 256) Mod 256
    bL1 = Int(color / 65536)
    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL2 = color Mod 256
    gL2 = Int(color / 256) Mod 256
    bL2 = Int(color / 65536)
    color = GetPixel(hDC, X, Line3Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL3 = color Mod 256
    gL3 = Int(color / 256) Mod 256
    bL3 = Int(color / 65536)
'    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
'    r = color Mod 256
'    g = Int(color / 256) Mod 256
'    b = Int(color / 65536)
                
    If (rL1 <= UB And gL1 <= UB And bL1 <= UB) _
        Or (rL2 <= UB And gL2 <= UB And bL2 <= UB) _
        Or (rL3 <= UB And gL3 <= UB And bL3 <= UB) Then
'    If r <= UB And g <= UB And b <= UB Then
        BuffStartCheckSquare = X
        Exit For
    End If
Next

'---------------------------------------Find Eye---------------------------------------------
'**********************Step 1****************************
'**************Scan All Silding Window********************
Call CheckBlackEyeAll2(hDC, BuffStartCheckSquare, TopBottom.Top, UB, size, 35, SumColumn, AmountBlack)
If AmountBlack > PosEye_Error.MaxBlack Then
    PosEye_Error.X = BuffStartCheckSquare
    PosEye_Error.MaxBlack = AmountBlack
End If

'**********************Step 2****************************
Dim StopSlidWnd As Integer
StopSlidWnd = ScopeLast
If StopSlidWnd - size < 1 Then
    StopSlidWnd = 1 + size
End If
For X = BuffStartCheckSquare - 1 To StopSlidWnd Step -1 '**
    Call CheckBlackEyeOneColumn2(hDC, X, TopBottom.Top, UB, size, 35, SumColumn, Pointer, AmountBlack)
    If AmountBlack > PosEye_Error.MaxBlack Then
        PosEye_Error.X = X
        PosEye_Error.MaxBlack = AmountBlack
    End If
Next

out.Left = PosEye_Error.X - size + 1
out.Right = PosEye_Error.X

FindLeftRightNew2 = out
End Function


'Pass TopBottom , LeftRight Return ***Real Center***
Public Function FindCenter(ByRef TopBottom As PointTopBottom, ByRef LeftRight As PointLeftRight) As Position
Dim out As Position
Dim Sum As Integer
If 0 = (TopBottom.Top + TopBottom.Bottom) Mod 2 Then
    Sum = 0
Else
    Sum = 1
End If
out.Y = ((191 - TopBottom.Top) + (191 - TopBottom.Bottom)) / 2 + Sum
out.X = (LeftRight.Left + LeftRight.Right) / 2 + Sum
FindCenter = out
End Function

'-------------------------------Function Find TopBottom----------------------------------
Public Function FindTopBottom3(ByRef hDC As Long, ByVal UB As Integer, ByVal SetErrorTopEye As Integer) As PointTopBottom
Dim r, g, b, X, Y, i, BuffY, CheckRealBottom As Integer
Dim color As Long
Dim CheckExit, CheckBlack As Boolean
Dim out As PointTopBottom
CheckExit = False
'------------------------------------Find Bottom-----------------------------------------
For Y = 190 To 1 Step -1
    For X = 1 To 254 Step 1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= 80 And g <= 180 And b >= UB Then
            'Count Start At Position Is Found
            CheckRealBottom = 1
            For i = 1 To 4 Step 1 '19
                color = GetPixel(hDC, X, Y + i) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
                r = color Mod 256
                g = Int(color / 256) Mod 256
                b = Int(color / 65536)
                If r <= 80 And g <= 180 And b >= UB Then
                    CheckRealBottom = CheckRealBottom + 1
                End If
            Next
            If CheckRealBottom > 3 Then
                'Skip search
                'BuffY = Y + 15 '60
                BuffY = Y
                out.Bottom = Y
                CheckExit = True
                Exit For
            End If
        End If
    Next
    If CheckExit Then
     Exit For
    End If
Next
'-----------------------------------Find Top-------------------------------------------
For Y = BuffY To 1 Step -1
    CheckBlack = False
    For X = 1 To 254 Step 1
        'If pic(X, Y, 0) <> 255 Then
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= 80 And g <= 180 And b >= UB Then
            CheckBlack = True
            Exit For
        End If
    Next
    If CheckBlack = False Then
        'Decrease Error
        out.Top = Y + (SetErrorTopEye + 1)
        Exit For
    End If
Next
FindTopBottom3 = out
End Function

'-------------------------------Function Find LeftRight----------------------------------
'Pass 4 Parameter is TopBottomValue , UpperBound range black color, Percent black pixel in eyes(square), Percent Exit(Black pixel less than % -> exit
Public Function FindLeftRightNew3(ByRef hDC As Long, ByVal ScopeFirst As Integer, ByVal ScopeLast As Integer, ByRef TopBottom As PointTopBottom, ByVal UB As Integer) As PointLeftRight
Dim rL1, gL1, bL1, rL2, gL2, bL2, rL3, gL3, bL3 As Integer
'Dim r, g, b As Integer
Dim Line1Y, AvgY, Line3Y, X, i, BuffStartCheckSquare, size As Integer
Dim color As Long
Dim AmountBlack As Long
Dim Pointer As Integer
Dim SumColumn() As Integer 'Sum Amoung Black Pixels Each Column
Dim PosEye_Error As PositionWindow
Dim out As PointLeftRight
'------------------------------------Find Black Point-----------------------------------------
'**********************Set initial Value***************************
Line1Y = (Round(((TopBottom.Top - TopBottom.Bottom) * 3) / 4) + TopBottom.Bottom)
AvgY = Round((TopBottom.Top + TopBottom.Bottom) / 2) '**Line2Y**
Line3Y = (Round((TopBottom.Top - TopBottom.Bottom) / 4) + TopBottom.Bottom)
PosEye_Error.MaxBlack = 0
PosEye_Error.Y = TopBottom.Top
size = (TopBottom.Bottom - TopBottom.Top) + 1
ReDim SumColumn(size - 1) As Integer '**Set Size for Array**
Pointer = 0
'******************************************************************
For X = ScopeFirst To ScopeLast Step 1
    color = GetPixel(hDC, X, Line1Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL1 = color Mod 256
    gL1 = Int(color / 256) Mod 256
    bL1 = Int(color / 65536)
    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL2 = color Mod 256
    gL2 = Int(color / 256) Mod 256
    bL2 = Int(color / 65536)
    color = GetPixel(hDC, X, Line3Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
    rL3 = color Mod 256
    gL3 = Int(color / 256) Mod 256
    bL3 = Int(color / 65536)
'    color = GetPixel(hDC, X, AvgY) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
'    r = color Mod 256
'    g = Int(color / 256) Mod 256
'    b = Int(color / 65536)
                
    If (rL1 <= 80 And gL1 <= 180 And bL1 >= UB) _
        Or (rL2 <= 80 And gL2 <= 180 And bL2 >= UB) _
        Or (rL3 <= 80 And gL3 <= 180 And bL3 >= UB) Then
'    If r <= UB And g <= UB And b <= UB Then
        BuffStartCheckSquare = X
        Exit For
    End If
Next

'---------------------------------------Find Eye---------------------------------------------
'**********************Step 1****************************
'**************Scan All Silding Window********************
Call CheckBlackEyeAll3(hDC, BuffStartCheckSquare, TopBottom.Top, UB, size, 35, SumColumn, AmountBlack)
If AmountBlack > PosEye_Error.MaxBlack Then
    PosEye_Error.X = BuffStartCheckSquare
    PosEye_Error.MaxBlack = AmountBlack
End If

'**********************Step 2****************************
Dim StopSlidWnd As Integer
StopSlidWnd = ScopeLast
If StopSlidWnd + size > 255 Then
    StopSlidWnd = 255 - size + 1
End If
For X = BuffStartCheckSquare + 1 To StopSlidWnd Step 1 '**
    Call CheckBlackEyeOneColumn3(hDC, X, TopBottom.Top, UB, size, 35, SumColumn, Pointer, AmountBlack)
    If AmountBlack >= PosEye_Error.MaxBlack Then
        PosEye_Error.X = X
        PosEye_Error.MaxBlack = AmountBlack
    End If
Next

out.Left = PosEye_Error.X
out.Right = PosEye_Error.X + size - 1

FindLeftRightNew3 = out
End Function

'pass parameter X,Y is start square and k is pixel value
Public Function CheckBlackEyeAll3(ByRef hDC As Long, ByVal StartX As Integer, ByVal StartY As Integer, ByVal UB As Integer _
, ByVal size As Integer, ByVal PercentBlack As Integer, ByRef SumColumn() As Integer, ByRef AmountBlack As Long) As Boolean
Dim color As Long
Dim r, g, b, X, Y, i As Integer
Dim SumS As Long
Dim BufferCompare, B1, P1 As Double
i = 0
SumS = 0
B1 = size
P1 = PercentBlack
BufferCompare = Fix((B1 * B1) * (P1 / 100))
'VB is Not immediate Return Value will Return at End Function
CheckBlackEyeAll3 = False
If StartX + size < 255 Then
    For X = StartX To (StartX + size) - 1 Step 1
        SumColumn(i) = 0
        For Y = StartY To (StartY - size) + 1 Step -1
            color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
            r = color Mod 256
            g = Int(color / 256) Mod 256
            b = Int(color / 65536)
            If r <= 80 And g <= 180 And b >= UB Then
                SumS = SumS + 1
                SumColumn(i) = SumColumn(i) + 1
            End If
        Next
        i = i + 1
    Next
AmountBlack = SumS 'have error
End If
If SumS >= BufferCompare Then
    CheckBlackEyeAll3 = True
Else
    CheckBlackEyeAll3 = False
End If
End Function

'pass parameter X,Y is start square and k is pixel value
Public Function CheckBlackEyeOneColumn3(ByRef hDC As Long, ByVal StartX As Integer, ByVal StartY As Integer, ByVal UB As Integer, _
ByVal size As Integer, ByVal PercentBlack As Integer, ByRef SumColumn() As Integer, ByRef Pointer As Integer, ByRef AmountBlack As Long) As Boolean
Dim color As Long
Dim r, g, b, X, Y As Integer
Dim SumOneColumn As Long
Dim BufferCompare, B1, P1 As Double
B1 = size
P1 = PercentBlack
BufferCompare = Fix((B1 * B1) * (P1 / 100))
SumOneColumn = 0
X = StartX + size
'VB is Not immediate Return Value will Return at End Function
CheckBlackEyeOneColumn3 = False
'Sum 1 Column
If X < 255 Then
    For Y = StartY To (StartY - size) + 1 Step -1
        color = GetPixel(hDC, X, Y) 'นำค่าที่อยู่ในตัวแปรที่เป็นค่ารวม RGB มาแยก
        r = color Mod 256
        g = Int(color / 256) Mod 256
        b = Int(color / 65536)
        If r <= 80 And g <= 180 And b >= UB Then
            SumOneColumn = SumOneColumn + 1
        End If
    Next
    AmountBlack = (AmountBlack - SumColumn(Pointer)) + SumOneColumn
    SumColumn(Pointer) = SumOneColumn
    If Pointer = size - 1 Then
        Pointer = 0
    ElseIf Pointer < size - 1 Then
        Pointer = Pointer + 1
    End If
End If
If AmountBlack >= BufferCompare Then
    CheckBlackEyeOneColumn3 = True
Else
    CheckBlackEyeOneColumn3 = False
End If
End Function

