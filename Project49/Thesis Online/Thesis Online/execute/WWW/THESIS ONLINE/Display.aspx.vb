Option Explicit On
Option Strict On

Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data.OleDb
Imports System.Xml
Imports System.IO
Imports System.IO.Directory
Imports System.Web.UI.HtmlControls
Imports System
Imports System.Collections
Partial Class Display
    Inherits System.Web.UI.Page
    Private Shared AbstractThai As String
    Private Shared AbstractEng As String
    Private Shared TextFile(19) As String
    Private Shared FileXml, Linkbook, Linkbook1 As String
    Private Shared Count As Integer = 0
    Private Shared NotFile As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            ShowData()
        End If

    End Sub
    Protected Sub ShowData()
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT FILEXML.query('data(//Title_Title)'),FILEXML.query('data(//Title_Alternative)') "
            sqlSavedata += ",FILEXML.query('data(//Creator_Name)'),FILEXML.query('data(//Subject_ThaSH)') "
            sqlSavedata += ",FILEXML.query('data(//Desscription_Abstract )'),FILEXML.query('data(//Abstract_English )') "
            sqlSavedata += ",FILEXML.query('data(//Contributor_Name)'),FILEXML.query('data(//Contributor_Roles)') "
            sqlSavedata += ",FILEXML.query('data(//Contributor_E-mail )'),FILEXML.query('data(//Publisher_Name )') "
            sqlSavedata += ",FILEXML.query('data(//Publisher_Place)'),FILEXML.query('data(//Publisher_E-mail)') "
            sqlSavedata += ",FILEXML.query('data(//Date_Created )'),FILEXML.query('data(//Date_Modified )') "
            sqlSavedata += ",FILEXML.query('data(//DC_Language)'),FILEXML.query('data(//DC_Format)') "
            sqlSavedata += ",FILEXML.query('data(//Identifier_Url )'),FILEXML.query('data(//Identifier_Isbn )') "
            sqlSavedata += ",FILEXML.query('data(//Source_Call_Number)'),FILEXML.query('data(//DC_Language)') "
            sqlSavedata += ",FILEXML.query('data(//Thesis_Degree_Name )'),FILEXML.query('data(//Thesis_Degree_Level )') "
            sqlSavedata += ",FILEXML.query('data(//Thesis_Degree_Descipline)'),FILEXML.query('data(//Thesis_Degree_Grantor)') "
            sqlSavedata += ",FILEXML.query('data(//Rights_Rights )'),FILEXML.query('data(//Rights_Rights_Accress )') "
            sqlSavedata += ",POSITIONFILE "
            sqlSavedata += "FROM DC_BOOK  "
            sqlSavedata += "WHERE (BOOK_ID = N'" + Request.QueryString("BookId") + "')"

            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DATA")
            If ds.Tables("DATA").Rows.Count <> 0 Then
                Label1.Text = CStr(ds.Tables("DATA").Rows(0)(0).ToString())
                Label2.Text = CStr(ds.Tables("DATA").Rows(0)(1).ToString())
                Label3.Text = CStr(ds.Tables("DATA").Rows(0)(2).ToString())
                Label4.Text = ""
                Label5.Text = ""
                Dim txtsub As String = CStr(ds.Tables("DATA").Rows(0)(3).ToString())
                txtsub = txtsub.Replace(".", ".|")
                Dim splitText() As String = Split(txtsub, "|")
                For i As Integer = 0 To splitText.Length - 1
                    If splitText(i) <> " " And splitText(i) <> "" Then
                        If i = 0 Then
                            Label4.Text = splitText(i)
                        Else
                            Label5.Text += splitText(i) + "<br>"
                        End If

                    End If
                Next
                Label6.Text = CStr(ds.Tables("DATA").Rows(0)(4).ToString())
                Label7.Text = CStr(ds.Tables("DATA").Rows(0)(5).ToString())
                Label8.Text = CStr(ds.Tables("DATA").Rows(0)(6).ToString())
                Label9.Text = CStr(ds.Tables("DATA").Rows(0)(7).ToString())
                Label10.Text = CStr(ds.Tables("DATA").Rows(0)(8).ToString())
                Label11.Text = CStr(ds.Tables("DATA").Rows(0)(9).ToString())
                Label12.Text = CStr(ds.Tables("DATA").Rows(0)(10).ToString())
                Label13.Text = CStr(ds.Tables("DATA").Rows(0)(11).ToString())
                Label14.Text = CStr(ds.Tables("DATA").Rows(0)(12).ToString())
                Label15.Text = CStr(ds.Tables("DATA").Rows(0)(13).ToString())
                Label16.Text = CStr(ds.Tables("DATA").Rows(0)(14).ToString())
                Label17.Text = CStr(ds.Tables("DATA").Rows(0)(15).ToString())
                Label18.Text = CStr(ds.Tables("DATA").Rows(0)(16).ToString())
                Label19.Text = CStr(ds.Tables("DATA").Rows(0)(17).ToString())
                Label20.Text = CStr(ds.Tables("DATA").Rows(0)(18).ToString())
                Label21.Text = CStr(ds.Tables("DATA").Rows(0)(19).ToString())
                Label22.Text = CStr(ds.Tables("DATA").Rows(0)(20).ToString())
                Label23.Text = CStr(ds.Tables("DATA").Rows(0)(21).ToString())
                Label24.Text = CStr(ds.Tables("DATA").Rows(0)(22).ToString())
                Label25.Text = CStr(ds.Tables("DATA").Rows(0)(23).ToString())
                Label26.Text = CStr(ds.Tables("DATA").Rows(0)(24).ToString())
                Label27.Text = CStr(ds.Tables("DATA").Rows(0)(25).ToString())
                NotFile = CStr(ds.Tables("DATA").Rows(0)(26).ToString())

            End If

            Conn.Close()
            If Trim(NotFile) = "0" Then
                Exit Sub
            End If
            Dim str As String = Request.ServerVariables("REMOTE_ADDR")
            str = Mid(str, 1, 8)
            If str = "161.246." Then
                ShowDataFile()
            End If

        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try

    End Sub
    Protected Sub ShowDataFile()
        Try
            If Request.QueryString("BookId") = "" Then
                Exit Sub
            End If
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT [LINK_FILE],[FILE_BOOK_FULL],[FILE_CHAPTER1],[FILE_CHAPTER2] "
            sqlSavedata += ",[FILE_CHAPTER3],[FILE_CHAPTER4],[FILE_CHAPTER5],[FILE_CHAPTER6] "
            sqlSavedata += ",[FILE_CHAPTER7],[FILE_CHAPTER8],[FILE_CHAPTER9],[FILE_CHAPTER10] "
            sqlSavedata += ",[FILE_CHAPTER11],[FILE_CHAPTER12],[FILE_CHAPTER13],[FILE_CHAPTER14] "
            sqlSavedata += ",[FILE_CHAPTER15],[FILE_DOCUMENT] "
            sqlSavedata += "FROM [DC_FILE] "
            sqlSavedata += "WHERE (BOOK_ID = N'" + Request.QueryString("BookId") + "')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DATA")
            If ds.Tables("DATA").Rows.Count <> 0 Then
                For i As Integer = 0 To 18 - 1
                    If CStr(ds.Tables("DATA").Rows(0)(i).ToString()) <> "" Then
                        TextFile(Count) = ds.Tables("DATA").Rows(0)(i).ToString()
                        Count += 1
                    End If
                Next
            End If

            Conn.Close()
            Newdataxml()
            OpenXML()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try

    End Sub
    '-----------------------------  ADD XML  -----------------------------------

    Protected Sub Newdataxml()
        ' create StringBuilders to hold the results
        Try
            Linkbook = TextFile(0)
            Linkbook1 = Linkbook + Label20.Text + ".xml"
            FileXml = Server.MapPath(TextFile(0) + "FileXml.xml")
            Dim Objfiles As New FileInfo(FileXml)
            If Objfiles.Exists = True Then
                Exit Sub
            End If
            If FileXml <> "" Then
                If Objfiles.Exists = True Then
                    Objfiles.Delete()
                End If
            End If
            Dim ws As New XmlWriterSettings()
            ws.Indent = True
            ws.CheckCharacters = True
            ws.CloseOutput = True
            Using xw As XmlWriter = XmlWriter.Create(FileXml)
                If ws.ConformanceLevel <> ConformanceLevel.Fragment Then
                    xw.WriteStartDocument(True)
                End If
                xw.WriteStartElement("Book")
                If Count <> 0 Then
                    For i As Integer = 1 To Count - 1
                        If TextFile(i) <> "" Then
                            xw.WriteStartElement("Row")
                            xw.WriteElementString("LinkId", TextFile(0))
                            xw.WriteElementString("FileId", TextFile(i))
                            xw.WriteEndElement()
                        End If
                    Next
                Else
                    xw.WriteStartElement("Row")
                    xw.WriteElementString("LinkId", "")
                    xw.WriteElementString("FileId", "")
                    xw.WriteEndElement()
                End If

                xw.WriteEndElement()
                xw.WriteEndDocument()
                xw.Close()
            End Using
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx?Newdataxml=")
        End Try

    End Sub
    Protected Sub OpenXML()
        Dim Objfile As New FileInfo(FileXml)
        If Request.QueryString("BookId") = "" Then
            Exit Sub
        End If

        Dim Ds As New DataSet
        Dim fs As FileStream
        Dim rs As StreamReader
        Try
            fs = New FileStream(FileXml, FileMode.Open, FileAccess.Read)
            rs = New StreamReader(fs)
            Ds.ReadXml(rs)
            GridSearch.DataSource = Ds.Tables(0)
            GridSearch.DataBind()
            fs.Close()
            rs.Close()
            For i As Integer = 0 To 19
                TextFile(i) = ""
                Count = 0
            Next
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx?OpenXML=")
        End Try
    End Sub

    Protected Sub linkxml_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkxml.Click
        If Linkbook1 <> "" Then
            Response.Redirect(Linkbook1)
        End If

    End Sub
End Class
