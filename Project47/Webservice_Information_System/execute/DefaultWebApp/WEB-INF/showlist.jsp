<%
String trackno=request.getParameter("track");
String status=new String();
ResultSet result;
int i=0;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url ="jdbc:mysql://localhost:3306/project";
	Connection mycon =DriverManager.getConnection( url,"root", "olala023");
	Statement stmt = mycon.createStatement();
	String sql="select * from orderservice where TrackNO="+trackno;
	 result = stmt.executeQuery(sql);
	 if(!result.next())
	 {
	 	response.sendRedirect("../43010023/incorrectno.jsp");
	 }
	 sql="select * from orderservice where TrackNO="+trackno+" and status='Order Recieved' ";
	result = stmt.executeQuery(sql);
	if(result.next())
	{
		i=1;
	}
	sql="select * from orderservice where TrackNO="+trackno+" and status='Ready to Send' ";
	result = stmt.executeQuery(sql);
	if(result.next())
	{
		i=2;
	}
	sql="select * from orderservice where TrackNO="+trackno+" and (status='Sending' or status='Lost Product' or status='Damaged Product')";
	result = stmt.executeQuery(sql);
	if(result.next())
	{
		i=3;
	}
	sql="select * from orderservice where TrackNO="+trackno+" and (status='Send Late' or status='Send Sucess' or status='Send Fail')";
	result = stmt.executeQuery(sql);
	if(result.next())
	{
		i=4;
	}
	sql="select * from orderservice where TrackNO="+trackno;
	 result = stmt.executeQuery(sql);
%>