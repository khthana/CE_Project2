<HTML>
<HEAD>
<TITLE>
ThankYou
</TITLE>
</HEAD>
<%!
  HttpSession session;
 quote.Quote quote;
%>
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  String receiptNo = request.getParameter("receiptNo");
  System.out.println("in thank you, receiptNo ="+receiptNo);
%>
<BODY>
<form name="form1" method="post" action="<% out.print(response.encodeURL("/product/ViewReceipt.jsp?receiptNo="+receiptNo+"&firstAccess=true")); %>" >
  <p align="center"><b><font size="6" face="Comic Sans MS" color="#0099FF">Thank 
    you for purchase our Products</font></b></p>
  <p align="center"><font size="6" face="Comic Sans MS" color="#0099FF"><b> Hope 
    to see you again!! </b></font></p>
  <table width="100%" border="0">
    <tr>
      <td>
        <div align="center">
          <input type="submit" name="Submit" value="View Receipt">
        </div>
      </td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</BODY>
</HTML>
