Option Strict Off
Option Explicit On 
Imports System.Net
Imports System.Net.Sockets
Imports System.Threading
Imports System.IO
Imports System.Text


Friend Class Form1
	Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		If m_vb6FormDefInstance Is Nothing Then
			If m_InitializingDefInstance Then
				m_vb6FormDefInstance = Me
			Else
				Try 
					'For the start-up form, the first instance created is the default instance.
					If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
						m_vb6FormDefInstance = Me
					End If
				Catch
				End Try
			End If
		End If
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
    Public WithEvents TmgX1 As AxTMGXLib.AxTmgX
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button2 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.TmgX1 = New AxTMGXLib.AxTmgX
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Button3 = New System.Windows.Forms.Button
        Me.Button4 = New System.Windows.Forms.Button
        Me.Button1 = New System.Windows.Forms.Button
        Me.Button2 = New System.Windows.Forms.Button
        CType(Me.TmgX1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'TmgX1
        '
        Me.TmgX1.Enabled = True
        Me.TmgX1.Location = New System.Drawing.Point(8, 8)
        Me.TmgX1.Name = "TmgX1"
        Me.TmgX1.OcxState = CType(resources.GetObject("TmgX1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.TmgX1.Size = New System.Drawing.Size(512, 512)
        Me.TmgX1.TabIndex = 0
        '
        'Timer1
        '
        Me.Timer1.Interval = 180000
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(536, 192)
        Me.Button3.Name = "Button3"
        Me.Button3.TabIndex = 26
        Me.Button3.Text = "Start Server"
        '
        'Button4
        '
        Me.Button4.Location = New System.Drawing.Point(536, 224)
        Me.Button4.Name = "Button4"
        Me.Button4.TabIndex = 27
        Me.Button4.Text = "c map"
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(536, 152)
        Me.Button1.Name = "Button1"
        Me.Button1.TabIndex = 28
        Me.Button1.Text = "Test webservice"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(536, 112)
        Me.Button2.Name = "Button2"
        Me.Button2.TabIndex = 29
        Me.Button2.Text = "Button2"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(632, 542)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.Button4)
        Me.Controls.Add(Me.Button3)
        Me.Controls.Add(Me.TmgX1)
        Me.Cursor = System.Windows.Forms.Cursors.Default
        Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Location = New System.Drawing.Point(4, 23)
        Me.Name = "Form1"
        Me.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Text = "Search"
        CType(Me.TmgX1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
#End Region 
#Region "Upgrade Support "
	Private Shared m_vb6FormDefInstance As Form1
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As Form1
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New Form1()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
    Dim webref As WebReference.Service1
    Dim noFile As Integer = 0
    Dim mapName As ArrayList
    Dim curMapIndex As Integer = 0
    Dim myLat As Double
    Dim myLon As Double

    Private Sub cmdShowDlgSearchWp_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs)
        TmgX1.ShowFindWaypointsDialog()
    End Sub


    Public Function ReadBitmap2ByteArray(ByVal fileName As String) As Byte()
        ' Using
        Dim image As Bitmap = New Bitmap(fileName)
        Try
            Dim stream As MemoryStream = New MemoryStream
            image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg)
            Return stream.ToArray
        Finally
            CType(image, IDisposable).Dispose()
        End Try
    End Function

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        webref = New WebReference.Service1
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        ' Check for request from server
        Dim userPoint As WebReference.UserPoint
        Dim temp() As Object
        Dim len As Integer

        temp = webref.getUserPoint()
        len = temp.Length - 1

        While len >= 0
            userPoint = CType(temp(len), WebReference.UserPoint)

            ' Set lat, lon and upload picture to database
            Dim imgdata As Byte()
            TmgX1.SetCenter(userPoint.Latitude, userPoint.Longitude)

            ' Save current map
            TmgX1.SaveMapToBMP("d:\testdata\test" & noFile & ".bmp")

            ' Convert bitmap to byte array
            imgdata = ReadBitmap2ByteArray("d:\testdata\test" & noFile & ".bmp")

            ' Upload byte array to database
            If webref.UpdateMap(userPoint.IDUser, imgdata) = 0 Then
                MsgBox("Error uploading data to server")
            End If

            noFile = noFile + 1
            If (noFile > 10) Then
                noFile = 0
            End If

            len = len - 1
        End While
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        ' Must listen on correct port- must be same as port client wants to connect on.
        Dim thread As Thread = New Thread(AddressOf StartServer)
        thread.IsBackground = True
        thread.Start()
    End Sub

    Private Sub StartServer()

        Const portNumber As Integer = 11344
        Dim tcpListener As New TcpListener(portNumber)
        Dim clientdata As String
        Dim myLen As Double
        tcpListener.Start()
        'Console.WriteLine("Waiting for connection...")

        Try
            While True
                'Accept the pending client connection and return a TcpClient initialized for communication. 
                Dim tcpClient As TcpClient = tcpListener.AcceptTcpClient()
                Console.WriteLine("Connection accepted.")
                ' Get the stream
                Dim networkStream As NetworkStream = tcpClient.GetStream()
                ' Read the stream into a byte array
                Dim bytes(tcpClient.ReceiveBufferSize) As Byte
                networkStream.Read(bytes, 0, CInt(tcpClient.ReceiveBufferSize))
                ' Return the data received from the client to the console.
                clientdata = Encoding.ASCII.GetString(bytes)

                If clientdata.Chars(0) = "A" Then

                    ' Get string and convert to lat and lon
                    Dim lat As Double
                    Dim lon As Double
                    Dim id As Integer
                    Dim tempString As String
                    Dim pos As Integer = 1

                    tempString = ""

                    ' Get user id
                    While Not (clientdata.Chars(pos) = "B")
                        tempString = tempString + clientdata.Chars(pos)
                        pos = pos + 1
                    End While
                    id = Convert.ToInt16(tempString)
                    tempString = ""

                    ' Get latitude
                    pos = pos + 1
                    While Not (clientdata.Chars(pos) = "C")
                        tempString = tempString + clientdata.Chars(pos)
                        pos = pos + 1
                    End While

                    lat = Convert.ToDouble(tempString)
                    tempString = ""

                    ' Get longitude
                    pos = pos + 1
                    While Not (clientdata.Chars(pos) = "D")
                        tempString = tempString + clientdata.Chars(pos)
                        pos = pos + 1
                    End While

                    lon = Convert.ToDouble(tempString)

                    mapName = New ArrayList
                    ChooseMap(lat, lon)

                    If mapName.Count = 0 Then
                        Return
                    End If

                    Dim imgdata As Byte()

                    myLat = lat
                    myLon = lon

                    TmgX1.OpenMap("c:\tummap\BANGKOK FULL.tmg")
                    TmgX1.SetScale(0)
                    TmgX1.AddWaypoint(" ", myLat, myLon, 1, 1, "")
                    TmgX1.SetCenter(myLat, myLon)

                    ' Find length of map
                    Dim t, l, r, b As Double
                    TmgX1.GetMapRect(t, l, r, b)
                    myLen = b - l

                    ' Save current map
                    TmgX1.SaveMapToBMP("c:\test00.bmp")

                    ' Convert bitmap to byte array
                    imgdata = ReadBitmap2ByteArray("c:\test00.bmp")

                    ' Upload byte array to database
                    If webref.UpdateMap(id.ToString(), imgdata) = 0 Then
                        MsgBox("Error uploading data to server")
                    End If

                End If

                Dim responseString As String = myLen.ToString()
                Dim sendBytes As [Byte]() = Encoding.ASCII.GetBytes(responseString)
                networkStream.Write(sendBytes, 0, sendBytes.Length)
                'Console.WriteLine(("Client sent: " + clientdata))
                tcpClient.Close()

            End While

            'Any communication with the remote client using the TcpClient can go here.
            'Close TcpListener and TcpClient.
            tcpListener.Stop()

        Catch ex As Exception

            Console.WriteLine(ex.ToString())
        End Try

    End Sub
    Public Function Bett(ByVal lat As Double, ByVal lon As Double, ByVal la1 As Double, ByVal lo1 As Double, ByVal la2 As Double, ByVal lo2 As Double) As Boolean
        If lat < la1 And lat > la2 And lon > lo1 And lon < lo2 Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Function ChooseMap(ByVal lati As Double, ByVal longi As Double)
        '------------Try Bangkok
        Dim Prov As String
        mapName.Clear()

        '------------Check Lat-Lon in Map?
        If (Bett(lati, longi, 13.801674, 100.32588200000001, 13.556674, 100.924632)) Then
            Prov = "Bangkok Full"
            mapName.Add(Prov)
        End If

        '-------------------NORTH OF THAILAND
        If ((lati > 14.91 And lati < 20.47 And longi > 97.374 And longi < 100.9) Or (lati > 14.97 And lati < 15.64 And longi > 97.374 And longi < 98.19) Or (lati > 15.64 And lati < 18.45 And longi > 100.9 And longi < 101.81)) Then

            If (Bett(lati, longi, 19.788549, 97.374007, 17.708549, 98.684007)) Then
                Prov = "MAE HONG SON"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 20.148549, 98.084007, 17.248549, 99.464007)) Then
                Prov = "CHIANG MAI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 20.478549, 99.214007, 18.938549, 100.494007)) Then
                Prov = "CHIANG RAI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.682924, 98.672132, 17.452924, 99.202132)) Then
                Prov = "LAMPHUN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 17.178549, 100.664007, 15.318549, 101.814007)) Then
                Prov = "PHETCHABUN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 19.718549, 99.684007, 18.828549, 100.624007)) Then
                Prov = "PHAYAO"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 19.598549, 100.344007, 18.058549, 101.274007)) Then
                Prov = "NAN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.888549, 99.444007, 17.688549, 100.494007)) Then
                Prov = "PHRAE"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.338549, 100.024007, 17.198549, 101.134007)) Then
                Prov = "UTTARADIT"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 19.412924, 99.062132, 17.252924, 99.992132)) Then
                Prov = "LAMPANG"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 17.808549, 99.324007, 16.698549, 100.084007)) Then
                Prov = "SUKHOTHAI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.898549, 98.964007, 15.858549, 100.054007)) Then
                Prov = "KAMPHAENG PHET"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 17.708549, 99.954007, 16.368549, 101.104007)) Then
                Prov = "PHITSANULOK"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.618549, 99.984007, 15.928549, 100.784007)) Then
                Prov = "PHICHIT"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 17.878549, 97.744007, 15.168549, 99.424007)) Then
                Prov = "TAK"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.158549, 99.084007, 15.108549, 100.824007)) Then
                Prov = "NAKHON SAWAN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.828549, 99.034007, 14.978549, 100.074007)) Then
                Prov = "UTHAI THANI"
                mapName.Add(Prov)
            End If

            '------------North
        Else
        End If

        '---------------South


        If (lati > 5.563 And lati < 12.63 And longi > 98.2 And longi < 102.11) Then
            '-------------- South
            If (Bett(lati, longi, 12.633549, 99.199007, 10.943549, 100.024007)) Then
                Prov = "PRACHUAP KHIRI KHAN"
                mapName.Add(Prov)
            End If

            If (Bett(lati, longi, 11.088549, 98.764007, 9.598549, 99.459007)) Then
                Prov = "CHUMPHON"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 10.793549, 98.434007, 9.323549, 98.904007000000007)) Then
                Prov = "RANONG"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 9.718549, 98.524007, 8.313549, 99.824007)) Then
                Prov = "SURAT THANI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 9.358549, 98.209007, 8.133549, 98.714007)) Then
                Prov = "PHANGNGA"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 8.198549, 98.269007, 7.763549, 98.449007)) Then
                Prov = "PHUKET"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 8.678549, 98.644007, 7.663549, 99.434007)) Then
                Prov = "KRABI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 9.308549, 99.294007, 7.803549, 100.349007)) Then
                Prov = "NAKHON SI THAMMARAT "
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 7.998549, 99.259007, 7.083549, 100.02900700000001)) Then
                Prov = "TRANG"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 7.883549, 99.724007, 7.138549, 100.384007)) Then
                Prov = "PHATTHALUNG"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 7.138549, 99.649007, 6.458549, 100.239007)) Then
                Prov = "SATUN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 7.908549, 100.009007, 6.318549, 101.109007)) Then
                Prov = "SONGKHLA"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 6.958549, 101.019007, 6.563549, 101.734007)) Then
                Prov = "PATTANI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 6.688549, 100.859007, 5.588549, 101.609007)) Then
                Prov = "YALA"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 6.623549, 101.389007, 5.733549, 102.114007)) Then
                Prov = "NARATHIWAT"
                mapName.Add(Prov)
            End If
        Else
            'TmgX1.OpenMap "c:\dnstracking\map\07 South of Thailand.tmg"
        End If


        '--------------North-East
        If ((lati > 14.158549 And lati < 18.45 And longi > 101.81 And longi < 105.6) Or (lati > 14.15 And lati < 15.64 And longi > 102.93 And longi < 105.6)) Then
            If (Bett(lati, longi, 18.228549, 100.90400700000001, 16.788549, 102.144007)) Then
                Prov = "LOEI"
                mapName.Add(Prov)
            End If

            If (Bett(lati, longi, 17.688549, 101.924007, 16.758549, 102.684007)) Then
                Prov = "NONG BUA LAM PHU"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.458549, 102.074007, 17.688549, 104.194007)) Then
                Prov = "NONG KHAI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.058549, 102.054007, 16.838549, 103.664007)) Then
                Prov = "UDON THANI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.068549, 103.264007, 16.808549, 104.414007)) Then
                Prov = "SAKON NAKHON"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 18.018549, 103.964007, 16.808549, 104.814007)) Then
                Prov = "NAKHON PHANOM"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.888549, 104.084007, 16.198549, 104.984007)) Then
                Prov = "MUKDAHAN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.288549, 104.414007, 15.558549, 105.044007)) Then
                Prov = "AMNAT CHAROEN "
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.108549, 104.384007, 14.238549, 105.604007)) Then
                Prov = "UBON RATCHATHANI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.358549, 103.964007, 15.338549, 104.814007)) Then
                Prov = "YASOTHON"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.578549, 103.914007, 14.458549, 104.884007)) Then
                Prov = "SI SA KET"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.468549, 103.094007, 14.378549, 104.104007)) Then
                Prov = "SURIN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.488549, 103.294007, 15.448549, 104.324007)) Then
                Prov = "ROI ET"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 17.088549, 103.054007, 16.198549, 104.234007)) Then
                Prov = "KALASIN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 17.018549, 101.734007, 15.678549, 103.174007)) Then
                Prov = "KHON KAEN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.718549, 101.314007, 15.318549, 102.454007)) Then
                Prov = "CHAIYAPHUM"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.778549, 101.294007, 14.158549, 103.004007)) Then
                Prov = "NAKHON RATCHASIMA"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.788549, 102.434007, 14.168549, 103.484007)) Then
                Prov = "BURI RAM"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 16.653549, 102.844007, 15.433549, 103.489007)) Then
                Prov = "MAHA SARAKHAM"
                mapName.Add(Prov)
            End If
        Else
            'TmgX1.OpenMap "c:\dnstracking\map\08 North East of Thailand.tmg"
        End If
        If ((lati > 11.051049 And lati < 15.659049 And longi > 97.924107 And longi < 103.133707)) Then

            '------------Centre
            If (Bett(lati, longi, 15.433549, 99.719007, 14.943549, 100.359007)) Then
                Prov = "CHAI NAT"
                mapName.Add(Prov)
            End If

            If (Bett(lati, longi, 14.163549, 99.824007, 13.668549, 100.344007)) Then
                Prov = "NAKHON PATHOM"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.088549, 99.274007, 14.118549, 100.294007)) Then
                Prov = "SUPHAN BURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.078549, 100.174007, 14.758549, 100.484007)) Then
                Prov = "SING BURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.468549, 100.374007, 14.718549, 101.384007)) Then
                Prov = "LOP BURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.798549, 100.184007, 14.478549, 100.544007)) Then
                Prov = "ANG THONG"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 15.048549, 100.554007, 14.328549, 101.464007)) Then
                Prov = "SARABURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.658549, 100.234007, 14.118549, 100.824007)) Then
                Prov = "PHRA NAKHON SI AYUTTHAYA"
                mapName.Add(Prov)
            End If

            If (Bett(lati, longi, 13.513549, 99.851507, 13.248549, 100.084007)) Then
                Prov = "SAMUT SONGKHAM"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.706049, 100.044007, 13.433549, 100.406507)) Then
                Prov = "SAMUT SAKHON"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.266049, 100.351507, 13.937299, 100.911507)) Then
                Prov = "PATHUM THANI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.129174, 100.27900700000001, 13.799174, 100.617757)) Then
                Prov = "NONTHABURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.701674, 100.414632, 13.464174, 100.948382)) Then
                Prov = ""
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 6.623549, 101.389007, 5.733549, 102.114007)) Then
                Prov = "SAMUT PRAKARN"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.908549, 99.149007, 13.203549, 100.069007)) Then
                Prov = "RATCHABURI"
                mapName.Add(Prov)
            End If

            If (Bett(lati, longi, 15.648549, 98.194007, 13.773549, 99.894007)) Then
                Prov = "KANCHANABURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.358549, 99.104007, 12.638549, 100.104007)) Then
                Prov = "PHETCHABURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.198549, 101.834007, 13.278549, 102.934007)) Then
                Prov = "SA KAEO"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.328549, 101.644007, 12.338549, 102.524007)) Then
                Prov = "CHANTHABURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 12.758549, 102.234007, 11.778549, 102.90400700000001)) Then
                Prov = "TRAT"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.608549, 100.854007, 12.668549, 101.724007)) Then
                Prov = "CHON BURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.968549, 100.884007, 13.188549, 102.014007)) Then
                Prov = "CHACHOENGSAO"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.518549, 101.15400700000001, 13.698549, 102.074007)) Then
                Prov = "PRACHIN BURI"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 13.142924, 101.022132, 12.622924, 101.812132)) Then
                Prov = "RAYONG"
                mapName.Add(Prov)
            End If
            If (Bett(lati, longi, 14.508549, 100.894007, 13.988549, 101.524007)) Then
                Prov = "NAKHON NAYOK"
                mapName.Add(Prov)
            End If
        Else
        End If

        If (lati > 13.55 And lati < 13.8 And longi > 100.3258 And longi < 100.9246) Then


            Prov = "Bangkok No Subsoi"
            mapName.Add(Prov)

            '------------Try South
        ElseIf (lati > 5.563 And lati < 12.63 And longi > 98.2 And longi < 102.11) Then
            '-------------- South

            Prov = "07 South of Thailand"
            mapName.Add(Prov)
            '------------Try North

        ElseIf ((lati > 15.64 And lati < 20.47 And longi > 97.374 And longi < 100.9) Or (lati > 14.97 And lati < 15.64 And longi > 97.374 And longi < 98.19) Or (lati > 15.64 And lati < 18.45 And longi > 100.9 And longi < 101.81)) Then
            '------------North

            Prov = "05 North Of Thailand"
            mapName.Add(Prov)

            '-----------Try North-East
        ElseIf ((lati > 15.64 And lati < 18.45 And longi > 101.81 And longi < 105.6) Or (lati > 14.15 And lati < 15.64 And longi > 102.93 And longi < 105.6)) Then

            '------------North-East

            Prov = "08 North East of Thailand"
            mapName.Add(Prov)

        ElseIf ((lati > 10.974249 And lati < 15.620649 And longi > 98.128907 And longi < 103.082507)) Then
            Prov = "06 Center of Thailand"
            mapName.Add(Prov)
        Else
            MsgBox("Not in Case lat = " & Str(lati) & " lon = " & Str(longi))
        End If

    End Function

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        If mapName.Count = 0 Then
            Return
        End If

        TmgX1.OpenMap("c:\tummap\" + mapName(curMapIndex) + ".tmg")
        TmgX1.AddWaypoint(" ", myLat, myLon, 1, 1, "")
        TmgX1.SetCenter(myLat, myLon)

        curMapIndex = curMapIndex + 1
        If (curMapIndex > mapName.Count) Then
            curMapIndex = 0
        End If

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        ' Convert bitmap to byte array
        Dim imgdata As Byte()
        imgdata = ReadBitmap2ByteArray("c:\test00.bmp")

        ' Upload byte array to database
        If webref.UpdateMap("1", imgdata) = 0 Then
            MsgBox("Error uploading data to server")
        End If
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click

        TmgX1.OpenMap("c:\tummap\BANGKOK FULL.tmg")

        TmgX1.SetScale(0)

        TmgX1.AddWaypoint(" ", 13.74451926772927, 100.55382729822421, 1, 1, "")
        TmgX1.SetCenter(13.74451926772927, 100.55382729822421)

    End Sub
End Class