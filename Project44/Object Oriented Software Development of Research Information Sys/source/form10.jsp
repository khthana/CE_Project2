<html>
<head>
<title>form10</title>
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
		String schid="",schname="",schinfo=" \n			<option  value=\""+"\" > select  </option>";
		String pid="",pname="",paperinfo=" \n			<option  value=\""+"\" > select  </option>";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT NAME_TH,SURNAME_TH FROM STUDENT_INFO  WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		stdname = rs.getString(1);
		stdsur = rs.getString(2);
	}
	rs.close();
	if   (!stdname.equals(""))  { 
		
			String q2 = " SELECT  SCH_ID,NAME FROM  SCHOLARSHIP_INFO  WHERE KIND='Paper'";
			ResultSet  rs1 = statement.executeQuery(q2);
			while (rs1.next()) {
				schid	= rs1.getString(1);
				schname= rs1.getString(2);
				schinfo = schinfo+" \n			<option  value=\""+schid+"\" >"+schname+"</option>";
	 	} // while 
		
			rs1.close();
		
			String q3 = " SELECT  PAPER_ID,TOPIC_TH  FROM  STD_PAPER  WHERE STD_ID='"+stdid+"'";
			ResultSet  rs3 = statement.executeQuery(q3);
			while (rs3.next()) {
				pid	= rs1.getString(1);
				pname= rs1.getString(2);
				paperinfo = paperinfo+" \n			<option  value=\""+pid+"\" >"+pname+"</option>";
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
%>

</head>

<body bgcolor="#FFFFef">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
<form name="AssignSchPaper" action="AddShowPaper.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.10 
          การขอรับทุนเสนอบทความทางวิชาการ</font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="4">
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
                    <td width="19%"><a href="ShowStdInfo.jsp?stdid=<%=stdid%>" ><font face="Cordia New, CordiaUPC" size="4" color="#0000FF"> 
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
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อทุน</font></td>
                    <td width="87%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="schid">
                        <%=schinfo%> 
                      </select>
                      <input type="hidden" name="stdid" value="<%=stdid%>">
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
                    <td width="27%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อบทความที่จะให้ทุน</font></td>
                    <td width="73%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <select name="paper">
                        <%=paperinfo%> 
                      </select>
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%" height="27"><font face="Cordia New, CordiaUPC" size="3"></font></td>
              <td width="96%" height="27"> 
                <table width="100%" border="0" cellspacing="0" >
                  <tr> 
                    <td width="27%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">วันที่เสนอบทความ</font></td>
                    <td width="73%"> <font size="4" face="Cordia New, CordiaUPC" color="#000000"> 
                      <input type="text" name="day" size="2">
                      / 
                      <input type="text" name="mon" size="2">
                      / 
                      <input type="text" name="year" size="4">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%" height="25">&nbsp;</td>
              <td width="96%" height="25"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="27%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">สถานที่เสนอบทความ</font></td>
                    <td width="73%"><font size="4" face="Cordia New, CordiaUPC" color="#000000"> 
                      <input type="text" name="place">
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
</div>
</body>
</html>
