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

Partial Class EditData
    Inherits System.Web.UI.Page
    Private Shared CountCreator As Integer = 1
    Private Shared CountName, CBack, CNumName As Integer
    Private Shared CREATORID(6), NameCreator(6), EnglishCreator(6), OrgCreator(6), EMailCreator(6) As String

    Private Shared CountAdviser As Integer = 1
    Private Shared CountNameA, ABack, ANumName As Integer
    Private Shared AdviserID, ShowsAdviser As String
    Private Shared NameAdviser(6), EnglishAdviser(6), RolesAdviser(6), EMailAdviser(6), NumAdviserID(6), BAdviserID(6) As String

    Private Shared Countsub As Integer = 1
    Private Shared CountNames, sBack, sNumName As Integer
    Private Shared Subtext As String = ""
    Private Shared NameSub(6) As String

    Private Shared CountChapter As Integer = 1
    Private Shared CountNameChap, ChapterBack, ChapterNumName As Integer
    Private Shared NumChapter(16) As String

    Private Shared ShBookId, DESCIPTION_ID, LANGUAGE, Format As String
    Private Shared RELATION, COVERAGE, FILE_XML As String
    Private Shared Setstart As Boolean
    Private Shared Countasv, CountCre, CountCha As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CStr(Session("Status")) = "" Then
            Exit Sub
        End If
        If CStr(Application.Contents(0)) = "" Then
            Exit Sub
        End If
        If Page.IsPostBack <> True Then
            ShBookId = CStr(Application.Contents(0))
            CountCre = 0
            CountCha = 0
            Countasv = 0
            ClearNewChapter()
            ClearNewCreator()
            ClearNewAdviser()
            ClearNewSub()
            ShowData()
            OrgName.Text = "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"
            Date_Modified.Text = Today.Day.ToString + "/" + Today.Month.ToString + "/" + Today.Year.ToString
            CallNumber.Focus()
        End If

        Savea.Attributes.Add("OnClick", "javascript:if(confirm('คุณต้องการแก้ไขข้อมูลหรือไม่ ?')== false) return false;")
    End Sub
    Protected Sub AddCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddCreator.Click
        If CountCreator >= 6 Then
            NName.Text = "5"
        End If
        If NName.Text = "1" Or NName.Text = Str(CountCreator) Then
            OrgName.Text = "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"
            Creator_Click()
        Else
            NName.Text = Str(CountCreator)
            ClearTextBoxCreator()
            Setstart = True
        End If
    End Sub

    Protected Sub Creator_Click()
        If CountCreator < 6 Then
            NameCreator(CountCreator) = Trim(Thai_Creator.Text)       'Add NameCreator Thai
            EnglishCreator(CountCreator) = Trim(English_Creator.Text) 'Add NameCreator English
            OrgCreator(CountCreator) = Trim(OrgName.Text)            'Add OrgNameCreator
            EMailCreator(CountCreator) = Trim(MailCreator.Text)       'Add E-MailCreator
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
        NameCreator(CBack) = Trim(Thai_Creator.Text)       'Edit NameCreator Thai
        EnglishCreator(CBack) = Trim(English_Creator.Text) 'Edit NameCreator English
        OrgCreator(CBack) = Trim(OrgName.Text)            'Edit OrgNameCreator
        EMailCreator(CBack) = Trim(MailCreator.Text)       'Edit E-MailCreator
        Setstart = True
    End Sub
    Protected Sub ClearCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearCreator.Click
        ClearNewCreator()
    End Sub
    Protected Sub ClearNewCreator()
        Dim CNum As Integer
        CountCreator = 1
        CountName = 1
        NName.Text = "1"
        ClearTextBoxCreator()
        For CNum = 0 To 6
            NameCreator(CountCreator) = ""       'Clear  NameCreator Thai
            EnglishCreator(CountCreator) = ""    'Clear  NameCreator English
            OrgCreator(CountCreator) = ""        'Clear  OrgNameCreator
            EMailCreator(CountCreator) = ""      'Clear  E-MailCreator
        Next
        Setstart = True
    End Sub

    Protected Sub ClearTextBoxCreator()
        Thai_Creator.Text = ""
        English_Creator.Text = ""
        OrgName.Text = ""
        MailCreator.Text = ""
    End Sub

    Protected Sub EditCreator_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditCreator.Click
        CreatorEdit()
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
        Setstart = True
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
        Setstart = True
    End Sub

    '############################  Advise  #############################

    Protected Sub AddAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddAdviser.Click

        If CountAdviser >= 6 Then
            AName.Text = "5"
        End If
        If AName.Text = "1" Or AName.Text = Str(CountAdviser) Then
            Adviser_Click()
        Else
            AName.Text = Str(CountAdviser)
            ClearTextBoxAdviser()
        End If
        Created.Focus()
    End Sub
    Protected Sub ClearNewAdviser()
        Dim ANum As Integer
        CountAdviser = 1
        CountNameA = 1
        AName.Text = "1"
        ClearTextBoxAdviser()
        For ANum = 0 To 6
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
            NameAdviser(CountAdviser) = Thai_AdviserList.Text              'Add NameAdviser Thai
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
                AdviserList()
                ABack += 1
                CountNameA += 1
                AName.Text = Str(CountNameA)
                Thai_AdviserList.SelectedValue = NameAdviser(ABack)               'Next NameAdviser Thai
                English_Adviser.Text = EnglishAdviser(ABack)         'Next NameAdviser English
                Roles_Adviser.Text = RolesAdviser(ABack)             'Next Roles Adviser
                Email_Adviser.Text = EMailAdviser(ABack)            'Next E-MailAdviser
            End If
        End If
        Created.Focus()
    End Sub

    Protected Sub BackAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackAdviser.Click

        If ABack >= 1 Then
            If CountNameA > 1 Then
                AdviserList()
                ABack -= 1
                CountNameA -= 1
                AName.Text = Str(CountNameA)
                Thai_AdviserList.SelectedValue = NameAdviser(ABack)               'Back NameAdviser Thai
                English_Adviser.Text = EnglishAdviser(ABack)         'Back NameAdviser English
                Roles_Adviser.Text = RolesAdviser(ABack)             'Back Roles Adviser
                Email_Adviser.Text = EMailAdviser(ABack)            'Back E-MailAdviser
            Else
                ABack = 1
                CountNameA = 1
                AName.Text = Str(CountNameA)
            End If
        End If
        Created.Focus()
    End Sub
    Protected Sub AdviserEdit()
        NumAdviserID(ABack) = AdviserID
        NameAdviser(ABack) = Trim(Thai_AdviserList.Text)               'Add NameAdviser Thai
        EnglishAdviser(ABack) = Trim(English_Adviser.Text)    'Add NameAdviser English
        RolesAdviser(ABack) = Trim(Roles_Adviser.Text)            'Add Roles Adviser
        EMailAdviser(ABack) = Trim(Email_Adviser.Text)            'Add E-MailAdviser

    End Sub

    Protected Sub EditAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditAdviser.Click
        AdviserEdit()
        Created.Focus()
    End Sub

    Protected Sub ClearAdviser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearAdviser.Click
        ClearNewAdviser()
        Created.Focus()
    End Sub

    '#######################   Chapter   ##########################

    Protected Sub AddChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddChapter.Click

        If CountChapter >= 16 Then
            CName.Text = "15"
        End If
        If CName.Text = "1" Or CName.Text = Str(CountChapter) Then
            Chapter_Click()
        Else
            CName.Text = Str(CountChapter)
            ClearTextBoxChapter()
        End If
        Bibliography.Focus()
    End Sub

    Protected Sub ClearChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearChapter.Click

        ClearNewChapter()
        Bibliography.Focus()
    End Sub

    Protected Sub EditChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditChapter.Click
        NumChapter(ChapterBack) = Trim(Chapter.Text)               'Add NameAdviser Thai
        Bibliography.Focus()
    End Sub

    Protected Sub BackChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackChapter.Click
        If ChapterBack >= 1 Then
            If CountNameChap > 1 Then
                ChapterBack -= 1
                CountNameChap -= 1
                CName.Text = Str(CountNameChap)
                Chapter.Text = NumChapter(ChapterBack)         'Back NameAdviser Thai

            Else
                ChapterBack = 1
                CountNameChap = 1
                CName.Text = Str(CountNameChap)

            End If
        End If
        Bibliography.Focus()
    End Sub

    Protected Sub NextChapter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NextChapter.Click
        If ChapterBack <= CountChapter Then
            If CountNameChap < (CountChapter - 1) Then
                ChapterBack += 1
                CountNameChap += 1
                CName.Text = Str(CountNameChap)
                Chapter.Text = NumChapter(ChapterBack)              'NextChapter
                AddChapter.Focus()
            End If
        End If
        AddChapter.Focus()
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
        Chapter.Text = ""                               'Clear NameAdviser Thai
    End Sub
    Protected Sub Chapter_Click()
        If CountChapter < 16 Then
            NumChapter(CountChapter) = Trim(Chapter.Text)               'Add NameAdviser Thai
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

    Protected Sub ShowData()
        Try
            Dim strConn, SqlData As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SqlData = "SELECT DC_BOOK.CALL_NUMBER, DC_BOOK.TITLE_THAI, DC_BOOK.TITLE_ENGLISH, DC_DEGREE.DEGREE_LAVEL, DC_DEGREE.DEGREE_NAME,"
            SqlData += "DC_FACULTY.FACULTY_THAI, DC_FACULTY.FACULTY_ENGLISH, DC_DEPARTMENT.DEPARTMENT_THAI, DC_DEPARTMENT.DEPARTMENTID_ENG,"
            SqlData += "DC_DESCIPTION.DESCIPTION_THAI, DC_DESCIPTION.DESCIPTION_ENGLISH, DC_BOOK.DEGREEGRANTOR, DC_PUBLISHER.PUBLISHER_NAME,"
            SqlData += "DC_PUBLISHER.IDENTIFIER_URL, DC_PUBLISHER.PUBLISHER_PLACE, DC_PUBLISHER.PUBLISHER_E_MAIL, DC_BOOK.YEAYCREATED_THAI,"
            SqlData += "DC_BOOK.YEAYCREATED_ENGLISH, DC_BOOK.DATE_ISSUED, DC_BOOK.DATE_MODIFIED, DC_BOOK.INEDTIFIER_ISSN,"
            SqlData += "DC_BOOK.INEDTIFIER_ISBN, DC_PUBLISHER.RIGHTS_RIGHTS, DC_PUBLISHER.RIGHTS_ACCRESS, DC_BOOK.FOMAT, DC_BOOK.LANGUAGE,"
            SqlData += "DC_BOOK.SUBJECT, DC_BOOK.ABSTRACT_THAI, DC_BOOK.ABSTRACT_ENGLISH, DC_CHAPTER_1.CONTENTS, DC_CHAPTER_1.ILLUSTRATIVE,"
            SqlData += "DC_CHAPTER_1.APPENDIX, DC_CHAPTER_1.BIBLIOGRAPHY,DC_BOOK.KEYWORD, DC_BOOK.BOOK_ID  "
            SqlData += "FROM DC_BOOK INNER JOIN DC_DESCIPTION ON DC_BOOK.DESCIPTION_ID = DC_DESCIPTION.DESCIPTION_ID INNER JOIN "
            SqlData += "DC_DEPARTMENT ON DC_DESCIPTION.DEPARTMENTID = DC_DEPARTMENT.DEPARTMENTID INNER JOIN "
            SqlData += "DC_FACULTY ON DC_DEPARTMENT.FACULTYID = DC_FACULTY.FACULTYID INNER JOIN "
            SqlData += "DC_DEGREE ON DC_FACULTY.DEGREE_ID = DC_DEGREE.DEGREE_ID INNER JOIN "
            SqlData += "DC_PUBLISHER ON DC_BOOK.BOOK_ID = DC_PUBLISHER.BOOK_ID INNER JOIN "
            SqlData += "SUB_BOOK ON DC_BOOK.BOOK_ID = SUB_BOOK.BOOK_ID INNER JOIN "
            SqlData += "DC_CHAPTER ON DC_BOOK.BOOK_ID = DC_CHAPTER.BOOK_ID INNER JOIN "
            SqlData += "DC_CHAPTER AS DC_CHAPTER_1 ON DC_BOOK.BOOK_ID = DC_CHAPTER_1.BOOK_ID "
            SqlData += "WHERE (DC_BOOK.BOOK_ID LIKE N'%" + ShBookId + "')"
            Dim da As New SqlDataAdapter(SqlData, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "SqlData")
            If ds.Tables("SqlData").Rows.Count <> 0 Then
                CallNumber.Text = CStr(ds.Tables("SqlData").Rows(0)(0))
                Thai_Title.Text = CStr(ds.Tables("SqlData").Rows(0)(1))
                English_Title.Text = CStr(ds.Tables("SqlData").Rows(0)(2))
                DegreeLevel.SelectedValue = CStr(ds.Tables("SqlData").Rows(0)(3))
                DegreeNameList()
                DegreeName.SelectedValue = CStr(ds.Tables("SqlData").Rows(0)(4))
                FacultyNList()
                FacultyList.Text = CStr(ds.Tables("SqlData").Rows(0)(5))
                FacultyNListEng()
                DepartmentNList()
                DepartmentThai.Text = CStr(ds.Tables("SqlData").Rows(0)(7))
                DepartmentNListEng()
                DesciptionNList()
                DesciptionThai.Text = CStr(ds.Tables("SqlData").Rows(0)(9))
                DesciptionNListEng()
                DegreeGrantor.Text = CStr(ds.Tables("SqlData").Rows(0)(11))
                Publisher_Name.Text = CStr(ds.Tables("SqlData").Rows(0)(12))
                URL.Text = CStr(ds.Tables("SqlData").Rows(0)(13))
                Place.Text = CStr(ds.Tables("SqlData").Rows(0)(14))
                E_mail_Publisher.Text = CStr(ds.Tables("SqlData").Rows(0)(15))
                Created.Text = Trim(CStr(ds.Tables("SqlData").Rows(0)(16)))
                CreatedYEnglish.Text = Trim(CStr(ds.Tables("SqlData").Rows(0)(17)))
                Date_Issued.Text = CStr(ds.Tables("SqlData").Rows(0)(18))
                Date_Modified.Text = CStr(ds.Tables("SqlData").Rows(0)(19))
                ISSN.Text = CStr(ds.Tables("SqlData").Rows(0)(20))
                ISBN.Text = CStr(ds.Tables("SqlData").Rows(0)(21))
                Rights.Text = CStr(ds.Tables("SqlData").Rows(0)(22))
                Access.Text = CStr(ds.Tables("SqlData").Rows(0)(23))
                If CStr(ds.Tables("SqlData").Rows(0)(24)) <> "Thai" Then
                    LanguageThai.Checked = True
                Else
                    LanguageEnglish.Checked = True
                End If
                If CStr(ds.Tables("SqlData").Rows(0)(25)) <> "doc" Then
                    RadioPDF.Checked = True
                Else
                    RadioDOC.Checked = True
                End If
                Dim splitText() As String = Split(CStr(ds.Tables("SqlData").Rows(0)(26)), "|")
                For i As Integer = 0 To splitText.Length - 1
                    If splitText(i) <> " " And splitText(i) <> "" Then
                        Subject.Text = splitText(i)
                        Sub_Click()
                    End If
                Next
                Abstract_Thai.Text = CStr(ds.Tables("SqlData").Rows(0)(27))
                Abstract_English.Text = CStr(ds.Tables("SqlData").Rows(0)(28))
                Contents.Text = CStr(ds.Tables("SqlData").Rows(0)(29))
                Illustrative.Text = CStr(ds.Tables("SqlData").Rows(0)(30))
                Appendix.Text = CStr(ds.Tables("SqlData").Rows(0)(31))
                Bibliography.Text = CStr(ds.Tables("SqlData").Rows(0)(32))
                Keyword.Text = CStr(ds.Tables("SqlData").Rows(0)(33))
                SelectCreator()
                SelectAdviser()
                SelectChapter()
                Setstart = True

            End If
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub SelectCreator()
        Dim Num As Integer = 0
        Dim strConn, SelectCreator As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectCreator = "SELECT * FROM DC_CREATOR  "
        SelectCreator += " WHERE (BOOK_ID = N'"
        SelectCreator += ShBookId + "')"
        Dim da As New SqlDataAdapter(SelectCreator, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Creator")
        If ds.Tables("Creator").Rows.Count <> 0 Then
            ClearNewCreator()
            Dim i As Integer
            For i = 0 To ds.Tables("Creator").Rows.Count
                If ds.Tables("Creator").Rows.Count > i Then
                    CREATORID(i) = CStr(ds.Tables("Creator").Rows(i)(0))
                    Thai_Creator.Text = CStr(ds.Tables("Creator").Rows(i)(2))       'Add NameCreator Thai
                    English_Creator.Text = CStr(ds.Tables("Creator").Rows(i)(3)) 'Add NameCreator English
                    OrgName.Text = CStr(ds.Tables("Creator").Rows(i)(5))            'Add OrgNameCreator
                    MailCreator.Text = CStr(ds.Tables("Creator").Rows(i)(4))       'Add E-MailCreator
                    Creator_Click()
                    CountCre += 1
                End If
            Next
        End If
        Conn.Close()
    End Sub
    Protected Sub SelectAdviser()
        Dim Num As Integer = 0
        Dim strConn, SelectCreator As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectCreator = "SELECT DC_CONTRIBUTOR.* "
        SelectCreator += "FROM DC_CONTRIBUTOR INNER JOIN "
        SelectCreator += "SUB_BOOK ON DC_CONTRIBUTOR.CONTRIBUTOR_ID = SUB_BOOK.CONTRIBUTOR_ID "
        SelectCreator += "WHERE (SUB_BOOK.BOOK_ID = N'"
        SelectCreator += ShBookId + "')"
        Dim da As New SqlDataAdapter(SelectCreator, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Adviser")
        If ds.Tables("Adviser").Rows.Count <> 0 Then
            Dim i As Integer
            ClearNewAdviser()
            For i = 0 To ds.Tables("Adviser").Rows.Count
                If ds.Tables("Adviser").Rows.Count > i Then
                    AdviserList()

                    ShowsAdviser = CStr(ds.Tables("Adviser").Rows(i)(1))
                    If ShowsAdviser <> "" Then
                        EditSearchAdviser(ShowsAdviser, i)
                        Adviser_Click()
                        ClearTextBoxAdviser()
                        Countasv += 1
                    End If
                End If
            Next
        End If
        Conn.Close()
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
    Protected Sub EditSearchAdviser(ByVal ShowsAdviser As String, ByVal Numas As Integer)
        Try

            Dim strConn, SelectAdviser As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            SelectAdviser = "SELECT * FROM DC_CONTRIBUTOR WHERE (CONTRIBUTOR_NAME LIKE N'%"
            SelectAdviser += ShowsAdviser + "%')"
            Dim da As New SqlDataAdapter(SelectAdviser, Conn)
            Dim ds As New DataSet
            da.Fill(ds, "Adviser")
            If ds.Tables("Adviser").Rows.Count <> 0 Then
                AdviserID = CStr(ds.Tables("Adviser").Rows(0)(0))
                BAdviserID(Numas) = AdviserID
                Thai_AdviserList.SelectedValue = CStr(ds.Tables("Adviser").Rows(0)(1))
                English_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(2))
                Email_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(3))
                Roles_Adviser.Text = CStr(ds.Tables("Adviser").Rows(0)(4))

            End If
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try

    End Sub
    Protected Sub SelectChapter()
        Dim Num As Integer = 0
        Dim strConn, SelectCreator As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectCreator = "SELECT CHAPTER1,CHAPTER2,CHAPTER3,CHAPTER4,CHAPTER5,CHAPTER6,CHAPTER7 "
        SelectCreator += ",CHAPTER8,CHAPTER9,CHAPTER10,CHAPTER11,CHAPTER12,CHAPTER13,CHAPTER14,CHAPTER15 "
        SelectCreator += "FROM DC_CHAPTER WHERE (BOOK_ID = N'"
        SelectCreator += ShBookId + "')"
        Dim da As New SqlDataAdapter(SelectCreator, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Chapter")
        If ds.Tables("Chapter").Rows.Count <> 0 Then
            Dim i As Integer
            ClearNewChapter()
            For i = 0 To 14
                Dim font As String = CStr(ds.Tables("Chapter").Rows(0)(i))
                If font = "" Then
                Else
                    Chapter.Text = CStr(ds.Tables("Chapter").Rows(0)(i))       'Add NameCreator Thai
                    Chapter_Click()
                End If
            Next
        End If
        Conn.Close()
    End Sub
    Protected Sub DegreeNameList()
        Try


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
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub FacultyNList()
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
    End Sub
    Protected Sub FacultyNListEng()
        Dim strConn, SelectFaculty As String
        strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
        Dim Conn As New SqlConnection(strConn)
        Conn.Open()
        SelectFaculty = "SELECT DC_FACULTY.FACULTY_ENGLISH FROM DC_FACULTY  "
        SelectFaculty += " WHERE (DC_FACULTY.FACULTY_THAI = N'" + FacultyList.Text + "')"
        Dim da As New SqlDataAdapter(SelectFaculty, Conn)
        Dim ds As New DataSet
        da.Fill(ds, "Faculty")
        If ds.Tables("Faculty").Rows.Count <> 0 Then
            FacultyEng.Text = CStr(ds.Tables("Faculty").Rows(0)(0))
        Else
            FacultyEng.Text = ""
        End If
        Conn.Close()
    End Sub
    Protected Sub DepartmentNList()
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
    End Sub
    Protected Sub DepartmentNListEng()
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
    End Sub
    Protected Sub DesciptionNList()
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
        Rights.Focus()
    End Sub

    Protected Sub DegreeName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DegreeName.SelectedIndexChanged
        If Page.IsPostBack = True Then
            FacultyNList()
            DepartmentNList()
            DesciptionNList()
        End If
        Rights.Focus()
    End Sub

    Protected Sub FacultyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FacultyList.SelectedIndexChanged
        FacultyNListEng()
        DepartmentNList()
        DepartmentNListEng()
        DesciptionNList()
        DesciptionNListEng()
        Rights.Focus()
    End Sub

    Protected Sub DepartmentThai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DepartmentThai.SelectedIndexChanged
        DepartmentNListEng()
        DesciptionNList()
        DesciptionNListEng()
        Rights.Focus()
    End Sub

    Protected Sub DesciptionThai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DesciptionThai.SelectedIndexChanged
        DesciptionNListEng()
        Rights.Focus()
    End Sub

    Protected Sub Thai_AdviserList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Thai_AdviserList.SelectedIndexChanged
        SearchA()
        Created.Focus()
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
            Response.Redirect("Erroepage.aspx")
        End Try

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
    Protected Function ReStr(ByVal str As String) As String
        Dim TestString As String = str
        TestString = Replace(TestString, Chr(39), "")
        str = Replace(TestString, Chr(34), "")
        Return str
    End Function
    '-----------------------------  ADD XML  -----------------------------------

    Protected Sub Newdataxml()
        ' create StringBuilders to hold the results
        Dim messages As New StringBuilder()
        Dim sFilePath As String = Server.MapPath("~/Xml_Files/" + CallNumber.Text + ".xml")
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
                    If NameAdviser(A) <> "" And NameAdviser(A) <> " " Then
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
                    If EnglishAdviser(A) <> "" And EnglishAdviser(A) <> " " Then
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
                Response.Redirect("Erroepage.aspx")
            End Try

        End Using

        FILE_XML = File.ReadAllText(sFilePath)
        FILE_XML = FILE_XML.Replace("> <", "><")
        FILE_XML = FILE_XML.Replace(">  <", "><")
        FILE_XML = FILE_XML.Replace(Chr(34), "")
        FILE_XML = FILE_XML.Replace("<?xml version=1.0 encoding=utf-8 standalone=yes?>", "")
    End Sub

    Protected Sub UpdatadatatoSql()
        Try
            Newdataxml()
            Subtext = ""
            For i As Integer = 0 To NameSub.Length - 1
                If NameSub(i) <> "" Then
                    Subtext += NameSub(i) + "|"
                End If

            Next
            ChackLANGUAGEFile()
            ChackFormatFile()
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            sqlSavedata = "UPDATE [DC_BOOK] SET [DESCIPTION_ID]=N'" + Trim(DESCIPTION_ID) + "',[TITLE_THAI]=N'" + ReStr(Thai_Title.Text) + "',[TITLE_ENGLISH]=N'" + Trim(ReStr(English_Title.Text)) + "',"
            sqlSavedata += "[SUBJECT]=N'" + Trim(ReStr(Subtext)) + "',[ABSTRACT_THAI]=N'" + Trim(ReStr(Abstract_Thai.Text)) + "',[ABSTRACT_ENGLISH]=N'" + Trim(ReStr(Abstract_English.Text)) + "',[YEAYCREATED_THAI]=N'" + Trim(Created.Text) + "',"
            sqlSavedata += "[YEAYCREATED_ENGLISH]=N'" + Trim(CreatedYEnglish.Text) + "',[DATE_ISSUED]=N'" + Trim(Date_Issued.Text) + "',[DATE_MODIFIED]=N'" + Date_Modified.Text + "',[FOMAT]=N'" + Format + "',"
            sqlSavedata += "[LANGUAGE]=N'" + Trim(LANGUAGE) + "',[INEDTIFIER_ISSN]=N'" + Trim(ISSN.Text) + "',[INEDTIFIER_ISBN]=N'" + Trim(ISBN.Text) + "',[CALL_NUMBER]=N'" + Trim(ReStr(CallNumber.Text)) + "',"
            sqlSavedata += "[RELATION]=N'" + Trim(RELATION) + "',[COVERAGE]=N'" + Trim(COVERAGE) + "',[DEGREEGRANTOR]=N'" + Trim(ReStr(DegreeGrantor.Text)) + "',[FILEXML]=N'" + Trim(ReStr(FILE_XML)) + "'"
            sqlSavedata += " WHERE BOOK_ID = N'" + ShBookId + "'"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            AdddataAdviser(ShBookId)                        'Updata Adviser
            AdddataCREATOR(ShBookId)                        'Updata CREATOR
            UpdataUBLISHER(ShBookId)                        'Updata PUBLISHER
            UpdataCHAPTER(ShBookId)                         'Updata CHAPTER
            Conn.Close()
            ClearNewCreator()
            ClearNewAdviser()
            ClearNewChapter()
            ClearNewSub()
            Subtext = ""
            Dim ObjFile As New FileInfo(Server.MapPath("~/Xml_Files/" + CallNumber.Text + ".xml"))
            If ObjFile.Exists = True Then
                ObjFile.Delete()
            End If
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    '----------------------------- ADD  ADVISER  -----------------------------------
    Protected Sub AdddataAdviser(ByVal BookId As String)
        Dim i As Integer
        For i = 1 To CountAdviser - 1
            If NumAdviserID(i) <> "" And (CountAdviser - 1) = Countasv Then
                UpdatedatatoAdviser(BookId, NumAdviserID(i), BAdviserID(i - 1))
            End If
            If NumAdviserID(i) <> "" And (CountAdviser - 1) > Countasv Then
                If NumAdviserID(i) <> "" And i > Countasv Then
                    SavedatatoAdviser(BookId, NumAdviserID(i))
                Else
                    UpdatedatatoAdviser(BookId, NumAdviserID(i), BAdviserID(i - 1))
                End If
            End If
            If NumAdviserID(i) <> "" And (CountAdviser - 1) < Countasv Then
                Dim c As Integer
                For c = 1 To Countasv
                    If ((NumAdviserID(c) <> "") And ((CountAdviser - 1) >= c)) Then
                        UpdatedatatoAdviser(BookId, NumAdviserID(c), BAdviserID(c - 1))
                    Else
                        DEletedatatoAdviser(BookId, BAdviserID(c - 1))
                    End If
                Next
            End If
        Next
    End Sub

    Protected Sub SavedatatoAdviser(ByVal BookId As String, ByVal CONTRIBUTORID As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "INSERT INTO SUB_BOOK (CONTRIBUTOR_ID,BOOK_ID)"
            sqlSavedata += " VALUES ('" + CONTRIBUTORID + "','" + BookId + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub UpdatedatatoAdviser(ByVal BookId As String, ByVal CONTRIBUTORID As String, ByVal BAdviser As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "UPDATE SUB_BOOK SET CONTRIBUTOR_ID = N'" + CONTRIBUTORID + "' "
            sqlSavedata += "WHERE (BOOK_ID = N'" + BookId + "')AND (CONTRIBUTOR_ID = N'" + BAdviser + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub DEletedatatoAdviser(ByVal BookId As String, ByVal AdvisersID As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "DELETE FROM SUB_BOOK "
            sqlSavedata += "WHERE (BOOK_ID = N'" + BookId + "')AND(CONTRIBUTOR_ID=N'" + AdvisersID + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
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
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub AdddataCREATOR(ByVal BookId As String)
        Dim i As Integer
        For i = 1 To CountCreator - 1
            If NameCreator(i) <> "" And (CountCreator - 1) = CountCre Then
                UpdatedatatoCREATOR(Trim(BookId), Trim(CREATORID(i - 1)), Trim(NameCreator(i)), Trim(EnglishCreator(i)), Trim(OrgCreator(i)), Trim(EMailCreator(i)))
            End If
            If NameCreator(i) <> "" And (CountCreator - 1) > CountCre Then
                If NameCreator(i) <> "" And i > CountCre Then
                    AutoIDCREATOR(Trim(BookId), Trim(NameCreator(i)), Trim(EnglishCreator(i)), Trim(OrgCreator(i)), Trim(EMailCreator(i)))
                Else
                    UpdatedatatoCREATOR(Trim(BookId), Trim(CREATORID(i - 1)), Trim(NameCreator(i)), Trim(EnglishCreator(i)), Trim(OrgCreator(i)), Trim(EMailCreator(i)))
                End If
            End If
            If NameCreator(i) <> "" And (CountCreator - 1) < CountCre Then
                Dim c As Integer
                For c = 1 To CountCre - 1
                    If ((NameCreator(c) <> "") And ((CountCreator - 1) >= c)) Then
                        UpdatedatatoCREATOR(ShBookId, Trim(CREATORID(c - 1)), Trim(NameCreator(c)), Trim(EnglishCreator(c)), Trim(OrgCreator(c)), Trim(EMailCreator(c)))
                    Else
                        DeleteCREATOR(Trim(ShBookId), Trim(CREATORID(c - 1)))
                    End If
                Next
            End If
        Next
    End Sub
    Protected Sub SavedatatoCREATOR(ByVal BookId As String, ByVal CREATORIDs As String, ByVal NameCreators As String, ByVal EnglishCreators As String, ByVal OrgCreators As String, ByVal EMailCreators As String)
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
            sqlSavedata += " VALUES ('" + Trim(CREATORIDs) + "','" + BookId + "','" + NameCreators + "','"
            sqlSavedata += EnglishCreators + "','" + EMailCreators + "','" + OrgCreators + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub UpdatedatatoCREATOR(ByVal BookId As String, ByVal CREATORIDs As String, ByVal NameCreators As String, ByVal EnglishCreators As String, ByVal OrgCreators As String, ByVal EMailCreators As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "UPDATE DC_CREATOR SET [CREATOR_NAME] =N'" + Trim(NameCreators) + "',[CREATOR_ENGLIST] =N'" + Trim(EnglishCreators)
            sqlSavedata += "',[CREATOR_E_MAIL] =N'" + Trim(EMailCreators) + "'  ,[CREATOR_ORG_NAME] = N'" + Trim(OrgCreators)
            sqlSavedata += "' WHERE (BOOK_ID = N'" + Trim(BookId) + "') AND ( CREATOR_ID = N'" + Trim(CREATORIDs) + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub DeleteCREATOR(ByVal BookId As String, ByVal CREATORIDs As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "DELETE FROM DC_CREATOR "
            sqlSavedata += "WHERE (BOOK_ID = N'" + BookId + "') AND (CREATOR_ID = N'" + Trim(CREATORIDs) + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()

        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub

    Protected Sub UpdataUBLISHER(ByVal BookId As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "UPDATE  [DC_PUBLISHER] SET [PUBLISHER_NAME] = N'" + ReStr(Publisher_Name.Text) + "',[PUBLISHER_PLACE] = N'" + ReStr(Place.Text) + "'"
            sqlSavedata += ",[PUBLISHER_E_MAIL] = N'" + ReStr(E_mail_Publisher.Text) + "',[IDENTIFIER_URL] = N'" + ReStr(URL.Text) + "'"
            sqlSavedata += ",[RIGHTS_RIGHTS] = N'" + ReStr(Rights.Text) + "',[RIGHTS_ACCRESS] = N'" + ReStr(Access.Text) + "' "
            sqlSavedata += "WHERE (BOOK_ID = N'" + BookId + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub

    Protected Sub UpdataCHAPTER(ByVal BookId As String)
        Try
            Dim strConn As String
            Dim sqlSavedata As String
            strConn = WebConfigurationManager.ConnectionStrings("ThesisOnline").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()
            ChackLANGUAGEFile()
            ChackFormatFile()
            sqlSavedata = "UPDATE  [DC_CHAPTER] SET [CONTENTS] = N'" + ReStr(Contents.Text) + "',[ILLUSTRATIVE] = N'" + ReStr(Illustrative.Text) + "',[CHAPTER1] = N'" + ReStr(NumChapter(1)) + "'"
            sqlSavedata += ",[CHAPTER2] = N'" + ReStr(NumChapter(2)) + "',[CHAPTER3] = N'" + ReStr(NumChapter(3)) + "',[CHAPTER4] = N'" + ReStr(NumChapter(4)) + "'"
            sqlSavedata += ",[CHAPTER5] = N'" + ReStr(NumChapter(5)) + "',[CHAPTER6] = N'" + ReStr(NumChapter(6)) + "',[CHAPTER7] = N'" + ReStr(NumChapter(7)) + "'"
            sqlSavedata += ",[CHAPTER8] = N'" + ReStr(NumChapter(8)) + "',[CHAPTER9] = N'" + ReStr(NumChapter(9)) + "',[CHAPTER10] = N'" + ReStr(NumChapter(10)) + "'"
            sqlSavedata += ",[CHAPTER11] = N'" + ReStr(NumChapter(11)) + "',[CHAPTER12] = N'" + ReStr(NumChapter(12)) + "',[CHAPTER13] = N'" + ReStr(NumChapter(13)) + "'"
            sqlSavedata += ",[CHAPTER14] = N'" + ReStr(NumChapter(14)) + "',[CHAPTER15] = N'" + ReStr(NumChapter(15)) + "',[APPENDIX] = N'" + ReStr(Appendix.Text) + "'"
            sqlSavedata += ",[BIBLIOGRAPHY] = N'" + ReStr(Bibliography.Text) + "' "
            sqlSavedata += "WHERE (BOOK_ID = N'" + BookId + "')"
            Dim Conm As New SqlCommand(sqlSavedata, Conn)
            Conm.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            Response.Redirect("Erroepage.aspx")
        End Try
    End Sub
    Protected Sub Savea_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Savea.Click
        UpdatadatatoSql()
        responsepage()
    End Sub
    Sub responsepage()
        Application("BookId") = ShBookId
        Dim url As String = "Showsave.aspx?Bookid=" + ShBookId
        Response.Redirect(url)
    End Sub

    Protected Sub Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Clear.Click
        responsepage()
    End Sub
    '############################  Subject  #############################

    Protected Sub AddSub_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddSub.Click
        If Trim(Subject.Text) = "" Then
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
        NameSub(sBack) = Trim(Subject.Text)               'Add NameSub Thai
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
        Countsub = 1
        CountNames = 1
        sName.Text = "1"
        ClearTextBoxSub()
        For sNum = 0 To 6
            NameSub(sNum) = ""              'Clear NameSub Thai
        Next
    End Sub
    Protected Sub ClearTextBoxSub()
        Subject.Text = ""
    End Sub
    Protected Sub Sub_Click()
        If CountSub < 6 Then
            NameSub(Countsub) = Trim(Subject.Text)               'Add NameSub Thai
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
        Abstract_Thai.Focus()
    End Sub
End Class


