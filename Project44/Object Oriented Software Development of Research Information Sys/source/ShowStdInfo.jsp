<html>
<head>
<title>View Student Information</title>
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
<%@  include file ="checksessionT.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String stdid= request.getParameter("stdid");


		String snamet="";
		String ssurt="";
		String frt="";
		String acadc ="";
		String acads ="";
		String namec ="";
		String surc	= "";
		String names="";
		String surs="";
		String tcon="";
		String tsup="";
		String thet="";
		String thee="";
		String paper="";
		String allpaper ="-";
		String sch="";
		String allsch="-";
		String theacad="";
		String thesem="";
		String thetestdate="";
		String thestime="";
		String theetime="";
		String theroom="";
		String thesenddate="-";
		String allcom="Commitee are <br>";
		String allproj="-";


		String add="";
		String state="";
		String country ="";
		String zip="";
		String tel="";
		String email="";
		



		String msgout = "";
		
	try
      {        

	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();

	String qt = "SELECT PRE_NAME_TH,NAME_TH,SURNAME_TH,ADDRESS,STATE, COUNTRY,ZIP,TEL_NUMBER,EMAIL,T_CON_ID FROM STUDENT_INFO WHERE STD_ID = '"+stdid+"'";
	String tconid="";
	ResultSet rt = statement.executeQuery(qt);
	while (rt.next())
	{	
				frt				= rt.getString(1);
				snamet	=rt.getString(2);
				ssurt		=rt.getString(3);
				add			= rt.getString(4);
				state		=rt.getString(5);
				country	= rt.getString(6);
				zip			= rt.getString(7);
				tel			= rt.getString(8);
				email		= rt.getString(9);
				tconid		=rt.getString(10);
	};

	rt.close();

	String q4 = "SELECT	THESIS_ID,TOPIC_TH,TOPIC_EN  FROM THESIS_INFO WHERE STD_ID = '"+stdid+"'";

	ResultSet rt4 = statement.executeQuery(q4);
	String theid="";
	while (rt4.next())
	{	
		theid=rt4.getString(1);
		thet= rt4.getString(2);
		thee=rt4.getString(3);
	};

	rt4.close();


	if (!tconid.equals("")) {
	String q1 = "SELECT ACAD_POS_TH,NAME_TH,SURNAME_TH  FROM TEACHER_INFO WHERE T_ID = "+tconid;

	ResultSet rt1 = statement.executeQuery(q1);
	while (rt1.next())
	{	
				acadc			= rt1.getString(1);
				namec			=rt1.getString(2);
				surc				=rt1.getString(3);
	};

	tcon=acadc+" "+namec+"   "+surc;

	rt1.close();
	}
	


	String q2 = "SELECT ACAD_POS_TH,NAME_TH,SURNAME_TH  FROM TEACHER_INFO,TEACHER_CTRL_THESIS WHERE TEACHER_INFO.T_ID = TEACHER_CTRL_THESIS.T_ID AND STATUS = 'S' AND THESIS_ID = "+theid;

	ResultSet rt2 = statement.executeQuery(q2);
	while (rt2.next())
	{	
				acads			= rt2.getString(1);
				names			=rt2.getString(2);
				surs				=rt2.getString(3);
	};

	tsup=acads+" "+names+"   "+surs;


	rt2.close();

	String q3 = "SELECT	TOPIC_TH  FROM STD_PAPER WHERE STD_ID = '"+stdid+"'";

	ResultSet rt3 = statement.executeQuery(q3);
	int ct = 1;

	while (rt3.next())
	{	
		paper= rt3.getString(1);
		allpaper=allpaper+"\n <tr>  <td width=\"11%\">"+ct+".</td>                    <td width=\"89%\">"+paper+"</td>                  </tr>";
		ct++;
	};

	rt3.close();

	String q5 = "SELECT	TEST_ID,TEST_DATE,START_TEST_TIME,END_TEST_TIME, YEAR,SEM,ROOM FROM TEST_SCHEDULE WHERE STD_ID = '"+stdid+"' AND TEST_TYPE='T' AND RESULT='No information'";

	ResultSet rt5 = statement.executeQuery(q5);
	String testid="";
	while (rt5.next())
	{	
		testid = rt5.getString(1);
		thetestdate=rt4.getString(2);
		thestime=rt4.getString(3);
		theetime=rt4.getString(4);
		theacad=rt4.getString(5);
		thesem=rt4.getString(6);
		theroom=rt4.getString(7);

	};

	rt5.close();

if (!testid.equals("")) {
String q6 = "SELECT	ACAD_POS_TH,NAME_TH,SURNAME_TH  FROM THESIS_TEST_COM,TEACHER_INFO WHERE THESIS_TEST_COM.T_ID=TEACHER_INFO.T_ID AND TEST_ID= "+testid+" AND THESIS_ID = "+theid;


ResultSet rt6 = statement.executeQuery(q6);
String namecom="";
String surcom="";
String acadcom="";
	while (rt6.next())
	{	
		acadcom = rt6.getString(1);
		namecom=rt6.getString(2);
		surcom=rt6.getString(3);
		allcom=allcom+"\n  "+acadcom+" "+namecom+"   "+surcom+"<br>\n";

	};

	rt6.close();
} else allcom =" No test information, No Commitee";

String q7 = "SELECT	NAME  FROM SCH_ASSIGNED,SCHOLARSHIP_INFO WHERE SCH_ASSIGNED.SCH_ID=SCHOLARSHIP_INFO.SCH_ID AND STD_ID= '"+stdid+"'";

ResultSet rt7 = statement.executeQuery(q7);

while (rt7.next())
	{	
		sch = rt7.getString(1);
		allsch=allsch+"<tr>                     <td width=\"11%\">&nbsp;</td>                    <td width=\"89%\">"+sch+"</td>                  </tr>\n";

	};

	rt7.close();

String q8 = "SELECT	PROJ_NAME,PRINT_COST+MAKE_BOOK_COST+COM_MAT_COST+OFF_MAT_COST AS TOTAL  FROM PROJ_MON_SUPPORT WHERE STD_ID= '"+stdid+"'";

ResultSet rt8 = statement.executeQuery(q8);
String pjname="";
String total ="";
while (rt8.next())
	{	
		pjname = rt8.getString(1);
		total=rt8.getString(2);
		allproj =allproj +"<tr>                     <td width=\"11%\">&nbsp;</td>                    <td width=\"89%\">"+pjname+"&nbsp;&nbsp;&nbsp;Total&nbsp;&nbsp;&nbsp;"+total+"&nbsp;&nbsp;Baht"+"</td>                  </tr>\n";

	};

	rt8.close();
	
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
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="17%"><font face="Cordia New, CordiaUPC" size="4">รหัสนักศึกษา</font></td>
                    <td width="83%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=stdid%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4">ชื่อ</font></td>
                    <td width="8%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=frt%></font></td>
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=snamet%> 
                      </font></td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4">สกุล</font></td>
                    <td width="52%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=ssurt%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="6%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">คณะ</font></td>
                    <td width="31%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">-</font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">หลักสูตร</font></td>
                    <td width="54%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">-</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="6%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">สาขา</font></td>
                    <td width="31%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">-</font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">แขนง</font></td>
                    <td width="54%"><font face="Cordia New, CordiaUPC" size="4" color="#0066FF">-</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="27"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="27"><font face="Cordia New, CordiaUPC" size="4">แผน 
                -</font></td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="18%"><font face="Cordia New, CordiaUPC" size="4">หัวข้อวิทยานิพนธ์</font></td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4">ภาษาไทย</font></td>
                    <td width="67%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=thet%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="18%">&nbsp;</td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4">ภาษาอังกฤษ</font></td>
                    <td width="67%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=thee%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4">อาจารย์ที่ปรึกษา</font></td>
                    <td width="66%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tcon%></font></td>
                    <td width="8%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4">อาจารย์ควบคุมวิทยานิพนธ์</font></td>
                    <td width="66%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tsup%></font></td>
                    <td width="8%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"><b><font face="Cordia New, CordiaUPC" size="4">ผลงานวิจัย</font></b></td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <%=allpaper%> 
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"><b><font face="Cordia New, CordiaUPC" size="4">ทุนที่นักศึกษาได้รับ</font></b></td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <%=allsch%> 
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%" height="18">&nbsp;</td>
              <td width="97%" height="18">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%" height="18">&nbsp;</td>
              <td width="97%" height="18"><font face="Cordia New, CordiaUPC" size="4"><b>ทุนสนับสนุนการทำวิทยานิพนธ์</b></font></td>
            </tr>
            <tr>
              <td width="3%" height="18">&nbsp;</td>
              <td width="97%" height="18">
			  <table width="100%" cellspacing="0" cellpadding="0">
                  <%=allproj%> 
                </table>
			</td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"><b><font face="Cordia New, CordiaUPC" size="4">การสอบวิทยานิพนธ์</font></b></td>
            </tr>
            <tr> 
              <td width="3%" height="18">&nbsp;</td>
              <td width="97%" height="18">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%" height="18"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%" height="18"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4">ปีการศึกษา</font></td>
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=theacad%></font></td>
                    <td width="11%"><font face="Cordia New, CordiaUPC" size="4">ภาคเรียนที่</font></td>
                    <td width="53%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=thesem%></font></td>
                  </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4">วันสอบ</font></td>
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=thetestdate%></font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4">ห้องสอบ</font></td>
                    <td width="55%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=theroom%></font></td>
                  </tr>
                </table>
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="13%"><font face="Cordia New, CordiaUPC" size="4">เวลาสอบ</font></td>
                    <td width="87%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=thestime%>&nbsp;&nbsp;-&nbsp;&nbsp;<%=theetime%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="19%"><font face="Cordia New, CordiaUPC" size="4">วันส่งวิทยานิพนธ์</font></td>
                    <td width="81%"><%=thesenddate%></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><%=allcom%></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%">&nbsp;</td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4">ข้อมูลส่วนตัวนักศึกษา</font></b></td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">ที่อยู่</font></td>
                    <td width="88%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=add%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">จังหวัด</font></td>
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=state%></font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4">ประเทศ</font></td>
                    <td width="22%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=country%> 
                      </font></td>
                    <td width="18%"><font face="Cordia New, CordiaUPC" size="4">รหัสไปรษณีย์</font></td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=zip%> 
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">เบอร์โทร</font></td>
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tel%></font></td>
                    <td width="7%">&nbsp;</td>
                    <td width="58%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">อีเมล์</font></td>
                    <td width="23%"><a href="mailto:<%=email%>"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=email%></font></a></td>
                    <td width="7%">&nbsp;</td>
                    <td width="58%">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
          </table>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
