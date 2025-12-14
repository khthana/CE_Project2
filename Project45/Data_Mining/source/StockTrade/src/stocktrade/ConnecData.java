package stocktrade;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.Vector;
import java.lang.*;


public class ConnecData extends HttpServlet {
  static final private String CONTENT_TYPE = "text/html; charset=MS874";
  // refer class ControlData
  ControlData conrol;
  //
  int size;double max=0;double min=0;double fe;
  String temp;
  //Initialize global variables
  public void init() throws ServletException {
  }
  // refer class controldata
  private ControlData control;
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    String stock = request.getParameter("sample");
    out.println("<html>");
    out.println("<head><title>ConnecData</title></head>");
    out.println("<body>");
    out.println("<applet");
    out.println("      codebase = \"/stocktrade/.\"");
    out.println("      code     = \"stocktrade.Chart.class\"");
    out.println("      name     = \"TestApplet\"");
    out.println("      width    = \"420\" ");
    out.println("      height   = \"320\"");
    out.println("      hspace   = \"0\"");
    out.println("      vspace   = \"0\"");
    out.println("      align    = \"middle\"");
    out.println(">");
    out.println("<param name = \"stock\" value =\""+stock+"\">");
    out.println("<param name = \"Grid\" value = \"true\" >");
    ControlData control = new ControlData();
    Vector data = new Vector();
    try{
      data = control.dataLine( stock );
      System.out.println(data);
      size = data.size();
      System.out.println(size);
      if( size < 2 ){
        out.println("<param name= \"NumberOfVals\" value=\"1\">");
        out.println("<param name= \"pricemax\" value=\"0.5\">");
        out.println("<param name= \"pricemin\" value=\"0\">");
      }
      else{
        out.println("<param name= \"NumberOfVals\" value=\""+Integer.toString( data.size() )+"\">");
        for( int i =1; i<=size-2;i++ ){
          out.print("<param name= \"VAL"+Integer.toString(i)+"\" ");
          out.println("value=\""+data.elementAt(i-1).toString()+"\" >");
        }
        out.println("<param name= \"pricemax\" value=\""+data.elementAt(size-2).toString()+"\">");
        out.println("<param name= \"pricemin\" value=\""+data.elementAt(size-1).toString()+"\">");
      }
    }
    catch( Exception e ){
      System.out.println("MAD");
    }
    out.println("</applet>");
    out.println("</body></html>");
  }
  //Process the HTTP Post request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet( request,response );
  }
  //Clean up resources
  public void destroy() {
  }

}