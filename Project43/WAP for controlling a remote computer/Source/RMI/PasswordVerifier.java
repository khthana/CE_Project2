import java.io.*;
import java.sql.*;
class PasswordVerifier 
{
	public PasswordVerifier()
	{
	}
	public boolean verify(String type, String username, String password)
	{
		boolean found=false;
		Connection con=null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			Statement stmt=con.createStatement();
			ResultSet rs=null;
			if (type.equals("wap")){
				rs=stmt.executeQuery("SELECT * FROM WAP_User WHERE user_name='" + username.toUpperCase() + "' AND password='" + password + "'");
			}else if (type.equals("pc")){
				rs=stmt.executeQuery("SELECT * FROM PC_User WHERE user_name='" + username.toUpperCase() + "' AND password='" + password + "'");
			}
			if (rs.next()){
				found=true;
			}else{
				found=false;
			}
		}
		catch (ClassNotFoundException e){
			System.out.println("Could'n load database driver: " + e.getMessage());
		}
		catch (SQLException e){
			System.out.println("SQLException caught: " + e.getMessage());
		}
		finally {
			try{
				if (con!=null) con.close();
			}
			catch (SQLException ignored){
			}
		}
		return(found);
	}
}
