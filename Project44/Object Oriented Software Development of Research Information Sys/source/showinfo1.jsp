<html>
<head>
<title>View Teacher Information</title>
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
		String stdid= request.getParameter("stdid");


		String namet="";
		String ssurt="";
		String frt="";

		String add="";
		String state="";
		String country ="";
		String zip="";
		String tel="";
		String email="";
		
		
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String qt = "SELECT PRE_NAME_TH,NAME_TH,SURNAME_TH,ADDRESS,STATE, COUNTRY,ZIP,TEL_NUMBER,EMAIL  FROM STUDENT_INFO WHERE STD_ID= "+stdid;
	ResultSet rt = statement.executeQuery(qt);
	while (rt.next())
	{	
				fre			= rt.getString(1);
				snamet		=rt.getString(2);
				ssurt			=rt.getString(3);
				add			= rt.getString(4);
				state		=rt.getString(5);
				country	= rt.getString(6);
				zip			= rt.getString(7);
				tel			= rt.getString(8);
				email		= rt.getString(9);
			}
		rt.close();
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

//	out.println(msgout);
%>

</head>
<body bgcolor="#FFFFCC" text="#0066FF">
<div id="Layer1" style="position:absolute; left:50px; top:100px; width:680px; height:100px; z-index:1"> 
  <form name="addteacher" method="post" action="/servlet/pro_gdl.EditTeacherPro">
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
        <td bgcolor="#FFCC66" height="34"> 
          <div align="center">
            <p><font size="4"><b><font color="#0000FF" size="5">รายละเอียดนักศึกษา</font></b></font></p>
            </div>
      </td>
    </tr>
    <tr>
      <td height="27"> 
	 
          <table width="100%" border="0" cellspacing="3" cellpadding="0">
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%">รหัสนักศักษา</td>
                    <td width="85%"><%=stdid%></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%">ชื่อ</td>
                    <td width="12%"><%=frt%></td>
                    <td width="29%"><%=snamet%> </td>
                    <td width="10%">สกุล</td>
                    <td width="33%"><%=ssurt%></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18">&nbsp;</td>
              <td width="97%" height="18">&nbsp; </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%">ที่อยู่</td>
                    <td width="88%"><%=add%></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%">จังหวัด</td>
                    <td width="23%"><%=state%></td>
                    <td width="10%">ประเทศ</td>
                    <td width="22%"><%=country%> </td>
                    <td width="18%">รหัสไปรษณีย์</td>
                    <td width="15%"><%=zip%> </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%">เบอร์โทร</td>
                    <td width="26%"><%=tel%></td>
                    <td width="7%">&nbsp;</td>
                    <td width="55%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%">อีเมล์</td>
                    <td width="26%"><%=email%></td>
                    <td width="7%">&nbsp;</td>
                    <td width="55%">&nbsp;</td>
                  </tr>
                </table>
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
