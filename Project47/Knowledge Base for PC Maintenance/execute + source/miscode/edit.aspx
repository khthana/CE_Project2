<%@ Page Language="VB" ContentType="text/html" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Web.Mail" %>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.Data" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc,UStatus,Reference

    sub Page_Init
        GetSession()
        QueryAllProblemType()
    end sub
    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then

              If IsPostBack=False Then
                   Dim myDataSet As New DataSet()
                   myDataSet = ShowRepeat()
                   myRepeater.DataSource = myDataSet
                   myRepeater.DataBind
                   Repeater2.DataSource = myDataSet
                   Repeater2.DataBind
                   ShowRepeat2()
               End If
                 Requests()
            Search()
            History()
            edit()

            menu1.visible = true
            menu2.visible = false
            menu3.visible = false
            menu4.visible = false
                ShowUser.Text = Session.Contents("UName")
                due.text = Format(today, "dddd d MMMM yyyy")
        else
           Response.Redirect("default.aspx")
        end if

    End Sub 'Page_Load

    Sub GetSession()
        UId = Trim(Session.Contents("UId"))
        UName = Trim(Session.Contents("UName"))
        UTel = Trim(Session.Contents("UTel"))
        UDep = Trim(Session.Contents("UDep"))
        USec = Trim(Session.Contents("USec"))
        ULoc = Trim(Session.Contents("ULoc"))
        UStatus = Trim(Session.Contents("UStatus"))
        Reference = Session.Contents("Reference")
        RegNewSession()
    End Sub

    Sub RegNewSession()
        Session("UId") = UId
        Session("UName") = UName
        Session("UTel") = UTel
        Session("UDep") = UDep
        Session("USec") = USec
        Session("ULoc") = ULoc
        Session.Contents("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")
    End Sub

    sub QueryAllProblemType()
            Ptype.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT ProblemType_ID,ProblemType FROM T_ProblemType"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                Ptype.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
            end while
            'DropDownList1.Items.Add(New ListItem("Other",0))
    end sub

    Function ShowRepeat() As System.Data.DataSet
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2, T_Request.Status AS Expr3, T_Users.Name AS Expr4, T_Department.Department AS Expr5, " & _
                                  "T_Section.Section AS Expr6, T_Location.Location AS Expr7, T_Users.Tel AS Expr8, T_Request.Times AS Expr9, T_Request.Priority AS Expr10, " & _
                                  "T_Request.Problem AS Expr11, T_Request.Machine_ID AS Expr12, T_Request.ComputerNumber AS Expr13, T_Request.Detail AS Expr14 , T_Request.Type AS Expr15 " & _
                                  "FROM T_Section INNER JOIN " & _
                                  "T_Users ON T_Section.Section_ID = T_Users.Section_ID INNER JOIN " & _
                                  "T_Department ON T_Users.Department_ID = T_Department.Department_ID INNER JOIN " & _
                                  "T_Location ON T_Users.Location_ID = T_Location.Location_ID INNER JOIN " & _
                                  "T_Request INNER JOIN " & _
                                  "T_Machine ON T_Request.Machine_ID = T_Machine.Machine_ID ON T_Users.User_ID = T_Request.User_ID " & _
                                  "WHERE (T_Request.Request_ID = " & Reference & ")"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
    End Function


    Sub ShowRepeat2()
           Reference = Session.Contents("Reference")
           If IsPostBack=False Then
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
             queryString = "SELECT T_Reply.Times AS Expr1, T_Users.Name AS Expr2, T_Reply.Status AS Expr3, T_Reply.Problem AS Expr4, T_Reply.Cost AS Expr5, " & _
                           "T_Reply.Detail AS Expr6 " & _
                           "FROM T_Users INNER JOIN " & _
                           "T_Reply ON T_Users.User_ID = T_Reply.User_ID " & _
                           "WHERE (T_Reply.Request_ID = " &Reference & ")"

            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)
            myRepeater2.DataSource = dataSet
            myRepeater2.DataBind
         End If
    End Sub

    Sub ButtonNew_Click(sender As Object, e As ImageClickEventArgs)
                Response.Redirect("request01.aspx") 'new.aspx
    End Sub

    Sub ButtonAlarm_Click(sender As Object, e As ImageClickEventArgs)
            Response.Redirect("request02.aspx") 'showalarm.aspx
    End Sub

    Sub ButtonSave_Click(sender As Object, e As ImageClickEventArgs)
        If Reply.Text = "" Then
            Label1.text = "Request reply message!!!"
        Else if(Ptype.SelectedItem.Text = "Other" And OtherProblem.Text = "") then
            Label1.text = "Request Other Problem!!!"
        Else
            Keep_Solve()
            Dim DataSet As Dataset
            DataSet = ReturnEmail_SentID(UId)
            Dim MailFrom = DataSet.Tables(0).Rows(0)(0)

            DataSet = MyQueryMethod(Reference)
            Dim MailTo = DataSet.Tables(0).Rows(0)(0)

            Dim mail As New MailMessage()
            MailTo = DataSet.Tables(0).Rows(0)(0)
            mail.To = MailTo
            mail.From = MailFrom
            Dim myDataSetx As New DataSet()
            myDataSetx = ShowRepeat()

            Dim DataSetn As New DataSet()
            DataSetn = ReturnEmailMisAdmin("Admin","MIS")
            Dim n As Integer = DataSetn.tables(0).Rows.Count()

            Dim i As integer
            For i = 0 To n - 1
                MailTo = DataSetn.Tables(0).Rows(i)(0)
                mail.To = MailTo

                if Forward.SelectedItem.value = 0 then

                    mail.Subject = "MIS JobOrder : " + CStr(myDataSetx.Tables(0).Rows(0)(0))+ ", Piority "+ (myDataSetx.Tables(0).Rows(0)(9)) +", Section "+ (myDataSetx.Tables(0).Rows(0)(5))+"- Pending"
                    mail.Body = "Now! MIS under to check your job, We will keep you inform." + vbcrlf & _
                                "Job order No# " + CStr(myDataSetx.Tables(0).Rows(0)(0))+ vbcrlf & _
                                "Priority     :" + (myDataSetx.Tables(0).Rows(0)(9)) + vbcrlf & _
                                "Data         :" + Format(Now,"dd/MM/yyyy hh:mm:ss")+ vbcrlf & _
                                "Name         :" + (myDataSetx.Tables(0).Rows(0)(3)) + vbcrlf & _
                                "Section      :" + (myDataSetx.Tables(0).Rows(0)(5)) + vbcrlf & _
                                "Tel          :" + (myDataSetx.Tables(0).Rows(0)(7)) + vbcrlf & _
                                "Computer name:" + (myDataSetx.Tables(0).Rows(0)(12))+ vbcrlf & _
                                "Type         :" + (myDataSetx.Tables(0).Rows(0)(14))+ vbcrlf & _
                                "Description  :" + Reply.Text + vbcrlf & _
                                "Thank you very much" + vbcrlf & _
                                "MIS Section "
                else
                    mail.Subject = "Complete MIS JobOrder # " + CStr(myDataSetx.Tables(0).Rows(0)(0))+"- Complete"
                    mail.Body =     "Your Job Order are complete" + vbcrlf & _
                                    "Job Order No#   " + CStr(myDataSetx.Tables(0).Rows(0)(0))+ vbcrlf & _
                                    "Request Date   :" + (myDataSetx.Tables(0).Rows(0)(8)) + vbcrlf & _
                                    "Complete Date  :" + Format(Now,"dd/MM/yyyy hh:mm:ss")+ vbcrlf & _
                                    "User's Problem :" + (myDataSetx.Tables(0).Rows(0)(1)) + vbcrlf & _
                                    "MIS Reply      :" + Reply.Text + vbcrlf & _
                                    "If you still have problem. Pls. Do not hesilate to contract MIS"+ vbcrlf & _
                                    "Thank you very much. Mis Section"
                end if

                SmtpMail.SmtpServer = "localhost"
                SmtpMail.Send(mail)
            next i

            insertReplys()
            UpdateRequest()
            error_msg.Text = ""
            Reply.Text = ""
            Cost.Text = ""
            Label1.text = ""
            Response.Redirect("request02.aspx") 'showalarm.aspx
        End If
    End Sub


        Function returnEnter() As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [T_Solve].[Solve] FROM [T_Solve] WHERE ([T_Solve].[Solve_ID] = 0)"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
        End Function

    Sub Keep_Solve()
        Dim Dataset1 As New DataSet
        Dim Dataset2 As new dataset
                                Dataset1 = returnEnter()
                                Dim aa As String = Dataset1.tables(0).Rows(0)(0)

                                Dim A_Repla() As String = {".","!","?",",",":","(",")","{","}","\","/","=",">","<","&","#",textDoublePost.text,aa,"'s","|","*",";"}
                                Dim A_Stopword() As String = {"0","1","2","3","4","5","6","7","8","9","a","about","above","according","across","actually","adj","after","afterwards","again","against","all","almost","alone","along","already","also","although","always","among","amongst","an","and","another","any","anyhow","anyone","anything","anywhere","are","aren't","around","as","at","b","be","became","because","become","becomes","becoming","been","before","beforehand","begin","beginning","behind","being","below","beside","besides","between","beyond","billion","both","but","by","c","can","can't","cannot","caption","co","co.","could","couldn't","d","did","didn't","do",    "does","doesn't","don't","down","during","e","each","eg","eight","eighty","either","else","elsewhere","end","ending","enough","etc","even","ever","every","everyone","everything", "everywhere","except","f","few","fifty","first","five","for","former","formerly","forty","found", "","four","from","further","g","h","had","has","hasn't","have","haven't","he","he'd","he'll","he's","hence","her","here","here's","hereafter","hereby","herein","hereupon","hers","herself","him","himself","his","how","however","hundred","i","i'd","i'll","i'm","i've","ie","if","in","inc.","indeed","instead","into","is","isn't","it","it's","its","itself","j","k","l","last","later","latter","latterly","least","less","let","let's","like","likely","ltd","m","made","make","makes","many","maybe","me","meantime","meanwhile","might","million","miss","more","moreover","most","mostly","mr","mrs","much","must","my","myself","n","namely","neither","never","nevertheless","next","nine","ninety","no","nobody","none","nonetheless","noone","nor","of","often","on","once","one","one's","only","onto","or","other","others","otherwise","our","ours","ourselves","out","over","overall","own","p","per","perhaps","q","r","rather","recent","recently","s","same","seem","seemed","seeming","seems","seven","seventy","several","she","she'd","she'll","she's","should","shouldn't","since","six","sixty","so","some","somehow","someone","something","sometime","sometimes","somewhere","still","stop","such","t","taking","ten","than","that","that'll","that's","that've","the","their","them","themselves","then","thence","there","there'd","there'll","there're","there's","there've","thereafter","thereby","therefore","therein","thereupon","these","they","they'd","they'll","they're","they've","thirty","this","those","though","thousand","three","through","throughout","thru","thus","to","together","too","toward","towards","trillion","twenty","two","u","under","unless","unlike","unlikely","until","up","upon","us","use","used","using","v","very","via","w","was","wasn't","we","we'd","we'll","we're","we've","well","were","weren't","what","what'll","what's","what've","whatever","when","whence","whenever","where","where's","whereafter","whereas","whereby","wherein","whereupon","wherever","whether","which","while","whither","who","who'd","who'll","who's","whoever","whole","whom","whomever","whose","why","will","with","within","without","won't","would","wouldn't","x","y","yes","yet","you","you'd","you'll","you're","you've","your","yours","yourself","yourselves","z"}
                                Dim TempSolve() As String

                                '''''''''Split Detail.text''''''''''''
                                Dim tempDetail As String = Solve.Text
                                Dim i As Integer
                                Dim j As Integer
                                Dim k As Integer
                                Dim num_insert As Integer

                                '''''''''''cut Replace''''''''''''''''''''''''
                                for i = 0 to UBound(A_Repla)
                                    tempDetail = Replace(tempDetail,A_Repla(i)," ")
                                next
                                TempSolve = Split(LCase(tempDetail))
                                '''''''''''''''''Cut stopword''''''''''''''''''
                                for i = 0 to UBound(TempSolve)
                                    TempSolve(i) = Trim(TempSolve(i))
                                next

                                for i = 0 to UBound(A_Stopword)
                                    for j=0 to UBound(TempSolve)
                                        if LCase(TempSolve(j)) = LCase(A_Stopword(i)) then
                                            TempSolve(j) = ""
                                        End if
                                    next
                                next

                                Dim TempSolve1 As string
                                for i = 0 to UBound(TempSolve)
                                    if(TempSolve(i) <>"") and (TempSolve(i)<>" ") then
                                        TempSolve1 = TempSolve1+" "+TempSolve(i)
                                        j = CheckSuffix_ReturnIndexID(TempSolve(i))
                                    end if
                                next

                             Dataset2 = ReturnMaxSolveID

                                 Dim maxId = Dataset2.tables(0).Rows(0)(0)
                                 j = Insert_Solve(maxId+1,Solve.text,LTrim(TempSolve1))
                             updateIndex()

    End Sub

    Sub updateIndex()
                               Dim Dataset1 As New DataSet: Dim Dataset2 As New DataSet
                               Dim Temp_keyword() As string
                               Dim i As integer:Dim j as integer:Dim k As integer
                               Dataset1 = ReturnKeyWordSolveID()
                               Dim Freq(99999) As integer

                               for i=0 to Dataset1.tables(0).Rows.Count()-1
                                   Dim temp As String = Dataset1.Tables(0).Rows(i)(1)
                                   Temp_keyword = Split(temp)
                                   for j=0 to Ubound(temp_keyword)
                                       Freq(CheckSuffix_ReturnIndexID(Temp_keyword(j))) = Freq(CheckSuffix_ReturnIndexID(Temp_keyword(j)))+1
                                   next
                               next
                               Dataset1 = RetureIndexAll()
                               for i=1 to Dataset1.tables(0).Rows.Count()
                                   if(Freq(i) =0) then
                                       Freq(i) =1
                                   end if
                                   Dim inde AS String = Dataset1.tables(0).Rows(i-1)(0)
                                   Dataset2 = ReturenIndexID_sentIndex(inde)
                                   k = UpdateFreq(Dataset2.tables(0).Rows(0)(0),Freq(i))
                               next
    End Sub

    Function ReturnMaxIndexID() As System.Data.DataSet
                  Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                  Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                  Dim queryString As String = "SELECT Max([T_Index].[Index_ID]) FROM [T_Index]"
                  Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                  dbCommand.CommandText = queryString
                  dbCommand.Connection = dbConnection

                  Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                  dataAdapter.SelectCommand = dbCommand
                  Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                  dataAdapter.Fill(dataSet)

                  Return dataSet
              End Function


               Function ReturenIndexID_sentIndex(ByVal index As String) As System.Data.DataSet
                   Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                   Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                   Dim queryString As String = "SELECT [T_Index].[Index_ID] FROM [T_Index] WHERE ([T_Index].[Index] = @Index)"
                   Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                   dbCommand.CommandText = queryString
                   dbCommand.Connection = dbConnection

                   Dim dbParam_index As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                   dbParam_index.ParameterName = "@Index"
                   dbParam_index.Value = index
                   dbParam_index.DbType = System.Data.DbType.String
                   dbCommand.Parameters.Add(dbParam_index)

                   Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                   dataAdapter.SelectCommand = dbCommand
                   Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                   dataAdapter.Fill(dataSet)

                   Return dataSet
               End Function

                   Function ReturnFreqAll() As System.Data.DataSet
                       Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                       Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                       Dim queryString As String = "SELECT [T_Index].[freq] FROM [T_Index]"
                       Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                       dbCommand.CommandText = queryString
                       dbCommand.Connection = dbConnection

                       Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                       dataAdapter.SelectCommand = dbCommand
                       Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                       dataAdapter.Fill(dataSet)

                       Return dataSet
                   End Function

                   Function UpdateFreq(ByVal index_ID As Integer, ByVal freq As Integer) As Integer
                       Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                       Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                       Dim queryString As String = "UPDATE [T_Index] SET [freq]=@freq WHERE ([T_Index].[Index_ID] = @Index_ID)"
                       Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                       dbCommand.CommandText = queryString
                       dbCommand.Connection = dbConnection

                       Dim dbParam_index_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                       dbParam_index_ID.ParameterName = "@Index_ID"
                       dbParam_index_ID.Value = index_ID
                       dbParam_index_ID.DbType = System.Data.DbType.Int32
                       dbCommand.Parameters.Add(dbParam_index_ID)
                       Dim dbParam_freq As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                       dbParam_freq.ParameterName = "@freq"
                       dbParam_freq.Value = freq
                       dbParam_freq.DbType = System.Data.DbType.Int32
                       dbCommand.Parameters.Add(dbParam_freq)

                       Dim rowsAffected As Integer = 0
                       dbConnection.Open
                       Try
                           rowsAffected = dbCommand.ExecuteNonQuery
                       Finally
                           dbConnection.Close
                       End Try

                       Return rowsAffected
                   End Function

                    Function CheckSuffix_ReturnIndexID(ByVal word As String) As integer
                        Dim Str() As String = {"*s","*ed","*ing","*ative","*ful","*ness","*al","*ance","*ence","*er","*ic","*able","*e","*l","*d"}
                        Dim Str21() As String = {"*sses","*ies","*eed","*at" ,"*bl" ,"*iz" ,"*i"}
                        Dim Str22() As String = {"*ss"  ,"*i  ","*ee" ,"*ate","*ble","*ize","*y"}
                        Dim Dataset1 As New DataSet
                        Dim IndexID As integer = 0
                        Dim bool As boolean = true
                        Dim bool_Suffix As boolean = false
                        Dim Temp1() As String : Dim Word1 As String : Dim Temp2 As String
                        Dataset1 = RetureIndexAll()

                        Dim i As integer : Dim j As integer : Dim k As Integer
                        i =  0
                        while (i <= Dataset1.tables(0).Rows.Count()-1) and bool
                            Temp1 = Split(Dataset1.Tables(0).Rows(i)(0),"/")
                            for j=0 to UBound(Temp1)
                                for k = 0 to UBound(Str)
                                   Word1 = word : Temp2 = Temp1(j)
                                   if (Word1 Like Str(k)) then
                                       Word1 = Word1.Remove(Len(Word1)-(Len(Str(k))-1),Len(Str(k))-1)
                                   end if
                                   if (Temp2 Like Str(k)) then
                                       Temp2 = Temp2.Remove(Len(Temp2)-(Len(Str(k))-1),Len(Str(k))-1)
                                   end if
                                   if Temp2 = word1 then
                                       bool_Suffix = true
                                       k = UBound(Str)
                                   end if
                                next

                                if (Bool_Suffix <> true) then
                                   for k = 0 to UBound(Str21)
                                       Word1 = word : Temp2 = Temp1(j)
                                       if (Word1 Like Str21(k)) then
                                           Word1 = Word1.Remove(Len(Word1)-(Len(Str21(k))-1),Len(Str21(k))-1)
                                       elseif (Word1 Like Str22(k)) then
                                           Word1 = Word1.Remove(Len(Word1)-(Len(Str22(k))-1),Len(Str22(k))-1)
                                       end if
                                       if (Temp2 Like Str21(k)) then
                                           Temp2 = Temp2.Remove(Len(Temp2)-(Len(Str21(k))-1),Len(Str21(k))-1)
                                       elseif (Temp2 Like Str22(k)) then
                                           Temp2 = Temp2.Remove(Len(Temp2)-(Len(Str22(k))-1),Len(Str22(k))-1)
                                       end if
                                       if Temp2 = word1 then
                                           bool_Suffix = true
                                           k = UBound(Str21)
                                       end if
                                   next
                                end if
                                if Bool_Suffix then
                                    IndexID = i+1
                                    bool = false
                                    j = UBound(Temp1)
                                end if

                            next
                            i = i+1
                        end while

                        if (IndexID = 0) then
                          Dataset1 = ReturnMaxIndexID()
                          IndexID = Dataset1.tables(0).Rows(0)(0)
                          MyInsertIndex(IndexID+1,word,1)
                        end if

                        Return IndexID
                    End Function

                    Function RetureIndexAll() As System.Data.DataSet
                        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                        Dim queryString As String = "SELECT [T_Index].[Index] FROM [T_Index]"
                        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                        dbCommand.CommandText = queryString
                        dbCommand.Connection = dbConnection

                        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                        dataAdapter.SelectCommand = dbCommand
                        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                        dataAdapter.Fill(dataSet)

                        Return dataSet
                    End Function


         Function ReturnKeyWordSolveID() As System.Data.DataSet
             Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
             Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

             Dim queryString As String = "SELECT [T_Solve].[Solve_ID], [T_Solve].[KeyWord] FROM [T_Solve]"
             Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
             dbCommand.CommandText = queryString
             dbCommand.Connection = dbConnection

             Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
             dataAdapter.SelectCommand = dbCommand
             Dim dataSet As System.Data.DataSet = New System.Data.DataSet
             dataAdapter.Fill(dataSet)

             Return dataSet
         End Function


         Function ReturnMaxSolveID() As System.Data.DataSet
             Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
             Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

             Dim queryString As String = "SELECT Max([T_Solve].[Solve_ID]) FROM [T_Solve]"
             Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
             dbCommand.CommandText = queryString
             dbCommand.Connection = dbConnection

             Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
             dataAdapter.SelectCommand = dbCommand
             Dim dataSet As System.Data.DataSet = New System.Data.DataSet
             dataAdapter.Fill(dataSet)

             Return dataSet
         End Function


         Function Insert_Solve(ByVal solve_ID As Decimal, ByVal solve As String, ByVal keyWord As String) As Integer
             Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
             Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

             Dim queryString As String = "INSERT INTO [T_Solve] ([Solve_ID], [Solve], [KeyWord]) VALUES (@Solve_ID, @Solve,"& _
    " @KeyWord)"
             Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
             dbCommand.CommandText = queryString
             dbCommand.Connection = dbConnection

             Dim dbParam_solve_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
             dbParam_solve_ID.ParameterName = "@Solve_ID"
             dbParam_solve_ID.Value = solve_ID
             dbParam_solve_ID.DbType = System.Data.DbType.Decimal
             dbCommand.Parameters.Add(dbParam_solve_ID)
             Dim dbParam_solve As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
             dbParam_solve.ParameterName = "@Solve"
             dbParam_solve.Value = solve
             dbParam_solve.DbType = System.Data.DbType.String
             dbCommand.Parameters.Add(dbParam_solve)
             Dim dbParam_keyWord As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
             dbParam_keyWord.ParameterName = "@KeyWord"
             dbParam_keyWord.Value = keyWord
             dbParam_keyWord.DbType = System.Data.DbType.String
             dbCommand.Parameters.Add(dbParam_keyWord)

             Dim rowsAffected As Integer = 0
             dbConnection.Open
             Try
                 rowsAffected = dbCommand.ExecuteNonQuery
             Finally
                 dbConnection.Close
             End Try

             Return rowsAffected
         End Function


              Function MyInsertIndex(ByVal index_ID As Decimal, ByVal index As String, ByVal freq As Decimal) As Integer
                  Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                  Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                  Dim queryString As String = "INSERT INTO [T_Index] ([Index_ID], [Index], [freq]) VALUES (@Index_ID, @Index, @f"& _
         "req)"
                  Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                  dbCommand.CommandText = queryString
                  dbCommand.Connection = dbConnection

                  Dim dbParam_index_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_index_ID.ParameterName = "@Index_ID"
                  dbParam_index_ID.Value = index_ID
                  dbParam_index_ID.DbType = System.Data.DbType.Decimal
                  dbCommand.Parameters.Add(dbParam_index_ID)
                  Dim dbParam_index As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_index.ParameterName = "@Index"
                  dbParam_index.Value = index
                  dbParam_index.DbType = System.Data.DbType.String
                  dbCommand.Parameters.Add(dbParam_index)
                  Dim dbParam_freq As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                  dbParam_freq.ParameterName = "@freq"
                  dbParam_freq.Value = freq
                  dbParam_freq.DbType = System.Data.DbType.Decimal
                  dbCommand.Parameters.Add(dbParam_freq)

                  Dim rowsAffected As Integer = 0
                  dbConnection.Open
                  Try
                      rowsAffected = dbCommand.ExecuteNonQuery
                  Finally
                      dbConnection.Close
                  End Try

                  Return rowsAffected
              End Function


    Sub SaveMe_Click(sender As Object, e As EventArgs)
        If Reply.Text = "" Then
            Label1.text = "Request reply message!!!"
        Else if(Ptype.SelectedItem.Text = "Other" And OtherProblem.Text = "") then
            Label1.text = "Request Other Problem!!!"
        Else
            if Solve.visible then
            Keep_Solve()
            end if
            Dim DataSet As Dataset
            DataSet = ReturnEmail_SentID(UId)
            Dim MailFrom = DataSet.Tables(0).Rows(0)(0)

            DataSet = MyQueryMethod(Reference)
            Dim MailTo = DataSet.Tables(0).Rows(0)(0)

            Dim mail As New MailMessage()
            MailTo = DataSet.Tables(0).Rows(0)(0)
            mail.To = MailTo
            mail.From = MailFrom
            Dim myDataSetx As New DataSet()
            myDataSetx = ShowRepeat()

            Dim DataSetn As New DataSet()
            DataSetn = ReturnEmailMisAdmin("Admin","MIS")
            Dim n As Integer = DataSetn.tables(0).Rows.Count()

            Dim i As integer
            For i = 0 To n - 1
                MailTo = DataSetn.Tables(0).Rows(i)(0)
                mail.To = MailTo

                if Forward.SelectedItem.value = 0 then

                    mail.Subject = "MIS JobOrder : " + CStr(myDataSetx.Tables(0).Rows(0)(0))+ ", Piority "+ (myDataSetx.Tables(0).Rows(0)(9)) +", Section "+ (myDataSetx.Tables(0).Rows(0)(5))+"- Pending"
                    mail.Body = "Now! MIS under to check your job, We will keep you inform." + vbcrlf & _
                                "Job order No# " + CStr(myDataSetx.Tables(0).Rows(0)(0))+ vbcrlf & _
                                "Priority     :" + (myDataSetx.Tables(0).Rows(0)(9)) + vbcrlf & _
                                "Data         :" + Format(Now,"dd/MM/yyyy hh:mm:ss")+ vbcrlf & _
                                "Name         :" + (myDataSetx.Tables(0).Rows(0)(3)) + vbcrlf & _
                                "Section      :" + (myDataSetx.Tables(0).Rows(0)(5)) + vbcrlf & _
                                "Tel          :" + (myDataSetx.Tables(0).Rows(0)(7)) + vbcrlf & _
                                "Computer name:" + (myDataSetx.Tables(0).Rows(0)(12))+ vbcrlf & _
                                "Type         :" + (myDataSetx.Tables(0).Rows(0)(14))+ vbcrlf & _
                                "Description  :" + Reply.Text + vbcrlf & _
                                "Thank you very much" + vbcrlf & _
                                "MIS Section "
                else
                    mail.Subject = "Complete MIS JobOrder # " + CStr(myDataSetx.Tables(0).Rows(0)(0))+"- Complete"
                    mail.Body =     "Your Job Order are complete" + vbcrlf & _
                                    "Job Order No#   " + CStr(myDataSetx.Tables(0).Rows(0)(0))+ vbcrlf & _
                                    "Request Date   :" + (myDataSetx.Tables(0).Rows(0)(8)) + vbcrlf & _
                                    "Complete Date  :" + Format(Now,"dd/MM/yyyy hh:mm:ss")+ vbcrlf & _
                                    "User's Problem :" + (myDataSetx.Tables(0).Rows(0)(1)) + vbcrlf & _
                                    "MIS Reply      :" + Reply.Text + vbcrlf & _
                                    "If you still have problem. Pls. Do not hesilate to contract MIS"+ vbcrlf & _
                                    "Thank you very much. Mis Section"
                end if

                SmtpMail.SmtpServer = "localhost"
                SmtpMail.Send(mail)
            next i

            insertReplys()
            UpdateRequest()
            error_msg.Text = ""
            Reply.Text = ""
            Cost.Text = ""
            Label1.text = ""
            Response.Redirect("request02.aspx") 'showalarm.aspx
        End If
    End Sub

        Function Insert_Solve(ByVal solve As String, ByVal keyWord As String) As Integer
                Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                Dim queryString As String = "INSERT INTO [T_Solve] ([Solve], [KeyWord]) VALUES (@Solve, @KeyWord)"
                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                dbCommand.CommandText = queryString
                dbCommand.Connection = dbConnection

                Dim dbParam_solve As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_solve.ParameterName = "@Solve"
                dbParam_solve.Value = solve
                dbParam_solve.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_solve)
                Dim dbParam_keyWord As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
                dbParam_keyWord.ParameterName = "@KeyWord"
                dbParam_keyWord.Value = keyWord
                dbParam_keyWord.DbType = System.Data.DbType.String
                dbCommand.Parameters.Add(dbParam_keyWord)

                Dim rowsAffected As Integer = 0
                dbConnection.Open
                Try
                    rowsAffected = dbCommand.ExecuteNonQuery
                Finally
                    dbConnection.Close
                End Try

                Return rowsAffected
            End Function

        Function ReturnEmailMisAdmin(ByVal status As String, ByVal email As String) As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [T_Users].[Email] FROM [T_Users] WHERE (([T_Users].[Status] = @Status) OR "& _
    "([T_Users].[Status] = @Email))"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_status As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_status.ParameterName = "@Status"
            dbParam_status.Value = status
            dbParam_status.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_status)
            Dim dbParam_email As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_email.ParameterName = "@Email"
            dbParam_email.Value = email
            dbParam_email.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_email)

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
        End Function

        Function MyQueryMethod(ByVal request_ID As Integer) As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [T_Users].[Email] FROM [T_Users], [T_Request] WHERE (([T_Users].[User_ID] "& _
    "= [T_Request].[User_ID]) AND ([T_Request].[Request_ID] = @Request_ID))"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_request_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_request_ID.ParameterName = "@Request_ID"
            dbParam_request_ID.Value = request_ID
            dbParam_request_ID.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_request_ID)

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
        End Function

        Function ReturnEmail_SentID(ByVal user_ID As Integer) As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [T_Users].[Email] FROM [T_Users] WHERE ([T_Users].[User_ID] = @User_ID)"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_user_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_user_ID.ParameterName = "@User_ID"
            dbParam_user_ID.Value = user_ID
            dbParam_user_ID.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_user_ID)

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
        End Function

    Function insertReplys()
            Dim dataReader As System.Data.IDataReader = queryMaxReplyId()
            Dim MaxRef
            dataReader.Read()
            try
                MaxRef = dataReader.GetInt32(0)
            catch ex As Exception
                MaxRef = 0
            Finally
                MaxRef = MaxRef+1
                'msgbox(MaxRef)
                myDate.Text = ToDay
                myTime.Text = Now

                Dim myDateTime

                if Day(ToDay)< 9 Then
                    myDateTime = Year(ToDay) & Month(ToDay) & "0" & Day(ToDay)
                End If
                if Month(ToDay)< 9 Then
                    myDateTime = Year(ToDay)& "0" & Month(ToDay) & Day(ToDay)
                End If
                if Month(ToDay)< 9 AND Day(ToDay) < 9 Then
                    myDateTime = Year(ToDay) & "0" & Month(ToDay) & "0" & Day(ToDay)
                End If

                Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                Dim queryString As String
                Dim aa As integer
                aa = MyInsert_TReply(MaxRef,Reference,UId,Ptype.SelectedItem.Text,Forward.SelectedItem.TExt,Cost.Text,Reply.Text,myDateTime,Format(Now,"dd/MM/yyyy hh:mm:ss"))

          End Try
    End Function

        Function MyInsert_TReply(ByVal reply_ID As Integer, ByVal request_ID As Integer, ByVal user_ID As Integer, ByVal problem As String, ByVal status As String, ByVal cost As Integer, ByVal detail As String, ByVal dates As Integer, ByVal times As String) As Integer
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "INSERT INTO [T_Reply] ([Reply_ID], [Request_ID], [User_ID], [Problem], [Status], "& _
    "[Cost], [Detail], [Dates], [Times]) VALUES (@Reply_ID, @Request_ID, @User_ID, @P"& _
    "roblem, @Status, @Cost, @Detail, @Dates, @Times)"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dbParam_reply_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_reply_ID.ParameterName = "@Reply_ID"
            dbParam_reply_ID.Value = reply_ID
            dbParam_reply_ID.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_reply_ID)
            Dim dbParam_request_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_request_ID.ParameterName = "@Request_ID"
            dbParam_request_ID.Value = request_ID
            dbParam_request_ID.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_request_ID)
            Dim dbParam_user_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_user_ID.ParameterName = "@User_ID"
            dbParam_user_ID.Value = user_ID
            dbParam_user_ID.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_user_ID)
            Dim dbParam_problem As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_problem.ParameterName = "@Problem"
            dbParam_problem.Value = problem
            dbParam_problem.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_problem)
            Dim dbParam_status As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_status.ParameterName = "@Status"
            dbParam_status.Value = status
            dbParam_status.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_status)
            Dim dbParam_cost As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_cost.ParameterName = "@Cost"
            dbParam_cost.Value = cost
            dbParam_cost.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_cost)
            Dim dbParam_detail As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_detail.ParameterName = "@Detail"
            dbParam_detail.Value = detail
            dbParam_detail.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_detail)
            Dim dbParam_dates As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_dates.ParameterName = "@Dates"
            dbParam_dates.Value = dates
            dbParam_dates.DbType = System.Data.DbType.Int32
            dbCommand.Parameters.Add(dbParam_dates)
            Dim dbParam_times As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
            dbParam_times.ParameterName = "@Times"
            dbParam_times.Value = times
            dbParam_times.DbType = System.Data.DbType.String
            dbCommand.Parameters.Add(dbParam_times)

            Dim rowsAffected As Integer = 0
            dbConnection.Open
            Try
                rowsAffected = dbCommand.ExecuteNonQuery
            Finally
                dbConnection.Close
            End Try

            Return rowsAffected
        End Function

    Function queryMaxReplyId() As System.Data.IDataReader
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT MAX(Reply_ID) FROM T_Reply"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

            Return dataReader
    End Function

    Function UpdateRequest()
                Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
                Dim queryString As String = "UPDATE T_Request SET Status='"+Forward.SelectedItem.Text+"' where Request_ID = " & Reference
                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                dbCommand.CommandText = queryString
                dbCommand.Connection = dbConnection
                dbConnection.Open
                Dim rowsAffected As Integer = 0
                Try
                    rowsAffected = dbCommand.ExecuteNonQuery
                Finally
                    dbConnection.Close
                End Try
    End Function


    Function QueryReqStatus() As Boolean   'Query Reply topic By
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Status FROM T_Request WHERE Ref='" &Reference &"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            dataReader.Read()
            if( dataReader.GetString(0) = "Borrow") Then
                return True
            Else
                return False
            End If
    End Function

    Function QueryReqTitle()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT [Request].[Title] FROM [Request] WHERE Ref='" &Reference &"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            dataReader.Read()
            'Title.Text = dataReader.GetString(0)
    End Function


    Sub ButtonLogout_Click(sender As Object, e As ImageClickEventArgs)
        Session("UName") = ""
        Session("PWord") = ""
        Response.Redirect("default.aspx")
    end sub


    Sub Ptype_SelectedIndexChanged(sender As Object, e As EventArgs)
        if(Ptype.SelectedItem.Text = "Other") then
            OtherProblem.Visible = True
        else
            OtherProblem.Text = ""
            OtherProblem.Visible = False
        end if
    End Sub

       'end

    'my change
    Sub Requests()
            Dim A() AS String = {"New","Queuing","Pending","Complete","Borrow"}
            Dim r As New TableRow()
            Dim c As New TableCell()
            Dim d as New ImageButton()

            d.ID = "Req1"
            d.ImageUrl="images/requests/images01.gif"
            AddHandler d.Click, AddressOf Req_Click
            c.Controls.Add(d)
            r.Cells.Add(c)
            menu1.Rows.Add(r)

            Dim j As Integer
            For j = 0 To 4
            if (((Session.Contents("UStatus") <> "User") and j > 0) or (Session.Contents("UStatus") = "User")) then

                Dim r2 As New TableRow()
                Dim c2 As New TableCell()
                Dim d2 As New ImageButton()
                d2.ID = "Req0" & (j+1)
                d2.ImageUrl="images/requests/images0" + Mid(str(j+2),2) + ".gif"
                AddHandler d2.Click, AddressOf Me.All_Click
                c2.Controls.Add(d2)
                r2.Cells.Add(c2)
                menu1.Rows.Add(r2)

                Dim r21 As New TableRow()
                Dim c21 As New TableCell()
                Dim d21 As New Label()
                d21.ForeColor = White
                d21.Text = A(j)
                c21.Controls.Add(d21)
                r21.Cells.Add(c21)
                menu1.Rows.Add(r21)
            end if

            Next j

            Dim r3 As New TableRow()
            Dim c3 As New TableCell()
            Dim d3 as New ImageButton()
            d3.ID = "Sea1"
            d3.ImageUrl="images/requests/images07.gif"
            AddHandler d3.Click, AddressOf Sea_Click
            c3.Controls.Add(d3)
            r3.Cells.Add(c3)
            menu1.Rows.Add(r3)

            if (Session.Contents("UStatus") <> "User") then
                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His1"
                d4.ImageUrl="images/requests/images08.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu1.Rows.Add(r4)
            end if

            if (UStatus = "User") then
                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Cost1"
                d5.ImageUrl="images/requests/images09.gif"
                AddHandler d5.Click, AddressOf Cost_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu1.Rows.Add(r5)
            end if

            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "Edi1"
                d6.ImageUrl="images/requests/images10.gif"
                AddHandler d6.Click, AddressOf Edi_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu1.Rows.Add(r6)
     End Sub

     Sub Search()
            Dim A() AS String = {"Search History","Job","Cost"} '10
            Dim r As New TableRow()
            Dim c As New TableCell()
            Dim d as New ImageButton()

            d.ID = "Req2"
            d.ImageUrl="images/search/images01.gif"
            AddHandler d.Click, AddressOf Req_Click
            c.Controls.Add(d)
            r.Cells.Add(c)
            menu2.Rows.Add(r)

            Dim r3 As New TableRow()
            Dim c3 As New TableCell()
            Dim d3 as New ImageButton()
            d3.ID = "Sea2"
            d3.ImageUrl="images/search/images02.gif"
            AddHandler d3.Click, AddressOf Sea_Click
            c3.Controls.Add(d3)
            r3.Cells.Add(c3)
            menu2.Rows.Add(r3)

            Dim j As Integer
            For j = 0 To 2
                if (((Session.Contents("UStatus") = "User") and j < 2) or (Session.Contents("UStatus") <> "User")) then
                Dim r2 As New TableRow()
                Dim c2 As New TableCell()
                Dim d2 As New ImageButton()
                d2.ID = "Sea0" & (j+1)
                d2.ImageUrl="images/search/images0" + Mid(str(j+3),2) + ".gif"
                AddHandler d2.Click, AddressOf Me.All_Click
                c2.Controls.Add(d2)
                r2.Cells.Add(c2)
                menu2.Rows.Add(r2)

                Dim r21 As New TableRow()
                Dim c21 As New TableCell()
                Dim d21 As New Label()
                d21.ForeColor=White
                d21.Text = A(j)
                c21.Controls.Add(d21)
                r21.Cells.Add(c21)
                menu2.Rows.Add(r21)
                end if
            Next j
            if (UStatus <> "User") then
                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His2"
                d4.ImageUrl="images/search/images06.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu2.Rows.Add(r4)
            end if
            if (UStatus = "User") then
                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Cost2"
                d5.ImageUrl="images/search/images07.gif"
                AddHandler d5.Click, AddressOf Cost_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu2.Rows.Add(r5)
            end if
            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "Edi2"
                d6.ImageUrl="images/search/images08.gif"
                AddHandler d6.Click, AddressOf Edi_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu2.Rows.Add(r6)
        End Sub

        Sub History()
            if (Session.Contents("UStatus") <> "User") then
                Dim A() AS String = {"Add History","Edit History","Support Rep","Workstation"}
                Dim r As New TableRow()
                Dim c As New TableCell()
                Dim d as New ImageButton()

                d.ID = "Req3"
                d.ImageUrl="images/history/images01.gif"
                AddHandler d.Click, AddressOf Req_Click
                c.Controls.Add(d)
                r.Cells.Add(c)
                menu3.Rows.Add(r)

                Dim r3 As New TableRow()
                Dim c3 As New TableCell()
                Dim d3 as New ImageButton()
                d3.ID = "Sea3"
                d3.ImageUrl="images/history/images02.gif"
                AddHandler d3.Click, AddressOf Sea_Click
                c3.Controls.Add(d3)
                r3.Cells.Add(c3)
                menu3.Rows.Add(r3)

                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His3"
                d4.ImageUrl="images/history/images03.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu3.Rows.Add(r4)

                Dim j As Integer
                For j = 0 To 1
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()
                    d2.ID = "His0" & (j+1)
                    d2.ImageUrl="images/history/images0" + Mid(str(j+4),2) + ".gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu3.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(j)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu3.Rows.Add(r21)
                Next j
            end if

            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "His03"
                d6.ImageUrl="images/search/images03.gif"
                AddHandler d6.Click, AddressOf Me.All_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu3.Rows.Add(r6)

                Dim r22 As New TableRow()
                    Dim c22 As New TableCell()
                    Dim d22 As New Label()
                    d22.ForeColor=white
                    d22.Text = "Search History"
                    c22.Controls.Add(d22)
                    r22.Cells.Add(c22)
                    menu3.Rows.Add(r22)

            Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Edi3"
                d5.ImageUrl="images/history/images09.gif"
                AddHandler d5.Click, AddressOf Edi_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu3.Rows.Add(r5)
        End Sub

        Sub edit()
            if (Session.Contents("UStatus") <> "User") then
                Dim A() AS String = {"Administator","User","Control panal","User Info"}
                Dim r As New TableRow()
                Dim c As New TableCell()
                Dim d as New ImageButton()

                d.ID = "Req4"
                d.ImageUrl="images/edit/images01.gif"
                AddHandler d.Click, AddressOf Req_Click
                c.Controls.Add(d)
                r.Cells.Add(c)
                menu4.Rows.Add(r)

                Dim r3 As New TableRow()
                Dim c3 As New TableCell()
                Dim d3 as New ImageButton()
                d3.ID = "Sea4"
                d3.ImageUrl="images/edit/images02.gif"
                AddHandler d3.Click, AddressOf Sea_Click
                c3.Controls.Add(d3)
                r3.Cells.Add(c3)
                menu4.Rows.Add(r3)

                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His4"
                d4.ImageUrl="images/edit/images03.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu4.Rows.Add(r4)

                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Edi4"
                d5.ImageUrl="images/edit/images04.gif"
                AddHandler d5.Click, AddressOf Edi_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu4.Rows.Add(r5)

                if (Session.Contents("UStatus") = "Admin") then
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()

                    d2.ID = "Edi01"
                    d2.ImageUrl="images/edit/images05.gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu4.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(0)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu4.Rows.Add(r21)
                 end if


                Dim j As Integer
                For j = 0 To 1
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()
                    d2.ID = "Edi0" & (j+2)
                    d2.ImageUrl="images/edit/images0" + Mid(str(j+6),2) + ".gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu4.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(j+1)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu4.Rows.Add(r21)
                Next j


            end if
        End Sub

        Sub Cost_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            Response.Redirect("usermodify.aspx") 'new.aspx
        End Sub

        Sub Req_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu2.Visible = false
            menu3.Visible = false
            menu1.Visible = true
            menu4.Visible = false
        End Sub

        Sub Sea_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu3.Visible = false
            menu2.Visible = true
            menu4.Visible = false
        End Sub

        Sub His_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = true
            menu4.Visible = false
        End Sub

        Sub Edi_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = false
            menu4.Visible = true
        End Sub

        ' My function
        Sub All_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)

            'MsgBox(Sender.ID)
            if (Sender.ID = "Req01") then
                Response.Redirect("request01.aspx") 'new.aspx
            else if (Sender.ID = "Req02") then
                Response.Redirect("request02.aspx") 'showalarm.aspx
            else if (Sender.ID = "Req03") then
                Response.Redirect("request03.aspx")
            else if (Sender.ID = "Req04") then
                Response.Redirect("request04.aspx")
            else if (Sender.ID = "Req05") then
                Response.Redirect("request05.aspx")
            end if

            'Sea
            if (Sender.ID = "Sea01") then
                Response.Redirect("search01.aspx")
            else if (Sender.ID = "Sea02") then
                Response.Redirect("search02.aspx")
            else if (Sender.ID = "Sea03") then
                Response.Redirect("search03.aspx")
            end if

            if (Sender.ID = "His01") then
                Response.Redirect("history01.aspx")
            else if (Sender.ID = "His02") then
                Response.Redirect("history02.aspx")
            else if (Sender.ID = "His03") then
                Response.Redirect("history03x.aspx")
            else if (Sender.ID = "His04") then
                Response.Redirect("history04.aspx")
            end if

            if (Sender.ID = "Edi01") then
                Response.Redirect("edit01.aspx")
            else if (Sender.ID = "Edi02") then
                Response.Redirect("edit02.aspx")
            else if (Sender.ID = "Edi03") then
                Response.Redirect("edit03.aspx")
            end if

        End Sub

    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("default.aspx")
    End Sub

    ' MY Change

    Sub Button1_Click(sender As Object, e As EventArgs)
       Solve.visible = true
    End Sub

</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>ESSILOR MANUFACTURING (THAILAND) CO., LTD.</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
    <style type="text/css">BODY {
	MARGIN: 2px
}
BODY {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TH {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
A {
	FONT-SIZE: 12px; COLOR: #0066ff; FONT-FAMILY: Courier New, Courier, mono
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:active {
	COLOR: #0066ff; TEXT-DECORATION: none
}
.style2 {
	COLOR: #ffffff
}
</style>
</head>
<body>
    <center><asp:Label id="label_hide" visible="false" runat="server"></asp:Label><asp:Label id="tmp" visible="false" runat="server"></asp:Label><asp:Label id="error_msg" visible="true" runat="server" backcolor="#FF0000" forecolor="#FFFFFF"></asp:Label><asp:Label id="myDate" visible="false" runat="server"></asp:Label><asp:Label id="myTime" visible="false" runat="server"></asp:Label>
        <asp:TextBox id="TextDoublePost" runat="server" Width="26px" Visible="False">&quot;</asp:TextBox>
        <form name="form1" action="" method="post" runat="server">
            <table bordercolor="#000000" height="450" cellspacing="1" cellpadding="1" width="775" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table cellspacing="0" cellpadding="0" width="700" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/logo/images01.gif" width="95" /></td>
                                        <td width="673" background="images/bgheader_admin.gif" height="45">
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font></font></font></span></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader_admin.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            <asp:ImageButton id="ButtonSave" onclick="ButtonSave_Click" runat="server" AlternateText="Save" ImageUrl="images/save.gif" height="20" width="20"></asp:ImageButton>
                                                            <font face="Comic Sans MS" color="#ffff00" size="2">Update</font></td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label>&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="middle" width="95" bgcolor="#1f1fe2" height="370">
                            <asp:table id="menu1" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                            <asp:table id="menu2" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                            <asp:table id="menu3" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                            <asp:table id="menu4" visible="false" runat="server" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                            <hr />
                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" Width="37px" AlternateText="Logout" src="images/commond/images03.gif" Height="33px"></asp:ImageButton>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <table bordercolor="#e0dfed" cellspacing="0" cellpadding="2" width="660" border="1">
                                <tbody>
                                    <tr>
                                        <td valign="top" align="left">
                                            <p>
                                                <asp:Repeater id="myRepeater" runat="server">
                                                    <HeaderTemplate>
                                                        <b><u>Detail</u></b>
                                                        <table border="0">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td width="70">
                                                                <b>Reference # : </b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr1") %>
                                                            </td>
                                                            <td width="70">
                                                                <b>Title: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr2") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Type: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr15") %>
                                                            </td>
                                                            <td>
                                                                <b>Status: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr3") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Requester: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr4") %>
                                                            </td>
                                                            <td>
                                                                <b>Department: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr5") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Section: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr6") %>
                                                            </td>
                                                            <td>
                                                                <b>Location: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr7") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Telephon: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr8") %>
                                                            </td>
                                                            <td>
                                                                <b>Request Date/Time: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr9") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Priority: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr10") %>
                                                            </td>
                                                            <td>
                                                                <b>Problem request: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr11") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Machine: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr12") %>
                                                            </td>
                                                            <td>
                                                                <b>Workstation: &nbsp; &nbsp; &nbsp;</b></td>
                                                            <td>
                                                                <%# DataBinder.Eval(Container.DataItem, "Expr13") %>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </p>
                                            <p>
                                                <asp:Repeater id="Repeater2" runat="server">
                                                    <HeaderTemplate>
                                                        <table border="0">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <b> ==== REQUEST SERVICE ====</b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>&nbsp; &nbsp;</b> <%# DataBinder.Eval(Container.DataItem, "Expr14") %>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                                            <asp:Repeater id="myRepeater2" runat="server">
                                                <HeaderTemplate>
                                                    <hr />
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td width="600">
                                                            <b>===== UPDATE =====</b>&nbsp; &nbsp;<%# DataBinder.Eval(Container.DataItem, "Expr1") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Support By : : </b><%# DataBinder.Eval(Container.DataItem, "Expr2") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Status : : </b><%# DataBinder.Eval(Container.DataItem, "Expr3") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Problem Type : : </b><%# DataBinder.Eval(Container.DataItem, "Expr4") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Cost : : </b><%# DataBinder.Eval(Container.DataItem, "Expr5") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#839AD8" >
                                                            &nbsp; &nbsp; <%# DataBinder.Eval(Container.DataItem, "Expr6") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="15" bgcolor="#839AD8""></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="middle">
                                            <table cellspacing="0" cellpadding="0" width="660" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td valign="top" align="left">
                                                            <p>
                                                                <table style="WIDTH: 330px; HEIGHT: 22px" height="22" cellpadding="0" width="330" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td align="left" width="230" height="15">
                                                                                Genaral</td>
                                                                            <td width="230" height="15">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Problem Type:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:dropdownlist id="Ptype" runat="server" Width="156px" OnSelectedIndexChanged="Ptype_SelectedIndexChanged"></asp:dropdownlist>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="center" align="right" width="100" height="23">
                                                                                <div align="left">
                                                                                </div>
                                                                            </td>
                                                                            <td align="left" width="230" height="23">
                                                                                <asp:TextBox id="OtherProblem" runat="server" Visible="False"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </p>
                                                        </td>
                                                        <td valign="top">
                                                            <table style="WIDTH: 330px; HEIGHT: 22px" height="22" cellpadding="0" width="330" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td width="100" height="15">
                                                                            <div align="left">Workflow
                                                                            </div>
                                                                        </td>
                                                                        <td width="230" height="15">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div align="left">Status :
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <asp:dropdownlist id="Forward" runat="server" Width="156px">
                                                                                <asp:ListItem Value="0">Pending</asp:ListItem>
                                                                                <asp:ListItem Value="1">Complete</asp:ListItem>
                                                                            </asp:dropdownlist>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="center" align="right" width="100" height="23">
                                                                            <div align="left">Cost :
                                                                            </div>
                                                                        </td>
                                                                        <td width="230" height="23">
                                                                            <asp:TextBox id="Cost" runat="server">0</asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <p>
                                                <strong>Reply Details&nbsp;</strong>
                                            </p>
                                            <p>
                                                <asp:TextBox id="Reply" runat="server" TextMode="MultiLine" Rows="5" Columns="78"></asp:TextBox>
                                            </p>
                                            <h4>&nbsp;<asp:Button id="Button1" onclick="Button1_Click" runat="server" BackColor="White" Text="Solution" BorderStyle="None" ForeColor="#0000C0" Font-Underline="True" Font-Size="Small" Font-Bold="True"></asp:Button>
                                            </h4>
                                            <h4>&nbsp;<asp:TextBox id="Solve" runat="server" Width="417px" Visible="False" Height="84px" TextMode="MultiLine"></asp:TextBox>
                                            </h4>
                                            <p align="center">
                                                <asp:Button id="SaveMe" onclick="SaveMe_Click" runat="server" Text="Save"></asp:Button>
                                            </p>
                                            <p align="center">
                                                <asp:Label id="Label1" runat="server" forecolor="Red"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
