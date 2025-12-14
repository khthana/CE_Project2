package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_somere
{
	private static String error;
	private static String gname;
	private static String name;
	private static String nomem;
	private int appointment_date;
	private int appointment_year;
	private int appointment_month;
	private int appointment_hour_time;
	private int appointment_minute_time;
	private int appointment_hour_to;
	private int appointment_minute_to;
	private int appointment_ahour;
	private int appointment_aminute;
	private String appointment_title;
	private String appointment_detail;
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_names = "schedule_table";
	private static String column_s2 = "syear";
	private static String column_s3 = "smonth";
	private static String column_s4 = "sdate";
	private static String column_s5 = "hour_time";
	private static String column_s6 = "minute_time";
	private static String column_s7 = "hour_to";
	private static String column_s8 = "minute_to";
	private static String column_s9 = "title";
	private static String column_s10 = "detail";

	private static String column_s11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Vector vname;
	Vector vsetofperiod;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	setofperiod sr = new setofperiod();
	public void setName(String name)
	{
		this.name = name;
	}
	public void setGname(String gname)
	{
		this.gname = gname;
	}
	public void setNomem(String nomem)
	{
		this.nomem = nomem;
	}
	public void setappointment_date(String appointment_date)
	{
		this.appointment_date = Integer.parseInt(appointment_date);
	}

	public void setappointment_month(String appointment_month)
	{
		this.appointment_month = Integer.parseInt(appointment_month);
	}

	public void setappointment_year(String appointment_year)
	{
		this.appointment_year = Integer.parseInt(appointment_year);
	}

	public void setappointment_hour_time(String appointment_hour_time)
	{
		this.appointment_hour_time = Integer.parseInt(appointment_hour_time);
	}

	public void setappointment_hour_to(String appointment_hour_to)
	{
		this.appointment_hour_to = Integer.parseInt(appointment_hour_to);
	}

	public void setappointment_minute_time(String appointment_minute_time)
	{
		this.appointment_minute_time = Integer.parseInt(appointment_minute_time);
	}

	public void setappointment_minute_to(String appointment_minute_to)
	{
		this.appointment_minute_to = Integer.parseInt(appointment_minute_to);
	}	

	public void setappointment_ahour(String appointment_ahour)
	{
		this.appointment_ahour = Integer.parseInt(appointment_ahour);
	}	
	public void setappointment_aminute(String appointment_aminute)
	{
		this.appointment_aminute = Integer.parseInt(appointment_aminute);
	}	

	public void setappointment_title(String appointment_title)
	{
		this.appointment_title = appointment_title;
	}
	public void setappointment_detail(String appointment_detail)
	{
		this.appointment_detail = appointment_detail;
	}
	public String getError()
	{
		return error;
	}
	public boolean Valid()
	{
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
			query.append("*");
			query.append(" FROM ");
			query.append(table_namet);
			query.append(",");
			query.append(table_nameg);
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
			query.append(column_t3);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\" ");
			query.append(" AND ");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g2);
			query.append("=");
			query.append("\"");
			query.append(nomem);
			query.append("\" ");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			return rs.next();
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query setofname");			
			return false;
		}

	}
	public String getLink(int i)
	{
		StringBuffer query = new StringBuffer(100);
		period psr = new period();
		timers tssr = new timers();
		timers tesr = new timers();

		psr =(period)sr.v.elementAt(i);
		tssr =(timers)psr.ts;
		tesr =(timers)psr.te;
		query.append("appointment_request.jsp?");
		query.append("year=");
		query.append(appointment_year);
		query.append("&#x26;");
		query.append("month=");
		query.append(appointment_month);
		query.append("&#x26;");
		query.append("date=");
		query.append(appointment_date);
		query.append("&#x26;");	
		query.append("htime=");
		query.append(tssr.gethour());
		query.append("&#x26;");
		query.append("mtime=");
		query.append(tssr.getminute());
		query.append("&#x26;");
		query.append("hto=");
		query.append(tesr.gethour());
		query.append("&#x26;");
		query.append("mto=");
		query.append(tesr.getminute());
		//System.out.println(query);
		return query.toString();
	}
	public String showLink(int i)
	{
		StringBuffer query = new StringBuffer(100);
		period psr = new period();
		timers tssr = new timers();
		timers tesr = new timers();
		psr =(period)sr.v.elementAt(i);
		tssr =(timers)psr.ts;
		tesr =(timers)psr.te;
		int  minutet = tssr.getminute();
		String minute_time = String.valueOf(minutet);
		if (minute_time.length() == 1)
		{
			minute_time = "0"+ minute_time;
		}
		
		int  minuteto= tesr.getminute();
		String minute_to = String.valueOf(minuteto);
		if (minute_to.length() == 1)
		{
			minute_to = "0"+ minute_to;
		}

		query.append(tssr.gethour());
		query.append(":");
		query.append(minute_time);
		query.append("-");
		query.append(tesr.gethour());
		query.append(":");
		query.append(minute_to);
		System.out.println(query);
		return query.toString();
	}


	private setofperiod makesetofperiod(String member)
	{
		setofperiod s = new setofperiod();
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
			query.append(column_s5);
			query.append(",");
			query.append(column_s6);
			query.append(",");
			query.append(column_s7);
			query.append(",");
			query.append(column_s8);
			query.append(" FROM ");
			query.append(table_names);
			query.append(" WHERE ");
			query.append(column_s11);
			query.append("=\"");
			query.append(member);
			query.append("\" ");
			query.append(" AND ");
			query.append(column_s2);
			query.append("=");
			query.append(appointment_year);
			query.append(" AND ");
			query.append(column_s3);
			query.append("=");
			query.append(appointment_month);
			query.append(" AND ");
			query.append(column_s4);
			query.append("=");
			query.append(appointment_date);
			query.append(" ORDER BY ");
			query.append(column_s5);
			query.append(",");
			query.append(column_s6);
			//System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			while (rs.next())
			{
				timers ts = new timers(rs.getInt(column_s5),rs.getInt(column_s6));
				timers te = new timers(rs.getInt(column_s7),rs.getInt(column_s8));
				period p = new period(ts,te);
				s.addperiod(p);

			}
			return s;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query makesetofperiod");			
			return s;
		}
	}		


	public boolean foundtime()
	{
		boolean found = false;
		setofname vname = new setofname(name,gname);
		timers tabout = new timers(appointment_ahour,appointment_aminute);
		setofperiod s1 = new setofperiod();
		setofperiod s2 = new setofperiod();
		setofperiod su = new setofperiod();
		su.addperiod( new period( new timers(appointment_hour_time,appointment_minute_time),new timers(appointment_hour_to,appointment_minute_to) ) );

		s1 = makesetofperiod(name);
		System.out.print("true schedule own");
		s1.printset();
		s1 = su.minus(s1);
		System.out.print("invert schedule own");
		s1.printset();
		vname.sub(nomem);
		for (int i=0 ;i < vname.size() ;i++ )
		{
			System.out.print( vname.elementAt(i)+" true " );
			s2 = makesetofperiod( (String)vname.elementAt(i) );
			s2.printset();
			s2 = su.minus(s2);
			System.out.print(" invert ");
			s2.printset();
			s1 = s1.intersection(s2);
			System.out.print(" result ");
			s1.printset();
			System.out.println("");
		}
		timers ta = new timers();
		period pa = new period();
		tabout.printtimers();
		for (int i=0;i < s1.size() ;i++ )
		{
			pa = (period)(s1.v.elementAt(i));
			ta.seteq(pa.amount());
			ta.printtimers();
			if (tabout.lesseqthan(ta))
			{
				found = true;
				sr.addperiod(pa);
			}
		}
		sr.printset();
		return found;
	}
	public int size()
	{
		return sr.size();
	}
	public void select()
	{
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
			query.append(" WHERE ");
			query.append(column_t3);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			query.append(" ORDER BY ");
			query.append(column_g2);
			//System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}

	public void cleanup()
	{
		sr.v.clear();
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
}