import java.sql.*;
import java.net.*;
import java.io.*;
class schedule
{
	private static String table_name = "schedule_table";
	private static String column_2 = "syear";
	private static String column_3 = "smonth";
	private static String column_4 = "sdate";
	private static String column_5 = "hour_time";
	private static String column_6 = "minute_time";
	private static String column_7 = "hour_to";
	private static String column_8 = "minute_to";
	private static String column_9 = "title";
	private static String column_10 = "detail";
	private static String column_11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	int year;
	int month;
	int date;
	schedule(int year,int month,int date)
	{
		this.year = year;
		this.month=month;
		this.date=date;
	}
	public void delete()
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
			query.append("DELETE  ");
			query.append("FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_2);
			query.append("<=");
			query.append(year);
			query.append(" AND ");
			query.append(column_3);
			query.append("<=");
			query.append(month+1);
			query.append(" AND ");
			query.append(column_4);
			query.append("<");
			query.append(date);
			System.out.println(query);
			//rs = stmt.executeQuery(query.toString());
		}
		catch (Exception ee)
		{
			ee.printStackTrace(System.err);
			System.out.println("isSchedule");

		}
		
	}
}
