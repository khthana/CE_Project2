<%
String trackno=request.getParameter("trackno");
String update=request.getParameter("update");
String uid=new String();
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url ="jdbc:mysql://localhost:3306/project";
	Connection mycon =DriverManager.getConnection( url,"root", "olala023");
	Statement stmt = mycon.createStatement();
	String sql1="select uid from orderservice where TrackNO="+trackno;
	ResultSet result1 = stmt.executeQuery(sql1);
	if(result1.next())
	{
		uid=result1.getString("uid");
	}
	String sql="insert into orderservice values("+uid+","+ trackno+",'"+update+"',now())";
	ResultSet result = stmt.executeQuery(sql);
}
catch(ClassNotFoundException e)
{
	out.println("ClassNotFound");
}
catch(SQLException e)
{
	out.println("SQLException");
	e.printStackTrace();
}
%>