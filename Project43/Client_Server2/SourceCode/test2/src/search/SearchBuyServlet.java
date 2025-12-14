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
import buy.*;

public class SearchBuyServlet extends HttpServlet {
String[] attribute = {"username","product_id","receipt_no",
                      "sell_quantity","total_price"};
BuyHome buyHome;
  /**Initialize global variables*/
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyBuy");
      buyHome = (BuyHome) PortableRemoteObject.narrow(objref,
                      BuyHome.class);
      System.out.println("obtained buyHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate Buy Home");
      re.printStackTrace();
    }

  }
  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  HttpSession session = request.getSession(true);
  String tmpSql = "";
  String sqlHaving = "";
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
// *********** sell_date
    String sell_date = request.getParameter("sell_date");
    String sell_dateValue;
    Long longTime1 = null;
    Long longTime2 = null;
    if (sell_date.equals("all")) {
    } else {
    if (tmpSql!=null && !tmpSql.equals("")) { tmpSql=tmpSql+" and "; }
    if (sell_date.equals("between")) {
      tmpSql = tmpSql + "sell_date between ? and ?";
      sell_dateValue = request.getParameter("sell_dateB1").trim();
      longTime1 = getLongDate(sell_dateValue);
      sell_dateValue = request.getParameter("sell_dateB2").trim();
      longTime2 = getLongDate(sell_dateValue);
    } else {
    if (sell_date.equals("equal"))  { tmpSql = tmpSql + "sell_date = ?"; }
    else if (sell_date.equals("more")) { tmpSql = tmpSql + "sell_date >= ?"; }
    else if (sell_date.equals("lower")) { tmpSql = tmpSql + "sell_date <= ?"; }
      sell_dateValue = request.getParameter("sell_dateText").trim();
      longTime1 = getLongDate(sell_dateValue);
    }
    }
// *********** totalQuanSell
    String totalQuanSell = request.getParameter("totalQuanSell");
    String totalQuanSellValue;
    if (totalQuanSell.equals("all")) {
    } else {
    if (sqlHaving!=null && !sqlHaving.equals("")) { sqlHaving=sqlHaving+" and "; }
    if (totalQuanSell.equals("between")) {
      totalQuanSellValue = request.getParameter("totalQuanSellB1").trim();
      sqlHaving = sqlHaving + "sum(total_quantity) between "+totalQuanSellValue;
      totalQuanSellValue = request.getParameter("totalQuanSellB2").trim();
      sqlHaving = sqlHaving + " and "+totalQuanSellValue;
    } else {
    if (totalQuanSell.equals("equal"))  { sqlHaving = sqlHaving + "sum(total_quantity) = "; }
    else if (totalQuanSell.equals("more")) { sqlHaving = sqlHaving + "sum(total_quantity) >= "; }
    else if (totalQuanSell.equals("lower")) { sqlHaving = sqlHaving + "sum(total_quantity) <= "; }
      totalQuanSellValue = request.getParameter("totalQuanSellText").trim();
      sqlHaving = sqlHaving + totalQuanSellValue;
    }
    }
// *********** totalPrice
    String totalPrice = request.getParameter("totalPrice");
    String totalPriceValue;
    if (totalPrice.equals("all")) {
    } else {
    if (sqlHaving!=null && !sqlHaving.equals("")) { sqlHaving=sqlHaving+" and "; }
    if (totalPrice.equals("between")) {
      totalPriceValue = request.getParameter("totalPriceB1").trim();
      sqlHaving = sqlHaving + "sum(total_price) between "+totalPriceValue;
      totalPriceValue = request.getParameter("totalPriceB2").trim();
      sqlHaving = sqlHaving + " and "+totalPriceValue;
    } else {
    if (totalPrice.equals("equal"))  { sqlHaving = sqlHaving + "sum(total_price) = "; }
    else if (totalPrice.equals("more")) { sqlHaving = sqlHaving + "sum(total_price) >= "; }
    else if (totalPrice.equals("lower")) { sqlHaving = sqlHaving + "sum(total_price) <= "; }
      totalPriceValue = request.getParameter("totalPriceText").trim();
      sqlHaving = sqlHaving + totalPriceValue;
    }
    }
    try {
    System.out.println("before tmpSql = "+tmpSql);
    System.out.println("before sqlHaving = "+sqlHaving);
    if (tmpSql!=null && !tmpSql.equals("")) tmpSql = " where " +tmpSql;
    else tmpSql = "";
    if (sqlHaving != null && !sqlHaving.equals(""))
        tmpSql = tmpSql + " group by receipt_no,username,product_id having "+sqlHaving;
    System.out.println("######## tmpSql = "+tmpSql);
    Collection c = buyHome.findByCondition(tmpSql,longTime1,longTime2);
    session.putValue("buy",c);
    } catch (FinderException ex) {
      System.out.println("occur finderException");
    } catch (RemoteException ex) {
    }
    response.sendRedirect(response.encodeURL("/product/ViewBuy.jsp"));
  }
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
  }
  /**Clean up resources*/
  public void destroy() {
  }
  public Long getLongDate(String s) {
    int a = s.indexOf('/',0);
    int b = s.indexOf('/',a+1);
    int d = Integer.valueOf(s.substring(0,a)).intValue();
    int m = Integer.valueOf(s.substring(a+1,b)).intValue();
    int y = Integer.valueOf(s.substring(b+1)).intValue();
    long longDate = (new java.util.Date(y-1900,m-1,d)).getTime();
    return new Long(longDate);
  }
}