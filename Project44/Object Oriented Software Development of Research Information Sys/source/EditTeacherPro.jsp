<html>
<head>
<title>Edit Teacher Information</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String tid= request.getParameter("tid");
		String tcode= request.getParameter("tcode");
		String tnamet= request.getParameter("tnamet");
		String tsurt= request.getParameter("tsurt");
		String acadt= request.getParameter("acadt");

		String stat10=request.getParameter("STAT1");
		String stat1="";
		String stat11="";
		String stat20=request.getParameter("STAT2");
		String stat2="";
		String stat21="";
		String stat22="";

	String stat30=request.getParameter("STAT3");
		String stat3="";
		String stat31="";
		String stat32="";

		String stat40=request.getParameter("STAT4");
		String stat4="";
		String stat41="";
		String stat42="";
		String oldadmin=request.getParameter("admin");
		
//		String admin="";
			if (stat10.equals("F")) { stat1= " checked";} 
			else { stat11= " checked";};

//			stat2 = " Not Available ";
			if (stat20.equals("M")) { stat2= " checked";} 
			if (stat20.equals("D")){ stat21= " checked";}
			if (stat20.equals("A")) { stat22=" checked";}


//			stat3 = " Not Available ";
			if (stat30.equals("M")) { stat3= " checked";} 
			if (stat30.equals("D")){ stat31= " checked";}
			if (stat30.equals("A")){ stat32=" checked";}

//			stat4 = " Not Available ";
			if (stat40.equals("M")){ stat4= " checked";} 
			if (stat40.equals("D")){ stat41= " checked";}
			if (stat40.equals("A")){ stat42 =" checked";}
	
	

			if (stat10.equals("F")) { stat1= " checked";} 
			else { stat11= " checked";};

//			stat2 = " Not Available ";
			if (stat20.equals("M")) { stat2= " checked";} 
			if (stat20.equals("D")){ stat21= " checked";}
			if (stat20.equals("A")) { stat22=" checked";}


//			stat3 = " Not Available ";
			if (stat30.equals("M")) { stat3= " checked";} 
			if (stat30.equals("D")){ stat31= " checked";}
			if (stat30.equals("A")){ stat32=" checked";}

//			stat4 = " Not Available ";
			if (stat40.equals("M")){ stat4= " checked";} 
			if (stat40.equals("D")){ stat41= " checked";}
			if (stat40.equals("A")){ stat42 =" checked";}
	
%>

</head>
<body bgcolor="#FFFFCC" text="#0066FF">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
  <form name="addteacher" action="EditTPro.jsp">
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
        <td bgcolor="#FFCC66" height="34"> 
          <div align="center">
            <p><font size="4"><b><font color="#0000FF" size="5">แก้ไขรายละเอียดอาจารย์ 
              </font></b></font></p>
            </div>
      </td>
    </tr>
    <tr>
      <td height="27"> 
	 
          <table width="100%" border="0" cellspacing="3" cellpadding="0">
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสอาจารย์</font></td>
                    <td width="85%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tcode%></font></td>
                    <input type="hidden" name="tid" value="<%=tid%>">
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td width="11%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=acadt%></font></td>
                    <td width="29%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tnamet%> 
                      </font></td>
                    <td width="3%">&nbsp;</td>
                    <td width="55%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tsurt%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font> 
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ตำแหน่งทางวิชาการไทย</font></td>
                    <td width="15%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="acadt">
                        <option value="อาจารย์">อาจารย์</option>
                        <option value="ผศ.">ผศ.</option>
                        <option value="ผศ.ดร.">ผศ.ดร.</option>
                        <option value="รศ.">รศ.</option>
                        <option value="รศ.ดร.">รศ.ดร</option>
                        <option value="ศ.">ศ.</option>
                        <option value="ศ.ดร.">ศ.ดร.</option>
                        <option value="ดร.">ดร.</option>
                      </select>
                      </font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ENG</font></td>
                    <td width="10%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="acade">
                        <option value="Lecturer">Lecturer</option>
                        <option value="Asst.Prof.">Asst.Prof.</option>
                        <option value="Asst.Prof.Dr.">Asst.Prof.Dr.</option>
                        <option value="Assoc.Prof.">Assoc.Prof.</option>
                        <option value="Assoc.Prof.Dr.">Assoc.Prof.Dr.</option>
                        <option value="Prof.">Prof.</option>
                        <option value="Prof.Dr.">Prof.Dr.</option>
                        <option value="Dr.">Dr.</option>
                      </select>
                      </font></td>
                    <td width="8%"><font color="#000000"></font></td>
                    <td width="27%"><font color="#000000"></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                1). สถานภาพเป็นอาจารย์บัณทิต </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT1" value="F" <%=stat1%> >
                      </font></td>
                    <td width="34%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประจำ 
                      (FULL TIME)</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT1" value="P" <%=stat11%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">พิเศษ 
                      (PART TIME)</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">2). 
                สถานภาพการสอนวิชาในหลักสูตร</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT2" value="M" <%=stat2%> >
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT2" value="D" <%=stat21%> >
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT2" value="A"  <%=stat22%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">3). 
                สถานภาพในการสอบวิทยานิพนธ์</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT3" value="M" <%=stat3%> >
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT3" value="D" <%=stat31%> >
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT3" value="A" <%=stat32%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">4). 
                สถานภาพในควบคุมวิทยานิพนธ์</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT4" value="M" <%=stat4%> >
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT4" value="D" <%=stat41%> >
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="STAT4" value="A" <%=stat42%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ตำแหน่งบริหาร</font></td>
                    <td width="75%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="admin" size="60">
                      <input type="hidden" name="oldadmin" value= "<%=oldadmin%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <div align="center"> 
                  <input type="submit" name="ok" value="ตกลง">
                </div>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
