<%@ page contentType="text/html; charset=TIS-620"%>
<%@page import="java.sql.*"%>
<html>
<title>Show Data</title>
<body>
<%
			String input = request.getParameter("num");
			int newinput=0;
			int index=0;
			int newindex=0;
			newinput=Integer.parseInt(input);
			
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sqla = "SELECT  id FROM info";
			ResultSet rs = stmt.executeQuery(sqla);
				while(rs.next())
			{
				index=Integer.parseInt(rs.getString("id"));	
				if(index==newinput)
					newindex=newinput;
			}
			rs.close();
			out.println("<center><b>รายละเอียดการลงทะเบียน</b></center><br>");
			String sql = "SELECT title,name,surname,nameeng,surnameeng,birthday,age,height,weight,houseid,road,town,city,province,status2,militarystatus2,workout2,homenumber,mobilenumber,email,level1,degree1,fromdate1,frommonth1,fromyear1,institute1,major1,grade1,todate1,tomonth1,toyear1,level2,degree2,fromdate2,frommonth2,fromyear2,institute2,major2,grade2,todate2,tomonth2,toyear2,workfromdate1,workfrommonth1,workfromyear1,worktodate1,worktomonth1,worktoyear1,company1,position1,lastpay1,workfromdate2,workfrommonth2,workfromyear2,worktodate2,worktomonth2,worktoyear2,company2,position2,lastpay2,englishspeak,chinesespeak,englishread,chineseread,englishwrite,chinesewrite,otherlang,computer,otherinfo FROM info WHERE id = ' "+newindex+" ' ";
			ResultSet myresult=stmt.executeQuery(sql);
						while(myresult.next())
			{
			out.println("<table width='80%' align=center>");
			out.println("<tr><td width='25%'><font size=2>คำนำหน้า</td><td>"+myresult.getString("title")+"</font></td></tr>");
			out.println("<tr><td><font size=2>ชื่อ</td><td>"+myresult.getString("name")+"</font></td></tr>");
			out.println("<tr><td><font size=2>นามสกุล</td><td>"+myresult.getString("surname")+"</font></td></tr>");
			out.println("<tr><td><font size=2>ชื่อ(ภาษาอังกฤษ)</td><td>"+myresult.getString("nameeng")+"</font></td></tr>");
			out.println("<tr><td><font size=2>นามสกุล(ภาษาอังกฤษ)</td><td>"+myresult.getString("surnameeng")+"</font></td></tr>");
			out.println("<tr><td><font size=2>วันเดื่อนปีเกิด</td><td>"+myresult.getString("birthday")+"</font></td></tr>");
			out.println("<tr><td><font size=2>อายุ</td><td>"+myresult.getString("age")+"</font></td></tr>");
			out.println("<tr><td><font size=2>ความสูง</td><td>"+myresult.getString("height")+"</font></td></tr>");
			out.println("<tr><td><font size=2>น้ำหนัก</td><td>"+myresult.getString("weight")+"</font></td></tr>");
			out.println("<tr><td><font size=2>บ้านเลขที่</td><td>"+myresult.getString("houseid")+"</font></td></tr>");
			out.println("<tr><td><font size=2>ถนน</td><td>"+myresult.getString("road")+"</font></td></tr>");
			out.println("<tr><td><font size=2>แขวง/ตำบล</td><td>"+myresult.getString("town")+"</font></td></tr>");
			out.println("<tr><td><font size=2>เขต/อำเภอ</td><td>"+myresult.getString("city")+"</font></td></tr>");
			out.println("<tr><td><font size=2>จังหวัด</td><td>"+myresult.getString("province")+"</font></td></tr>");
			out.println("<tr><td><font size=2>สถานภาพ</td><td>"+myresult.getString("status2")+"</font></td></tr>");
			out.println("<tr><td><font size=2>สถานภาพทางทหาร</td><td>"+myresult.getString("militarystatus2")+"</font></td></tr>");
			out.println("<tr><td><font size=2>การปฏิบัติงานในต่างจังหวัด</td><td>"+myresult.getString("workout2")+"</font></td></tr>");
			out.println("<tr><td><font size=2>หมายเลขโทรศัพท์บ้าน</td><td>"+myresult.getString("homenumber")+"</font></td></tr>");
			out.println("<tr><td><font size=2>หมายเลขโทรศัพท์มือถือ</td><td>"+myresult.getString("mobilenumber")+"</font></td></tr>");
			out.println("<tr><td><font size=2>Email Address</td><td>"+myresult.getString("email")+"</font></td></tr>");
			out.println("</table><br>");			
			out.println("<table width='80%' align=center>");
			out.println("<tr><td width='20%' ><font size='2'><strong>ระดับการศึกษา</strong></font></td>");
			out.println("<td width='30%' >"+myresult.getString("level1")+"</td><td width='30%' align='center' >"+myresult.getString("level2")+"</td></tr>");
			out.println("<tr><td><font size='2'><strong>วุฒิการศึกษา</strong></font></td>");
			out.println("<td>"+myresult.getString("degree1")+"</td><td>"+myresult.getString("degree2")+"</td></tr>");
			out.println("<tr><td><font size='2'><strong>จาก</strong></font></td>");
			out.println("<td  >"+myresult.getString("fromdate1")+"/"+myresult.getString("frommonth1")+"/"+myresult.getString("fromyear1")+"</td><td >"+myresult.getString("fromdate2")+"/"+myresult.getString("frommonth2")+"/"+myresult.getString("fromyear2")+"</td></tr>");
			out.println("<tr><td><font size='2'><strong>ถึง</strong></font></td>");
			out.println("<td>"+myresult.getString("todate1")+"/"+myresult.getString("tomonth1")+"/"+myresult.getString("toyear1")+"</td><td >"+myresult.getString("todate2")+"/"+myresult.getString("tomonth2")+"/"+myresult.getString("toyear2")+"</td></tr>");
			out.println("<tr><td><font size='2'><strong>สถาบัน</strong></font></td>");
			out.println("<td>"+myresult.getString("institute1")+"</td><td>"+myresult.getString("institute2")+"</td></tr>");
			out.println("<tr><td><font size='2'><strong>สาขา</strong></font></td>");
			out.println("<td>"+myresult.getString("major1")+"</td><td>"+myresult.getString("major2")+"</td></tr></table>");
			out.println("</tr></table><br>");
			out.println("<table width='80%' align=center >");
			out.println("<tr><td width='20%'><font size=2><strong>เริ่มต้นทำงานจาก</strong></font></td>");
			out.println("<td width='60%'  >"+myresult.getString("workfromdate1")+"/"+myresult.getString("workfrommonth1")+"/"+myresult.getString("workfromyear1")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>สิ้นสุดการทำงานที่</strong></font></td>");
			out.println("<td  >"+myresult.getString("worktodate1")+"/"+myresult.getString("worktomonth1")+"/"+myresult.getString("worktoyear1")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>บริษัท</strong></font></td>");
			out.println("<td>"+myresult.getString("company1")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ตำแหน่งสุดท้าย</strong></font></td>");
			out.println("<td>"+myresult.getString("position1")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>เงินเดือนสุดท้าย</strong></font></td>");
			out.println("<td>"+myresult.getString("lastpay1")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>เริ่มต้นทำงานจาก</strong></font></td>");
			out.println("<td >"+myresult.getString("workfromdate2")+"/"+myresult.getString("workfrommonth2")+"/"+myresult.getString("workfromyear2")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>สิ้นสุดการทำงานที่</strong></font></td>");
			out.println("<td  >"+myresult.getString("worktodate2")+"/"+myresult.getString("worktomonth2")+"/"+myresult.getString("worktoyear2")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>บริษัท</strong></font></td>");
			out.println("<td>"+myresult.getString("company2")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ตำแหน่งสุดท้าย</strong></font></td>");
			out.println("<td>"+myresult.getString("position2")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>เงินเดือนสุดท้าย</strong></font></td>");
			out.println("<td>"+myresult.getString("lastpay2")+"</td></tr>");
			out.println("</table><br>");
			out.println("<table width='80%' align=center >");
			out.println("<tr><td width='20%'><font size=2><strong>ภาษาอังกฤษ(พูด)</strong></font></td>");
			out.println("<td width='60%'>"+myresult.getString("englishspeak")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ภาษาอังกฤษ(อ่าน)</strong></font></td>");
			out.println("<td>"+myresult.getString("englishread")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ภาษาอังกฤษ(เขียน)</strong></font></td>");
			out.println("<td>"+myresult.getString("englishwrite")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ภาษาจีน(พูด)</strong></font></td>");
			out.println("<td>"+myresult.getString("chinesespeak")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ภาษาจีน(อ่าน)</strong></font></td>");
			out.println("<td>"+myresult.getString("chineseread")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ภาษาจีน(เขียน)</strong></font></td>");
			out.println("<td>"+myresult.getString("chinesewrite")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ภาษาอื่นๆ</strong></font></td>");
			out.println("<td>"+myresult.getString("otherlang")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ความสามารถคอมพิวเตอร์</strong></font></td>");
			out.println("<td>"+myresult.getString("computer")+"</td></tr>");
			out.println("<tr><td><font size=2><strong>ข้อมูลอื่นๆเพิ่มเติม</strong></font></td>");
			out.println("<td>"+myresult.getString("otherinfo")+"</td></tr>");
					}
			myresult.close();
			stmt.close();
			mycon.close();
%>
</body>
</html>
