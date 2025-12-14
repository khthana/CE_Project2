package stocktrade;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.Vector;
import java.lang.*;


public class NewIntradayChartServlet extends HttpServlet {
  static final private String CONTENT_TYPE = "text/html; charset=MS874";
  //Initialize global variables
  private QueryData qdata;
  private Vector ngee;
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    String typ = "s";
    String stoc = "ASL";
    try{
      typ = request.getParameter("type");
    }
    catch(Exception e){
      typ = "s";
    }
    try{
      stoc = request.getParameter("stock");
    }
    catch(Exception ex){
      stoc = "ASL";
    }
    try{
      QueryData qdata = new QueryData();
      Vector ngee = new Vector();
      ngee = qdata.getdataday( stoc );
      System.out.println(ngee.size());
      for( int i=0; i<ngee.size(); i++ ){
        out.println( ngee.elementAt(i).toString() );
        System.out.println( ngee.elementAt(i).toString() );
      }
    }
    catch( Exception exx ){
    }

  }
  //Process the HTTP Post request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    doGet( request,response );
  }
  //Clean up resources
  public void destroy() {
  }
}