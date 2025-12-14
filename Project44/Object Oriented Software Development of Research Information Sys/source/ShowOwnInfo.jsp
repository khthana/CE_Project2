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
<%@  include file ="checksessionT.inc" %>
<%@  page import="java.sql.*, java.util.*, java.io.*"  %>
<%
		String tid= request.getParameter("tid");


		String msgout = "";
		String tcode="";
		String tnamet="";
		String tsurt="";
		String frt="";
		String  fre="";
		String tnamee="";
		String tsure="";
		String acadt="";
		String acade ="";
		String bdate="";

		String stat1="";
		String stat11="";

		String stat2="";
		String stat21="";
		String stat22="";

		String stat3="";
		String stat31="";
		String stat32="";

		String stat4="";
		String stat41="";
		String stat42="";

		String yearfin ="";
		String major="";
		String deg ="";
		String place="";
		String degdes="";
		String alldeg="";
		String add="";
		String state="";
		String country ="";
		String zip="";
		String tel="";
		String fax="";
		String email="";
		String url="";
		String spec="";
		String allspec="";
		String syear="";
		String sub="";
		String allsub="";
		String facn="";
		String admin="";
		
		
	try
      {        
	String stat10="",stat20="",stat30="",stat40="";
	String userid = "dong";
    String passwd = "DONG353";
	String urldb = "jdbc:db2://161.246.5.99/EXAMPLE";
	Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
    Connection dbconn = DriverManager.getConnection( urldb, userid, passwd );
	Statement statement = dbconn.createStatement();
/*
	String q1 = " SELECT DISTINCT FAC_NAME_TH FROM FACULTY_INFO,TEACHER_INFO WHERE FACULTY_INFO.FAC_ID= TEACHER_INFO.DEPT_ID";

	ResultSet  rs = statement.executeQuery(q1);

	while (rs.next()) {
		facn = rs.getString(1);
	};
	rs.close();
*/
	String qt = "SELECT T_CODE,PRE_NAME_EN,PRE_NAME_TH,ACAD_POS_EN,ACAD_POS_TH,NAME_EN,NAME_TH,SURNAME_EN,SURNAME_TH,BIRTH_DATE,ADDRESS,STATE,COUNTRY,ZIP,TEL_NUMBER,FAX,EMAIL,URL,YEAR_EXP,TEACH_LEVEL,TEACH_CON_LEV,TEST_LEVEL,FAC_MEMBER_STATUS,ACAD_ADMIN_POS,FAC_NAME_TH  FROM TEACHER_INFO,FACULTY_INFO WHERE TEACHER_INFO.T_ID= "+tid+" AND TEACHER_INFO.DEPT_ID=FACULTY_INFO.FAC_ID";
	ResultSet rt = statement.executeQuery(qt);
			while (rt.next())
			{	tcode		= rt.getString(1);
				fre			= rt.getString(2);
				frt				=rt.getString(3);
				acade		= rt.getString(4);
				acadt		=rt.getString(5);
				tnamee	=rt.getString(6);
				tnamet		=rt.getString(7);
				tsure		=rt.getString(8);
				tsurt			=rt.getString(9);
				bdate		= rt.getString(10);
				add			= rt.getString(11);
				state		=rt.getString(12);
				country	= rt.getString(13);
				zip			= rt.getString(14);
				tel			= rt.getString(15);
				fax			= rt.getString(16);
				email		= rt.getString(17);
				url			= rt.getString(18);
				syear		= rt.getString(19);
				stat20		= rt.getString(20);//teach level
				stat40		= rt.getString(21);//con level
				stat30		= rt.getString(22);
				stat10		= rt.getString(23);
				admin		= rt.getString(24);
				facn			= rt.getString(25);
			}
			rt.close();
//			out.print(stat10);

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
	

			// teacher spec 
			
			String qr2 = 	"SELECT  SPEC_EXP FROM TEACHER_SPEC_EXPERT  WHERE T_ID  =  "+tid;

			ResultSet rs2 = statement.executeQuery(qr2);
			
			int count = 1;
			while (rs2.next()){

			spec = rs2.getString(1);
			allspec = allspec + " <tr> <td width=\"10%\">"+count+").</td><td width=\"90%\">"+spec+"</td></tr>";
			count ++;
			};
			rs2.close();

//			allspec = allspec + "</table>";

// teacher degree
			
			String qr3	=	"SELECT DEGREE_KIND,DEGREE_DES,MAJOR, FROM,YEAR_FINISH FROM TEACHER_DEGREE WHERE T_ID =  "+tid;

			ResultSet rs3 = statement.executeQuery(qr3);

			count = 1;
			while (rs3.next()){

			deg = rs3.getString(1);
			degdes = rs3.getString(2);
			major= rs3.getString(3);
			place = rs3.getString(4);
			yearfin = rs3.getString(5);

			alldeg = alldeg + " <tr> <td width=\"5%\" height=\"29\">"+count+".</td>                    <td width=\"5%\" height=\"29\">"+deg+"</td><td width=\"8%\" height=\"29\">"+yearfin+"</td> <td width=\"15%\" height=\"29\">"+major+"</td>          <td width=\"15%\" height=\"29\">"+degdes+"</td><td width=\"52%\" height=\"29\">"+place+" </td></tr>";

			count ++;
			};
			rs3.close();

//			alldeg = alldeg + "</table>";

// subject request

			String q4 = "SELECT SUBJECT_ID FROM TEACHER_SUBJECT_REQ WHERE T_ID = "+tid;
							
				ResultSet rs4 = statement.executeQuery(q4);

				while(rs4.next()) {

				sub = rs4.getString(1);
				allsub = allsub +sub+" <br>\n";

				};
				rs4.close();
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
  <form name="addteacher"  action="Edit_t.jsp">
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#3399FF" bgcolor="#FFFFCC">
    <tr> 
        <td bgcolor="#FFCC66" height="34"> 
          <div align="center">
            <p><font size="4"><b><font color="#0000FF" size="5">รายละเอียดอาจารย์ 
              </font></b></font></p>
            </div>
      </td>
    </tr>
    <tr>
      <td height="27"> 
	 
          <table width="100%" border="0" cellspacing="3" cellpadding="0">
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4">รหัสอาจารย์</font></td>
                    <td width="85%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tcode%></font></td>
                    <input type="hidden" name="tcode" value="<%=tcode%>">
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
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4">ชื่อ(ไทย)</font></td>
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=frt%></font></td>
                    <td width="29%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tnamet%> 
                      </font></td>
                    <input type="hidden" name="tnamet" value="<%=tnamet%>">
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4">สกุล</font></td>
                    <td width="33%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tsurt%></font></td>
                    <input type="hidden" name="tsurt" value="<%=tsurt%>">
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4">ชื่อ(ENG)</font></td>
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=fre%></font></td>
                    <td width="29%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tnamee%></font></td>
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4">สกุล</font></td>
                    <td width="33%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tsure%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="31%"><font face="Cordia New, CordiaUPC" size="4">ตำแหน่งทางวิชาการไทย</font></td>
                    <td width="11%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=acadt%></font></td>
                    <input type="hidden" name="acadt" value="<%=acadt%>">
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4">ENG</font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=acade%></font></td>
                    <td width="9%"><font face="Cordia New, CordiaUPC" size="4">วันเกิด</font></td>
                    <td width="28%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=bdate%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"> 1). 
                สถานภาพเป็นอาจารย์บัณทิต </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT1" value="F" <%=stat1%> >
                      </font></td>
                    <td width="34%"><font face="Cordia New, CordiaUPC" size="4">ประจำ 
                      (FULL TIME)</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT1" value="P" <%=stat11%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4">พิเศษ 
                      (PART TIME)</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4">2). 
                สถานภาพการสอนวิชาในหลักสูตร</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT2" value="M" <%=stat2%> >
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT2" value="D" <%=stat21%> >
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT2" value="A"  <%=stat22%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4">3). 
                สถานภาพในการสอบวิทยานิพนธ์</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT3" value="M" <%=stat3%> >
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT3" value="D" <%=stat31%> >
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT3" value="A" <%=stat32%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4">4). 
                สถานภาพในควบคุมวิทยานิพนธ์</font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT4" value="M" <%=stat4%> >
                      </font></td>
                    <td width="14%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาโท</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT4" value="D" <%=stat41%> >
                      </font></td>
                    <td width="16%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาเอก</font></td>
                    <td width="4%"> <font face="Cordia New, CordiaUPC" size="4"> 
                      <input type="radio" name="STAT4" value="A" <%=stat42%> >
                      </font></td>
                    <td width="58%"><font face="Cordia New, CordiaUPC" size="4">ปริญญาโท-เอก</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4">ประวัติการศึกษา</font></b></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="1" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="5%">&nbsp;</td>
                    <td width="5%"><font face="Cordia New, CordiaUPC" size="4">ระดับ</font></td>
                    <td width="8%"><font face="Cordia New, CordiaUPC" size="4">ปีจบ</font></td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4">วิชาเอก</font></td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4">ชื่อปริญญา</font></td>
                    <td width="52%"><font face="Cordia New, CordiaUPC" size="4">สถานศึกษา</font></td>
                  </tr>
                  <font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=alldeg%> </font>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font> 
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">ที่อยู่</font></td>
                    <td width="88%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=add%></font></td>
                    <input type="hidden" name="oldadd" value="<%=add%>">
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">จังหวัด</font></td>
                    <td width="23%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=state%></font></td>
                    <input type="hidden" name="oldstate" value="<%=state%>">
                    <td width="10%"><font face="Cordia New, CordiaUPC" size="4">ประเทศ</font></td>
                    <td width="22%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=country%> 
                      </font></td>
                    <input type="hidden" name="oldcountry" value="<%=country%>">
                    <td width="18%"><font face="Cordia New, CordiaUPC" size="4">รหัสไปรษณีย์</font></td>
                    <td width="15%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=zip%> 
                      </font></td>
                    <input type="hidden" name="oldzip" value="<%=zip%>">
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">เบอร์โทร</font></td>
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=tel%></font></td>
                    <input type="hidden" name="oldtel" value="<%=tel%>">
                    <td width="7%"><font face="Cordia New, CordiaUPC" size="4">FAX</font></td>
                    <td width="55%"><font face="Cordia New, CordiaUPC" size="4" color="#000000"><%=fax%></font></td>
                    <input type="hidden" name="oldfax" value="<%=fax%>">
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="12%"><font face="Cordia New, CordiaUPC" size="4">อีเมล์</font></td>
                    <td width="26%"><font face="Cordia New, CordiaUPC" size="4"><a href="mailto:<%=email%>" ><%=email%></a></font></td>
                    <input type="hidden" name="oldemail" value="<%=email%>">
                    <td width="7%"><font face="Cordia New, CordiaUPC" size="4">URL</font></td>
                    <td width="55%"><font face="Cordia New, CordiaUPC" size="4"><a href="<%=url%>"><%=url%></a></font></td>
                    <input type="hidden" name="oldurl" value="<%=url%>">
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4">ความเชี่ยวชาญเฉพาะ</font></b></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="3" cellpadding="0">
                  <font face="Cordia New, CordiaUPC" size="4"color="#000000"><%=allspec%> </font>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="52%"><font face="Cordia New, CordiaUPC" size="4">ประสบการณ์ในการทำงาน/สอน/วิจัย 
                      รวม </font></td>
                    <td width="8%"><font face="Cordia New, CordiaUPC" size="4"><%=syear%></font></td>
                    <td width="40%"><font face="Cordia New, CordiaUPC" size="4">ปี</font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><b><font face="Cordia New, CordiaUPC" size="4">รายชื่อวิชาที่คาดว่าจะสอน(รหัสวิชา)</font></b></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> <font face="Cordia New, CordiaUPC" size="4"color="#000000"><%=allsub%> 
                </font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4">คณะที่สังกัด</font></td>
                    <td width="75%"><font face="Cordia New, CordiaUPC" size="4"color="#000000"><%=facn%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="25%"><font face="Cordia New, CordiaUPC" size="4">ตำแหน่งบริหาร</font></td>
                    <td width="75%"><font face="Cordia New, CordiaUPC" size="4"color="#000000"><%=admin%></font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"><font face="Cordia New, CordiaUPC" size="4"></font></td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
              <td width="97%"> 
                <div align="center"> <font face="Cordia New, CordiaUPC" size="4"> 
                  <input type="submit" name="ok" value="แก้ไข">
                  </font></div>
              </td>
            </tr>
            <tr> 
              <td width="3%">&nbsp;</td>
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
