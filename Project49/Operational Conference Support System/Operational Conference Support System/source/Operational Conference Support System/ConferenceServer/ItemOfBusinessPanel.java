import java.sql.*;
import java.io.*;

public class ItemOfBusinessPanel{
	private String sql;
	private String tmp, suser, spassword, sdatabase;
	private String itemBusiness;
	private int itemNo;
	private int mno;
	private String[] itemBusinessArr;
	private ConnectionDatabase cb;
  	private ResultSet r;
  	
  	public ItemOfBusinessPanel() {
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
	 
	public String[] setItemCombo(int amno)
	{
		try
	 	{
	 		mno = amno;
	 		
	 		sql = "select count(*) from item_business  where MNO = " + mno;
			r = cb.Query(sql);
			r.next();
			int loopItem = r.getInt(1);
			
			itemBusinessArr = new String[loopItem];
			
			sql = "select * from item_business  where MNO = " + mno;
			r = cb.Query(sql);
			for(int i = 0; i < loopItem; i++)
			{
				r.next();
				
				itemNo = r.getInt(1);
				itemBusiness = r.getString(2);
				itemBusinessArr[i] = itemBusiness;	
			}
	 	}
	 	catch(SQLException e)
	 	{	System.out.println(e);	}
	 	
	 	return itemBusinessArr;
	}
	
} // End of class