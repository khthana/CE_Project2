import java.sql.*;
import java.net.*;
import java.io.*;
class sms
{
	String table_name = "user_table";
	String column_1 = "user_name";
	String column_2 = "user_pass";
	String column_3 = "nicname";
	String column_4 = "name";
	String column_5 = "surname";
	String column_6 = "telephone";
	String column_7 = "smspass";
	private static String column_11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String user_name;
	String massage;
	String post = "";
	int telephone;
	int smspass;
	sms(String user_name,String massage)
	{
		this.user_name = user_name;
		this.massage=massage;
	}
	public void send()
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
			query.append("SELECT  ");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append("\"");
			query.append(user_name);
			query.append("\"");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				telephone = rs.getInt(column_6);
				smspass = rs.getInt(column_7);
				System.out.println(telephone+" pass "+smspass);
			}
/* 
		//	152
			URL u = new URL("http","ppapager.com","/pagers2.cgi");
			post +="Env1188account=&EnvTimerminute=&EnvTimerhour=&EnvTimerday=&EnvImpressFile=&EnvSend=backButton&EnvPassword=&EnvUserName=&EnvDayWeek=&EnvID=&Env1188password=&EnvDay=This&EnvMonth=This&EnvYear=This&EnvHour=This&EnvMinute=This&company=152&number=";
			post +=telephone;
			post +="&password=&EnvMessage=";
			post +=URLEncoder.encode(massage);
			post +="&EnvFrom=Teamworking&B1=Send";
*/

		// GSM
			URL u = new URL("http","202.183.251.250","/cgi-gsmweb/web2gsm.cgi");
			post +="szGsmNo=";
			post +=telephone;
			post +="&szGsmPwd=";
			post +=smspass;
			post +="&szMesg=";
			post +=URLEncoder.encode(massage);
			post +="&Send=++Send+++";

			URLConnection urlc = u.openConnection();
			urlc.setDoOutput(true);
			urlc.setDoInput(true);
			urlc.setAllowUserInteraction(false);
			DataOutputStream server = new DataOutputStream(urlc.getOutputStream());
			server.writeBytes(post);
			System.out.println("post"+post);
			server.close();

			//DataInputStream in = new DataInputStream(urlc.getInputStream());
			BufferedReader in = new BufferedReader(new InputStreamReader(urlc.getInputStream()));
 
			String s;
			String data="";
			while((s=in.readLine()) !=null) 
			{
				//System.out.println(s+"\n");
				data += s+"\n";
			}
			in.close();
			DataOutputStream out2 =
				new DataOutputStream(
					new BufferedOutputStream(
		              new FileOutputStream("Data.html")));
			out2.writeBytes(data);
        out2.close();

		}
		catch (Exception ee)
		{
			ee.printStackTrace(System.err);
			System.out.println("isSchedule");

		}
		
	}
}
