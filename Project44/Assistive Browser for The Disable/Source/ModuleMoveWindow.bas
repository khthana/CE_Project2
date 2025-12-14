Attribute VB_Name = "ModuleMoveWindow"
Option Explicit
Public Sub MoveWindowPos(ByVal hwnd As Long, ByVal iWhere As Integer, Optional ByVal ToHwnd As Long)
'Pass the window handle of the window you want moved.  If you pass the optional window, then the
'first window will be centered to this second window.
'    mCenter = 5
'    mTopLeft = 7
'    mTopCenter = 8
'    mTopRight = 9
'    mCenterLeft = 4
'    mCenterRight = 6
'    mBottomLeft = 1
'    mBottomCenter = 2
'    mBottomRight = 3

    Dim dRect As RECT
    Dim lWidth As Long, lHeight As Long
    Dim lToWidth As Long, lToHeight As Long
    Dim lSWidth As Long, lSHeight As Long
    Dim lTop As Long, lLeft As Long
    Dim MenuH As Long '* เก็บค่าความสูงของ Menu Bar

    GetWindowRect hwnd, dRect                         'Get the window rectangle of the passed window
    With dRect                                        'Using the rectangle object
        lWidth = (.Right - .Left)                     'Get the width
        lHeight = (.Bottom - .Top)                    'Get the height of the window
    End With
    If ToHwnd > 0 Then                                'If we are centering to another window
        iWhere = iWhere + 20
        GetWindowRect ToHwnd, dRect                   'Get the rectangle object of that window
        With dRect                                    'Using the rectangle object
            lToWidth = (.Right - .Left)               'Get the width
            lToHeight = (.Bottom - .Top)              'Get the height of the window
        End With
    End If
    lSWidth = Screen.Width \ Screen.TwipsPerPixelX    'Calculate the screen width, in pixels
    lSHeight = Screen.Height \ Screen.TwipsPerPixelY  'Calc the screen height in pixels
    Select Case lSWidth
        Case 640: MenuH = 28
        Case 800: MenuH = 28
        Case 1024: MenuH = 25
    End Select
    
    Select Case iWhere                                'Where do we want to Position this?
        Case 5    'Center in screen
            lLeft = (lSWidth - lWidth) \ 2
            lTop = (lSHeight - lHeight) \ 2
        Case 7    'Top left screen
            lLeft = 0
            lTop = 0
        Case 8    'Top center screen
            lTop = 0
            lLeft = (lSWidth - lWidth) \ 2
        Case 9    'Top right screen
            lTop = 0
            lLeft = lSWidth - lWidth
        Case 4    'Left center screen
            lTop = (lSHeight - lHeight) \ 2
            lLeft = 0
        Case 6    'Right center screen
            lTop = (lSHeight - lHeight) \ 2
            lLeft = lSWidth - lWidth
        Case 1    'Bottom left screen
            lTop = lSHeight - lHeight - MenuH
            lLeft = 0
        Case 2    'Bottom center screen
            lTop = lSHeight - lHeight - MenuH
            lLeft = (lSWidth - lWidth) \ 2
        Case 3    'Bottom right screen
            lTop = lSHeight - lHeight - MenuH
            lLeft = lSWidth - lWidth
        Case 25   'Center in showing form
            lTop = dRect.Top + lToHeight \ 2 - lHeight \ 2
            lLeft = dRect.Left + lToWidth \ 2 - lWidth \ 2
        Case 27   'Top left in showing form
            lTop = dRect.Top
            lLeft = dRect.Left
        Case 28   'Top center in showing form
            lTop = dRect.Top
            lLeft = dRect.Left + lToWidth \ 2 - lWidth \ 2
        Case 29   'Top right in showing form
            lTop = dRect.Top
            lLeft = lToWidth + dRect.Left - lWidth
        Case 24   'Left center in showing form
            lTop = dRect.Top + lToHeight \ 2 - lHeight \ 2
            lLeft = dRect.Left
        Case 26   'Right center in showing form
            lTop = dRect.Top + lToHeight \ 2 - lHeight \ 2
            lLeft = lToWidth + dRect.Left - lWidth
        Case 21   'Bottom left in showing form
            lTop = lToHeight + dRect.Top - lHeight
            lLeft = dRect.Left
        Case 22   'Bottom center in showing form
            lTop = lToHeight + dRect.Top - lHeight
            lLeft = dRect.Left + lToWidth \ 2 - lWidth \ 2
        Case 23   'Bottom right in showing form
            lTop = lToHeight + dRect.Top - lHeight
            lLeft = lToWidth + dRect.Left - lWidth
        Case Else '(0) Center in screen
            lTop = (lSHeight - lHeight) \ 2
            lLeft = (lSWidth - lWidth) \ 2
    End Select
    MoveWindow hwnd, lLeft + 1, lTop, lWidth, lHeight, -1
End Sub

