<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus


    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession()
            Requests()
            Search()
            History()
            edit()

            menu1.visible = false
            menu2.visible = true
            menu3.visible = false
            menu4.visible = false
            ShowUser.Text = UName
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

    'end sub in this page
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

    Sub Button1_Click(sender As Object, e As EventArgs)
         '''''''''''start'''''''''code Best Solve''''''''''''''''''''''
                                 'Dim Doublepost As String = str(22)
                                 Dim A_Repla() As String = {".","!","?",",",":","(",")","{","}","\","/","=",">","<","&"}
                                 Dim A_Stopword() As String = {"0","1","2","3","4","5","6","7","8","9","a","about","above","according","across","actually","adj","after","afterwards","again","against","all","almost","alone","along","already","also","although","always","among","amongst","an","and","another","any","anyhow","anyone","anything","anywhere","are","aren't","around","as","at","b","be","became","because","become","becomes","becoming","been","before","beforehand","begin","beginning","behind","being","below","beside","besides","between","beyond","billion","both","but","by","c","can","can't","cannot","caption","co","co.","could","couldn't","d","did","didn't","do",    "does","doesn't","don't","down","during","e","each","eg","eight","eighty","either","else","elsewhere","end","ending","enough","etc","even","ever","every","everyone","everything", "everywhere","except","f","few","fifty","first","five","for","former","formerly","forty","found", "","four","from","further","g","h","had","has","hasn't","have","haven't","he","he'd","he'll","he's","hence","her","here","here's","hereafter","hereby","herein","hereupon","hers","herself","him","himself","his","how","however","hundred","i","i'd","i'll","i'm","i've","ie","if","in","inc.","indeed","instead","into","is","isn't","it","it's","its","itself","j","k","l","last","later","latter","latterly","least","less","let","let's","like","likely","ltd","m","made","make","makes","many","maybe","me","meantime","meanwhile","might","million","miss","more","moreover","most","mostly","mr","mrs","much","must","my","myself","n","namely","neither","never","nevertheless","next","nine","ninety","no","nobody","none","nonetheless","noone","nor","of","often","on","once","one","one's","only","onto","or","other","others","otherwise","our","ours","ourselves","out","over","overall","own","p","per","perhaps","q","r","rather","recent","recently","s","same","seem","seemed","seeming","seems","seven","seventy","several","she","she'd","she'll","she's","should","shouldn't","since","six","sixty","so","some","somehow","someone","something","sometime","sometimes","somewhere","still","stop","such","t","taking","ten","than","that","that'll","that's","that've","the","their","them","themselves","then","thence","there","there'd","there'll","there're","there's","there've","thereafter","thereby","therefore","therein","thereupon","these","they","they'd","they'll","they're","they've","thirty","this","those","though","thousand","three","through","throughout","thru","thus","to","together","too","toward","towards","trillion","twenty","two","u","under","unless","unlike","unlikely","until","up","upon","us","use","used","using","v","very","via","w","was","wasn't","we","we'd","we'll","we're","we've","well","were","weren't","what","what'll","what's","what've","whatever","when","whence","whenever","where","where's","whereafter","whereas","whereby","wherein","whereupon","wherever","whether","which","while","whither","who","who'd","who'll","who's","whoever","whole","whom","whomever","whose","why","will","with","within","without","won't","would","wouldn't","x","y","yes","yet","you","you'd","you'll","you're","you've","your","yours","yourself","yourselves","z"}
                                 Dim TempSolve() As String

                                 '''''''''Split query.text''''''''''''
                                 Dim tempquery As String = query.Text
                                 Dim i As Integer
                                 Dim j As Integer
                                 Dim k As Integer
                                 Dim num_insert As Integer
                                 Dim Dataset1 As New DataSet
                                 Dim Dataset2 As new dataset
                                 '''''''''''cut Replace''''''''''''''''''''''''
                                 for i = 0 to UBound(A_Repla)
                                     tempquery = Replace(tempquery,A_Repla(i)," ")
                                 next

                                 TempSolve = Split(LCase(tempquery))
                                 '''''''''''''''''Cut stopword''''''''''''''''''
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

                                '''''''find tf-idf of query'''''''''''''''''''''
                                Dim Temp_keyword_query() As string
                               '' Dim Freq_Freq1_query(99999) As integer  '''''''Freq_Index in each keyword_solve
                                Temp_keyword_query = Split(LTrim(TempSolve1))
                                Dataset2 = RetureIndexAll

                                '''''''''tf'''''''''
                                Dim Freq_index_query(Dataset2.tables(0).Rows.Count()) As integer '''''''Index_ID
                                for j=0 to Ubound(temp_keyword_query)
                                    Freq_index_query(CheckSuffix_ReturnIndexID(Temp_keyword_query(j)))=Freq_index_query(CheckSuffix_ReturnIndexID(Temp_keyword_query(j)))+1
                                next

                                Dim Max_tf_query As integer =0
                                for j = 1 to Dataset2.tables(0).Rows.Count()
                                    if Freq_index_query(j)>=max_tf_query then
                                        Max_tf_query = Freq_index_query(j)
                                    end if
                                next

                                Dim tf_query(Dataset2.tables(0).Rows.Count()) AS double
                                for j = 1 to Dataset2.tables(0).Rows.Count()
                                    tf_query(j) = Freq_index_query(j) / Max_tf_query
                                next

                               ' Dataset1 = ReturnKeyWordSolveID()
                                Dim tf_idf_query(Dataset2.tables(0).Rows.Count()) As double
                                Dataset2 = ReturnFreqAll()
                                for j = 1 to Dataset2.tables(0).Rows.Count()
                                    if (tf_query(j)<>0) then
                                        tf_idf_query(j) = tf_query(j) * (math.log(100/Dataset2.Tables(0).Rows(j-1)(0)))
                                    end if
                                next

                                '''''''''find tf-idf of solve'''''''''''''''''''''
                                Dim Temp_keyword() As string
                                Dataset1 = ReturnKeyWordSolveID()
                                Dataset2 = RetureIndexAll
                                Dim Sim(Dataset1.tables(0).Rows.Count()) As double
                                Dim order(Dataset1.tables(0).Rows.Count()) As integer
                                for i = 0 to Dataset1.tables(0).Rows.Count()-1
                                    Dim temp As String = Dataset1.Tables(0).Rows(i)(1)
                                    Temp_keyword = Split(LTrim(temp))
                                    ''''''''tf'''''''''
                                    Dim Freq_index(Dataset2.tables(0).Rows.Count()) As integer '''''''Index_ID
                                    for j=0 to Ubound(temp_keyword)
                                        Freq_index(CheckSuffix_ReturnIndexID(Temp_keyword(j)))=Freq_index(CheckSuffix_ReturnIndexID(Temp_keyword(j)))+1
                                    next

                                    Dim Max_tf As integer =0
                                    for j = 1 to Dataset2.tables(0).Rows.Count()
                                        if Freq_index(j)>=max_tf then
                                            Max_tf = Freq_index(j)
                                        end if
                                    next

                                    Dim tf(Dataset2.tables(0).Rows.Count()) AS double
                                    for j = 1 to Dataset2.tables(0).Rows.Count()
                                        tf(j) = Freq_index(j) / Max_tf
                                    next

                                    Dim tf_idf(Dataset2.tables(0).Rows.Count()) As double
                                    Dataset2 = ReturnFreqAll()
                                    for j = 1 to Dataset2.tables(0).Rows.Count()
                                        if (tf(j)<>0) then
                                            tf_idf(j) = tf(j) * (math.log(100/Dataset2.Tables(0).Rows(j-1)(0)))
                                        end if
                                    next


                                    ''''''''find Sim between query and each solve
                                    Dim a As double=0 :Dim b As double =0: Dim c As double=0
                                    for j = 1 to Dataset2.tables(0).Rows.Count()
                                        if (tf_idf(j)<>0) and (tf_idf_query(j)<>0) then
                                            a = a+ (tf_idf_query(j)* tf_idf(j))
                                        end if
                                        if (tf_idf(j)<>0)
                                            b = b + (tf_idf(j)*tf_idf(j))
                                        end if
                                        if (tf_idf_query(j)<>0)
                                            c = c + (tf_idf_query(j)*tf_idf_query(j))
                                        end if

                                    next
                                        sim(i+1)=  a/math.sqrt(b*c)
                                        order(i+1) = i

                              next

                                                  Dim tempsim As double

                        for i = 1 to Dataset1.tables(0).Rows.Count()
                            for j = 1 to Dataset1.tables(0).Rows.Count()
                                if(sim(i)>sim(j)) then
                                    tempsim = sim(j)
                                    sim(j) = sim(i)
                                    sim(i) =tempsim

                                    tempsim = order(j)
                                    order(j) = order(i)
                                    order(i) = tempsim
                                end if
                            next
                        next

                    ListBoxSolve.Items.Clear()
                    For i = 1 To UBound(sim)
                        if(order(i)<>0) then
                            ListBoxSolve.Items.Add("Solve"+order(i).tostring +" ( " + int(sim(i)*100).tostring+"% )")
                        end if
                    Next i
               End Sub


    Sub ListBoxSolve_SelectedIndexChanged(sender As Object, e As EventArgs)
        textboxSolve.text = ""
        Dim solve As string
        solve = ListBoxSolve.SelectedItem.Value().ToString
        Dim A_Solve() As String = split(solve)
        Dim Solve_Num As integer
        Solve_Num = int(Replace(A_Solve(0),"Solve",""))

        Dim Dataset1 As New Dataset
        Dataset1 = ReturnSolve_SentSolveID(Solve_Num)
        textboxSolve.text = Dataset1.tables(0).Rows(0)(0)
    End Sub

                         '''''''''''code best Solve (again)


    Function ReturnSolve_SentSolveID(ByVal solve_ID As Decimal) As System.Data.DataSet
        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

        Dim queryString As String = "SELECT [T_Solve].[Solve] FROM [T_Solve] WHERE ([T_Solve].[Solve_ID] = @Solve_ID)"
        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection

        Dim dbParam_solve_ID As System.Data.IDataParameter = New System.Data.SqlClient.SqlParameter
        dbParam_solve_ID.ParameterName = "@Solve_ID"
        dbParam_solve_ID.Value = solve_ID
        dbParam_solve_ID.DbType = System.Data.DbType.Decimal
        dbCommand.Parameters.Add(dbParam_solve_ID)

        Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = dbCommand
        Dim dataSet As System.Data.DataSet = New System.Data.DataSet
        dataAdapter.Fill(dataSet)

        Return dataSet
    End Function

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

    ' MY Change

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
    <center><asp:Label id="Label1" visible="false" runat="server"></asp:Label><asp:Label id="Label2" visible="false" runat="server"></asp:Label><asp:Label id="dir_sort" visible="false" runat="server"></asp:Label>
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
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font>&nbsp;</font></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader_admin.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                        </td>
                                                        <td align="middle">
                                                            <asp:Label id="due" runat="server" font-names="Comic Sans MS" forecolor="Yellow"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" font-names="Comic Sans MS" forecolor="Yellow"></asp:Label>&nbsp;</td>
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
                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" Width="37px" Height="33px" src="images/commond/images03.gif" AlternateText="Logout"></asp:ImageButton>
                            <br />
                            <font face="Comic Sans MS" color="#ffff00">Logout</font>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                                &nbsp;&nbsp;&nbsp;
                                <br />
                                <asp:TextBox id="query" runat="server" Width="143px" Height="25px"></asp:TextBox>
                                <asp:Button id="Button2" onclick="Button1_Click" runat="server" Text="Search"></asp:Button>
                            </p>
                            <p>
                                <asp:ListBox id="ListBoxSolve" runat="server" Width="217px" Height="216px" AutoPostBack="True" OnSelectedIndexChanged="ListBoxSolve_SelectedIndexChanged"></asp:ListBox>
                                <asp:TextBox id="TextBoxSolve" runat="server" Width="320px" Height="217px" TextMode="MultiLine"></asp:TextBox>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
