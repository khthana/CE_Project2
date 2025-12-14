package ConnectDB;

import java.sql.*;
import java.util.StringTokenizer;

public class MySQLDB 
{
	private String URL;// = "jdbc:mysql://localhost:3306/test";
	private String usr;// = "root";
	private String password;// = "oneoneone";
	private Connection aConnection;
	private Statement aStatement;
		
	public MySQLDB()
	{
		URL = "jdbc:mysql://161.246.6.92:3306/applyphysic";
		usr = "root";
		password = "oneoneone";
	}
	
	public MySQLDB(String _url, String _user, String _password)
	{
		URL = _url;
		usr = _user;
		password = _password;
	}
	
	public void initialize()
	{
		try
		{
			Class.forName("org.gjt.mm.mysql.Driver");//"sun.jdbc.odbc.JdbcOdbcDriver");
			aConnection = DriverManager.getConnection(URL, usr, password);
			aStatement = aConnection.createStatement();
		}
		catch (ClassNotFoundException e)
		{
			System.err.println("ClassNotFoundException : " + e);
		}
		catch (SQLException e)
		{
			System.err.println("SQLException : " + e);
		}
	}

	public void terminate()
	{
		try
		{
			aStatement.close();
			aConnection.close();
		}
		catch (SQLException e)
		{
			System.err.println("SQLException : " + e);
		}
	}
		
	public String find(String statement, String table)
	{
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
		}catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
		String out = null;
		
		out = DBToXml(statement, table);
		return out;
	}
	
	public ResultSet find(String Statement) throws SQLException
	{
		ResultSet rs = null;
		rs = aStatement.executeQuery(Statement);
		return rs;
	}
	
	public boolean update(String statement)
	{
		boolean complete = false;
		initialize();
		try{
			aStatement.executeUpdate(statement);
			complete = true;
		}catch(SQLException e)
		{
			System.err.println(e);
			complete = false;
		}
		finally
		{
			terminate();
		}
		return complete;
	}
	
	public boolean IsExist(String statement)
	{
		boolean isexist = false;
		initialize();
		try
		{
			ResultSet rs = aStatement.executeQuery(statement);
			if(rs.next())
				isexist = true;
			else
				isexist = false;
		}catch(SQLException e)
		{
			System.err.println(e);
		}finally
		{
			terminate();
		}
		return isexist;
	}
	
	/*private String DBToXml(String xslFile, String statement,String table)
	{
		String docname = args[0];
		String sheetname = xslFile;
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(docname);

		XSLTransformer transformer = new XSLTransformer(sheetname);
		Document doc2 = transformer.transform(doc);

		XMLOutputter outp = new XMLOutputter(Format.getPrettyFormat());
		outp.output(doc2, System.out);
	}*/
	
	private String DBToXml(String statement, String table)
	{
		String output = new String("");
		initialize();
		try{
			ResultSet rs =  find(statement);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numCols = rsmd.getColumnCount();
			String rowMarker = "row";
			output += "<" + table + ">";
			int id = 0;
			while (rs.next() ){
				id++;
				output += ("<" + rowMarker + " id = '"+ id +"'>");
				for(int i = 1 ; i <= numCols ; i++)
				{
					System.out.println(rsmd.getColumnType(i));
					String columnValue;
					if(rsmd.getColumnType(i) == 93)
					{
						StringTokenizer st = new StringTokenizer(rs.getString(i)," ");
						st.nextToken();
						columnValue = st.nextToken();
					}else
					{
						columnValue = rs.getString(i);
					}
            			
					String columnMarker = rsmd.getColumnLabel(i);
					output += ("<" + columnMarker + ">");
					output += (columnValue);
					output += ("</" + columnMarker +">");
				}
				output += ("</" + rowMarker + ">");
			}
			output += "</" + table + ">";
			return output;
		}catch(SQLException e)
		{
			System.err.println(e);
		}finally
		{
			terminate();
		}
		/*try{
			FileDestination out = new FileDestination("output.xml");
			String xmlParserClassName = "dbxml.sax.JDBCSAXParser";
			String xslParserClassName = "com.jclark.xml.sax.CommentDriver";
			_xslProcessor = JDBCXSLProcessor.createXSLProcessor(xmlParserClassName, xslParserClassName);
			OutputMethodHandlerImpl outputMethodHandler = new OutputMethodHandlerImpl(_xslProcessor);
			_xslProcessor.setOutputMethodHandler(outputMethodHandler);
			outputMethodHandler.setDestination(out);
			InputSource dbis = new JDBCInputSource(URL, usr, password, statement, table);
			JDBCXSLProcessor.transform(_xslProcessor, Driver.fileInputSource(new File(xslFile)), dbis);
			FileInputStream in = new FileInputStream("output.xml");
			int size = in.available();
			byte[] byteout = new byte[size];
			in.read(byteout);
			output = new String(byteout);
		}catch(FileNotFoundException e)
		{
			System.err.println(e);
		}
		catch(IOException e)
		{
			System.err.println(e);
		}*/
		return output;
	}
}