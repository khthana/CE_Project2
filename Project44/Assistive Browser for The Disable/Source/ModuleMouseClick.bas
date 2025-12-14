Attribute VB_Name = "ModuleMouseClick"
    Const MOUSEEVENTF_LEFTDOWN = 2
    Const MOUSEEVENTF_LEFTUP = 4
    Const MOUSEEVENTF_MIDDLEDOWN = 32
    Const MOUSEEVENTF_MIDDLEUP = 64
    Const MOUSEEVENTF_MOVE = 1
    Const MOUSEEVENTF_RIGHTDOWN = 8
    Const MOUSEEVENTF_RIGHTUP = 16
'*สั่งให้กด left mouse
Sub mouse_press_left()
    mouse_event MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0 ' Send button left mouse down command
End Sub
'*สั่งให้กด right mouse
Sub mouse_press_right()
    mouse_event MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0 ' Send button right mouse down command
End Sub
'*สั่งให้กด middle mouse
Sub mouse_press_middle()
    mouse_event MOUSEEVENTF_MIDDLEDOWN, 0, 0, 0, 0 ' Send button middle mouse down command
End Sub
'*สั่งให้คลาย left mouse
Sub mouse_release_left()
    mouse_event MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 ' Send button left mouse up command
End Sub
'*สั่งให้คลาย right mouse
Sub mouse_release_right()
    mouse_event MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0 ' Send button right mouse up command
End Sub
'*สั่งให้คลาย middle mouse
Sub mouse_release_middle()
    mouse_event MOUSEEVENTF_MIDDLEUP, 0, 0, 0, 0 ' Send button middle mouse up command
End Sub
