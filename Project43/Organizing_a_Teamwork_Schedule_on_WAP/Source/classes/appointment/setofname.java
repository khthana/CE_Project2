package appointment;
import java.sql.*;
import java.util.*;
class setofname 
{
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	Vector vname ;
	setofname() 
	{
		vname = new Vector();
	}
	setofname(String name,String gname)
	{
		vname = new Vector();
		StringBuffer query = new StringBuffer(100);
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
			query.append("SELECT ");
			query.append(column_g2);
			query.append(" FROM ");
			query.append(table_nameg);
			query.append(",");
			query.append(table_namet);
			query.append(" WHERE ");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g1);
			query.append("=");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append(" AND ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t2);
			query.append("=");
			query.append("\"");
			query.append(gname);
			query.append("\"");
			query.append(" AND ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t3);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\"");
			query.append(" ORDER BY ");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g2);			
			rs = stmt.executeQuery(query.toString());
			while (rs.next())
			{
				vname.addElement(rs.getString(column_g2));
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query setofname");			
		}
	}
	public void add(String name)
	{
		vname.addElement(name);
	}
	public void sub(String name)
	{
		for (int i=0 ; i<vname.size(); i++)
		{
			if (( (String) vname.elementAt(i) ).equals(new String(name)))
			{
				vname.remove(i);
			}
		}
	}
	public void printname()
	{
		System.out.print("name : ");
		for (int i=0;i<vname.size() ;i++ )
		{
			System.out.print((String)vname.elementAt(i));
			System.out.print(",");
		}
	}
	public Object elementAt(int i)
	{
		return vname.elementAt(i);
	}
	public int size()
	{
		return vname.size();
	}
}
