Imports WMEncoderLib
Imports WMPREVIEWLib
Imports WMDEVICECONTROLLib
Imports MSPROPSHELLLib
Imports System.IO
Imports System.Threading
Imports WMSServerLib
Imports WMSTREAMLib
Imports System.Net
Imports System.Net.Sockets
Imports System.Text
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlCommand
Imports System.Runtime.InteropServices

Public Class Form1
    Inherits System.Windows.Forms.Form
    Dim Encoder As WMEncoder, Encoder1 As WMEncoder, Encoder2 As WMEncoder, Encoder3 As WMEncoder, Encoder4 As WMEncoder, Encoder0 As WMEncoder
    Dim Encoderx As WMEncoder, Encodery As WMEncoder, Encoderz As WMEncoder, Encodera As WMEncoder
    ' Add an audio source and a video source, then specify a source file.
    Dim SrcGrpColl As IWMEncSourceGroupCollection, SrcGrpCollx As IWMEncSourceGroupCollection, SrcGrpColly As IWMEncSourceGroupCollection, SrcGrpCollz As IWMEncSourceGroupCollection, SrcGrpColla As IWMEncSourceGroupCollection
    Dim SrcPlugMgr As IWMEncSourcePluginInfoManager, SrcPlugMgrx As IWMEncSourcePluginInfoManager, SrcPlugMgry As IWMEncSourcePluginInfoManager, SrcPlugMgrz As IWMEncSourcePluginInfoManager, SrcPlugMgra As IWMEncSourcePluginInfoManager
    Dim DCPlugMgr As IWMEncDeviceControlPluginInfoManager, DCPlugMgrx As IWMEncDeviceControlPluginInfoManager, DCPlugMgry As IWMEncDeviceControlPluginInfoManager, DCPlugMgrz As IWMEncDeviceControlPluginInfoManager, DCPlugMgra As IWMEncDeviceControlPluginInfoManager
    Dim PlugInfo As IWMEncPluginInfo, PlugInfox As IWMEncPluginInfo, PlugInfoy As IWMEncPluginInfo, PlugInfoz As IWMEncPluginInfo, PlugInfoa As IWMEncPluginInfo
    Dim SrcGrp As IWMEncSourceGroup2, SrcGrpx As IWMEncSourceGroup2, SrcGrpy As IWMEncSourceGroup2, SrcGrpz As IWMEncSourceGroup2, SrcGrpa As IWMEncSourceGroup2
    Dim SrcAud As IWMEncSource, SrcAudx As IWMEncSource, SrcAudy As IWMEncSource, SrcAudz As IWMEncSource, SrcAuda As IWMEncSource
    Dim SrcVid As IWMEncVideoSource, SrcVidx As IWMEncVideoSource, SrcVidy As IWMEncVideoSource, SrcVidz As IWMEncVideoSource, SrcVida As IWMEncVideoSource
    Dim File As IWMEncFile, Filex As IWMEncFile, Filey As IWMEncFile, Filez As IWMEncFile
    Dim conFigure As New Form2
    ' Create two IWMEncDataViewCollection objects, one for the
    ' preview collection and one for the postview collection
    Dim DVColl_Preview As IWMEncDataViewCollection, DVColl_Previewx As IWMEncDataViewCollection, DVColl_Previewy As IWMEncDataViewCollection, DVColl_Previewz As IWMEncDataViewCollection
    Dim DVColl_Previewa As IWMEncDataViewCollection, DVColl_Previewa1 As IWMEncDataViewCollection
    ' Create two WMEncDataView objects, one for previewing
    ' and one for postviewing.
    Dim PreView As WMEncDataView, PreView1 As WMEncDataView
    Dim PreViewx As WMEncDataView, PreViewy As WMEncDataView, PreViewz As WMEncDataView, PreViewa As WMEncDataView
    Dim PreViewx1 As WMEncDataView, PreViewy1 As WMEncDataView, PreViewz1 As WMEncDataView, PreViewa1 As WMEncDataView
    ' Declare variables to identify each stream.
    Dim lPreviewStream As Long, lPreviewStream1 As Long
    Dim lPreviewStreamx As Long, lPreviewStreamy As Long, lPreviewStreamz As Long, lPreviewStreama As Long
    Dim lPreviewStreamx1 As Long, lPreviewStreamy1 As Long, lPreviewStreamz1 As Long, lPreviewStreama1 As Long
    ' Retrieve an IWMEncDisplayInfo object.
    Dim Descr As IWMEncDisplayInfo, Descrx As IWMEncDisplayInfo, Descry As IWMEncDisplayInfo, Descrz As IWMEncDisplayInfo, Descra As IWMEncDisplayInfo
    'add propertie shell
    Dim clientConnect As New WMEncMonConnectionsPage
    ' Declare objects and variables profile.
    Dim ProColl As IWMEncProfileCollection, ProCollx As IWMEncProfileCollection, ProColly As IWMEncProfileCollection, ProCollz As IWMEncProfileCollection, ProColla As IWMEncProfileCollection
    Dim Pro As IWMEncProfile, Prox As IWMEncProfile, Proy As IWMEncProfile, Proz As IWMEncProfile, Proa As IWMEncProfile
    ' Create the StreamEditor object.
    Dim sProfileName As String, sVideo As String, sAudio As String, strFileName As String, strPathName As String, strExt As String
    Dim i As Integer, timeSleep As Long, timeSleepx As Long, timeSleepy As Long, timeSleepz As Long
    Dim x As Integer, y As Integer, z As Integer, BPort As Integer, BPort1 As Integer, BPort2 As Integer, BPort3 As Integer
    Dim iPindex As Integer, iRindex As Integer, Hour As Integer, Min As Integer, Sec As Integer, Counter As Integer
    Dim CurrentTime As Date, LimitTime As Date, CurrentDay As Date, CurrentMonth As Date, CurrentYear As Date, CurrentHour As Date, CurrentMin As Date, CurrentSec As Date
    Dim title As String, author As String, copyright As String, rating As String, descript As String, TTime As String, uname As String, pass As String, loginName As String, listFile As String
    Dim Brdcst As IWMEncBroadcast, Brdcstx As IWMEncBroadcast, Brdcsty As IWMEncBroadcast, Brdcstz As IWMEncBroadcast
    Dim t1 As Thread, t2 As Thread, Client1 As Thread, Client2 As Thread, Client3 As Thread, Client4 As Thread, Client0 As Thread
    Dim t1x As Thread, t1y As Thread, t1z As Thread, turnLeft As Thread, turnRight As Thread, threadAuto As Thread
    Dim autoMode As Boolean, check As Boolean
    Dim plugin As IWMSPlugin, pluginx As IWMSPlugin, pluginy As IWMSPlugin, pluginz As IWMSPlugin, plugina As IWMSPlugin
    Dim clientCount As Integer, bufferSize As Integer, bitRateIndex As Integer
    Dim serverSocket As Socket
    Dim ipItem As IPEndPoint
    Dim byteData(1024) As Byte
    Dim clientState(4) As Integer
    Dim port(4) As Integer
    Dim status As String
    Dim objectConn As SqlConnection
    Dim cmd As SqlCommand
    Dim objectReader As SqlDataReader
    Dim recFileName As String
    Dim threadUse As Integer, sessionNo As Integer, sessionCreate As Integer
    Dim checking As Boolean, autoPan As Boolean
    Dim index As Integer
    Dim logPage As Form4
    Dim btMStart(3) As Boolean, btAStart(3) As Boolean, btMStop(3) As Boolean, btAStop(3) As Boolean
    Dim portAddr As portAccess = New portAccess
    Dim address As Integer, readVal As Integer, currentArc As Integer, stepArc As Integer
    Dim BstPort(3) As Boolean

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
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents cboProfile As System.Windows.Forms.ComboBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents cboVideoSource As System.Windows.Forms.ComboBox
    Friend WithEvents cboAudioSource As System.Windows.Forms.ComboBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents FolderBrowserDialog1 As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents Button7 As System.Windows.Forms.Button
    Friend WithEvents Button8 As System.Windows.Forms.Button
    Friend WithEvents PreviewFrame As System.Windows.Forms.Panel
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Button5 As System.Windows.Forms.Button
    Friend WithEvents Button6 As System.Windows.Forms.Button
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents cboTime As System.Windows.Forms.ComboBox
    Friend WithEvents PropPageShell As AxMSPROPSHELLLib.AxMSPropShell
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents PostviewFrame1 As System.Windows.Forms.Panel
    Friend WithEvents PostviewFrame2 As System.Windows.Forms.Panel
    Friend WithEvents PostviewFrame4 As System.Windows.Forms.Panel
    Friend WithEvents PostviewFrame3 As System.Windows.Forms.Panel
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem2 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem5 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem6 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem7 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem8 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem9 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem10 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem11 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem12 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem13 As System.Windows.Forms.MenuItem
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents lbSession As System.Windows.Forms.Label
    'Friend WithEvents switch4 As System.Windows.Forms
    Friend WithEvents cboCam As System.Windows.Forms.ComboBox
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents ComboBox2 As System.Windows.Forms.ComboBox
    Friend WithEvents LinkLabel1 As System.Windows.Forms.LinkLabel
    Friend WithEvents LinkLabel2 As System.Windows.Forms.LinkLabel
    Friend WithEvents LinkLabel3 As System.Windows.Forms.LinkLabel
    Friend WithEvents bnAuto As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
        Me.Button1 = New System.Windows.Forms.Button
        Me.cboProfile = New System.Windows.Forms.ComboBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.cboVideoSource = New System.Windows.Forms.ComboBox
        Me.cboAudioSource = New System.Windows.Forms.ComboBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.Button2 = New System.Windows.Forms.Button
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Button3 = New System.Windows.Forms.Button
        Me.FolderBrowserDialog1 = New System.Windows.Forms.FolderBrowserDialog
        Me.Label7 = New System.Windows.Forms.Label
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.Button4 = New System.Windows.Forms.Button
        Me.PreviewFrame = New System.Windows.Forms.Panel
        Me.Button7 = New System.Windows.Forms.Button
        Me.Button8 = New System.Windows.Forms.Button
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.PostviewFrame1 = New System.Windows.Forms.Panel
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label10 = New System.Windows.Forms.Label
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.Label14 = New System.Windows.Forms.Label
        Me.ComboBox1 = New System.Windows.Forms.ComboBox
        Me.Label12 = New System.Windows.Forms.Label
        Me.cboTime = New System.Windows.Forms.ComboBox
        Me.Label11 = New System.Windows.Forms.Label
        Me.Button5 = New System.Windows.Forms.Button
        Me.Button6 = New System.Windows.Forms.Button
        Me.Label17 = New System.Windows.Forms.Label
        Me.Label16 = New System.Windows.Forms.Label
        Me.PropPageShell = New AxMSPROPSHELLLib.AxMSPropShell
        Me.PostviewFrame2 = New System.Windows.Forms.Panel
        Me.PostviewFrame4 = New System.Windows.Forms.Panel
        Me.PostviewFrame3 = New System.Windows.Forms.Panel
        Me.Label9 = New System.Windows.Forms.Label
        Me.Label15 = New System.Windows.Forms.Label
        Me.Label18 = New System.Windows.Forms.Label
        Me.Label19 = New System.Windows.Forms.Label
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.MenuItem2 = New System.Windows.Forms.MenuItem
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.MenuItem11 = New System.Windows.Forms.MenuItem
        Me.MenuItem12 = New System.Windows.Forms.MenuItem
        Me.MenuItem13 = New System.Windows.Forms.MenuItem
        Me.MenuItem5 = New System.Windows.Forms.MenuItem
        Me.MenuItem6 = New System.Windows.Forms.MenuItem
        Me.MenuItem7 = New System.Windows.Forms.MenuItem
        Me.MenuItem8 = New System.Windows.Forms.MenuItem
        Me.MenuItem9 = New System.Windows.Forms.MenuItem
        Me.MenuItem10 = New System.Windows.Forms.MenuItem
        Me.Label13 = New System.Windows.Forms.Label
        Me.lbSession = New System.Windows.Forms.Label
        Me.cboCam = New System.Windows.Forms.ComboBox
        Me.Label20 = New System.Windows.Forms.Label
        Me.ComboBox2 = New System.Windows.Forms.ComboBox
        Me.LinkLabel1 = New System.Windows.Forms.LinkLabel
        Me.LinkLabel2 = New System.Windows.Forms.LinkLabel
        Me.LinkLabel3 = New System.Windows.Forms.LinkLabel
        Me.bnAuto = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.PropPageShell, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(96, 64)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(64, 21)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Start"
        '
        'cboProfile
        '
        Me.cboProfile.Location = New System.Drawing.Point(104, 64)
        Me.cboProfile.Name = "cboProfile"
        Me.cboProfile.Size = New System.Drawing.Size(352, 21)
        Me.cboProfile.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(24, 40)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(72, 16)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Video Source"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(480, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(72, 16)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "Audio Source"
        '
        'cboVideoSource
        '
        Me.cboVideoSource.Location = New System.Drawing.Point(104, 32)
        Me.cboVideoSource.Name = "cboVideoSource"
        Me.cboVideoSource.Size = New System.Drawing.Size(352, 21)
        Me.cboVideoSource.TabIndex = 4
        '
        'cboAudioSource
        '
        Me.cboAudioSource.Location = New System.Drawing.Point(560, 32)
        Me.cboAudioSource.Name = "cboAudioSource"
        Me.cboAudioSource.Size = New System.Drawing.Size(272, 21)
        Me.cboAudioSource.TabIndex = 5
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(24, 104)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(64, 16)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Output path"
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(104, 96)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.Size = New System.Drawing.Size(280, 20)
        Me.TextBox1.TabIndex = 7
        Me.TextBox1.Text = ""
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(392, 96)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(64, 21)
        Me.Button2.TabIndex = 8
        Me.Button2.Text = "Browse"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(24, 72)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(64, 16)
        Me.Label4.TabIndex = 9
        Me.Label4.Text = "Codec use"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(480, 72)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(192, 16)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "Display Information Setting(Optional)"
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(680, 64)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(72, 21)
        Me.Button3.TabIndex = 13
        Me.Button3.Text = "Configure"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(24, 32)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(56, 16)
        Me.Label7.TabIndex = 14
        Me.Label7.Text = "File name"
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(96, 24)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(216, 20)
        Me.TextBox2.TabIndex = 15
        Me.TextBox2.Text = ""
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(24, 64)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(56, 16)
        Me.Label8.TabIndex = 16
        Me.Label8.Text = "Encoding"
        '
        'Button4
        '
        Me.Button4.Location = New System.Drawing.Point(192, 64)
        Me.Button4.Name = "Button4"
        Me.Button4.Size = New System.Drawing.Size(64, 21)
        Me.Button4.TabIndex = 17
        Me.Button4.Text = "Stop"
        '
        'PreviewFrame
        '
        Me.PreviewFrame.BackColor = System.Drawing.SystemColors.HighlightText
        Me.PreviewFrame.Location = New System.Drawing.Point(80, 272)
        Me.PreviewFrame.Name = "PreviewFrame"
        Me.PreviewFrame.Size = New System.Drawing.Size(336, 216)
        Me.PreviewFrame.TabIndex = 19
        '
        'Button7
        '
        Me.Button7.Location = New System.Drawing.Point(200, 528)
        Me.Button7.Name = "Button7"
        Me.Button7.Size = New System.Drawing.Size(64, 21)
        Me.Button7.TabIndex = 22
        Me.Button7.Text = "Left"
        '
        'Button8
        '
        Me.Button8.Location = New System.Drawing.Point(288, 528)
        Me.Button8.Name = "Button8"
        Me.Button8.Size = New System.Drawing.Size(64, 21)
        Me.Button8.TabIndex = 23
        Me.Button8.Text = "Right"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.TextBox2)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.Button4)
        Me.GroupBox1.Controls.Add(Me.Button1)
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(80, 136)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(336, 96)
        Me.GroupBox1.TabIndex = 26
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Manual Mode"
        '
        'PostviewFrame1
        '
        Me.PostviewFrame1.BackColor = System.Drawing.SystemColors.HighlightText
        Me.PostviewFrame1.Location = New System.Drawing.Point(456, 272)
        Me.PostviewFrame1.Name = "PostviewFrame1"
        Me.PostviewFrame1.Size = New System.Drawing.Size(152, 96)
        Me.PostviewFrame1.TabIndex = 20
        '
        'Label5
        '
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label5.Location = New System.Drawing.Point(80, 256)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(48, 16)
        Me.Label5.TabIndex = 18
        Me.Label5.Text = "Preview"
        '
        'Label10
        '
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label10.Location = New System.Drawing.Point(88, 532)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(96, 16)
        Me.Label10.TabIndex = 28
        Me.Label10.Text = "Control Camera :"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Label14)
        Me.GroupBox2.Controls.Add(Me.ComboBox1)
        Me.GroupBox2.Controls.Add(Me.Label12)
        Me.GroupBox2.Controls.Add(Me.cboTime)
        Me.GroupBox2.Controls.Add(Me.Label11)
        Me.GroupBox2.Controls.Add(Me.Button5)
        Me.GroupBox2.Controls.Add(Me.Button6)
        Me.GroupBox2.Controls.Add(Me.Label17)
        Me.GroupBox2.Location = New System.Drawing.Point(456, 136)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(336, 96)
        Me.GroupBox2.TabIndex = 29
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Automatic Mode"
        '
        'Label14
        '
        Me.Label14.Location = New System.Drawing.Point(240, 32)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(64, 16)
        Me.Label14.TabIndex = 33
        Me.Label14.Text = "Mins / Files"
        '
        'ComboBox1
        '
        Me.ComboBox1.Items.AddRange(New Object() {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"})
        Me.ComboBox1.Location = New System.Drawing.Point(192, 26)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(48, 21)
        Me.ComboBox1.TabIndex = 32
        Me.ComboBox1.Text = "0"
        '
        'Label12
        '
        Me.Label12.Location = New System.Drawing.Point(152, 32)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(40, 16)
        Me.Label12.TabIndex = 2
        Me.Label12.Text = "Hours"
        '
        'cboTime
        '
        Me.cboTime.Items.AddRange(New Object() {"2", "3", "4", "5", "6", "7", "8", "9", "0"})
        Me.cboTime.Location = New System.Drawing.Point(104, 26)
        Me.cboTime.Name = "cboTime"
        Me.cboTime.Size = New System.Drawing.Size(48, 21)
        Me.cboTime.TabIndex = 1
        Me.cboTime.Text = "1"
        '
        'Label11
        '
        Me.Label11.Location = New System.Drawing.Point(24, 32)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(72, 16)
        Me.Label11.TabIndex = 0
        Me.Label11.Text = "Video length"
        '
        'Button5
        '
        Me.Button5.Location = New System.Drawing.Point(88, 64)
        Me.Button5.Name = "Button5"
        Me.Button5.Size = New System.Drawing.Size(64, 21)
        Me.Button5.TabIndex = 31
        Me.Button5.Text = "Start"
        '
        'Button6
        '
        Me.Button6.Location = New System.Drawing.Point(176, 64)
        Me.Button6.Name = "Button6"
        Me.Button6.Size = New System.Drawing.Size(64, 21)
        Me.Button6.TabIndex = 18
        Me.Button6.Text = "Stop"
        '
        'Label17
        '
        Me.Label17.Location = New System.Drawing.Point(24, 64)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(56, 16)
        Me.Label17.TabIndex = 18
        Me.Label17.Text = "Encoding"
        '
        'Label16
        '
        Me.Label16.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label16.Location = New System.Drawing.Point(128, 256)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(144, 16)
        Me.Label16.TabIndex = 33
        '
        'PropPageShell
        '
        Me.PropPageShell.Enabled = True
        Me.PropPageShell.Location = New System.Drawing.Point(80, 552)
        Me.PropPageShell.Name = "PropPageShell"
        Me.PropPageShell.OcxState = CType(resources.GetObject("PropPageShell.OcxState"), System.Windows.Forms.AxHost.State)
        Me.PropPageShell.Size = New System.Drawing.Size(712, 144)
        Me.PropPageShell.TabIndex = 34
        '
        'PostviewFrame2
        '
        Me.PostviewFrame2.BackColor = System.Drawing.SystemColors.HighlightText
        Me.PostviewFrame2.Location = New System.Drawing.Point(640, 272)
        Me.PostviewFrame2.Name = "PostviewFrame2"
        Me.PostviewFrame2.Size = New System.Drawing.Size(152, 96)
        Me.PostviewFrame2.TabIndex = 21
        '
        'PostviewFrame4
        '
        Me.PostviewFrame4.BackColor = System.Drawing.SystemColors.HighlightText
        Me.PostviewFrame4.Location = New System.Drawing.Point(640, 392)
        Me.PostviewFrame4.Name = "PostviewFrame4"
        Me.PostviewFrame4.Size = New System.Drawing.Size(152, 96)
        Me.PostviewFrame4.TabIndex = 21
        '
        'PostviewFrame3
        '
        Me.PostviewFrame3.BackColor = System.Drawing.SystemColors.HighlightText
        Me.PostviewFrame3.Location = New System.Drawing.Point(456, 392)
        Me.PostviewFrame3.Name = "PostviewFrame3"
        Me.PostviewFrame3.Size = New System.Drawing.Size(152, 96)
        Me.PostviewFrame3.TabIndex = 38
        '
        'Label9
        '
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label9.Location = New System.Drawing.Point(456, 256)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(56, 16)
        Me.Label9.TabIndex = 39
        Me.Label9.Text = "Camera 1"
        '
        'Label15
        '
        Me.Label15.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label15.Location = New System.Drawing.Point(640, 256)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(56, 16)
        Me.Label15.TabIndex = 40
        Me.Label15.Text = "Camera 2"
        '
        'Label18
        '
        Me.Label18.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label18.Location = New System.Drawing.Point(456, 376)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(56, 16)
        Me.Label18.TabIndex = 41
        Me.Label18.Text = "Camera 3"
        '
        'Label19
        '
        Me.Label19.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label19.Location = New System.Drawing.Point(640, 376)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(56, 16)
        Me.Label19.TabIndex = 42
        Me.Label19.Text = "Camera 4"
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1, Me.MenuItem6, Me.MenuItem8})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem2, Me.MenuItem4, Me.MenuItem5})
        Me.MenuItem1.Text = "File"
        '
        'MenuItem2
        '
        Me.MenuItem2.Index = 0
        Me.MenuItem2.Text = "New Session"
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 1
        Me.MenuItem4.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem3, Me.MenuItem11, Me.MenuItem12, Me.MenuItem13})
        Me.MenuItem4.Text = "Load Session"
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 0
        Me.MenuItem3.Text = "No. 0"
        '
        'MenuItem11
        '
        Me.MenuItem11.Enabled = False
        Me.MenuItem11.Index = 1
        Me.MenuItem11.Text = "No. 1"
        '
        'MenuItem12
        '
        Me.MenuItem12.Enabled = False
        Me.MenuItem12.Index = 2
        Me.MenuItem12.Text = "No. 2"
        '
        'MenuItem13
        '
        Me.MenuItem13.Enabled = False
        Me.MenuItem13.Index = 3
        Me.MenuItem13.Text = "No. 3"
        '
        'MenuItem5
        '
        Me.MenuItem5.Index = 2
        Me.MenuItem5.Text = "Exit"
        '
        'MenuItem6
        '
        Me.MenuItem6.Index = 1
        Me.MenuItem6.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem7})
        Me.MenuItem6.Text = "Setting"
        '
        'MenuItem7
        '
        Me.MenuItem7.Index = 0
        Me.MenuItem7.Text = "System Config(Security Setting)"
        '
        'MenuItem8
        '
        Me.MenuItem8.Index = 2
        Me.MenuItem8.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem9, Me.MenuItem10})
        Me.MenuItem8.Text = "Window"
        '
        'MenuItem9
        '
        Me.MenuItem9.Index = 0
        Me.MenuItem9.Text = "About us"
        '
        'MenuItem10
        '
        Me.MenuItem10.Index = 1
        Me.MenuItem10.Text = "Log file"
        '
        'Label13
        '
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label13.Location = New System.Drawing.Point(24, 8)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(112, 16)
        Me.Label13.TabIndex = 47
        Me.Label13.Text = "Application session"
        '
        'lbSession
        '
        Me.lbSession.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.lbSession.Location = New System.Drawing.Point(144, 8)
        Me.lbSession.Name = "lbSession"
        Me.lbSession.Size = New System.Drawing.Size(304, 16)
        Me.lbSession.TabIndex = 48
        Me.lbSession.Text = "No session were created ..."
        '
        'cboCam
        '
        Me.cboCam.Location = New System.Drawing.Point(312, 248)
        Me.cboCam.Name = "cboCam"
        Me.cboCam.Size = New System.Drawing.Size(104, 21)
        Me.cboCam.TabIndex = 49
        '
        'Label20
        '
        Me.Label20.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label20.Location = New System.Drawing.Point(88, 504)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(64, 16)
        Me.Label20.TabIndex = 51
        Me.Label20.Text = "Angle step"
        '
        'ComboBox2
        '
        Me.ComboBox2.Enabled = False
        Me.ComboBox2.Items.AddRange(New Object() {"1", "2", "3", "4", "5"})
        Me.ComboBox2.Location = New System.Drawing.Point(160, 496)
        Me.ComboBox2.Name = "ComboBox2"
        Me.ComboBox2.Size = New System.Drawing.Size(56, 21)
        Me.ComboBox2.TabIndex = 52
        Me.ComboBox2.Text = "1"
        '
        'LinkLabel1
        '
        Me.LinkLabel1.LinkColor = System.Drawing.Color.Black
        Me.LinkLabel1.Location = New System.Drawing.Point(224, 504)
        Me.LinkLabel1.Name = "LinkLabel1"
        Me.LinkLabel1.Size = New System.Drawing.Size(48, 16)
        Me.LinkLabel1.TabIndex = 53
        Me.LinkLabel1.TabStop = True
        Me.LinkLabel1.Text = "Change"
        '
        'LinkLabel2
        '
        Me.LinkLabel2.Location = New System.Drawing.Point(480, 104)
        Me.LinkLabel2.Name = "LinkLabel2"
        Me.LinkLabel2.Size = New System.Drawing.Size(56, 16)
        Me.LinkLabel2.TabIndex = 54
        Me.LinkLabel2.TabStop = True
        Me.LinkLabel2.Text = "Test Start"
        Me.LinkLabel2.Visible = False
        '
        'LinkLabel3
        '
        Me.LinkLabel3.Location = New System.Drawing.Point(544, 104)
        Me.LinkLabel3.Name = "LinkLabel3"
        Me.LinkLabel3.Size = New System.Drawing.Size(56, 16)
        Me.LinkLabel3.TabIndex = 55
        Me.LinkLabel3.TabStop = True
        Me.LinkLabel3.Text = "Test Stop"
        Me.LinkLabel3.Visible = False
        '
        'bnAuto
        '
        Me.bnAuto.Location = New System.Drawing.Point(376, 528)
        Me.bnAuto.Name = "bnAuto"
        Me.bnAuto.Size = New System.Drawing.Size(80, 21)
        Me.bnAuto.TabIndex = 57
        Me.bnAuto.Text = "Auto Pan"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(864, 711)
        Me.Controls.Add(Me.bnAuto)
        Me.Controls.Add(Me.LinkLabel3)
        Me.Controls.Add(Me.LinkLabel2)
        Me.Controls.Add(Me.LinkLabel1)
        Me.Controls.Add(Me.ComboBox2)
        Me.Controls.Add(Me.Label20)
        Me.Controls.Add(Me.cboCam)
        Me.Controls.Add(Me.lbSession)
        Me.Controls.Add(Me.Label13)
        Me.Controls.Add(Me.Label19)
        Me.Controls.Add(Me.Label18)
        Me.Controls.Add(Me.Label15)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.PostviewFrame3)
        Me.Controls.Add(Me.PropPageShell)
        Me.Controls.Add(Me.Label16)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.Label10)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Button8)
        Me.Controls.Add(Me.Button7)
        Me.Controls.Add(Me.PreviewFrame)
        Me.Controls.Add(Me.PostviewFrame1)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.cboVideoSource)
        Me.Controls.Add(Me.cboAudioSource)
        Me.Controls.Add(Me.Button3)
        Me.Controls.Add(Me.cboProfile)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.PostviewFrame2)
        Me.Controls.Add(Me.PostviewFrame4)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D
        Me.Menu = Me.MainMenu1
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Close Circuit TV(CCTV) Over Network"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        CType(Me.PropPageShell, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ' Create a WMEncoder object.
        Encoder = New WMEncoder
        ' Add the WMEncoder object to the property page container (you must do
        ' this before adding the property pages to it).
        PropPageShell.AddObject(Encoder)
        PropPageShell.AddPage(clientConnect)

        autoMode = True

        SrcGrpColl = Encoder.SourceGroupCollection
        SrcPlugMgr = Encoder.SourcePluginInfoManager
        DCPlugMgr = Encoder.DeviceControlPluginInfoManager
        Descr = Encoder.DisplayInfo
        title = ""
        author = ""
        copyright = ""
        rating = ""
        descript = ""
        Counter = 0
        clientCount = 0
        bufferSize = 1024
        check = False
        uname = ""
        pass = ""
        loginName = ""
        clientState(0) = 0
        clientState(1) = 0
        clientState(2) = 0
        clientState(3) = 0
        clientState(4) = 0
        BPort = 8080
        BPort1 = 1000
        BPort2 = 2000
        BPort3 = 3000
        port(0) = 8081
        port(1) = 8082
        port(2) = 8083
        port(3) = 8084
        port(4) = 8085
        bitRateIndex = 2
        threadUse = -1
        checking = True
        index = 0
        sessionNo = 0
        sessionCreate = 0
        logPage = New Form4
        btMStart(0) = True
        btMStart(1) = True
        btMStart(2) = True
        btMStart(3) = True
        btAStart(0) = True
        btAStart(1) = True
        btAStart(2) = True
        btAStart(3) = True
        btMStop(0) = True
        btMStop(1) = True
        btMStop(2) = True
        btMStop(3) = True
        btAStop(0) = True
        btAStop(1) = True
        btAStop(2) = True
        btAStop(3) = True
        address = 888
        'reset LED
        portAddr.Out32(address, 255)
        currentArc = 0
        stepArc = 0
        BstPort(0) = False
        BstPort(1) = False
        BstPort(2) = False
        BstPort(3) = False
        autoPan = False

        ' Loop through all the audio and video devices on the system.
        For iPindex = 0 To SrcPlugMgr.Count - 1

            ' Set the IWMEncPluginInfo object to the current plug-in.
            PlugInfo = SrcPlugMgr.Item(iPindex)

            ' Find the device plug-ins that support resources.
            If PlugInfo.SchemeType = "DEVICE" And _
            PlugInfo.Resources = True Then

                ' Loop through the resources in the current plug-in.
                For iRindex = 0 To PlugInfo.Count - 1

                    ' Add audio resources to the audio combo box.
                    If PlugInfo.MediaType = 1 Then
                        cboAudioSource.Items.Add(PlugInfo.Item(iRindex))
                        x = x + 1
                    End If

                    ' Add video resources to the video combo box.
                    If PlugInfo.MediaType = 2 Then
                        cboVideoSource.Items.Add(PlugInfo.Item(iRindex))
                        y = y + 1
                    End If

                    ' Add devices that support both audio and video resources to
                    ' the audio and video combo boxes.
                    If PlugInfo.MediaType = 3 Then
                        cboAudioSource.Items.Add(PlugInfo.Item(iRindex))
                        cboVideoSource.Items.Add(PlugInfo.Item(iRindex))
                        x = x + 1
                        y = y + 1
                    End If
                Next
            End If
        Next

        SrcGrp = SrcGrpColl.Add("SG_1")
        SrcAud = SrcGrp.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)
        SrcVid = SrcGrp.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)

        ' Retrieve an IWMEncProfileCollection object.
        ProColl = Encoder.ProfileCollection()
        ' Populate the cboProfile combo box with the names of available
        ' profiles by looping through the profiles in the
        ' IWMEncProfileCollection object.
        For i = 0 To ProColl.Count - 1
            cboProfile.Items().Add(ProColl.Item(i).Name)
        Next i

        ' Encode to a file.
        File = Encoder.File
        strPathName = "C:\myVideoFile"
        TextBox1.Text = strPathName

        ' Create two IWMEncDataViewCollection objects, one for the
        ' preview collection and one for the postview collection.
        DVColl_Preview = SrcVid.PreviewCollection

        PreView = New WMEncDataView
        PreView1 = New WMEncDataView

        ' Add the preview object to the preview collection.
        lPreviewStream1 = DVColl_Preview.Add(PreView1)
        lPreviewStream = DVColl_Preview.Add(PreView)

        serverSocket = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        Dim iep As IPEndPoint = New IPEndPoint(IPAddress.Any, 12345)
        serverSocket.Bind(iep)
        serverSocket.Listen(5)
        serverSocket.BeginAccept(New AsyncCallback(AddressOf AcceptConn), serverSocket)
    End Sub

    Public Sub AcceptConn(ByVal iar As IAsyncResult)
        Dim oldServer As Socket = iar.AsyncState
        Dim client As Socket = oldServer.EndAccept(iar)
        ipItem = client.RemoteEndPoint
        client.BeginReceive(byteData, 0, bufferSize, SocketFlags.None, New AsyncCallback(AddressOf RecieveData), client)
    End Sub

    'recieved and check authen
    Public Sub RecieveData(ByVal iar As IAsyncResult)
        Dim client As Socket = iar.AsyncState

        Dim recv As Integer = client.EndReceive(iar)
        If recv = 0 Then
            client.Close()
            serverSocket.BeginAccept(New AsyncCallback(AddressOf AcceptConn), serverSocket)
            Return
        End If
        Dim recieveDataStr As String = Encoding.ASCII.GetString(byteData)
        Dim i As Integer = 0
        Dim strFirst As String = recieveDataStr.Substring(0, 1)
        Dim strSecond As String = recieveDataStr.Substring(1, 1)

        'recieve date to view file name and send list of file
        If strFirst = "!" Then
            Dim strDate As String = recieveDataStr.Substring(1, recieveDataStr.Length - 1)
            Dim strMessage As String = strDate
            'query data base for list of filename
            createConnection()
            queryFilename(strDate)
            Dim message() As Byte = Encoding.ASCII.GetBytes(listFile)
            listFile = ""
            client.BeginSend(message, 0, message.Length, SocketFlags.None, New AsyncCallback(AddressOf SendData), client)
        End If

        'left pan request
        If strFirst = "<" Then
            If currentArc > -450 Then
                If stepArc = 0 Then '45 time max
                    currentArc = currentArc - 10
                End If
                If stepArc = 1 Then '30 time max
                    currentArc = currentArc - 15
                End If
                If stepArc = 2 Then '15 time max
                    currentArc = currentArc - 30
                End If
                If stepArc = 3 Then '9 time max
                    currentArc = currentArc - 50
                End If
                If stepArc = 4 Then '5 time max
                    currentArc = currentArc - 90
                End If
                leftPan()
            End If
            client.BeginReceive(byteData, 0, bufferSize, SocketFlags.None, New AsyncCallback(AddressOf RecieveData), client)
        End If

        'auto pan request
        If strFirst = "+" Then
            If autoPan = False Then
                bnAuto.Text = "Stop"
                threadAuto = New System.Threading.Thread( _
                AddressOf autoMove)
                threadAuto.IsBackground = True
                threadAuto.Start()
                autoPan = True
            Else
                threadAuto.Abort()
                bnAuto.Text = "Auto pan"
                autoPan = False
            End If
            client.BeginReceive(byteData, 0, bufferSize, SocketFlags.None, New AsyncCallback(AddressOf RecieveData), client)
        End If

        'right pan request
        If strFirst = ">" Then
            If currentArc < 450 Then
                If stepArc = 0 Then '45 time max
                    currentArc = currentArc + 10
                End If
                If stepArc = 1 Then '30 time max
                    currentArc = currentArc + 15
                End If
                If stepArc = 2 Then '15 time max
                    currentArc = currentArc + 30
                End If
                If stepArc = 3 Then '9 time max
                    currentArc = currentArc + 50
                End If
                If stepArc = 4 Then '5 time max
                    currentArc = currentArc + 90
                End If
                rightPan()
            End If
            client.BeginReceive(byteData, 0, bufferSize, SocketFlags.None, New AsyncCallback(AddressOf RecieveData), client)
        End If

        If strFirst = "*" Then
            Dim str As String = ""
            If BstPort(0) = True Then
                str = str + BPort.ToString() + "/"
            End If
            If BstPort(1) = True Then
                str = str + BPort1.ToString() + "/"
            End If
            If BstPort(2) = True Then
                str = str + BPort2.ToString() + "/"
            End If
            If BstPort(3) = True Then
                str = str + BPort3.ToString() + "/"
            End If
            'Dim strMessage As String = port(threadUse).ToString()
            Dim message() As Byte = Encoding.ASCII.GetBytes(str)
            client.BeginSend(message, 0, message.Length, SocketFlags.None, New AsyncCallback(AddressOf SendData), client)
        End If

        'recieve filename process and start to broadcast
        If strFirst = "$" Then
            i = Convert.ToInt32(strSecond)
            bitRateIndex = i
            Dim recieve As String
            recieve = recieveDataStr.Substring(2, recieveDataStr.Length - 2)
            recFileName = recieve
            'initial thread for broadcast video file
            'clientCount = clientCount + 1

            While checking = True
                If clientState(index) = 0 Then 'thread available
                    threadUse = index
                    checking = False
                    clientState(index) = 1
                End If
                index = index + 1
            End While
            If threadUse < 5 Then 'thread free
                createService(threadUse)
                checking = True
                index = 0
                'Delay
                Dim x As Integer, y As Integer, z As Integer
                For x = 0 To x = 30000
                    For y = 0 To y = 10000
                        z = y + x
                    Next
                Next

                Dim strMessage As String = port(threadUse).ToString()
                Dim message() As Byte = Encoding.ASCII.GetBytes(strMessage)
                client.BeginSend(message, 0, message.Length, SocketFlags.None, New AsyncCallback(AddressOf SendData), client)
            End If
        End If

        'check authen mode
        If strFirst = "@" Then
            Dim addBit As String
            recieveDataStr = recieveDataStr.Substring(1, recieveDataStr.Length - 1)
            checkAccount(recieveDataStr)
            Dim x As Integer = 0
            If check = True Then
                x = 1
                status = "Connected :  " + uname + " : " + ipItem.ToString() + "   :   " + DateTime.Now.ToLongTimeString()
                logPage.ListBox1.Items.Add(status)
            End If '

            If uname = "admin" Then
                addBit = "1"
                loginName = "Administrator"
            Else
                addBit = "0"
            End If
            'reuse variable for new login
            check = False
            Dim strMessage As String = x.ToString() + addBit + loginName
            Dim message() As Byte = Encoding.ASCII.GetBytes(strMessage)
            client.BeginSend(message, 0, message.Length, SocketFlags.None, New AsyncCallback(AddressOf SendData), client)
        End If
        'clear byte recieve
        For i = 0 To 1024
            byteData(i) = 0
        Next
    End Sub

    Public Sub checkAccount(ByVal stringAcc As String)
        Dim str As String
        Dim x As Integer = 0
        Dim i As Integer = 0
        For i = 0 To stringAcc.Length
            str = stringAcc.Substring(i, 1)
            If str = "#" Then
                x = i
                Exit For
            End If
        Next
        uname = stringAcc.Substring(0, x)
        pass = stringAcc.Substring(x + 1, stringAcc.Length - x - 1)
        'implement query database
        createConnection()
        executeCommand()
    End Sub

    Public Sub createConnection()
        Dim strConn As String = "Data Source= DBServer; Initial Catalog= CCTV; User ID= sa; Password= 123456"
        objectConn = New SqlConnection("Data Source=localhost; Initial Catalog=CCTV;" & _
        "User ID=sa; Password=123456;")
        objectConn.Open()
    End Sub

    Public Sub executeCommand()
        Dim sqlCmd As String = "select count(*) from Account where ((Username = '" & uname & "') and (Password = '" & pass & "'))"
        cmd = New SqlCommand(sqlCmd, objectConn)
        Dim result As Integer = cmd.ExecuteScalar()
        If result = 1 Then
            check = True
            cmd.CommandText = "select Name, Surname from Account, UserProfile where ((Username = '" & uname & "') and (Password = '" & pass & "') and (Account.ID = UserProfile.AccountID))"
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            While reader.Read()
                loginName = reader.Item(0) + "  " + reader.Item(1)
            End While
        End If
    End Sub

    Public Sub queryFilename(ByVal strDate As String)
        Dim sqlCmd As String = "select FileNames from VideoFile where (DateCreate = '" & strDate & "') order by FileNames"
        cmd = New SqlCommand(sqlCmd, objectConn)
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        Dim count As Integer = 0
        While reader.Read()
            listFile = listFile + reader.Item("FileNames") + "/"
            count = count + 1
        End While
        If count < 1 Then
            listFile = "No Recorded Video File Found"
        End If
    End Sub

    Public Sub SendData(ByVal iar As IAsyncResult)
        Dim client As Socket = iar.AsyncState
        Dim sent As Integer = client.EndSend(iar)
        client.BeginReceive(byteData, 0, bufferSize, SocketFlags.None, New AsyncCallback(AddressOf RecieveData), client)
    End Sub

    Public Sub createService(ByVal index As Integer)
        '1. Begin received request / OK
        '2. Authenticated / OK
        '3. Select source request / OK
        '3.1 source = stream / OK
        '3.2 source = file record / OK
        '1) send data to show file that available to view / OK
        '2) create thread to service / OK
        '3) create new encoder session / OK
        '4) assign source file follow the request / OK
        '5) start broadcast at new port / OK
        Select Case index
            Case 0
                initService0()
                serviceClient0()
                'Client0 = New System.Threading.Thread( _
                'AddressOf serviceClient0)

                'Client0.IsBackground = True
                'Client0.Start()
            Case 1
                initService1()
                serviceClient1()
                'Client1 = New System.Threading.Thread( _
                'AddressOf serviceClient1)

                'Client1.IsBackground = True
                'Client1.Start()
            Case 2
                initService2()
                serviceClient2()
                'Client2 = New System.Threading.Thread( _
                'AddressOf serviceClient2)

                'Client2.IsBackground = True
                'Client2.Start()
            Case 3
                initService3()
                serviceClient3()
                'Client3 = New System.Threading.Thread( _
                'AddressOf serviceClient3)

                'Client3.IsBackground = True
                'Client3.Start()
            Case 4
                initService4()
                serviceClient4()
                'Client4 = New System.Threading.Thread( _
                'AddressOf serviceClient1)

                'Client4.IsBackground = True
                'Client4.Start()
        End Select

    End Sub

    Public Sub serviceClient0()
        Encoder0.Start()
    End Sub

    Public Sub stopSevice0()
        Encoder0.Stop()
    End Sub

    Public Sub pauseSevice0()
        Encoder0.Save("c:/temp0.wmv")
        Encoder0.Stop()
    End Sub

    Public Sub resumeSevice0()
        Encoder0.Load("c:/temp0.wmv")
        Encoder0.Start()
    End Sub

    Public Sub serviceClient1()
        Encoder1.Start()
    End Sub

    Public Sub stopSevice1()
        Encoder1.Stop()
    End Sub

    Public Sub pauseSevice1()
        Encoder1.Save("c:/temp1.wmv")
        Encoder1.Stop()
    End Sub

    Public Sub resumeSevice1()
        Encoder1.Load("c:/temp1.wmv")
        Encoder1.Start()
    End Sub

    Public Sub serviceClient2()
        Encoder2.Start()
    End Sub

    Public Sub stopSevice2()
        Encoder2.Stop()
    End Sub

    Public Sub pauseSevice2()
        Encoder2.Save("c:/temp2.wmv")
        Encoder2.Stop()
    End Sub

    Public Sub resumeSevice2()
        Encoder2.Load("c:/temp2.wmv")
        Encoder2.Start()
    End Sub

    Public Sub serviceClient3()
        Encoder3.Start()
    End Sub

    Public Sub stopSevice3()
        Encoder3.Stop()
    End Sub

    Public Sub pauseSevice3()
        Encoder3.Save("c:/temp3.wmv")
        Encoder3.Stop()
    End Sub

    Public Sub resumeSevice3()
        Encoder3.Load("c:/temp3.wmv")
        Encoder3.Start()
    End Sub

    Public Sub serviceClient4()
        Encoder4.Start()
    End Sub

    Public Sub stopSevice4()
        Encoder4.Stop()
    End Sub

    Public Sub pauseSevice4()
        Encoder4.Save("c:/temp4.wmv")
        Encoder4.Stop()
    End Sub

    Public Sub resumeSevice4()
        Encoder4.Load("c:/temp4.wmv")
        Encoder4.Start()
    End Sub

    Public Sub initService0()

        ' Create a WMEncoder object.
        Encoder0 = New WMEncoder

        ' Retrieve the source group collection and add a source group. 
        Dim SrcGrpColl0 As IWMEncSourceGroupCollection
        SrcGrpColl0 = Encoder0.SourceGroupCollection
        Dim SrcGrp0 As IWMEncSourceGroup2
        SrcGrp0 = SrcGrpColl0.Add("SG_1")

        ' Add a video and audio source to the source group.
        Dim SrcVid0 As IWMEncVideoSource2
        Dim SrcAud0 As IWMEncAudioSource
        SrcVid0 = SrcGrp0.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        SrcAud0 = SrcGrp0.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)

        Label8.Text = recFileName
        ' Identify the source files to encode.
        Dim recFileName1 As String = "C:\myVideoFile\" + Label8.Text + ".wmv"
        Label8.Text = "Encoding"
        SrcVid0.SetInput(recFileName1)
        SrcAud0.SetInput(recFileName1)

        ' Choose a profile from the collection.
        Dim ProColl0 As IWMEncProfileCollection
        Dim Pro0 As IWMEncProfile
        Dim i0 As Integer
        Dim lLength0 As Long

        ProColl0 = Encoder0.ProfileCollection
        lLength0 = ProColl0.Count

        If bitRateIndex = 0 Then
            For i0 = 0 To lLength0 - 1
                Pro0 = ProColl0.Item(i0)
                If Pro0.Name = "Windows Media Video 8 for Dial-up Modems (28.8 Kbps)" Then
                    SrcGrp0.Profile = Pro0
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 1 Then
            For i0 = 0 To lLength0 - 1
                Pro0 = ProColl0.Item(i0)
                If Pro0.Name = "Windows Media Video 8 for Dial-up Modems (56 Kbps)" Then
                    SrcGrp0.Profile = Pro0
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 2 Then
            For i0 = 0 To lLength0 - 1
                Pro0 = ProColl0.Item(i0)
                If Pro0.Name = "Windows Media Video 8 for Local Area Network (100 Kbps)" Then
                    SrcGrp0.Profile = Pro0
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 3 Then
            For i0 = 0 To lLength0 - 1
                Pro0 = ProColl0.Item(i0)
                If Pro0.Name = "Windows Media Video 8 for Local Area Network (256 Kbps)" Then
                    SrcGrp0.Profile = Pro0
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 4 Then
            For i0 = 0 To lLength0 - 1
                Pro0 = ProColl0.Item(i0)
                If Pro0.Name = "Windows Media Video 8 for Local Area Network (384 Kbps)" Then
                    SrcGrp0.Profile = Pro0
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 5 Then
            For i0 = 0 To lLength0 - 1
                Pro0 = ProColl0.Item(i0)
                If Pro0.Name = "Windows Media Video 8 for Local Area Network (768 Kbps)" Then
                    SrcGrp0.Profile = Pro0
                    Exit For
                End If
            Next
        End If

        ' Create a broadcast.
        Dim BrdCst0 As IWMEncBroadcast
        BrdCst0 = Encoder0.Broadcast
        BrdCst0.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = port(0)
    End Sub

    Public Sub initService1()

        ' Create a WMEncoder object.
        Encoder1 = New WMEncoder

        ' Retrieve the source group collection and add a source group. 
        Dim SrcGrpColl1 As IWMEncSourceGroupCollection
        SrcGrpColl1 = Encoder1.SourceGroupCollection
        Dim SrcGrp1 As IWMEncSourceGroup2
        SrcGrp1 = SrcGrpColl1.Add("SG_1")

        ' Add a video and audio source to the source group.
        Dim SrcVid1 As IWMEncVideoSource2
        Dim SrcAud1 As IWMEncAudioSource
        SrcVid1 = SrcGrp1.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        SrcAud1 = SrcGrp1.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)

        Label8.Text = recFileName
        ' Identify the source files to encode.
        Dim recFileName1 As String = "C:\myVideoFile\" + Label8.Text + ".wmv"
        Label8.Text = "Encoding"
        SrcVid1.SetInput(recFileName1)
        SrcAud1.SetInput(recFileName1)

        ' Choose a profile from the collection.
        Dim ProColl1 As IWMEncProfileCollection
        Dim Pro1 As IWMEncProfile
        Dim i1 As Integer
        Dim lLength1 As Long

        ProColl1 = Encoder1.ProfileCollection
        lLength1 = ProColl1.Count

        If bitRateIndex = 0 Then
            For i1 = 0 To lLength1 - 1
                Pro1 = ProColl1.Item(i1)
                If Pro1.Name = "Windows Media Video 8 for Dial-up Modems (28.8 Kbps)" Then
                    SrcGrp1.Profile = Pro1
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 1 Then
            For i1 = 0 To lLength1 - 1
                Pro1 = ProColl1.Item(i1)
                If Pro1.Name = "Windows Media Video 8 for Dial-up Modems (56 Kbps)" Then
                    SrcGrp1.Profile = Pro1
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 2 Then
            For i1 = 0 To lLength1 - 1
                Pro1 = ProColl1.Item(i1)
                If Pro1.Name = "Windows Media Video 8 for Local Area Network (100 Kbps)" Then
                    SrcGrp1.Profile = Pro1
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 3 Then
            For i1 = 0 To lLength1 - 1
                Pro1 = ProColl1.Item(i1)
                If Pro1.Name = "Windows Media Video 8 for Local Area Network (256 Kbps)" Then
                    SrcGrp1.Profile = Pro1
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 4 Then
            For i1 = 0 To lLength1 - 1
                Pro1 = ProColl1.Item(i1)
                If Pro1.Name = "Windows Media Video 8 for Local Area Network (384 Kbps)" Then
                    SrcGrp1.Profile = Pro1
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 5 Then
            For i1 = 0 To lLength1 - 1
                Pro1 = ProColl1.Item(i1)
                If Pro1.Name = "Windows Media Video 8 for Local Area Network (768 Kbps)" Then
                    SrcGrp1.Profile = Pro1
                    Exit For
                End If
            Next
        End If

        ' Create a broadcast.
        Dim BrdCst1 As IWMEncBroadcast
        BrdCst1 = Encoder1.Broadcast
        BrdCst1.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = port(1)
    End Sub

    Public Sub initService2()

        ' Create a WMEncoder object.
        Encoder2 = New WMEncoder

        ' Retrieve the source group collection and add a source group. 
        Dim SrcGrpColl2 As IWMEncSourceGroupCollection
        SrcGrpColl2 = Encoder2.SourceGroupCollection
        Dim SrcGrp2 As IWMEncSourceGroup2
        SrcGrp2 = SrcGrpColl2.Add("SG_1")

        ' Add a video and audio source to the source group.
        Dim SrcVid2 As IWMEncVideoSource2
        Dim SrcAud2 As IWMEncAudioSource
        SrcVid2 = SrcGrp2.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        SrcAud2 = SrcGrp2.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)

        Label8.Text = recFileName
        ' Identify the source files to encode.
        Dim recFileName1 As String = "C:\myVideoFile\" + Label8.Text + ".wmv"
        Label8.Text = "Encoding"
        SrcVid2.SetInput(recFileName1)
        SrcAud2.SetInput(recFileName1)

        ' Choose a profile from the collection.
        Dim ProColl2 As IWMEncProfileCollection
        Dim Pro2 As IWMEncProfile
        Dim i2 As Integer
        Dim lLength2 As Long

        ProColl2 = Encoder2.ProfileCollection
        lLength2 = ProColl2.Count

        If bitRateIndex = 0 Then
            For i2 = 0 To lLength2 - 1
                Pro2 = ProColl2.Item(i2)
                If Pro2.Name = "Windows Media Video 8 for Dial-up Modems (28.8 Kbps)" Then
                    SrcGrp2.Profile = Pro2
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 1 Then
            For i2 = 0 To lLength2 - 1
                Pro2 = ProColl2.Item(i2)
                If Pro2.Name = "Windows Media Video 8 for Dial-up Modems (56 Kbps)" Then
                    SrcGrp2.Profile = Pro2
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 2 Then
            For i2 = 0 To lLength2 - 1
                Pro2 = ProColl2.Item(i2)
                If Pro2.Name = "Windows Media Video 8 for Local Area Network (100 Kbps)" Then
                    SrcGrp2.Profile = Pro2
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 3 Then
            For i2 = 0 To lLength2 - 1
                Pro2 = ProColl2.Item(i2)
                If Pro2.Name = "Windows Media Video 8 for Local Area Network (256 Kbps)" Then
                    SrcGrp2.Profile = Pro2
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 4 Then
            For i2 = 0 To lLength2 - 1
                Pro2 = ProColl2.Item(i2)
                If Pro2.Name = "Windows Media Video 8 for Local Area Network (384 Kbps)" Then
                    SrcGrp2.Profile = Pro2
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 5 Then
            For i2 = 0 To lLength2 - 1
                Pro2 = ProColl2.Item(i2)
                If Pro2.Name = "Windows Media Video 8 for Local Area Network (768 Kbps)" Then
                    SrcGrp2.Profile = Pro2
                    Exit For
                End If
            Next
        End If

        ' Create a broadcast.
        Dim BrdCst2 As IWMEncBroadcast
        BrdCst2 = Encoder2.Broadcast
        BrdCst2.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = port(2)
    End Sub

    Public Sub initService3()

        ' Create a WMEncoder object.
        Encoder3 = New WMEncoder

        ' Retrieve the source group collection and add a source group. 
        Dim SrcGrpColl3 As IWMEncSourceGroupCollection
        SrcGrpColl3 = Encoder3.SourceGroupCollection
        Dim SrcGrp3 As IWMEncSourceGroup2
        SrcGrp3 = SrcGrpColl3.Add("SG_1")

        ' Add a video and audio source to the source group.
        Dim SrcVid3 As IWMEncVideoSource2
        Dim SrcAud3 As IWMEncAudioSource
        SrcVid3 = SrcGrp3.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        SrcAud3 = SrcGrp3.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)

        Label8.Text = recFileName
        ' Identify the source files to encode.
        Dim recFileName1 As String = "C:\myVideoFile\" + Label8.Text + ".wmv"
        Label8.Text = "Encoding"
        SrcVid3.SetInput(recFileName1)
        SrcAud3.SetInput(recFileName1)

        ' Choose a profile from the collection.
        Dim ProColl3 As IWMEncProfileCollection
        Dim Pro3 As IWMEncProfile
        Dim i3 As Integer
        Dim lLength3 As Long

        ProColl3 = Encoder3.ProfileCollection
        lLength3 = ProColl3.Count

        If bitRateIndex = 0 Then
            For i3 = 0 To lLength3 - 1
                Pro3 = ProColl3.Item(i3)
                If Pro3.Name = "Windows Media Video 8 for Dial-up Modems (28.8 Kbps)" Then
                    SrcGrp3.Profile = Pro3
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 1 Then
            For i3 = 0 To lLength3 - 1
                Pro3 = ProColl3.Item(i3)
                If Pro3.Name = "Windows Media Video 8 for Dial-up Modems (56 Kbps)" Then
                    SrcGrp3.Profile = Pro3
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 2 Then
            For i3 = 0 To lLength3 - 1
                Pro3 = ProColl3.Item(i3)
                If Pro3.Name = "Windows Media Video 8 for Local Area Network (100 Kbps)" Then
                    SrcGrp3.Profile = Pro3
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 3 Then
            For i3 = 0 To lLength3 - 1
                Pro3 = ProColl3.Item(i3)
                If Pro3.Name = "Windows Media Video 8 for Local Area Network (256 Kbps)" Then
                    SrcGrp3.Profile = Pro3
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 4 Then
            For i3 = 0 To lLength3 - 1
                Pro3 = ProColl3.Item(i3)
                If Pro3.Name = "Windows Media Video 8 for Local Area Network (384 Kbps)" Then
                    SrcGrp3.Profile = Pro3
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 5 Then
            For i3 = 0 To lLength3 - 1
                Pro3 = ProColl3.Item(i3)
                If Pro3.Name = "Windows Media Video 8 for Local Area Network (768 Kbps)" Then
                    SrcGrp3.Profile = Pro3
                    Exit For
                End If
            Next
        End If

        ' Create a broadcast.
        Dim BrdCst3 As IWMEncBroadcast
        BrdCst3 = Encoder3.Broadcast
        BrdCst3.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = port(3)
    End Sub

    Public Sub initService4()

        ' Create a WMEncoder object.
        Encoder4 = New WMEncoder

        ' Retrieve the source group collection and add a source group. 
        Dim SrcGrpColl4 As IWMEncSourceGroupCollection
        SrcGrpColl4 = Encoder4.SourceGroupCollection
        Dim SrcGrp4 As IWMEncSourceGroup2
        SrcGrp4 = SrcGrpColl4.Add("SG_1")

        ' Add a video and audio source to the source group.
        Dim SrcVid4 As IWMEncVideoSource2
        Dim SrcAud4 As IWMEncAudioSource
        SrcVid4 = SrcGrp4.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        SrcAud4 = SrcGrp4.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)

        Label8.Text = recFileName
        ' Identify the source files to encode.
        Dim recFileName1 As String = "C:\myVideoFile\" + Label8.Text + ".wmv"
        Label8.Text = "Encoding"
        SrcVid4.SetInput(recFileName1)
        SrcAud4.SetInput(recFileName1)

        ' Choose a profile from the collection.
        Dim ProColl4 As IWMEncProfileCollection
        Dim Pro4 As IWMEncProfile
        Dim i4 As Integer
        Dim lLength4 As Long

        ProColl4 = Encoder4.ProfileCollection
        lLength4 = ProColl4.Count

        If bitRateIndex = 0 Then
            For i4 = 0 To lLength4 - 1
                Pro4 = ProColl4.Item(i4)
                If Pro4.Name = "Windows Media Video 8 for Dial-up Modems (28.8 Kbps)" Then
                    SrcGrp4.Profile = Pro4
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 1 Then
            For i4 = 0 To lLength4 - 1
                Pro4 = ProColl4.Item(i4)
                If Pro4.Name = "Windows Media Video 8 for Dial-up Modems (56 Kbps)" Then
                    SrcGrp4.Profile = Pro4
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 2 Then
            For i4 = 0 To lLength4 - 1
                Pro4 = ProColl4.Item(i4)
                If Pro4.Name = "Windows Media Video 8 for Local Area Network (100 Kbps)" Then
                    SrcGrp4.Profile = Pro4
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 3 Then
            For i4 = 0 To lLength4 - 1
                Pro4 = ProColl4.Item(i4)
                If Pro4.Name = "Windows Media Video 8 for Local Area Network (256 Kbps)" Then
                    SrcGrp4.Profile = Pro4
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 4 Then
            For i4 = 0 To lLength4 - 1
                Pro4 = ProColl4.Item(i4)
                If Pro4.Name = "Windows Media Video 8 for Local Area Network (384 Kbps)" Then
                    SrcGrp4.Profile = Pro4
                    Exit For
                End If
            Next
        End If

        If bitRateIndex = 5 Then
            For i4 = 0 To lLength4 - 1
                Pro4 = ProColl4.Item(i4)
                If Pro4.Name = "Windows Media Video 8 for Local Area Network (768 Kbps)" Then
                    SrcGrp4.Profile = Pro4
                    Exit For
                End If
            Next
        End If

        ' Create a broadcast.
        Dim BrdCst4 As IWMEncBroadcast
        BrdCst4 = Encoder4.Broadcast
        BrdCst4.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = port(4)
    End Sub

    'thread t1
    Public Sub autoEncode()
        PropPageShell.Apply()
        While autoMode = True
            fileName()
            saveFileName(TTime)
            Encoder.Start()
            t1.Sleep(timeSleep)
            Encoder.Stop()
        End While
    End Sub

    Public Sub autoEncodex()
        While autoMode = True
            fileNamex()
            saveFileName(TTime)
            Encoderx.Start()
            t1x.Sleep(timeSleepx)
            Encoderx.Stop()
        End While
    End Sub

    Public Sub autoEncodey()
        While autoMode = True
            fileNamey()
            saveFileName(TTime)
            Encodery.Start()
            t1y.Sleep(timeSleepy)
            Encodery.Stop()
        End While
    End Sub

    Public Sub autoEncodez()
        While autoMode = True
            fileNamez()
            saveFileName(TTime)
            Encoderz.Start()
            t1z.Sleep(timeSleepz)
            Encoderz.Stop()
        End While
    End Sub

    Public Sub emptyString()
        sAudio = ""
        sVideo = ""
    End Sub

    Public Sub fileName()
        TTime = CurrentTime.Now.Day.ToString + "_" + CurrentTime.Now.Month.ToString + "_" + CurrentTime.Now.Year.ToString + "#" + CurrentTime.Now.Hour.ToString + "_" + CurrentTime.Now.Minute.ToString + "_" + CurrentTime.Now.Second.ToString
        strFileName = strPathName + "\" + TTime + ".wmv"
        File.LocalFileName = strFileName
    End Sub

    Public Sub fileNamex()
        TTime = CurrentTime.Now.Day.ToString + "_" + CurrentTime.Now.Month.ToString + "_" + CurrentTime.Now.Year.ToString + "#" + CurrentTime.Now.Hour.ToString + "_" + CurrentTime.Now.Minute.ToString + "_" + CurrentTime.Now.Second.ToString
        strFileName = strPathName + "\" + TTime + ".wmv"
        Filex.LocalFileName = strFileName
    End Sub

    Public Sub fileNamey()
        TTime = CurrentTime.Now.Day.ToString + "_" + CurrentTime.Now.Month.ToString + "_" + CurrentTime.Now.Year.ToString + "#" + CurrentTime.Now.Hour.ToString + "_" + CurrentTime.Now.Minute.ToString + "_" + CurrentTime.Now.Second.ToString
        strFileName = strPathName + "\" + TTime + ".wmv"
        Filey.LocalFileName = strFileName
    End Sub

    Public Sub fileNamez()
        TTime = CurrentTime.Now.Day.ToString + "_" + CurrentTime.Now.Month.ToString + "_" + CurrentTime.Now.Year.ToString + "#" + CurrentTime.Now.Hour.ToString + "_" + CurrentTime.Now.Minute.ToString + "_" + CurrentTime.Now.Second.ToString
        strFileName = strPathName + "\" + TTime + ".wmv"
        Filez.LocalFileName = strFileName
    End Sub

    Public Sub InitialValue()
        If sessionNo = 0 Then
            sAudio = cboAudioSource.Text
            sVideo = cboVideoSource.Text
            sAudio = "Device://" + sAudio
            sVideo = "Device://" + sVideo
            SrcAud.SetInput(sAudio)
            SrcVid.SetInput(sVideo)
            sProfileName = cboProfile.Text
            ' Loop through the profiles to locate the one that was
            ' selected in cboProfiles by comparing each profile name to sProfileName.
            For i = 0 To ProColl.Count - 1
                If ProColl.Item(i).Name = sProfileName Then
                    ' Set the IWMEncProfile object to the selected profile.
                    Pro = ProColl.Item(i)
                    ' Set the profile into the IWMEncSourceGroup object SrcGrp.
                    SrcGrp.Profile = Pro
                    Exit For
                End If
            Next i

            'Adding Information
            Descr.Author = author
            Descr.Copyright = copyright
            Descr.Description = descript
            Descr.Rating = rating
            Descr.Title = title
            cboCam.Items.Add("Camera 1")
            Brdcst = Encoder.Broadcast
            ' Set the port number.
            Brdcst.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = BPort
        End If 'sessionNo = 0

        If sessionNo = 1 Then
            sAudio = cboAudioSource.Text
            sVideo = cboVideoSource.Text
            sAudio = "Device://" + sAudio
            sVideo = "Device://" + sVideo
            SrcAudx.SetInput(sAudio)
            SrcVidx.SetInput(sVideo)
            sProfileName = cboProfile.Text
            ' Loop through the profiles to locate the one that was
            ' selected in cboProfiles by comparing each profile name to sProfileName.
            For i = 0 To ProColl.Count - 1
                If ProColl.Item(i).Name = sProfileName Then
                    ' Set the IWMEncProfile object to the selected profile.
                    Prox = ProColl.Item(i)
                    ' Set the profile into the IWMEncSourceGroup object SrcGrp.
                    SrcGrpx.Profile = Prox
                    Exit For
                End If
            Next i

            'Adding Information
            Descrx.Author = author
            Descrx.Copyright = copyright
            Descrx.Description = descript
            Descrx.Rating = rating
            Descrx.Title = title
            cboCam.Items.Add("Camera 2")
        End If 'sessionNo = 1

        If sessionNo = 2 Then
            sAudio = cboAudioSource.Text
            sVideo = cboVideoSource.Text
            sAudio = "Device://" + sAudio
            sVideo = "Device://" + sVideo
            SrcAudy.SetInput(sAudio)
            SrcVidy.SetInput(sVideo)
            sProfileName = cboProfile.Text
            ' Loop through the profiles to locate the one that was
            ' selected in cboProfiles by comparing each profile name to sProfileName.
            For i = 0 To ProColl.Count - 1
                If ProColl.Item(i).Name = sProfileName Then
                    ' Set the IWMEncProfile object to the selected profile.
                    Proy = ProColl.Item(i)
                    ' Set the profile into the IWMEncSourceGroup object SrcGrp.
                    SrcGrpy.Profile = Proy
                    Exit For
                End If
            Next i

            'Adding Information
            Descry.Author = author
            Descry.Copyright = copyright
            Descry.Description = descript
            Descry.Rating = rating
            Descry.Title = title
            cboCam.Items.Add("Camera 3")
        End If 'sessionNo = 2

        If sessionNo = 3 Then
            sAudio = cboAudioSource.Text
            sVideo = cboVideoSource.Text
            sAudio = "Device://" + sAudio
            sVideo = "Device://" + sVideo
            SrcAudz.SetInput(sAudio)
            SrcVidz.SetInput(sVideo)
            sProfileName = cboProfile.Text
            ' Loop through the profiles to locate the one that was
            ' selected in cboProfiles by comparing each profile name to sProfileName.
            For i = 0 To ProColl.Count - 1
                If ProColl.Item(i).Name = sProfileName Then
                    ' Set the IWMEncProfile object to the selected profile.
                    Proz = ProColl.Item(i)
                    ' Set the profile into the IWMEncSourceGroup object SrcGrp.
                    SrcGrpz.Profile = Proz
                    Exit For
                End If
            Next i

            'Adding Information
            Descrz.Author = author
            Descrz.Copyright = copyright
            Descrz.Description = descript
            Descrz.Rating = rating
            Descrz.Title = title
            cboCam.Items.Add("Camera 4")
        End If 'sessionNo = 3

    End Sub

    'Mannual Start Button
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If sessionNo = 0 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim temp As String = TextBox2.Text
            strFileName = strPathName + "\" + temp
            File.LocalFileName = strFileName

            'save to database
            temp = temp.Substring(0, temp.Length - 4)
            saveFileName(temp)

            ' Initialize the encoding session.
            Encoder.PrepareToEncode(True)

            ' Start encoding.
            Encoder.Start()
            ' Display the preview in a frame named PreviewFrame.
            PreView1.SetViewProperties(lPreviewStream1, PostviewFrame1.Handle.ToInt32)
            PreView1.StartView(lPreviewStream1)

            'hideScreen()
            'PreviewFrame.Visible = True
            PreView.SetViewProperties(lPreviewStream, PreviewFrame.Handle.ToInt32)
            PreView.StartView(lPreviewStream)

            Label16.Text = "Camera Number 1"

            Button5.Enabled = False
            Button6.Enabled = False
            Button1.Enabled = False
            btMStart(0) = False
            btAStart(0) = False
            btAStop(0) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            BstPort(0) = True
        End If 'sessionNo = 0

        If sessionNo = 1 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim temp As String = TextBox2.Text
            strFileName = strPathName + "\" + temp
            Filex.LocalFileName = strFileName

            'save to database
            saveFileName(temp)

            ' Initialize the encoding session.
            Encoderx.PrepareToEncode(True)

            ' Start encoding.
            Encoderx.Start()
            ' Display the preview in a frame named PreviewFrame.
            PreViewx1.SetViewProperties(lPreviewStreamx1, PostviewFrame2.Handle.ToInt32)
            PreViewx1.StartView(lPreviewStreamx1)

            'hideScreen()
            'Panel1.Visible = True
            'PreViewx.SetViewProperties(lPreviewStreamx, Panel1.Handle.ToInt32)
            'PreViewx.StartView(lPreviewStreamx)

            Button5.Enabled = False
            Button6.Enabled = False
            Button1.Enabled = False
            btMStart(1) = False
            btAStart(1) = False
            btAStop(1) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 2"
            BstPort(1) = True
        End If 'sessionNo = 1

        If sessionNo = 2 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim temp As String = TextBox2.Text
            strFileName = strPathName + "\" + temp
            Filey.LocalFileName = strFileName

            'save to database
            saveFileName(temp)

            ' Initialize the encoding session.
            Encodery.PrepareToEncode(True)

            ' Start encoding.
            Encodery.Start()
            ' Display the preview in a frame named PreviewFrame.
            PreViewy1.SetViewProperties(lPreviewStreamy1, PostviewFrame3.Handle.ToInt32)
            PreViewy1.StartView(lPreviewStreamy1)

            'hideScreen()
            'Panel2.Visible = True
            'PreViewy.SetViewProperties(lPreviewStreamy, Panel2.Handle.ToInt32)
            'PreViewy.StartView(lPreviewStreamy)

            Button5.Enabled = False
            Button6.Enabled = False
            Button1.Enabled = False
            btMStart(2) = False
            btAStart(2) = False
            btAStop(2) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 3"
            BstPort(2) = True
        End If 'sessionNo = 2

        If sessionNo = 3 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim temp As String = TextBox2.Text
            strFileName = strPathName + "\" + temp
            Filez.LocalFileName = strFileName

            'save to database
            saveFileName(temp)

            ' Initialize the encoding session.
            Encoderz.PrepareToEncode(True)

            ' Start encoding.
            Encoderz.Start()
            ' Display the preview in a frame named PreviewFrame.
            PreViewz1.SetViewProperties(lPreviewStreamz1, PostviewFrame4.Handle.ToInt32)
            PreViewz1.StartView(lPreviewStreamz1)

            'hideScreen()
            'Panel3.Visible = True
            'PreViewz.SetViewProperties(lPreviewStreamz, Panel3.Handle.ToInt32)
            'PreViewz.StartView(lPreviewStreamz)

            Button5.Enabled = False
            Button6.Enabled = False
            Button1.Enabled = False
            btMStart(3) = False
            btAStart(3) = False
            btAStop(3) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 4"
            BstPort(3) = True
        End If 'sessionNo = 3

    End Sub

    'Configure Button
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        If conFigure.ShowDialog() = DialogResult.OK Then
            title = conFigure.Title.Text
            author = conFigure.Author.Text
            copyright = conFigure.Copyright.Text
            rating = conFigure.Rating.Text
            descript = conFigure.Description.Text
        End If
    End Sub

    'Browse Button
    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        If FolderBrowserDialog1.ShowDialog() = DialogResult.OK Then
            strPathName = FolderBrowserDialog1.SelectedPath
        End If
        TextBox1.Text = strPathName
    End Sub

    'Mannual Stop Button
    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        If sessionNo = 0 Then
            Encoder.Stop()
            Button5.Enabled = True
            Button6.Enabled = True
            Button1.Enabled = True
            btMStart(0) = True
            btAStart(0) = True
            btAStop(0) = True
            BstPort(0) = False
        End If

        If sessionNo = 1 Then
            Encoderx.Stop()
            Button5.Enabled = True
            Button6.Enabled = True
            Button1.Enabled = True
            btMStart(1) = True
            btAStart(1) = True
            btAStop(1) = True
            BstPort(1) = False
        End If

        If sessionNo = 2 Then
            Encodery.Stop()
            Button5.Enabled = True
            Button6.Enabled = True
            Button1.Enabled = True
            btMStart(2) = True
            btAStart(2) = True
            btAStop(2) = True
            BstPort(2) = False
        End If

        If sessionNo = 3 Then
            Encoderz.Stop()
            Button5.Enabled = True
            Button6.Enabled = True
            Button1.Enabled = True
            btMStart(3) = True
            btAStart(3) = True
            btAStop(3) = True
            BstPort(3) = False
        End If
    End Sub

    'Auto Start Button
    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        autoMode = True
        If sessionNo = 0 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim hourRec As Integer = Convert.ToInt32(cboTime.Text)
            Dim minRec As Integer = Convert.ToInt32(ComboBox1.Text)

            File.FileDuration = (hourRec * 60 * 60 * 1000 / 10000) + (minRec * 60 * 1000 / 10000)
            timeSleep = (hourRec * 60 * 60 * 1000) + (minRec * 60 * 1000)

            ' Initialize the encoding session.
            Encoder.PrepareToEncode(True)

            ' Start encoding create new thread
            t1 = New System.Threading.Thread( _
            AddressOf autoEncode)

            t1.IsBackground = True
            t1.Start()

            ' Display the preview in a frame named PreviewFrame.
            PreView.SetViewProperties(lPreviewStream, PostviewFrame1.Handle.ToInt32)
            PreView.StartView(lPreviewStream)

            'hideScreen()
            'PreviewFrame.Visible = True
            PreView1.SetViewProperties(lPreviewStream1, PreviewFrame.Handle.ToInt32)
            PreView1.StartView(lPreviewStream1)

            Label16.Text = "Camera Number 1"

            Button1.Enabled = False
            Button4.Enabled = False
            Button5.Enabled = False
            btMStart(0) = False
            btMStop(0) = False
            btAStart(0) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 1"
            BstPort(0) = True
        End If

        If sessionNo = 1 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim hourRec As Integer = Convert.ToInt32(cboTime.Text)
            Dim minRec As Integer = Convert.ToInt32(ComboBox1.Text)

            Filex.FileDuration = (hourRec * 60 * 60 * 1000 / 10000) + (minRec * 60 * 1000 / 10000)
            timeSleepx = (hourRec * 60 * 60 * 1000) + (minRec * 60 * 1000)

            ' Initialize the encoding session.
            Encoderx.PrepareToEncode(True)

            ' Start encoding create new thread
            t1x = New System.Threading.Thread( _
            AddressOf autoEncodex)

            t1x.IsBackground = True
            t1x.Start()

            ' Display the preview in a frame named PreviewFrame.
            PreViewx.SetViewProperties(lPreviewStreamx, PostviewFrame2.Handle.ToInt32)
            PreViewx.StartView(lPreviewStreamx)

            'hideScreen()
            'Panel1.Visible = True
            'PreViewx1.SetViewProperties(lPreviewStreamx1, Panel1.Handle.ToInt32)
            'PreViewx1.StartView(lPreviewStreamx1)

            Button1.Enabled = False
            Button4.Enabled = False
            Button5.Enabled = False
            btMStart(1) = False
            btMStop(1) = False
            btAStart(1) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 2"
            BstPort(1) = True
        End If

        If sessionNo = 2 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim hourRec As Integer = Convert.ToInt32(cboTime.Text)
            Dim minRec As Integer = Convert.ToInt32(ComboBox1.Text)

            Filey.FileDuration = (hourRec * 60 * 60 * 1000 / 10000) + (minRec * 60 * 1000 / 10000)
            timeSleepy = (hourRec * 60 * 60 * 1000) + (minRec * 60 * 1000)

            ' Initialize the encoding session.
            Encodery.PrepareToEncode(True)

            ' Start encoding create new thread
            t1y = New System.Threading.Thread( _
            AddressOf autoEncodey)

            t1y.IsBackground = True
            t1y.Start()

            ' Display the preview in a frame named PreviewFrame.
            PreViewy.SetViewProperties(lPreviewStreamy, PostviewFrame3.Handle.ToInt32)
            PreViewy.StartView(lPreviewStreamy)

            'hideScreen()
            'Panel2.Visible = True
            'PreViewy1.SetViewProperties(lPreviewStreamy1, Panel2.Handle.ToInt32)
            'PreViewy1.StartView(lPreviewStreamy1)

            Button1.Enabled = False
            Button4.Enabled = False
            Button5.Enabled = False
            btMStart(2) = False
            btMStop(2) = False
            btAStart(2) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 3"
            BstPort(2) = True
        End If

        If sessionNo = 3 Then
            lbSession.Text = "Creating session ..."
            InitialValue()

            Dim hourRec As Integer = Convert.ToInt32(cboTime.Text)
            Dim minRec As Integer = Convert.ToInt32(ComboBox1.Text)

            Filez.FileDuration = (hourRec * 60 * 60 * 1000 / 10000) + (minRec * 60 * 1000 / 10000)
            timeSleepz = (hourRec * 60 * 60 * 1000) + (minRec * 60 * 1000)

            ' Initialize the encoding session.
            Encoderz.PrepareToEncode(True)

            ' Start encoding create new thread
            t1z = New System.Threading.Thread( _
            AddressOf autoEncodez)

            t1z.IsBackground = True
            t1z.Start()

            ' Display the preview in a frame named PreviewFrame.
            PreViewz.SetViewProperties(lPreviewStreamz, PostviewFrame4.Handle.ToInt32)
            PreViewz.StartView(lPreviewStreamz)

            'hideScreen()
            'Panel3.Visible = True
            'PreViewz1.SetViewProperties(lPreviewStreamz1, Panel3.Handle.ToInt32)
            'PreViewz1.StartView(lPreviewStreamz1)

            Button1.Enabled = False
            Button4.Enabled = False
            Button5.Enabled = False
            btMStart(3) = False
            btMStop(3) = False
            btAStart(3) = False
            lbSession.Text = "Session number : " + sessionNo.ToString()
            Label16.Text = "Camera Number 4"
            BstPort(3) = True
        End If

    End Sub

    'Auto Stop Button
    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click

        If sessionNo = 0 Then
            Encoder.Stop()
            Button1.Enabled = True
            Button4.Enabled = True
            emptyString()
            t1.Abort()
            Button5.Enabled = True
            btMStart(0) = True
            btMStop(0) = True
            btAStart(0) = True
            BstPort(0) = False
        End If

        If sessionNo = 1 Then
            Encoderx.Stop()
            Button1.Enabled = True
            Button4.Enabled = True
            emptyString()
            t1x.Abort()
            Button5.Enabled = True
            btMStart(1) = True
            btMStop(1) = True
            btAStart(1) = True
            BstPort(1) = False
        End If

        If sessionNo = 2 Then
            Encodery.Stop()
            Button1.Enabled = True
            Button4.Enabled = True
            emptyString()
            t1y.Abort()
            Button5.Enabled = True
            btMStart(2) = True
            btMStop(2) = True
            btAStart(2) = True
            BstPort(2) = False
        End If

        If sessionNo = 3 Then
            Encoderz.Stop()
            Button1.Enabled = True
            Button4.Enabled = True
            emptyString()
            t1z.Abort()
            Button5.Enabled = True
            btMStart(3) = True
            btMStop(3) = True
            btAStart(3) = True
            BstPort(3) = False
        End If
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        'leftPan
        If currentArc > -450 Then
            If stepArc = 0 Then '45 time max
                currentArc = currentArc - 10
            End If
            If stepArc = 1 Then '30 time max
                currentArc = currentArc - 15
            End If
            If stepArc = 2 Then '15 time max
                currentArc = currentArc - 30
            End If
            If stepArc = 3 Then '9 time max
                currentArc = currentArc - 50
            End If
            If stepArc = 4 Then '5 time max
                currentArc = currentArc - 90
            End If
            leftPan()
        End If
    End Sub

    'rightPan
    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        'rightPan
        If currentArc < 450 Then
            If stepArc = 0 Then '45 time max
                currentArc = currentArc + 10
            End If
            If stepArc = 1 Then '30 time max
                currentArc = currentArc + 15
            End If
            If stepArc = 2 Then '15 time max
                currentArc = currentArc + 30
            End If
            If stepArc = 3 Then '9 time max
                currentArc = currentArc + 50
            End If
            If stepArc = 4 Then '5 time max
                currentArc = currentArc + 90
            End If
            rightPan()
        End If
    End Sub

    'leftPan
    Private Sub saveFileName(ByVal name As String)
        Dim strDate As String = CurrentTime.Now.Day.ToString + "_" + CurrentTime.Now.Month.ToString + "_" + CurrentTime.Now.Year.ToString
        Dim strConn As String = "Data Source= DBServer; Initial Catalog= CCTV; User ID= sa; Password= 123456"
        objectConn = New SqlConnection("Data Source=localhost; Initial Catalog=CCTV;" & _
        "User ID=sa; Password=123456;")
        objectConn.Open()
        Dim sqlCmd As String = "insert into VideoFile (FileNames, DateCreate) values ('" & name & "', '" & strDate & "')"
        cmd = New SqlCommand(sqlCmd, objectConn)
        cmd.ExecuteNonQuery()
        objectConn.Close()
    End Sub

    Private Sub MenuItem7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem7.Click
        Dim SysForm As Form3 = New Form3
        SysForm.ShowDialog()
        BPort = Convert.ToInt32(SysForm.ComboBox2.Items(0))
        BPort1 = Convert.ToInt32(SysForm.ComboBox2.Items(1))
        BPort2 = Convert.ToInt32(SysForm.ComboBox2.Items(2))
        BPort3 = Convert.ToInt32(SysForm.ComboBox2.Items(3))
        port(0) = Convert.ToInt32(SysForm.ComboBox1.Items(0))
        port(1) = Convert.ToInt32(SysForm.ComboBox1.Items(1))
        port(2) = Convert.ToInt32(SysForm.ComboBox1.Items(2))
        port(3) = Convert.ToInt32(SysForm.ComboBox1.Items(3))
        port(4) = Convert.ToInt32(SysForm.ComboBox1.Items(4))
    End Sub

    Private Sub MenuItem5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem5.Click
        If MessageBox.Show("Are you sure want to close this program ?", "Exit Program", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) = DialogResult.OK Then
            stepArc = 0
            While currentArc > 4 And currentArc < -4
                If currentArc > 0 Then
                    leftPan()
                    currentArc = currentArc - 6
                Else
                    rightPan()
                    currentArc = currentArc + 6
                End If
            End While
            Me.Close()
        End If
    End Sub

    Private Sub MenuItem10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem10.Click
        logPage.ShowDialog()
    End Sub

    Private Sub MenuItem9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem9.Click
        Dim about As Form5 = New Form5
        about.ShowDialog()
    End Sub

    'new session
    Private Sub MenuItem2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem2.Click
        If sessionCreate < 3 Then 'ยังไม่เต็ม 4 session
            lbSession.Text = "Creating new session"
            resetState()
            sessionCreate = sessionCreate + 1
            If sessionCreate = 1 Then
                createSession1()
            End If

            If sessionCreate = 2 Then
                createSession2()
            End If

            If sessionCreate = 3 Then
                createSession3()
            End If
        Else
            MessageBox.Show("Session full, can not create new session", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub createSession1()
        Encoderx = New WMEncoder
        SrcGrpCollx = Encoderx.SourceGroupCollection
        SrcPlugMgrx = Encoderx.SourcePluginInfoManager
        DCPlugMgrx = Encoderx.DeviceControlPluginInfoManager
        Descrx = Encoderx.DisplayInfo
        SrcGrpx = SrcGrpCollx.Add("SG_1")
        SrcAudx = SrcGrpx.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)
        SrcVidx = SrcGrpx.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        ProCollx = Encoderx.ProfileCollection()

        Filex = Encoderx.File
        strPathName = "C:\myVideoFile"
        TextBox1.Text = strPathName

        DVColl_Previewx = SrcVidx.PreviewCollection

        PreViewx1 = New WMEncDataView
        lPreviewStreamx1 = DVColl_Previewx.Add(PreViewx1)

        PreViewx = New WMEncDataView
        lPreviewStreamx = DVColl_Previewx.Add(PreViewx)

        Brdcstx = Encoderx.Broadcast
        Brdcstx.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = BPort1
        MenuItem11.Enabled = True
        sessionNo = 1
    End Sub

    Private Sub createSession2()
        Encodery = New WMEncoder
        SrcGrpColly = Encodery.SourceGroupCollection
        SrcPlugMgry = Encodery.SourcePluginInfoManager
        DCPlugMgry = Encodery.DeviceControlPluginInfoManager
        Descry = Encodery.DisplayInfo
        SrcGrpy = SrcGrpColly.Add("SG_1")
        SrcAudy = SrcGrpy.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)
        SrcVidy = SrcGrpy.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        ProColly = Encodery.ProfileCollection()

        Filey = Encodery.File
        strPathName = "C:\myVideoFile"
        TextBox1.Text = strPathName

        DVColl_Previewy = SrcVidy.PreviewCollection

        PreViewy1 = New WMEncDataView
        lPreviewStreamy1 = DVColl_Previewy.Add(PreViewy1)

        PreViewy = New WMEncDataView
        lPreviewStreamy = DVColl_Previewy.Add(PreViewy)

        Brdcsty = Encodery.Broadcast
        Brdcsty.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = BPort2
        MenuItem12.Enabled = True
        sessionNo = 2
    End Sub

    Private Sub createSession3()
        Encoderz = New WMEncoder
        SrcGrpCollz = Encoderz.SourceGroupCollection
        SrcPlugMgrz = Encoderz.SourcePluginInfoManager
        DCPlugMgrz = Encoderz.DeviceControlPluginInfoManager
        Descrz = Encoderz.DisplayInfo
        SrcGrpz = SrcGrpCollz.Add("SG_1")
        SrcAudz = SrcGrpz.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)
        SrcVidz = SrcGrpz.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        ProCollz = Encoderz.ProfileCollection()

        Filez = Encoderz.File
        strPathName = "C:\myVideoFile"
        TextBox1.Text = strPathName

        DVColl_Previewz = SrcVidz.PreviewCollection

        PreViewz1 = New WMEncDataView
        lPreviewStreamz1 = DVColl_Previewz.Add(PreViewz1)

        PreViewz = New WMEncDataView
        lPreviewStreamz = DVColl_Previewz.Add(PreViewz)

        Brdcstz = Encoderz.Broadcast
        Brdcstz.PortNumber(WMENC_BROADCAST_PROTOCOL.WMENC_PROTOCOL_HTTP) = BPort3
        MenuItem13.Enabled = True
        sessionNo = 3
    End Sub

    Private Sub MenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem3.Click
        'hideScreen()
        'PreviewFrame.Visible = True
        lbSession.Text = "Loading session..."
        sessionNo = 0
        Label16.Text = "Camera Number 1"
        loadState()
        lbSession.Text = "Session number : " + sessionNo.ToString()

    End Sub

    Private Sub MenuItem11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem11.Click
        'hideScreen()
        'Panel1.Visible = True
        lbSession.Text = "Loading session..."
        sessionNo = 1
        Label16.Text = "Camera Number 2"
        loadState()
        lbSession.Text = "Session number : " + sessionNo.ToString()
    End Sub

    Private Sub MenuItem12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem12.Click
        'hideScreen()
        'Panel2.Visible = True
        lbSession.Text = "Loading session..."
        sessionNo = 2
        Label16.Text = "Camera Number 3"
        loadState()
        lbSession.Text = "Session number : " + sessionNo.ToString()
    End Sub

    Private Sub MenuItem13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem13.Click
        'hideScreen()
        'Panel3.Visible = True
        lbSession.Text = "Loading session..."
        sessionNo = 3
        Label16.Text = "Camera Number 4"
        loadState()
        lbSession.Text = "Session number : " + sessionNo.ToString()
    End Sub

    Private Sub loadState()
        If sessionNo = 0 Then
            If btMStart(0) = True Then
                Button1.Enabled = True
            End If
            If btMStart(0) = False Then
                Button1.Enabled = False
            End If

            If btMStop(0) = True Then
                Button4.Enabled = True
            End If
            If btMStop(0) = False Then
                Button4.Enabled = False
            End If

            If btAStart(0) = True Then
                Button5.Enabled = True
            End If
            If btAStart(0) = False Then
                Button5.Enabled = False
            End If

            If btAStop(0) = True Then
                Button6.Enabled = True
            End If
            If btAStop(0) = False Then
                Button6.Enabled = False
            End If
        End If

        If sessionNo = 1 Then
            If btMStart(1) = True Then
                Button1.Enabled = True
            End If
            If btMStart(1) = False Then
                Button1.Enabled = False
            End If

            If btMStop(1) = True Then
                Button4.Enabled = True
            End If
            If btMStop(1) = False Then
                Button4.Enabled = False
            End If

            If btAStart(1) = True Then
                Button5.Enabled = True
            End If
            If btAStart(1) = False Then
                Button5.Enabled = False
            End If

            If btAStop(1) = True Then
                Button6.Enabled = True
            End If
            If btAStop(1) = False Then
                Button6.Enabled = False
            End If
        End If

        If sessionNo = 2 Then
            If btMStart(2) = True Then
                Button1.Enabled = True
            End If
            If btMStart(2) = False Then
                Button1.Enabled = False
            End If

            If btMStop(2) = True Then
                Button4.Enabled = True
            End If
            If btMStop(2) = False Then
                Button4.Enabled = False
            End If

            If btAStart(2) = True Then
                Button5.Enabled = True
            End If
            If btAStart(2) = False Then
                Button5.Enabled = False
            End If

            If btAStop(2) = True Then
                Button6.Enabled = True
            End If
            If btAStop(2) = False Then
                Button6.Enabled = False
            End If
        End If

        If sessionNo = 3 Then
            If btMStart(3) = True Then
                Button1.Enabled = True
            End If
            If btMStart(3) = False Then
                Button1.Enabled = False
            End If

            If btMStop(3) = True Then
                Button4.Enabled = True
            End If
            If btMStop(3) = False Then
                Button4.Enabled = False
            End If

            If btAStart(3) = True Then
                Button5.Enabled = True
            End If
            If btAStart(3) = False Then
                Button5.Enabled = False
            End If

            If btAStop(3) = True Then
                Button6.Enabled = True
            End If
            If btAStop(3) = False Then
                Button6.Enabled = False
            End If
        End If

    End Sub

    Private Sub resetState()
        Button1.Enabled = True
        Button4.Enabled = True
        Button6.Enabled = True
        Button5.Enabled = True
    End Sub

    Private Sub GroupBox2_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GroupBox2.Enter

    End Sub

    Private Sub cboCam_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboCam.SelectedIndexChanged
        If cboCam.SelectedIndex = 0 Then
            'hideScreen()
            'PreviewFrame.Visible = True
            lbSession.Text = "Loading session..."
            sessionNo = 0
            Label16.Text = "Camera Number 1"
            loadState()
            lbSession.Text = "Session number : " + sessionNo.ToString()
        End If
        If cboCam.SelectedIndex = 1 Then
            'hideScreen()
            'Panel1.Visible = True
            lbSession.Text = "Loading session..."
            sessionNo = 1
            Label16.Text = "Camera Number 2"
            loadState()
            lbSession.Text = "Session number : " + sessionNo.ToString()
        End If
        If cboCam.SelectedIndex = 2 Then
            'hideScreen()
            'Panel2.Visible = True
            lbSession.Text = "Loading session..."
            sessionNo = 2
            Label16.Text = "Camera Number 3"
            loadState()
            lbSession.Text = "Session number : " + sessionNo.ToString()
        End If
        If cboCam.SelectedIndex = 3 Then
            'hideScreen()
            'Panel3.Visible = True
            lbSession.Text = "Loading session..."
            sessionNo = 3
            Label16.Text = "Camera Number 4"
            loadState()
            lbSession.Text = "Session number : " + sessionNo.ToString()
        End If
    End Sub

    Private Sub lbSession_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lbSession.Click

    End Sub

    Private Sub leftMove()
        portAddr.Out32(address, 254)
        If stepArc = 0 Then
            turnLeft.Sleep(18)
        End If
        If stepArc = 1 Then
            turnLeft.Sleep(33)
        End If
        If stepArc = 2 Then
            turnLeft.Sleep(45)
        End If
        If stepArc = 3 Then
            turnLeft.Sleep(85)
        End If
        If stepArc = 4 Then
            turnLeft.Sleep(270)
        End If
        portAddr.Out32(address, 255)
    End Sub

    Private Sub rightMove()
        portAddr.Out32(address, 252)
        If stepArc = 0 Then
            turnRight.Sleep(20)
        End If
        If stepArc = 1 Then
            turnRight.Sleep(35)
        End If
        If stepArc = 2 Then
            turnRight.Sleep(50)
        End If
        If stepArc = 3 Then
            turnRight.Sleep(90)
        End If
        If stepArc = 4 Then
            turnRight.Sleep(280)
        End If
        portAddr.Out32(address, 255)
    End Sub

    Private Sub leftPan()
        turnLeft = New System.Threading.Thread( _
        AddressOf leftMove)

        turnLeft.IsBackground = True
        turnLeft.Start()
    End Sub

    Private Sub rightPan()
        turnRight = New System.Threading.Thread( _
        AddressOf rightMove)

        turnRight.IsBackground = True
        turnRight.Start()
    End Sub

    Private Sub testEncode()
        Encodera = New WMEncoder

        ' Retrieve the source group collection and add a source group. 
        Dim SrcGrpColla As IWMEncSourceGroupCollection
        SrcGrpColla = Encodera.SourceGroupCollection
        Dim SrcGrpa As IWMEncSourceGroup2
        SrcGrpa = SrcGrpColla.Add("SG_1")

        ' Add a video and audio source to the source group.
        Dim SrcVida As IWMEncVideoSource2
        Dim SrcAuda As IWMEncAudioSource
        SrcVida = SrcGrpa.AddSource(WMENC_SOURCE_TYPE.WMENC_VIDEO)
        SrcAuda = SrcGrpa.AddSource(WMENC_SOURCE_TYPE.WMENC_AUDIO)

        ' Identify the source files to encode.
        SrcVida.SetInput("C:\myVideoFile\testa.wmv")
        SrcAuda.SetInput("C:\myVideoFile\testa.wmv")

        ' Choose a profile from the collection.
        Dim ProColla As IWMEncProfileCollection
        Dim Proa As IWMEncProfile
        Dim ia As Integer
        Dim lLengtha As Long

        ProColla = Encodera.ProfileCollection
        lLengtha = ProColla.Count

        For ia = 0 To lLengtha - 1
            Proa = ProColla.Item(ia)
            If Proa.Name = "Windows Media Video 8 for Dial-up Modems (28.8 Kbps)" Then
                SrcGrpa.Profile = Proa
                Exit For
            End If
        Next

        DVColl_Previewa = SrcVida.PreviewCollection

        PreViewa1 = New WMEncDataView
        lPreviewStreama1 = DVColl_Previewa.Add(PreViewa1)

        PreViewa = New WMEncDataView
        lPreviewStreama = DVColl_Previewa.Add(PreViewa)

        Encodera.PrepareToEncode(True)

        PreViewa.SetViewProperties(lPreviewStreama, PostviewFrame4.Handle.ToInt32)
        PreViewa.StartView(lPreviewStreama)

        Encodera.Start()
    End Sub

    Private Sub LinkLabel3_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel3.LinkClicked
        Encodera.Stop()
    End Sub

    Private Sub LinkLabel2_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel2.LinkClicked
        testEncode()
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        If LinkLabel1.Text = "Change" Then
            LinkLabel1.Text = "OK"
            ComboBox2.Enabled = True
        Else
            LinkLabel1.Text = "Change"
            ComboBox2.Enabled = False
            stepArc = ComboBox2.SelectedIndex
        End If
    End Sub

    Private Sub hideScreen()
        PreviewFrame.Visible = False
    End Sub

    Protected Overrides Sub Finalize()
  
    End Sub

    Private Sub bnAuto_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles bnAuto.Click
        If autoPan = False Then
            bnAuto.Text = "Stop"
            threadAuto = New System.Threading.Thread( _
            AddressOf autoMove)
            threadAuto.IsBackground = True
            threadAuto.Start()
            autoPan = True
        Else
            threadAuto.Abort()
            bnAuto.Text = "Auto pan"
            autoPan = False
        End If
    End Sub

    Private Sub autoMove()
        While currentArc > 10 And currentArc < -10
            If currentArc > 0 Then
                If stepArc = 0 Then '45 time max
                    currentArc = currentArc - 10
                    leftPan()
                End If
                If stepArc = 1 Then '30 time max
                    currentArc = currentArc - 15
                    leftPan()
                End If
                If stepArc = 2 Then '15 time max
                    currentArc = currentArc - 30
                    leftPan()
                End If
                If stepArc = 3 Then '9 time max
                    currentArc = currentArc - 50
                    leftPan()
                End If
                If stepArc = 4 Then '5 time max
                    currentArc = currentArc - 90
                    leftPan()
                End If

            End If

            threadAuto.Sleep(1000)

            If currentArc < 0 Then
                If stepArc = 0 Then '45 time max
                    currentArc = currentArc + 10
                    rightPan()
                End If
                If stepArc = 1 Then '30 time max
                    currentArc = currentArc + 15
                    rightPan()
                End If
                If stepArc = 2 Then '15 time max
                    currentArc = currentArc + 30
                    rightPan()
                End If
                If stepArc = 3 Then '9 time max
                    currentArc = currentArc + 50
                    rightPan()
                End If
                If stepArc = 4 Then '5 time max
                    currentArc = currentArc + 90
                    rightPan()
                End If
            End If
        End While 'set center

        While autoPan = True
            While currentArc < 450
                If stepArc = 0 Then '45 time max
                    currentArc = currentArc + 10
                    rightPan()
                End If
                If stepArc = 1 Then '30 time max
                    currentArc = currentArc + 15
                    rightPan()
                End If
                If stepArc = 2 Then '15 time max
                    currentArc = currentArc + 30
                    rightPan()
                End If
                If stepArc = 3 Then '9 time max
                    currentArc = currentArc + 50
                    rightPan()
                End If
                If stepArc = 4 Then '5 time max
                    currentArc = currentArc + 90
                    rightPan()
                End If
                threadAuto.Sleep(1000)
            End While

            While currentArc > -450
                If stepArc = 0 Then '45 time max
                    currentArc = currentArc - 10
                    leftPan()
                End If
                If stepArc = 1 Then '30 time max
                    currentArc = currentArc - 15
                    leftPan()
                End If
                If stepArc = 2 Then '15 time max
                    currentArc = currentArc - 30
                    leftPan()
                End If
                If stepArc = 3 Then '9 time max
                    currentArc = currentArc - 50
                    leftPan()
                End If
                If stepArc = 4 Then '5 time max
                    currentArc = currentArc - 90
                    leftPan()
                End If
                threadAuto.Sleep(1000)
            End While
        End While

    End Sub

    Private Sub MenuItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem4.Click

    End Sub
End Class

