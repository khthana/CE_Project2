Option Explicit On 

Public Class FormMain
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents ToolBar1 As System.Windows.Forms.ToolBar
    Friend WithEvents imlMenu As System.Windows.Forms.ImageList
    Friend WithEvents imlToolBar As System.Windows.Forms.ImageList
    Friend WithEvents ToolBarButton1 As System.Windows.Forms.ToolBarButton
    Friend WithEvents ToolBarButton2 As System.Windows.Forms.ToolBarButton
    Friend WithEvents ToolBarButton3 As System.Windows.Forms.ToolBarButton
    Friend WithEvents ToolBarButton4 As System.Windows.Forms.ToolBarButton
    Friend WithEvents ToolBarButton5 As System.Windows.Forms.ToolBarButton
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem10 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemService As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemMainData As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemMemberData As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemCarData As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemMember As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemAddMember As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemImproveMember As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemAbout As System.Windows.Forms.MenuItem
    Friend WithEvents ToolBarButton7 As System.Windows.Forms.ToolBarButton
    Friend WithEvents ToolBarButton6 As System.Windows.Forms.ToolBarButton
    Friend WithEvents MenuItemRent As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItemReturn As System.Windows.Forms.MenuItem
    Friend WithEvents ToolBarButton8 As System.Windows.Forms.ToolBarButton
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(FormMain))
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.MenuItemService = New System.Windows.Forms.MenuItem
        Me.MenuItemRent = New System.Windows.Forms.MenuItem
        Me.MenuItemReturn = New System.Windows.Forms.MenuItem
        Me.MenuItemMember = New System.Windows.Forms.MenuItem
        Me.MenuItemAddMember = New System.Windows.Forms.MenuItem
        Me.MenuItemImproveMember = New System.Windows.Forms.MenuItem
        Me.MenuItemMainData = New System.Windows.Forms.MenuItem
        Me.MenuItemMemberData = New System.Windows.Forms.MenuItem
        Me.MenuItemCarData = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.MenuItem10 = New System.Windows.Forms.MenuItem
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.MenuItemAbout = New System.Windows.Forms.MenuItem
        Me.imlMenu = New System.Windows.Forms.ImageList(Me.components)
        Me.ToolBar1 = New System.Windows.Forms.ToolBar
        Me.ToolBarButton1 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton2 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton3 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton8 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton4 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton5 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton6 = New System.Windows.Forms.ToolBarButton
        Me.ToolBarButton7 = New System.Windows.Forms.ToolBarButton
        Me.imlToolBar = New System.Windows.Forms.ImageList(Me.components)
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemService, Me.MenuItemMember, Me.MenuItemMainData, Me.MenuItem3, Me.MenuItem4})
        '
        'MenuItemService
        '
        Me.MenuItemService.Index = 0
        Me.MenuItemService.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemRent, Me.MenuItemReturn})
        Me.MenuItemService.Text = "บริการ"
        '
        'MenuItemRent
        '
        Me.MenuItemRent.Index = 0
        Me.MenuItemRent.Text = "รถเข้า..."
        '
        'MenuItemReturn
        '
        Me.MenuItemReturn.Index = 1
        Me.MenuItemReturn.Text = "รถออก..."
        '
        'MenuItemMember
        '
        Me.MenuItemMember.Index = 1
        Me.MenuItemMember.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemAddMember, Me.MenuItemImproveMember})
        Me.MenuItemMember.Text = "สมาชิก"
        '
        'MenuItemAddMember
        '
        Me.MenuItemAddMember.Index = 0
        Me.MenuItemAddMember.Text = "เพิ่มข้อมูลสมาชิก..."
        '
        'MenuItemImproveMember
        '
        Me.MenuItemImproveMember.Index = 1
        Me.MenuItemImproveMember.Text = "ปรับปรุงสมาชิก..."
        '
        'MenuItemMainData
        '
        Me.MenuItemMainData.Index = 2
        Me.MenuItemMainData.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemMemberData, Me.MenuItemCarData})
        Me.MenuItemMainData.Text = "ข้อมูล"
        '
        'MenuItemMemberData
        '
        Me.MenuItemMemberData.Index = 0
        Me.MenuItemMemberData.Text = "ข้อมูลสมาชิก..."
        '
        'MenuItemCarData
        '
        Me.MenuItemCarData.Index = 1
        Me.MenuItemCarData.Text = "ข้อมูลรถ..."
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 3
        Me.MenuItem3.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem10})
        Me.MenuItem3.Text = "รายได้"
        '
        'MenuItem10
        '
        Me.MenuItem10.Index = 0
        Me.MenuItem10.Text = "รายได้จากการให้บริการ..."
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 4
        Me.MenuItem4.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemAbout})
        Me.MenuItem4.Text = "ช่วยเหลือ"
        '
        'MenuItemAbout
        '
        Me.MenuItemAbout.Index = 0
        Me.MenuItemAbout.Text = "เกี่ยวกับเรา"
        '
        'imlMenu
        '
        Me.imlMenu.ImageSize = New System.Drawing.Size(16, 16)
        Me.imlMenu.ImageStream = CType(resources.GetObject("imlMenu.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imlMenu.TransparentColor = System.Drawing.Color.Transparent
        '
        'ToolBar1
        '
        Me.ToolBar1.Appearance = System.Windows.Forms.ToolBarAppearance.Flat
        Me.ToolBar1.Buttons.AddRange(New System.Windows.Forms.ToolBarButton() {Me.ToolBarButton1, Me.ToolBarButton2, Me.ToolBarButton3, Me.ToolBarButton8, Me.ToolBarButton4, Me.ToolBarButton5, Me.ToolBarButton6, Me.ToolBarButton7})
        Me.ToolBar1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ToolBar1.DropDownArrows = True
        Me.ToolBar1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ToolBar1.ImageList = Me.imlToolBar
        Me.ToolBar1.Location = New System.Drawing.Point(0, 0)
        Me.ToolBar1.Name = "ToolBar1"
        Me.ToolBar1.ShowToolTips = True
        Me.ToolBar1.Size = New System.Drawing.Size(792, 45)
        Me.ToolBar1.TabIndex = 1
        '
        'ToolBarButton1
        '
        Me.ToolBarButton1.ImageIndex = 2
        Me.ToolBarButton1.Text = "รถเข้า"
        Me.ToolBarButton1.ToolTipText = "รถเข้าใช้บริการ"
        '
        'ToolBarButton2
        '
        Me.ToolBarButton2.ImageIndex = 6
        Me.ToolBarButton2.Text = "รถออก"
        Me.ToolBarButton2.ToolTipText = "รถเลิกใช้บริการ"
        '
        'ToolBarButton3
        '
        Me.ToolBarButton3.ImageIndex = 1
        Me.ToolBarButton3.Text = "สมาชิก"
        Me.ToolBarButton3.ToolTipText = "เพิ่มข้อมูลสมาชิก"
        '
        'ToolBarButton8
        '
        Me.ToolBarButton8.ImageIndex = 8
        Me.ToolBarButton8.Text = "ปรับปรุงสมาชิก"
        Me.ToolBarButton8.ToolTipText = "ปรับปรุงสมาชิกหมดอายุ"
        '
        'ToolBarButton4
        '
        Me.ToolBarButton4.ImageIndex = 5
        Me.ToolBarButton4.Text = "ข้อมูลสมาชิก"
        Me.ToolBarButton4.ToolTipText = "แสดงตารางข้อมูลสมาชิกทั้งหมด"
        '
        'ToolBarButton5
        '
        Me.ToolBarButton5.ImageIndex = 0
        Me.ToolBarButton5.Text = "ข้อมูลรถ"
        Me.ToolBarButton5.ToolTipText = "แสดงตารางข้อมูลรถทั้งหมด"
        '
        'ToolBarButton6
        '
        Me.ToolBarButton6.ImageIndex = 7
        Me.ToolBarButton6.Text = "เกี่ยวกับเรา"
        Me.ToolBarButton6.ToolTipText = "แสดงข้อมูลเกี่ยวกับเรา"
        '
        'ToolBarButton7
        '
        Me.ToolBarButton7.ImageIndex = 3
        Me.ToolBarButton7.Text = "จบการทำงาน"
        Me.ToolBarButton7.ToolTipText = "ปุ่มจบการทำงาน"
        '
        'imlToolBar
        '
        Me.imlToolBar.ImageSize = New System.Drawing.Size(16, 16)
        Me.imlToolBar.ImageStream = CType(resources.GetObject("imlToolBar.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.imlToolBar.TransparentColor = System.Drawing.Color.Transparent
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'Timer2
        '
        '
        'FormMain
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(792, 545)
        Me.Controls.Add(Me.ToolBar1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.IsMdiContainer = True
        Me.Menu = Me.MainMenu1
        Me.Name = "FormMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "ระบบลานจอดรถ"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim UseFont As New Font("MS Sans Serif", 10)
    Dim ToClose As Boolean = False

    Private Sub FormMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Dim fRent As New FormRent
        fRent.MdiParent = Me
        fRent.Show()
    End Sub

    'ซับรูทีน CloseAllChildForm()
    'ทำหน้าที่ปิดฟอร์มลูกทั้งหมด

    Private Sub CloseAllChildForm()
        Dim f As Form
        For Each f In Me.MdiChildren
            f.Close()
        Next
    End Sub

    Private Sub ToolBar1_ButtonClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.ToolBarButtonClickEventArgs) Handles ToolBar1.ButtonClick
        Select Case ToolBar1.Buttons.IndexOf(e.Button)
            Case 0
                CloseAllChildForm()
                Dim fRent As New FormRent
                fRent.MdiParent = Me
                fRent.Show()
            Case 1
                CloseAllChildForm()
                Dim fReturn As New FormReturn
                fReturn.MdiParent = Me
                fReturn.Show()
            Case 2
                Dim fAddMember As New FormAddMember
                fAddMember.ShowDialog()
            Case 3
                'Dim fImproveMember As New FormImproveMember
                'fImproveMember.ShowDialog(Me)
            Case 4
                Dim fMemberData As New FormMemberData
                fMemberData.ShowDialog(Me)
            Case 5
                Dim fCarData As New FormCarData
                fCarData.ShowDialog(Me)
            Case 6
                Dim fAbout As New FormAbout
                fAbout.ShowDialog(Me)
            Case 7
                If MessageBox.Show("คุณต้องการจบการทำงาน ใช่หรือไม่?", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                    End
                End If
        End Select
    End Sub

    'MainMenu

    Private Sub MenuItemImproveMember_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemImproveMember.Click
        'Dim fImproveMember As New FormImproveMember
        'fImproveMember.ShowDialog(Me)
    End Sub
    Private Sub MenuItemMemberData_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemMemberData.Click
        Dim fMemberData As New FormMemberData
        fMemberData.ShowDialog(Me)
    End Sub

    Private Sub MenuItemCarData_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemCarData.Click
        Dim fCarData As New FormCarData
        fCarData.ShowDialog(Me)
    End Sub

    Private Sub MenuItemRent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemRent.Click
        CloseAllChildForm()
        Dim fRent As New FormRent
        fRent.MdiParent = Me
        fRent.Show()
    End Sub

    Private Sub MenuItemReturn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemReturn.Click
        CloseAllChildForm()
        Dim fReturn As New FormReturn
        fReturn.MdiParent = Me
        fReturn.Show()
    End Sub

    Private Sub MenuItemAddMember_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemAddMember.Click
        Dim fAddMember As New FormAddMember
        fAddMember.ShowDialog(Me)
    End Sub

    Private Sub MenuItemAbout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemAbout.Click
        Dim fAbout As New FormAbout
        fAbout.ShowDialog(Me)
    End Sub

    'FadeInEffect

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Me.Opacity = Me.Opacity + 0.1
        If (Me.Opacity >= 1) Then
            Timer1.Enabled = False
        End If
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        Me.Opacity = Me.Opacity - 0.3
        If Me.Opacity = 0 Then
            ToClose = True
            End
        End If
    End Sub

    Private Sub FormMain_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        If ToClose = False Then
            If MessageBox.Show("คุณต้องการจบการทำงาน ใช่หรือไม่?", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                e.Cancel() = True
                Timer2.Enabled = True
            End If
        End If
    End Sub

End Class