package search;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import javax.ejb.*;
import customer.*;

public class SearchCustomerServlet extends HttpServlet {
String[] attribute = {"username","name","no","soi","street","district",
                      "province","country","email","tel","fax","credit_id","user_type"};
CustomerHome customerHome;
  /**Initialize global variables*/
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyCustomer");
      customerHome = (CustomerHome) PortableRemoteObject.narrow(objref,
                      CustomerHome.class);
      System.out.println("obtained customerHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate Customer Home");
      re.printStackTrace();
    }

  }
  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  HttpSession session = request.getSession(true);
  String tmpSql = "";
      for (int i=0; i<attribute.length; i++) {
      try {
          String x = request.getParameter(attribute[i]);
          String xValue;
          if (x!=null && !x.equals("")) {
            if (x.equals("all")) {
            } else {
            if (tmpSql!=null && !tmpSql.equals("")) { tmpSql=tmpSql+" and "; }
            if (x.equals("between")) {
              xValue = request.getParameter(attribute[i]+"B1");
              tmpSql = tmpSql +" "+attribute[i]+ " between '"+xValue.trim();
              xValue = request.getParameter(attribute[i]+"B2");
              tmpSql = tmpSql + "' and '"+xValue.trim()+"'";
            } else {
            if (x.equals("equal"))  {
              tmpSql = tmpSql + " " + attribute[i] + " = '";
            } else if (x.equals("more")) {
              tmpSql = tmpSql + " " + attribute[i] + " >= '";
            } else if (x.equals("lower")) {
              tmpSql = tmpSql + " " + attribute[i] + " <= '";
            }
            xValue = request.getParameter(attribute[i]+"Text");
            tmpSql = tmpSql + xValue.trim()+"'";
            }
            }
          }
        } catch (Exception ex) {System.out.println("no have "+attribute[i]);}
        }
    try {
    System.out.println("######## tmpSql = "+tmpSql);
    Collection c = customerHome.findByCondition(tmpSql);
    session.putValue("customer",c);
    } catch (FinderException ex) {
      System.out.println("occur finderException");
    } catch (RemoteException ex) {
    }
    response.sendRedirect(response.encodeURL("/product/ViewCustomer.jsp"));
  }
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
  }
  /**Clean up resources*/
  public void destroy() {
  }
}