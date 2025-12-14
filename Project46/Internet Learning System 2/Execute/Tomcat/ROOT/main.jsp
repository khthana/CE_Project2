<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Internet Learning System</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<LINK href="css/default.css" type=text/css rel=stylesheet>
<SCRIPT TYPE="text/javascript">
<!--
function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, 'width=800,scrollbars=yes');
return false;
}
//-->
</SCRIPT>

</head>

<body  background="images/bg.gif">
<%
		int error=0;
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
		Statement stmt = mycon.createStatement();
		String sql = "SELECT * FROM login WHERE username='"+username+"'";
		//String sql = "SELECT count(*) as num  FROM login WHERE username='"+username+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
			{
					if(rs.getString("password").equals(password))
					{
						session.setAttribute("auth",username);
						//out.println(session.getAttribute("auth"));
					    response.sendRedirect("membersection.jsp");
						/*out.println("<br><center><font color=orange>login ถูกต้อง<br>");
						out.println("<center><a href='regis_course.jsp'>ดูรายละเอียดของการลงทะเบียน</a>");
						out.println("|<a href='show_profile.jsp'>แสดงราบละเอียดของสมาชิก</a>");
						out.println("|<center><a href='clear.jsp'>กลับไปหน้าหลัก</a><br>");*/
					}
					else
					{
						error=1;
						out.println("<br><br>");
						out.println("<center><font color=red>USERNAME หรือ PASSWORD ไม่ถูกต้อง");
						out.println("<br><center><a href='main.jsp'>กลับไปหน้าหลัก</a>");	
					 } 
			}
			rs.close();
			stmt.close();
			mycon.close();

%>
 
 <table width="100%" height="300" border="0" cellpadding="0" cellspacing="0"  border="1">
    <tr> 
      <td height="100" colspan="3"><img src="images/logo.gif"></td>
    </tr>
    <tr> 
		<form name="login" method="post" action="main.jsp">
       <td width="30%" rowspan="2" align="center" valign="top" background="/images/p23.gif"><br><font color="#066618" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Login</strong></font> <br> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="24%" height="43" align="center"><font color="#066618" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>Username</strong></font></td>
            <td width="76%" align="center"> <input type="text" name="username"></td>
          </tr>
          <tr> 
            <td height="48" align="center"><font color="#066618" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>Password</strong></font></td>
            <td align="center"><input type="password" name="password"> </td>
          </tr>
        </table></div>
        <img src="images/login.gif"> <input name="login" type="submit"   value="login" border="0"><br>
      <a href="mailform.jsp"><img src="images/forget.gif" border="0"></a> </td>
      </form>
    <td height="30" align="right" background="images/middle.gif"><A  
      href="main.jsp"> หน้าหลัก </A> |<A 
   HREF="be_ourmember.jsp" 
   onClick="return popup(this, 'be_ourmember')">สมัครสมาชิก</A>| <A 
      href="course.jsp"> หลักสูตร </A><!-- <A 
      href="boardlist.jsp"> เว็บบอร์ด </A>|--> | <A 
      href="whoarewe.jsp"   
	  onClick="return popup(this, 'whoarewe')"> Who are we ? </A> |<A 
      href="contactus.jsp" > Contact us </A><br>
	 
	</td>
	</tr>
	<tr> 
      <td height="300" valign="top" align="left"  >
			<table width="100%" border="0" cellspacing="0"  cellpadding="0">
				<tr>
					<td width="350" align="center" valign="top" > <img src="images/logo2.gif"/>
					<font color="#000FE5" size="-7" face="MS Sans Serif, Tahoma, sans-serif">ข่าวประกาศ</font><br>
					<table width="80%"  cellspacing="0" cellpadding="0" border="0"  background='/images/p23.gif'>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news1.jsp" >#First news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news2.jsp" >#Second news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news3.jsp" >#Trind news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news4.jsp" >#Fourth news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news5.jsp" >#Fiveth news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news6.jsp" >#Sixth news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news7.jsp" >#Seventh news information!</a></td></tr>
					<tr><td align="center" valign="middle">&nbsp;<img src="images/icon9.gif" border="0" ></td><td align="left"><a href="news8.jsp" >#Eighth news information!</a></td></tr>
					</table>

					
					</td>
					<td  align="center" background="images/middle6.gif"><font face="MS Sans Serif, Arial, Helvetica, Thonburi" size="1" color="#FFFFFF" class ="THAI">><b>ข่าววันนี้</b></font><br>
					<table width="100%" border="1" cellspacing="0" bordercolor="#000FE5"  bgcolor="99CCFF" cellpadding="0">
						<tr>
						<td>
						<marquee  align="center" behavior="scroll" direction="up" height="150" width="100" 	scrollamount="1" 
						scrolldelay="80" onMouseOver="this.stop()" onMouseOut="this.start()" >
						<div align="center"><font color="#FF3300" size="-7" face="MS Sans Serif, Tahoma, sans-serif"> 
						 New Update Hello how are you? </font></div> 
						</marquee>
						</tr>
						</td>
					</table>
					</td>
				</tr>
				<tr>
				<td></td>
				<td>
<!--Calendar-->
<html>
<head>
<title>Thailand The Big Picture</title>
<meta http-equiv="Content-Type" content="text/html; charset=Tis-620">
<script language="javascript" src="cengine.js"></script>
	<script language="javascript" src="cengine.js"></script>
	<script language="javascript" src="other_scriptsth.js"></script>
	<script language="javascript">
	<!--
	
	var mo = "";
	var year = "";
	var currentmonth = today.getMonth();
	var currentyear = today.getFullYear();
	
	//cookies are not found
	if(document.cookie == "") {
		mo = today.getMonth();
                                year = today.getFullYear();
	} else {
		mo = getCookie('whichmonth');
                                //correct cookie is NOT set
		if(mo == null) {
			mo = today.getMonth();
                                               	year = today.getFullYear();
			//alert number of reminders to user
			alertReminders();
		}
		//correct cookie is set
		else {
			mo = getCookie('whichmonth');
			year = getCookie('whichyear');
		}
	}
              
	
                
	//set a session cookie
	setCookie('whichmonth',mo);
	setCookie('whichyear', year);
	
	//backup one month and refresh
	function backup() {
		//check for a new year being set
		if(mo > 0) {
			mo--;
                                               
		} else {
			mo = 11;
			//check for 19**
			if(year == 2000) {
				year = 1999;
			} else if(year <= 1999) {
				syear = year.substring(2,year.length);
				syear--;
				year = "19" + syear;
				Number(year);
			} else {
				year--;
			}
		}
                               
		setCookie('whichmonth',mo);
		setCookie('whichyear', year);
		
		//check for open child windows and close.
		if(child && !child.closed) {
			child.close();
		}
		 
		document.location="nectec.php";
	}
	
	//go forward one month and refresh
	function stepup() {
		//check for a new year being set
		if(mo <  11) {
			mo++;
		} else {
			mo = 0;
			year++;
		}
		setCookie('whichmonth',mo);
		setCookie('whichyear', year);
		
		//check for open child windows and close.
		if(child && !child.closed) {
			child.close();
		}
		
		document.location="nectec.php";
	}
	
	//first starting day of month
                var test = (mo-1)+2;
                //??????????
	var first = months[mo] + " 01, " + year;
	firstday = new Date(first);
	startday = firstday.getDay();

	//variable for day count
	var count = 1;
	//variables for leap year
	var factor = startday - 1;
	var endday = parseInt(monthlen[mo]) + factor;
	
	var calbg = "#CCCCCC";
	var calwidth = "100";
	var twidth = "10";
	var theight = "20";
	
	var monthbg = "#CCCCCC";
	var monfam = "arial,helvetica";
	var monsize = "1"
	var moncol = "#ffffff"
	
	var weekbg = "#eeeeee";
	var weekfam = "arial,helvetica";
	var weeksize = "1";
	var weekcol = "#999900";
	
	var daybg = "#E1F0FF";
	var dayfam = "verdana,arial,helvetica";
	var daysize = "1";
	var daycol = "#3972B1";
	var sdaycol = "#ff0000";

	var calendar = "";
	calendar =  "<table bgcolor='" + calbg + "' width='185  ' border='0' cellpadding='0' cellspacing='0'>";
	calendar += "<tr>";
	calendar += "<td align='center'>";
	
<!-- Month Starts Here -->
		calendar += "<table width='185' border='0' cellpadding='0' cellspacing='0' >";
		calendar += "<tr>";
		calendar += "<td align='center'> <a href='javascript:backup();'><font color='#3972B1' size ='1'><b><<</b></font></a> </td>";
		calendar += "<td width='185' bgcolor='" + monthbg + "' align='center'><font face='arial,helvetica' size='1' color='#666666'><b>";
		calendar += "<a href='javascript://' onclick=javascript:open_window('notecalendarmonth.php?&updatemonth="+year+"-"+test+"',400,350,0,1);><font color='#3972B1'>" + months[mo] + ", " + year + "</font></a>";
		calendar += "</b></font></td>";
		calendar += "<td align='center'> <a href='javascript:stepup();'><font color='#3972B1' size ='1'><b>>></b></font></a> </td>";
		calendar += "</tr>";
		calendar += "</table>";
<!-- Month Ends Here -->	
	
	calendar += "</td>";
	calendar += "</tr>";
	calendar += "<tr>";
	calendar += "<td align='center'>";
	
<!-- Week Starts Here -->
	calendar += "<table width='185' border='0' cellpadding='0' cellspacing='0'>";
	calendar += "<tr>";

	for(i = 0; i < 7; i++) {
		calendar += "<td width='185' bgcolor='" + weekbg + "' align='center' valign='middle'  ><font face='" + weekfam + "' size=" + weeksize + " color=" + weekcol + " class='THAI'><b>";
		calendar += days[i];
		calendar += "</b></font></td>";
	}

	calendar += "</tr>";
	calendar += "</table>";
<!-- Week Ends Here -->
	
	calendar += "</td>";
	calendar += "</tr>";
	calendar += "<tr>";
	calendar += "<td align='center'>";
	
<!-- Day Starts Here -->
		calendar += "<table width='185' border='1' cellpadding='1' cellspacing='1' bordercolor = '#CCCCCC' bgcolor ='#D5D5D5' >";
		calendar += "<tr>";
		
		if(startday > 0) {
			for(empty = 0; empty < startday; empty++) {
				calendar += "<td width='" + twidth + "'  bgcolor='#D5D5D5' bordercolor ='#D5D5D5' ></td>";
			}
		}
		
		for(i = startday; i <= endday;i++) {
			if( (i % 7) == 0) {
				calendar += "</tr><tr>";
			}
			
			//keep highlight info on the current month and day
			if( (i - (startday - 1)) == dt && currentmonth == mo && currentyear == year) {
				calendar += "<td   width='" + twidth + "'  bgcolor='#eeeeee'  align='right' valign='top' bordercolor = '#E1F0FF' ><font face='" + dayfam + "' size=" + daysize + "><b>";
				calendar += "<a href='javascript://' onclick=javascript:open_window('notecalendar.php?&update="+year+"-"+test+"-"+count+"',400,350,0,1);><font color=" + sdaycol + ">" + count + "</font></a>";
				if(currentmonth == mo && currentyear == year && document.cookie) {
					var isremind = getCookie(months[mo] + count);
					if(isremind) { //if a reminder exists for this day
						isremind = isremind.split("|");
						calendar += "<p><div align='center'><img src='reminder.gif' width='11' height='11' alt='you have " + isremind.length + " reminder(s)'></div>";
					}
				}
				calendar += "</b></font></td>";
			} else {
				calendar += "<td width='" + twidth + "' bgcolor='#eeeeee'  align='right' valign='top' bordercolor = '#E1F0FF'><font face='" + dayfam + "' size=" + daysize + ">";
				calendar += "<a href='javascript://' onclick=javascript:open_window('notecalendar.php?&update="+year+"-"+test+"-"+count+"',400,350,0,1);><font color=" + daycol + ">" + count + "</font></a>";
				if(document.cookie) { //allows reminders to be displayed on other months
					var isremind = getCookie(months[mo] + count);
					if(isremind) { //if a reminder exists for this day
						isremind = isremind.split("|");
						calendar += "<p><div align='center'><img src='reminder.gif' width='11' height='11' alt='you have " + isremind.length + " reminder(s)'></div>";
					}
				}
				calendar += "</font></td>";
			}
			
			count++;
		}
		
		calendar += "</tr>";
		calendar += "</table>";
<!-- Day Ends Here -->

	calendar += "</td>";
	calendar += "</tr>";
	calendar += "</table>";
	
	function open_all(url) {
		child = window.open(url,"allreminders", "width=430,height=400,resizable=0,scrollbars=1");
	}
	
	function alertReminders() {
	
		var alertit = getCookie(months[today.getMonth()] + dt);
		
		if(alertit != null) {
			alertit = alertit.split("|");
			
			//write out reminders into a string for display
			textit = "  1. " + alertit[0];
			for(var i = 1; i < alertit.length; i++) {
				textit += "\n  " + (i + 1) + ". " + alertit[i];
			}
			
			//alert user of number of reminders for which day and display those reminders
			alert("You have " + alertit.length + " reminder(s) for " + months[today.getMonth()] + " " + dt + ".\n\n" + textit);
		}
	}
	
	//-->
	</script>

</head>
<body>
 <script language="javascript">
<!--
	document.write(calendar);
	if(child && !child.closed) {
		child.focus();
	}
//-->
</script>
</body>
</html>   

<jsp:include page="useronline.jsp"/>
				</td>
				
				</tr>
			  </table>
	  </td>
    </tr>
    
  </table>
</body>
</html>
