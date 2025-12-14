<html>
<head>
<title>รายละเอียดผลงานวิชาการ</title>
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
		String pid = request.getParameter("pid");
		String pnamet= "";
		String pnamee="";
		String per="";
		String pub="";
		String pubyear="";
		String pages="";
		String perdo="";
		String codo="";


		String msgout = "";
//		String stdname="",stdsur="";
		String sid="";

	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String q1 = " SELECT TOPIC_EN,TOPIC_TH,PUBLISH_BY,PAGES,PER_DOING, CO_DOER,PUBYEAR,STD_ID  FROM STD_PAPER WHERE PAPER_ID =  "+pid;


	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {

		pnamet = rs.getString(1);
		pnamee = rs.getString(2);
		pub = rs.getString(3);
		pages=rs.getString(4);
		perdo=rs.getString(5);
		codo=rs.getString(6);
		pubyear=rs.getString(7);
		sid=rs.getString(8);

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
        <div align="center"><font size="4"><b><font color="#0000FF" size="5">งรายละเอียด 
          ผลงานวิจัยทางวิชาการ </font></b></font></div>
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
                    <td width="87%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
                      <%=sid%> </font></td>
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
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> <%=pnamet%>

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
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">ภาษาอังกฤษ</font></td>
                    <td width="71%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> <%=pnamee%>

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
                    <td width="8%"><font face="Cordia New, CordiaUPC" size="4" color="#0000FF">พิมพ์ที่</font></td>
                    <td width="92%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> <%=pub%>
                    
                      &nbsp;&nbsp; <font color="#0000FF">ปีที่พิมพ์ </font>&nbsp;&nbsp; 
                      <%=pubyear%>
					</td>
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
						<%=pages%>
                      </font></td>
                    <td width="18%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">มีการทำงาน</font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
					<%=perdo%>
                      <font color="#0000FF">% </font></font></td>
                    <td width="19%"><font size="4" face="Cordia New, CordiaUPC" color="#0000FF">จำนวนผู้ร่วมงาน</font></td>
                    <td width="30%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
					<%=codo%>
                      <font color="#0000FF"> คน </font></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="4%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="96%"> 
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
