<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<title>Check Error</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="images/bg.gif">
<%
	int error = 0;
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String surname = request.getParameter("surname");
	String nameeng = request.getParameter("nameeng");
	String surnameeng = request.getParameter("surnameeng");
	String birthday = request.getParameter("birthday");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	String houseid = request.getParameter("houseid");
	String road = request.getParameter("road");
	String town = request.getParameter("town");
	String city = request.getParameter("city");
	String province = request.getParameter("province");
	String postalcode = request.getParameter("postalcode");
	String homenumber = request.getParameter("homenumber");
	String mobilenumber = request.getParameter("mobilenumber");
	String email = request.getParameter("email");
	String level1 = request.getParameter("level1");
	String level2 = request.getParameter("level2");
	String degree1 = request.getParameter("degree1");
	String degree2 = request.getParameter("degree2");
	String fromdate1 = request.getParameter("fromdate1");
	String fromdate2 = request.getParameter("fromdate2");
	String frommonth1 = request.getParameter("frommonth1");
	String frommonth2 = request.getParameter("frommonth2");
	String fromyear1 = request.getParameter("fromyear1");
	String fromyear2 = request.getParameter("fromyear2");
	String todate1 = request.getParameter("todate1");
	String todate2 = request.getParameter("todate2");
	String tomonth1 = request.getParameter("tomonth1");
	String tomonth2 = request.getParameter("tomonth2");
	String toyear1 = request.getParameter("toyear1");
	String toyear2 = request.getParameter("toyear2");
	String institute1 = request.getParameter("institute1");
	String institute2 = request.getParameter("institute2");
	String major1 = request.getParameter("major1");
	String major2 = request.getParameter("major2");
	String grade1 = request.getParameter("grade1");
	String grade2 = request.getParameter("grade2");
	String age = request.getParameter("age");
	//login
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String cpassword = request.getParameter("cpassword");
					
		if(title.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบคำนำหน้าให้ถูกต้อง</font></center>");
	}
		if(name.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อให้ถูกต้อง</font></center>");
	}
		if(surname.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบนามสกุลให้ถูกต้อง</font></center>");
	}
		if(nameeng.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อภาษาอังกฤษให้ถูกต้อง</font></center>");
	}
		if(surnameeng.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบนามสกุลภาษาอังกฤษให้ถูกต้อง</font></center>");
	}
		if(birthday.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบวันเกิดให้ถูกต้อง</font></center>");
	}
		if (age.equals(""))
		{
			error = 1;
			out.println("<center><font color =red size =2> ตรวจสอบอายุให้ถูกต้อง</font></center>");
		}
		if(height.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบความสูงให้ถูกต้อง</font></center>");
	}
		if(weight.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบน้ำหนักให้ถูกต้อง</font></center>");
	}
		if(houseid.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบบ้านเลขที่ให้ถูกต้อง</font></center>");
	}
		if(road.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบถนนให้ถูกต้อง</font></center>");
	}
		if(town.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบแขวง/ตำบลให้ถูกต้อง</font></center>");
	}
		if(city.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบเขต/อำเภอให้ถูกต้อง</font></center>");
	}
		if(province.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบจังหวัดให้ถูกต้อง</font></center>");
	}
		if(postalcode.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบรหัสไปรษณีย์ให้ถูกต้อง</font></center>");
	}
		if(homenumber.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบหมายเลขโทรศัพท์ที่บ้านให้ถูกต้อง</font></center>");
	}
		if(mobilenumber.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบหมายเลขโทรศัพท์มือถือให้ถูกต้อง</font></center>");
	}
		if(email.equals("") || email.indexOf('@')==-1 || email.indexOf('.')==-1)
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบอีเมล์แอดเดรสให้ถูกต้อง</font></center>");
	}
		if(level1.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบระดับการศึกษาให้ถูกต้อง</font></center>");
	}
		if(degree1.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบวุฒิการศึกษาให้ถูกต้อง</font></center>");
	}
		if(institute1.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบสถาบันการศึกษาให้ถูกต้อง</font></center>");
	}
		if(major1.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบสาขาวิชาให้ถูกต้อง</font></center>");
	}
		if(grade1.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบเกรดเฉลี่ยให้ถูกต้อง</font></center>");
	}
		if(username.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบusernameให้ถูกต้อง</font></center>");
	}
		if(password.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบpasswordให้ถูกต้อง</font></center>");
	}
		if(cpassword.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบconfirm passwordให้ถูกต้อง</font></center>");
	}
	if (error==1)
	{out.println("<br><br>");
		out.println("<center><b><a href='be_ourmember.jsp'><font size=2>คลิ้กที่นี่เพื่อกลับไปสมัครใหม่</font></a></b></center>");
	}
	if (error==0)
	{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			/*String  sql = "SELECT COUNT(*) AS num FROM info WHERE surname =' "+surname+" ' " ;
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next())
		{	
			if (rs.getInt("num")==1)
			{
				error = 1;
				out.println("<center><font color=red>ชื่อ-นามสกุลนี้มีอยู่ในฐานข้อมูลแล้วกรุณาใช้ชื่อใหม่</font></center>");
			}
			else
			{*/
				String sql = "INSERT INTO info VALUES('','"+title+"','"+name+" ','"+surname+"','"+nameeng+"','"+surnameeng+"','"+birthday+"','"+age+"','"+height+"','"+weight+"','"+houseid+"','"+road+"','"+town+"','"+city+"','"+province+"','"+postalcode+"','"+homenumber+"','"+mobilenumber+"','"+email+"','"+level1+"','"+degree1+"','"+institute1+"','"+major1+"','"+grade1+"','"+level2+"','"+degree2+"','"+institute2+"','"+major2+"','"+grade2+"','"+username+"','"+password+"','"+cpassword+"')";
				int myresult = stmt.executeUpdate(sql);
				if (myresult!=0)
				{
					out.println("<center><b>การสมัครสมบูรณ์แล้ว<br>");
				
				}
				stmt.close();
				mycon.close();
				Class.forName("org.gjt.mm.mysql.Driver");
			    Connection mycon2 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			  	Statement stmt2=mycon2.createStatement();
				String sql2= "INSERT INTO login VALUES('"+username+"','"+password+"')";
				int myresult2 = stmt2.executeUpdate(sql2);
				if (myresult2!=0)
				{  out.println("<center><b>ลงทะเบียนเสร็จสมบูรณ์แล้ว<br><br>");
					//out.println("<a '>คลิ้กที่นี่เพื่อกลับไปยังหน้าแรก</a></b></center>");
				}
			//} 
			
		//}
		//rs.close();
		
		stmt2.close();
		mycon2.close();  
	}
	%>
</body>
</html>
