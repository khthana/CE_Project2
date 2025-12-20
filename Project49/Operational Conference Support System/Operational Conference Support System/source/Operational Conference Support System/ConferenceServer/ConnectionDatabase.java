import java.sql.*;

class ConnectionDatabase {
	
	private Connection connect;
	private Statement statement;
	private ResultSet result;
	private String database;
	
	public ConnectionDatabase(String user,String password,String databasename) {
		try {
			Init(user,password,databasename);
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init(String user,String password,String databasename) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		database = "jdbc:mysql://localhost/" + databasename + "?characterEncoding=tis620";
		connect = DriverManager.getConnection(database,user,password);
		statement = connect.createStatement();
	}
	public ResultSet Query(String sql) {
		try {
			result= statement.executeQuery(sql);
		} catch(Exception e) { e.printStackTrace(); }
		return result;
	}
	public void Update(String sql) {
		try {
			statement.executeUpdate(sql);
		} catch(Exception e) { e.printStackTrace(); }
	}
	public void Execute(String sql) {
		try {
			statement.executeUpdate(sql);
		} catch(Exception e) { e.printStackTrace(); }
	}
}