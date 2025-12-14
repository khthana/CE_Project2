<HTML>
<HEAD>
<jsp:useBean id="ViewAdvertiseBeanId" scope="session" class="view.ViewAdvertiseBean" />
<jsp:setProperty name="ViewAdvertiseBeanId" property="*" />
<TITLE>
ViewAdvertise
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%!
%>
    <form name="form1" method="post" action="" >
  <p>&nbsp;</p>
  <p align="left"><font size="+3"><b><font size="6" color="#0099FF" face="Comic Sans MS">Promotion</font></b></font></p>
<%
  java.util.Collection c = ViewAdvertiseBeanId.getProductShow();
  java.util.Iterator i = c.iterator();
  while (i.hasNext()) {
    picture.Picture picture = (picture.Picture) i.next();
    String productId = (String) picture.getPrimaryKey();
System.out.println("productId = "+productId);
    ViewAdvertiseBeanId.loadFilePic(productId);
System.out.println("after loadFilePid");
    String head = ViewAdvertiseBeanId.getHead();
    String filePic1 = ViewAdvertiseBeanId.getFilePic1();
    String abstracts = ViewAdvertiseBeanId.getAbstracts();
System.out.println("after getString");
    if (head==null) head = "";
    if (filePic1==null) filePic1="";
    if (abstracts==null) abstracts="";
  %>
  <table width="75%" border="0">
    <tr> 
      <td width="52%" align="right" rowspan="2" bgcolor="#DDEDDA"> 
        <div align="center"><a href="<% out.print(response.encodeURL("/product/ViewProduct2.jsp?productId="+productId+"&firstAccess=true")); %>"><img src="<% out.print(filePic1); %>" width="200" height="130" border="0"></a></div>
      </td>
      <td width="48%" align="center" height="25"><b><a href="<% out.print(response.encodeURL("/product/ViewProduct2.jsp?productId="+productId+"&firstAccess=true")); %>"><%= head %></a></b></td>
    </tr>
    <tr> 
      <td width="48%" align="center"> 
        <p><font size="2">
          <% out.print(abstracts); %>
          </font></p>
      </td>
    </tr>
  </table>
  <br><br>
  <%
  }
%>
</form>
 <br>
</body>
</html>
