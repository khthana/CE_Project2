import common.GlobalVariables;
import java.rmi.*;
import java.rmi.server.*;
import java.sql.*;
import java.util.*;
import java.io.*;

public class Server extends UnicastRemoteObject implements ServerInterface
{
	static final String SERVERNAME = "wapservice";
	public Hashtable clients;

	public Server() throws RemoteException
	{
		clients = new Hashtable();
	}

	public static void main(String[] args)
	{
		try{
			Server server = new Server();
			Naming.rebind(SERVERNAME, server);
			System.out.println("Server ("+SERVERNAME+") ready.");
		}catch(Exception ex) {ex.printStackTrace();}
	}

	public void login(String username, String password, ClientInterface client) throws RemoteException
	{
		if (duplicateLogin(username))
		{
			client.showMessage("You try to login several station simultanously.");
			return;
		}
		if (!(verifyLogin(username, password)))
		{
			client.showMessage("Wrong username or password.");
			return;
		}
		addClient(username, client);
		client.loginSuccessed(username);
		client.showMessage(username + " has logged to system successfully.");
		updateAuthorizedList(username);
		pushPostIt(username, client);
	}

	public void register(String username, String password, ClientInterface client) throws RemoteException
	{
		if (duplicateRegister(username))
		{
			client.showMessage("Username "+username+" is duplicate.");
			return;
		}
		register_PC_User(username, password);
		client.showMessage("Registration successful. Username=" + username + " Password=" + password);
	}

	public void logout(String username) throws RemoteException
	{
		ClientInterface client = (ClientInterface) clients.get(username.toUpperCase());
		if (client != null) {
			clients.remove(username.toUpperCase());
		}		
	}

	public void authorize(String[] auth_list, String username) throws RemoteException
	{
		Connection con=null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			for (int i=0; i<auth_list.length; i++)
			{
				Statement stmt=con.createStatement();
				int count=stmt.executeUpdate("UPDATE Authorize SET Authorize=TRUE WHERE WAP_user_name='" + auth_list[i].toUpperCase() + "' AND PC_user_name='" + username.toUpperCase() + "'");
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
		updateAuthorizedList(username);
	}

	public void unauthorize(String[] unauth_list, String username) throws RemoteException
	{
		Connection con=null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			for (int i=0; i<unauth_list.length; i++)
			{
				Statement stmt=con.createStatement();
				int count=stmt.executeUpdate("UPDATE Authorize SET Authorize=FALSE WHERE WAP_user_name='" + unauth_list[i].toUpperCase() + "' AND PC_user_name='" + username.toUpperCase() + "'");
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
		updateAuthorizedList(username);
	}

	public boolean getPostIt(String to, String from, String subject, String msg) throws RemoteException
	{
		Connection con=null;
		boolean exists=false;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT * FROM WAP_User WHERE user_name='" + to.toUpperCase() + "'");
			if (rs.next()){
				try
				{
					String path = GlobalVariables.WAP_USER_PATH + to + "\\message";
					File outPath = new File(path);
					if (!(outPath.exists()))
					{
						outPath.mkdirs();
					}
					String filename = from + "_" + String.valueOf((new java.util.Date()).getDate()) + "_" + String.valueOf((new java.util.Date()).getMonth()) + "_" + String.valueOf((new java.util.Date()).getYear()+1900) + "_" + String.valueOf((new java.util.Date()).getTime()) + ".xml";
					File outFile = new File(path, filename);
					PrintStream outStream = new PrintStream(new FileOutputStream(outFile));
					outStream.println("<?xml version=\"1.0\"?>");
					outStream.println("<note date=\"" + (new java.util.Date()).toGMTString() + "\">");
					outStream.println("<from>" + from + "</from>");
					outStream.println("<to>" + to + "</to>");
					outStream.println("<head>" + subject + "</head>");
					outStream.println("<body>" + msg + "</body>");
					outStream.println("</note>");
					outStream.close();
					exists = true;
				}catch(IOException ioe){
					System.out.println(ioe);
				}
			}else{
				exists=false;
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
			return exists;
		}
	}

	public Hashtable getPCList() throws RemoteException
	{
		Hashtable tmp = new Hashtable();
		Enumeration keys = clients.keys();
		while (keys.hasMoreElements())
		{
			String key_str = (String)keys.nextElement();
			String value_str = ((ClientInterface)clients.get(key_str)).toString();
			int begin = value_str.indexOf("endpoint") + 10;
			int end = value_str.indexOf(':', begin);
			String ip = value_str.substring(begin, end);
			tmp.put(key_str, ip);
		}
		return (tmp);
	}

	public void updatePC(String pcname) throws RemoteException
	{
		if (clients.containsKey(pcname.toUpperCase()))
		{
			updateAuthorizedList(pcname);
		}
	}

	public boolean sendPostIt(String from, String to, String subject, String message) throws RemoteException
	{
		try{
			ClientInterface client = (ClientInterface)clients.get(to.toUpperCase());
			if (client != null) {
//			    java.util.Date now     = new java.util.Date ();
//			    long nowTime = now.getTime ();
				client.showPostIt(from, subject, (new java.util.Date()).toGMTString(), message);
				return true;
			}else {return false;}
		}catch(Exception e){
			logout(to);
			return false;
		}
	}

	public String transferFile(String current_path, String[] filenames, String direction, String wapname, String pcname, String wappswd) throws RemoteException
	{
		PasswordVerifier verifier = new PasswordVerifier();
		if (!(verifier.verify("wap", wapname, wappswd)))
		{
			return("Your password is wrong. Try login again.");
		}
		Hashtable files = new Hashtable();
		if (direction.equals("topc"))
		{
			for (int i=0; i<filenames.length; i++)
			{
				String path = GlobalVariables.WAP_USER_PATH + wapname + "\\file";
				File tmp_file = new File(path, filenames[i]);
				if (!(tmp_file.exists()))
				{
					return("Some file(s) not exists. Transfer failed.");
				}
				try
				{
					DataInputStream inStream = new DataInputStream(new FileInputStream(tmp_file));
					byte[] byte_file = new byte[(new Long(tmp_file.length())).intValue()];
					inStream.readFully(byte_file);
					files.put(filenames[i], byte_file);
				}catch(Exception e){
					return("Problem occured while reading file(s). Transfer failed.");
				}
			}
			if (clients.containsKey(pcname.toUpperCase()))
			{
				try{
					ClientInterface client = (ClientInterface)clients.get(pcname.toUpperCase());
					client.recieveFile(files, wapname);
				}catch(Exception e){
					logout(pcname);
					return("Transfer failed. " + pcname + " might be offline.");
				}
			}else{
				return(pcname + " is not online now.");
			}
		}else if (direction.equals("frompc")){
			if (clients.containsKey(pcname.toUpperCase()))
			{
				try{
					ClientInterface client = (ClientInterface)clients.get(pcname.toUpperCase());
					files = client.sendFile(current_path, filenames, wapname);
				}catch(Exception e){
					logout(pcname);
					return("Transfer failed. " + pcname + " might be offline.");
				}

				if (files==null)
				{
					return("Transfer failed.");
				}

				String path = GlobalVariables.WAP_USER_PATH + wapname + "\\file";
				File outPath = new File(path);
				if (!(outPath.exists()))
				{
					outPath.mkdirs();
				}
				Enumeration e = files.keys();
				while (e.hasMoreElements())
				{
					try{
						String filename = (String)e.nextElement();
						byte[] byte_file = (byte[])files.get(filename);
						File outFile = new File(path, filename);
						PrintStream outStream = new PrintStream(new FileOutputStream(outFile));
						outStream.write(byte_file, 0, byte_file.length);
						outStream.close();
					}catch(Exception ex){ex.printStackTrace();}
				}

			
			}else{
				return(pcname + " is not online now.");
			}

		}
		return("Transfer completed.");
	}

	public Vector getPCListFile(String current_path, String directory, String pcname) throws RemoteException
	{
		if (clients.containsKey(pcname.toUpperCase()))
		{
			try{
				ClientInterface client = (ClientInterface)clients.get(pcname.toUpperCase());
				Vector vector = client.listFilename(current_path, directory);
				return(vector);
			}catch(Exception e){
				logout(pcname);
			}
		}else{
		}
		return(new Vector());
	}

	public String sendCommand(String command, String wapname, String wappswd, String pcname) throws RemoteException
	{
		PasswordVerifier verifier = new PasswordVerifier();
		if (!(verifier.verify("wap", wapname, wappswd)))
		{
			return("Your password is wrong. Try login again.");
		}
		if (clients.containsKey(pcname.toUpperCase()))
		{
			String result;
			try{
				ClientInterface client = (ClientInterface)clients.get(pcname.toUpperCase());
				result = client.executeCommand(command, wapname);
			}catch(Exception e){
				logout(pcname);
				return("Transfer failed. " + pcname + " might be offline.");
			}
			return(result);
		}else{
			return(pcname + " is not online now.");
		}
	}

	boolean duplicateLogin(String username)
	{
		if (clients.get(username.toUpperCase())!=null)
		{
			return true;
		}
		return false;
	}

	boolean verifyLogin(String username, String password)
	{
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		boolean found=false;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			stmt=con.createStatement();
			rs=stmt.executeQuery("SELECT * FROM PC_User WHERE user_name='" + username.toUpperCase() + "' AND password='" + password + "'");
			if (rs.next()){
				found=true;
			}else found=false;

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
			return found;
		}
	}
	void addClient(String username, ClientInterface client)
	{
		clients.put(username.toUpperCase(), client);
	}
	void updateAuthorizedList(String username) throws RemoteException
	{
		Vector authorizedList = new Vector();
		Vector unauthorizedList = new Vector();
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			stmt=con.createStatement();
			rs=stmt.executeQuery("SELECT WAP_user_name FROM Authorize WHERE PC_user_name='" + username.toUpperCase() + "' AND Authorize=TRUE");
			while (rs.next()){
				authorizedList.addElement(rs.getString("WAP_user_name"));
			}
			rs=stmt.executeQuery("SELECT WAP_user_name FROM Authorize WHERE PC_user_name='" + username.toUpperCase() + "' AND Authorize=FALSE");
			while (rs.next()){
				unauthorizedList.addElement(rs.getString("WAP_user_name"));
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
			ClientInterface client = (ClientInterface)clients.get(username.toUpperCase());
			if (client != null) {
				client.updateList(authorizedList, unauthorizedList);
			}
		}
	}
	boolean duplicateRegister(String username)
	{
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		boolean found=false;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			stmt=con.createStatement();
			rs=stmt.executeQuery("SELECT * FROM PC_User WHERE user_name='" + username.toUpperCase() + "'");
			if (rs.next()){
				found=true;
			}else found=false;
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
			return found;
		}
	}
	void register_PC_User(String username, String password)
	{
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			stmt=con.createStatement();
			int count=stmt.executeUpdate("INSERT INTO PC_User VALUES ('" + username.toUpperCase() + "','" + password + "')");
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
	}
	void pushPostIt(String pc_name, ClientInterface client)
	{
		try
		{
			String path = GlobalVariables.PC_USER_PATH + pc_name;
			File inPath = new File(path);
			if (inPath.exists())
			{
				File[] files = inPath.listFiles();
				if (files.length > 0)
				{
					for (int i=0; i<files.length; i++)
					{
						if (files[i].isFile())
						{
							FileInputStream fileInStream = new FileInputStream(files[i]);
							DataInputStream inStream = new DataInputStream(fileInStream);
							String line = null;
							String postMessage = "";
							while((line=inStream.readLine())!=null)
							{
								postMessage = postMessage + line;
							}
							fileInStream.close();
							client.showPostIt(postMessage);
							if (!(files[i].delete()))
							{
								System.out.println(files[i].getPath() + " is not deleted.");
							}
						}
						
					}
				}
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
