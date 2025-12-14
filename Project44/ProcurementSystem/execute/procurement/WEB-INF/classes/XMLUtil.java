import java.io.*;
import java.sql.*;


public class XMLUtil {
  public static void createXML(int pnum) 
  {
	  try
	  {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
			Statement stmt = con.createStatement();

	//	String pnum = "1";
			String pnumS =  (new Integer(pnum)).toString();
			String query = "SELECT * FROM PO WHERE PO#='" + pnumS +"'";
		//	System.out.println(query);
			ResultSet rs;
			rs =stmt.executeQuery(query);
			rs.next();

			FileWriter fout = new FileWriter("G:\\him\\PO.xml");
			BufferedWriter bout = new BufferedWriter(fout);
			PrintWriter pout = new PrintWriter(bout);

			pout.println("<?xml version= \"1.0\" encoding=\"windows-874\"?>");
			pout.println("<!DOCTYPE PO SYSTEM \"PO.dtd\">");
			pout.println("<PO>");
			pout.println("<POHead>");
			pout.println("<POID>" + rs.getInt("PO#") + "</POID>");
			pout.println("<PODate>" + rs.getString("DATE1") + "</PODate>");
			pout.println("<POStatus>" + rs.getString("STATUS") + "</POStatus>");
			pout.println("<POTotalPrice>" + rs.getString("TOTAL_PRICE") + "</POTotalPrice>");
		
			int vendname = rs.getInt("VENDOR#");
			rs.close();
			stmt.close(); // ปิด DB ของ PO

			stmt = con.createStatement(); // จะติดต่อไปหาตาราง vendor
			query = "SELECT * FROM VENDOR WHERE VENDOR#='"+vendname+"'";
			rs =stmt.executeQuery(query);
			rs.next();

			pout.println("<VendorName>" + rs.getString("NAME") + "</VendorName>");
			pout.println("<VendorAddress>" + rs.getString("ADDR") + "</VendorAddress>");
			pout.println("<VendorPhone>" + rs.getString("PHONE") + "</VendorPhone>");
			pout.println("<VendorFax>" + rs.getString("FAX") + "</VendorFax>");
			pout.println("<SaleName>" + rs.getString("SELL_NAME") + "</SaleName>");
			pout.println("<SaleMail>" + rs.getString("SELL_SNAME") + "</SaleMail>");
			pout.println("<BuyerName>OLALA Procurement</BuyerName>");
			pout.println("<BuyerAddress>ภาควิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ สจล.</BuyerAddress>");
			pout.println("<BuyerPhone>027374500-30</BuyerPhone>");
			pout.println("<BuyerFax>027374531</BuyerFax>");
			pout.println("<BuyerMail>procurement@olala.co.th</BuyerMail>");
			pout.println("</POHead>");
			rs.close();	
			stmt.close(); // ปิด DB ของ Vendor

			Statement stmt1 = con.createStatement(); // จะติดต่อไปหาตาราง po_line
			query = "SELECT * FROM PO_LINE WHERE PO#='"+pnum+"'";
			System.out.println(query);
			ResultSet rs1 =stmt1.executeQuery(query);
			
			while (rs1.next())
			{
				pout.println("<ProductList>");
				pout.println("<POLine>" + rs1.getString("LINE#") + "</POLine>");
				pout.println("<ProductName>" + rs1.getString("CODE") + "</ProductName>");
				pout.println("<ProductPrice>" + rs1.getString("PRICE") + "</ProductPrice>");
				pout.println("<ProductQTY>" + rs1.getString("QTY") + "</ProductQTY>");
				pout.println("<RequiredDate>" + rs1.getString("REQ_DATE") + "</RequiredDate>");
				pout.println("<ProductLineStatus>" + rs1.getString("STATUS") + "</ProductLineStatus>");
				pout.println("</ProductList>");
			}
			pout.println("</PO>");
			pout.close();


			rs1.close();
			stmt1.close();
				Statement stmt2 = con.createStatement();
				String qu = "UPDATE PO SET STATUS='1' WHERE PO#='"+pnum+"'";
				stmt2.executeUpdate(qu);
			stmt2.close();
			con.close();
			

			

			        
		//rs.first();
	  }// try
	  /*
	  catch(java.sql.SQLException e)  {
															  System.out.println("SQLException:<br>");
															  System.out.println("Message:   " + e.getMessage() + "<br>");
															  System.out.println("SQLState:  " + e.getSQLState() + "<br>");
															  System.out.println("ErrorCode: " + e.getErrorCode() + "<br>");
															  e.printStackTrace();
																	} // catch*/
	  catch(Exception ioe)
	  {
			ioe.printStackTrace();
	  }
  }//method

		/* define namespace for root element
//		if (!rootNameSpace.equals("")) {
//		  System.out.println("<!ATTLIST " + objRootName + " xmlns:" + " CDATA #FIXED \"" + rootNameSpace + "\">");
//		  System.out.println("<!ATTLIST " + subRootName + " xmlns:" + " CDATA #FIXED \"\">");
//		}
		System.out.println("<!ELEMENT " + subRootName + " (");
		ResultSetMetaData rsmd = rs.getMetaData();

		for(int i=1; i<=rsmd.getColumnCount(); i++) {
		  System.out.println(rsmd.getColumnLabel(i));
		  if (i == rsmd.getColumnCount()) {
			System.out.println(")>");
			System.out.println();
		  }
		  else {
			System.out.println(", ");
		  } // end if
		} // end for

		for(int i=1; i<=rsmd.getColumnCount(); i++) {
		  System.out.println("<!ELEMENT " + rsmd.getColumnLabel(i) + " (#PCDATA)>");
		  System.out.println("<!ATTLIST " + rsmd.getColumnLabel(i) + " xmlns:" + " CDATA #FIXED \"\">");
		}
	  }
	  catch (SQLException e) {
		  e.printStackTrace();
	  }*/

  public static void main(String args[])
  {
		System.out.println("Test stub");	 
		int pnum = 1;
		//try
		{
			XMLUtil xu = new XMLUtil();
			xu.createXML(pnum);
		}

/*		XMLUtil xu = new XMLUtil();
		xu.createDTD(rs, "objectRootName","//", "subRootName", "rootNameSpace");
		stmt.close();
		con.close();	            */
	 
		/*catch(SQLException e) 
		{
			  while (e != null) 
			 {
				System.out.println("SQLException:");
			   System.out.println("Message:   " + e.getMessage() + "<br>");
			   System.out.println("SQLState:  " + e.getSQLState() + "<br>");
			   System.out.println("ErrorCode: " + e.getErrorCode() + "<br>");
			  e = e.getNextException();
		   }
		}
		catch(ClassNotFoundException cnfe)
		{
			cnfe.printStackTrace();
		}	

/*
while (rs.next())
{
	 String vendername=rs.getString("NAME");
	 String addr=rs.getString("ADDR");
	 String phone = rs.getString("PHONE");
	 String fax = rs.getString("FAX");
	 String sellname=rs.getString("SELL_NAME");
	 String sellsname=rs.getString("SELL_SNAME");
	 String veno=rs.getString("VENDOR#");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
		Statement stmt1 = con.createStatement();
		
			String q="SELECT VENDOR# FROM PO WHERE PO#='"+veno+"'";
       ResultSet r = stmt1.executeQuery(q);
	                while(r.next()){
										  
					}

          r.close();
		  stmt1.close();
}*/
 }//main
}