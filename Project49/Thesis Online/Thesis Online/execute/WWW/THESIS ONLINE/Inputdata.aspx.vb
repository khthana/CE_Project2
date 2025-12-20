Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data.OleDb
Imports System.Xml
Imports System.IO
Imports System.IO.Directory
Imports System.Web.UI.HtmlControls

Partial Class Inputdata
    Inherits System.Web.UI.Page
    Private Shared CountCreator As Integer = 1
    Private Shared CountName, CBack, CNumName As Integer
    Private Shared NameCreator(6), EnglishCreator(6), OrgCreator(6), EMailCreator(6) As String

    Private Shared CountAdviser As Integer = 1
    Private Shared CountNameA, ABack, ANumName As Integer
    Private Shared AdviserID As String
    Private Shared NameAdviser(6), EnglishAdviser(6), RolesAdviser(6), EMailAdviser(6), NumAdviserID(6) As String

    Private Shared Countsub As Integer = 1
    Private Shared CountNames, sBack, sNumName As Integer
    Private Shared Subtext As String = ""
    Private Shared NameSub(6) As String

    Private Shared CountChapter As Integer = 1
    Private Shared CountNameChap, ChapterBack, ChapterNumName As Integer
    Private Shared NumChapter(16) As String

    Private Shared ShBookId, DESCIPTION_ID, LANGUAGE, Format As String
    Private Shared RELATION, COVERAGE, FILE_XML As String
    Private Shared FileUpload(17), Directory As String
    Private Shared Sessionid As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Date_Issued.Text = Today.Day.ToString + "/" + Today.Month.ToString + "/" + Today.Year.ToString
        Date_Modified.Text = Today.Day.ToString + "/" + Today.Month.ToString + "/" + Today.Year.ToString
        If Page.IsPostBack <> True Then
            ClearNewSub()
            ClearNewCreator()
            ClearNewAdviser()
            ClearNewChapter()
            AdviserList()
            SearchA()

            OrgName.Text = "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"
        End If

        Savea.Attributes.Add("OnClick", "javascript:if(confirm('คุณต้องการบันทึกข้อมูลหรือไม่ ?')== false) return false;")
    End Sub


    Protected Sub AddCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddCreator.Click
        If Thai_Creator.Text = "" And English_Creator.Text = "" And OrgName.Text = "" And MailCreator.Text = "" Then
            Exit Sub
        End If
        If CountCreator >= 6 Then
            NName.Text = "5"
        End If
        If NName.Text = "1" Or NName.Text = Str(CountCreator) Then
            Creator_Click()
        Else
            NName.Text = Str(CountCreator)
            ClearTextBoxCreator()
        End If
        OrgName.Text = "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"
        AddCreator.Focus()
    End Sub

    Protected Sub Creator_Click()
        If CountCreator < 6 Then
            NameCreator(CountCreator) = Thai_Creator.Text       'Add NameCreator Thai
            EnglishCreator(CountCreator) = English_Creator.Text 'Add NameCreator English
            OrgCreator(CountCreator) = OrgName.Text             'Add OrgNameCreator
            EMailCreator(CountCreator) = MailCreator.Text       'Add E-MailCreator
            ClearTextBoxCreator()
            If CountName < 6 Then
                CountCreator += 1
                If CountCreator < 6 Then
                    CountName = CountCreator
                    CBack = CountCreator
                    NName.Text = Str(CountName)
                End If
            End If
        End If
    End Sub

    Protected Sub CreatorEdit()

        NameCreator(CBack) = Thai_Creator.Text       'Edit NameCreator Thai
        EnglishCreator(CBack) = English_Creator.Text 'Edit NameCreator English
        OrgCreator(CBack) = OrgName.Text             'Edit OrgNameCreator
        EMailCreator(CBack) = MailCreator.Text       'Edit E-MailCreator

    End Sub

    Protected Sub ClearCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearCreator.Click
        ClearNewCreator()
        ClearCreator.Focus()
    End Sub
    Protected Sub ClearNewCreator()
        Dim CNum As Integer
        CountCreator = 1
        CountName = 1
        NName.Text = "1"
        OrgName.Text = "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"
        ClearTextBoxCreator()
        For CNum = 0 To 6
            NameCreator(CountCreator) = ""       'Clear  NameCreator Thai
            EnglishCreator(CountCreator) = ""    'Clear  NameCreator English
            OrgCreator(CountCreator) = ""        'Clear  OrgNameCreator
            EMailCreator(CountCreator) = ""      'Clear  E-MailCreator
        Next
    End Sub

    Protected Sub ClearTextBoxCreator()
        Thai_Creator.Text = ""
        English_Creator.Text = ""
        OrgName.Text = ""
        MailCreator.Text = ""
    End Sub

    Protected Sub EditCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditCreator.Click
        CreatorEdit()
        EditCreator.Focus()
    End Sub

    Protected Sub BackCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackCreator.Click

        If CBack >= 1 Then
            If CountName > 1 Then
                CBack -= 1
                CountName -= 1
                NName.Text = Str(CountName)
                Thai_Creator.Text = NameCreator(CBack)         'Back  NameCreator Thai
                English_Creator.Text = EnglishCreator(CBack)   'Back  NameCreator English
                OrgName.Text = OrgCreator(CBack)               'Back  OrgNameCreator
                MailCreator.Text = EMailCreator(CBack)         'Back  E-MailCreator
            Else
                CBack = 1
                CountName = 1
                NName.Text = Str(CountName)
            End If
        End If
        BackCreator.Focus()
    End Sub

    Protected Sub NextCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextCreator.Click

        If CBack <= CountCreator Then
            If CountName < (CountCreator - 1) Then
                CBack += 1
                CountName += 1
                NName.Text = Str(CountName)
                Thai_Creator.Text = NameCreator(CBack)         'Next  NameCreator Thai
                English_Creator.Text = EnglishCreator(CBack)   'Next  NameCreator English
                OrgName.Text = OrgCreator(CBack)               'Next  OrgNameCreator
                MailCreator.Text = EMailCreator(CBack)         'Next  E-MailCreator
            End If
        End If
        NextCreator.Focus()
    End Sub

    '############################  Advise  #############################

    Protected Sub AddAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddAdviser.Click
        If Thai_AdviserList.Text = "<<อาจารย์ที่ปรึกษา>>" Then
            Exit Sub
        End If
        If CountAdviser >= 6 Then
            AName.Text = "5"
        End If
        If AName.Text = "1" Or AName.Text = Str(CountAdviser) Then
            Adviser_Click()
        Else
            AName.Text = Str(CountAdviser)
            ClearTextBoxAdviser()
        End If
        Publisher_Name.Focus()
    End Sub
    Protected Sub ClearNewAdviser()
        Dim ANum As Integer
        CountAdviser = 1
        CountNameA = 1
        AName.Text = "1"
        ClearTextBoxAdviser()
        For ANum = 0 To 6
            NumAdviserID(CountAdviser) = ""
            NameAdviser(CountAdviser) = ""              'Clear NameAdviser Thai
            EnglishAdviser(CountAdviser) = ""           'Clear NameAdviser English
            RolesAdviser(CountAdviser) = ""             'Clear Roles Adviser
            EMailAdviser(CountAdviser) = ""             'Clear E-MailAdviser
        Next
    End Sub
    Protected Sub ClearTextBoxAdviser()
        Thai_AdviserList.ClearSelection()            'Clear NameAdviser Thai
        English_Adviser.Text = ""           'Clear NameAdviser English
        Roles_Adviser.Text = ""             'Clear Roles Adviser
        Email_Adviser.Text = ""             'Clear E-MailAdviser
    End Sub
    Protected Sub Adviser_Click()
        If CountAdviser < 6 Then
            NumAdviserID(CountAdviser) = AdviserID
            NameAdviser(CountAdviser) = Thai_AdviserList.Text               'Add NameAdviser Thai
            EnglishAdviser(CountAdviser) = English_Adviser.Text         'Add NameAdviser English
            RolesAdviser(CountAdviser) = Roles_Adviser.Text             'Add Roles Adviser
            EMailAdviser(CountAdviser) = Email_Adviser.Text            'Add E-MailAdviser
            ClearTextBoxAdviser()
            If CountNameA < 6 Then
                CountAdviser += 1
                If CountAdviser < 6 Then
                    CountNameA = CountAdviser
                    ABack = CountAdviser
                    AName.Text = Str(CountNameA)
                End If
            End If
        End If

    End Sub

    Protected Sub NextAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextAdviser.Click
        If ABack <= CountAdviser Then
            If CountNameA < (CountAdviser - 1) Then
                ABack += 1
                CountNameA += 1
                AName.Text = Str(CountNameA)
                Thai_AdviserList.Text = NameAdviser(ABack)               'Next NameAdviser Thai
                English_Adviser.Text = EnglishAdviser(ABack)         'Next NameAdviser English
                Roles_Adviser.Text = RolesAdviser(ABack)             'Next Roles Adviser
                Email_Adviser.Text = EMailAdviser(ABack)            'Next E-MailAdviser
            End If
        End If
        Publisher_Name.Focus()
    End Sub

    Protected Sub BackAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackAdviser.Click

        If ABack >= 1 Then
            If CountNameA > 1 Then
                ABack -= 1
                CountNameA -= 1
                AName.Text = Str(CountNameA)
                Thai_AdviserList.Text = NameAdviser(ABack)               'Back NameAdviser Thai
                English_Adviser.Text = EnglishAdviser(ABack)         'Back NameAdviser English
                Roles_Adviser.Text = RolesAdviser(ABack)             'Back Roles Adviser
                Email_Adviser.Text = EMailAdviser(ABack)            'Back E-MailAdviser
            Else
                ABack = 1
                CountNameA = 1
                AName.Text = Str(CountNameA)
            End If
        End If
        Publisher_Name.Focus()
    End Sub
    Protected Sub AdviserEdit()

        NameAdviser(ABack) = Thai_AdviserList.Text               'Add NameAdviser Thai
        EnglishAdviser(ABack) = English_Adviser.Text         'Add NameAdviser English
        RolesAdviser(ABack) = Roles_Adviser.Text             'Add Roles Adviser
        EMailAdviser(ABack) = Email_Adviser.Text            'Add E-MailAdviser

    End Sub

    Protected Sub EditAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditAdviser.Click
        AdviserEdit()
        Publisher_Name.Focus()
    End Sub

    Protected Sub ClearAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearAdviser.Click
        ClearNewAdviser()
        Publisher_Name.Focus()
    End Sub

    '#######################   Chapter   ##########################

    Protected Sub AddChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddChapter.Click
        If Chapter.Text = "" Then
            Exit Sub
        End If
        If CountChapter >= 16 Then
            CName.Text = "15"
        End If
        If CName.Text = "1" Or CName.Text = Str(CountChapter) Then
            Chapter_Click()
        Else
            CName.Text = Str(CountChapter)
            ClearTextBoxChapter()
        End If
        AddChapter.Focus()
    End Sub

    Protected Sub ClearChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearChapter.Click

        ClearNewChapter()
        AddChapter.Focus()
        ClearChapter.Focus()
    End Sub

    Protected Sub EditChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditChapter.Click

        NumChapter(ChapterBack) = Chapter.Text               'Add NameAdviser Thai
        EditChapter.Focus()
    End Sub

    Protected Sub BackChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackChapter.Click
        If ChapterBack >= 1 Then
            If CountNameChap > 1 Then
                ChapterBack -= 1
                CountNameChap -= 1
                CName.Text = Str(CountNameChap)
                Chapter.Text = NumChapter(ChapterBack)         'Back NameAdviser Thai
                AddChapter.Focus()
            Else
                ChapterBack = 1
                CountNameChap = 1
                CName.Text = Str(CountNameChap)
                AddChapter.Focus()
            End If
        End If
        BackChapter.Focus()
    End Sub

    Protected Sub NextChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextChapter.Click
        If ChapterBack <= CountChapter Then
            If CountNameChap < (CountChapter - 1) Then
                ChapterBack += 1
                CountNameChap += 1
                CName.Text = Str(CountNameChap)
                Chapter.Text = NumChapter(ChapterBack)              'NextChapter
            End If
        End If
        NextChapter.Focus()
    End Sub
    Protected Sub ClearNewChapter()
        Dim ChapterNum As Integer
        CountChapter = 1
        CountNameChap = 1
        CName.Text = "1"
        ClearTextBoxChapter()
        For ChapterNum = 0 To 16
            NumChapter(ChapterNum) = ""              'Clear NameAdviser Thai
        Next

    End Sub
    Protected Sub ClearTextBoxChapter()
        Chapter.Text = ""                               'Add NameAdviser Thai
    End Sub
    Protected Sub Chapter_Click()
        If CountChapter < 16 Then
            NumChapter(CountChapter) = Chapter.Text               'Add NameAdviser Thai
            ClearTextBoxChapter()
            If CountNameChap < 16 Then
                CountChapter += 1
                If CountChapter < 16 Then
                    CountNameChap = CountChapter
                    ChapterBack = CountChapter
                    CName.Text = Str(CountNameChap)
                End If
            End If
        End If
        AddChapter.Focus()
    End Sub

    Protected Sub Savea_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Savea.Click
        mycookies_Click()
        Newdataxml()
        AutoIDBook()
        AutoIDFile()
        responsepage()
    End Sub
    Protected Sub responsepage()
        Application("BookId") = ShBookId
        Dim url As String = "ShowSave.aspx?Bookid=" + ShBookId
        Response.Redirect(url)
    End Sub
    '-----------------------------   ADD THESIS  -----------------------------------

    Protected Sub AutoIDBook()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT BOOK_ID FROM DC_BOOK"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DESCIPTION")
            If ds.Tables("DESCIPTION").Rows.Count = 0 Then
                idcontributor = "B000000001"
                SavedatatoSql(idcontributor)
            Else
                CountId = ds.Tables("DESCIPTION").Rows.Count
                idcontributor = CStr(ds.Tables("DESCIPTION").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "B" + CountidNew.ToString("000000000")
                Loop
                SavedatatoSql(NewID)
            End If
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Function ReStr(ByVal str As String) As String
        Dim TestString As String = str
        TestString = Replace(TestString, Chr(39), "")
        str = Replace(TestString, Chr(34), "")
        Return str
    End Function

    Protected Sub SavedatatoSql(ByVal BookId As String)
        Try
            For i As Integer = 0 To NameSub.Length - 1
                Subtext += NameSub(i) + "|"
            Next



            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "INSERT INTO DC_BOOK ([BOOK_ID],[DESCIPTION_ID],[TITLE_THAI],[TITLE_ENGLISH]"
            sqlSavedata += ",[SUBJECT],[ABSTRACT_THAI],[ABSTRACT_ENGLISH],[YEAYCREATED_THAI]"
            sqlSavedata += ",[YEAYCREATED_ENGLISH],[DATE_ISSUED],[DATE_MODIFIED],[FOMAT]"
            sqlSavedata += ",[LANGUAGE],[INEDTIFIER_ISSN],[INEDTIFIER_ISBN],[CALL_NUMBER]"
            sqlSavedata += ",[RELATION],[COVERAGE],[DEGREEGRANTOR],[KEYWORD],[FILEXML],[POSITION],[POSITIONFILE])"
            sqlSavedata += " VALUES ('" + BookId + "','" + DESCIPTION_ID + "','" + ReStr(Thai_Title.Text) + "','"
            sqlSavedata += ReStr(English_Title.Text) + "','" + ReStr(Subtext) + "','" + ReStr(Abstract_Thai.Text) + "','"
            sqlSavedata += ReStr(Abstract_English.Text) + "','" + Created.Text + "','" + CreatedYEnglish.Text + "','"
            sqlSavedata += Date_Issued.Text + "','" + Date_Modified.Text + "','" + Format + "','"
            sqlSavedata += LANGUAGE + "','" + ISSN.Text + "','" + ISBN.Text + "','"
            sqlSavedata += ReStr(CallNumber.Text) + "','" + RELATION + "','" + COVERAGE + "','" + ReStr(DegreeGrantor.Text) + "','"
            sqlSavedata += ReStr(Keyword.Text) + "','" + ReStr(FILE_XML) + "','0','0')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            ShBookId = BookId
            AdddataAdviser(BookId)                  'ADD Adviser
            AdddataCREATOR(BookId)                  'ADD CREATOR
            AutoIDPUBLISHER(BookId)                 'ADD PUBLISHER
            AutoIDCHAPTER(BookId)                   'ADD CHAPTER
            Conn.Close()
            ClearNewCreator()
            ClearNewAdviser()
            ClearNewChapter()
            ClearData()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Private Sub DisplaySqlErrors(ByVal exception As SqlException)
        Dim i As Integer

        For i = 0 To exception.Errors.Count - 1
            Console.WriteLine("Index #" & i & ControlChars.NewLine & _
                "Error: " & exception.Errors(i).ToString() & ControlChars.NewLine)
        Next i
        Console.ReadLine()
    End Sub

    Protected Sub ChackFormatFile()
        If RadioPDF.Checked = True Then
            Format = RadioPDF.Text
        ElseIf RadioDOC.Checked Then
            Format = RadioDOC.Text
        End If
    End Sub
    Protected Sub ChackLANGUAGEFile()

        If LanguageThai.Checked = True Then
            LANGUAGE = LanguageThai.Text
        ElseIf LanguageEnglish.Checked Then
            LANGUAGE = LanguageEnglish.Text
        End If

    End Sub

    '----------------------------- ADD  ADVISER  -----------------------------------

    Protected Sub AdddataAdviser(ByVal BookId As String)
        Dim i As Integer
        For i = 0 To 6
            If NumAdviserID(i) <> "" Then
                SavedatatoAdviser(BookId, NumAdviserID(i))
            End If
        Next
    End Sub
    Protected Sub SavedatatoAdviser(ByVal BookIds As String, ByVal CONTRIBUTORIDs As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "INSERT INTO SUB_BOOK (CONTRIBUTOR_ID,BOOK_ID)"
            sqlSavedata += " VALUES ('" + CONTRIBUTORIDs + "','" + BookIds + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub

    '----------------------------- ADD  CREATOR  -----------------------------------

    Protected Sub AutoIDCREATOR(ByVal BookId As String, ByVal NameCreator As String, ByVal EnglishCreator As String, ByVal OrgCreator As String, ByVal EMailCreator As String)
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT CREATOR_ID FROM DC_CREATOR"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "CREATOR")
            If ds.Tables("CREATOR").Rows.Count = 0 Then
                idcontributor = "C00001"
                SavedatatoCREATOR(BookId, idcontributor, NameCreator, EnglishCreator, OrgCreator, EMailCreator)
            Else
                CountId = ds.Tables("CREATOR").Rows.Count
                idcontributor = CStr(ds.Tables("CREATOR").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "C" + CountidNew.ToString("00000")

                Loop
                SavedatatoCREATOR(BookId, NewID, NameCreator, EnglishCreator, OrgCreator, EMailCreator)
            End If
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub AdddataCREATOR(ByVal BookId As String)
        Dim i As Integer
        For i = 0 To 6
            If NameCreator(i) <> "" Then
                AutoIDCREATOR(BookId, NameCreator(i), EnglishCreator(i), OrgCreator(i), EMailCreator(i))
            End If
        Next
    End Sub
    Protected Sub SavedatatoCREATOR(ByVal BookIds As String, ByVal CREATORIDs As String, ByVal NameCreators As String, ByVal EnglishCreators As String, ByVal OrgCreators As String, ByVal EMailCreators As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "INSERT INTO DC_CREATOR ([CREATOR_ID],[BOOK_ID],[CREATOR_NAME]"
            sqlSavedata += ",[CREATOR_ENGLIST],[CREATOR_E_MAIL],[CREATOR_ORG_NAME]) "
            sqlSavedata += " VALUES ('" + CREATORIDs + "','" + BookIds + "','" + NameCreators + "','"
            sqlSavedata += EnglishCreators + "','" + EMailCreators + "','" + OrgCreators + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()

        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub

    '-----------------------------  ADD PUBLISHER -----------------------------------

    Protected Sub AutoIDPUBLISHER(ByVal BookId As String)
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT PUBLISHER_ID FROM DC_PUBLISHER"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "PUBLISHER")
            If ds.Tables("PUBLISHER").Rows.Count = 0 Then
                idcontributor = "S00001"
                SavedatatoPUBLISHER(BookId, idcontributor)
            Else
                CountId = ds.Tables("PUBLISHER").Rows.Count
                idcontributor = CStr(ds.Tables("PUBLISHER").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "S" + CountidNew.ToString("00000")

                Loop
                SavedatatoPUBLISHER(BookId, NewID)
            End If
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub

    Protected Sub SavedatatoPUBLISHER(ByVal BookId As String, ByVal PUBLISHERID As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "INSERT INTO  DC_PUBLISHER ([PUBLISHER_ID],[BOOK_ID],[PUBLISHER_NAME]"
            sqlSavedata += ",[PUBLISHER_PLACE],[PUBLISHER_E_MAIL],[IDENTIFIER_URL]"
            sqlSavedata += ",[RIGHTS_RIGHTS],[RIGHTS_ACCRESS])"
            sqlSavedata += " VALUES ('" + PUBLISHERID + "','" + BookId + "','" + Publisher_Name.Text + "','"
            sqlSavedata += Place.Text + "','" + E_mail_Publisher.Text + "','"
            sqlSavedata += URL.Text + "','" + Rights.Text + "','" + Access.Text + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub

    '-----------------------------  ADD CHAPTER -----------------------------------

    Protected Sub AutoIDCHAPTER(ByVal BookId As String)
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT CHAPTER_ID FROM DC_CHAPTER"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "CHAPTER")
            If ds.Tables("CHAPTER").Rows.Count = 0 Then
                idcontributor = "T00001"
                SavedatatoCHAPTER(BookId, idcontributor)
            Else
                CountId = ds.Tables("CHAPTER").Rows.Count
                idcontributor = CStr(ds.Tables("CHAPTER").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "T" + CountidNew.ToString("00000")

                Loop
                SavedatatoCHAPTER(BookId, NewID)
            End If
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub

    Protected Sub SavedatatoCHAPTER(ByVal BookId As String, ByVal CHAPTERID As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "INSERT INTO  DC_CHAPTER([CHAPTER_ID],[BOOK_ID],CONTENTS,ILLUSTRATIVE,[CHAPTER1]"
            sqlSavedata += ",[CHAPTER2],[CHAPTER3],[CHAPTER4],[CHAPTER5]"
            sqlSavedata += ",[CHAPTER6],[CHAPTER7],[CHAPTER8],[CHAPTER9]"
            sqlSavedata += ",[CHAPTER10],[CHAPTER11],[CHAPTER12],[CHAPTER13]"
            sqlSavedata += ",[CHAPTER14],[CHAPTER15],[APPENDIX],[BIBLIOGRAPHY])"
            sqlSavedata += " VALUES ('" + CHAPTERID + "','" + BookId + "','" + ReStr(Contents.Text) + "','" + ReStr(Illustrative.Text) + "','" + ReStr(NumChapter(1)) + "','"
            sqlSavedata += ReStr(NumChapter(2)) + "','" + ReStr(NumChapter(3)) + "','" + ReStr(NumChapter(4)) + "','" + ReStr(NumChapter(5)) + "','"
            sqlSavedata += ReStr(NumChapter(6)) + "','" + ReStr(NumChapter(7)) + "','" + ReStr(NumChapter(8)) + "','" + ReStr(NumChapter(9)) + "','"
            sqlSavedata += ReStr(NumChapter(10)) + "','" + ReStr(NumChapter(11)) + "','" + ReStr(NumChapter(12)) + "','" + ReStr(NumChapter(13)) + "','"
            sqlSavedata += ReStr(NumChapter(14)) + "','" + ReStr(NumChapter(15)) + "','" + ReStr(Appendix.Text) + "','" + ReStr(Bibliography.Text) + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub

    '-----------------------------  ADD XML  -----------------------------------

    Protected Sub Newdataxml()
        ' create StringBuilders to hold the results
        Dim messages As New StringBuilder()
        Dim sFilePath As String = Server.MapPath(Directory + CallNumber.Text + ".xml")
        Dim ws As New XmlWriterSettings()

        ws.Indent = True
        ws.CheckCharacters = True
        ws.CloseOutput = True
        Using xw As XmlWriter = XmlWriter.Create(sFilePath)
            Try
                'create the XML document
                If ws.ConformanceLevel <> ConformanceLevel.Fragment Then

                    xw.WriteStartDocument(True)
                End If
                xw.WriteStartElement("Book")
                xw.WriteStartElement("DC")

                xw.WriteStartElement("DC_Title")
                xw.WriteElementString("Title_Title", Thai_Title.Text)
                xw.WriteElementString("Title_Alternative", English_Title.Text)
                xw.WriteEndElement()

                xw.WriteStartElement("DC_Creator")
                Dim c As Integer
                For c = 0 To 6
                    If NameCreator(c) <> "" Then
                        xw.WriteElementString("Creator_Name", NameCreator(c))
                        xw.WriteElementString("Creator_Org_Name", OrgCreator(c))
                        xw.WriteElementString("Creator_E-Mail", EMailCreator(c))
                    End If
                Next
                xw.WriteEndElement()

                xw.WriteStartElement("DC_Subject")
                For SubCount As Integer = 0 To NameSub.Length - 1
                    xw.WriteElementString("Subject_ThaSH", NameSub(SubCount))
                Next

                xw.WriteEndElement()

                xw.WriteStartElement("DC_Desscription")
                xw.WriteElementString("Desscription_Abstract", Abstract_Thai.Text)
                xw.WriteEndElement()

                xw.WriteStartElement("DC_Contributor")
                For A As Integer = 0 To 6
                    If NameAdviser(A) <> "" Then
                        xw.WriteElementString("Contributor_Name", NameAdviser(A))
                        xw.WriteElementString("Contributor_Roles", RolesAdviser(A))
                        xw.WriteElementString("Contributor_E-mail", EMailAdviser(A))
                    End If
                Next

                xw.WriteEndElement()

                xw.WriteStartElement("DC_Publisher")

                xw.WriteElementString("Publisher_Name", Publisher_Name.Text)
                xw.WriteElementString("Publisher_Place", Place.Text)
                xw.WriteElementString("Publisher_E-mail", E_mail_Publisher.Text)
                xw.WriteEndElement()

                xw.WriteStartElement("DC_Date")
                xw.WriteElementString("Date_Created", Created.Text)
                xw.WriteElementString("Date_Issued", Date_Issued.Text)
                xw.WriteElementString("Date_Modified", Date_Modified.Text)
                xw.WriteEndElement()
                If RadioDOC.Checked = True Then
                    xw.WriteElementString("DC_Format", RadioDOC.Text)
                Else
                    xw.WriteElementString("DC_Format", RadioPDF.Text)
                End If

                xw.WriteStartElement("DC_Identifier")
                xw.WriteElementString("Identifier_Url", URL.Text)
                xw.WriteElementString("Identifier_Isbn", ISBN.Text)
                xw.WriteElementString("Identifier_Issn", ISSN.Text)
                xw.WriteElementString("Identifier_BibliographyCitation", "")
                xw.WriteEndElement()

                xw.WriteStartElement("DC_Source")
                xw.WriteElementString("Source_Call_Number", CallNumber.Text)
                xw.WriteEndElement()
                If LanguageThai.Checked = True Then
                    xw.WriteElementString("DC_Language", LanguageThai.Text)
                Else
                    xw.WriteElementString("DC_Language", LanguageEnglish.Text)
                End If

                xw.WriteElementString("DC_Relation", "")
                xw.WriteElementString("DC_Coverage", "")

                xw.WriteStartElement("DC_Rights")
                xw.WriteElementString("Rights_Rights", Rights.Text)
                xw.WriteElementString("Rights_Rights_Accress", Access.Text)
                xw.WriteEndElement()

                xw.WriteStartElement("DC_Thesis")
                xw.WriteElementString("Thesis_Degree_Name", DegreeName.Text)
                xw.WriteElementString("Thesis_Degree_Level", DegreeLevel.Text)
                xw.WriteElementString("Thesis_Degree_Descipline", DesciptionThai.Text)
                xw.WriteElementString("Thesis_Degree_Grantor", DegreeGrantor.Text)
                xw.WriteEndElement()

                xw.WriteEndElement()

                xw.WriteStartElement("Kmitl")
                Dim ce As Integer
                For ce = 0 To 6
                    If EMailCreator(ce) <> "" Then
                        xw.WriteElementString("Creator_English", EMailCreator(ce))
                    End If
                Next
                For A As Integer = 0 To 6
                    If NameAdviser(A) <> "" Then
                        xw.WriteElementString("Adviser_English", EnglishAdviser(A))
                    End If
                Next

                xw.WriteStartElement("Faculty")
                xw.WriteElementString("Faculty_Thai", FacultyList.Text)
                xw.WriteElementString("Faculty_English", FacultyEng.Text)
                xw.WriteEndElement()

                xw.WriteStartElement("Department")
                xw.WriteElementString("Department_Thai", DepartmentThai.Text)
                xw.WriteElementString("Department_English", DepartmentEnglish.Text)
                xw.WriteEndElement()

                xw.WriteElementString("Year_English", CreatedYEnglish.Text)

                xw.WriteElementString("Abstract_English", Abstract_English.Text)
                xw.WriteElementString("Contents", Contents.Text)
                xw.WriteElementString("Illustrative", Illustrative.Text)

                xw.WriteStartElement("Chapter")
                Dim i As Integer = 0
                For i = 0 To 16
                    If NumChapter(i) <> "" Then
                        xw.WriteElementString("Chapter" + CStr(i), NumChapter(i))
                    End If
                Next
                xw.WriteEndElement()

                xw.WriteElementString("Bibliography", Bibliography.Text)
                xw.WriteElementString("Appendix", Keyword.Text)
                xw.WriteElementString("Keyword", Keyword.Text)


                xw.WriteEndElement()

                xw.WriteEndElement()
                xw.WriteEndDocument()
                xw.Close()
            Catch ex As Exception
                Server.Transfer("Erroepage.aspx")
            End Try

        End Using

        FILE_XML = File.ReadAllText(sFilePath)
        FILE_XML = FILE_XML.Replace("> <", "><")
        FILE_XML = FILE_XML.Replace(">  <", "><")

        FILE_XML = FILE_XML.Replace(Chr(34), "")
        FILE_XML = FILE_XML.Replace("<?xml version=1.0 encoding=utf-8 standalone=yes?>", "")
    End Sub

    Protected Sub Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Clear.Click
        ClearNewCreator()
        ClearNewAdviser()
        ClearNewChapter()
        ClearData()
    End Sub

    Protected Sub ClearData()
        Thai_Title.Text = ""
        English_Title.Text = ""
        Subject.Text = ""
        Abstract_Thai.Text = ""
        Thai_AdviserList.ClearSelection()
        Roles_Adviser.Text = ""
        Email_Adviser.Text = ""
        Publisher_Name.Text = ""
        Place.Text = ""
        E_mail_Publisher.Text = ""
        Created.Text = ""
        Date_Issued.Text = ""
        Date_Modified.Text = ""
        RadioDOC.Checked = False
        RadioPDF.Checked = False
        URL.Text = ""
        ISBN.Text = ""
        ISSN.Text = ""
        CallNumber.Text = ""
        LanguageThai.Checked = False
        LanguageEnglish.Checked = False
        Rights.Text = ""
        Access.Text = ""
        DegreeName.ClearSelection()
        DegreeNameList()
        FacultyNList()
        DepartmentNList()
        DesciptionNList()
        DegreeLevel.ClearSelection()
        DesciptionThai.ClearSelection()
        DegreeGrantor.Text = ""
        English_Adviser.Text = ""
        FacultyEng.Text = ""
        DepartmentThai.ClearSelection()
        DepartmentEnglish.Text = ""
        CreatedYEnglish.Text = ""
        Abstract_English.Text = ""
        Contents.Text = ""
        Illustrative.Text = ""
        Appendix.Text = ""
        Bibliography.Text = ""
        Keyword.Text = ""
        Keyword.Text = ""
    End Sub
    Protected Sub Thai_AdviserList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Thai_AdviserList.SelectedIndexChanged
        SearchA()
        Publisher_Name.Focus()
    End Sub
    Protected Sub AdviserList()
        Thai_AdviserList.Items.Clear()
        Dim strConn, SelectDegreeName As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectDegreeName = "SELECT CONTRIBUTOR_NAME FROM DC_CONTRIBUTOR ORDER BY CONTRIBUTOR_NAME"
        Dim da As New SqlDataAdapter(SelectDegreeName, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Adviser")

        If ds.Tables("Adviser").Rows.Count <> 0 Then

            Thai_AdviserList.Items.Add("<<อาจารย์ที่ปรึกษา>>")
            For i As Integer = 0 To ds.Tables("Adviser").Rows.Count - 1
                Thai_AdviserList.Items.Add(ds.Tables("Adviser").Rows(i)(0).ToString())
            Next
            Conn.Close()
        Else
            Thai_AdviserList.Items.Add("<<อาจารย์ที่ปรึกษา>>")
        End If
        Thai_AdviserList.Focus()
        Conn.Close()

    End Sub
    Protected Sub SearchA()
        Try
            Dim strConn, SelectAdviser As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectAdviser = "SELECT * FROM DC_CONTRIBUTOR WHERE (CONTRIBUTOR_NAME LIKE N'%"
            SelectAdviser += Thai_AdviserList.Text + "%')"
            Dim da As New SqlDataAdapter(SelectAdviser, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Adviser")
            If ds.Tables("Adviser").Rows.Count <> 0 Then
                AdviserID = CStr(ds.Tables("Adviser").Rows(0)(0))
                Thai_AdviserList.SelectedValue = CStr(ds.Tables("Adviser").Rows(0)(1))
                English_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(2))
                Email_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(3))
                Roles_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(4))
            Else
                Thai_AdviserList.ClearSelection()
                English_Adviser.Text = ""
                Email_Adviser.Text = ""
                Roles_Adviser.Text = ""
            End If
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try

    End Sub
    Protected Sub DegreeNameList()
        DegreeName.Items.Clear()
        Dim strConn, SelectDegreeName As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectDegreeName = "SELECT DEGREE_NAME  FROM DC_DEGREE WHERE(DEGREE_LAVEL = N'"
        SelectDegreeName += DegreeLevel.Text + "')"
        Dim da As New SqlDataAdapter(SelectDegreeName, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "DEGREE")
        If ds.Tables("DEGREE").Rows.Count <> 0 Then

            DegreeName.Items.Add("<<ชื่อปริญญา>>")
            For i As Integer = 0 To ds.Tables("DEGREE").Rows.Count - 1
                DegreeName.Items.Add(ds.Tables("DEGREE").Rows(i)(0).ToString())
            Next
            Conn.Close()
        Else
            DegreeName.Items.Add("<<ชื่อปริญญา>>")
        End If
        Conn.Close()
    End Sub
    Protected Sub FacultyNList()
        Try
            FacultyList.Items.Clear()
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_FACULTY.FACULTY_THAI FROM DC_FACULTY INNER JOIN  DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID"
            SelectFaculty += " WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
            SelectFaculty += DegreeLevel.Text
            SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
            SelectFaculty += DegreeName.Text + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DEGREE")
            If ds.Tables("DEGREE").Rows.Count <> 0 Then

                FacultyList.Items.Add("<<คณะวิชา>>")
                For i As Integer = 0 To ds.Tables("DEGREE").Rows.Count - 1
                    FacultyList.Items.Add(ds.Tables("DEGREE").Rows(i)(0).ToString())
                Next
                Conn.Close()
            Else
                FacultyList.Items.Add("<<คณะวิชา>>")
            End If

            FacultyNListEng()
            FacultyEng.Enabled = False
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub FacultyNListEng()
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_FACULTY.FACULTY_ENGLISH FROM DC_FACULTY  "
            SelectFaculty += " WHERE (DC_FACULTY.FACULTY_THAI = N'"
            SelectFaculty += FacultyList.Text + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Faculty")
            If ds.Tables("Faculty").Rows.Count <> 0 Then
                FacultyEng.Text = CStr(ds.Tables("Faculty").Rows(0)(0))
            Else
                FacultyEng.Text = ""
            End If
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub DepartmentNList()
        Try
            DepartmentThai.Items.Clear()
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_DEPARTMENT.DEPARTMENT_THAI FROM DC_DEGREE INNER JOIN "
            SelectFaculty += "DC_FACULTY ON DC_DEGREE.DEGREE_ID = DC_FACULTY.DEGREE_ID INNER JOIN "
            SelectFaculty += "DC_DEPARTMENT ON DC_FACULTY.FACULTYID = DC_DEPARTMENT.FACULTYID "
            SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
            SelectFaculty += DegreeLevel.Text
            SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
            SelectFaculty += DegreeName.Text
            SelectFaculty += "') AND (DC_FACULTY.FACULTY_THAI = N'"
            SelectFaculty += FacultyList.Text + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "DEGREE")
            If ds.Tables("DEGREE").Rows.Count <> 0 Then

                DepartmentThai.Items.Add("<<ภาควิชา>>")
                For i As Integer = 0 To ds.Tables("DEGREE").Rows.Count - 1
                    DepartmentThai.Items.Add(ds.Tables("DEGREE").Rows(i)(0).ToString())
                Next
                Conn.Close()
            Else
                DepartmentThai.Items.Add("<<ภาควิชา>>")
            End If
            Conn.Close()
            DepartmentNListEng()
            DepartmentEnglish.Enabled = False
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub DepartmentNListEng()
        Try
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT DC_DEPARTMENT.DEPARTMENTID_ENG FROM DC_DEPARTMENT  "
            SelectFaculty += " WHERE (DC_DEPARTMENT.DEPARTMENT_THAI = N'"
            SelectFaculty += DepartmentThai.Text + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Faculty")
            If ds.Tables("Faculty").Rows.Count <> 0 Then
                DepartmentEnglish.Text = CStr(ds.Tables("Faculty").Rows(0)(0))
            Else
                DepartmentEnglish.Text = ""
            End If
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub DesciptionNList()
        Try
            DesciptionThai.Items.Clear()
            Dim strConn, SelectFaculty As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectFaculty = "SELECT  DESCIPTION_THAI FROM DC_DESCIPTION INNER JOIN "
            SelectFaculty += "DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN  "
            SelectFaculty += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN "
            SelectFaculty += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID  "
            SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
            SelectFaculty += DegreeLevel.Text
            SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
            SelectFaculty += DegreeName.Text
            SelectFaculty += "') AND (DC_FACULTY.FACULTY_THAI = N'"
            SelectFaculty += FacultyList.Text
            SelectFaculty += "') AND (DC_DEPARTMENT.DEPARTMENT_THAI = N'"
            SelectFaculty += DepartmentThai.Text + "')"
            Dim da As New SqlDataAdapter(SelectFaculty, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Desciption")
            If ds.Tables("Desciption").Rows.Count <> 0 Then

                DesciptionThai.Items.Add("<<สาขาวิชา>>")
                For i As Integer = 0 To ds.Tables("Desciption").Rows.Count - 1
                    DesciptionThai.Items.Add(ds.Tables("Desciption").Rows(i)(0).ToString())
                Next
                Conn.Close()
            Else
                DesciptionThai.Items.Add("<<สาขาวิชา>>")
            End If
            Conn.Close()
            DesciptionNListEng()
            DesciptionEng.Enabled = False
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub DesciptionNListEng()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT  DC_DESCIPTION.DESCIPTION_ENGLISH,DC_DESCIPTION.DESCIPTION_ID FROM DC_DESCIPTION INNER JOIN "
        SelectFaculty += "DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN  "
        SelectFaculty += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN "
        SelectFaculty += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID  "
        SelectFaculty += "WHERE (DC_DEGREE.DEGREE_LAVEL = N'"
        SelectFaculty += DegreeLevel.Text
        SelectFaculty += "') AND (DC_DEGREE.DEGREE_NAME = N'"
        SelectFaculty += DegreeName.Text
        SelectFaculty += "') AND (DC_FACULTY.FACULTY_THAI = N'"
        SelectFaculty += FacultyList.Text
        SelectFaculty += "') AND (DC_DEPARTMENT.DEPARTMENT_THAI = N'"
        SelectFaculty += DepartmentThai.Text
        SelectFaculty += "') AND (DESCIPTION_THAI = N'"
        SelectFaculty += DesciptionThai.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Desciption")
        If ds.Tables("Desciption").Rows.Count <> 0 Then
            DesciptionEng.Text = CStr(ds.Tables("Desciption").Rows(0)(0))
            DESCIPTION_ID = CStr(ds.Tables("Desciption").Rows(0)(1))
        Else
            DesciptionEng.Text = ""
        End If
        Conn.Close()
    End Sub

    Protected Sub DegreeLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeLevel.SelectedIndexChanged
        If Page.IsPostBack = True Then
            DegreeNameList()
            FacultyNList()
            DepartmentNList()
            DesciptionNList()
        End If
        Publisher_Name.Focus()
    End Sub

    Protected Sub DegreeName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeName.SelectedIndexChanged
        If Page.IsPostBack = True Then
            FacultyNList()
            DepartmentNList()
            DesciptionNList()
            DegreeName.Focus()
        End If
        Publisher_Name.Focus()
    End Sub

    Protected Sub FacultyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FacultyList.SelectedIndexChanged
        FacultyNListEng()
        DepartmentNList()
        DepartmentNListEng()
        DesciptionNList()
        DesciptionNListEng()
        Publisher_Name.Focus()
    End Sub

    Protected Sub DepartmentThai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DepartmentThai.SelectedIndexChanged
        DepartmentNListEng()
        DesciptionNList()
        DesciptionNListEng()
        Publisher_Name.Focus()
    End Sub

    Protected Sub DesciptionThai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DesciptionThai.SelectedIndexChanged
        DesciptionNListEng()
        Publisher_Name.Focus()
    End Sub
    Protected Sub mycookies_Click()
        Dim DegreeFol As String = ""
        If DegreeLevel.Text = "ปริญญาตรี" Then
            DegreeFol = "Bachelor"
        ElseIf DegreeLevel.Text = "ปริญญาโท" Then
            DegreeFol = "Master"
        ElseIf DegreeLevel.Text = "ปริญญาเอก" Then
            DegreeFol = "Doctor"
        End If
        Dim nameti As String
        If Thai_Title.Text <> "" Then
            nameti = Thai_Title.Text
        ElseIf English_Title.Text <> "" Then
            nameti = English_Title.Text
        Else
            nameti = CallNumber.Text
        End If
        nameti = nameti.Replace(".", " ")
        NewFolder(DegreeFol, Trim(DesciptionThai.Text), Trim(Created.Text), Trim(nameti))

    End Sub

    Protected Sub NewFolder(ByVal degree As String, ByVal Desciption As String, ByVal Yare As String, ByVal Thesis As String)
        Dim DirPath As String = Server.MapPath("Thesis_Files/" + degree)
        Dim SubDirPathDesciption As String = Server.MapPath("Thesis_Files/" + degree + "/" + Desciption)
        Dim SubDirPathYare As String = Server.MapPath("Thesis_Files/" + degree + "/" + Desciption + "/" + Yare)
        Dim SubDirPathThesis As String = Server.MapPath("Thesis_Files/" + degree + "/" + Desciption + "/" + Yare + "/" + Thesis)
        Dim LinkUpload As String = "Thesis_Files/" + degree + "/" + Desciption + "/" + Yare + "/" + Thesis

        Dim DirPathfaculty As String = Server.MapPath("Thesis_Files" + "/" + degree)
        Dim DirPathDesciption As String = Server.MapPath("Thesis_Files" + "/" + degree)
        Dim DirPathYare As String = Server.MapPath("Thesis_Files" + "/" + degree + "/" + Desciption)
        Dim DirPathThesis As String = Server.MapPath("Thesis_Files" + "/" + degree + "/" + Desciption + "/" + Yare)


        Dim ObjDir As New DirectoryInfo(DirPath)
        Dim ObjDirPathDesciption As New DirectoryInfo(SubDirPathDesciption)
        Dim ObjDirPathYare As New DirectoryInfo(SubDirPathYare)
        Dim ObjDirPathThesis As New DirectoryInfo(SubDirPathThesis)

        Dim ObjPathDesciption As New DirectoryInfo(DirPathDesciption)
        Dim ObjPathYare As New DirectoryInfo(DirPathYare)
        Dim ObjPathThesis As New DirectoryInfo(DirPathThesis)

        If ObjDir.Exists <> True Then
            ObjDir.Create()
        End If

        If ObjDirPathDesciption.Exists <> True Then
            ObjPathDesciption.CreateSubdirectory(Desciption)
        End If

        If ObjDirPathYare.Exists <> True Then
            ObjPathYare.CreateSubdirectory(Yare)
        End If

        If ObjDirPathThesis.Exists <> True Then
            ObjPathThesis.CreateSubdirectory(Thesis)
        End If

        Directory = LinkUpload + "/"
    End Sub
    Protected Sub AutoIDFile()
        Dim CountId, Num, CountidNew As Integer
        Dim idcontributor, strConn, NewID, sqlProducts As String
        NewID = ""
        Try
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlProducts = "SELECT FILE_ID FROM DC_FILE"
            Dim da As New SqlDataAdapter(sqlProducts, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "FILE_ID")
            If ds.Tables("FILE_ID").Rows.Count = 0 Then
                idcontributor = "X000000001"
                UploadFile(idcontributor)
            Else
                CountId = ds.Tables("FILE_ID").Rows.Count
                idcontributor = CStr(ds.Tables("FILE_ID").Rows(CountId - 1)(0))
                Do While NewID <= idcontributor
                    Num = Num + 1
                    CountidNew = (CountId - 1) + Num
                    NewID = "X" + CountidNew.ToString("000000000")
                Loop
                UploadFile(NewID)
            End If
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub UploadFile(ByVal FILEID As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "INSERT INTO  [DC_FILE]([FILE_ID],[BOOK_ID],[LINK_FILE])"
            sqlSavedata += " VALUES ('" + FILEID + "','" + ShBookId + "','" + Directory + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Server.Transfer("Erroepage.aspx")
        End Try
    End Sub
    '############################  Subject  #############################

    Protected Sub AddSub_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddSub.Click
        If Subject.Text = "" Then
            Exit Sub
        End If
        If Countsub >= 6 Then
            sName.Text = "5"
        End If
        If sName.Text = "1" Or sName.Text = Str(Countsub) Then
            Sub_Click()
        Else
            sName.Text = Str(Countsub)
            ClearTextBoxSub()
        End If
        AddSub.Focus()
    End Sub

    Protected Sub ClearSub_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearSub.Click
        ClearNewSub()
        ClearSub.Focus()
    End Sub

    Protected Sub EditSub_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditSub.Click
        NameSub(sBack) = Subject.Text               'Add NameSub Thai
        EditSub.Focus()
    End Sub

    Protected Sub BackSub_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackSub.Click

        If sBack >= 1 Then
            If CountNames > 1 Then
                sBack -= 1
                CountNames -= 1
                sName.Text = Str(CountNames)
                Subject.Text = NameSub(sBack)               'Back NameSub Thai
            Else
                sBack = 1
                CountNames = 1
                sName.Text = Str(CountNames)
            End If
        End If
        BackSub.Focus()
    End Sub

    Protected Sub NextSub_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextSub.Click
        If sBack <= Countsub Then
            If CountNames < (Countsub - 1) Then
                sBack += 1
                CountNames += 1
                sName.Text = Str(CountNames)
                Subject.Text = NameSub(sBack)               'Next NameSub Thai
            End If
        End If
        NextSub.Focus()
    End Sub


    Protected Sub ClearNewSub()
        Dim sNum As Integer
        CountSub = 1
        CountNames = 1
        sName.Text = "1"
        ClearTextBoxSub()
        For sNum = 0 To 6
            NameSub(Countsub) = ""              'Clear NameSub Thai
        Next
    End Sub
    Protected Sub ClearTextBoxSub()
        Subject.Text = ""
    End Sub
    Protected Sub Sub_Click()
        If CountSub < 6 Then
            NameSub(Countsub) = Subject.Text               'Add NameSub Thai
            ClearTextBoxSub()
            If CountNames < 6 Then
                Countsub += 1
                If Countsub < 6 Then
                    CountNames = Countsub
                    sBack = Countsub
                    sName.Text = Str(CountNames)
                End If
            End If
        End If
    End Sub

    Protected Sub Created_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Created.TextChanged
        If Created.MaxLength = 4 Then
            Dim intYear As Integer
            intYear = CInt(Created.Text) - 543
            CreatedYEnglish.Text = CStr(intYear)
        End If

    End Sub
End Class
