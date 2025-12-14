package search;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.rmi.*;
import javax.rmi.*;
import javax.naming.*;
import product.*;
import personalcom.*;
import notebook.*;
import base.*;
import blueprint.*;

public class SearchProductServlet extends HttpServlet {
   ProductHome productHome;
   PersonalcomHome personalcomHome;
   NotebookHome notebookHome;
   BlueprintHome blueprintHome;
   String[][] categoryForm;

  /**Initialize global variables*/
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      Context ic = new InitialContext();
      java.lang.Object objref = ic.lookup("MyProduct");
      productHome = (ProductHome) PortableRemoteObject.narrow(objref,
                           ProductHome.class);
      objref =  ic.lookup("MyPersonalcom");
      personalcomHome = (PersonalcomHome) PortableRemoteObject.narrow(objref,
                           PersonalcomHome.class);
      objref =  ic.lookup("MyNotebook");
      notebookHome = (NotebookHome) PortableRemoteObject.narrow(objref,
                           NotebookHome.class);
      objref =  ic.lookup("MyBlueprint");
      blueprintHome = (BlueprintHome) PortableRemoteObject.narrow(objref,
                       BlueprintHome.class);
      System.out.println("obtained entity Home object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate entity Home");
      re.printStackTrace();
    }
  }
  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BaseAttribute baseAttribute = BaseAttribute.getBaseAttribute();
    categoryForm = baseAttribute.getCategoryForm();
    HttpSession session = request.getSession(true);
    String sqlWhere = null;
    sqlWhere = "";
//***** productId
    String productId = request.getParameter("productId");
    String productIdValue;
    if (productId!=null) {
    if (productId.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (productId.equals("between")) {
      productIdValue = request.getParameter("productIdB1");
      sqlWhere = sqlWhere + "product_id between '"+productIdValue.trim();
      productIdValue = request.getParameter("productIdB2");
      sqlWhere = sqlWhere + "' and '"+productIdValue.trim()+"'";
    } else {
    if (productId.equals("equal"))  { sqlWhere = sqlWhere + "product_id = '"; }
    else if (productId.equals("more")) { sqlWhere = sqlWhere + "product_id >= '"; }
    else if (productId.equals("lower")) { sqlWhere = sqlWhere + "product_id <= '"; }
      productIdValue = request.getParameter("productIdText");
      sqlWhere = sqlWhere + productIdValue.trim()+"'";
    }
    }
    }

//***** category
//    String category = (String)session.getValue("category");
    String category = request.getParameter("category");
    String tmpSql;
    if (category!=null) {
    if (category.equals("Anything")) {
      Enumeration e = request.getParameterNames();
      tmpSql=null;tmpSql="";
      while (e.hasMoreElements()) {
        String cat = (String)e.nextElement();
        if (cat.startsWith("category") && cat.length()!=8) {
          String catValue = request.getParameter(cat).trim();
          if (!catValue.equals("")) {
            if (!tmpSql.equals("")) {tmpSql = tmpSql+" , "; }
            tmpSql = tmpSql + "'"+catValue+"'";
          }
        }
      } tmpSql = "category in ("+tmpSql+")";
    } else {
      tmpSql = "category = '"+category+"'";
    }
    if (sqlWhere!=null && !sqlWhere.equals("")) {
        sqlWhere = sqlWhere+" and ";
    } sqlWhere = sqlWhere+tmpSql;
    }

//***** brand
    String brand = request.getParameter("brand");
    String brandValue;
    if (brand!=null) {
    if (brand.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (brand.equals("between")) {
      brandValue = request.getParameter("brandB1");
      sqlWhere = sqlWhere + "brand between '"+brandValue.trim();
      brandValue = request.getParameter("brandB2");
      sqlWhere = sqlWhere + "' and '"+brandValue.trim()+"'";
    } else {
    if (brand.equals("equal"))  { sqlWhere = sqlWhere + "brand = '"; }
    else if (brand.equals("more")) { sqlWhere = sqlWhere + "brand >= '"; }
    else if (brand.equals("lower")) { sqlWhere = sqlWhere + "brand <= '"; }
      brandValue = request.getParameter("brandText");
      sqlWhere = sqlWhere + brandValue.trim()+"'";
    }
    }
    }
// *********** quantity
    String quantity = request.getParameter("quantity");
    String quantityValue;
    if (quantity!=null) {
    if (quantity.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (quantity.equals("between")) {
      quantityValue = request.getParameter("quantityB1");
      sqlWhere = sqlWhere + "quantity between '"+quantityValue.trim();
      quantityValue = request.getParameter("quantityB2");
      sqlWhere = sqlWhere + "' and '"+quantityValue.trim()+"'";
    } else {
    if (quantity.equals("equal"))  { sqlWhere = sqlWhere + "quantity = '"; }
    else if (quantity.equals("more")) { sqlWhere = sqlWhere + "quantity >= '"; }
    else if (quantity.equals("lower")) { sqlWhere = sqlWhere + "quantity <= '"; }
      quantityValue = request.getParameter("quantityText");
      sqlWhere = sqlWhere + quantityValue.trim()+"'";
    }
    }
    }
//***** import price
    String importPrice = request.getParameter("importPrice");
    String importPriceValue;
    if (importPrice!=null) {
    if (importPrice.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (importPrice.equals("between")) {
      importPriceValue = request.getParameter("importPriceB1");
      sqlWhere = sqlWhere + "import_price between '"+importPriceValue.trim();
      importPriceValue = request.getParameter("importPriceB2");
      sqlWhere = sqlWhere + "' and '"+importPriceValue.trim()+"'";
    } else {
    if (importPrice.equals("equal"))  { sqlWhere = sqlWhere + "import_price = '"; }
    else if (importPrice.equals("more")) { sqlWhere = sqlWhere + "import_price >= '"; }
    else if (importPrice.equals("lower")) { sqlWhere = sqlWhere + "import_price <= '"; }
      importPriceValue = request.getParameter("importPriceText");
      sqlWhere = sqlWhere + importPriceValue.trim()+"'";
    }
    }
    }
//***** sell price
    String sellPrice = request.getParameter("sellPrice");
    String sellPriceValue;
    if (sellPrice!=null) {
    if (sellPrice.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (sellPrice.equals("between")) {
      sellPriceValue = request.getParameter("sellPriceB1");
      sqlWhere = sqlWhere + "sell_price between '"+sellPriceValue.trim();
      sellPriceValue = request.getParameter("sellPriceB2");
      sqlWhere = sqlWhere + "' and '"+sellPriceValue.trim()+"'";
    } else {
    if (sellPrice.equals("equal"))  { sqlWhere = sqlWhere + "sell_price = '"; }
    else if (sellPrice.equals("more")) { sqlWhere = sqlWhere + "sell_price >= '"; }
    else if (sellPrice.equals("lower")) { sqlWhere = sqlWhere + "sell_price <= '"; }
      sellPriceValue = request.getParameter("sellPriceText");
      sqlWhere = sqlWhere + sellPriceValue.trim()+"'";
    }
    }
    }
//***** low sell quantity
    String lowSellQuantity = request.getParameter("lowSellQuantity");
    String lowSellQuantityValue;
    if (lowSellQuantity!=null) {
    if (lowSellQuantity.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (lowSellQuantity.equals("between")) {
      lowSellQuantityValue = request.getParameter("lowSellQuantityB1");
      sqlWhere = sqlWhere + "low_sell_quantity between '"+lowSellQuantityValue.trim();
      lowSellQuantityValue = request.getParameter("lowSellQuantityB2");
      sqlWhere = sqlWhere + "' and '"+lowSellQuantityValue.trim()+"'";
    } else {
    if (lowSellQuantity.equals("equal"))  { sqlWhere = sqlWhere + "low_sell_quantity = '"; }
    else if (lowSellQuantity.equals("more")) { sqlWhere = sqlWhere + "low_sell_quantity >= '"; }
    else if (lowSellQuantity.equals("lower")) { sqlWhere = sqlWhere + "low_sell_quantity <= '"; }
      lowSellQuantityValue = request.getParameter("lowSellQuantityText");
      sqlWhere = sqlWhere + lowSellQuantityValue.trim()+"'";
    }
    }
    }
// *********** lastReceiveDate
    String lastReceiveDate = request.getParameter("lastReceiveDate");
    String lastReceiveDateValue;
    Long longTime1 = null;
    Long longTime2 = null;
    if (lastReceiveDate!=null) {
    if (lastReceiveDate.equals("all")) {
    } else {
    if (sqlWhere!=null && !sqlWhere.equals("")) { sqlWhere=sqlWhere+" and "; }
    if (lastReceiveDate.equals("between")) {
      lastReceiveDateValue = request.getParameter("lastReceiveDateB1");
      if (lastReceiveDateValue!=null)
          longTime1 = getLongDate(lastReceiveDateValue.trim());
      lastReceiveDateValue = request.getParameter("lastReceiveDateB2");
      if (lastReceiveDateValue!=null)
          longTime2 = getLongDate(lastReceiveDateValue.trim());
      sqlWhere = sqlWhere + "last_receive_date between ? and ?";
    } else {
    if (lastReceiveDate.equals("equal"))  { sqlWhere = sqlWhere + "last_receive_date = ?"; }
    else if (lastReceiveDate.equals("more")) { sqlWhere = sqlWhere + "last_receive_date >= ?"; }
    else if (lastReceiveDate.equals("lower")) { sqlWhere = sqlWhere + "last_receive_date <= ?"; }
      lastReceiveDateValue = request.getParameter("lastReceiveDateText");
      if (lastReceiveDateValue!=null)
          longTime1 = getLongDate(lastReceiveDateValue.trim());
    }
    }
    }
//***** sell now
    String sellNowValue = request.getParameter("sellNow");
    if (sellNowValue!=null && !sellNowValue.equals("") && !sellNowValue.equals("all")) {
      if (sqlWhere!=null && !sqlWhere.equals("")) {
          sqlWhere=sqlWhere+" and ";
      }
      sqlWhere = sqlWhere + "sell_now='"+sellNowValue.trim()+"'";
    }

    System.out.println(">>>>>>>>>>>>>Sql where : "+sqlWhere);
//***************************************************************
    int numberOfCategory = baseAttribute.getNumberOfCategory();
    Vector result[][] = new Vector[numberOfCategory][2];
    for (int b=0; b<numberOfCategory; b++) {
      result[b][0] = new Vector();
      result[b][1] = new Vector();
    }
    try {
    Collection c = productHome.findByCondition(sqlWhere,longTime1,longTime2);
    String form;
    if (!category.equals("Anything")) {
      form = findForm(category);
      Iterator it = c.iterator();
      Vector productIdFromProductTB = new Vector();
      while (it.hasNext()) {
        Product product = (Product)it.next();
        String idFromProduct = (String)product.getPrimaryKey();
        productIdFromProductTB.addElement(idFromProduct);
      }

      String[][] attributeRef = baseAttribute.getAttributeRef();
      tmpSql = "";
      for (int j=8; j<attributeRef.length; j++ ) {
        try {
          String x = request.getParameter(attributeRef[j][0]);
          String xValue;
          if (x!=null && !x.equals("")) {
            if (x.equals("all")) {
            } else {
            if (tmpSql!=null && !tmpSql.equals("")) { tmpSql=tmpSql+" and "; }
            if (x.equals("between")) {
              xValue = request.getParameter(attributeRef[j][0]+"B1");
              tmpSql = tmpSql +" "+attributeRef[j][1]+ " between '"+xValue.trim();
              xValue = request.getParameter(attributeRef[j][0]+"B2");
              tmpSql = tmpSql + "' and '"+xValue.trim()+"'";
            } else {
            if (x.equals("equal"))  {
              tmpSql = tmpSql + " " + attributeRef[j][1] + " = '";
            } else if (x.equals("more")) {
              tmpSql = tmpSql + " " + attributeRef[j][1] + " >= '";
            } else if (x.equals("lower")) {
              tmpSql = tmpSql + " " + attributeRef[j][1] + " <= '";
            }
            xValue = request.getParameter(attributeRef[j][0]+"Text");
            tmpSql = tmpSql + xValue.trim()+"'";
            }
            }
          }
        } catch (Exception ex) {System.out.println("no have "+attributeRef[j][0]);}
      }
      if (form==null) form = "";
      if (form.equals("1")) {
        System.out.println("tmpSql---per--->"+tmpSql);
        c = personalcomHome.findByConditionInGroup(tmpSql,productIdFromProductTB);
      }
      if (form.equals("2")) {
        System.out.println("tmpSql--n---->"+tmpSql);
        c = notebookHome.findByConditionInGroup(tmpSql,productIdFromProductTB);
      }
    }
    Blueprint blueprint;
    Vector categoryVector = baseAttribute.getCategory();
    Enumeration enum = categoryVector.elements();
    int b=0;
    while (enum.hasMoreElements()) {
      String st = (String) enum.nextElement();
      if (st!=null) { result[b][0].addElement(st); }
      b++;
    }

    Iterator i = c.iterator();
    String pk="";
    Notebook notebook;
    Personalcom personalcom;
    Product product;
    while (i.hasNext()) {
      if (category.equals("Anything")) {
        product = (Product)i.next();
        pk = (String)product.getPrimaryKey();
      } else {
        form = findForm(category);
        if (form.equals("1")) {
          personalcom = (Personalcom)i.next();
          pk = (String)personalcom.getPrimaryKey();
        } else {
        if (form.equals("2")) {
          notebook = (Notebook)i.next();
          pk = (String)notebook.getPrimaryKey();
        }
        }
      }
      System.out.println("create blueprint and productId="+productId);
      blueprint = blueprintHome.create(pk);
      System.out.println("create blueprint ok");
      String categoryTemp = blueprint.getCategory();
      boolean addVector = false;
      int lastIndexVector = 0;
      for (int a=0; a<result.length; a++) {
        String st = (String)result[a][0].elementAt(0);
        System.out.println("check category : "+st);
        if (st==null || st.equals("")) { lastIndexVector = a; break;}
        if (st.equals(categoryTemp)) {
          result[a][1].addElement(blueprint);
          addVector = true;
          break;
        }
      }
/*      if (!addVector) {
        result[lastIndexVector][0].addElement(category);
        result[lastIndexVector][1].addElement(blueprint);
      }
*/    }
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    session.putValue("result",result);
/*    request.setAttribute("result",result);
    getServletConfig().getServletContext().getRequestDispatcher
                  ("/ViewProduct.jsp").forward(request,response);
*/
    response.sendRedirect(response.encodeURL("/product/ViewProduct.jsp"));

  }
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
  }
  /**Clean up resources*/
  public String findForm(String category) {
    for (int i=0; i<categoryForm.length; i++) {
      if (categoryForm[i][0].equals(category)) return categoryForm[i][1];
    } return null;
  }
  public void destroy() {
  }
  public String dateToString(String s) {
    int a = s.indexOf('/',0);
    int b = s.indexOf('/',a+1);
    String month[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
    int m = Integer.valueOf(s.substring(a+1,b)).intValue();
    String date = s.substring(0,a)+"-"+month[m-1]+"-"+s.substring(b+1);
    return date;
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