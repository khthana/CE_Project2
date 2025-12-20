Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorLearningCalendar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Administrator" Then
                delete.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this learning calendar ?');")
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้ดูแลระบบ คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub createcalendar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createcalendar.Click
        tablecreate.Visible = True
        tableupdate.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub updatecalendar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatecalendar.Click
        Dim mydate(2) As String
        QueryStr = "select * from LearningCalendar where cal_year = (select max(cal_year) from learningcalendar) and cal_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar))"
        TableStr = "getdetailcalendar"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    year2.Text = row("cal_year")
                    term2.Text = row("cal_term")

                    mydate = CStr(row("cal_bterm")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    sTerm2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_bterm2.SelectedIndex = mydate(0)
                    'month_bterm2.SelectedIndex = mydate(1)
                    'year_bterm2.Text = mydate(2)

                    mydate = CStr(row("cal_eterm")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    eTerm2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_eterm2.SelectedIndex = mydate(0)
                    'month_eterm2.SelectedIndex = mydate(1)
                    'year_eterm2.Text = mydate(2)

                    mydate = CStr(row("cal_bregister")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    sRegister2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_bregister2.SelectedIndex = mydate(0)
                    'month_bregister2.SelectedIndex = mydate(1)
                    'year_bregister2.Text = mydate(2)

                    mydate = CStr(row("cal_eregister")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    eRegister2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_eregister2.SelectedIndex = mydate(0)
                    'month_eregister2.SelectedIndex = mydate(1)
                    'year_eregister2.Text = mydate(2)

                    mydate = CStr(row("cal_bchange")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    sChange2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_bchange2.SelectedIndex = mydate(0)
                    'month_bchange2.SelectedIndex = mydate(1)
                    'year_bchange2.Text = mydate(2)

                    mydate = CStr(row("cal_echange")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    eChange2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_echange2.SelectedIndex = mydate(0)
                    'month_echange2.SelectedIndex = mydate(1)
                    'year_echange2.Text = mydate(2)

                    mydate = CStr(row("cal_bdrop")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    sDrop2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_bdrop2.SelectedIndex = mydate(0)
                    'month_bdrop2.SelectedIndex = mydate(1)
                    'year_bdrop2.Text = mydate(2)

                    mydate = CStr(row("cal_edrop")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    eDrop2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_edrop2.SelectedIndex = mydate(0)
                    'month_edrop2.SelectedIndex = mydate(1)
                    'year_edrop2.Text = mydate(2)

                    mydate = CStr(row("cal_bexam")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    sExam2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_bexam2.SelectedIndex = mydate(0)
                    'month_bexam2.SelectedIndex = mydate(1)
                    'year_bexam2.Text = mydate(2)

                    mydate = CStr(row("cal_eexam")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    eExam2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'day_eexam2.SelectedIndex = mydate(0)
                    'month_eexam2.SelectedIndex = mydate(1)
                    'year_eexam2.Text = mydate(2)
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                tableupdate.Visible = False
                tablecreate.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        tablecreate.Visible = False
        tableupdate.Visible = True
        warning.Text = ""
    End Sub

    Protected Sub clear1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear1.Click
        year1.Text = ""
        term1.Text = ""

        '-------
        sRegister1.Value = ""
        eRegister1.Value = ""
        sTerm1.Value = ""
        eTerm1.Value = ""
        sChange1.Value = ""
        eChange1.Value = ""
        sDrop1.Value = ""
        eDrop1.Value = ""
        sExam1.Value = ""
        eExam1.Value = ""
        '-------

        'day_bregister1.SelectedIndex = 0
        'month_bregister1.SelectedIndex = 0
        'year_bregister1.Text = ""

        'day_eregister1.SelectedIndex = 0
        'month_eregister1.SelectedIndex = 0
        'year_eregister1.Text = ""

        'day_bterm1.SelectedIndex = 0
        'month_bterm1.SelectedIndex = 0
        'year_bterm1.Text = ""

        'day_eterm1.SelectedIndex = 0
        'month_eterm1.SelectedIndex = 0
        'year_eterm1.Text = ""

        'day_bchange1.SelectedIndex = 0
        'month_bchange1.SelectedIndex = 0
        'year_bchange1.Text = ""

        'day_echange1.SelectedIndex = 0
        'month_echange1.SelectedIndex = 0
        'year_echange1.Text = ""

        'day_bdrop1.SelectedIndex = 0
        'month_bdrop1.SelectedIndex = 0
        'year_bdrop1.Text = ""

        'day_edrop1.SelectedIndex = 0
        'month_edrop1.SelectedIndex = 0
        'year_edrop1.Text = ""

        'day_bexam1.SelectedIndex = 0
        'month_bexam1.SelectedIndex = 0
        'year_bexam1.Text = ""

        'day_eexam1.SelectedIndex = 0
        'month_eexam1.SelectedIndex = 0
        'year_eexam1.Text = ""

        warning.Text = ""
    End Sub

    Protected Sub clear2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear2.Click

        '-------
        sRegister2.Value = ""
        eRegister2.Value = ""
        sTerm2.Value = ""
        eTerm2.Value = ""
        sChange2.Value = ""
        eChange2.Value = ""
        sDrop2.Value = ""
        eDrop2.Value = ""
        sExam2.Value = ""
        eExam2.Value = ""
        '-------

        'day_bregister2.SelectedIndex = 0
        'month_bregister2.SelectedIndex = 0
        'year_bregister2.Text = ""

        'day_eregister2.SelectedIndex = 0
        'month_eregister2.SelectedIndex = 0
        'year_eregister2.Text = ""

        'day_bterm2.SelectedIndex = 0
        'month_bterm2.SelectedIndex = 0
        'year_bterm2.Text = ""

        'day_eterm2.SelectedIndex = 0
        'month_eterm2.SelectedIndex = 0
        'year_eterm2.Text = ""

        'day_bchange2.SelectedIndex = 0
        'month_bchange2.SelectedIndex = 0
        'year_bchange2.Text = ""

        'day_echange2.SelectedIndex = 0
        'month_echange2.SelectedIndex = 0
        'year_echange2.Text = ""

        'day_bdrop2.SelectedIndex = 0
        'month_bdrop2.SelectedIndex = 0
        'year_bdrop2.Text = ""

        'day_edrop2.SelectedIndex = 0
        'month_edrop2.SelectedIndex = 0
        'year_edrop2.Text = ""

        'day_bexam2.SelectedIndex = 0
        'month_bexam2.SelectedIndex = 0
        'year_bexam2.Text = ""

        'day_eexam2.SelectedIndex = 0
        'month_eexam2.SelectedIndex = 0
        'year_eexam2.Text = ""

        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        '----------------
        Dim arr(2) As String
        arr = sRegister1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim br As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eRegister1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim er As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sTerm1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim bt As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eTerm1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim et As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sChange1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim bc As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eChange1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim ec As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sDrop1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim bd As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eDrop1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim ed As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sExam1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim be As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eExam1.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim ee As String = arr(0) & "/" & arr(1) & "/" & arr(2)

        '----------------
        'Dim br As String = setSR 'day_bregister1.SelectedItem.Value & "/" & month_bregister1.SelectedItem.Value & "/" & year_bregister1.Text
        'Dim er As String = setER 'day_eregister1.SelectedItem.Value & "/" & month_eregister1.SelectedItem.Value & "/" & year_eregister1.Text
        'Dim bt As String = setST 'day_bterm1.SelectedItem.Value & "/" & month_bterm1.SelectedItem.Value & "/" & year_bterm1.Text
        'Dim et As String = setET 'day_eterm1.SelectedItem.Value & "/" & month_eterm1.SelectedItem.Value & "/" & year_eterm1.Text
        'Dim bc As String = setSC 'day_bchange1.SelectedItem.Value & "/" & month_bchange1.SelectedItem.Value & "/" & year_bchange1.Text
        'Dim ec As String = setEC 'day_echange1.SelectedItem.Value & "/" & month_echange1.SelectedItem.Value & "/" & year_echange1.Text
        'Dim bd As String = setSD 'day_bdrop1.SelectedItem.Value & "/" & month_bdrop1.SelectedItem.Value & "/" & year_bdrop1.Text
        'Dim ed As String = setED 'day_edrop1.SelectedItem.Value & "/" & month_edrop1.SelectedItem.Value & "/" & year_edrop1.Text
        'Dim be As String = setSE 'day_bexam1.SelectedItem.Value & "/" & month_bexam1.SelectedItem.Value & "/" & year_bexam1.Text
        'Dim ee As String = setEE 'day_eexam1.SelectedItem.Value & "/" & month_eexam1.SelectedItem.Value & "/" & year_eexam1.Text

        QueryStr = "insert into LearningCalendar(cal_year,cal_term,cal_bterm,cal_eterm,cal_bregister,cal_eregister,cal_bchange,cal_echange,cal_bdrop,cal_edrop,cal_bexam,cal_eexam) values('" & _
            year1.Text & "','" & term1.Text & "','" & bt & "','" & et & "','" & br & "','" & er & "','" & bc & "','" & ec & "','" & bd & "','" & ed & "','" & be & "','" & ee & "')"

        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การกำหนดปฏิทินการศึกษาของปีการศึกษา " & year1.Text & " ภาคการศึกษาที่ " & term1.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        End If
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        Dim calid As String = ""
        QueryStr = "select cal_id from LearningCalendar where cal_year = (select max(cal_year) from learningcalendar) and cal_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar))"
        TableStr = "getcalid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    calid = row("cal_id")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        Dim arr(2) As String
        arr = sRegister2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim br As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eRegister2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim er As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sTerm2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim bt As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eTerm2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim et As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sChange2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim bc As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eChange2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim ec As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sDrop2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim bd As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eDrop2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim ed As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = sExam2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim be As String = arr(0) & "/" & arr(1) & "/" & arr(2)
        arr = eExam2.Value.Split("/")
        arr(2) = Val(arr(2)) + 543
        Dim ee As String = arr(0) & "/" & arr(1) & "/" & arr(2)

        'Dim br As String = day_bregister2.SelectedItem.Value & "/" & month_bregister2.SelectedItem.Value & "/" & year_bregister2.Text
        'Dim er As String = day_eregister2.SelectedItem.Value & "/" & month_eregister2.SelectedItem.Value & "/" & year_eregister2.Text
        'Dim bt As String = day_bterm2.SelectedItem.Value & "/" & month_bterm2.SelectedItem.Value & "/" & year_bterm2.Text
        'Dim et As String = day_eterm2.SelectedItem.Value & "/" & month_eterm2.SelectedItem.Value & "/" & year_eterm2.Text
        'Dim bc As String = day_bchange2.SelectedItem.Value & "/" & month_bchange2.SelectedItem.Value & "/" & year_bchange2.Text
        'Dim ec As String = day_echange2.SelectedItem.Value & "/" & month_echange2.SelectedItem.Value & "/" & year_echange2.Text
        'Dim bd As String = day_bdrop2.SelectedItem.Value & "/" & month_bdrop2.SelectedItem.Value & "/" & year_bdrop2.Text
        'Dim ed As String = day_edrop2.SelectedItem.Value & "/" & month_edrop2.SelectedItem.Value & "/" & year_edrop2.Text
        'Dim be As String = day_bexam2.SelectedItem.Value & "/" & month_bexam2.SelectedItem.Value & "/" & year_bexam2.Text
        'Dim ee As String = day_eexam2.SelectedItem.Value & "/" & month_eexam2.SelectedItem.Value & "/" & year_eexam2.Text

        QueryStr = "update LearningCalendar set cal_bterm = '" & bt & "',cal_eterm = '" & et & "',cal_bregister = '" & _
            br & "',cal_eregister = '" & er & "',cal_bchange = '" & bc & "',cal_echange = '" & ec & "',cal_bdrop = '" & _
            bd & "',cal_edrop = '" & ed & "',cal_bexam = '" & be & "',cal_eexam = '" & ee & "' where cal_id = '" & calid & "'"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงปฏิทินการศึกษาของปีการศึกษา " & year2.Text & " ภาคการศึกษาที่ " & term2.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
        Dim getid As String = ""
        Dim getyear As String = ""
        Dim getterm As String = ""
        QueryStr = "select cal_id,cal_year,cal_term from LearningCalendar where cal_year = (select max(cal_year) from learningcalendar) and cal_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar))"
        TableStr = "getdetailcalendar"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    getid = row("cal_id")
                    getyear = row("cal_year")
                    getterm = row("cal_term")
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                tableupdate.Visible = False
                tablecreate.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        CloseConn()
        QueryStr = "delete from LearningCalendar where cal_id = '" & getid & "'"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=ได้ลบข้อมูลปฏิทินการศึกษาของปีการศึกษา " & getyear & " ภาคการศึกษาที่ " & getterm & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
