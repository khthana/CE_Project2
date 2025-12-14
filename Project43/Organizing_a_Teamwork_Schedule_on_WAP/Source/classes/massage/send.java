package massage;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class send
{
	private String name;
	private String receiver_re;
	private String massage_title_re;
	private String massage_massage_re;
	private static String table_namem = "massage_table";
	private static String table_nameu= "user_table";
	private static String column_m2 = "sender";
	private static String column_m3 = "receiver";
	private static String column_m4 = "title";
	private static String column_m5 = "massage";
	private static String column_u1 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}

	public void setMassage_receiver(String receiver)
	{
		this.receiver_re = receiver;
	}
	
	public void setMassage_title(String massage_title) {
		this.massage_title_re = massage_title;
	}

	public void setMassage_massage(String massage_massage) {
		this.massage_massage_re = massage_massage;
	}
	
	public String getName()
	{
		return name;
	}
	public boolean isValid() {
		if (massage_title_re == null && massage_massage_re == null)
		{
			return false;
		}else return true;
	}
	public boolean isName()
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
			query.append("*");
			query.append(" FROM ");
			query.append(table_nameu);
			query.append(" WHERE ");
			query.append(column_u1);
			query.append("=\"");
			query.append(receiver_re);
			query.append("\" ");
			query.append(" AND ");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			return rs.next();

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isGname");
			return true;
		}
	}
	public void insert()
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

			query.append("INSERT INTO  ");
			query.append(table_namem);
			query.append(" ( ");
			query.append(column_m2);
			query.append(",");
			query.append(column_m3);
			query.append(",");
			query.append(column_m4);
			query.append(",");
			query.append(column_m5);
			query.append(") ");
			query.append(" VALUES(\"");
			query.append(name);
			query.append("\",\"");
			query.append(receiver_re);
			query.append("\",\"");
			query.append(massage_title_re);
			query.append("\",\"");
			query.append(massage_massage_re);
			query.append("\")");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
		
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("insert");
		}
	}
	public void cleanup()
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
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("cleanup");
		}
}
};
