import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class ReceiveSellerSpec extends HttpServlet
{             
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    Connection con = null;
    Statement stmt = null;
    ResultSet rs= null;
    HttpSession session = req.getSession(true);
    Specification Sellerspec  = new Specification();
    Specification Buyerspec   = new Specification();
    String Sellername = (String)session.getValue("username") ;
    String Sellercompanyname = (String)session.getValue("companyname");
    Sellerspec = (Specification)session.getValue("sellerspec") ;
    Buyerspec  = (Specification)session.getValue("buyerspec")  ;
    String Str_Query ;
    int rowCount = 0;
    resp.setContentType("text/html");
    out.println("<html>");
    out.println("<head>");
    out.println("<title> Receive Seller Spec</title>");
    out.println("<style><!-- A:link, A:visited { text-decoration: none; color: #ffffff}  A:hover  { text-decoration: none; font-weight: underline; color :  #33ccff} // -->  </style>");
    out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
    out.println("</head>");
    out.println("<body bgcolor=\"#FFFFFF\">");
    /////////////////Clear value in sellerspec////////////////
    for (int i_count_part = 0 ; i_count_part < Sellerspec.Listpart.size() ; i_count_part++)
      for (int row = 0 ; row < Sellerspec.GetPart(i_count_part).Listdevice.size()  ; row++)
       {
//         Buyerspec.GetPart(i_count_part).GetDevice(row).GetType();
         for (int col = 0 ; col < Sellerspec.GetPart(i_count_part).GetDevice(row).Data.length ; col++)
             {
                Sellerspec.GetPart(i_count_part).GetDevice(row).Data[col] = "-";
             }
       }
    /////////////////Clear value in sellerspec////////////////
    String Req_parameter ;
    for (int i_count_part = 0 ; i_count_part < Sellerspec.Listpart.size() ; i_count_part++)
      for (int row = 0 ; row < Sellerspec.GetPart(i_count_part).Listdevice.size()  ; row++)
       {
//         Buyerspec.GetPart(i_count_part).GetDevice(row).GetType();
           Req_parameter  = "part" + new Integer(i_count_part).toString() + "_" ;
           Req_parameter  += "row" +  new Integer(row).toString() ;
           Sellerspec.GetPart(i_count_part).GetDevice(row).Data[0] = req.getParameter(Req_parameter);
           out.println(Sellerspec.GetPart(i_count_part).GetDevice(row).GetType());
           out.println("&nbsp;&nbsp;&nbsp;");
           out.println(Sellerspec.GetPart(i_count_part).GetDevice(row).Data[0]);
           out.println("<br>");
        }
    out.println("hello");
    out.println("</body>");
    out.println("</html>");
    out.flush();
    }
}
