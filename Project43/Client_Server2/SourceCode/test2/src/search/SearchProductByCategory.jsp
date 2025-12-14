<HTML>
<HEAD>
<TITLE>
SearchProductByCategory
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">

<form name="form1" action="SearchProductServletAlias" method="get">
  <p><font color="#0099FF"><b><font size="6" face="Comic Sans MS">Search Product</font></b></font></p>
<%!
    HttpSession session;
    String attributeRef[][];
    String tmp="";
    String s;
%>
<%
  String category = "Anything";
  session = request.getSession(true);
  base.BaseAttribute baseAttribute = base.BaseAttribute.getBaseAttribute();
  attributeRef = baseAttribute.getAttributeRef();
%>
  <input type="hidden" name="category" value="Anything">
  <%
    Vector categoryRecord = baseAttribute.getCategory();
    out.println("<table width=\"100%\" border=\"0\">");
    for(int i=0;i < categoryRecord.size();i++){
      if (i%4==0) { out.println("<tr>");
        if (i==0) {
          out.println("<td width=\"20%\">"+"<font color=\"#0099FF\">"+"<b>"+"<font size=\"4\">"+"Category"+"</font>"+"</b>"+"</font>"+"</td>");
        } else out.println("<td width=\"20%\"></td>");
      }
      String s = (String)categoryRecord.elementAt(i);
      out.println("<td width=\"20%\">");
      out.println("<input type=\"checkbox\" name=\"category"+
                  (new Integer(i+1)).toString()+"\" value=\""+
                  s+"\" checked>");
      out.println(s+"</td>");
      if (i%4==3) out.println("</tr>");
    } out.println("</table>");
%>
  <p>&nbsp; </p>
  <table width="75%" border="0">
    <tr> 
      <td align="right"> 
        <input type="submit" name="Submit" value="Submit">
        </td>
      <td>&nbsp;</td>
      <td> 
        <input type="reset" name="Submit2" value="Reset">
      </td>
    </tr>
  </table>
  <table width="75%" border="0">
    <tr>
      <td>
        <div align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="93" height="33">
            <param name=movie value="searchpro.swf">
            <param name=quality value=high>
            <param name="BGCOLOR" value="">
            <embed src="searchpro.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="93" height="33" bgcolor="">
            </embed> 
          </object></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
