<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<title>คอนโทรล CheckBoxList</title>
		<META http-equiv="Content-Type" content="text/html; charset=windows-874">
		<script language="JavaScript" type="text/JavaScript">
function openWin(theURL,winName,features) {
  	               window.open(theURL,winName,features);
}
//-->
		</script>
		<script runat="server">

Sub Page_Load()
   Dim myRow As DataRow

   If IsPostBack=False Then
	  '+++++++++database1
      Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myConnection As OleDbConnection = New OleDbConnection(connectionString)
      myConnection.Open()

      Dim selectStatement As String = "SELECT ratio.rationame,ratio.ratiovalue FROM RatioFromFactor INNER JOIN ratio ON RatioFromFactor.ratio = ratio.ratiovalue;"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myConnection)

      Dim myDataSet As New DataSet("subject")
      myAdapter.Fill(myDataSet, "subject")
      myConnection.Close
      'make link to explaination
      For Each myRow In myDataSet.Tables("subject").Rows
		myRow("rationame")= "<a href=http://161.246.6.197/ES/link/index.html>" & (myRow("rationame")) & "</a> "
      Next
	  'make link to explaination

      myCheckBox.DataSource = myDataSet
      myCheckBox.DataTextField = "rationame"
      myCheckBox.DataValueField = "ratiovalue"
      myCheckBox.DataBind
      '+++++++++++database2
      Dim ConnectionString2 As String ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myConnection2 As OleDbConnection = New OleDBConnection(ConnectionString2)
      myConnection2.Open
      Dim selectStatement2 As String ="SELECT bank.bankvalue, bank.bankname FROM bank;"
      Dim myAdapter2 As OleDbDataAdapter = New OleDBDataAdapter(selectStatement2,myConnection2)
      Dim myDataSet2 As New DataSet("subject")
      myAdapter2.Fill(myDataSet2,"subject")
      myConnection2.Close
      'make link to explaination
      For Each myRow In myDataSet2.Tables("subject").Rows
		myRow("bankname")= "<a href=http://161.246.6.197/ES/link/index.html>" & (myRow("bankname")) & "</a> "
      Next
	  'make link to explaination
      myCheckBox2.DataSource = myDataSet2
      myCheckBox2.DataTextField = "bankname"
      myCheckBox2.DataValueField = "bankvalue"
      myCheckBox2.DataBind
      '++++++++++++++ database3
      Dim ConnectionString3 As String ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myConnection3 As OleDbConnection = New OleDBConnection(ConnectionString3)
      myConnection3.Open
      Dim selectStatement3 As String ="SELECT method.methodname, method.methodvalue FROM method;"
      Dim myAdapter3 As OleDbDataAdapter = New OleDBDataAdapter(selectStatement3,myConnection3)
      Dim myDataSet3 As New DataSet("subject")
      myAdapter3.Fill(myDataSet3,"subject")
      myConnection3.Close
      'make link to explaination
      For Each myRow In myDataSet3.Tables("subject").Rows
		myRow("methodname")= "<a href=http://161.246.6.197/ES/link/index.html>" & (myRow("methodname")) & "</a> "
      Next
	  'make link to explaination
      myCheckBox3.DataSource = myDataSet3
      myCheckBox3.DataTextField = "methodname"
      myCheckBox3.DataValueField = "methodvalue"
      myCheckBox3.DataBind   
      End If
End Sub

Sub MainExpertSystem(o As Object,e As EventArgs)
'dim i as integer
'dim j as integer
Dim totalscore,score,percentile,i,j,ratio_number as integer
Dim temp_year2,base_year,sc(4),method1,method2,factor2,method,relation As Integer
dim year,temp,temp_year as string
dim value1,value2,value3 As String
Dim sc_bank(4),max_bank As Integer
' variable pass by get
Dim pass_method,pass_method1,pass_method2 As String
Dim relation1,relation2 As Integer
' variable explanation
Dim relational As Integer
Dim pass_ratio(20) As Integer
Dim pass_relation(20) As Integer
Dim pass_explain As String

temp_year = Cstr(predict_year2.SelectedItem.value )
year=Mid(temp_year,1,4)
year.trim
year = Cstr(CDbl(year)-1)
temp_year2 = CDbl(year)
base_year=CDbl(Mid(temp_year,5,1))
Redim sc(base_year)

advice.Text = " "
advice.Text &=  "<table border=1 align=center width=100% bgcolor=#CCFFFF>"
advice.Text &=		"<tr bgcolor=#0099FF>"
advice.Text &=			"<td align=center colspan=3><font color=gold><b>ระบบผู้เชี่ยวชาญแนะนำการลงทุนหลักทรัพย์</b></font></td>"
advice.Text &=		"</tr>"
advice.Text &=      "<tr><td>&nbsp;"
advice.Text &=		"</td></tr>"
advice.Text &=	"<tr><td>"
advice.Text &=	"<table border=1 width=100% id=table1>"
advice.Text &=		"<tr align=center bgcolor=#00CCFF>"
advice.Text &=			"<td width=25% bordercolor=#008000><b><font color=#FFFF99>ธนาคาร</font></b></td>"
advice.Text &=			"<td width=25% bordercolor=#008000><b><font color=#FFFF99>คะแนนความมั่นใจของธนาคาร</font></b></td>"
advice.Text &=			"<td width=25% bordercolor=#008000><b><font color=#FFFF99>คะแนนความเจริญเติบโตของธนาคาร</font></b></td>"
advice.Text &=			"<td width=25% bordercolor=#008000><b><font color=#FFFF99>คะแนนความน่าลงทุนในปีที่พยากรณ์</font></b></td>"
'-------------------- test 
sc_bank(1) = 0
sc_bank(2) = 0 
sc_bank(3) = 0
max_bank = 0
For i=0 To myCheckBox2.Items.Count - 1 'bank ?
temp_year2 = CDbl(year)		'set new year
If myCheckBox2.Items(i).Selected Then
	pass_explain = "http://localhost/ES/ratio/ratio_result.aspx?"
	advice.Text &= "<tr>"
	advice.Text &= "<td bordercolor=#0000FF>"& Cstr(mycheckbox2.Items(i).Text)&"</td>"
	totalscore=0
	score=0
	method1 = 0
	method2 = 0
	'-------find tatal score & score
		'temp_year2 = temp_year2-1	' count follow year
		For ratio_number=0 to myCheckBox.Items.Count-1
				pass_ratio(ratio_number) = 0
				pass_relation(ratio_number) = 0
			If myCheckBox.Items(ratio_number).Selected Then
				temp$= prepro2(totalscore,score,myCheckBox.Items(ratio_number).Value, myCheckBox2.Items(i).Value,year,relational) 
				
				pass_ratio(ratio_number) = 1
				pass_relation(ratio_number) = relational
				
				'-------------test relational-------------
				      	If ratio_number=0 then
							pass_explain &= "R_R1="& Cstr(relational) & "&"
						Else If ratio_number=1 then
							pass_explain &= "R_R2="& Cstr(relational) & "&"
						Else If ratio_number=2 then
							pass_explain &= "R_R3="& Cstr(relational) & "&"
						Else If ratio_number=3 then
							pass_explain &= "R_R4="& Cstr(relational) & "&"
						Else If ratio_number=4 then
							pass_explain &= "R_R5="& Cstr(relational) & "&"
						Else If ratio_number=5 then
							pass_explain &= "R_R6="& Cstr(relational) & "&"
						Else If ratio_number=6 then
							pass_explain &= "R_R7="& Cstr(relational) & "&"
						Else If ratio_number=7 then
							pass_explain &= "R_R8="& Cstr(relational) & "&"
						Else If ratio_number=8 then
							pass_explain &= "R_R9="& Cstr(relational) & "&"
						Else If ratio_number=9 then
							pass_explain &= "R_R10="& Cstr(relational) & "&"
						Else If ratio_number=10 then
							pass_explain &= "R_R11="& Cstr(relational) & "&"
						Else If ratio_number=11 then
							pass_explain &= "R_R12="& Cstr(relational) & "&"
						Else If ratio_number=12 then
							pass_explain &= "R_R13="& Cstr(relational) & "&"
						Else If ratio_number=13 then
							pass_explain &= "R_R14="& Cstr(relational) & "&"
						Else If ratio_number=14 then
							pass_explain &= "R_R15="& Cstr(relational) & "&"
						Else If ratio_number=15 then
							pass_explain &= "R_R16="& Cstr(relational) & "&"
						Else If ratio_number=16 then
							pass_explain &= "R_R17="& Cstr(relational) & "&"
						Else If ratio_number=17 then
							pass_explain &= "R_R18="& Cstr(relational) & "&"
						Else If ratio_number=18 then
							pass_explain &= "R_R19="& Cstr(relational) & "&"

						End If		
				'-------------end test relational---------
	
			Else 
				'-----------test
				 		If ratio_number=0 then
							pass_explain &= "R_R1="& "0" & "&"
						Else If ratio_number=1 then
							pass_explain &= "R_R2="& "0" & "&"
						Else If ratio_number=2 then
							pass_explain &= "R_R3="& "0" & "&"
						Else If ratio_number=3 then
							pass_explain &= "R_R4="& "0" & "&"
						Else If ratio_number=4 then
							pass_explain &= "R_R5="& "0" & "&"
						Else If ratio_number=5 then
							pass_explain &= "R_R6="& "0" & "&"
						Else If ratio_number=6 then
							pass_explain &= "R_R7="& "0" & "&"
						Else If ratio_number=7 then
							pass_explain &= "R_R8="& "0" & "&"
						Else If ratio_number=8 then
							pass_explain &= "R_R9="& "0" & "&"
						Else If ratio_number=9 then
							pass_explain &= "R_R10="& "0" & "&"
						Else If ratio_number=10 then
							pass_explain &= "R_R11="& "0" & "&"
						Else If ratio_number=11 then
							pass_explain &= "R_R12="& "0" & "&"
						Else If ratio_number=12 then
							pass_explain &= "R_R13="& "0" & "&"
						Else If ratio_number=13 then
							pass_explain &= "R_R14="& "0" & "&"
						Else If ratio_number=14 then
							pass_explain &= "R_R15="& "0" & "&"
						Else If ratio_number=15 then
							pass_explain &= "R_R16="& "0" & "&"
						Else If ratio_number=16 then
							pass_explain &= "R_R17="& "0" & "&"
						Else If ratio_number=17 then
							pass_explain &= "R_R18="& "0" & "&"
						Else If ratio_number=18 then
							pass_explain &= "R_R19="& "0" & "&"

						End If		
						'**************end test
			End If
		Next
		
		For ratio_number = 0 to myCheckBox.Items.Count-1
			pass_explain &= "pass_ratio" & Cstr(ratio_number+1) & "=" & Cstr(pass_ratio(ratio_number))
			pass_explain &= "&pass_relation" & Cstr(ratio_number+1) & "=" & Cstr(pass_relation(ratio_number)) & "&"
		Next
		
		
		
		'"http://161.246.6.197/ES/ratio/show_method.aspx?ratio1=0&relation1=0&ratio2=0&relation2="& Cstr(relation2)
		
	'-------end find tatal score & score
	'------- Set Score
		'temp_year2 = Cstr(year)
		For j=1 to base_year
		'temp_year2 = temp_year2-1	' count follow year

			totalscore = 0
			score = 0
			For ratio_number=0 to myCheckBox.Items.Count-1
				temp_year2 = temp_year2-1	' count follow year
				If myCheckBox.Items(ratio_number).Selected Then
					temp$= prepro2(totalscore,score,myCheckBox.Items(ratio_number).Value, myCheckBox2.Items(i).Value,Cstr(CDbl(year)-j+1),relational) 
				End If
			Next
			percentile = (score/totalscore)*100
			sc(j) = percentile
			
		Next
	'------- End Set Score
	'------- calculate for method1
		For j =1 to base_year
			method1 = method1 + sc(j)
		Next
		method1 = method1/base_year
		'set relation method 1
		method = 1
		value1 = 0
		If(method1>90) AND (method1<=100) then
			relation1 = 1
			value1 = 10
		Else If(method1>70) AND (method1<=90) then
			relation1 = 2
			value1 = 9
		Else If(method1>60) AND (method1<=70) then
			relation1 = 3
			value1 = 7
		Else If(method1>40) AND (method1<=60) then
			relation1 = 4			
			value1= 6
		Else If(method1>10) AND (method1<=40) then
			relation1 = 5			
			value1=4
		Else If(method1>0) AND (method1<=10) then
			relation1 = 6
			value1= 1
		End If
	'------- end calculate for method1
	'------- calculate for method2
		factor2 = 0 
		If CDbl(year)=2545 then
			method2 = 0
		Else If CDbl(year) > 2545 then
			If base_year >= 2
				for j=2 to base_year
					factor2 = factor2+sc(j) 'find before year
				Next
				factor2 = factor2/(base_year - 1)
				method2 = (sc(1)-factor2)/factor2*100	'find difference 
			Else IF base_year < 2 then
				method2 = 0
			End If
		End If
		'set relation method 1
		method = 2
		value2 = 0
		If(method2>3) then
			relation2 = 1
			value2 =10
		Else If(method2>=-10) AND (method2<=3) then
			relation2 = 2
			value2 = 7
		Else If(method2< -10) then
			relation2 = 3
			value2 = 4
		End If
	'------- end calculate for method2
	'--- part present all percentile 
	value3 = 0
	pass_method = "href=http://161.246.6.197/ES/ratio/show_method.aspx?"
	If myCheckBox3.Items(0).Selected AND (Not(myCheckBox3.Items(1).Selected)) then
		value3 = value1 * 10
		pass_method = "http://161.246.6.197/ES/ratio/show_method.aspx?ratio1=1&relation1="&Cstr(relation1)&"&ratio2=0&relation2=0"
	End If
	If myCheckBox3.Items(1).Selected AND (Not(myCheckBox3.Items(0).Selected)) then
		value3 = value2 * 10
		pass_method = "http://161.246.6.197/ES/ratio/show_method.aspx?ratio1=0&relation1=0&ratio2=0&relation2="& Cstr(relation2)

	End If
	If myCheckBox3.Items(0).Selected AND myCheckBox3.Items(1).Selected then
		If base_year < 2 then
			value3 = value1 * 10
		Else If base_year >= 2 then
			value3 = ((70*value1)+(30*value2))/10
		End If
		pass_method = "http://161.246.6.197/ES/ratio/show_method.aspx?ratio1=1&relation1="&Cstr(relation2)&"&ratio2=2&relation2="& Cstr(relation2)
	End If
	sc_bank(i) = value3
	'--- part present all percentile 
	advice.Text &= "<td bordercolor=#FFD700 align=center>&nbsp;"
	If myCheckBox3.Items(0).Selected Then
		advice.Text &= " ค่าความมั่นใจ <br>  "&Cstr(value1*10) &" %"
	End If
	advice.Text &= "</td><td bordercolor=#FFD700 align=center>&nbsp;"
	If myCheckBox3.Items(1).Selected Then
		advice.Text &= " ค่าความเจริญเติบโต <br>  "& Cstr(value2*10) &" %"
	End If
	advice.Text &= "</td>"
	
	
	advice.Text &= "<td bordercolor=#FFD700 align=center bgcolor=#FFFFFF align=center>"&"นำความน่าลงทุนในปีที่พยากรณ์ "&Cstr(value3)&"% "
	advice.Text &= "<br>[<a href=" & pass_method & " target=blank>"
	advice.Text &= "<img src=http://161.246.6.197/ES/ratio/images/explain.jpg width=96 height=22 border=0>"
	advice.Text &= "</a>]"
	advice.Text &= "</td></tr>"
	advice.Text &=  graph(i+1,value3)
	
	advice.Text &= "<tr align=center bgcolor=#FFDEDF bordercolor=#FF3300 ><td align=center colspan=4 >ระบบผู้เชี่ยววิเคราะห์ส่วนข้อมูลงบการเงิน" & Cstr(mycheckbox2.Items(i).Text)
	advice.Text &= "<br>[<a href=" & pass_explain & " target=blank>"
	'-----test link popup--------
	'	advice.Text &= "<br>[<a href=JavaScript:openWin("& pass_explain &",Spiderman,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=370,height=335)  onMouseOut=MM_swapImgRestore();>"
	'-----end link popup
	advice.Text &= "<img src=http://161.246.6.197/ES/ratio/images/explain3.jpg width=96 height=22 border=0>"
	advice.Text &= "</a>]"
	advice.Text &= "</td></tr>"

End If
Next
'--------------------- end test
advice.Text &=		"</tr>"
advice.Text &=	"</table>"
advice.Text &=	"</td></tr>"
' - - -test
If sc_bank(0)>=sc_bank(1) AND sc_bank(0) >= sc_bank(2) then
	max_bank = 0
End If
If sc_bank(1)>= sc_bank(0) AND sc_bank(1) >= sc_bank(2) then
	max_bank =1
End If
If sc_bank(2) >= sc_bank(0) AND sc_bank(2) >= sc_bank(1) then 
	max_bank =2
End If
' - - - end test

advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(max_bank).Text & "ได้ผลกำไรสูงสุด</tr></td>"
If max_bank = 0 then 
	If sc_bank(0) = sc_bank(1) then
		advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(1).Text & "ได้ผลกำไรสูงสุด</tr></td>"
	End If
	If sc_bank(0) = sc_bank(2) then
		advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(2).Text & "ได้ผลกำไรสูงสุด</tr></td>"			
	End If
End If
If max_bank = 1 then 
	If sc_bank(1) = sc_bank(0) then
		advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(0).Text & "ได้ผลกำไรสูงสุด</tr></td>"
	End If
    If sc_bank(1) = sc_bank(2) then
		advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(2).Text & "ได้ผลกำไรสูงสุด</tr></td>"			
	End If	
End If
If max_bank = 2 then 
	If sc_bank(2) = sc_bank(0) then
		advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(0).Text & "ได้ผลกำไรสูงสุด</tr></td>"
	End If
	If sc_bank(2) = sc_bank(1) then
		advice.Text &= "<tr><td> ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์ของ " & mycheckbox2.Items(1).Text & "ได้ผลกำไรสูงสุด</tr></td>"			
	End If
End If
advice.Text &=	"<table>"		
End Sub

'-============End Include Expert System ==========
Sub showSelection(o As Object, e As EventArgs)
   Dim i As Integer
   Dim count As Integer
   Dim temp2 As String
   myLabel.Text = ""
   count = 0
   myLabel.Text &= "<table  border=1>"
   myLabel.Text &= namebank(1)
   Dim score As Integer = 0
   Dim totalsc As Integer = 0
   Dim relational As Integer= 0
  For i=0 To myCheckBox.Items.Count - 1
        If myCheckBox.Items(i).Selected Then	
				'------------------program color ------------
				If (count mod 2) = 0 Then
					myLabel.Text &= "<tr bgcolor=#FFFF99><td>"
				Else 
					myLabel.Text &= "<tr bgcolor=#CCFF99><td>"
				End If
				count +=1
				'------------------End program color --------
            myLabel.Text &= myCheckBox.Items(i).Text 
            myLabel.Text &= "</td><td>"
            myLabel.Text &= " value = "
            myLabel.Text &= myCheckBox.Items(i).Value & "<br />"
            myLabel.Text &= prepro2(totalsc,score,myCheckBox.Items(i).Value,1,2545,relational)
			myLabel.Text &= "</td></tr>"
			
         End If
   Next
	myLabel.Text &= totalscore(1,score)
	Dim percentile As Integer
	percentile = (score/totalsc)*100
	'myLabel.Text &= "<tr><td>" & Cstr(totalsc) &"aabbcc" & CStr(percentile) & "</tr></td>"
	myLabel.Text &= graph(1,percentile)
	myLabel.Text &= "</table>"
	
End Sub



Function namebank(ratio As Integer)
'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT  * FROM bank WHERE (((bank.bankvalue)="
      selectStatement &= CStr(ratio) & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("bank")
      myAdapter.Fill(mySet, "bank")
      myconn.Close
    '++++++++End Set DB ++++++++++++++++  
      Dim temp As String
	  temp &= "<tr  bgcolor=#33CCFF ><td colspan=6 align=center bordercolordark=#006600 ><font color=#CC3300><b>รายระเอียดของแบงค์"
      For Each myRow In mySet.Tables("bank").Rows
		temp &= (myRow("bankname"))
		temp &= "</font></b></td>"
		ratio=1	
      Next
      temp &="</tr>"
    '------- for return value		
	return temp
'Sub prepro2(ratio As Integer)
End Function

Function totalscore(ratio As Integer,score As Integer)
'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT  * FROM bank WHERE (((bank.bankvalue)="
      selectStatement &= CStr(ratio) & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("bank")
      myAdapter.Fill(mySet, "bank")
      myconn.Close
    '++++++++End Set DB ++++++++++++++++  
      Dim temp As String
	  temp &= "<tr  bgcolor=#33CCFF ><td colspan=6 align=center bordercolordark=#006600 ><font color=#CC3300>รายระเอียดของแบงค์"
      For Each myRow In mySet.Tables("bank").Rows
		temp &= (myRow("bankname"))
		temp &= "มีคะแนนเท่ากับ  " + CStr(score)
		temp &= "</font></td>"
		ratio=1	
      Next
      temp &="</tr>"
    '------- for return value		
	return temp
'Sub prepro2(ratio As Integer)
End Function

Function graph(ratio As Integer,score As Integer)
'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT  * FROM bank WHERE (((bank.bankvalue)="
      selectStatement &= CStr(ratio) & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("bank")
      myAdapter.Fill(mySet, "bank")
      myconn.Close
    '++++++++End Set DB ++++++++++++++++  
      Dim temp As String
	  temp &= "<tr bgcolor=#BEB495><td colspan=6 align=center bordercolordark=#006600>รายระเอียดของแบงค์"
      For Each myRow In mySet.Tables("bank").Rows
		temp &= (myRow("bankname")) 
		temp &= "มีเปอร์เซ็นความน่าลงทุนทั้งหมดเท่ากับ  " & CStr(score) & "%<br>"
      Next
      '----------test program
      temp &= "<table width=100% border=0 cellpadding=0 cellspacing=0>"
	  temp &= "<tr><td width=80% align=left valign=baseline>"
      
      temp &= "<table width=100% border=1 cellpadding=0 cellspacing=0 height=10 border = 1 >"
	  temp &= "		<tr ><td height=10    bgcolor=#FFFFFF>"
	  temp &= "			<table width="&CStr(score)&"% border=0 cellpadding=0 cellspacing=0 height=10></tr><tr>"
	  temp &= "			<td height=10 bgcolor=#0033FF></td></tr></table>"
	  temp &= "		</td></tr>"
	  temp &= "</table>"
	  temp &= "</td>"
      
      
	  'temp &= "<table width="&CStr(score)&"% border=0 cellpadding=0 cellspacing=0></tr>"
	  'temp &= "<tr><td height=12 bgcolor=#0033FF></td></tr></table></td>"
	  
	  temp &= "<td align=right valign=baseline class=small><strong>"&Cstr(score)&" %</strong></td></tr></table>"
      '---------- end test program
      temp &="</td></tr>"
    '------- for return value		
	return temp
'Sub prepro2(ratio As Integer)
End Function

Function prepro2(ByRef totalsc As Integer,ByRef score2 As Integer,ratio As Integer,bank_value As Integer,year As string,ByRef relational As Integer)
	'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT preprocessing2.* FROM preprocessing2 WHERE  (((preprocessing2.bank)=" 
      selectStatement &= Cstr(bank_value)
      'selectStatement &= "3"
      selectStatement &= ") AND ((preprocessing2.report)="& year &") AND ((preprocessing2.ratio)=" 
      selectStatement &= ratio & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("prepro2")
      myAdapter.Fill(mySet, "prepro2")
      myconn.Close
	 
    '++++++++End Set DB ++++++++++++++++  
      Dim temp As String
      For Each myRow In mySet.Tables("prepro2").Rows
		temp &= "<td>&nbsp;relation = " 
		temp &= (myRow("relation"))
		
		relational = (myRow("relation"))
		temp &= "</td>"
		'temp &= relation(myRow("relation"))
		ratio=1
		temp &= rule(totalsc,score2,myRow("relation"),ratio)
      Next
      
    '------- for return value
    
	return temp
End Function

Function relation(ratio As Integer)
	'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT * FROM relation WHERE (((relation.relationvalue)="

      selectStatement &= ratio & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
		
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("relationword")
      myAdapter.Fill(mySet, "relationword")
      myconn.Close
	  
    '++++++++End Set DB ++++++++++++++++  
      Dim temp As String
      For Each myRow In mySet.Tables("relationword").Rows
		temp &= "<td>&nbsp; What's means = "
		temp &= (myRow("relationword"))
		temp &= "</td>"
		'temp &= relatio(myRow("relation"))
      Next
    '------- for return value
	return temp
End Function

Function rule(ByRef totalsc As Integer,ByRef score3 As Integer,relation As Integer,ratio As Integer)
Dim rate as integer
	'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT * FROM rule WHERE (((rule.relation)="
      selectStatement &= relation & ") AND ((rule.ratio)="
      selectStatement &= ratio & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
		
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("relationword")
      myAdapter.Fill(mySet, "relationword")
      myconn.Close
	'++++++++++++ Set DB2 ++++++++++++++++
      Dim myconn2 As OleDbConnection = New OleDbConnection(myconnstr)
      myconn2.Open()
	  Dim selectStatement2 As String = "SELECT rule.ratio, Max(rule.score) AS MaxOfscore FROM rule GROUP BY rule.ratio HAVING ((rule.ratio)=" 
      selectStatement2 &= CStr(ratio) 
      selectStatement2 &= ");"
	  Dim myAdapter2 As OleDbDataAdapter = New OleDbDataAdapter(selectStatement2, myconn2)
	  Dim myRow2 As DataRow
	  Dim TotalRec2 As Integer
      Dim mySet2 As New DataSet("total")
      myAdapter2.Fill(mySet2,"total")
      myconn2.Close
    '++++++++End Set DB2 ++++++++++++++++  
    '++++++++++++ Set DB3 ++++++++++++++++
      Dim myconn3 As OleDbConnection = New OleDbConnection(myconnstr)
      myconn3.Open()
	  Dim selectStatement3 As String = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)="
      selectStatement3 &= CStr(ratio) 
      selectStatement3 &= "));"
	  Dim myAdapter3 As OleDbDataAdapter = New OleDbDataAdapter(selectStatement3, myconn3)
	  Dim myRow3 As DataRow
	  Dim TotalRec3 As Integer
      Dim mySet3 As New DataSet("total")
      myAdapter3.Fill(mySet3,"total")
      myconn3.Close
      
     For Each myRow3 In mySet3.Tables("total").Rows
       rate= myRow3("weight")
      Next

      
    '++++++++End Set DB3 ++++++++++++++++  

      Dim temp As String
      For Each myRow In mySet.Tables("relationword").Rows
		temp &= "<td>&nbsp; What's score = "
		temp &= (myRow("score"))
		score3 = score3+ ((rate * myRow("score"))/100)
		temp &= "</td>"
		temp &= "<td>&nbsp; What's explain = "
		temp &= (myRow("explainword"))
		temp &= "</td>"
		'temp &= explain(myRow("relation"))
      Next
      
      For Each myRow2 In mySet2.Tables("total").Rows
		totalsc = totalsc + ((rate* myRow2("MaxOfscore"))/100)
      Next
    '------- for return value
	return temp
End Function

Function explain(explainvalue As Integer)
	'++++++++Set DB ++++++++++++++++
	  Dim myconnstr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myconn As OleDbConnection = New OleDbConnection(myconnstr)
      myconn.Open()
      Dim selectStatement As String = "SELECT *FROM explain WHERE (((explain.explainvalue)="
      selectStatement &= explainvalue & "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myconn)
		
	  Dim myRow As DataRow
	  Dim TotalRec As Integer
      Dim mySet As New DataSet("relationword")
      myAdapter.Fill(mySet, "relationword")
      myconn.Close
	  
    '++++++++End Set DB ++++++++++++++++  
      Dim temp As String
      For Each myRow In mySet.Tables("relationword").Rows
		temp &= "<td>&nbsp; What's explainword = "
		temp &= (myRow("explainword"))
		temp &= "</td>"
      Next
    '------- for return value
	return temp
End Function
'********************
Sub ShowSelection2(o As Object, e As EventArgs)
End Sub
'**********************
Sub ShowSelection3(o As Object, e As EventArgs)
End Sub

		</script>
	</HEAD>
	<body>
		<form runat="server" ID="Form1">
			<table border="1" align="center" width="100%" bgcolor="seashell">
				<tr bgcolor="darkblue">
					<td align="center" colspan="3"><font color="gold"><b>ระบบผู้เชี่ยวชาญวิเคราะห์หลักทรัพย์</b></font></td>
				</tr>
				<tr>
					<td width="65%" rowspan="3">
						<table border="1" align="center" width="100%">
							<tr bgcolor="blue">
								<td align="center"><font color="silver" size="1"><b>อัตราส่วนคงที่ที่ใช้ของกลุ่มธนาคาร</b></font></td>
							</tr>
							<tr>
								<td bgcolor="seashell">
									<asp:CheckBoxList id="myCheckBox" CellPadding="1" CellSpacing="1" RepeatColumns="1" RepeatDirection="Vertical"
										RepeatLayout="Table" TextAlign="Right" OnSelectedIndexChanged="MainExpertSystem" runat="server" />
								</td>
							</tr>
						</table>
					</td>
					<td width="45%" valign="top">
						<table border="1" align="center" width="100%" height="100%">
							<tr bgcolor="blue">
								<td align="center"><font color="silver" size="1"><b>กลุ่มธนาคาร</b></font></td>
							</tr>
							<tr>
								<td bgcolor="seashell">
									<asp:CheckBoxList id="myCheckBox2" CellPadding="1" CellSpacing="1" RepeatColumns="1" RepeatDirection="Vertical"
										RepeatLayout="Table" TextAlign="Right" OnSelectedIndexChanged="MainExpertSystem" runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<table border="1" align="center" width="100%" height="100%">
							<tr bgcolor="blue">
								<td align="center"><font color="silver" size="1"><b>พยากรณ๊ปี</b></font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="seashell">
									<asp:DropDownList id="predict_year2" runat="server" OnSelectedIndexChanged="MainExpertSystem">
										<asp:ListItem Selected="True" Value="25461">ปี 2546 - - ปีฐาน 1 ปี - -</asp:ListItem>
										<asp:ListItem Value="25471">ปี 2547 - - ปีฐาน 1 ปี - -</asp:ListItem>
										<asp:ListItem Value="25472">ปี 2547 - - ปีฐาน 2 ปี - -</asp:ListItem>
										<asp:ListItem Value="25481">ปี 2548 - - ปีฐาน 1 ปี - -</asp:ListItem>
										<asp:ListItem Value="25482">ปี 2548 - - ปีฐาน 2 ปี - -</asp:ListItem>
										<asp:ListItem Value="25483">ปี 2548 - - ปีฐาน 3 ปี - -</asp:ListItem>
										<asp:ListItem Value="25491">ปี 2549 - - ปีฐาน 1 ปี - -</asp:ListItem>
										<asp:ListItem Value="25492">ปี 2549 - - ปีฐาน 2 ปี - -</asp:ListItem>
										<asp:ListItem Value="25493">ปี 2549 - - ปีฐาน 3 ปี - -</asp:ListItem>
										<asp:ListItem Value="25494">ปี 2549 - - ปีฐาน 4 ปี - -</asp:ListItem>
									</asp:DropDownList>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="top">
					<td>
						<table border="1" align="center" width="100%" height="100%">
							<tr bgcolor="blue">
								<td align="center"><font color="silver" size="1"><b>แนวโน้มการลงทุนที่ใช้วิเคราะห์</b></font></td>
							</tr>
							<tr>
								<td align="center" bgcolor="seashell">
									<asp:CheckBoxList id="myCheckBox3" CellPadding="1" CellSpacing="1" RepeatColumns="1" RepeatDirection="Vertical"
										RepeatLayout="Table" TextAlign="Right" OnSelectedIndexChanged="MainExpertSystem" runat="server"></asp:CheckBoxList>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<hr>
			คุณต้องการใช้ตัวแปรพวกนี้ในการคำนวณ
			<asp:Button Text="Submit" runat="server" ID="Button1" />
			<br>
			<hr>
			<asp:Label id="myLabel" runat="server" />
			<asp:Label id="advice" Runat="server" />
		</form>
	</body>
</HTML>
