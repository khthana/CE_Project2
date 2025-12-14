import java.sql.*;

class SendSMS 
{
	String table_name = "user_table";
	String column_1 = "user_name";
	String column_2 = "user_pass";
	String column_3 = "nicname";
	String column_4 = "name";
	String column_5 = "surname";
	String column_6 = "telephone";
	String column_7 = "smspass";
	private static String column_11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String user_name;
	String massage;
	int telephone;
	int smspass;
	SendSMS(String user_name,String massage)
	{
		this.user_name = user_name;
		this.massage=massage;
	}
	public void Send()
	{
		try
		{

			if (rs != null)
			{
				rs.close();
			}
			if (stmt != null)
			{
				stmt.close();
			}
			Class.forName(driverName).newInstance();
			con = DriverManager.getConnection(connectionURL);
			stmt = con.createStatement();
			StringBuffer query = new StringBuffer(100);
			query.append("SELECT  ");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append("\"");
			query.append(user_name);
			query.append("\"");
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				telephone = rs.getInt(column_6);
				smspass = rs.getInt(column_7);
				System.out.print(telephone+" pass "+smspass);

			}
		}
		catch (Exception ee)
		{
			ee.printStackTrace(System.err);
			System.out.println("isSchedule");

		}
		
	}
}
