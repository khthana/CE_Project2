import java.sql.*;
import java.util.Vector;
import java.math.*;
import stocktrade.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.runtime.*;


public class Prediction_0002ejsp_jsp extends HttpJspBase {


    static {
    }
    public Prediction_0002ejsp_jsp( ) {
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

            // HTML // begin [file="/Prediction.jsp";from=(0,0);to=(170,0)]
                out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n<html>\r\n<head>\r\n<title>Untitled Document</title>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\r\n<style type=\"text/css\">\r\n<!--\r\nA:link { text-decoration: none; color:#0088FF}\r\nA:active { text-decoration: none}\r\nA:visited { text-decoration: none; color:#0088FF }\r\nA:hover {text-decoration: none}\r\n-->\r\n</style>\r\n<style>\r\n.menulines{\r\nborder:1px solid #ffffff;\r\n}\r\n\r\n.menulines a{\r\ntext-decoration:none;\r\ncolor:#0088FF;\r\n}\r\n</style>\r\n\r\n<script language=\"JavaScript1.2\">\r\nfunction borderize(what,color){\r\nwhat.style.borderColor=color\r\n}\r\n\r\nfunction borderize_on(e){\r\nif (document.all)\r\nsource3=event.srcElement\r\nelse if (document.getElementById)\r\nsource3=e.target\r\nif (source3.className==\"menulines\"){\r\nborderize(source3,\"ffff3333\" )\r\n}\r\nelse{\r\nwhile(source3.tagName!=\"TABLE\"){\r\nsource3=document.getElementById? source3.parentNode : source3.parentElement\r\nif (source3.className==\"menulines\")\r\nborderize(source3,\"#ff3333\")\r\n}\r\n}\r\n}\r\n\r\nfunction borderize_off(e){\r\nif (document.all)\r\nsource4=event.srcElement\r\nelse if (document.getElementById)\r\nsource4=e.target\r\nif (source4.className==\"menulines\")\r\nborderize(source4,\"white\")\r\nelse{\r\nwhile(source4.tagName!=\"TABLE\"){\r\nsource4=document.getElementById? source4.parentNode : source4.parentElement\r\nif (source4.className==\"menulines\")\r\nborderize(source4,\"white\")\r\n}\r\n}\r\n}\r\nvar rate = 20; // Increase amount(The degree of the transmutation)\r\nvar obj; // The object which event occured in\r\nvar act = 0; // Flag during the action\r\nvar elmH = 0; // Hue\r\nvar elmS = 128; // Saturation\r\nvar elmV = 255; // Value\r\nvar clrOrg; // A color before the change\r\nvar TimerID; // Timer ID\r\nif (navigator.appName.indexOf(\"Microsoft\",0) != -1 && parseInt(navigator.appVersion) >= 4) {\r\nBrowser = true;\r\n} else {\r\nBrowser = false;\r\n}\r\nif (Browser) {\r\ndocument.onmouseover = doRainbowAnchor;\r\ndocument.onmouseout = stopRainbowAnchor;\r\n}\r\nfunction doRainbow()\r\n{\r\nif (Browser && act != 1) {\r\nact = 1;\r\nobj = event.srcElement;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\nfunction stopRainbow()\r\n{\r\nif (Browser && act != 0) {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\nfunction doRainbowAnchor()\r\n{\r\nif (Browser && act != 1) {\r\nobj = event.srcElement;\r\nwhile (obj.tagName != 'A' && obj.tagName != 'BODY') {\r\nobj = obj.parentElement;\r\nif (obj.tagName == 'A' || obj.tagName == 'BODY')\r\nbreak;\r\n}\r\nif (obj.tagName == 'A' && obj.href != '') {\r\nact = 1;\r\nclrOrg = obj.style.color;\r\nTimerID = setInterval(\"ChangeColor()\",100);\r\n}\r\n}\r\n}\r\nfunction stopRainbowAnchor()\r\n{\r\nif (Browser && act != 0) {\r\nif (obj.tagName == 'A') {\r\nobj.style.color = clrOrg;\r\nclearInterval(TimerID);\r\nact = 0;\r\n}\r\n}\r\n}\r\nfunction ChangeColor()\r\n{\r\nobj.style.color = makeColor();\r\n}\r\nfunction makeColor()\r\n{\r\nif (elmS == 0) {\r\nelmR = elmV; elmG = elmV; elmB = elmV;\r\n}\r\nelse {\r\nt1 = elmV;\r\nt2 = (255 - elmS) * elmV / 255;\r\nt3 = elmH % 60;\r\nt3 = (t1 - t2) * t3 / 60;\r\nif (elmH < 60) {\r\nelmR = t1; elmB = t2; elmG = t2 + t3;\r\n}\r\nelse if (elmH < 120) {\r\nelmG = t1; elmB = t2; elmR = t1 - t3;\r\n}\r\nelse if (elmH < 180) {\r\nelmG = t1; elmR = t2; elmB = t2 + t3;\r\n}\r\nelse if (elmH < 240) {\r\nelmB = t1; elmR = t2; elmG = t1 - t3;\r\n}\r\nelse if (elmH < 300) {\r\nelmB = t1; elmG = t2; elmR = t2 + t3;\r\n}\r\nelse if (elmH < 360) {\r\nelmR = t1; elmG = t2; elmB = t1 - t3;\r\n}\r\nelse {\r\nelmR = 0; elmG = 0; elmB = 0;\r\n}\r\n}\r\nelmR = Math.floor(elmR);\r\nelmG = Math.floor(elmG);\r\nelmB = Math.floor(elmB);\r\nclrRGB = '#' + elmR.toString(16) + elmG.toString(16) + elmB.toString(16);\r\nelmH = elmH + rate;\r\nif (elmH >= 360)\r\nelmH = 0;\r\nreturn clrRGB;\r\n}\r\n</script>\r\n</head>\r\n<body>\r\n\r\n");

            // end
            // HTML // begin [file="/Prediction.jsp";from=(170,33);to=(171,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/Prediction.jsp";from=(171,39);to=(172,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/Prediction.jsp";from=(172,34);to=(173,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/Prediction.jsp";from=(173,35);to=(190,0)]
                out.write("\r\n\r\n<table width=\"70%\" height=\"90\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n  <tr>\r\n    <td height=\"70\" colspan=\"5\"><img src=\"PIC/BarFinal.jpg\" width=\"700\" height=\"70\"></td>\r\n  </tr>\r\n  <tr bordercolor=\"#000000\" bgcolor=\"#CCCC99\" >\r\n    <td width=\"19%\" height=\"20\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_blank\"><font face=\"System\">HOME</font></a>\r\n        </div></td>\r\n    <td width=\"18%\"><div align=\"center\"><a href=\"Graphs.jsp\" target=\"_parent\">¡ÃÒ¿ÃÒ¤ÒËØé¹</a></div></td>\r\n    <td width=\"22%\"><div align=\"center\"><a href=\"Prediction.jsp\" target=\"_blank\">´Ù¼Å¡ÒÃ·Ó¹ÒÂ</a></div></td>\r\n    <td width=\"21%\"><div align=\"center\"><a href=\"Technical.htm\" target=\"_blank\">Í§¤ì¤ÇÒÁÃÙé</a></div></td>\r\n    <td width=\"20%\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_self\"><font face=\"System\">ABOUT\r\n        US</font></a></div></td>\r\n  </tr>\r\n</table>\r\n<form name = \"StockCode\" action=\"Prediction.jsp\" method = \"get\" >\r\n");

            // end
            // begin [file="/Prediction.jsp";from=(190,2);to=(237,0)]
                
                  String stock = "";
                      float price = 0f;
                      int deciss =0;
                      int pred = 0;
                      float ema9=0f;
                      float ema25=0f;
                      float ema75=0f;
                      float rsi=0f;
                      float k=0f;
                      float d=0f;
                      float macd=0f;
                    float sig=0f;
                    try{
                      stock = request.getParameter( "stock" );
                    }
                    catch(Exception e){
                      stock = "ASL";
                    }
                    try{
                      Vector ngee = new Vector();
                      System.out.println(ngee);
                      System.out.println(stock);
                      if( stock == null ){
                        stock = "ASL";
                      }
                      stocktrade.QueryData database = new QueryData();
                      database.qconnect();
                      stock = stock.toUpperCase();
                      ngee = database.getQuat( stock );
                      price = Float.parseFloat( ngee.elementAt(0).toString() );
                      deciss = Integer.parseInt( ngee.elementAt(1).toString() );
                      pred = Integer.parseInt( ngee.elementAt(2).toString() );
                      ema9 = Float.parseFloat( ngee.elementAt(3).toString() );
                      ema25 = Float.parseFloat( ngee.elementAt(4).toString() );
                      ema75 = Float.parseFloat( ngee.elementAt(5).toString() );
                      rsi = Float.parseFloat( ngee.elementAt(6).toString() );
                      k = Float.parseFloat( ngee.elementAt(7).toString() );
                      d = Float.parseFloat( ngee.elementAt(8).toString() );
                      macd = Float.parseFloat( ngee.elementAt(9).toString() );
                      sig = Float.parseFloat( ngee.elementAt(10).toString() );
                      database.qclose();
                    }
                    catch( Exception ee ){
                      System.out.println(ee);
                    }
                
            // end
            // HTML // begin [file="/Prediction.jsp";from=(237,2);to=(262,48)]
                out.write("\r\n\r\n  <table width=\"75%\" border=\"0\">\r\n    <tr>\r\n      <td height=\"22\" colspan=\"5\"> <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\">\r\n          <tr>\r\n            <td><font color=\"#999933\">´Ù¼Å·Ó¹ÒÂ</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td bgcolor=\"#ADCBF7\"    height=\"1\" ></td>\r\n          </tr>\r\n          <tr>\r\n            <td bgcolor = \"#FFFFFF\"height=\"1\" ></td>\r\n          </tr>\r\n          <tr>\r\n            <td bgcolor=\"#ADCBF7\"  height=\"1\"></td>\r\n          </tr>\r\n        </table></td>\r\n    </tr>\r\n    <tr>\r\n      <td width=\"10%\" height=\"27\"><font color=\"#3366FF\">Enter Stock </font></td>\r\n      <td width=\"14%\">\r\n        <input name=\"stock\" type=\"text\" id=\"stock\" size=\"15\">\r\n        </td>\r\n      <td width=\"4%\"><img src=\"PIC/go2.gif\" width=\"21\" height=\"17\"></td>\r\n      <td width=\"71%\"><font color=\"#3366FF\">ËØé¹");

            // end
            // begin [file="/Prediction.jsp";from=(262,50);to=(262,67)]
                out.print(stock);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(262,69);to=(273,0)]
                out.write("</font> </td>\r\n      <td width=\"1%\" rowspan=\"3\">&nbsp;</td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"386\" colspan=\"4\">\r\n<table width=\"100%\" border=\"2\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#FF9900\">\r\n          <tr bgcolor=\"#6666FF\">\r\n            <td colspan=\"6\"><font color=\"#66FF99\" size=\"3\">âÁà´Å¢Í§·Ò§¼Ùé¨Ñ´·Ó</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td height=\"40\" colspan=\"6\"><div align=\"left\">\r\n");

            // end
            // begin [file="/Prediction.jsp";from=(273,2);to=(289,0)]
                
                   if( deciss==0 ){
                     out.print("ÁÕá¹Çâ¹éÁ·ÕèäÁèá¹è¹Í¹ ¤ÇÃÍÂÙèà©Âæ");
                   }
                   else if( deciss==1 ){
                     out.print("ÁÕá¹Çâ¹éÁ¢Öé¹ ÊÒÁÒÃ«×éÍ ËÃ×Í¶×Íà¾×èÍ·Ó¡ÓäÃä´é");
                   }
                   else if( deciss==-1 ){
                     out.print("á¹Çâ¹éÁÅ§ ·ÂÍÂ¢ÒÂ ËÃ×Í¢ÒÂ");
                   }
                   else if( deciss==3 ){
                     out.print("ÁÕ¡ÒÃ¡ÃÐµØé¹ ÃÒ¤Ò¢Öé¹ã¹ÃÐÂÐÊÑé¹");
                   }
                   else if( deciss==4 ){
                     out.print("á¹Çâ¹éÁÂÑ§¢Öé¹ÍÂÙè áµèàÃÔèÁÁÕáÃ§¢ÒÂ");
                   }
            // end
            // HTML // begin [file="/Prediction.jsp";from=(289,2);to=(297,0)]
                out.write("\r\n</div></td>\r\n          </tr>\r\n          <tr bgcolor=\"#6699FF\">\r\n            <td colspan=\"6\"><font color=\"#66FF99\" size=\"3\">âÁà´Å¢Í§´Ã.»Ñ­­Ò à»ÃÁ»ÃÕ´ì</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td height=\"40\" colspan=\"6\"><div align=\"left\">\r\n");

            // end
            // begin [file="/Prediction.jsp";from=(297,2);to=(307,0)]
                
                if( pred==0 ){
                  out.print("¤ÇÃÍÂÙèà©Âæ");
                }
                else if( pred==1 ){
                  out.print("¤ÇÃ«×éÍ");
                }
                else if( pred==-1 ){
                  out.print(" ¤ÇÃ¢ÒÂ");
                }
            // end
            // HTML // begin [file="/Prediction.jsp";from=(307,2);to=(328,36)]
                out.write("\r\n</div></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"3\" bgcolor=\"#6699FF\"><div align=\"center\"><font color=\"#66FF99\" size=\"2\">Exponential\r\n                Moving Average</font></div></td>\r\n            <td colspan=\"3\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">Exponential\r\n                Moving Average Result</font></div></td>\r\n          </tr>\r\n          <tr>\r\n            <td width=\"15%\" bgcolor=\"#FFFFCC\"><div align=\"center\"><font size=\"2\"><font color=\"#6666FF\">ema\r\n                10 </font></font></div></td>\r\n            <td width=\"17%\" bgcolor=\"#FFFFCC\"><div align=\"center\"><font size=\"2\"><font color=\"#6666FF\">ema\r\n                25</font></font></div></td>\r\n            <td width=\"15%\" bgcolor=\"#FFFFCC\"><div align=\"center\"><font color=\"#6666FF\" size=\"2\">ema\r\n                75 </font></div></td>\r\n            <td width=\"17%\" bgcolor=\"#FFFFCC\"> <div align=\"center\"><font size=\"2\"><font color=\"#6666FF\">ST</font></font></div></td>\r\n            <td width=\"18%\" bgcolor=\"#FFFFCC\"> <div align=\"center\"><font size=\"2\"><font color=\"#6666FF\">ST-MT</font></font></div></td>\r\n            <td width=\"18%\" bgcolor=\"#FFFFCC\"> <div align=\"center\"><font size=\"2\"><font color=\"#6666FF\">MT</font></font></div></td>\r\n          </tr>\r\n          <tr>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(328,38);to=(328,76)]
                out.print(Math.round(ema9*100f)/100f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(328,78);to=(329,36)]
                out.write("</div></td>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(329,38);to=(329,77)]
                out.print(Math.round(ema25*100f)/100f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(329,79);to=(330,36)]
                out.write("</div></td>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(330,38);to=(330,77)]
                out.print(Math.round(ema75*100f)/100f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(330,79);to=(332,12)]
                out.write("</div></td>\r\n            <td><div align=\"center\">\r\n            ");

            // end
            // begin [file="/Prediction.jsp";from=(332,14);to=(339,12)]
                
                              if( price >= ema9 ){
                                out.print("Bullish");
                              }
                              else if( price < ema9 ){
                                out.print("Bearish");
                              }
                            
            // end
            // HTML // begin [file="/Prediction.jsp";from=(339,14);to=(342,12)]
                out.write("\r\n            </div></td>\r\n            <td><div align=\"center\">\r\n            ");

            // end
            // begin [file="/Prediction.jsp";from=(342,14);to=(349,12)]
                
                              if( price >= ema25 ){
                                out.print("Bullish");
                              }
                              else if( price < ema25 ){
                                out.print("Bearish");
                              }
                            
            // end
            // HTML // begin [file="/Prediction.jsp";from=(349,14);to=(352,12)]
                out.write("\r\n            </div></td>\r\n            <td><div align=\"center\">\r\n            ");

            // end
            // begin [file="/Prediction.jsp";from=(352,14);to=(359,12)]
                
                              if( price >= ema75 ){
                                out.print("Bullish");
                              }
                              else if( price < ema75 ){
                                out.print("Bearish");
                              }
                            
            // end
            // HTML // begin [file="/Prediction.jsp";from=(359,14);to=(427,36)]
                out.write("\r\n            </div></td>\r\n          </tr>\r\n          <tr bgcolor=\"#FFFFCC\">\r\n            <td colspan=\"6\"><font size=\"2\"><font color=\"#6666FF\">ST</font> <font color=\"#6666FF\" size=\"3\">ÃÐÂÐÊÑé¹</font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\">Bullish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = closed price &gt; eam 10 </font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\">ÃÐÂÐÊÑé¹´Õ</font> </font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\">Bearish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = closed price &lt; eam 10 </font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\">ÃÐÂÐÊÑé¹äÁè´Õ</font> </font></font></td>\r\n          </tr>\r\n          <tr bgcolor=\"#FFFFCC\">\r\n            <td colspan=\"6\"><font size=\"2\"><font color=\"#6666FF\">ST-MT</font>\r\n              <font color=\"#6666FF\" size=\"3\">ÃÐÂÐÊÑé¹-ÃÐÂÐ¡ÅÒ§</font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\">Bullish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = closed price &gt; eam 25</font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\">ÃÐÂÐÊÑé¹-ÃÐÂÐ¡ÅÒ§´Õ</font> </font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\">Bearish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = closed price &lt; eam 25</font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\">ÃÐÂÐÊÑé¹<font size=\"2\"><font size=\"2\">-ÃÐÂÐ¡ÅÒ§</font></font>äÁè´Õ</font>\r\n              </font></font></td>\r\n          </tr>\r\n          <tr bgcolor=\"#FFFFCC\">\r\n            <td colspan=\"6\"><font size=\"2\"><font color=\"#6666FF\">MT</font><font color=\"#6666FF\">\r\n              </font><font size=\"2\"><font color=\"#6666FF\" size=\"3\">ÃÐÂÐ¡ÅÒ§</font></font><font size=\"2\"></font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\">Bullish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = closed price &gt; eam 75</font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\">ÃÐÂÐ¡ÅÒ§´Õ</font> </font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\">Bearish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = closed price &lt; eam 75</font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\"><font size=\"2\"><font size=\"2\">ÃÐÂÐ¡ÅÒ§</font></font>äÁè´Õ</font>\r\n              </font></font></td>\r\n          </tr>\r\n        </table></td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"515\" colspan=\"4\">\r\n<table width=\"100%\" height=\"448\" border=\"2\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#FF9900\">\r\n          <tr bgcolor=\"#6699FF\">\r\n            <td width=\"57\" rowspan=\"2\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">14RSI</font></div></td>\r\n            <td colspan=\"2\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">Stochastic</font></div></td>\r\n            <td colspan=\"2\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">MACD</font></div></td>\r\n            <td colspan=\"3\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">Oscillators\r\n                Result</font></div></td>\r\n          </tr>\r\n          <tr>\r\n            <td width=\"56\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">%K</font></div></td>\r\n            <td width=\"56\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">%D</font></div></td>\r\n            <td width=\"66\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">MACD</font></div></td>\r\n            <td width=\"63\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">Signal</font></div></td>\r\n            <td width=\"89\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">RSI</font></div></td>\r\n            <td width=\"91\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">Stochastic</font></div></td>\r\n            <td width=\"195\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\">MACD</font></div></td>\r\n          </tr>\r\n          <tr>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(427,38);to=(427,75)]
                out.print(Math.round(rsi*100f)/100f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(427,77);to=(428,36)]
                out.write("</div></td>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(428,38);to=(428,73)]
                out.print(Math.round(k*100f)/100f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(428,75);to=(429,36)]
                out.write("</div></td>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(429,38);to=(429,73)]
                out.print(Math.round(d*100f)/100f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(429,75);to=(430,36)]
                out.write("</div></td>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(430,38);to=(430,78)]
                out.print(Math.round(macd*1000f)/1000f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(430,80);to=(431,36)]
                out.write("</div></td>\r\n            <td><div align=\"center\">");

            // end
            // begin [file="/Prediction.jsp";from=(431,38);to=(431,77)]
                out.print(Math.round(sig*1000f)/1000f);
            // end
            // HTML // begin [file="/Prediction.jsp";from=(431,79);to=(433,12)]
                out.write("</div></td>\r\n            <td><div align=\"center\">\r\n            ");

            // end
            // begin [file="/Prediction.jsp";from=(433,14);to=(444,12)]
                
                              if( rsi>80f ){
                                out.print("Overbought");
                              }
                              else if( (rsi<=80f)&&(rsi>=20f) ){
                                out.print("O");
                              }
                              else
                              if( rsi<20f ){
                                out.print("Oversold");
                              }
                            
            // end
            // HTML // begin [file="/Prediction.jsp";from=(444,14);to=(447,12)]
                out.write("\r\n            </div></td>\r\n            <td><div align=\"center\">\r\n            ");

            // end
            // begin [file="/Prediction.jsp";from=(447,14);to=(466,12)]
                
                              if( (k>80f)&&(k>d) ){
                                out.print("+Overbought");
                              }
                              else if( (k>80f)&&(k<=d) ){
                                out.print("-Overbought");
                              }
                              else if( (k<=80f)&&(k>=20f)&&(k>d) ){
                                out.print("+O");
                              }
                              else if( (k<=80f)&&(k>=20f)&&(k<d) ){
                                out.print("-O");
                              }
                              else if( (k<20f)&&(k>d) ){
                                out.print("+Oversold");
                              }
                              else if( (k<80f)&&(k<=d) ){
                                out.print("-Oversold");
                              }
                            
            // end
            // HTML // begin [file="/Prediction.jsp";from=(466,14);to=(469,12)]
                out.write("\r\n            </div></td>\r\n            <td><div align=\"center\">\r\n            ");

            // end
            // begin [file="/Prediction.jsp";from=(469,14);to=(482,12)]
                
                            if( (macd>0)&&(macd>sig) ){
                              out.print( "+Bullish" );
                            }
                            else if( (macd>0)&&(macd<sig) ){
                              out.print( "-Bullish" );
                            }
                            else if( (macd<=0)&&(macd>sig) ){
                              out.print( "+Bearish" );
                            }
                            else if( (macd<=0)&&(macd<sig) ){
                              out.print( "-Bearish" );
                            }
                            
            // end
            // HTML // begin [file="/Prediction.jsp";from=(482,14);to=(573,0)]
                out.write("\r\n            </div></td>\r\n          </tr>\r\n          <tr bgcolor=\"#FFFFCC\">\r\n            <td colspan=\"8\"><font size=\"2\"><font color=\"#6666FF\">Stochastic</font>\r\n              <font color=\"#6666FF\" size=\"3\">ÊÑ­­Ò³ÃÐÂÐÊÑé¹</font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">+Overbought = %K &gt;\r\n              80% and %K &gt; %D = </font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">¶×Íà¾×èÍÃÍ¢ÒÂ</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">-Overbought</font>\r\n              <font color=\"#6699FF\" size=\"2\">=</font> <font color=\"#6699FF\" size=\"2\">%K\r\n              &gt; 80% and %K &lt;%D</font> <font color=\"#6699FF\" size=\"2\">=</font>\r\n              <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">¢ÒÂà¾×èÍ·Ó¡ÓäÃ</font>\r\n            </td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">+O</font> <font color=\"#6699FF\" size=\"2\">=</font>\r\n              <font color=\"#6699FF\" size=\"2\">%K <font size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">ÍÂÙèÃÐËÇèÒ§\r\n              </font>20-80% and %K &gt;%D</font> <font color=\"#6699FF\" size=\"2\">=</font>\r\n              <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">«×éÍ\r\n              áÅÐ ¶×ÍÅ§·Ø¹</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">-O = %K <font size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">ÍÂÙèÃÐËÇèÒ§</font><font face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">\r\n              </font>20-80% and %K &lt;%D = <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">¢ÒÂä»\r\n              áÅÐ¶×Íà§Ô¹Ê´ </font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">+Oversold = %K &lt;20%\r\n              and %K &gt;%D = </font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">ÊÑ­­Ò³«×éÍáÅÐÅ§·Ø¹</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">-Oversold</font> <font color=\"#6699FF\" size=\"2\">=</font>\r\n              <font color=\"#6699FF\" size=\"2\">%K &lt;20% and %K &lt;%D</font> <font color=\"#6699FF\" size=\"2\">=</font>\r\n              <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">ÃÍÊÑ­­Ò³«×éÍ</font>\r\n            </td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\" bgcolor=\"#FFFFCC\"><font size=\"2\"><font color=\"#6666FF\">14\r\n              RSI</font><font color=\"#6666FF\"> </font><font size=\"2\"><font color=\"#6666FF\" size=\"3\">ÊÑ­­Ò³ÃÐÂÐÊÑé¹</font></font><font color=\"#6666FF\">\r\n              -<font size=\"3\"> ¡ÅÒ§</font></font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">Overbought = <font color=\"#6699FF\" size=\"2\">14\r\n              RSI &gt; 80%</font></font><font color=\"#6699FF\" size=\"2\"> = </font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">¤ÇÒÁàÊÕèÂ§ÃÐ´ÑºÊÙ§</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">O = <font color=\"#6699FF\" size=\"2\">14\r\n              RSI <font color=\"#6699FF\" size=\"2\"><font size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">ÍÂÙèÃÐËÇèÒ§</font></font><font face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">\r\n              </font>20-80%</font> = <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">¤ÇÒÁàÊÕèÂ§ÃÐ´Ñº»Ò¹¡ÅÒ§</font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">Oversold = <font color=\"#6699FF\" size=\"2\">14\r\n              RSI &lt; 20%</font></font><font color=\"#6699FF\" size=\"2\"> <font color=\"#6699FF\" size=\"2\">=</font>\r\n              </font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">¤ÇÒÁàÊÕèÂ§ÃÐ´ÑºµèÓ</font><font color=\"#6699FF\" size=\"2\">&nbsp;\r\n              </font></td>\r\n          </tr>\r\n          <tr bgcolor=\"#FFFFCC\">\r\n            <td height=\"22\" colspan=\"8\"><font color=\"#6666FF\" size=\"2\">MACD ÊÑ­­Ò³ÃÐÂÐ¡ÅÒ§</font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">+Bullish</font> <font size=\"2\"><font color=\"#6699FF\">\r\n              = MACD &gt; 0 &amp; MACD &gt; signal </font><font size=\"2\"><font size=\"2\"><font color=\"#6699FF\">=</font></font>\r\n              <font color=\"#6699FF\">¢Ò¢Öé¹ÃÐÂÐ¡ÅÒ§ «×éÍáÅÐÅ§·Ø¹</font></font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font color=\"#6699FF\" size=\"2\">-Bullish</font> <font size=\"2\"><font color=\"#6699FF\">=\r\n              MACD &gt; 0 &amp; MACD &lt; signal <font size=\"2\"><font size=\"2\"><font size=\"2\">=</font></font></font></font>\r\n              <font color=\"#6699FF\">»ÃÑºµÑÇã¹¢Ò¢Öé¹ÃÐÂÐ¡ÅÒ§ Å´¾ÍÃìµ</font> </font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\"><font size=\"2\"><font color=\"#6699FF\" size=\"2\">+Bearish\r\n              </font><font size=\"2\"><font color=\"#6699FF\">=</font></font> <font color=\"#6699FF\">MACD\r\n              &lt; 0 &amp; MACD &gt; signal <font size=\"2\"><font size=\"2\"><font size=\"2\"><font size=\"2\">=</font></font></font></font></font>\r\n              </font><font color=\"#6699FF\" size=\"2\">´Õ´¡ÅÑºã¹¢ÒÅ§ÃÐÂÐ¡ÅÒ§ «×éÍà¡ç§¡ÓäÃ</font><font size=\"2\">\r\n              <font color=\"#6699FF\" size=\"2\">&nbsp; </font></font></td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"8\" bgcolor=\"#6699FF\">&nbsp;</td>\r\n          </tr>\r\n        </table></td>\r\n    </tr>\r\n  </table>\r\n  <p>&nbsp;</p>\r\n  <p>&nbsp;</p>\r\n</form>\r\n</body>\r\n</html>\r\n");

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
