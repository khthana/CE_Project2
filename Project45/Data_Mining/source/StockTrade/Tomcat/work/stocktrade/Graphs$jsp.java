package org.apache.jsp;

import java.sql.*;
import java.util.Vector;
import java.math.*;
import stocktrade.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class Graphs$jsp extends HttpJspBase {


    static {
    }
    public Graphs$jsp( ) {
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

            // HTML // begin [file="/Graphs.jsp";from=(0,0);to=(158,0)]
                out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n<html>\r\n<head>\r\n<title>Untitled Document</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\r\n<style type=\"text/css\">\r\n<!--\r\nA:link { text-decoration: none; color:#0088FF}\r\nA:active { text-decoration: none}\r\nA:visited { text-decoration: none; color:#0088FF }\r\nA:hover {text-decoration: none}\r\n-->\r\n</style>\r\n<script language=\"JavaScript1.2\">\r\nfunction borderize(what,color){\r\nwhat.style.borderColor=color\r\n}\r\n\r\nfunction borderize_on(e){\r\nif (document.all)\r\nsource3=event.srcElement\r\nelse if (document.getElementById)\r\nsource3=e.target\r\nif (source3.className==\"menulines\"){\r\nborderize(source3,\"ffff3333\" )\r\n}\r\nelse{\r\nwhile(source3.tagName!=\"TABLE\"){\r\nsource3=document.getElementById? source3.parentNode : source3.parentElement\r\nif (source3.className==\"menulines\")\r\nborderize(source3,\"#ff3333\")\r\n}\r\n}\r\n}\r\n\r\nfunction borderize_off(e){\r\nif (document.all)\r\nsource4=event.srcElement\r\nelse if (document.getElementById)\r\nsource4=e.target\r\nif (source4.className==\"menulines\")\r\nborderize(source4,\"white\")\r\nelse{\r\nwhile(source4.tagName!=\"TABLE\"){\r\nsource4=document.getElementById? source4.parentNode : source4.parentElement\r\nif (source4.className==\"menulines\")\r\nborderize(source4,\"white\")\r\n}\r\n}\r\n}\r\nvar rate = 20; // Increase amount(The degree of the transmutation)\r\nvar obj; // The object which event occured in\r\nvar act = 0; // Flag during the action\r\nvar elmH = 0; // Hue\r\nvar elmS = 128; // Saturation\r\nvar elmV = 255; // Value\r\nvar clrOrg; // A color before the change\r\nvar TimerID; // Timer ID\r\nif (navigator.appName.indexOf(\"Microsoft\",0) != -1 && parseInt(navigator.appVersion) >= 4) {\r\nBrowser = true;\r\n} else {\r\nBrowser = false;\r\n}\r\nif (Browser) {\r\ndocument.onmouseover = doRainbowAnchor;\r\ndocument.onmouseout = stopRainbowAnchor;\r\n}\r\nfunction doRainbow()\r\n{\r\nif (Browser && act != 1) {\r\nact = 1;\r\nobj = event.srcElement;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\nfunction stopRainbow()\r\n{\r\nif (Browser && act != 0) {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\nfunction doRainbowAnchor()\r\n{\r\nif (Browser && act != 1) {\r\nobj = event.srcElement;\r\nwhile (obj.tagName != 'A' && obj.tagName != 'BODY') {\r\nobj = obj.parentElement;\r\nif (obj.tagName == 'A' || obj.tagName == 'BODY')\r\nbreak;\r\n}\r\nif (obj.tagName == 'A' && obj.href != '') {\r\nact = 1;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\n}\r\nfunction stopRainbowAnchor()\r\n{\r\nif (Browser && act != 0) {\r\nif (obj.tagName == 'A') {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\n}\r\nfunction ChangeColor()\r\n{\r\nobj.style.color = makeColor();\r\n}\r\nfunction makeColor()\r\n{\r\nif (elmS == 0) {\r\nelmR = elmV; elmG = elmV; elmB = elmV;\r\n}\r\nelse {\r\nt1 = elmV;\r\nt2 = (255 - elmS) * elmV / 255;\r\nt3 = elmH % 60;\r\nt3 = (t1 - t2) * t3 / 60;\r\nif (elmH < 60) {\r\nelmR = t1; elmB = t2; elmG = t2 + t3;\r\n}\r\nelse if (elmH < 120) {\r\nelmG = t1; elmB = t2; elmR = t1 - t3;\r\n}\r\nelse if (elmH < 180) {\r\nelmG = t1; elmR = t2; elmB = t2 + t3;\r\n}\r\nelse if (elmH < 240) {\r\nelmB = t1; elmR = t2; elmG = t1 - t3;\r\n}\r\nelse if (elmH < 300) {\r\nelmB = t1; elmG = t2; elmR = t2 + t3;\r\n}\r\nelse if (elmH < 360) {\r\nelmR = t1; elmG = t2; elmB = t1 - t3;\r\n}\r\nelse {\r\nelmR = 0; elmG = 0; elmB = 0;\r\n}\r\n}\r\nelmR = Math.floor(elmR);\r\nelmG = Math.floor(elmG);\r\nelmB = Math.floor(elmB);\r\nclrRGB = '#' + elmR.toString(16) + elmG.toString(16) + elmB.toString(16);\r\nelmH = elmH + rate;\r\nif (elmH >= 360)\r\nelmH = 0;\r\nreturn clrRGB;\r\n}\r\n</script>\r\n</head>\r\n<body>\r\n");

            // end
            // HTML // begin [file="/Graphs.jsp";from=(158,33);to=(159,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/Graphs.jsp";from=(159,39);to=(160,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/Graphs.jsp";from=(160,34);to=(161,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/Graphs.jsp";from=(161,35);to=(216,20)]
                out.write("\r\n\t<table width=\"70%\" height=\"90\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n          <td height=\"70\" colspan=\"5\"><img src=\"PIC/BarFinal.jpg\" width=\"700\" height=\"70\"></td>\r\n        </tr>\r\n        <tr bordercolor=\"#000000\" bgcolor=\"#CCCC99\" >\r\n          <td width=\"19%\" height=\"20\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_blank\"><font face=\"System\">HOME</font></a>\r\n      </div></td>\r\n          <td width=\"18%\"><div align=\"center\"><a href=\"Graphs.jsp\" target=\"_parent\">¡ÃÒ¿ÃÒ¤ÒËØé¹</a></div></td>\r\n          <td width=\"22%\"><div align=\"center\"><a href=\"Prediction.jsp\" target=\"_blank\">´Ù¼Å¡ÒÃ·Ó¹ÒÂ</a></div></td>\r\n          <td width=\"21%\"><div align=\"center\"><a href=\"Technical.htm\" target=\"_blank\">Í§¤ì¤ÇÒÁÃÙé</a></div></td>\r\n          <td width=\"20%\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_self\"><font face=\"System\">ABOUT\r\n        US</font></a></div></td>\r\n        </tr>\r\n      </table>\r\n<form name=\"SelectGraph\" action=\"Graphs.jsp\" method=\"get\">\r\n  <table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tr>\r\n  <td valign=\"top\" align=\"center\">\r\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n      <tr>\r\n        <td><font color=\"#999933\" face=\"Courier New, Courier, mono\"><strong>´Ù¡ÃÒ¿ÃÒ¤ÒËØé¹</strong></font></td>\r\n      </tr>\r\n      <tr>\r\n        <td bgcolor=\"#ADCBF7\"    height=\"1\" ></td>\r\n      </tr>\r\n      <tr>\r\n        <td bgcolor = \"#FFFFFF\"height=\"1\" ></td>\r\n      </tr>\r\n      <tr>\r\n        <td bgcolor=\"#ADCBF7\"  height=\"1\"></td>\r\n      </tr>\r\n    </table>\r\n        <table width=\"100%\" height=\"387\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tr>\r\n            <td width=\"30%\" height=\"80\" valign=\"top\">\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tr>\r\n                  <td height=\"28\"><font color=\"#3366FF\">Stock Symbol</font></td>\r\n                  <td height=\"28\"><input name=\"type\" type=\"text\" id=\"type\" value=\"s\" size=\"15\"></td>\r\n                  <td>&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                  <td width=\"43%\" height=\"28\"><font color=\"#3366FF\">Enter Stock</font></td>\r\n                  <td width=\"47%\" height=\"28\"> <div align=\"left\">\r\n                      <input name=\"stock\" type=\"text\" id=\"stock\" size=\"15\">\r\n                    </div></td>\r\n                  <td width=\"10%\"> <div align=\"center\">\r\n                      <input name=\"go\" type=\"image\" src=\"PIC/go2.gif\" width=\"21\" height=\"17\" border=\"0\">\r\n                    </div></td>\r\n                </tr>\r\n              </table></td>\r\n            <td width=\"70%\" rowspan=\"3\" valign=\"top\"> <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tr>\r\n                  <td>\r\n                    ");

            // end
            // begin [file="/Graphs.jsp";from=(216,22);to=(226,0)]
                 String type = "s";
                                String stock = "SCB";
                                try{
                                  type = request.getParameter("type");
                                  stock = request.getParameter("stock");
                                }
                                catch( Exception nn ){
                                  type = "s";
                                  stock = "ASL";
                                }
            // end
            // HTML // begin [file="/Graphs.jsp";from=(226,2);to=(235,22)]
                out.write("\r\n                    <applet\r\n          \t\tcodebase = \"/stocktrade/.\"\r\n                code = \"stocktrade.IntradayApplet.class\"\r\n                name = \"TestApplet\"\r\n                width=435\r\n                height=240\r\n                align = \"middle\"\r\n                 >\r\n                      ");

            // end
            // begin [file="/Graphs.jsp";from=(235,24);to=(235,82)]
                out.println("<param name=\"type\"  value=\""+type+"\" >");
            // end
            // HTML // begin [file="/Graphs.jsp";from=(235,84);to=(236,22)]
                out.write("\r\n                      ");

            // end
            // begin [file="/Graphs.jsp";from=(236,24);to=(236,83)]
                out.println("<param name=\"stock\" value=\""+stock+"\" >");
            // end
            // HTML // begin [file="/Graphs.jsp";from=(236,85);to=(241,20)]
                out.write("\r\n                    </applet> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"100\">\r\n                    ");

            // end
            // begin [file="/Graphs.jsp";from=(241,22);to=(260,15)]
                
                                 try{
                                 stocktrade.QueryData qqq = new stocktrade.QueryData();
                                 int i=0;
                                 i = qqq.getPred(stock);
                
                                 if( i==1 ){
                                   out.print("ÃÒ¤Ò»Ô´¹èÒ¨Ð»ÃÑºµÑÇÊÙ§¢Öé¹");
                                 }
                                 else if( i==-1 ){
                                   out.print("ÃÒ¤Ò»Ô´¹èÒ¨Ð»ÃÑºµÑÇÅ´Å§");
                                 }
                                 else if( i==0 ){
                                   out.print("ÃÒ¤Ò»Ô´¹èÒ¨ÐÂÑ§·Ã§µÑÇ");
                                 }
                                }
                                catch( Exception e ){
                                  System.out.print( e );
                                }
                               
            // end
            // HTML // begin [file="/Graphs.jsp";from=(260,17);to=(266,55)]
                out.write("\r\n                  </td>\r\n                </tr>\r\n              </table></td>\r\n          </tr>\r\n          <tr>\r\n            <td height=\"29\"><font color=\"#3366FF\">ËØé¹ ");

            // end
            // begin [file="/Graphs.jsp";from=(266,57);to=(266,74)]
                out.print(stock);
            // end
            // HTML // begin [file="/Graphs.jsp";from=(266,76);to=(276,0)]
                out.write("</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td height=\"125\">&nbsp;</td>\r\n          </tr>\r\n        </table>\r\n</table>\r\n    </form>\r\n    <p align=\"center\">&nbsp;</p></body>\r\n</html>\r\n");

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
