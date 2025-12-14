package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class LFrame$jsp extends HttpJspBase {


    static {
    }
    public LFrame$jsp( ) {
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

            // HTML // begin [file="/LFrame.jsp";from=(0,0);to=(154,0)]
                out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n<html>\r\n<head>\r\n<title>Untitled Document</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\r\n<style>\r\n<!--\r\na{text-decoration:none}\r\n//-->\r\n</style>\r\n<SCRIPT language=JavaScript>\r\nvar rate = 20; // Increase amount(The degree of the transmutation)\r\nvar obj; // The object which event occured in\r\nvar act = 0; // Flag during the action\r\nvar elmH = 0; // Hue\r\nvar elmS = 128; // Saturation\r\nvar elmV = 255; // Value\r\nvar clrOrg; // A color before the change\r\nvar TimerID; // Timer ID\r\nif (navigator.appName.indexOf(\"Microsoft\",0) != -1 && parseInt(navigator.appVersion) >= 4) {\r\nBrowser = true;\r\n} else {\r\nBrowser = false;\r\n}\r\nif (Browser) {\r\ndocument.onmouseover = doRainbowAnchor;\r\ndocument.onmouseout = stopRainbowAnchor;\r\n}\r\nfunction doRainbow()\r\n{\r\nif (Browser && act != 1) {\r\nact = 1;\r\nobj = event.srcElement;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\nfunction stopRainbow()\r\n{\r\nif (Browser && act != 0) {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\nfunction doRainbowAnchor()\r\n{\r\nif (Browser && act != 1) {\r\nobj = event.srcElement;\r\nwhile (obj.tagName != 'A' && obj.tagName != 'BODY') {\r\nobj = obj.parentElement;\r\nif (obj.tagName == 'A' || obj.tagName == 'BODY')\r\nbreak;\r\n}\r\nif (obj.tagName == 'A' && obj.href != '') {\r\nact = 1;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\n}\r\nfunction stopRainbowAnchor()\r\n{\r\nif (Browser && act != 0) {\r\nif (obj.tagName == 'A') {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\n}\r\nfunction ChangeColor()\r\n{\r\nobj.style.color = makeColor();\r\n}\r\nfunction makeColor()\r\n{\r\nif (elmS == 0) {\r\nelmR = elmV; elmG = elmV; elmB = elmV;\r\n}\r\nelse {\r\nt1 = elmV;\r\nt2 = (255 - elmS) * elmV / 255;\r\nt3 = elmH % 60;\r\nt3 = (t1 - t2) * t3 / 60;\r\nif (elmH < 60) {\r\nelmR = t1; elmB = t2; elmG = t2 + t3;\r\n}\r\nelse if (elmH < 120) {\r\nelmG = t1; elmB = t2; elmR = t1 - t3;\r\n}\r\nelse if (elmH < 180) {\r\nelmG = t1; elmR = t2; elmB = t2 + t3;\r\n}\r\nelse if (elmH < 240) {\r\nelmB = t1; elmR = t2; elmG = t1 - t3;\r\n}\r\nelse if (elmH < 300) {\r\nelmB = t1; elmG = t2; elmR = t2 + t3;\r\n}\r\nelse if (elmH < 360) {\r\nelmR = t1; elmG = t2; elmB = t1 - t3;\r\n}\r\nelse {\r\nelmR = 0; elmG = 0; elmB = 0;\r\n}\r\n}\r\nelmR = Math.floor(elmR);\r\nelmG = Math.floor(elmG);\r\nelmB = Math.floor(elmB);\r\nclrRGB = '#' + elmR.toString(16) + elmG.toString(16) + elmB.toString(16);\r\nelmH = elmH + rate;\r\nif (elmH >= 360)\r\nelmH = 0;\r\nreturn clrRGB;\r\n}\r\n</SCRIPT>  \r\n\r\n</head>\r\n\r\n<body>\r\n<table width=\"158\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#FFFFFF\" align=\"center\" bordercolor=\"#4279DE\" >\r\n  <form name=\"loginForm\" method=\"post\" action=\"http://161.246.6.39:8080/class/CheckLogin.jsp\" target=\"mainFrame\" onSubmit=\"return validateField();\">\r\n    <input type=\"hidden\" name=\"txtSecureKey\" value=\"NONE\">\r\n    <tr> \r\n      <td colspan=\"4\" height=\"42\"><img src=\"PIC/login.gif\" alt=\"Enter\" width=\"162\" height=\"35\"></td>\r\n    </tr>\r\n    <tr> \r\n      <td width=\"73\"><img src=\"PIC/username.gif\" width=\"64\" height=\"13\"></td>\r\n      <td colspan=\"3\"> <input type=\"text\" name=\"txtLogin\" size=\"11\" class=\"\"> \r\n      </td>\r\n    </tr>\r\n    <tr> \r\n      <td width=\"73\"><img src=\"PIC/password.gif\" width=\"60\" height=\"13\"></td>\r\n      <td colspan=\"3\"> <input type=\"password\" name=\"txtPassword\" size=\"11\" class=\"\"> \r\n      </td>\r\n    </tr>\r\n    <tr> \r\n      <td width=\"73\">&nbsp;</td>\r\n      <td width=\"41\">&nbsp;</td>\r\n      <td width=\"26\">&nbsp;</td>\r\n      <td width=\"22\"><input name=\"imageGO\" type=\"image\" src=\"PIC/go2.gif\" alt=\"Login\" width=\"21\" height=\"17\" border=\"0\"></td>\r\n    </tr>\r\n  </form>\r\n</table>\r\n<table width=\"160\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n  <tr > \r\n    <td width=\"23\"><img src=\"PIC/bullet_green.gif\" width=\"14\" height=\"10\"></td>\r\n    <td width=\"96\"><font size=\"2\" color=\"#737373\"><a href=\"Registration.jsp\" target=\"mainFrame\">ÊÁÑ¤ÃÊÁÒªÔ¡</a></font></td>\r\n    <td width=\"38\"></td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>\r\n");

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
