<html>
<head>
<title>form2</title>
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
		String stdname=null ,stdsur=null,tid=null;
		String tname="",tsur="";
//		String stdid= request.getParameter("stdid");
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
//	String facid=null,facn=null;
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT NAME_TH,SURNAME_TH,T_CON_ID FROM STUDENT_INFO"+
						" WHERE STD_ID =  '"+stdid+"'";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next() ) {
		stdname = rs.getString(1);
		stdsur = rs.getString(2);
		tid = rs.getString(3);
//		data = data+"			<option value=\""+facid+"\" >"+facn+"</option>\n";
	}
//	out.print(stdname"<br>");

	if(  (! stdname.equals("") ) && (!tid.equals("")) || (tid != null) ){ 
	
		String q2 = " SELECT NAME_TH,SURNAME_TH FROM TEACHER_INFO WHERE T_ID = "+tid;

		ResultSet  rs1 = statement.executeQuery(q2);

		while (rs1.next()) {
		tname	= rs1.getString(1);
		tsur		= rs1.getString(2);
	}
	
	}	
	
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
 <form name="chteacher"  action="ChgTconsult.jsp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
      <td bgcolor="#FFCC66"> 
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">บว.วป.2 
          คำร้องขอเปลี่ยนอาจารย์ที่ปรึกษา</font></b></font></div>
      </td>
    </tr>
    <tr>
      <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%"> <font color="#000000"> 
                <input type="hidden"  name="Stdid"  value="<%=stdid%>">
                </font></td>
              <td width="10%"><font color="#0000FF"></font></td>
              <td width="2%"><font color="#0000FF"></font></td>
              <td width="21%"><font color="#0000FF"></font></td>
              <td width="10%"><font color="#0000FF"></font></td>
              <td width="24%"><font color="#0000FF"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="51%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">รหัสนักศึกษา</font></td>
                    <td width="49%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=stdid%> 
                      </font></td>
                  </tr>
                </table>
              </td>
              <td width="10%"> 
                <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ชื่อ</font></div>
              </td>
              <td width="2%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font color="#0000FF"></font> 
                  </font></div>
              </td>
              <td width="21%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                  <%=stdname%> </font></div>
              </td>
              <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
              <td width="24%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <%=stdsur%> </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์ที่ปรึกษาเดิม</font></td>
              <td width="10%"> 
                <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์</font></div>
              </td>
              <td width="2%"> 
                <div align="center"><font face="Cordia New, CordiaUPC" size="4"><font color="#0000FF"></font> 
                  </font></div>
              </td>
              <td width="21%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                  <%=tname%> </font></div>
              </td>
              <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
              <td width="24%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <%=tsur%> </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์ที่ปรึกษาใหม่</font></td>
              <td width="10%"> 
                <div align="right"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">อาจารย์</font></div>
              </td>
              <td width="2%"><font color="#0000FF"></font></td>
              <td width="21%"> 
                <div align="left"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                  <input type="text" name="NewTName">
                  </font></div>
              </td>
              <td width="10%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">นามสกุล</font></td>
              <td width="24%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                <input type="text" name="NewTSur">
                </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td width="2%">&nbsp;</td>
              <td width="21%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td width="24%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td width="2%">&nbsp;</td>
              <td width="21%"> 
                <input type="submit" name="ok2" value="ตกลง">
                <input type="submit" name="cancel2" value="ยกเลิก">
              </td>
              <td width="10%">&nbsp;</td>
              <td width="24%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="30%"><font face="Cordia New, CordiaUPC" size="4"> </font></td>
              <td width="10%">&nbsp;</td>
              <td width="2%">&nbsp;</td>
              <td width="21%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td width="24%">&nbsp;</td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
