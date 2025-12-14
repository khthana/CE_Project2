package stocktrade;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.math.*;


public class PredicServlet extends HttpServlet {
  static final private String CONTENT_TYPE = "text/html; charset=MS874";
  //Initialize global variables
  private AccessDatabase database;
  public void init() throws ServletException {
  }
  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
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
      stock = request.getParameter("StockName");
      stock = stock.toUpperCase();
    }
    catch(Exception e){
      stock = "ACL";
    }
    System.out.println(stock);
    out.println("<html>");
    out.println("<head><title>Prediction</title></head>");
    out.println("<body>");
    try{
      AccessDatabase database = new Database();
      database.connect();
      ResultSet rs = database.getPredict( stock );
      rs.next();
      price = rs.getFloat(1);
      deciss = rs.getInt(2);
      pred = rs.getInt(3);
      ema9 = rs.getFloat(4);
      ema25 = rs.getFloat(5);
      ema75 = rs.getFloat(6);
      rsi = rs.getFloat(7);
      k = rs.getFloat(8);
      d = rs.getFloat(9);
      macd = rs.getFloat(10);
      sig = rs.getFloat(11);
      System.out.println( k );
      rs.close();
      database.close();
    }
    catch(Exception e){
      System.out.println(e);
    }
    /////////////////// ADD //////////////////////
      out.println("<table width=\"70%\"height=\"90\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
      out.println("<tr><td height=\"70\"colspan=\"5\"><img src =\"PIC/BarFinal.jpg\"width=\"700\"height=\"70\"></td>");
      out.println("<td height=\"70\"colspan=\"5\"><img src=\"PIC/BarFinal.jpg\" width=\"700\"height=\"70\"></td>");
      out.println("</tr>");
      out.println("<tr bordercolor=\"#000000\" bgcolor=\"#CCCC99\">");
      out.println("<td width=\"19%\" height=\"20\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_blank\"><font face=\"System\">HOME</font></a></div></td>");
      out.println("<td width=\"18%\"><div align=\"center\"><a href=\"Graphs.jsp\" target=\"_parent\">\u00A1\u00C3\u00D2\u00BF\u00C3\u00D2\u00A4\u00D2\u00CB\u00D8\u00E9\u00B9</a></div></td>");
      out.println("<td width=\"22%\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_self\">\u00B4\u00D9\u00BC\u00C5\u00A1\u00D2\u00C3\u00B7\u00D3\u00B9\u00D2\u00C2</a></div></td>");
      out.println("<td width=\"21%\"><div align=\"center\"><a href=\"Technical.htm\" target=\"_blank\">\u00CD\u00A7\u00A4\u00EC\u00A4\u00C7\u00D2\u00C1\u00C3\u00D9\u00E9</a></div></td>");
      out.println("<td width=\"20%\"><div align=\"center\"><a href=\"Index.jsp\" target=\"_self\"><font face=\"System\">ABOUT US</font></a></div></td>");
      out.println("</tr>");
      out.println("</table>");
      ////////////////// ADD /////////////////
      out.println("<form name=\"StockPrediction\"action=\"\">");
      out.println("<table width=\"85%\" border=\"0\">");
      out.println("<tr>"); //
      out.println("<td height=\"22\" colspan=\"4\">");
      out.println("<table width=\"85%\" border=\"0\">");
      out.println("<tr>");
      out.println("<td height=\"22\" colspan=\"4\"> <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\">");
      out.println("<tr>");
      out.println("<td><font color=\"#999933\" face=\"Courier New, Courier, mono\"><strong>\u00B4\u00D9\u00BC\u00C5\u00B7\u00D3\u00B9\u00D2\u00C2</strong></font></td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td bgcolor=\"#ADCBF7\"height=\"1\"></td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td bgcolor =\"#FFFFFF\"height=\"1\"></td>");
      out.println("</tr>");
      out.println("<tr> ");
      out.println("<td bgcolor=\"#ADCBF7\"  height=\"1\"></td>");
      out.println("</tr>");
      out.println("</table>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td width=\"12%\" height=\"27\"><font color=\"#3366FF\">Enter Stock </font></td>");
      out.println("<td width=\"12%\"><input name=\"stock\" type=\"text\" id=\"stock\" size=\"15\"></td>");
      out.println("<td width=\"5%\"><img src=\"PIC/go2.gif\" width=\"21\" height=\"17\"></td>");
      out.println("<td width=\"71%\"rowspan=\"2\">");
    /////////////////////+++++++++++++++++/////////////////////////////////////
    out.println("<table width=\"71%\" border=\"2\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#FF9900\">");
    out.println("<tr bgcolor=\"#6666FF\">");
    out.println("<td colspan=\"6\"><font color=\"#66FF99\" size=\"3\"><strong>\u00E2\u00C1\u00E0\u00B4\u00C5\u00A2\u00CD\u00A7\u00B7\u00D2\u00A7\u00BC\u00D9\u00E9\u00A8\u00D1\u00B4\u00B7\u00D3</strong></font></td>");
    out.println("</tr><tr>");
    out.print("<td height=\"40\" colspan=\"6\">");
    if(deciss==1){
      out.print("\u00E1\u00B9\u00C7\u00E2\u00B9\u00E9\u00C1\u00A2\u00D6\u00E9\u00B9 \u00CD\u00D2\u00A8\u00AB\u00D7\u00E9\u00CD\u00E0\u00BE\u00D7\u00E8\u00CD\u00E0\u00A1\u00E7\u00A7\u00A1\u00D3\u00E4\u00C3\u00E4\u00B4");
    }
    else if(deciss==0){
      out.print("\u00E1\u00B9\u00C7\u00E2\u00B9\u00E9\u00C1\u00E4\u00C1\u00E8\u00E1\u00B9\u00E8\u00B9\u00CD\u00B9");
    }
    else if(deciss==-1){
      out.print("\u00E1\u00B9\u00C7\u00E2\u00B9\u00E9\u00C1\u00C5\u00A7 \u00CD\u00D2\u00A8\u00B7\u00C2\u00CD\u00C2\u00A2\u00D2\u00C2\u00CB\u00D8\u00E9\u00B9");
    }
    else if(deciss==-2){
      out.print("\u00A4\u00C7\u00C3\u00A2\u00D2\u00C2");
    }
    else if(deciss==2){
      out.print("\u00A4\u00C7\u00C3\u00AB\u00D7\u00E9\u00CD \u00E0\u00BE\u00D7\u00E8\u00CD\u00E0\u00A1\u00E7\u00A7\u00A1\u00D3\u00E4\u00C3");
    }
    else if(deciss==3){
      out.print("\u00CD\u00D2\u00A8\u00C1\u00D5\u00A1\u00D2\u00C3\u00A1\u00C3\u00D0\u00B5\u00D8\u00E9\u00B9\u00E0\u00BE\u00D7\u00E8\u00CD\u00BB\u00D1\u00E8\u00B9\u00C3\u00D2\u00A4\u00D2");
    }
    out.println("</td>");
    out.println("</tr><tr bgcolor=\"#6699FF\">");
    out.println("<td colspan=\"6\"><font color=\"#66FF99\" size=\"3\"><strong>\u00E2\u00C1\u00E0\u00B4\u00C5\u00A2\u00CD\u00A7\u00B4\u00C3.\u00BB\u00D1\u00AD\u00AD\u00D2 \u00E0\u00BB\u00C3\u00C1\u00BB\u00C3\u00D5\u00B4\u00EC</strong></font></td>");
    out.println("</td></tr><tr>");
    out.print("<td height=\"40\" colspan=\"6\">");
    if(pred == 1){
      out.print("\u00A4\u00C7\u00C3\u00AB\u00D7\u00E9\u00CD");
    }
    else if(pred == 0){
      out.print("\u00CD\u00C2\u00D9\u00E8\u00E0\u00A9\u00C2\u00E6");
    }
    else if(pred == -1){
      out.print("\u00A4\u00C7\u00C3\u00A2\u00D2\u00C2");
    }
    out.println("</td></tr><tr>");
    out.println("<td colspan=\"3\" bgcolor=\"#6699FF\"><div align=\"center\"><font size=\"2\"><strong></strong></font><font size=\"2\"><strong></strong></font><font ");
    out.println("color=\"#66FF99\" size=\"2\"><strong>Exponential ");
    out.println("Moving Average</strong></font><font size=\"2\"><strong></strong></font></div></td>");
    out.println("<td colspan=\"3\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>Exponential");
    out.println(" Moving Average Result</strong></font></div></td>");
    out.println("</tr><tr>");
    out.println("<td width=\"15%\" bgcolor=\"#FFFFCC\"><div align=\"center\"><font size=\"2\"><strong><font color=\"#6666FF\">ema ");
    out.println("10 </font></strong></font></div></td>");
    out.println("<td width=\"17%\" bgcolor=\"#FFFFCC\"><div align=\"center\"><font size=\"2\"><strong><font color=\"#6666FF\">ema ");
    out.println("25 </font></strong></font></div></td>");
    out.println("<td width=\"15%\" bgcolor=\"#FFFFCC\"><div align=\"center\"><font color=\"#6666FF\" size=\"2\"><strong>ema ");
    out.println("75 </strong></font></div></td>");
    out.println("<td width=\"17%\" bgcolor=\"#FFFFCC\"> <div align=\"center\"><font size=\"2\"><strong><font color=\"#6666FF\">ST</font></strong></font></div></td>");
    out.println("<td width=\"18%\" bgcolor=\"#FFFFCC\"> <div align=\"center\"><font size=\"2\"><strong><font color=\"#6666FF\">ST-MT</font></strong></font></div></td>");
    out.println("<td width=\"18%\" bgcolor=\"#FFFFCC\"> <div align=\"center\"><font size=\"2\"><strong><font color=\"#6666FF\">MT</font></strong></font></div></td>");
    out.println("</tr><tr>");
    out.print("<td>");
    out.print(Math.round(ema9*100f)/100f);
    out.println("</td>");
    out.print("<td>");
    out.print(Math.round(ema25*100f)/100f);
    out.println("</td>");
    out.print("<td>");
    out.print(Math.round(ema75*100f)/100f);
    out.println("</td>");
////////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    if( price>ema9 ){
      out.print("Bullish");
    }
    else if( price <= ema9 ){
      out.print("Bearish");
    }
    out.println("</td>");
////////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    if( price>ema25 ){
          out.print("Bullish");
    }
    else if( price <= ema25 ){
          out.print("Bearish");
    }
    out.println("</td>");
////////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    if( price>ema75 ){
          out.print("Bullish");
    }
     else if( price <= ema75 ){
          out.print("Bearish");
    }
    out.println("</td>");
////////////////////////////////////////////////////////////////////////////////

    out.println("</tr>");
    out.println("<tr bgcolor=\"#FFFFCC\">");
    out.println("<td colspan=\"6\"><font size=\"2\"><strong><font color=\"#6666FF\">ST</font></strong>");
    out.println("<font color=\"#6666FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9</strong></font></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"6\"><font color=\"#6699FF\" size=\"2\"><strong>Bearish</strong></font>");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\"> = closed price < eam 10");
    out.println("</font><font size=\"2\"><strong><font size=\"2\"><strong><font color=\"#6699FF\">=</font></strong></font> ");
    out.println("<font color=\"#6699FF\">\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9\u00E4\u00C1\u00E8\u00B4\u00D5</font> </strong></font></strong></font></td>");

    out.println("</tr><tr bgcolor=\"#FFFFCC\">");
    out.println("<td colspan=\"6\"><font size=\"2\"><strong><font color=\"#6666FF\">ST-MT</font></strong> ");
    out.println("<font color=\"#6666FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9-\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7</strong></font></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"6\"><font color=\"#6699FF\" size=\"2\"><strong>Bullish</strong></font> ");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\"> = closed price > eam 25</font><font size=\"2\"><strong><font size=\"2\"><strong><font ");
    out.println("color=\"#6699FF\">=</font></strong></font> ");
    out.println("<font color=\"#6699FF\">\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9-\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7\u00B4\u00D5</font> </strong></font></strong></font></td>");
    out.println("</tr><tr>");
    out.println(" <td colspan=\"6\"><font color=\"#6699FF\" size=\"2\"><strong>Bearish</strong></font> ");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\"> = closed price < eam 25</font><font size=\"2\"><strong><font size=\"2\"><strong><font ");
    out.println("color=\"#6699FF\">=</font></strong></font> ");
    out.println("<font color=\"#6699FF\">\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9<font size=\"2\"><strong><font size=\"2\"><strong>-\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7</strong></font></strong></font>\u00E4\u00C1\u00E8\u00B4\u00D5</font> ");
    out.println("</strong></font></strong></font></td>");
    out.println("</tr><tr bgcolor=\"#FFFFCC\"> ");
    out.println("<td colspan=\"6\"><font size=\"2\"><strong><font color=\"#6666FF\">MT </font><font size=\"2\"><font color=\"#6666FF\" size=\"3\" face=\"AngsanaUPC, ");
    out.println("BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7</strong></font></font></strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"6\"><font color=\"#6699FF\" size=\"2\"><strong>Bullish</strong></font> ");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\"> = closed price > eam 75</font><font size=\"2\"><strong><font size=\"2\"><strong><font ");
    out.println("color=\"#6699FF\">=</font></strong></font> ");
    out.println("<font color=\"#6699FF\">\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7\u00B4\u00D5</font> </strong></font></strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"6\"><font color=\"#6699FF\" size=\"2\"><strong>Bearish</strong></font> ");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\"> = closed price < eam 75</font><font size=\"2\"><strong><font size=\"2\"><strong><font ");
    out.println("color=\"#6699FF\">=</font></strong></font> ");
    out.println("<font color=\"#6699FF\"><font size=\"2\"><strong><font size=\"2\"><strong>\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7</strong></font></strong></font>\u00E4\u00C1\u00E8\u00B4\u00D5</font> ");
    out.println("</strong></font></strong></font></td>");
    out.println("</tr></table>");
    ///////////////////// ADD //////////////////////////
    out.println("</td>");
    out.println("<tr>");
    out.println("<td height=\"346\" colspan=\"3\">&nbsp;</td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td colspan=\"3\">&nbsp;</td>");
    //---------------------------------------------------------------

    out.println("<table width=\"548\" border=\"2\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#FF9900\">");
    out.println("<tr bgcolor=\"#6699FF\"> ");
    out.println("<td width=\"53\" rowspan=\"2\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>14RSI</strong></font></div></td>");
    out.println("<td colspan=\"2\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>Stochastic</strong></font></div></td>");
    out.println("<td colspan=\"2\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>MACD</strong></font></div></td>");
    out.println("<td colspan=\"3\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>Oscillators ");
    out.println("Result</strong></font></div></td>");
    out.println("</tr><tr>");
    out.println("<td width=\"52\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>%K</strong></font></div></td>");
    out.println("<td width=\"52\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>%D</strong></font></div></td>");
    out.println("<td width=\"61\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>MACD</strong></font></div></td>");
    out.println("<td width=\"59\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>Signal</strong></font></div></td>");
    out.println("<td width=\"83\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>RSI</strong></font></div></td>");
    out.println("<td width=\"84\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>Stochastic</strong></font></div></td>");
    out.println("<td width=\"84\" bgcolor=\"#6699FF\"> <div align=\"center\"><font color=\"#66FF99\" size=\"2\"><strong>MACD</strong></font></div></td>");
    out.println("</tr><tr>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    out.print(Math.round( rsi*100f )/100f);
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    out.print(Math.round( k*100f )/100f);
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    out.print(Math.round( d*100f )/100f);
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    out.print(Math.round( macd*1000f )/1000f);
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    out.print(Math.round( sig*10000f )/10000f);
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    if(rsi>=80f){
      out.print("Overbought");
    }
    else if( (20f<=rsi)&&(rsi<80f) ){
      out.println("O");
    }
    else if( rsi < 20 ){
      out.println("Oversold");
    }
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    if( (k>=80)&&(k>=d) ){
      out.print("+Overbought");
    }
    else if( (k>=80)&&(k<d) ){
      out.print("-Overbought");
    }
    else if( (20f<=k)&&(k<80f)&&(k>=d) ){
      out.print("+O");
    }
    else if( (20f<=k)&&(k<80f)&&(k<d) ){
      out.print("-O");
    }
    else if( (k<20)&&(k<d) ){
      out.print("-Oversold");
    }
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.print("<td>");
    if( (macd>0)&&(macd>=sig) ){
      out.print("+Bullish");
    }
    else if( (macd>0)&&(macd<sig) ){
      out.print("+Bearish");
    }
    else if( (macd<=0)&&(macd>=sig) ){
      out.print("+Bearish");
    }
    else if( (macd<=0)&&(macd<sig) ){
      out.print("-Bullish");
    }
    out.println("</td>");
    ////////////////////////////////////////////////////////////////////////////
    out.println("</tr>");
    out.println("<tr bgcolor=\"#FFFFCC\">");
    out.println("<td colspan=\"8\"><font size=\"2\"><strong><font color=\"#6666FF\">Stochastic</font></strong>");
    out.println("<font color=\"#6666FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00CA\u00D1\u00AD\u00AD\u00D2\u00B3\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9</strong></font></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>+Overbought = %K >");
    out.println("80% and %K >%D = </strong></font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\"><strong>\u00B6\u00D7\u00CD\u00E0\u00BE\u00D7\u00E8\u00CD\u00C3\u00CD\u00A2\u00D2\u00C2</strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>-Overbought</strong></font>");
    out.println("<font color=\"#6699FF\" size=\"2\"><strong>=</strong></font> <font color=\"#6699FF\" size=\"2\"><strong>%K");
    out.println(" > 80% and %K < %D</strong></font> <font color=\"#6699FF\" size=\"2\"><strong>=</strong></font>");
    out.println("<font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00A2\u00D2\u00C2\u00E0\u00BE\u00D7\u00E8\u00CD\u00B7\u00D3\u00A1\u00D3\u00E4\u00C3</strong></font>");
    out.println("</td></tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>+O</strong></font>");
    out.println("<font color=\"#6699FF\" size=\"2\"><strong>=</strong></font> <font color=\"#6699FF\" size=\"2\"><strong>%K");
    out.println("<font size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">\u00CD\u00C2\u00D9\u00E8\u00C3\u00D0\u00CB\u00C7\u00E8\u00D2\u00A7");
    out.println("</font>20-80% and %K > %D</strong></font> <font color=\"#6699FF\" size=\"2\"><strong>=</strong></font>");
    out.println("<font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00AB\u00D7\u00E9\u00CD");
    out.println("\u00E1\u00C5\u00D0 \u00B6\u00D7\u00CD\u00C5\u00A7\u00B7\u00D8\u00B9</strong></font> </td></tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>-O = %K <strong><font size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\">\u00CD\u00C2\u00D9\u00E8\u00C3\u00D0\u00CB\u00C7\u00E8\u00D2\u00A7</font></strong><font face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">");
    out.println("</font>20-80% and %K < %D = <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">\u00A2\u00D2\u00C2\u00E4\u00BB");
    out.println("\u00E1\u00C5\u00D0\u00B6\u00D7\u00CD\u00E0\u00A7\u00D4\u00B9\u00CA\u00B4 </font></strong></font></td></tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>+Oversold = %K <");
    out.println("20% and %K > %D = <font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"></font></strong></font><font ");
    out.println("color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00CA\u00D1\u00AD\u00AD\u00D2\u00B3\u00AB\u00D7\u00E9\u00CD\u00E1\u00C5\u00D0\u00C5\u00A7\u00B7\u00D8\u00B9</strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>-Oversold</strong></font>");
    out.println("<font color=\"#6699FF\" size=\"2\"><strong>=</strong></font> <font color=\"#6699FF\" size=\"2\"><strong>%K");
    out.println("< 20% and %K < %D</strong></font> <font color=\"#6699FF\" size=\"2\"><strong>=</strong></font>");
    out.println("<font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"><strong>\u00C3\u00CD\u00CA\u00D1\u00AD\u00AD\u00D2\u00B3\u00AB\u00D7\u00E9\u00CD</strong></font>");
    out.println("</td></tr><tr>");
    out.println("<td colspan=\"8\" bgcolor=\"#FFFFCC\"><font size=\"2\"><strong><font color=\"#6666FF\">14");
    out.println("RSI </font><font size=\"2\"><font color=\"#6666FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\"><strong>\u00CA\u00D1\u00AD\u00AD\u00D2\u00B3\u00C3\u00D0\u00C2\u00D0\u00CA\u00D1\u00E9\u00B9</strong></font></font><font color=\"#6666FF\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\">");
    out.println("-<font size=\"3\"> \u00A1\u00C5\u00D2\u00A7</font></font></strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>Overbought = <font color=\"#6699FF\" size=\"2\">14");
    out.println("RSI > 80%</font> = </strong></font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\"><strong>\u00A4\u00C7\u00D2\u00C1\u00E0\u00CA\u00D5\u00E8\u00C2\u00A7\u00C3\u00D0\u00B4\u00D1\u00BA\u00CA\u00D9\u00A7</strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>O = <font color=\"#6699FF\" size=\"2\">14");
    out.println("RSI <font color=\"#6699FF\" size=\"2\"><strong><strong><font size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\">\u00CD\u00C2\u00D9\u00E8\u00C3\u00D0\u00CB\u00C7\u00E8\u00D2\u00A7</font></strong><font face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS Serif\"></font></strong></font><font face=\"AngsanaUPC, ");
    out.println("BrowalliaUPC, CordiaUPC, MS Serif\">");
    out.println("</font>20-80% <strong>=</strong> </font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\"><strong>\u00A4\u00C7\u00D2\u00C1\u00E0\u00CA\u00D5\u00E8\u00C2\u00A7\u00C3\u00D0\u00B4\u00D1\u00BA\u00BB\u00D2\u00B9\u00A1\u00C5\u00D2\u00A7</strong></font></strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>Oversold = <font color=\"#6699FF\" size=\"2\">14");
    out.println("RSI < 20%</font> <font color=\"#6699FF\" size=\"2\"><strong>=</strong></font>");
    out.println("</strong></font><font color=\"#6699FF\" size=\"3\" face=\"AngsanaUPC, BrowalliaUPC, CordiaUPC, MS ");
    out.println("Serif\"><strong>\u00A4\u00C7\u00D2\u00C1\u00E0\u00CA\u00D5\u00E8\u00C2\u00A7\u00C3\u00D0\u00B4\u00D1\u00BA\u00B5\u00E8\u00D3</strong></font><font color=\"#6699FF\" size=\"2\"><strong>");
    out.println("</strong></font></td>");
    out.println("</tr>");
    out.println("<tr bgcolor=\"#FFFFCC\">");
    out.println("<td height=\"22\" colspan=\"8\"><font color=\"#6666FF\" size=\"2\"><strong>MACD </strong>\u00CA\u00D1\u00AD\u00AD\u00D2\u00B3\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7</font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>+Bullish</strong></font>");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\"> = MACD > 0 & MACD >");
    out.println("signal </font><font size=\"2\"><strong><font size=\"2\"><strong><font color=\"#6699FF\">=</font></strong></font>");
    out.println("<font color=\"#6699FF\">\u00A2\u00D2\u00A2\u00D6\u00E9\u00B9\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7 \u00AB\u00D7\u00E9\u00CD\u00E1\u00C5\u00D0\u00C5\u00A7\u00B7\u00D8\u00B9</font></strong></font></strong></font></td>");
    out.println("</tr><tr>");
    out.println("<td colspan=\"8\"><font color=\"#6699FF\" size=\"2\"><strong>-Bullish</strong></font>");
    out.println("<font size=\"2\"><strong><font color=\"#6699FF\">= MACD >0 & MACD <signal");
    out.println("/font><font size=\"2\"><strong><font size=\"2\"><strong><font size=\"2\"><strong><font ");
    out.println("color=\"#6699FF\">=</font></strong></font></strong></font></strong></font>");
    out.println("<font color=\"#6699FF\">\u00BB\u00C3\u00D1\u00BA\u00B5\u00D1\u00C7\u00E3\u00B9\u00A2\u00D2\u00A2\u00D6\u00E9\u00B9\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7 \u00C5\u00B4\u00BE\u00CD\u00C3\u00EC\u00B5</font> <font color=\"#6699FF\">");
    out.println("</font></strong></font></td></tr><tr>");
    out.println("<td colspan=\"8\"><font size=\"2\"><strong><font color=\"#6699FF\" size=\"2\">+Bearish");
    out.println("</font><font size=\"2\"><strong><font color=\"#6699FF\">=</font></strong></font>");
    out.println("<font color=\"#6699FF\">MACD < 0 & MACD > signal </font><font size=\"2\"><strong><font size=\"2\"><strong><font size=\"2\"><strong><font ");
    out.println("size=\"2\"><strong><font color=\"#6699FF\">=</font></strong></font></strong></font></strong></font></strong></font>");
    out.println("</strong></font><font color=\"#6699FF\" size=\"2\"><strong>\u00B4\u00D5\u00B4\u00A1\u00C5\u00D1\u00BA\u00E3\u00B9\u00A2\u00D2\u00C5\u00A7\u00C3\u00D0\u00C2\u00D0\u00A1\u00C5\u00D2\u00A7");
    out.println("\u00AB\u00D7\u00E9\u00CD\u00E0\u00A1\u00E7\u00A7\u00A1\u00D3\u00E4\u00C3</strong></font><font size=\"2\"><strong> <font color=\"#6699FF\" size=\"2\">");
    out.println("</font></strong></font></td>");
    ///////////// FIX ////////////////////////
    out.println("</tr><tr><td colspan=\"8\" bgcolor=\"#6699FF\">&nbsp;</td></tr>");
    out.println("</table></td></tr></table>");
    out.println("</form></body></html>");
    //-------------------------------------------/
  }
  //Process the HTTP Post request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet( request, response);
  }
  //Clean up resources
  public void destroy() {
  }
}