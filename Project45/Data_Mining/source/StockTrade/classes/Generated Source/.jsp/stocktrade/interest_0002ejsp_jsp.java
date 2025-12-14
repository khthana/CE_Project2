import java.sql.*;
import java.util.Vector;
import java.math.*;
import stocktrade.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class interest_0002ejsp_jsp extends HttpJspBase {


    static {
    }
    public interest_0002ejsp_jsp( ) {
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

            // HTML // begin [file="/interest.jsp";from=(0,0);to=(184,4)]
                out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n<html>\r\n<head>\r\n<title>Untitled Document</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\r\n<style type=\"text/css\">\r\n<!--\r\nA:link { text-decoration: none; color:#0088FF}\r\nA:active { text-decoration: none}\r\nA:visited { text-decoration: none; color:#0088FF }\r\nA:hover {text-decoration: none}\r\n-->\r\n</style>\r\n<style>\r\n.menulines{\r\nborder:1px solid #ffffff;\r\n}\r\n\r\n.menulines a{\r\ntext-decoration:none;\r\ncolor:#0088FF;\r\n}\r\n</style>\r\n\r\n<script language=\"JavaScript1.2\">\r\nfunction borderize(what,color){\r\nwhat.style.borderColor=color\r\n}\r\n\r\nfunction borderize_on(e){\r\nif (document.all)\r\nsource3=event.srcElement\r\nelse if (document.getElementById)\r\nsource3=e.target\r\nif (source3.className==\"menulines\"){\r\nborderize(source3,\"ffff3333\" )\r\n}\r\nelse{\r\nwhile(source3.tagName!=\"TABLE\"){\r\nsource3=document.getElementById? source3.parentNode : source3.parentElement\r\nif (source3.className==\"menulines\")\r\nborderize(source3,\"#ff3333\")\r\n}\r\n}\r\n}\r\n\r\nfunction borderize_off(e){\r\nif (document.all)\r\nsource4=event.srcElement\r\nelse if (document.getElementById)\r\nsource4=e.target\r\nif (source4.className==\"menulines\")\r\nborderize(source4,\"white\")\r\nelse{\r\nwhile(source4.tagName!=\"TABLE\"){\r\nsource4=document.getElementById? source4.parentNode : source4.parentElement\r\nif (source4.className==\"menulines\")\r\nborderize(source4,\"white\")\r\n}\r\n}\r\n}\r\nvar rate = 20; // Increase amount(The degree of the transmutation)\r\nvar obj; // The object which event occured in\r\nvar act = 0; // Flag during the action\r\nvar elmH = 0; // Hue\r\nvar elmS = 128; // Saturation\r\nvar elmV = 255; // Value\r\nvar clrOrg; // A color before the change\r\nvar TimerID; // Timer ID\r\nif (navigator.appName.indexOf(\"Microsoft\",0) != -1 && parseInt(navigator.appVersion) >= 4) {\r\nBrowser = true;\r\n} else {\r\nBrowser = false;\r\n}\r\nif (Browser) {\r\ndocument.onmouseover = doRainbowAnchor;\r\ndocument.onmouseout = stopRainbowAnchor;\r\n}\r\nfunction doRainbow()\r\n{\r\nif (Browser && act != 1) {\r\nact = 1;\r\nobj = event.srcElement;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\nfunction stopRainbow()\r\n{\r\nif (Browser && act != 0) {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\nfunction doRainbowAnchor()\r\n{\r\nif (Browser && act != 1) {\r\nobj = event.srcElement;\r\nwhile (obj.tagName != 'A' && obj.tagName != 'BODY') {\r\nobj = obj.parentElement;\r\nif (obj.tagName == 'A' || obj.tagName == 'BODY')\r\nbreak;\r\n}\r\nif (obj.tagName == 'A' && obj.href != '') {\r\nact = 1;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\n}\r\nfunction stopRainbowAnchor()\r\n{\r\nif (Browser && act != 0) {\r\nif (obj.tagName == 'A') {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\n}\r\nfunction ChangeColor()\r\n{\r\nobj.style.color = makeColor();\r\n}\r\nfunction makeColor()\r\n{\r\nif (elmS == 0) {\r\nelmR = elmV; elmG = elmV; elmB = elmV;\r\n}\r\nelse {\r\nt1 = elmV;\r\nt2 = (255 - elmS) * elmV / 255;\r\nt3 = elmH % 60;\r\nt3 = (t1 - t2) * t3 / 60;\r\nif (elmH < 60) {\r\nelmR = t1; elmB = t2; elmG = t2 + t3;\r\n}\r\nelse if (elmH < 120) {\r\nelmG = t1; elmB = t2; elmR = t1 - t3;\r\n}\r\nelse if (elmH < 180) {\r\nelmG = t1; elmR = t2; elmB = t2 + t3;\r\n}\r\nelse if (elmH < 240) {\r\nelmB = t1; elmR = t2; elmG = t1 - t3;\r\n}\r\nelse if (elmH < 300) {\r\nelmB = t1; elmG = t2; elmR = t2 + t3;\r\n}\r\nelse if (elmH < 360) {\r\nelmR = t1; elmG = t2; elmB = t1 - t3;\r\n}\r\nelse {\r\nelmR = 0; elmG = 0; elmB = 0;\r\n}\r\n}\r\nelmR = Math.floor(elmR);\r\nelmG = Math.floor(elmG);\r\nelmB = Math.floor(elmB);\r\nclrRGB = '#' + elmR.toString(16) + elmG.toString(16) + elmB.toString(16);\r\nelmH = elmH + rate;\r\nif (elmH >= 360)\r\nelmH = 0;\r\nreturn clrRGB;\r\n}\r\n</script>\r\n\r\n</head>\r\n\r\n<body>\r\n<table width=\"70%\" height=\"90\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n  <tr>\r\n    <td height=\"70\" colspan=\"5\"><img src=\"PIC/BarFinal.jpg\" width=\"700\" height=\"70\"></td>\r\n  </tr>\r\n  <tr bordercolor=\"#000000\" bgcolor=\"#CCCC99\" >\r\n    <td width=\"19%\" height=\"20\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_parent\"><font face=\"System\">HOME</font></a>\r\n      </div></td>\r\n    <td width=\"18%\"><div align=\"center\"><a href=\"Graphs.jsp\" target=\"_blank\">¡ÃÒ¿ÃÒ¤ÒËØé¹</a></div></td>\r\n    <td width=\"22%\"><div align=\"center\"><a href=\"Prediction.jsp\" target=\"_blank\">´Ù¼Å¡ÒÃ·Ó¹ÒÂ</a></div></td>\r\n    <td width=\"21%\"><div align=\"center\"><a href=\"Technical.htm\" target=\"_blank\">Í§¤ì¤ÇÒÁÃÙé</a></div></td>\r\n    <td width=\"20%\"><div align=\"center\"><a href=\"about.htm\" target=\"mainFrame\"><font face=\"System\">ABOUT\r\n        US</font></a></div></td>\r\n  </tr>\r\n    ");

            // end
            // HTML // begin [file="/interest.jsp";from=(184,37);to=(185,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/interest.jsp";from=(185,39);to=(186,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/interest.jsp";from=(186,34);to=(187,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/interest.jsp";from=(187,35);to=(188,0)]
                out.write("\r\n");

            // end
            // begin [file="/interest.jsp";from=(188,2);to=(211,0)]
                
                  Vector buy = new Vector();
                  Vector sell = new Vector();
                  int n =0;
                  try{
                    Vector ngee = new Vector();
                    stocktrade.QueryData qq = new stocktrade.QueryData();
                    qq.qconnect();
                    ngee = qq.getNgee();
                    for( int j=0;j<ngee.size();j++ ){
                      n = qq.getDD( ngee.elementAt(j).toString() );
                      if( n>1 ){
                        buy.addElement( new String( ngee.elementAt(j).toString() ) );
                      }
                      else if( n < 0 ){
                        sell.addElement( new String( ngee.elementAt(j).toString() ) );
                      }
                    }
                    qq.qclose();
                  }
                  catch( Exception e ){
                    System.out.println(e);
                  }
            // end
            // HTML // begin [file="/interest.jsp";from=(211,2);to=(220,2)]
                out.write("\r\n</table>\r\n<p><font color=\"#000066\"><strong>á¹Ð¹ÓËØé¹·Õè¹èÒàÅè¹:</strong></font></p>\r\n<table width=\"73%\" height=\"172\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n  <tr>\r\n    <td height=\"20\">\r\n<p><font color=\"#3366FF\"><strong>¤ÇÃ«×éÍ:</strong></font></p>\r\n      </td>\r\n  </tr>\r\n  ");

            // end
            // begin [file="/interest.jsp";from=(220,4);to=(225,0)]
                if( buy !=null ){
                  for( int m=0;m<buy.size();m++ ){
                    out.println("<tr><td>"+buy.elementAt(m).toString()+"</td></tr>");
                  }
                  }
            // end
            // HTML // begin [file="/interest.jsp";from=(225,2);to=(233,2)]
                out.write("\r\n<tr><td>&nbsp;</td></tr>\r\n</table>\r\n<br>\r\n<table width=\"73%\" height=\"172\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n  <tr>\r\n    <td height=\"20\"> <p><font color=\"#3366FF\"><strong>¤ÇÃ¢ÒÂ:</strong></font></p></td>\r\n  </tr>\r\n  ");

            // end
            // begin [file="/interest.jsp";from=(233,4);to=(238,0)]
                if( sell !=null ){
                  for( int l=0;l<sell.size();l++ ){
                    out.println("<tr><td>"+sell.elementAt(l).toString()+"</td></tr>");
                  }
                  }
            // end
            // HTML // begin [file="/interest.jsp";from=(238,2);to=(245,0)]
                out.write("\r\n<tr><td>&nbsp;</td></tr>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</body>\r\n</html>\r\n");

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
