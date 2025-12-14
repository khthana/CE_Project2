<html>
<head>
<title>form8</title>
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
		String stdid = request.getParameter("stdid");

		String msgout = "";
		String stdname="",stdsur="",thid="";
		String topicT="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
//	String facid=null,facn=null;
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT NAME_TH,SURNAME_TH  FROM STUDENT_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		stdname = rs.getString(1);
		stdsur = rs.getString(2);
	}
	rs.close();
	
	String q3 = " SELECT THESIS_ID FROM THESIS_INFO "+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs2 = statement.executeQuery(q3);
	while (rs2.next()) {
				thid	= rs2.getString(1);
	}

	if ( (!thid. equals("")) &&(!stdname.equals("")) ) { 
	
			String q2 = " SELECT  TOPIC_TH FROM  THESIS_INFO WHERE THESIS_ID = "+thid;
			ResultSet  rs1 = statement.executeQuery(q2);
			while (rs1.next()) {
				topicT	= rs1.getString(1);
	 	} // while 
			
		} else response.sendRedirect("error.jsp");

	dbconn.close();
    }
     
      catch ( ClassNotFoundException cnfex )
      {
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;
      }
      catch ( SQLException sqlex )
      {    
			sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
      }
      catch ( Exception excp )
      {    
            excp.printStackTrace();
            msgout = excp.toString();
      }
	out.println(msgout);

//out.print(stdid);
%>

</head>

<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; z-index:1"> 
<form name="addmonsuport" action="AddMonSupport.jsp" >
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.8 
          สมัครขอรับทุนสนับสนุนการทำวิทยานิพนธ์</font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td width="19%"><a href="ShowStdInfo.jsp?stdid=<%=stdid%>" ><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdid%> </font></a></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></td>
                    <td width="21%"><a href="ShowStdInfo.jsp?stdid=<%=stdid%>" ><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdname%> </font></a></td>
                    <td width="11%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
                    <td width="24%"><a href="ShowStdInfo.jsp?stdid=<%=stdid%>" ><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdsur%> </font></a></td>
                    <td width="7%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีการศึกษาที่ขอโครงการ 
                      </font></td>
                    <td width="72%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="acadyear" >
                        <option value="2544">2544</option>
                        <option value="2545" selected>2545</option>
                        <option value="2546">2546</option>
                        <option value="2547">2547</option>
                        <option value="2548">2548</option>
                        <option value="2549">2549</option>
                        <option value="2550">2550</option>
                      </select>
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">หัวข้อวิทยานิพนธ์</font></td>
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><b> 
                      <%=topicT%> </b></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อโครงการที่ทำวิจัย</font></td>
                    <td width="75%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="projname" size="60">
                      <input type="hidden" name="stdid" value="<%=stdid%>">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%" height="69">&nbsp;</td>
              <td width="96%" height="69"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประเภทโครงการ</font></td>
                    <td width="75%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="type" size="60">
                      </font></td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="27%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ปีงบประมาณที่ขอโครงการ</font></td>
                    <td width="73%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="budyear" >
                        <option value="2544">2544</option>
                        <option value="2545" selected>2545</option>
                        <option value="2546">2546</option>
                        <option value="2547">2547</option>
                        <option value="2548">2548</option>
                        <option value="2549">2549</option>
                        <option value="2550">2550</option>
                      </select>
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="alone" value="A" checked>
                      </font></td>
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">หน่วยงานเดียวทำวิจัย</font></td>
                    <td width="4%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
                      <input type="radio" name="alone" value="M">
                      </font></td>
                    <td width="66%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">หลายหน่วยงานเดียวทำวิจัย</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สาขาที่ทำการวิจัย</font></td>
                    <td width="81%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="sci" size="70">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ประเภทของการวิจัย</font></td>
                    <td width="81%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="cat" size="70">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ระยะเวลาที่ทำการวิจัย</font></td>
                    <td width="24%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="daystart" size="2">
                      / 
                      <input type="text" name="monstart" size="2">
                      / 
                      <input type="text" name="yearstart" size="4">
                      </font></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ถึง</font></td>
                    <td width="46%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="dayend" size="2">
                      / 
                      <input type="text" name="monend" size="2">
                      / 
                      <input type="text" name="yearend" size="4">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">สถานที่</font></td>
                    <td width="81%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="place" size="70">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="3"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="4"><font color="#0000FF"></font></font></font></font></font></font></font></font></font></font></font> 
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><b><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ค่าใช้จ่าย</font></b></td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="11%">&nbsp;</td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">- 
                      ค่าพิมพ์</font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="printcost" size="10">
                      </font></td>
                    <td width="47%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">บาท</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="11%">&nbsp;</td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">- 
                      ค่าเข้าเล่ม</font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" size="10" name="bookcost">
                      </font></td>
                    <td width="47%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">บาท</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="11%">&nbsp;</td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">- 
                      ค่าวัสดุคอมพิวเตอร์</font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="comcost" size="10">
                      </font></td>
                    <td width="47%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">บาท</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="11%">&nbsp;</td>
                      <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">- 
                        ค่าวัสดุสำนักงาน</font></td>
                      <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                        <input type="text" name="matcost" size="10">
                        </font></td>
                      <td width="47%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">บาท</font></td>
                    </tr>
                  </table>
                </div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok222" value="ตกลง">
                  <input type="submit" name="cancel22" value="ยกเลิก">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
   </form>
  </div>
</body>
</html>
