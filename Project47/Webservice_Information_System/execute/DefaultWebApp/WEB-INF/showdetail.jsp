<%
String trackno=request.getParameter("trackno");
String sfirstname=new String();
String slastname=new String();
String sphone=new String();
String saddress=new String();
String spackage=new String();
String rfirstname=new String();
String rlastname=new String();
String rphone=new String();
String raddress=new String();
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url ="jdbc:mysql://localhost:3306/project";
	Connection mycon =DriverManager.getConnection( url,"root", "olala023");
	Statement stmt = mycon.createStatement();
	String sql="select * from product where TrackNO="+trackno;
	ResultSet result = stmt.executeQuery(sql);
	if(result.next())
	{
		sfirstname=result.getString("sfirstname");
		slastname=result.getString("slastname");
		sphone=result.getString("sphone");
		saddress=result.getString("saddress");
		spackage=result.getString("spackage");
		rfirstname=result.getString("rfirstname");
		rlastname=result.getString("rlastname");
		rphone=result.getString("rphone");
		raddress=result.getString("raddress");
	}
}
catch(ClassNotFoundException e)
{
	out.println("ClassNotFound");
}
catch(SQLException e)
{
	out.println("SQLException");
}
%>