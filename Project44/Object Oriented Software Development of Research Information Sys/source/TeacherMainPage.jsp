<html>
<head>
<title>mainTeacher</title>
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
<script language="JavaScript">
<!--
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<%@  page session="true"  %>
<%@  include file ="checksessionT.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String tid = request.getParameter("tid");

		String tconlist = "              <option value=\"\"> Select </option>";
		String tsuplist = "              <option value=\"\"> Select </option>";
		String thelist   = "              <option value=\"\"> Select </option>";

		String msgout = "";
		String frt="",stdid="",stdname="",stdsur="",thid="";
		String topicT="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q = " SELECT PRE_NAME_TH,NAME_TH,SURNAME_TH,STD_ID  FROM STUDENT_INFO  WHERE T_CON_ID = "+tid;

	ResultSet  rs = statement.executeQuery(q);

	while (rs.next()) {
		frt= rs.getString(1);
		stdname = rs.getString(2);
		stdsur = rs.getString(3);
		stdid = rs.getString(4);
		tconlist = tconlist + "              <option value=\"ShowStdInfo.jsp?stdid="+stdid+"\">"+frt+stdname+"  "+stdsur+" </option>";
	}
	rs.close();
	
	String q1 = " SELECT THESIS_INFO.THESIS_ID,TOPIC_TH FROM THESIS_INFO,TEACHER_CTRL_THESIS   WHERE THESIS_INFO.THESIS_ID =  TEACHER_CTRL_THESIS.THESIS_ID AND T_ID = "+tid;

	ResultSet  rs1 = statement.executeQuery(q1);
	while (rs1.next()) {
			thid	= rs1.getString(1);
			topicT = rs1.getString(2);
			thelist = thelist +  "              <option value=\"ShowThesisInfo.jsp?thesisid="+thid+"\">"+topicT+" </option>";
	};
	rs1.close();

		
	String q3 = " SELECT PRE_NAME_TH,NAME_TH,SURNAME_TH,STUDENT_INFO.STD_ID  FROM STUDENT_INFO,TEACHER_CTRL_THESIS,THESIS_INFO  WHERE TEACHER_CTRL_THESIS.THESIS_ID = THESIS_INFO.THESIS_ID AND THESIS_INFO.STD_ID = STUDENT_INFO.STD_ID AND TEACHER_CTRL_THESIS.T_ID = "+tid;

	ResultSet  rs3 = statement.executeQuery(q3);

	while (rs3.next()) {
		frt= rs3.getString(1);
		stdname = rs3.getString(2);
		stdsur = rs3.getString(3);
		stdid = rs3.getString(4);
		tsuplist = tsuplist + "              <option value=\"ShowStdInfo.jsp?stdid="+stdid+"\">"+frt+stdname+"  "+stdsur+" </option>";
	};
	
	rs3.close();
	
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

<body bgcolor="#FFFFCC">
  <input type="hidden" name="tid" value="<%=tid%>" >
<div id="Layer1" style="position:absolute; left:50px; top:50px; width:680px; z-index:1">
  <div align="center">
    <p><font face="Cordia New, CordiaUPC" size="5"><b><font color="#3333CC" size="6">แผนกวิจัยและประเมินผลบัณฑิตวิทยาลัย</font></b></font></p>
    <p><img src="line.jpg" width="600" height="2"></p>
    <p>&nbsp;</p>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width="13%"> 
          <p align="right"><img src="vwicn140.gif" width="13" height="11"></p>
        </td>
        <td width="1%"> 
        </td>
        <td width="57%"><font color="#0000FF"><b><font face="Cordia New, CordiaUPC" size="6"><a href="ShowOwnInfo.jsp?tid=<%=tid%>"><font size="5">แก้ไขข้อมูลส่วนตัว</font></a></font></b></font></td>
        <td width="29%"> 
          <div align="left"></div>
        </td>
      </tr>
      <tr> 
        <td width="13%"> 
          <div align="right"><img src="vwicn140.gif" width="13" height="11"></div>
        </td>
        <td width="1%"><font color="#0000FF" size="5"><b></b></font></td>
        <td width="57%"><font color="#0000FF" size="5"><b><font face="Cordia New, CordiaUPC" color="#0000CC">ดูข้อมูลนักศึกษาในความดูแล(วิทยานิพนธ์)</font></b></font> 
        </td>
        <td width="29%"> 
          <div align="left"> 
            <select name="tsup" onChange="MM_jumpMenu('parent',this,0)">
              <%=tsuplist%> 
            </select>
          </div>
        </td>
      </tr>
      <tr> 
        <td width="13%" height="34"> 
          <div align="right"><img src="vwicn140.gif" width="13" height="11"></div>
        </td>
        <td width="1%" height="34"><font color="#0000FF" size="5"><b></b></font></td>
        <td width="57%" height="34"><font color="#0000FF" size="5"><b><font face="Cordia New, CordiaUPC" color="#0000CC">ดูข้อมูลนักศึกษา</font><font color="#0000FF" size="5"><b><font face="Cordia New, CordiaUPC" color="#0000CC">ในความดูแล</font></b></font><font face="Cordia New, CordiaUPC" color="#0000CC">(ที่ปรึกษา) 
          </font></b></font></td>
        <td width="29%" height="34"> 
          <div align="left"> 
            <select name="tcon" onChange="MM_jumpMenu('parent',this,0)">
              <%=tconlist%> 
            </select>
          </div>
        </td>
      </tr>
      <tr> 
        <td colspan="4" height="32"> 
          <div align="right"> 
            <table width="100%" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="13%" height="32"> 
                  <div align="right"><img src="vwicn140.gif" width="13" height="11"></div>
                </td>
                <td width="1%" height="32">&nbsp;</td>
                <td width="31%" height="32"><font color="#0000FF" size="5"><b><font face="Cordia New, CordiaUPC" color="#0000CC">วิทยานิพนธ์ที่ควบคุม 
                  </font></b></font></td>
                <td width="55%" height="32"> 
                  <select name="thesis" onChange="MM_jumpMenu('parent',this,0)">
                    <%=thelist%> 
                  </select>
                </td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p><img src="line.jpg" width="600" height="2"></p>
  </div>
</div>
</body>
</html>
