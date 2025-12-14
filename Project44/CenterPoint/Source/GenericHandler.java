import java.io.*;
import java.util.*;
import java.sql.*;

public class GenericHandler extends Thread {
	protected Hashtable routes;
	protected InputStream in;
	protected OutputStream out;
	protected Connection connection;
	
	static private int handlerNumber;
	static private synchronized int nextHandlerNum ()
		{ return handlerNumber ++; }
		
	public GenericHandler (Hashtable routes, InputStream in, OutputStream out) {
		super ("GenericHandler-" + nextHandlerNum ());
		this.routes = routes;
		this.in = in;
		this.out = out;
		
		String url = "jdbc:odbc:Player";
		
		try {
			Class.forName ("sun.jdbc.odbc.JdbcOdbcDriver");
			connection = DriverManager.getConnection (url);
		}
		catch (ClassNotFoundException cnfex) {
			System.out.println ("Failed to load JDBC/ODBC driver.");
			cnfex.printStackTrace ();
		}
		catch (SQLException sqlex) {
			System.out.println ("Unable to connect");
			sqlex.printStackTrace ();
		}
	}
	
	protected String name, user;
	
	public void run () {
		try {
			DataInputStream dataIn = new DataInputStream (in);
			int num = dataIn.readInt ();
			if (num == 0) {
				name = dataIn.readUTF ();
				accept (name);
			}
			else {
				user = dataIn.readUTF ();
				sign_data (user);
			}
		} catch (IOException ex) {
			ex.printStackTrace ();
		} finally {
			try {
				out.close ();
			} catch (IOException ex) {
				ex.printStackTrace ();
			}
		}
	}
	
	protected void sign_data (String user) throws IOException {	
		Statement statement;
		ResultSet rs;
		boolean check = false;
		
		try {
			String query = "SELECT Username FROM Players";
			statement = connection.createStatement ();
			rs = statement.executeQuery (query);
			while (rs.next ()) {
				String s = rs.getString ("Username");
				if (user.equals(s))
					check = true;
			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace ();
		}
		
		if (check) {
			new DataOutputStream (out).writeBoolean (false);
			out.flush ();
		} else {
			new DataOutputStream (out).writeBoolean (true);
			out.flush ();
			fill_data (user);
		}
				
	}
	
	protected void fill_data (String user) throws IOException {	
		DataInputStream dataIn = new DataInputStream (in);
		String pass = dataIn.readUTF ();
		String first = dataIn.readUTF ();
		String last = last = dataIn.readUTF ();
		String address = dataIn.readUTF ();
		String email = dataIn.readUTF ();
		
		
		try {
			Statement statement = connection.createStatement ();
			String query = "INSERT INTO Players VALUES('"+ user + "','" + pass + "','" + first + "','" + last + "','" + address + "','" + email + "')";
			int result = statement.executeUpdate (query);
			if (result == 1)
				System.out.println ("Insertion successful");
			else
				System.out.println ("Insertion failed");
		} catch (SQLException sqlex) {
			sqlex.printStackTrace ();
		}
	}
	
	protected boolean checkpass (String name) throws IOException {	
		DataInputStream dataIn = new DataInputStream (in);
		String pass = dataIn.readUTF ();
		
		Statement statement;
		ResultSet rs;
		boolean check = false;
		
		try {
			String query = "SELECT Username, Password FROM Players";
			statement = connection.createStatement ();
			rs = statement.executeQuery (query);
			while (rs.next ()) {
				String s = rs.getString ("Username");
				System.out.println ("Username = " + s);
				String p = rs.getString ("Password");
				System.out.println ("Password = " + p);
				if (name.equals(s)) {
					if (pass.equals(p)) {
						check = true;
					}
				}
			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace ();
		}
		System.out.println (check);
		return check;
	}
	
	protected MessageOutput myself;
	
	protected void accept (String name) throws IOException {
		Queue queue = new Queue ();
		boolean check = checkpass (name);
		boolean registered = false;
		if (check) {
			synchronized (routes) {
				if (!routes.containsKey (name)) {
					registered = true;
					routes.put (name, myself = new QueueOutputStream (queue));
					System.out.println ("Accept : " + name);
				}
			}
		}
		try {
			new DataOutputStream (out).writeBoolean (registered);
			out.flush ();
			if (registered) {
				execute (queue);
			}
		} finally {
			if (registered)
				routes.remove (name);
		}
	}
	
	protected void execute (Queue queue) throws IOException {
		MessageInput queueIn = new QueueInputStream (queue);
		MessageOutput messageOut = new MessageOutputStream (out);
		GenericMessageCopier copier =
			new GenericMessageCopier (this, queueIn, messageOut);
		try {
			copier.start ();
			route ();
		} finally {
			copier.finish ();
		}
	}
	
	protected void route () throws IOException {
		MessageInputStream messageIn = new MessageInputStream (in);
		RoutingInputStream routingIn = new RoutingInputStream (messageIn);
		while (!Thread.interrupted ()) {
			routingIn.receive ();
			byte[] buffer = new byte[routingIn.available ()];
			routingIn.readFully (buffer);
			String[] targets = routingIn.getTargets ();
			if (targets == null) {
				broadcast (buffer);
			}
			else {
				multicast (buffer, targets);
			}
		}
	}
	
	protected void broadcast (byte[] buffer) throws IOException {
		Enumeration dsts = ((Hashtable) routes.clone ()).elements ();
		while (dsts.hasMoreElements ()) {
			Object temp = dsts.nextElement ();
			MessageOutput messageOut = (MessageOutput) temp;//dsts.nextElement ();			
			send (buffer, messageOut);
		}
	}
	
	protected void multicast (byte[] buffer, String[] targets) throws IOException {
		for (int j = 0; j < targets.length; ++ j) {
			MessageOutput messageOut = (MessageOutput) routes.get (targets[j]);
			if (messageOut != null)
				send (buffer, messageOut);
		}
	}
	
	protected void send (byte[] buffer, MessageOutput messageOut) throws IOException {
		if (messageOut != myself) {
			synchronized (messageOut) {
				messageOut.write (buffer);
				messageOut.send ();
			}
		}
	}
}