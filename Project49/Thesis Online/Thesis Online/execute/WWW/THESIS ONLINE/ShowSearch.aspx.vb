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

Partial Class ShowSearch
    Inherits System.Web.UI.Page

    Private Shared TextBooID(655350) As String
    Private Shared TextCountID(655350) As Integer

    Private Shared XmlBooID(655350), xmlThai(655350), xmleng(655350), xmlabstract(655350) As String
    Private Shared ShowText As String = ""
    Private Shared ShowCount As String = ""
    Private Shared Count As Integer = 0
    Private Shared rankbook As String = ""
    Private Shared countBook, countText As Integer
    Private Shared FileXml As String = ""
    Private Shared strS, selecttxt As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Page.IsPostBack <> True Then
            WordSearch.Text = Request.QueryString("TextSearch")
            SelectList.SelectedValue = Request.QueryString("List")

            Response.Clear()
            Clrscrweb()
        End If


    End Sub
    Protected Sub Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Search.Click
        Response.Clear()
        If WordSearch.Text <> "" Then
            strS = Trim(WordSearch.Text)
        Else
            WordSearch.Text = Trim(strS)
        End If
        Response.Redirect("ShowSearch.aspx?TextSearch=" + strS + "&List=" + Trim(SelectList.Text))
    End Sub
    Protected Sub WordSearch_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles WordSearch.TextChanged
        Response.Clear()
        If WordSearch.Text <> "" Then
            strS = Trim(WordSearch.Text)
        Else
            WordSearch.Text = Trim(strS)
        End If
        Response.Redirect("ShowSearch.aspx?TextSearch=" + strS + "&List=" + Trim(SelectList.Text))
    End Sub

    Protected Sub Clrscrweb()
        If WordSearch.Text <> "" Then
            ShowText = WordSearch.Text
            ShowText = ShowText.Replace("   ", " ")
            ShowText = ShowText.Replace("  ", " ")
            textWord.Text = ShowText

            For i As Integer = 0 To 655350
                TextBooID(i) = ""
                XmlBooID(i) = ""
                xmlThai(i) = ""
                xmleng(i) = ""
                xmlabstract(i) = ""
                TextCountID(i) = 0
                countBook = 0
                countText = 0
                count = 0
                rankbook = ""
                Number.Text = "0"
                countword.Text = "0"
            Next
            Cutword()
        Else
            textWord.Text = ""
            Number.Text = ""
            countword.Text = ""
            countBook = 0
            countText = 0
            count = 0
            rankbook = ""
            Number.Text = "0"
            countword.Text = "0"
            OpenXML(FileXml)
        End If
    End Sub

    Protected Sub Cutword()
        Dim TextSearch As String = ""
        TextSearch = WordSearch.Text
        TextSearch = TextSearch.Replace(" ", "+")
        Dim splitTextword() As String = Split(TextSearch, "+")
        Dim WSearch(splitTextword.Length) As String

        '---------------------  µ—¥§”∑’Ë´È”ÕÕ° -------------------------------
        Dim WLength As Integer = 0
        For c As Integer = 0 To splitTextword.Length - 1
            Dim cc As Boolean = False
            For i As Integer = 0 To splitTextword.Length - 1
                If WSearch(i) = splitTextword(c) Then
                    cc = True
                End If
            Next
            If cc = False Then
                WSearch(WLength) = splitTextword(c)
                WLength += 1
            End If

        Next

        '-------------------------------------------------------------------------

        For i As Integer = 0 To WSearch.Length - 1
            If WSearch(i) <> "" And WSearch(i) <> " " Then
                Select Case SelectList.Text
                    Case "Title"
                        ShowDataTitle(WSearch(i))
                    Case "Author"
                        ShowDataAuthor(WSearch(i))

                    Case "Subject"
                        ShowDataSubject(WSearch(i))

                    Case "Call Number"
                        ShowDataCallNumber(WSearch(i))

                    Case "ISBN/ISSN"
                        ShowDataISSN(WSearch(i))

                    Case "Year"
                        ShowDataYear(WSearch(i))

                    Case "Other"
                        ShowData(WSearch(i))

                End Select

            End If
        Next
        For c As Integer = 0 To countText
            If TextBooID(c) <> "" Then
                SelectDataBook(TextBooID(c))
            End If
        Next
        Newdataxml()
        OpenXML(FileXml)
    End Sub
    Protected Sub ShowDataTitle(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID,TITLE_THAI,TITLE_ENGLISH "
            sqlSavedata += " FROM  [DC_BOOK] "
            sqlSavedata += " WHERE (TITLE_THAI LIKE N'%" + TextSearch + "%')"
            sqlSavedata += "OR (TITLE_ENGLISH LIKE N'%" + TextSearch + "%')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            Dim str As String = ""
            If ds.Tables("data").Rows.Count <> 0 Then
                For i As Integer = 0 To ds.Tables("data").Rows.Count - 1
                    str += ds.Tables("data").Rows(i)(1).ToString()
                    str += ds.Tables("data").Rows(i)(2).ToString()
                    CountTextser(str, TextSearch, ds.Tables("data").Rows(i)(0).ToString())
                    str = ""
                Next
                ReplaceCountText(rankbook)
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try
    End Sub
    Protected Sub ShowDataAuthor(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID ,CREATOR_NAME,CREATOR_ENGLIST "
            sqlSavedata += " FROM [DC_CREATOR] "
            sqlSavedata += " WHERE (CREATOR_NAME LIKE N'%" + TextSearch + "%')"
            sqlSavedata += "OR (CREATOR_ENGLIST LIKE N'%" + TextSearch + "%')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            Dim str As String = ""
            Dim BookId As String = ""
            Dim Countid As Integer = 0
            If ds.Tables("data").Rows.Count <> 0 Then
                For i As Integer = 0 To ds.Tables("data").Rows.Count - 1
                    If BookId <> CStr(ds.Tables("data").Rows(i)(0)) Then
                        BookId = CStr(ds.Tables("data").Rows(i)(0))
                        Countid += 1
                    End If
                    str += CStr(ds.Tables("data").Rows(i)(1).ToString())
                    str += CStr(ds.Tables("data").Rows(i)(2).ToString())
                    CountTextser(str, TextSearch, BookId)
                    str = ""
                Next
                ReplaceCountText(rankbook)
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try
    End Sub
    Protected Sub ShowDataSubject(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID,SUBJECT "
            sqlSavedata += " FROM [DC_BOOK] "
            sqlSavedata += " WHERE (SUBJECT LIKE N'%" + TextSearch + "%')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            Dim str As String = ""
            If ds.Tables("data").Rows.Count <> 0 Then
                For i As Integer = 0 To ds.Tables("data").Rows.Count - 1
                    str += CStr(ds.Tables("data").Rows(i)(1).ToString())
                    CountTextser(str, TextSearch, ds.Tables("data").Rows(i)(0).ToString())
                    str = ""
                Next
                ReplaceCountText(rankbook)
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try
    End Sub
    Protected Sub ShowDataCallNumber(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID ,CALL_NUMBER "
            sqlSavedata += " FROM [DC_BOOK] "
            sqlSavedata += " WHERE (CALL_NUMBER LIKE N'%" + TextSearch + "%')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            Dim str As String = ""
            If ds.Tables("data").Rows.Count <> 0 Then
                For i As Integer = 0 To ds.Tables("data").Rows.Count - 1

                    str += CStr(ds.Tables("data").Rows(i)(1).ToString())
                    CountTextser(str, TextSearch, ds.Tables("data").Rows(i)(0).ToString())
                    str = ""
                Next
                ReplaceCountText(rankbook)
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try
    End Sub
    Protected Sub ShowDataISSN(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID  ,INEDTIFIER_ISSN "
            sqlSavedata += " FROM [DC_BOOK] "
            sqlSavedata += " WHERE (INEDTIFIER_ISSN LIKE N'%" + TextSearch + "%')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            Dim str As String = ""
            If ds.Tables("data").Rows.Count <> 0 Then
                For i As Integer = 0 To ds.Tables("data").Rows.Count - 1

                    str += CStr(ds.Tables("data").Rows(i)(1).ToString())
                    CountTextser(str, TextSearch, ds.Tables("data").Rows(i)(0).ToString())
                    str = ""
                Next
                ReplaceCountText(rankbook)
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try
    End Sub
    Protected Sub ShowDataYear(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID ,YEAYCREATED_THAI,YEAYCREATED_ENGLISH "
            sqlSavedata += "FROM [DC_BOOK]"
            sqlSavedata += "WHERE (YEAYCREATED_THAI LIKE N'%" + TextSearch + "%') "
            sqlSavedata += "OR (YEAYCREATED_ENGLISH LIKE N'%" + TextSearch + "%')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            Dim str As String = ""
            If ds.Tables("data").Rows.Count <> 0 Then
                For i As Integer = 0 To ds.Tables("data").Rows.Count - 1
                    str += CStr(ds.Tables("data").Rows(i)(1).ToString())
                    str += CStr(ds.Tables("data").Rows(i)(2).ToString())
                    CountTextser(str, TextSearch, ds.Tables("data").Rows(i)(0).ToString())
                    str = ""
                Next
                ReplaceCountText(rankbook)

            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try
    End Sub
    Protected Sub ShowData(ByVal TextSearch As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT [BOOKCOUNT]"
            sqlSavedata += "FROM [DC_KEYWORD]"
            sqlSavedata += "WHERE (TEXTKEYWORD = N'" + TextSearch + "')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DESCIPTION")
            If ds.Tables("DESCIPTION").Rows.Count <> 0 Then
                ReplaceCountText(CStr(ds.Tables("DESCIPTION").Rows(0)(0).ToString()))
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " :  ShowData </p>")
        End Try

    End Sub
    Protected Sub CountTextser(ByVal textword As String, ByVal TextSearch As String, ByVal BookID As String)
        Dim countindex As Integer = 0
        textword = textword.Replace(TextSearch, "|" + TextSearch + "|")
        Dim splitCountTextId() As String = Split(textword, "|")
        countindex = 0
        For i As Integer = 0 To splitCountTextId.Length - 1
            If splitCountTextId(i) = TextSearch Then
                countindex += 1
            End If
        Next
        rankbook += BookID + "_[" + countindex.ToString + "]_"

    End Sub
    Protected Sub ReplaceCountText(ByVal CountTextId As String)
        Try
            If countBook > 0 Then
                countBook = (countBook - 1)
            End If
            CountTextId = CountTextId.Replace("_", "|")
            CountTextId = CountTextId.Replace("[", "|")
            CountTextId = CountTextId.Replace("]", "|")
            CountTextId = CountTextId.Replace("||", "|")
            Dim splitCountTextId() As String = Split(CountTextId, "|")
            Dim TempCount(655350) As Integer
            Dim TempID(655350) As String
            For i As Integer = 0 To splitCountTextId.Length - 1
                If i Mod 2 = 0 Then
                    TextBooID(countBook) = splitCountTextId(i)
                    countBook += 1
                Else
                    TextCountID(countText) = CInt(splitCountTextId(i))
                    countText += 1
                End If
            Next
            Dim TLength As Integer
            For c As Integer = 0 To countBook
                Dim cc As Boolean = False
                For i As Integer = 0 To countBook
                    If TempID(i) = TextBooID(c) Then
                        cc = True
                        TempCount(i) += TextCountID(c)
                    End If
                Next
                If cc = False Then
                    TempID(TLength) = TextBooID(c)
                    TempCount(TLength) = TextCountID(c)
                    TLength += 1
                End If

            Next
            TLength = 0
            For i As Integer = 0 To 655350
                TextBooID(i) = ""
                TextCountID(i) = 0
            Next
            For c As Integer = 0 To splitCountTextId.Length - 1
                Dim cc As Boolean = False
                Dim Tempint As Integer = TextCountID(c)
                Dim Point As Integer = 0
                Dim intNew As Integer = 0
                If c > 0 Then
                    intNew = (c - 1)
                End If
                For i As Integer = 0 To splitCountTextId.Length - 1
                    If Tempint <= TempCount(i) Then
                        Tempint = TempCount(i)
                        Point = i
                        cc = True
                    End If
                Next
                If cc = True Then
                    TextBooID(TLength) = TempID(Point)
                    TempCount(Point) = 0
                    TextCountID(TLength) = Tempint
                    TLength += 1
                End If

            Next
            Dim NumT, NewsBook As Integer
            For i As Integer = 0 To TLength
                If TextCountID(i) <> 0 Then
                    NumT += TextCountID(i)
                    NewsBook += 1
                End If

            Next

            Number.Text = CStr(NewsBook)
            countword.Text = NumT.ToString

        Catch ex As Exception
            Response.Write("Message = " & ex.Message & ":  ReplaceCountText </p>")
        End Try
    End Sub

    Protected Sub SelectDataBook(ByVal BookId As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "SELECT BOOK_ID, TITLE_THAI, TITLE_ENGLISH, ABSTRACT_THAI FROM DC_BOOK "
            sqlSavedata += "WHERE  (BOOK_ID = N'" + BookId + "')"
            Dim da As New SqlDataAdapter(sqlSavedata, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "data")
            If ds.Tables("data").Rows.Count <> 0 Then
                XmlBooID(count) = ds.Tables("data").Rows(0)(0).ToString
                xmlThai(count) = ds.Tables("data").Rows(0)(1).ToString
                xmleng(count) = ds.Tables("data").Rows(0)(2).ToString
                xmlabstract(count) = Mid(ds.Tables("data").Rows(0)(3).ToString, 1, 302) + "..."
                count += 1
            End If
            SqlConnection.ClearAllPools()
            Conn.Close()
        Catch ex As Exception
            Response.Write("Message = " & ex.Message & " SelectDataBook </p>")
        End Try

    End Sub
    Protected Sub OpenXML(ByVal XmlFile As String)
        If WordSearch.Text = "" Then
            Dim Objfile As New FileInfo(FileXml)
            If Objfile.Exists = False Then
                XmlFile = Server.MapPath("~/Xml_Files/NoFile.xml")
            End If

        End If
        Dim Ds As New DataSet
        Dim fs As FileStream
        Dim rs As StreamReader
        Try
            fs = New FileStream(XmlFile, FileMode.Open, FileAccess.Read)
            rs = New StreamReader(fs)
            Ds.ReadXml(rs)
            GridSearch.DataSource = Ds.Tables(0)
            GridSearch.DataBind()
            fs.Close()
            rs.Close()
            If FileXml <> "" Then
                Dim Objfile As New FileInfo(FileXml)
                If Objfile.Exists = True Then
                    'Objfile.Delete()
                End If
            End If
        Catch ex As Exception
            ' Response.Write("Message = " & ex.Message & " OpenXML </p>")
        End Try

    End Sub


    '-----------------------------  ADD XML  -----------------------------------

    Protected Sub Newdataxml()
        ' create StringBuilders to hold the results
        Try
            Dim messages As New StringBuilder()
            If FileXml <> "" Then
                Dim Objfile As New FileInfo(FileXml)
                If Objfile.Exists = True Then
                    Objfile.Delete()
                End If
            End If


            FileXml = Server.MapPath("~/Xml_Files/" + WordSearch.Text + ".xml")

            Dim ws As New XmlWriterSettings()
            ws.Indent = True
            ws.CheckCharacters = True
            ws.CloseOutput = True
            Using xw As XmlWriter = XmlWriter.Create(FileXml)
                If ws.ConformanceLevel <> ConformanceLevel.Fragment Then
                    xw.WriteStartDocument(True)
                End If
                xw.WriteStartElement("Book")
                If count <> 0 Then
                    For i As Integer = 0 To count - 1
                        If XmlBooID(i) <> "" Then
                            xw.WriteStartElement("Row")
                            xw.WriteElementString("BookId", XmlBooID(i))
                            xw.WriteElementString("TitleThai", xmlThai(i))
                            xw.WriteElementString("TitleEng", xmleng(i))
                            xw.WriteElementString("abstract", xmlabstract(i))
                            xw.WriteEndElement()
                        End If
                    Next
                Else
                    xw.WriteStartElement("Row")
                    xw.WriteElementString("BookId", " ")
                    xw.WriteElementString("TitleThai", " ")
                    xw.WriteElementString("TitleEng", " ")
                    xw.WriteElementString("abstract", " ")
                    xw.WriteEndElement()
                End If

                xw.WriteEndElement()
                xw.WriteEndDocument()
                xw.Close()
            End Using
        Catch ex As Exception
            ' an exception will be raised here for any errors
            Response.Write("<p><b>ERROR creating XmlReader:</b><br />")
            Response.Write("Message = " & ex.Message & "</p>")
            Response.Write("ERROR Newdataxml")
        End Try

    End Sub

    Protected Sub GridSearch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridSearch.SelectedIndexChanged

    End Sub
    Protected Sub PageIndxchanged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)
        GridSearch.CurrentPageIndex = e.NewPageIndex
        OpenXML(FileXml)

    End Sub
End Class
