<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page contentType="text/html; charset=Windows-874" %>
<%!  ResultSet rset = null;
          String project_name,address,contact,amount,rateString,owner,owner_address,owner_telephone,insertString;
	  float rate;
	  String status;
	  int maxrow=0;
%>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>

<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>


<html>
<head>
<title>ประกาศ  ขาย/เช่า  อสังหาริมทรัพย์ </title>
</head>
<body bgcolor="#FFFFFF" background="/www/picture/background/flower.gif">
<% 	 project_name= request.getParameter("project_name");
	 address = request.getParameter("project_address");
	 contact = request.getParameter("contact");
	 amount = request.getParameter("amount");
	 rateString = request.getParameter("rate");
	 rset=sessionBeanHP.setRset("select","SELECT  username,first_name,last_name,address,telephone FROM  home_user WHERE  username='"+sessionBeanHP.getUsername()+"'");
	 rset.next();
	 owner=rset.getString(2)+" "+rset.getString(3);
	 owner_address=rset.getString(4);
	 owner_telephone=rset.getString(5);
	 
	if(project_name==null || project_name.equals(""))
		project_name="none";
	if(address==null || address.equals(""))
		address="none";
	if(contact==null || contact.equals(""))
		contact="none";
	if(amount==null || amount.equals(""))
		amount="1";
	if(rateString==null || rateString.equals(""))
		rateString="0";
	if(owner==null ||owner.equals(""))
		owner="none";
	if(owner_address==null || owner_address.equals(""))
		owner_address="none";
	if(owner_telephone==null || owner_telephone.equals(""))
		owner_telephone="none";
	rate=Float.parseFloat(rateString);
	
%>
 <br>
<font color="#FF3333">
<br>   <font color="#FF3333">
	
<table width="83%" border="0">
  <tr> 
    <td width="18%"><b><img src="/www/picture/logo/home2.gif" width="100" height="63"></b></td>
    <td width="82%"> 
      <div align="center"><b><font face="MS Sans Serif" size="4"><font color="#FF3333" size="7" face="CordiaUPC">เพิ่มโครงการบ้าน</font></font></b></div>
    </td>
  </tr>
</table>
<div align="center"><br>
  <a href="HPindex.jsp"><img src="/www/picture/logo/Home_Project.gif" width="342" height="80" border="0"></a><br>
</div>
<table width="80%" border="0" align="center">
  <tr> 
    <td> 

      
    <%if(project_name.equals("none")) {%>
      <form method="post" action="">
        <table width="54%" border="0" align="center">
          <tr> 
            <td width="52%"> 
              <div align="right"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ชื่อโครงการ</b></font></div>
            </td>
            <td colspan="2"> <font face="MS Sans Serif" size="1"> 
              <input type="text" name="project_name" size="15" maxlength="30" >
              </font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ที่อยู่โครงการ 
                </b></font></div>
            </td>
            <td colspan="2"> <font face="MS Sans Serif" size="1"> 
              <input type="text" name="project_address" size="15" maxlength="30">
              </font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font color="#0000FF" face="MS Sans Serif" size="1"><b>ติดต่อ</b></font></div>
            </td>
            <td colspan="2"> <font face="MS Sans Serif" size="1"> 
              <input type="text" name="contact" size="15" maxlength="30" value="<%=owner_telephone%>">
              </font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font face="MS Sans Serif" size="1" color="#0000FF"><b>จำนวนบ้านในโครงการ</b></font></div>
            </td>
            <td width="29%"> 
              <div align="left"><font face="MS Sans Serif" size="1"> 
                <input type="text" name="amount" size="15" maxlength="5">
                </font></div>
            </td>
            <td width="19%"><font face="MS Sans Serif" size="1" color="#0000FF"><b>หลัง</b></font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font face="MS Sans Serif" size="1" color="#0000FF"><b>อัตราดอกเบี้ยของโครงการ 
                </b></font></div>
            </td>
            <td width="29%"> 
              <div align="left"><font face="MS Sans Serif" size="1"> 
                <select name="select">
                  <option value="7" selected>7</option>
                  <option value="7.5">7.5</option>
                  <option value="8">8</option>
                  <option value="8.5">8.5</option>
                  <option value="9">9</option>
                </select>
                </font></div>
            </td>
            <td width="19%"><font face="MS Sans Serif" size="1" color="#0000FF"><b>%</b></font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font face="MS Sans Serif" size="1" color="#0000FF"><b>เจ้าของโครงการ 
                </b></font></div>
            </td>
            <td colspan="2"> <font face="MS Sans Serif" size="1"> 
	    <%=owner%>
              </font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ที่อยู่เจ้าของโครงการ</b></font></div>
            </td>
            <td colspan="2"> <font face="MS Sans Serif" size="1"> 
	    <%=owner_address%>
              </font></td>
          </tr>
          <tr> 
            <td width="52%"> 
              <div align="right"><font color="#0000FF" face="MS Sans Serif" size="1"><b>เบอร์โทรศัพท์เจ้าของโครงการ</b></font></div>
            </td>
            <td colspan="2"> <font face="MS Sans Serif" size="1"> 
	     <%=owner_telephone%>
              </font></td>
          </tr>
          <tr> 
            <td colspan="3"> 
              <table width="80%" border="0" align="center">
                <tr> 
                  <td width="50%"> 
                    <div align="center"> 
                      <input type="submit" name="Submit" value="Submit">
                    </div>
                  </td>
                  <td width="40%"> 
                    <div align="center"> 
                      <input type="reset" name="Submit2" value="Reset">
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        </form>
	<%}
	else {%> 
	        <%rset=sessionBeanHP.setRset("select","select MAX(project_id) from home_project");
		       rset.next();
		       maxrow=rset.getInt(1);
		       maxrow++;
		%>
		<%insertString="INSERT INTO home_project(project_id,project_name,owner,owner_telephone,owner_address,amount,rate,address,contact)VALUES(";
		      insertString+= maxrow+",'"+project_name+"','"+owner+"','"+owner_telephone+"','"+owner_address+"',"+amount+","+rate+",'"+address+"','"+contact+"')";
      		      sessionBeanHP.setRset("insert",insertString);
		%>
		<%if(!sessionBeanHP.getStatus().equals("error")) {%>
		      <table width="54%" border="0" align="center">
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF"><b>ชื่อโครงการ</b></font></div>
		          </td>
		          <td colspan="2"> <font face="MS Sans Serif" size="2"> <%=project_name%> 
		            </font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF"><b>ที่อยู่โครงการ 
		              </b></font></div>
		          </td>
		          <td colspan="2"> <font face="MS Sans Serif" size="2"> <%=address%> </font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font color="#0000FF" face="MS Sans Serif" size="2"><b>ติดต่อ</b></font></div>
		          </td>
		          <td colspan="2"> <font face="MS Sans Serif" size="2"> <%=contact%> </font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF"><b>จำนวนบ้านในโครงการ</b></font></div>
		          </td>
		          <td width="29%"> 
		            <div align="left"><font face="MS Sans Serif" size="2"> <%=amount%> 
		              </font></div>
		          </td>
		          <td width="19%"><font face="MS Sans Serif" size="2" color="#0000FF"><b>หลัง</b></font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF"><b>อัตราดอกเบี้ยของโครงการ 
		              </b></font></div>
		          </td>
		          <td width="29%"> 
		            <div align="left"><font face="MS Sans Serif" size="2"> <%=rate%> </font></div>
		          </td>
		          <td width="19%"><font face="MS Sans Serif" size="2" color="#0000FF"><b>%</b></font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF"><b>เจ้าของโครงการ 
		              </b></font></div>
		          </td>
		          <td colspan="2"> <font face="MS Sans Serif" size="2"> <%=owner%> </font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font face="MS Sans Serif" size="2" color="#0000FF"><b>ที่อยู่เจ้าของโครงการ</b></font></div>
		          </td>
		          <td colspan="2"> <font face="MS Sans Serif" size="2"> <%=owner_address%> 
		            </font></td>
		        </tr>
		        <tr> 
		          <td width="52%"> 
		            <div align="right"><font color="#0000FF" face="MS Sans Serif" size="2"><b>เบอร์โทรศัพท์เจ้าของโครงการ</b></font></div>
		          </td>
		          <td colspan="2"> <font face="MS Sans Serif" size="2"> <%=owner_telephone%> 
		            </font></td>
			        </tr>
			        <tr> 
		          <td colspan="3"> 
		            <div align="center"><font face="CordiaUPC" size="3">
			    <form action="HPaddhome.jsp" method="post">
                <input type="submit" name="addhome" value="เพิ่มบ้านในโครงการ">
                <input type="hidden" name="project_id" value="<%=maxrow%>">
              </form>
			    </font></div>
		          </td>
		        </tr>
		      </table>
		      
      <%} else {%> 
      <table width="45%" border="0" align="center">
        <tr bgcolor="#3333FF"> 
          <td colspan="3"> 
            <div align="right"></div>
            <div align="center"><font color="#FFFFFF">ขออภัย ไม่สามารถทำการเพิ่มข้อมูลได้</font></div>
          </td>
        </tr>
      </table>
      <%} 
      %>
      
      
      <%}
	%> </td>
  </tr>
</table>
<br>
<br>
<br>
<table width="45%" border="0" align="center">
  <tr bgcolor="#3333FF"> 
    <td width="47%"> 
      <div align="right"><font color="#0000FF" face="MS Sans Serif" size="2"></font></div>
    </td>
    <td colspan="2"> <font face="MS Sans Serif" size="2"> </font></td>
  </tr>
</table>
</body>
</html>
