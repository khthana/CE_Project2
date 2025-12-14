package Type;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import ConnectDB.MySQLDB;

public class Booking 
{
	private int BookingID;
	private ClassRoom ClassID;
	private Booker BookerID;
	private boolean Cancel;
	private String PayStatus;
	
	public Booking()
	{
		BookingID = 0;
		ClassID = null;
		BookerID = null;
		Cancel = false;
		PayStatus = null;
	}
	
	public Booking(int BookingID, int ClassID, String Email, boolean Status, String PayStatus)
	{
		this.BookingID = BookingID;
		this.ClassID = ClassRoom.find(ClassID);
		this.BookerID = Booker.find(Email);
		this.Cancel = Status;
		this.PayStatus = PayStatus;
	}
	
	public static Booking find(int BookingID)
	{
		MySQLDB mysql = new MySQLDB();
		Booking booking = null;
		mysql.initialize();
		try{
			String sql = "select * from booking where BookingID = " + BookingID;
			ResultSet rs = mysql.find(sql);
			if(rs.next())
			{
				booking = new Booking(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5));
			}
		}catch(SQLException e)
		{
			System.err.println(e);
		}finally
		{
			mysql.terminate();
		}
		return booking;
	}
	
	public static Vector findForBuy(int ClassID, String Email)
	{
		MySQLDB mysql = new MySQLDB();
		Vector booking = new Vector();
		mysql.initialize();
		try{
			String sql = "select * from booking where ClassID = " + ClassID + " and Booker = '"+Email + "' and PayStatus is null and Cancel = 0";
			ResultSet rs = mysql.find(sql);
			while(rs.next())
			{
				booking.add(new Booking(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5)));
			}
		}catch(SQLException e)
		{
			System.err.println(e);
		}finally
		{
			mysql.terminate();
		}
		return booking;
	}
	
	
	public static boolean receiveIsExist(String Receive)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booking where PayStatus = '"+Receive + "'";
		boolean output = mysql.IsExist(sql);
		return output;
	}
	
	public static String find(String Email)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booking where Booker = '"+Email + "'";
		String output = mysql.find(sql, "booking");
		return output;
	}
	
	public static String findCourse(int ClassID)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booking where ClassID = '" + ClassID + "'";
		String output = mysql.find(sql, "booking");
		return output;
	}
	
	public static String findStudent(String Email)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booking where  Booker = '"+Email + "'";
		String output = mysql.find(sql, "booking");
		return output;
	}
	
	public static String getAll()
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booking";
		String output = mysql.find(sql, "booking");
		return output;
	}
	
	public boolean add()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql;
		if(BookingID == 0)
			sql = "insert into booking VALUES(null,"+ClassID.getClassID()+",'"+BookerID.getEmail()+"',"+Cancel+","+((PayStatus == null)?null:"'"+PayStatus+"'") + ")";
		else		
			sql = "insert into booking VALUES("+BookingID+","+ClassID.getClassID()+",'"+BookerID.getEmail()+"',"+Cancel+","+((PayStatus == null)?null:"'"+PayStatus+"'") + ")";
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;		
	}
	
	public boolean update()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "update booking Set ClassID = "+ClassID.getClassID()+"," +
				"Booker = '"+BookerID.getEmail()+"'," +
				"Cancel = "+Cancel+"," +
				"PayStatus = "+((PayStatus == null)?null:"'"+PayStatus+"'") +
				" where BookingID = "+BookingID;
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;		
	}
	
	public boolean delete()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "delete from booking where BookingID = " + BookingID ;
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;	
	}
	
	public void setBookingID(int BookingID )
	{
		this.BookingID = BookingID;
	}
	
	public int getBookingID()
	{
		return BookingID;
	}
	
	public void setClassID(ClassRoom ClassID)
	{
		this.ClassID = ClassID;
	}
	
	public ClassRoom getClassID()
	{
		return ClassID;
	}
	
	public void setBookerID(Booker BookerID)
	{
		this.BookerID = BookerID;
	}
	
	public Booker getBookerID()
	{
		return BookerID;
	}
		
	public void setCancel(boolean Cancel)
	{
		this.Cancel = Cancel;
	}
	
	public boolean getCancel()
	{
		return Cancel;
	}
	
	public void setPatStatus(String PayStatus )
	{
		this.PayStatus = PayStatus;
	}
	
	public String getPayStatus()
	{
		return PayStatus;
	}
}
