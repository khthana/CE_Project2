import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.lang.*;
import java.util.Date;



public class poxml extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=MS874";
  private static final String TARGET_PAGE = "../shoppingcart.jsp";

  /**Initialize global variables*/
  public void init() throws ServletException {
  }

  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();


int all=Integer.parseInt(request.getParameter("all"));
int check=Integer.parseInt(request.getParameter("check"));
boolean found=false;
int i=0;
int ponum=0;
while ((i<all)&&(!found))
{
	 if (check==i) {   
		 
            String date=request.getParameter("po_date"+i);
			ponum=Integer.parseInt(request.getParameter("ponum"+i));
			String venname=request.getParameter("venname"+i);
			
			found=true;
			}
      i+=1;
}

		if(found){
					
				XMLUtil.createXML(ponum);
				response.sendRedirect("../poxml.jsp");
		}
  }

  /**Process the HTTP Post request*/
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  doGet(request, response);
  }
  /**Clean up resources*/
  public void destroy() {
  }
}
