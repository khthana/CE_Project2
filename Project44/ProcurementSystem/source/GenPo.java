import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.lang.*;
import java.util.Date;
import javax.mail.*;
import javax.mail.internet.*;



public class GenPo extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=MS874";
  private static final String TARGET_PAGE = "../genpo_fin.jsp";

  /**Initialize global variables*/
  public void init() throws ServletException {
  }
public String UnicodeToMS874( String _in) { 
StringBuffer strTemp = new StringBuffer( _in ); 
int code; 
for( int i = 0; i < _in.length(); i++) { 
code = (int) strTemp.charAt(i); 
if ( ( 0xE01 <= code ) && ( code <= 0xE5B ) ) { 
strTemp.setCharAt( i, (char) ( code - 0xD60 ) ); 
} 
} 
return strTemp.toString(); 
} 

public String MS874ToUnicode( String _in ) { 
StringBuffer strTemp = new StringBuffer( _in ); 
int code; 
for( int i = 0; i < _in.length(); i++) { 
code = (int) strTemp.charAt(i); 
if ( ( 0xA1 <= code ) && ( code <= 0xFB ) ) { 
strTemp.setCharAt( i, (char) ( code + 0xD60 ) ); 
} 
} 
return strTemp.toString(); 
} 
  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();

	HttpSession session = request.getSession(true);
    String emp = (String)session.getAttribute("emp");
	String passwd = (String)session.getAttribute("passwd");
	String name=(String)session.getAttribute("name");
	String sname=(String)session.getAttribute("sname");
	String dept=(String)session.getAttribute("dept");
	String adhoc=(String)session.getAttribute("adhoc");

	
  
	//String vendornum=request.getParameter("vendor");


	// เรียก Shopping Cart จาก Session
	 int ponum=0;
	 int linenum=1;
     boolean existpr=false;

     if (emp==null)
     {
		 out.println("<P>&nbsp;<P><CENTER><B>ยังไม่ Login กรุณา Loing ก่อนเข้าสู่ระบบ</B></CENTER>");
     }else{
/********************************** สร้าง temp PO และ แสดง Vendor ที่ support สินค้า******************************************/
					int aa=0;
			//		int a=Integer.parseInt(request.getParameter("ii"));
					String vendor=new String();
					double vprice=0;  
					String code = request.getParameter("code");
				//	int at = Integer.parseInt(request.getParameter("at"));
					String check=request.getParameter("check");
					int at=Integer.parseInt(request.getParameter("at"));
			//		boolean found=false;
		/*				while ((aa<=a)&&(!found))
						{      
							 check=request.getParameter("check"+aa);
							if (check.equals("yes"))
							{*/
								vendor=request.getParameter("vendor"+check);
								int vendornum=Integer.parseInt(vendor);
								vprice=Double.parseDouble(request.getParameter("vprice"+check));
								/*found=true;
							}
							aa+=1;
						}*/

					
   
  TMP_PO_collection TMP_PoCart = (TMP_PO_collection) session.getAttribute("TMP_PoCart");
  if (TMP_PoCart== null) {  // ไม่มีสินค้าจะทำ PO

						out.println("<P>&nbsp;<P>&nbsp;<B><CENTER>ไม่มีรายการสินค้าสำหรับออกใบ PO </CENTER></B>");
					
    }else { // มีสินค้าจะทำ PO
	
	/*************************************************************************************/
          PO_collection po_collection =(PO_collection) session.getAttribute("PoCart");
		  ItemVector itemVec = (ItemVector) session.getAttribute("item_vector");
		  Vector po_vector=(Vector)session.getAttribute("po_vector");
		   Vector	code_vector=(Vector)session.getAttribute("code_vector");
	       if (po_collection==null)
	       {  
			    po_collection= new PO_collection();
	       }
			   
		   if (po_vector==null)
		   { 
			   po_vector= new Vector();
		   }
		   if (code_vector==null)
		   {
			   code_vector= new Vector();
		   }

		   if (itemVec==null)
		   {
				itemVec=new ItemVector();
		   }
		   
									
			TMP_PO tmp_po = TMP_PoCart.itemAt(at);
	//Iterator it = tmp_po_col.iterator();

//	while (it.hasNext())  //งต้อง getง ค่าจาก iterationง ค่าเดียว
		//   
	//	TMP_PO tmp_po = (TMP_PO) it.next();
		tmp_po.setVendorNo(vendor);  
		
				Collection poCollection = po_collection.getPo_vector();
				Iterator ii = poCollection.iterator();
	
				while (ii.hasNext())
				{
					PO po=(PO) ii.next();
                    
					System.out.println(po.getVendorNo());
					System.out.println(tmp_po.getVendorNo());
						if (po.getVendorNo().equals(tmp_po.getVendorNo())) // check จาก vendor
						{
							  
							ponum=po.getPoNo();
						//	wfnum=pr.getWfNo();
							int tmp_line=po.getLineNo();
							    if (tmp_line > linenum)
							    {
									linenum=tmp_line;
							    }//if
							
							existpr=true;

						}//if
					
				}//while
	
				if(!existpr){ //กรณีที่ไม่มี po นี้เลย
								
				//gen po ใหม่ เอาข้อมูลจาก DB 
			try{
				
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
				Statement stmt = con.createStatement();
				DatabaseMetaData dmd = con.getMetaData();
				String query="SELECT MAX(PO#) FROM PO ";
				ResultSet rs=stmt.executeQuery(query);
				 rs.next();
				 ponum=rs.getInt("MAX(PO#)");
				 ponum+=1;
				 po_vector.add(new Integer(ponum));	
				 System.out.println("Create po_vec");
				 linenum=0;
				rs.close();
				stmt.close();

				  // ลงข้อมูลใน DB
				       Statement stmt1 = con.createStatement();
					   query="INSERT INTO PO(PO#,VENDOR#,DATE1,STATUS)  VALUES("+ponum+","+vendornum+",sysdate,'0')";
					   System.out.println(query);
					   stmt1.executeUpdate(query);
					   stmt1.close();
				  }catch(java.sql.SQLException e)  {
              System.out.println("SQLException:<br>");
  		      System.out.println("Message:   " + e.getMessage() + "<br>");
		      System.out.println("SQLState:  " + e.getSQLState() + "<br>");
		      System.out.println("ErrorCode: " + e.getErrorCode() + "<br>");
			  e.printStackTrace();
					} // catch

		
				}//if

				//สร้าง vector ลง session
				linenum+=1;
				PO po_vec = new PO(tmp_po.getItemID(), tmp_po.getType(),tmp_po.getCatNo(),tmp_po.getNumItems(),tmp_po.getBrand(),vprice,ponum,linenum,tmp_po.getTableName(),vendor);
				po_collection.add(po_vec);
				code_vector.add(new Integer(code));



			//	wf_vector.add(new Integer(wfnum));	
			
			
		//}//while
		   
                 Collection itemCol = itemVec.getItemVector();
				Iterator tt = itemCol.iterator();
	
				while (tt.hasNext())
				{
					Item itm=(Item) tt.next();
				//	int itm1=Integer.parseInt(itm.getCode());
				//	int itm2=Integer.parseInt(itm.getPrLineNo());
								if  ( itm.getCode().equals(tmp_po.getItemID()))
								{
									 System.out.println(itm.getCode()+"  "+tmp_po.getItemID()+"  "+itm.getPrLineNo());
									 
									   itm.setPoNo(ponum);
									   itm.setPoLineNo(linenum);
								}
					         
					
				}

				linenum=0;
				existpr=false;
	            //show  pr collection
				poCollection = po_collection.getPo_vector();
				Iterator ii1 = poCollection.iterator();
					while (ii1.hasNext())
				{
					PO po=(PO) ii1.next();
					System.out.println("PO no : "+po.getPoNo()+" Line no : "+po.getLineNo()+"  CAT No : "+po.getCatNo()+" Item No : "+po.getItemID()+" TableName : "+po.getTableName()+" Vendor No : "+po.getVendorNo());	
					
				 }
/***************************************************************/
				TMP_PoCart.remove(at);
				session.setAttribute("TMP_PoCart",TMP_PoCart);
				session.setAttribute("PoCart",po_collection);
				session.setAttribute("po_vector",po_vector);
				session.setAttribute("code_vector",code_vector);
				 session.setAttribute("item_vector",itemVec);
				response.sendRedirect("../genpo.jsp");
	/*************************************************************************************/
	
	}//else

	
  }//else
  }
  /**Process the HTTP Post request*/
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  doGet(request, response);
  }
  /**Clean up resources*/
  public void destroy() {
  }
}
