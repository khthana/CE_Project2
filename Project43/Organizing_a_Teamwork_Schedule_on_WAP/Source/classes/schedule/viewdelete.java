package schedule;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class viewdelete
{
	private static String temp_htime;
	private static String temp_mtime;
	private static String temp_hto;
	private static String temp_mto;
	private static int schedule_date_re;
	private static int schedule_month_re;
	private static int schedule_year_re;
	private static String error;
	private static String name;
	private static String table_name = "schedule_table";
	private static String column_2 = "syear";
	private static String column_3 = "smonth";
	private static String column_4 = "sdate";
	private static String column_5 = "hour_time";
	private static String column_6 = "minute_time";
	private static String column_7 = "hour_to";
	private static String column_8 = "minute_to";
	private static String column_9 = "title";
	private static String column_11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	StringBuffer query = new StringBuffer(100);

	public void setName(String name)
	{
		this.name = name;
	}
	public void setSchedule_date(String schedule_date)
	{
		schedule_date_re = Integer.parseInt(schedule_date);
	}
	public void setSchedule_month(String schedule_month)
	{
		schedule_month_re = Integer.parseInt(schedule_month);
	}
	public void setSchedule_year(String schedule_year)
	{
		schedule_year_re = Integer.parseInt(schedule_year);
	}
	public boolean isValid()
	{
		String tempS = new String();
		boolean tempB;
		GregorianCalendar g = new GregorianCalendar();
		tempB = true;
		if (schedule_date_re > g.getActualMaximum(Calendar.DAY_OF_MONTH) || schedule_date_re < 1/* ADD schedule_date_re < g.get(Calendar.DATE) */)
		{
			tempS = "date";
			tempB = false;
		}
		if (schedule_month_re > 12 || schedule_month_re < 1/* ADD schedule_month_re < g.get(Calendar.MONTH) */)
		{
			tempS = tempS.concat(" month");
			tempB = false;
		}
		if (schedule_year_re < g.get(Calendar.YEAR) || schedule_year_re > 9999)
		{
			tempS = tempS.concat(" year");
			tempB = false;
		}
		error = tempS;
		return tempB;
	}
	public String getError()
	{
		return error;
	}
	public void select()
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
			query.append("SELECT ");
			query.append(column_5);
			query.append(",");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(",");
			query.append(column_8);
			query.append(",");
			query.append(column_9);
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
			query.append(schedule_year_re);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(schedule_month_re);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(schedule_date_re);
			query.append(" ORDER BY ");
			query.append(column_7);
			query.append(",");
			query.append(column_8);
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}
	public boolean next()
	{
		try
		{
			return rs.next();	
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("next");			

			return false;
		}
	}
	public String getHour_time()
	{
		try
		{
		int  hour = rs.getInt(column_5);

		String hour_time = String.valueOf(hour);
		temp_htime = hour_time;
		return hour_time;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("gethour_time");
			return null;
		}
	}
	public String getMinute_time() throws Exception
	{
		try
		{
		int  minute = rs.getInt(column_6);
		String minute_time = String.valueOf(minute);

		if (minute_time.length() == 1)
		{
			minute_time = "0"+ minute_time;
		}
		temp_mtime = minute_time;
		return minute_time;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getminute_time");
			return null;
		}
	}
	public String getHour_to() throws Exception
	{
		try
		{
		int  hour = rs.getInt(column_7);
		String hour_to = String.valueOf(hour);
		temp_hto = hour_to;
		return hour_to;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("gethour_to");
			return null;
		}
	}
	public String getMinute_to() throws Exception
	{
		try
		{
		int  minute = rs.getInt(column_8);
		String minute_to = String.valueOf(minute);
		if (minute_to.length() == 1)
		{
			minute_to = "0"+ minute_to;
		}
		temp_mto = minute_to;
		return minute_to;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getminute_to");
			return null;
		}
	}
	public String getTitle()
	{
		try
		{
			return rs.getString(column_9);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
		}
	}
	public String getLink()
	{
		String link ="schedule_delete_de.jsp?year="+schedule_year_re+"&#x26;month="+schedule_month_re+"&#x26;date="+schedule_date_re+"&#x26;htime="+temp_htime+"&#x26;mtime="+temp_mtime+"&#x26;hto="+temp_hto+"&#x26;mto="+temp_mto;
		return link;
	}
	public String getShowlink()
	{
		String showlink =temp_htime+":"+temp_mtime+"-"+temp_hto+":"+temp_mto;
		return showlink;
	}
	public void cleanup()
	{
		try
		{
			query.delete(0,query.capacity());
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
}
