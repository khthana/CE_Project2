import java.sql.*;
import java.io.*;

public class TypeVotePanel{
	private String sql;
	private String tmp, suser, spassword, sdatabase;
	private String tnameVote;
	private int typeNo;
	private String[] tnameArr;
	private ConnectionDatabase cb;
  	private ResultSet r;
  	
  	public TypeVotePanel() {
		try {
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}

	private void Init() {
		connectDB();
	}
	
	private void connectDB()
	{
		try
		{
			FileReader fr = new FileReader("config.inf");
			BufferedReader br = new BufferedReader(fr);
			tmp = br.readLine(); suser = tmp.substring(12);
			tmp = br.readLine(); spassword = tmp.substring(11);
			tmp = br.readLine(); sdatabase = tmp.substring(16);
			br.close();
		
      		cb = new ConnectionDatabase(suser,spassword,sdatabase);
		}
		catch(Exception e) { e.printStackTrace();}		
	}
	 
	public String[] setTypeVote()
	{
		try
	 	{
	 		sql = "select count(*) from vote_type";
			r = cb.Query(sql); 
			r.next();
			int loop2 = r.getInt(1);
			
			tnameArr = new String[loop2];
			
			sql = "select * from vote_type";
			r = cb.Query(sql);
			for(int j = 0; j < loop2; j++)
			{
				r.next();
				typeNo = r.getInt(1);
				tnameVote = r.getString(2);
				tnameArr[j] = tnameVote;
			}
	 	}
	 	catch(SQLException e)
	 	{	System.out.println(e);	}
	 	
	 	return tnameArr;
	}
	
	public int getIntTypeVote(String t1, String t2)
	{
		int retInt = 0;
		int intT1 = 0;
		int intT2 = 0;
		if(t1.equals("ÅÑº"))
			intT1 = 1;
		else if(t1.equals("à»Ô´à¼Â"))
			intT1 = 2;
	
		try
	 	{
			sql = "select * from vote_type where t_name = '" + t2 + "'";
			r = cb.Query(sql);
			r.next();
			intT2 = r.getInt(1);
	 	}
	 	catch(SQLException e)
	 	{	System.out.println(e);	}
	 	
	 	if((intT1 == 1) && (intT2 == 1))
	 		retInt = 0;
	 	else if((intT1 == 2) && (intT2 == 1))
	 		retInt = 1;
	 	else if((intT1 == 1) && (intT2 == 2))
	 		retInt = 2;
	 	else if((intT1 == 2) && (intT2 == 2))
	 		retInt = 3;
	 	else if((intT1 == 1) && (intT2 == 3))
	 		retInt = 4;
	 	else if((intT1 == 2) && (intT2 == 3))
	 		retInt = 5;
	 	
	 	return retInt;
	}
} // End of class