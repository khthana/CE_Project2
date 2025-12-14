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
      Dim selectStatement As String = "SELECT RatioFromFactor.ID, RatioFromFactor.weight FROM RatioFromFactor WHERE (((RatioFromFactor.ratio)=13));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myConnection)
      Dim myDataSet As New DataSet("subject")
      myAdapter.Fill(myDataSet, "subject")
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
            <td height="15" colspan="3" background="images/t02.gif"><div align="right">
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
                           		&nbsp;&nbsp;&nbsp;&nbsp;	การวิเคราะห์หุ้นจากงบการเงินเป็นการวิเคราะห์พื้นฐานทางด้านการเงินของบริษัท ข้อมูลต่างๆที่อยู่ในงบการเงินเหล่านี้สามารถบอกถึงสภาพด้านการเงินที่เกิดจากการดำเนินงานของบริษัทได้เป็นอย่างดี 
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การวิเคราะห์งบการเงินเหล่านี้ก็เพื่อใช้ในการตัดสินใจในการลงทุนหรืออาจจะใช้ในการประมาณราคาหุ้นของบริษัทในอนาคตได้ </div></td>
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
                          <td width="105" valign="top"> <div align="left"><img src="images/56501355.jpg" width="97" height="97"></div></td>
                          <td width="129" valign="top" class="s10"><span class="s09">
							13. Sales Per Share Ratio</span><br>
                           		จะช่วยพิจารณากลุ่มของผู้บริหารบริษัทว่ามีความสามารถในการจัดการ <u>"รายได้ที่เกิดจากการขาย"</u> ของบริษัทว่าทำได้ดีเพียงไร  โดยนำข้อมูลในส่วนของผู้ถือหุ้นมาพิจารณา 
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
                          		<a href="JavaScript:openWin('test.aspx','Spiderman','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=370,height=335')"  onMouseOut="MM_swapImgRestore();">
								<img src=images/explain.jpg width="96" height="22" border="0">
								</a>
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
                           จะช่วยพิจารณากลุ่มของผู้บริหารบริษัทว่ามีความสามารถในการจัดการ <u>"กำไรที่เกิดจากการขายของบริษัท"</u> ว่าทำได้ดีเพียงไร  โดยนำข้อมูลในส่วนของผู้ถือหุ้นมาพิจารณา <br>
                           &nbsp;<br><br><br></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate14" runat="server" />
							%</div></td>
                          <td width="129">
                          		<a href="JavaScript:openWin('test.aspx','Spiderman','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=370,height=335')"  onMouseOut="MM_swapImgRestore();">
								<img src=images/explain.jpg width="96" height="22" border="0">
								</a>
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
                          จะช่วยพิจารณากลุ่มของผู้บริหารบริษัทว่ามีความสามารถในการจัดการ<u>"กำไรที่เกิดจากการขายของบริษัทต่อจำนวนเงินของมูลค่าบัญชี"</u>ว่าทำได้ดีเพียงไร  โดยนำข้อมูลในส่วนของผู้ถือหุ้นมาพิจารณา <br>
                            &nbsp; <br><br><br>
                            &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate15" runat="server" />
							%</div></td>
                          <td width="129">
                          		<a href="JavaScript:openWin('test.aspx','Spiderman','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=370,height=335')"  onMouseOut="MM_swapImgRestore();">
								<img src=images/explain.jpg width="96" height="22" border="0">
								</a>
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
                            ค่าใช้นี้ใช้สำหรับวัดประสิทธิภาพของพนักงานโดยเปรียบเทียบรายจ่ายของบริษัทที่จ่ายให้แก่พนักงานกับรายได้ของบริษัทว่ามีอัตราส่วนเป็นเช่นไร<br>
                            &nbsp; <br><br><br><br>
                             &nbsp; </td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr> 
                          <td>&nbsp;</td>
                          <td width="105" class="s08"> <div align="center">Rate: <asp:label id="rate16" runat="server" />
							%</div></td>
                          <td width="129">
                          		<a href="JavaScript:openWin('test.aspx','Spiderman','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=370,height=335')"  onMouseOut="MM_swapImgRestore();">
								<img src=images/explain.jpg width="96" height="22" border="0">
								</a>
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
                          	<a href=ratio1-4.aspx>Ratio 1-4</td></a>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							<a href=ratio5-8.aspx>Ratio 5-8</a></td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							<a href=ratio9-12.aspx>Ratio 9-12</a></td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							<a href=ratio13-16.aspx>Ratio 13-16</a></td>
                        </tr>
						<tr>
                          <td width="30" height="19" valign="top">
<div align="center"><img src="images/bl01.gif" width="12" height="7" vspace="4"></div></td>
                          <td width="80" height="19" valign="top" class="s06">
							<a href=ratio17-19.aspx>Ratio 17-19</a></td>
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