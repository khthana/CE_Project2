import com.ibm.aglet.*;
import java.sql.*;

public class SQLDatabaseAglet extends Aglet
{
	public void out(String x){System.out.println(x);}
	public void run()
	{
		out("I Love U");
		jo();
	}

	private void jo()
	{
		try{
		out("1 RUNNING IN");
		Class.forName("com.mysql.jdbc.Driver");
		out("2 RUNNING IN");
		Connection c;
		out("3 RUNNING IN");
		c=DriverManager.getConnection("jdbc:mysql://localhost/mysql", "", "");
		out("4 RUNNING IN");
		Statement s = c.createStatement();
		ResultSet r = s.executeQuery("SELECT * FROM student");
		while (r.next())
			out(r.getInt(1) + "," + r.getString(2) + "," + r.getString(3) + "," + r.getDouble(4));
		s.close();
		c.close();
		}catch(Exception e){out(""+e);}
	}
};