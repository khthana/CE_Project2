package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class StockChart$jsp extends HttpJspBase {

    // begin [file="/StockChart.jsp";from=(7,0);to=(7,87)]
    // end

    static {
    }
    public StockChart$jsp( ) {
    }

    private static boolean _jspx_inited = false;

    public final void _jspx_init() throws org.apache.jasper.runtime.JspException {
    }

    public void _jspService(HttpServletRequest request, HttpServletResponse  response)
        throws java.io.IOException, ServletException {

        JspFactory _jspxFactory = null;
        PageContext pageContext = null;
        HttpSession session = null;
        ServletContext application = null;
        ServletConfig config = null;
        JspWriter out = null;
        Object page = this;
        String  _value = null;
        try {

            if (_jspx_inited == false) {
                synchronized (this) {
                    if (_jspx_inited == false) {
                        _jspx_init();
                        _jspx_inited = true;
                    }
                }
            }
            _jspxFactory = JspFactory.getDefaultFactory();
            response.setContentType("text/html; charset=MS874");
            pageContext = _jspxFactory.getPageContext(this, request, response,
            			"", true, 8192, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/StockChart.jsp";from=(0,50);to=(7,0)]
                out.write("\r\n<html>\r\n<head>\r\n<title>\r\nStockChart\r\n</title>\r\n</head>\r\n");

            // end
            // begin [file="/StockChart.jsp";from=(7,0);to=(7,87)]
                stocktrade.StockChartBean StockChartBeanId = null;
                boolean _jspx_specialStockChartBeanId  = false;
                 synchronized (session) {
                    StockChartBeanId= (stocktrade.StockChartBean)
                    pageContext.getAttribute("StockChartBeanId",PageContext.SESSION_SCOPE);
                    if ( StockChartBeanId == null ) {
                        _jspx_specialStockChartBeanId = true;
                        try {
                            StockChartBeanId = (stocktrade.StockChartBean) java.beans.Beans.instantiate(this.getClass().getClassLoader(), "stocktrade.StockChartBean");
                        } catch (ClassNotFoundException exc) {
                             throw new InstantiationException(exc.getMessage());
                        } catch (Exception exc) {
                             throw new ServletException (" Cannot create bean of class "+"stocktrade.StockChartBean", exc);
                        }
                        pageContext.setAttribute("StockChartBeanId", StockChartBeanId, PageContext.SESSION_SCOPE);
                    }
                 } 
                if(_jspx_specialStockChartBeanId == true) {
            // end
            // begin [file="/StockChart.jsp";from=(7,0);to=(7,87)]
                }
            // end
            // HTML // begin [file="/StockChart.jsp";from=(7,87);to=(8,0)]
                out.write("\r\n");

            // end
            // begin [file="/StockChart.jsp";from=(8,0);to=(8,56)]
                JspRuntimeLibrary.introspect(pageContext.findAttribute("StockChartBeanId"), request);
            // end
            // HTML // begin [file="/StockChart.jsp";from=(8,56);to=(13,0)]
                out.write("\r\n<body>\r\n<h1>\r\nJBuilder Generated JSP\r\n</h1>\r\n");

            // end
            // begin [file="/StockChart.jsp";from=(13,2);to=(23,0)]
                 String type = "s";
                   String stock = "SCB";
                  try{
                    type = request.getParameter("type");
                    stock = request.getParameter("stock");
                    out.print( type );out.println( stock );
                   }
                   catch( Exception nn ){
                     out.println( nn );
                   }
            // end
            // HTML // begin [file="/StockChart.jsp";from=(23,2);to=(33,0)]
                out.write("\r\n<div align = \"middle\">\r\n<applet\r\n    codebase = \"/stocktrade/.\"\r\n    code     = \"stocktrade.IntradayApplet.class\"\r\n    name     = \"TestApplet\"\r\n    width=435\r\n    height=240\r\n    align = \"middle\"\r\n>\r\n");

            // end
            // begin [file="/StockChart.jsp";from=(33,2);to=(33,60)]
                out.println("<param name=\"type\"  value=\""+type+"\" >");
            // end
            // HTML // begin [file="/StockChart.jsp";from=(33,62);to=(34,0)]
                out.write("\r\n");

            // end
            // begin [file="/StockChart.jsp";from=(34,2);to=(34,61)]
                out.println("<param name=\"stock\" value=\""+stock+"\" >");
            // end
            // HTML // begin [file="/StockChart.jsp";from=(34,63);to=(39,0)]
                out.write("\r\n</applet>\r\n</div>\r\n</body>\r\n</html>\r\n");

            // end

        } catch (Throwable t) {
            if (out != null && out.getBufferSize() != 0)
                out.clearBuffer();
            if (pageContext != null) pageContext.handlePageException(t);
        } finally {
            if (_jspxFactory != null) _jspxFactory.releasePageContext(pageContext);
        }
    }
}
