<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>

<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPreservation.jsp");%>



<%! ResultSet rset=null;
	String hid,pid,home_name,type,need,area,stage,bathroom,bedroom,status,project_name,owner,detail,contact,yearT,action,prereserve;
	String month_paymentT,taxT,confirm,contractdd,contractyy,contractmm,alldate,query,email_from,email_to,first_name,last_name,reservename;
	int home_id,project_id,price,year,index,yearTemp;
	float rate,tax,month_payment;
	StringBuffer sb = new StringBuffer();
	StringBuffer sb2 = new StringBuffer();
	java.util.Date prereservedate=new java.util.Date();
%>
<%hid=request.getParameter("home_id"); %>
<%pid=request.getParameter("project_id"); %>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%rset= sessionBeanHP.setRset("select","SELECT home_name,type,need,area,price,stage,bathroom,bedroom,home_id,project_id,status,detail,contact,owner FROM  home  WHERE home_id="+hid+" AND project_id="+pid+" ORDER BY home_id DESC"); %>
<%alldate=prereservedate.toLocaleString();

%>
<%alldate=alldate.substring(alldate.indexOf(',')-4,alldate.indexOf(','));%>
<%rset.next();
      home_name=rset.getString(1);
      type=rset.getString(2);
      need=rset.getString(3);
      area =rset.getString(4);
      price = rset.getInt(5);
      stage= rset.getString(6);
      bathroom=rset.getString(7);
      bedroom=rset.getString(8);
      home_id=rset.getInt(9);
      project_id=rset.getInt(10);
      status=rset.getString(11);
      detail=rset.getString(12);
      contact=rset.getString(13);
      owner=rset.getString(14);
%>

<%rset= sessionBeanHP.setRset("select","SELECT project_name,owner,project_id  FROM  home_project WHERE project_id="+pid+" ORDER BY project_id DESC"); %>

<%rset.next();    project_name=rset.getString(1); %>
<html>
<head>
<title>บ้าน</title>
</head>
<body bgcolor="#FFFFFF">
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
</div>
<%prereserve=request.getParameter("prereserve");
	      if(prereserve==null || prereserve.equals(""))
				prereserve="none";
			%>
<%yearT=request.getParameter("year");
	if(yearT==null || yearT.equals(""))
		yearT="0";
%>
<%confirm=request.getParameter("confirm");
	if(confirm==null || confirm.equals(""))
		confirm="none";
%>
<%if(prereserve.equals("Pre-Reservation")&&(!yearT.equals("0"))){%>
    	<% 	contractdd=request.getParameter("contractdd");
		contractmm=request.getParameter("contractmm");
		contractyy=request.getParameter("contractyy");
		if(contractyy==null || contractyy.equals(""))
			contractyy=alldate;
		year=Integer.parseInt(yearT);
		      switch (year)
			{
		case 1: tax=1.0f; break;
		case 5:  {   if (rate==7) tax=0.019801f;if (rate==7.5) tax=0.020038f;if (rate==8) tax=0.020276f;if (rate==8.5) tax=0.020517f;if (rate==9) tax=0.020758f;
				} break;
		case 10:  {if (rate==7) tax=0.011611f;if (rate==7.5) tax=0.011870f;if (rate==8) tax=0.012133f;if (rate==8.5) tax=0.012399f;if (rate==9) tax=0.012668f;
				} break;
		case 15:  {if (rate==7) tax=0.008988f;if (rate==7.5) tax=0.009270f;if (rate==8) tax=0.009557f;if (rate==8.5) tax=0.009847f;if (rate==9) tax=0.010143f;
		  		 } break;
		case 20:  {if (rate==7) tax=0.007753f;if (rate==7.5) tax=0.008056f;if (rate==8) tax=0.008364f;if (rate==8.5) tax=0.008678f;if (rate==9) tax=0.008997f;
				} break;
			}
                month_payment=tax*price;         
		%>
		<%rset=sessionBeanHP.setRset("select","select max(contract_id) from home_contract"); %>
		<%rset.next();  index=rset.getInt(1); index++;
		     query="insert into home_contract(contract_id,project_id,home_id,year,pay_month,current_rate,username,start_date) values("+index+","+project_id+","+home_id+","+year+","+month_payment+","+rate+",'"+sessionBeanHP.getUsername()+"','"+contractdd+"-"+contractmm+"-"+contractyy+"')";
		     sessionBeanHP.setRset("insert",query);
		     sessionBeanHP.setRset("insert","update home SET status='reserve'  WHERE home_id ="+home_id+" AND  project_id="+project_id);
		%>
		
<table width="61%" border="0" align="center" bgcolor="#FF9900">
  <tr>
    <td>
      <table width="99%" border="0" align="center" bgcolor="#FFFFFF">
        <tr bgcolor="#99CCFF"> 
          <td height="20" colspan="2"><font face="MS Sans Serif" size="1"></font></td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">โครงการ </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=project_name%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">เจ้าของ</font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=owner%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ชื่อบ้าน </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"> <%=home_name%> 
              </font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ประเภท </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"> <%=type%> 
              </font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ต้องการ </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=need%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">พื้นที่ </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=area%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ราคา </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=price%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ชั้น </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=stage%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ห้องนอน </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=bedroom%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ห้องน้ำ </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=bathroom%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">รายละเอียดเพิ่มเติม</font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=detail%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ติดต่อ </font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=contact%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">อัตราดอกเบี้ย</font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=rate%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ระยะเวลาการชำระเงิน</font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=year%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="28%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">ค่าใช้จ่ายต่อเดือน</font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=month_payment%></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" width="2%" bgcolor="#CCFFFF"> 
            <div align="right"><font face="MS Sans Serif" size="1">วันทำสัญญา</font></div>
          </td>
          <td height="2" width="72%" bgcolor="#FFCCCC"> 
            <div align="center"><font face="MS Sans Serif"><font face="MS Sans Serif"><font size="1"><%=contractdd%>/<%=contractmm%>/<%=contractyy%></font></font></font></div>
          </td>
        </tr>
        <tr> 
	 <%rset=sessionBeanHP.setRset("select","SELECT email,first_name,last_name FROM home_user WHERE username='"+sessionBeanHP.getUsername()+"'");
		while(rset.next())
		{
		 email_from=rset.getString(1);
		 reservename=rset.getString(2)+" "+rset.getString(3);
		 }

		first_name=owner.substring(0,owner.indexOf(' '));
		last_name=owner.substring(owner.indexOf(' ')+1,owner.length());
		 

		rset=sessionBeanHP.setRset("select","SELECT email FROM home_user WHERE first_name='"+first_name+"' AND last_name='"+last_name+"'");
		while(rset.next())
		{	email_to=rset.getString(1); }
	 %>
          <td height="2" colspan="2" bgcolor="#99CCFF"> 
            <form method="get" action="http://161.246.5.152:8080/servlet/jmail">
              <div align="center"> 
                <input type="submit" name="confirm" value="OK.">
                <input type="hidden" name="project_id" value="<%=project_id%>">
                <input type="hidden" name="home_id" value="<%=home_id%>">

                <input type="hidden" name="to" value="<%=email_to%>">
                <input type="hidden" name="from" value="<%=email_from%>">
                <input type="hidden" name="topic" value="Your home has been pre-reservation by  K.<%=reservename%>">
                <input type="hidden" name="message" value="Your home has been pre-reservation by  \n K.<%=reservename%>  \n Web master Home Project \nThank you">
              </div>
            </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%}
else 
{%> 

<form method="post" action="">
  <table width="98%" border="0">
    <tr> 
      <td bgcolor="#006666" width="50%" height="421"> 
        <table width="99%" border="0" align="center" height="98%">
          <tr> 
            <td height="30" colspan="2" bgcolor="#9999FF">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">โครงการ </font></div>
            </td>
            <td height="30" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=project_name%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="30" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">เจ้าของ</font></div>
            </td>
            <td height="30" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=owner%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="30" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ชื่อบ้าน 
                </font></div>
            </td>
            <td height="30" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"> <%=home_name%> 
                </font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ประเภท </font></div>
            </td>
            <td height="30" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"> <%=type%> 
                </font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ต้องการ </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=need%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">พื้นที่ </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=area%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ราคา </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=price%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ชั้น </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=stage%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ห้องนอน </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=bedroom%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">ห้องน้ำ </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=bathroom%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">รายละเอียดเพิ่มเติม</font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font face="MS Sans Serif" size="1"><%=detail%></font></div>
            </td>
          </tr>
          <tr>
            <td height="26" width="28%" bgcolor="#CCFFFF">
              <div align="right"><font face="MS Sans Serif" size="2">ติดต่อ </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC">
              <div align="center"><font face="MS Sans Serif" size="1"><%=contact%></font></div>
            </td>
          </tr>
	  
	   <%if(!sessionBeanHP.getUserStatus().equals("login_fail")&&status.equals("empty")){%> 
          <tr> 
            <td height="26" width="28%" bgcolor="#CCFFFF"> 
              <div align="right"><font face="MS Sans Serif" size="2">วันทำสัญญา 
                </font></div>
            </td>
            <td height="26" width="72%" bgcolor="#FFCCCC"> 
              <div align="center"><font size="2" face="CordiaUPC">
                <select name="contractdd">
                  <option value="1" selected>1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">19</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                </font>/<font size="2" face="CordiaUPC">
                <select name="contractmm">
                  <option value="ม.ค." selected>มกราคม </option>
                  <option value="ก.พ.">กุมภาพันธ์ </option>
                  <option value="มี.ค.">มีนาคม </option>
                  <option value="เม.ย.">เมษายน </option>
                  <option value="พ.ค.">พฤษภาคม </option>
                  <option value="มิ.ย.">มิถุนายน </option>
                  <option value="ก.ค.">กรกฎาคม </option>
                  <option value="ส.ค.">สิงหาคม </option>
                  <option value="ก.ย.">กันยายน </option>
                  <option value="ต.ค.">ตุลาคม </option>
                  <option value="พ.ย.">พฤศจิกายน </option>
                  <option value="ธ.ค.">ธันวาคม</option>
                </select>
                </font>/<%yearTemp=Integer.parseInt(alldate)+543;%>
                <input type="text" name="contractyy" size="4" maxlength="4" value="<%=yearTemp%>">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="51" colspan="2" bgcolor="#6666FF">
              <div align="center"> 
                <input type="submit" name="prereserve" value="Pre-Reservation">
              </div>
               </td>
          </tr>
	  <%}
	      %>
        </table>
      </td>
      <td width="50%" height="421">
        	<%if(project_id>0&&(!need.equals("เช่า"))){%>
			      <%rset=sessionBeanHP.setRset("select","SELECT rate FROM home_project WHERE project_id="+project_id);
					rset.next();
					rate=rset.getFloat(1);
				%>
		 <%action=request.getParameter("TestPayment");
			if(action==null || action.equals(""))
				   action="none";
		         if(!action.equals("none"))
			 {   yearT=request.getParameter("year");
			      if(yearT==null || yearT.equals(""))
					yearT="0";
			      year=Integer.parseInt(yearT);
			      switch (year)
				{
				case 0: tax=1; break;
				case 5:  {   if (rate==7) tax=0.019801f;if (rate==7.5) tax=0.020038f;if (rate==8) tax=0.020276f;if (rate==8.5) tax=0.020517f;if (rate==9) tax=0.020758f;
						} break;
				case 10:  {if (rate==7) tax=0.011611f;if (rate==7.5) tax=0.011870f;if (rate==8) tax=0.012133f;if (rate==8.5) tax=0.012399f;if (rate==9) tax=0.012668f;
						} break;
				case 15:  {if (rate==7) tax=0.008988f;if (rate==7.5) tax=0.009270f;if (rate==8) tax=0.009557f;if (rate==8.5) tax=0.009847f;if (rate==9) tax=0.010143f;
				  		 } break;
				case 20:  {if (rate==7) tax=0.007753f;if (rate==7.5) tax=0.008056f;if (rate==8) tax=0.008364f;if (rate==8.5) tax=0.008678f;if (rate==9) tax=0.008997f;
						} break;
				}
		        }
		  %>
  	    
	    <table width="99%" border="0" align="center" bgcolor="#FF9999">
            <tr> 
            <td> 
            <table width="99%" border="1" bgcolor="#CCCCFF" align="center">
             <tr bgcolor="#000000"> 
             <td colspan="5"> 
              <div align="center"><font face="CordiaUPC" size="3"><b><font color="#33CCFF">ทดสอบการชำระเงิน</font></b></font></div>
              </td>
              </tr>
              <tr> 
               <td width="50%" bgcolor="#CCCCCC"> 
               <div align="center"><b><font face="CordiaUPC" size="3">ราคาบ้าน</font></b></div>
               </td>
               <td width="50%" colspan="4"> 
               <div align="center"><font face="MS Sans Serif" size="1"><%=price%></font></div>
               </td>
               </tr>
               <tr> 
               <td width="50%" bgcolor="#CCCCCC" height="34"> 
               <div align="center"><b><font face="CordiaUPC" size="3">อัตราดอกเบี้ย</font></b></div>
               </td>
               <td width="50%" colspan="4" height="34"> 
               <div align="center"><font face="MS Sans Serif" size="1"><%=rate%> 
               </font> </div>
               <div align="center"></div>
               </td>
               </tr>
               <tr> 
                <td width="50%" bgcolor="#CCCCCC"> 
                <div align="center"><b><font face="CordiaUPC" size="3">ระยะเวลาการชำระเงิน</font></b></div>
                  </td>
                  <td width="50%"> 
                    <table width="100%">
                      <tr> 
                        <td width="25%"> <font face="MS Sans Serif" size="1"> 
                          <input type="radio" name="year" value="5" <%if(year==5){%>checked<%} %>  >
                          5 ปี</font> </td>
                        <td width="25%"> <font face="MS Sans Serif" size="1"> 
                          <input type="radio" name="year" value="10" <%if(year==10){%>checked<%} %>>
                          10 ปี </font> </td>
                        <td width="25%"> <font face="MS Sans Serif" size="1"> 
                          <input type="radio" name="year" value="15" <%if(year==15){%>checked<%} %>>
                          15 ปี</font> </td>
                        <td width="25%"> <font face="MS Sans Serif" size="1"> 
                          <input type="radio" name="year" value="20" <%if(year==20) {%>checked<%} %>>
                          20 ปี</font> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td width="50%" bgcolor="#CCCCCC"> 
                    <div align="center"><b><font face="CordiaUPC" size="3">สัดส่วนอัตราดอกเบี้ยต่อระยะเวลา</font></b></div>
                  </td>
                  <td width="50%" colspan="4"> 
                    <div align="center"><font face="MS Sans Serif" size="1"><%=tax%> 
                      </font> </div>
                  </td>
                </tr>
                <tr> 
                  <td width="50%" bgcolor="#CCCCCC"> 
                    <div align="center"><b><font face="CordiaUPC" size="3">จำนวนเงินที่จะชำระแต่ละเดือน</font></b></div>
                  </td>
                  <td width="50%" colspan="4"> 
                    <div align="center"><font face="MS Sans Serif" size="1"><%month_payment=tax*price;%> 
                      <%=month_payment%> 
		      <%--<input  type="hidden" name="month_payment"  value="<%=month_payment%>">
		      <input  type="hidden" name="tax" value="<%=tax%>"> --%>

		      </font> </div>
                  </td>
                </tr>
                <tr bgcolor="#009999"> 
                  <td colspan="5" height="2"> 
                    <div align="center"> 
                      <input type="submit" name="TestPayment" value="Submit">
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
       <%}else{%> 
		<input  type="hidden" name="year" value="1"><%}
	     %>

      <br>   <br>     <br>     <br>     <br>     <br>  <br><br>
      </td>
    </tr>
  </table>
    <input type="hidden" name="project_id" value="<%=project_id%>">
  <input type="hidden" name="home_id" value="<%=home_id%>">
</form>
<%}
%>
<br>
<div align="left"></div>
<div align="center"><a href="HPallhome.jsp"><img src="/www/picture/logo/back1.gif" width="104" height="82" border="0" title="โชว์รายการทั้งหมด"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
