import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.lang.*;
import java.util.Date;




public class AddToCartServlet extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=MS874";
  private static final String TARGET_PAGE = "../shoppingcart.jsp";
	private static final String LOGIN_PAGE="../login_shop.jsp";
  /**Initialize global variables*/
  public void init() throws ServletException {
  }

  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();

	// รับ parameter จาก Form
	String code = request.getParameter("code");
	String cat = request.getParameter("catNo");
	String type=request.getParameter("type");
	int num = Integer.parseInt(request.getParameter("num"));
	String tableName=request.getParameter("tablename");
	String comment=request.getParameter("comment");
	 int pr=0;
	 int line=1;


	// สร้าง session

	HttpSession session = request.getSession(true);
	int emp=0 ;

   // เรียก Shopping Cart จาก Session
	ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("ShoppingCart");
    if (shoppingCart == null) {
      shoppingCart = new ShoppingCart();
		try{
				long DateTime=new java.util.Date().getTime();
				java.sql.Date date=new java.sql.Date(DateTime);
				java.sql.Time  time=new java.sql.Time(DateTime);
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
				Statement stmt = con.createStatement();
				DatabaseMetaData dmd = con.getMetaData();
				System.out.println("connection = " + dmd.getMaxConnections());
				System.out.println("statement = " + dmd.getMaxStatements());
				String query="SELECT MAX(PR#) FROM PR ";
				ResultSet rs=stmt.executeQuery(query);
				System.out.println("0");	
				System.out.println("connection = " + dmd.getMaxConnections());
				System.out.println("statement = " + dmd.getMaxStatements());
				 rs.next();
				 pr=rs.getInt("MAX(PR#)");
				 pr+=1; // เรียงเบอร์ pr 
				System.out.println("1");	
				rs.close();
				stmt.close();
								
				 Statement stmt1 = con.createStatement();
				 String query1="SELECT DEPT_NAME FROM DEPARTMENT";
				 ResultSet rs1=stmt1.executeQuery(query1);
				 System.out.println("2");	
				System.out.println("connection = " + dmd.getMaxConnections());
				System.out.println("statement = " + dmd.getMaxStatements());
				 rs1.next();
				 String deptname=rs1.getString("DEPT_NAME");
				//update ว่ามี pr ออกใหม่ 1 ใบแล้ว
			    rs1.close();
				stmt1.close();
				 Statement stmt2 =  con.createStatement();
				 String query2="INSERT INTO PR(PR#,EMP#,DEPT_NAME,DATE1,STATUS,EMP_COMM,APP1_COMM,APP2_COMM) VALUES('"+pr+"','"+emp+"','"+deptname+"',sysdate,'','"+comment+"','','')";
				 System.out.println(query2);
				 stmt2.executeUpdate(query2);	
				 System.out.println("3");	
				stmt2.close();
				 con.close();

		}catch(java.sql.SQLException e)  {
            System.out.println("SQLException:<br>");
  		      System.out.println("Message:   " + e.getMessage() + "<br>");
		      System.out.println("SQLState:  " + e.getSQLState() + "<br>");
		      System.out.println("ErrorCode: " + e.getErrorCode() + "<br>");
			  e.printStackTrace();
									} // catch
    }

    Collection itemOrderCollection = shoppingCart.getItemOrdered();
	Iterator i = itemOrderCollection.iterator();

	boolean exist = false;

	while (i.hasNext())
	{
		ItemOrder item = (ItemOrder) i.next();
		if (code.equals(item.getItemID())) {
			item.incrementNumItems(num);
			exist = true;
		}
	}//while

    Collection itemOrderCollection1 = shoppingCart.getItemOrdered();
	Iterator i1 = itemOrderCollection1.iterator();

    while (i1.hasNext() && (!exist))
    {
		ItemOrder item = (ItemOrder) i1.next();
		  if (cat.equals(item.getCatNo()))
		    { //ถ้า cat เดียวกัน
				pr=item.getPrNo();
				item.incLineNo();
				break;
		    }else{ // ไม่มี cat นี้ใน shoppingcart
								try{
										long DateTime=new java.util.Date().getTime();
										java.sql.Date date=new java.sql.Date(DateTime);
										java.sql.Time  time=new java.sql.Time(DateTime);
										DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
										 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
										 Statement stmt = con.createStatement();
										DatabaseMetaData dmd = con.getMetaData();
										System.out.println("connection = " + dmd.getMaxConnections());
										System.out.println("statement = " + dmd.getMaxStatements());
										 String query="SELECT MAX(PR#) FROM PR ";
										 ResultSet rs=stmt.executeQuery(query);
										 System.out.println("0");	

										System.out.println("connection = " + dmd.getMaxConnections());
										System.out.println("statement = " + dmd.getMaxStatements());

										 rs.next();
										 pr=rs.getInt("MAX(PR#)");
										 pr+=1; // เรียงเบอร์ pr 
										System.out.println("1");	
										rs.close();
										stmt.close();
										
										 Statement stmt1 = con.createStatement();

										 String query1="SELECT DEPT_NAME FROM DEPARTMENT";

										 ResultSet rs1=stmt1.executeQuery(query1);
										 System.out.println("2");	
										System.out.println("connection = " + dmd.getMaxConnections());
										System.out.println("statement = " + dmd.getMaxStatements());

										 rs1.next();
										 String deptname=rs1.getString("DEPT_NAME");
									//update ว่ามี pr ออกใหม่ 1 ใบแล้ว


									    rs1.close();
										stmt1.close();
										 Statement stmt2 =  con.createStatement();
										 String query2="INSERT INTO PR(PR#,EMP#,DEPT_NAME,DATE1,STATUS,EMP_COMM,APP1_COMM,APP2_COMM) VALUES('"+pr+"','"+emp+"','"+deptname+"',sysdate,'','"+comment+"','','')";
										 System.out.println(query2);
										 stmt2.executeUpdate(query2);	
										 System.out.println("3");	
										stmt2.close();
										 con.close();

									}catch(java.sql.SQLException e)  {
            System.out.println("SQLException:<br>");
  		      System.out.println("Message:   " + e.getMessage() + "<br>");
		      System.out.println("SQLState:  " + e.getSQLState() + "<br>");
		      System.out.println("ErrorCode: " + e.getErrorCode() + "<br>");
			  e.printStackTrace();
									} // catch			
					}//else
    }

	// สร้าง ItemOrder จากข้อมูลที่รับเข้ามา
	ItemOrder itemOrder = new ItemOrder(code,type,cat,num,tableName,pr,line);

	// ใส่ ItemOrder เข้าไปใน ShoppingCart

   


	if (!exist) {
		shoppingCart.add(itemOrder);
	}

	// ใส่ ShoppingCart ลงใน Session
	session.setAttribute("ShoppingCart", shoppingCart);

	response.sendRedirect(TARGET_PAGE);
  }

  /**Process the HTTP Post request*/
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  doGet(request, response);
  }
  /**Clean up resources*/
  public void destroy() {
  }
}
