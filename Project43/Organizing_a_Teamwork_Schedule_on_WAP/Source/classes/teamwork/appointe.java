package schedule;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointe
{
	private static String error;
	private String name;
	private int teamwork_date;
	private int teamwork_year;
	private int teamwork_month;
	private int teamwork_atime;
	private int teamwork_objective;
	private String teamwork_title;
	private String teamwork_detail;
	private static String table_name = "teamwork_table";
	private static String column_2 = "syear";
	private static String column_3 = "smonth";
	private static String column_4 = "sdate";
	private static String column_5 = "atime";
	private static String column_6 = "objective";
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

	public void setName(String name)
	{
		this.name = name;
	}

	public void setteamwork_date(String teamwork_date)
	{
		this.teamwork_date = Integer.parseInt(teamwork_date);
	}

	public void setteamwork_month(String teamwork_month)
	{
		this.teamwork_month = Integer.parseInt(teamwork_month);
	}

	public void setteamwork_year(String teamwork_year)
	{
		this.teamwork_year = Integer.parseInt(teamwork_year);
	}

	public void setteamwork_atime(String teamwork_atime)
	{
		this.teamwork_atime = Integer.parseInt(teamwork_atime);
	}

	public void setteamwork_objective(String teamwork_objective)
	{
		this.teamwork_objective = Integer.parseInt(teamwork_objective);
	}

	public String getName()
	{
		return name;
	}
	public void setteamwork_title(String teamwork_title)
	{
		this.teamwork_title = teamwork_title;
	}
	public void setteamwork_detail(String teamwork_detail)
	{
		this.teamwork_detail = teamwork_detail;
	}
		public boolean isValid()
	{
		String tempS = new String();
		boolean tempB;
		GregorianCalendar g = new GregorianCalendar();
		GregorianCalendar g2 = new GregorianCalendar();
		GregorianCalendar g3 = new GregorianCalendar();
		g2.set(teamwork_year,teamwork_month-1,teamwork_date,teamwork_atime,teamwork_objective);
		g3.set(teamwork_year,teamwork_month-1,teamwork_date,teamwork_hour_to,teamwork_minute_to);
		tempB = true;
		if (!(teamwork_date <= g2.getActualMaximum(Calendar.DAY_OF_MONTH) && teamwork_date > 0))
		{
			tempS = "date";
			tempB = false;
		}
		if (!(teamwork_month <= 12 && teamwork_month > 0))
		{
			tempS = tempS.concat(" month");
			tempB = false;
		}
		if (!(teamwork_year >= g.get(Calendar.YEAR) && teamwork_year <= 9999))
		{
			tempS = tempS.concat(" year");
			tempB = false;
		}
		if (!(teamwork_atime >= 0 && teamwork_atime < 24 && teamwork_hour_to >= 0 && teamwork_hour_to < 24 && teamwork_atime < teamwork_hour_to))
		{
			tempS =tempS.concat(" hour");
			tempB = false;
		}
		if (!(teamwork_objective >= 0 && teamwork_objective < 60 && teamwork_minute_to >= 0 && teamwork_minute_to < 60 && teamwork_atime*60+teamwork_objective < teamwork_hour_to*60+teamwork_minute_to))
		{
			tempS =tempS.concat(" minute");
			tempB = false;
		}
		if (!(g.before(g2) && g.before(g3) ))
		{
			tempS = tempS.concat(" late time");
			tempB = false;
		}
		if (!(g2.before(g3)))
		{
			tempS = tempS.concat(" sequence time");
			tempB = false;
		}
		System.out.println(g.getTime());
		System.out.println(g2.getTime());
		System.out.println(g3.getTime());
		error = tempS;
		return tempB;
	}
	public String getError()
	{
		return error;
	}
	public boolean isSchedule() 
	{
		String user_name;
		int teamwork_atime_db;
		int teamwork_hour_to_db;
		int teamwork_objective_db;
		int teamwork_minute_to_db;
		GregorianCalendar g_time_db = new GregorianCalendar();
        	GregorianCalendar g_to_db = new GregorianCalendar();
		GregorianCalendar g_time_re = new GregorianCalendar();
		GregorianCalendar g_to_re = new GregorianCalendar();
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
			query.append(column_5);
			query.append(",");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(",");
			query.append(column_8);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_11);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			query.append(" AND ");
			query.append(column_2);
			query.append("=");
			query.append(teamwork_year);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(teamwork_month);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(teamwork_date);
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			while (rs.next())
			{
				teamwork_atime_db = rs.getInt(column_5);
				teamwork_objective_db = rs.getInt(column_6);
				teamwork_hour_to_db = rs.getInt(column_7);
				teamwork_minute_to_db = rs.getInt(column_8);
				g_time_db.set(teamwork_year,teamwork_month-1,teamwork_date,teamwork_atime_db,teamwork_objective_db);
	            g_to_db.set(teamwork_year,teamwork_month-1,teamwork_date,teamwork_hour_to_db,teamwork_minute_to_db);
				g_time_re.set(teamwork_year,teamwork_month-1,teamwork_date,teamwork_atime,teamwork_objective);
				g_to_re.set(teamwork_year,teamwork_month-1,teamwork_date,teamwork_hour_to,teamwork_minute_to);
				if (!(
					(
						g_time_re.before(g_time_db) && 
						( 
							g_to_re.before(g_time_db) || g_to_re.equals(g_time_db)
						)
					) || 
					(
						(
							g_time_re.after(g_to_db) || g_time_re.equals(g_to_db)
						) && 
						g_to_re.after(g_to_db)
					))
					)
				{
					System.out.println(g_time_db.getTime().getTime()+""+g_time_db.getTime());
					System.out.println(g_to_db.getTime().getTime()+""+g_to_db.getTime());
					System.out.println(g_time_re.getTime().getTime()+""+g_time_re.getTime());
					System.out.println(g_to_re.getTime().getTime()+""+g_to_re.getTime());
					System.out.println(g_time_re.equals(g_time_db));
					return true;
				}

			}
			return false;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isSchedule");
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
			query.append(table_name);
			query.append(" ( ");
			query.append(column_2);
			query.append(",");
			query.append(column_3);
			query.append(",");
			query.append(column_4);
			query.append(",");
			query.append(column_5);
			query.append(",");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(",");
			query.append(column_8);
			query.append(",");
			query.append(column_9);
			query.append(",");
			query.append(column_10);
			query.append(",");
			query.append(column_11);
			query.append(") ");
			query.append(" VALUES(");
			query.append(teamwork_year);
			query.append(",");
			query.append(teamwork_month);
			query.append(",");
			query.append(teamwork_date);
			query.append(",");
			query.append(teamwork_atime);
			query.append(",");
			query.append(teamwork_objective);
			query.append(",");
			query.append(teamwork_hour_to);
			query.append(",");
			query.append(teamwork_minute_to);
			query.append(",\"");
			query.append(teamwork_title);
			query.append("\",\"");
			query.append(teamwork_detail);
			query.append("\",\"");
			query.append(name);
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
