<html>
<head>
<title>form7</title>
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
		String stdname="",stdsur="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
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
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
<form name="addpaper" action="AddPaper.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.7 
          รับรองผลงานวิจัยทางวิชาการ </font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdid%> </font></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></td>
                    <td width="21%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdname%> </font></td>
                    <td width="11%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
                    <td width="24%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=stdsur%> </font></td>
                    <td width="7%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อผลงานวิจัย</font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาไทย</font></td>
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="paperT" size="60">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">&nbsp 
                      <input type="hidden" name="ThesisId" value="<%=stdid%>">
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาอังกฤษ</font></td>
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="paperE" size="60">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">มากกว่าร้อยละ</font> 
                    </td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="percent" size="5">
                      </font></td>
                    <td width="8%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">พิมพ์ที่</font></td>
                    <td width="68%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="pub" size="40">
                      &nbsp;&nbsp; <font color="#0000FF">ปีที่พิมพ์ </font>&nbsp;&nbsp; 
                      <select name="pubyear">
                        <option value="2537">2537</option>
                        <option value="2538">2538</option>
                        <option value="2539">2539</option>
                        <option value="2540">2540</option>
                        <option value="2541">2541</option>
                        <option value="2542">2542</option>
                        <option value="2543">2543</option>
                        <option value="2544">2544</option>
                        <option value="2545">2545</option>
                        <option value="2546">2546</option>
                        <option value="2547">2547</option>
                      </select>
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="14%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">จำนวนหน้า</font></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="page" size="3" maxlength="3">
                      </font></td>
                    <td width="18%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">มีการทำงาน</font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="perdoing" size="3" maxlength="3">
                      <font color="#0000FF">% </font></font></td>
                    <td width="19%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">จำนวนผู้ร่วมงาน</font></td>
                    <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="person" size="2" maxlength="2">
                      <font color="#0000FF"> คน </font></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์ผู้รับรอง</font></td>
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="tname">
                      </font></td>
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
                    <td width="44%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <input type="text" name="tsurname">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok22" value="ตกลง">
                  <input type="submit" name="cancel22" value="ยกเลิก">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="4%">&nbsp;</td>
              <td width="96%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
  <div align="left"></div>
  <div align="left"><font face="Cordia New, CordiaUPC" size="4"> </font></div>
  <font face="Cordia New, CordiaUPC" size="4"> </font></div>
</body>
</html>
