package Type;

import java.sql.ResultSet;
import java.sql.SQLException;

import ConnectDB.MySQLDB;

public class Booker 
{
	private String Email;
	private String Name;
	private String Surname;
	private String PhoneNo;
	
	public Booker(String Email, String Name, String Surname, String PhoneNo)
	{
		this.Email = Email;
		this.Name = Name;
		this.Surname = Surname;
		this.PhoneNo = PhoneNo;
	}
	
	public Booker()
	{
		this.Email = null;
		this.Name = null;
		this.Surname = null;
		this.PhoneNo = null;
	}
	public static Booker find(String Email)
	{
		MySQLDB mysql = new MySQLDB();
		Booker booker = null;
		mysql.initialize();
		try{
			String sql = "select * from booker where Email = '" + Email + "'";
			ResultSet rs = mysql.find(sql);
			if(rs.next())
			booker = new Booker(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
		}catch(SQLException e)
		{
			System.err.println(e);
		}finally
		{
			mysql.terminate();
		}
		return booker;
	}
	
	/*public static String findSchool(String School)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booker where School = '" + School + "'";
		String output = mysql.find(sql, "booker");
		return output;
	}*/
	
	public static String getAll()
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from booker";
		String output = mysql.find(sql, "booker");
		return output;
	}
	
	public boolean add()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "insert into booker VALUES('"+ Email+"','"+ Name+"','"+ Surname+"','"+ PhoneNo+"')";
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;		
	}
	
	public boolean update()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "update booker Set Name = '"+Name+"'," +
				"Surname = '"+Surname+"'," +
				"PhoneNo = '"+PhoneNo+"' where Email = '"+Email+"'";
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;		
	}
	
	public boolean delete()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "delete from booker where Email = '"+Email+"'";
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;	
	}
	
	public void setEmail(String Email)
	{
		this.Email = Email;
	}

	public String getEmail()
	{
		return Email;
	}
	
	public void setName(String Name)
	{
		this.Name = Name;
	}

	public String getName()
	{
		return Name;
	}
	
	public void setSurname(String Surname)
	{
		this.Surname = Surname;
	}

	public String getSurname()
	{
		return Surname;
	}
	
	public void setPhoneNo(String PhoneNo)
	{
		this.PhoneNo = PhoneNo;
	}

	public String getPhoneNo()
	{
		return PhoneNo; 
	}
}
