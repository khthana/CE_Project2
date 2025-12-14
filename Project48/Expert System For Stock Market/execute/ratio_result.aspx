<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" type="text/JavaScript">
function openWin(theURL,winName,features) {
  	               window.open(theURL,winName,features);
}
//-->
</script>
<script runat="server">
Sub Page_Load()
   Dim myRow As DataRow

	  '+++++++++database1
      Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myConnection As OleDbConnection = New OleDbConnection(connectionString)
      myConnection.Open()
      Dim selectStatement As String = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=1));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myConnection)
      Dim myDataSet As New DataSet("subject")
      myAdapter.Fill(myDataSet, "subject")
      myConnection.Close
      For Each myRow In myDataSet.Tables("subject").Rows
      rate1.Text = myRow("weight")
      Next
      
      myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=2));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate2.Text = myRow("weight")
      Next

	  myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=3));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate3.Text = myRow("weight")
      Next

      myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=4));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate4.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=5));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate5.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=6));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate6.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=7));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate7.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=8));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate8.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=9));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate9.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=10));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate10.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=11));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate11.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=12));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate12.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=13));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate13.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=14));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate14.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=15));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate15.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=16));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate16.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=17));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate17.Text = myRow("weight")
      Next
      
            myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=18));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate18.Text = myRow("weight")
      Next
      
      myConnection.Open()
      selectStatement = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=19));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet,"subject")
	  myConnection.Close
	  For Each myRow In myDataSet.Tables("subject").Rows
      rate19.Text = myRow("weight")

      Next
   
	'-------------------- show explaination ------------
Dim R_R As Integer
Dim myDataSet2 As New DataSet("subject2")
   Dim R_R1 As String = Request.QueryString("R_R1")
   Dim R_R2 As String = Request.QueryString("R_R2")
   Dim R_R3 As String = Request.QueryString("R_R3")
   Dim R_R4 As String = Request.QueryString("R_R4")
   Dim R_R5 As String = Request.QueryString("R_R5")
   Dim R_R6 As String = Request.QueryString("R_R6")
   Dim R_R7 As String = Request.QueryString("R_R7")
   Dim R_R8 As String = Request.QueryString("R_R8")
   Dim R_R9 As String = Request.QueryString("R_R9")
   Dim R_R10 As String = Request.QueryString("R_R10")
   Dim R_R11 As String = Request.QueryString("R_R11")
   Dim R_R12 As String = Request.QueryString("R_R12")
   Dim R_R13 As String = Request.QueryString("R_R13")
   Dim R_R14 As String = Request.QueryString("R_R14")
   Dim R_R15 As String = Request.QueryString("R_R15")
   Dim R_R16 As String = Request.QueryString("R_R16")
   Dim R_R17 As String = Request.QueryString("R_R17")
   Dim R_R18 As String = Request.QueryString("R_R18")
   Dim R_R19 As String = Request.QueryString("R_R19")
   
'Dim R_R1,R_R2,R_R3,R_R4,R_R5,R_R6,R_R7,R_R8,R_R9,R_R10,R_R11,R_R12,R_R13,R_R14,R_R15,R_R16,R_R17,R_R18,R_R19 AS String
'R_R1="1"
'R_R2="1"
'R_R3="1"
'R_R4="1"
'R_R5="1"
'R_R6="1"
'R_R7="1"
'R_R8="1"
'R_R9="1"
'R_R10="1"
'R_R11="1"
'R_R12="1"
'R_R13="1"
'R_R14="1"
'R_R15="1"
'R_R16="1"
'R_R17="1"
'R_R18="1"
'R_R19="1"
For R_R=1 To 19
	  myConnection.Open()
      selectStatement = "SELECT rule.*, * FROM rule WHERE (((rule.ratio)=" & CStr(R_R) 
      selectStatement &= ") AND ((rule.relation)="
      		If R_R=1 then
      			If Not(R_R1= "0") then
				 selectStatement &= R_R1
				Else
				 selectStatement &= "1"
				End If
			Else If R_R=2 then
      			If Not(R_R2= "0") then
				 selectStatement &= R_R2
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=3 then
      			If Not(R_R3= "0") then
				 selectStatement &= R_R3
				Else
				 selectStatement &= "1"
				End If					
			Else If R_R=4 then
				If Not(R_R4= "0") then
				 selectStatement &= R_R4
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=5 then
				 If Not(R_R5= "0") then
				 selectStatement &= R_R5
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=6 then
				 If Not(R_R6= "0") then
				 selectStatement &= R_R6
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=7 then
				 If Not(R_R7= "0") then
				 selectStatement &= R_R7
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=8 then
				 If Not(R_R8= "0") then
				 selectStatement &= R_R8
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=9 then
				 If Not(R_R9= "0") then
				 selectStatement &= R_R9
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=10 then
				 If Not(R_R10= "0") then
				 selectStatement &= R_R10
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=11 then
				 If Not(R_R11= "0") then
				 selectStatement &= R_R11
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=12 then
				 If Not(R_R12= "0") then
				 selectStatement &= R_R12
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=13 then
				 If Not(R_R13= "0") then
				 selectStatement &= R_R13
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=14 then
				 If Not(R_R14= "0") then
				 selectStatement &= R_R14
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=15 then
				 If Not(R_R15= "0") then
				 selectStatement &= R_R15
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=16 then
				 If Not(R_R16= "0") then
				 selectStatement &= R_R16
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=17 then
				 If Not(R_R17= "0") then
				 selectStatement &= R_R17
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=18 then
				If Not(R_R18= "0") then
				 selectStatement &= R_R18
				Else
				 selectStatement &= "1"
				End If			
			Else If R_R=19 then
				 If Not(R_R19= "0") then
				 selectStatement &= R_R19
				Else
				 selectStatement &= "1"
				End If			
			End If		
      selectStatement &= "));"
      myAdapter = New OleDbDataAdapter(selectStatement,myConnection)
	  myAdapter.Fill(myDataSet2,"subject2")
	  myConnection.Close
	  
	  
	  For Each myRow In myDataSet2.Tables("subject2").Rows
		If R_R=1 then
			    If Not(R_R1= "0") then
				 ratio_result_1.Text = myRow("explainword")
				Else
				 ratio_result_1.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
				End If
		Else If R_R=2 then
			If Not(R_R2= "0") then
				 ratio_result_2.Text = myRow("explainword")
			Else
				 ratio_result_2.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=3 then
			If Not(R_R3= "0") then
				 ratio_result_3.Text = myRow("explainword")
			Else
				 ratio_result_3.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=4 then
			If Not(R_R4= "0") then
				 ratio_result_4.Text = myRow("explainword")
			Else
				 ratio_result_4.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=5 then
			If Not(R_R5= "0") then
				 ratio_result_5.Text = myRow("explainword")
			Else
				 ratio_result_5.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=6 then
			If Not(R_R6= "0") then
				 ratio_result_6.Text = myRow("explainword")
			Else
				 ratio_result_6.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=7 then
			If Not(R_R7= "0") then
				 ratio_result_7.Text = myRow("explainword")
			Else
				 ratio_result_7.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=8 then
			If Not(R_R8= "0") then
				 ratio_result_8.Text = myRow("explainword")
			Else
				 ratio_result_8.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=9 then
			If Not(R_R9= "0") then
				 ratio_result_9.Text = myRow("explainword")
			Else
				 ratio_result_9.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=10 then
			If Not(R_R10= "0") then
				 ratio_result_10.Text = myRow("explainword")
			Else
				 ratio_result_10.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=11 then
			If Not(R_R11= "0") then
				 ratio_result_11.Text = myRow("explainword")
			Else
				 ratio_result_11.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=12 then
			If Not(R_R12= "0") then
				 ratio_result_12.Text = myRow("explainword")
			Else
				 ratio_result_12.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=13 then
			If Not(R_R13= "0") then
				 ratio_result_13.Text = myRow("explainword")
			Else
				 ratio_result_13.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=14 then
			If Not(R_R14= "0") then
				 ratio_result_14.Text = myRow("explainword")
			Else
				 ratio_result_14.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=15 then
			If Not(R_R15= "0") then
				 ratio_result_15.Text = myRow("explainword")
			Else
				 ratio_result_15.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=16 then
			If Not(R_R16= "0") then
				 ratio_result_16.Text = myRow("explainword")
			Else
				 ratio_result_16.Text = "<font color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=17 then
			If Not(R_R17= "0") then
				 ratio_result_17.Text = myRow("explainword")
			Else
				 ratio_result_17.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=18 then
			If Not(R_R18= "0") then
				 ratio_result_18.Text = myRow("explainword")
			Else
				 ratio_result_18.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		Else If R_R=19 then
			If Not(R_R19= "0") then
				 ratio_result_19.Text = myRow("explainword")
			Else
				 ratio_result_19.Text = "<font  color=#FF9933>Expert System don't use This Ration in Calculate</font>"
			End If
		End If		
      Next
Next




'-------------------- end show explaination ------------
End Sub

</script>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title> = =Stock-Market &amp; Expert System = =</title>
<link href="styles/st01.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
  <table width="770" border="0" cellspacing="0" cellpadding="0" style="border:#cccccc 1px solid">
    <tr>
      <td valign="top"> 
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="220" height="99" background="images/t01.gif"><img src=images/logoES.jpg></td>
            <td width="359" background="images/t01.gif" class="s01">
<div align="center"><br>
                <br>
                Decision Support&nbsp;System ......&nbsp;&nbsp;</div></td>
            <td width="190" background="images/t01.gif"><img src="images/img01.jpg" width="190" height="99"></td>
          </tr>
          <tr> 
            <td height="15" colspan="3" background="images/t02.gif" bgcolor=#EEF7F5><div align="right">
				<font color="#008080" size=-1><b>
					<a href=ratio1-4.aspx>Home | </a>
					<a href=ratio1-4.aspx> Explaination |</a>
					<a href=calculate.aspx>Analysis</a>
					<a href=../link/index.html>| More Information</a>
					<a href=../link/link.html>| Contact us</a>				 
				 </b></font></div></td>
          </tr>
        </table>
        <table width="768" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="198" height="61" background="images/prosearch.jpg"><div align="center">
                <table width="166" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="129" height="18" class="s03">Product Search</td>
                    <td class="s03" width="37"><img src="images/trans.gif" width="1" height="18"></td>
                  </tr>
                  <tr> 
                    <td height="23">
<input name="textfield" type="text" size="19" class="s04" style="border:#cccccc 1px solid;">
                    </td>
                    <td><div align="right"><a href="#"><img src="images/go.jpg" width="28" height="17" border="0" align="absmiddle"></a></div></td>
                  </tr>
                </table>
              </div></td>
            <td width="570" rowspan="3" valign="top" style="border-left:#c4e3e2 1px solid;"><table width="570" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="145" valign="top"><img src="images/img03.jpg" width="145" height="165"></td>
                  <td width="425" valign="top"><table width="425" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="405" height="37" valign="top" background="images/t07.gif"><img src="images/t07.gif" width="1" height="37"></td>
                        <td width="20" background="images/t07.gif">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="405" valign="top" class="s07"><div align="justify"><img src="images/Stockmarket Analysis.jpg"><br>
                        			<form><iframe src=../link/index.html width=100% target="Content"></iframe></form>
                           		</div></td>
                        <td width="20">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="405" valign="top">&nbsp;</td>
                        <td width="20">&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <table width="570" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="20" height="11"><img src="images/trans.gif" width="1" height="11"></td>
                  <td width="530" height="11" valign="top" background="images/t08.gif"><img src="images/trans.gif" width="1" height="11"></td>
                  <td width="20" height="11"><img src="images/trans.gif" width="1" height="11"></td>
                </tr>
              </table>
              <div align="center">
				<table width="531" border="0" cellspacing="0" cellpadding="0" id="table1">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table2">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src=images/200249532-001.jpg width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10">
							<span class="s09">1. PSR</span><br>
										<asp:Label ID=ratio_result_1 Runat=server></asp:Label>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate:<asp:Label ID=rate1 Runat=server ></asp:Label> 
							%</div></td>
                          <td width="129">
							&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table3">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/glz041.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10">
							<span class="s09">2. BVS</span><br>
                        			<asp:Label ID="ratio_result_2" Runat=server></asp:Label>
							<br> &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:Label ID="rate2" Runat=server ></asp:Label> 
							%</div></td>
                          <td width="129">
&nbsp;						  </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/dv1918002.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							3. P/BVS</span><br>
								<asp:Label ID="ratio_result_3" Runat=server></asp:Label> <br>
                            &nbsp; <br>
                            &nbsp;<br>
                            &nbsp;<br>
                            &nbsp;<br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:Label ID="rate3" Runat=server ></asp:Label> 
							%</div></td>
                          <td width="129">
&nbsp;					      </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/dv1990126.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							4. EV to Sales</span><br>
                            <asp:Label ID="ratio_result_4" Runat=server></asp:Label>
<br> &nbsp; 
                            &nbsp; <br>&nbsp;<br>&nbsp;<br>
                            &nbsp;<br>
                            &nbsp;<br>
                            &nbsp;<br>
                            &nbsp; </td>
</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:Label ID="rate4" Runat=server ></asp:Label> 
							%</div></td>
                          <td width="129">
&nbsp;                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0" id="table1">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table2">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56503208.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							5. EV/EBITDA</span><br>
                          	<asp:Label ID="ratio_result_5" Runat=server></asp:Label>
<br>
                            &nbsp; <br>&nbsp;<br><br><br><br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:Label ID=rate5 Runat=server ></asp:Label> 
							%</div></td>
                          <td width="129">
&nbsp;                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table3">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED">
                          		<a href="JavaScript:openWin('test.aspx','Spiderman','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=370,height=335')"  onMouseOut="MM_swapImgRestore();">
								<img src=images/explain.jpg width="96" height="22" border="0">
								</a>
                          </td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/fst101007.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							6. EPS </span><br>
                           <asp:Label ID="ratio_result_6" Runat=server/>     
                           <br><br><br><br><br> &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate6 runat=server />
							%</div></td>
                          <td width="129">
 &nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56504259.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							7. PER </span><br>
                            <asp:Label ID="ratio_result_7" Runat=server/><br><br><br>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate7 runat=server />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/AA038676.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							8. PEG Factor</span><br>
                            <asp:Label ID="ratio_result_8" Runat=server/>   <br>
                             &nbsp;<br><br> </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate8 runat=server />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0" id="table1">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table2">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/200191457-002.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							9. ROE  </span><br>
                           		<asp:Label ID="ratio_result_9" Runat=server/><br><br><br><br><br>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate9 runat=server />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table3">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56503537.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							10. Sales Per Share</span><br>
                            <asp:Label ID="ratio_result_10" Runat=server/><br><br> &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate10 runat=server />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/200164328-001.jpg"  width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							11. Earnings Per Share</span><br>
                         <asp:Label ID="ratio_result_11" Runat=server/>               <br>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate11 runat=server />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56585475.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							12. Equity Per Share</span><br>
                           			 <asp:Label ID="ratio_result_12" Runat=server/><br>
                           			  &nbsp;<br><br> </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id=rate12 runat=server />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0" id="table1">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table2">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56501355.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							13. Sales Per Share Ratio</span><br>
                           		<asp:Label ID="ratio_result_13" Runat=server/> 
                           		<br><br>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate13" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table3">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56503015.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							14.Earnings / Share Ratio</span><br>
                           <asp:Label ID="ratio_result_14" Runat=server/><br>
                           &nbsp;<br><br><br></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate14" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56504304.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							15. Equity Per Share Ratio</span><br>
                          <asp:Label ID="ratio_result_15" Runat=server/><br>
                            &nbsp; <br><br><br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate15" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/AA044810.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							16.Staff Costs as Percentage of Sales</span><br>
                           <asp:Label ID="ratio_result_16" Runat=server/><br>
                            &nbsp; <br><br><br><br>
                             &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate16" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0" id="table1">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table2">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56504510.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							17. Operating Cash Flow / Operating Profit </span><br>
                        <asp:Label ID="ratio_result_17" Runat=server/><br>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate17" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
<table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED" id="table3">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/56503010.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							18.  Price to Free Cash Flow Ratio : PCF</span><br>
                            <asp:Label ID="ratio_result_18" Runat=server/>
                             &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate18" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
                <table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="260" valign="top" bgcolor="#E5ECED"> 
                      <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t09.gif" width="9" height="7"></td>
                          <td height="7" colspan="2" bgcolor="#E5ECED"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t10.gif" width="17" height="7"></td>
                        </tr>
                        <tr> 
                          <td height="105"><img src="images/trans.gif" width="1" height="105"></td>
                          <td width="105" valign="top"> <div align="left"><img src="images/csc026.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							19. FCF/sales</span><br>
                           		<asp:Label ID="ratio_result_19" Runat=server/><br>
                            &nbsp; <br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate19" runat="server" />
							%</div></td>
                          <td width="129">
                          		&nbsp;
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top">
					&nbsp;
                    </td>
                  </tr>
                </table>
				<table width="531" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                    <td width="11"><img src="images/trans.gif" width="11" height="1"></td>
                    <td width="260" valign="top"> <table width="260" border="0" cellpadding="0" cellspacing="0" bgcolor="#E5ECED">
                        <tr> 
                          <td width="9" height="7"><img src="images/t11.gif" width="9" height="7"></td>
                          <td width="468" height="7" colspan="2"><img src="images/trans.gif" width="1" height="7"></td>
                          <td width="17" height="7"><img src="images/t12.gif" width="17" height="7"></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="11" colspan="3" valign="top"><img src="images/trans.gif" width="1" height="11"></td>
                  </tr>
                </table>
              </div></td>
          </tr>
          <tr> 
            <td bgcolor="#EEF7F5"><div align="center">
                <table width="198" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td height="22" colspan="3"><img src="images/t03.gif" width="198" height="22"></td>
                  </tr>
                  <tr> 
                    <td width="44" background="images/t05.gif"><img src="images/t05.gif" width="44" height="1"></td>
                    <td width="110" valign="top" bgcolor="#E5E8E0" class="s05">
					Ratio Calculate</td>
                    <td width="44" background="images/t06.gif"><img src="images/t06.gif" width="44" height="1"></td>
                  </tr>
				  <tr> 
                    <td width="44" background="images/t05.gif"><img src="images/t05.gif" width="44" height="1"></td>
                    <td width="110" bgcolor="#E5E8E0"><table width="110" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="14"><img src="images/trans.gif" width="1" height="14"></td>
                          <td width="80" height="14"><img src="images/trans.gif" width="1" height="14"></td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center">&nbsp;</div></td>
                          <td width="80" height="19" valign="top" class="s06">&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
                          	<a href=ratio1-4.aspx></td></a>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center">&nbsp;</div></td>
                          <td width="80" height="19" valign="top" class="s06">&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center">&nbsp;</div></td>
                          <td width="80" height="19" valign="top" class="s06">&nbsp;</td>
                        </tr>
						<tr>
                          <td width="30" height="12"><img src="images/trans.gif" width="1" height="12"></td>
                          <td width="80" height="12"><img src="images/trans.gif" width="1" height="12"></td>
                        </tr>
                      </table></td>
                    <td width="44" background="images/t06.gif"><img src="images/t06.gif" width="44" height="1"></td>
                  </tr>
                  <tr> 
                    <td height="23" colspan="3"><img src="images/t04.gif" width="198" height="23"></td>
                  </tr>
                </table>
              </div></td>
          </tr>
          <tr> 
            <td height="207" valign="bottom"><img src="images/img02.jpg" width="198" height="207"></td>
          </tr>
        </table>
        <table width="768" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="18" bgcolor="#F0E6DE" class="s02"><img src="images/trans.gif" width="20" height="18" align="absmiddle">All 
			Rights Reserved. Copyright &copy;&nbsp;NATTHAWOOT PUNROOB @ KMTIL &lt;MAIL: 
			nattha2intertime@hotmail.com&gt;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
<map name="Map">
  <area shape="rect" coords="0, 0, 38, 15" href="#">
  <area shape="rect" coords="60, 0, 117, 15" href="#">
  <area shape="rect" coords="137, 0, 195, 15" href="#">
  <area shape="rect" coords="213, 0, 275, 15" href="#">
  <area shape="rect" coords="294, 0, 366, 15" href="http://www.thaimufc.com/">

</map>
</body>
</html>