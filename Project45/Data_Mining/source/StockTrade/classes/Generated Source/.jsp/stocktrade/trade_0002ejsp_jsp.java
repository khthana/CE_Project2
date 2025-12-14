import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class trade_0002ejsp_jsp extends HttpJspBase {

    // begin [file="/trade.jsp";from=(7,0);to=(7,77)]
    // end

    static {
    }
    public trade_0002ejsp_jsp( ) {
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

            // HTML // begin [file="/trade.jsp";from=(0,50);to=(7,0)]
                out.write("\r\n<html>\r\n<head>\r\n<title>\r\ntrade\r\n</title>\r\n</head>\r\n");

            // end
            // begin [file="/trade.jsp";from=(7,0);to=(7,77)]
                stocktrade.tradeBean tradeBeanId = null;
                boolean _jspx_specialtradeBeanId  = false;
                 synchronized (session) {
                    tradeBeanId= (stocktrade.tradeBean)
                    pageContext.getAttribute("tradeBeanId",PageContext.SESSION_SCOPE);
                    if ( tradeBeanId == null ) {
                        _jspx_specialtradeBeanId = true;
                        try {
                            tradeBeanId = (stocktrade.tradeBean) java.beans.Beans.instantiate(this.getClass().getClassLoader(), "stocktrade.tradeBean");
                        } catch (ClassNotFoundException exc) {
                             throw new InstantiationException(exc.getMessage());
                        } catch (Exception exc) {
                             throw new ServletException (" Cannot create bean of class "+"stocktrade.tradeBean", exc);
                        }
                        pageContext.setAttribute("tradeBeanId", tradeBeanId, PageContext.SESSION_SCOPE);
                    }
                 } 
                if(_jspx_specialtradeBeanId == true) {
            // end
            // begin [file="/trade.jsp";from=(7,0);to=(7,77)]
                }
            // end
            // HTML // begin [file="/trade.jsp";from=(7,77);to=(8,0)]
                out.write("\r\n");

            // end
            // begin [file="/trade.jsp";from=(8,0);to=(8,51)]
                JspRuntimeLibrary.introspect(pageContext.findAttribute("tradeBeanId"), request);
            // end
            // HTML // begin [file="/trade.jsp";from=(8,51);to=(20,27)]
                out.write("\r\n<body>\r\n<h1>\r\nJBuilder Generated JSP\r\n</h1>\r\n<form  action=\"StockChart.jsp\" method=\"post\">\r\n<br>Enter new Stock   :  <input name=\"type\"><br>\r\n<br>Enter new Stock   :  <input name=\"stock\"><br>\r\n<br><br>\r\n<input type=\"submit\" name=\"Submit\" value=\"Submit\">\r\n<input type=\"reset\" value=\"Reset\">\r\n<br>\r\nValue of Bean property is :");

            // end
            // begin [file="/trade.jsp";from=(20,27);to=(20,83)]
                out.print(JspRuntimeLibrary.toString((((stocktrade.tradeBean)pageContext.findAttribute("tradeBeanId")).getSample())));
            // end
            // HTML // begin [file="/trade.jsp";from=(20,83);to=(34,0)]
                out.write("\r\n</form>\r\n<applet\r\n    codebase = \"/stocktrade/.\"\r\n    code     = \"stocktrade.IntradayApplet.class\"\r\n    name     = \"TestApplet\"\r\n    width=435\r\n    height=240\r\n    align = \"middle\"\r\n>\r\n</applet>\r\n<br><br>\r\n</body>\r\n</html>\r\n");

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
