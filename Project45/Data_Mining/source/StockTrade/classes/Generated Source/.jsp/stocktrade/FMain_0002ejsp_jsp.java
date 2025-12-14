import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class FMain_0002ejsp_jsp extends HttpJspBase {


    static {
    }
    public FMain_0002ejsp_jsp( ) {
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
            response.setContentType("text/html;charset=ISO-8859-1");
            pageContext = _jspxFactory.getPageContext(this, request, response,
            			"", true, 8192, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/FMain.jsp";from=(0,0);to=(85,0)]
                out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n<html>\r\n<head>\r\n<title>Untitled Document</title>\r\n<style>\r\n<!--\r\na:link { text-decoration: none; color:#999999}\r\na:visited {text-decoration: none; color:#999999}\r\na:hover{color:#6633FF}\r\n\r\n//-->\r\n</style>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\r\n</head>\r\n<body>\r\n<table width=\"64%\" height=\"587\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#00CCFF\">\r\n  <tr> \r\n    <td height=\"132\" colspan=\"2\"><p> \r\n        <applet\r\n    codebase = \"/stocktrade/.\"\r\n    code     = \"stocktrade.IntradayApplet.class\"\r\n    name     = \"TestApplet\"\r\n    width=435\r\n    height=240\r\n    align = \"middle\"\r\n>\r\n        </applet>\r\n      </p>\r\n      <p>&nbsp;</p></td>\r\n  </tr>\r\n  <tr>\r\n    <td height=\"33\" colspan=\"2\"><a href=\"interest.jsp\" target=\"_blank\">ËØé¹·Õè¤ÇÃ·Ó¡ÒÃ«×éÍ-¢ÒÂ»ÃÐ¨ÓÇÑ¹</a></td>\r\n  </tr>\r\n  <tr> \r\n    <td width=\"39%\" height=\"162\"><table width=\"78%\" height=\"252\" border=\"0\">\r\n        <tr> \r\n          <td height=\"22\" colspan=\"2\"><div align=\"left\"><font color=\"#33CCFF\"><img src=\"PIC/bar_news.gif\" width=\"230\" height=\"20\"></font></div></td>\r\n        </tr>\r\n        <tr> \r\n          <td width=\"8%\" height=\"34\"><img src=\"PIC/bullet_gray.gif\" width=\"14\" height=\"10\"></td>\r\n          <td width=\"92%\"> <font size=\"2\"><a href=\"news1.htm\">BIGC ÃÑºÊ§¤ÃÒÁ¡´ÂÍ´¢ÒÂ»Õ¹Õéâµá¤è10% \r\n            - 14/03/2003 </a></font></td>\r\n        </tr>\r\n        <tr> \r\n          <td height=\"22\"><img src=\"PIC/bullet_gray.gif\" width=\"14\" height=\"10\"></td>\r\n          <td> <font size=\"2\"><a href=\"news2.htm\">'¸¹ªÒµÔ'»ÃÑºâ¤Ã§ÊÃéÒ§áËÅè§·Ø¹ \r\n            ÍÍ¡ËØé¹¡Ùé5¾Ñ¹ÅéÒ¹-áºè§¢ÒÂ 2 ªØ´ - 14/03/2003 </a></font></td>\r\n        </tr>\r\n        <tr> \r\n          <td height=\"31\"><img src=\"PIC/bullet_gray.gif\" width=\"14\" height=\"10\"></td>\r\n          <td height=\"31\"><font size=\"2\"><a href=\"news3.htm\">ÊËÀÒ¾·Õ¾ÕäÍµÍ¡¡ÅÑºÍÕ¾ÕáÍÅ \r\n            ªÕéºÃÔËÒÃ§Ò¹µèÓ¡ÇèÒá¼¹¿×é¹¿ÙÍ×éÍ - 14/03/2003 </a></font></td>\r\n        </tr>\r\n        <tr> \r\n          <td height=\"26\"><img src=\"PIC/bullet_gray.gif\" width=\"14\" height=\"10\"></td>\r\n          <td height=\"26\"><font size=\"2\">POST»ÃÐ¡Ç´¡Í§·Ø¹´Õà´è¹ 2002 - 14/03/2003 \r\n            </font></td>\r\n        </tr>\r\n      </table></td>\r\n    <td width=\"61%\"><table width=\"78%\" height=\"260\" border=\"0\">\r\n        <tr> \r\n          <td height=\"22\" colspan=\"2\"><div align=\"left\"><img src=\"PIC/bar_analysis.gif\" width=\"226\" height=\"20\"></div></td>\r\n        </tr>\r\n        <tr> \r\n          <td width=\"8%\" height=\"34\"><img src=\"PIC/bullet_green.gif\" width=\"14\" height=\"10\"></td>\r\n          <td width=\"92%\"> <font size=\"2\">º·ÇÔà¤ÃÒÐËìÀÒÇÐµÅÒ´ â´Â DBSV - 14/03/2003 \r\n            </font></td>\r\n        </tr>\r\n        <tr> \r\n          <td height=\"22\"><img src=\"PIC/bullet_green.gif\" width=\"14\" height=\"10\"></td>\r\n          <td> <font size=\"2\">Market Analysis : DBSV - 14/03/2003 </font></td>\r\n        </tr>\r\n        <tr> \r\n          <td height=\"31\"><img src=\"PIC/bullet_green.gif\" width=\"14\" height=\"10\"></td>\r\n          <td height=\"31\">&nbsp;</td>\r\n        </tr>\r\n        <tr> \r\n          <td height=\"37\"><img src=\"PIC/bullet_green.gif\" width=\"14\" height=\"10\"></td>\r\n          <td height=\"37\">&nbsp;</td>\r\n        </tr>\r\n      </table></td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>\r\n");

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
