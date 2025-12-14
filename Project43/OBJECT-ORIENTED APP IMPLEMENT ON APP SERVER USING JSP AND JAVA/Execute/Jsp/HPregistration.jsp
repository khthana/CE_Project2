<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>
<%! String username,password,password2,status,action,first_name,last_name,birthdd,birthmm,birthyy,address,telephone,email,type;%>
<%! boolean allcheck=false,passwordcheck=false,usernamecheck=false,datecheck=false;%>
<%! ResultSet rset=null;%>
<%! int i=0; String insertstring="";%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>


<html>
<head>
<title>สมัครสมาชิก Home Project</title>
</head>
<body bgcolor="#FFFFFF">

<%  first_name=request.getParameter("first_name");
	last_name=request.getParameter("last_name");
	address=request.getParameter("address");
	telephone=request.getParameter("telephone");
	email=request.getParameter("email");
	username=request.getParameter("username");
	password=request.getParameter("password");
	password2=request.getParameter("password2");
	birthdd=request.getParameter("birthdd");
	birthmm=request.getParameter("birthmm");
	birthyy=request.getParameter("birthyy");
	type=request.getParameter("type");

	if(first_name==null || first_name.equals(""))
		first_name="-";

	if(last_name==null || last_name.equals(""))
		last_name="-";
	
	if(address==null || address.equals(""))
		address="-";

	if(telephone==null || telephone.equals(""))
		telephone="-";
	
	if(email==null || email.equals(""))
		email="-";
	
	if(username==null || username.equals(""))
		username="-";
	
	if(password==null || password.equals(""))
		password="-";
	
	if(password2==null || password2.equals(""))
		password2="-";
	
	if(birthdd==null || birthdd.equals(""))
		birthdd="0";
	
	if(birthmm==null || birthmm.equals(""))
		birthmm="0";
	
	if(birthyy==null || birthyy.equals(""))
		birthyy="0";
	
	if(type==null|| type.equals(""))
		type="customer";
	if((!password.equals("-")||!password2.equals("-"))&&(i==1)) 
	{
			if(password.equals(password2))
				passwordcheck=true;
			else
				passwordcheck=false;
	}
	if( (birthmm.equals("เม.ย.")||birthmm.equals("มิ.ย.")||birthmm.equals("ก.ย.")||birthmm.equals("พ.ย."))&&(birthdd.equals("31")))
		datecheck=false;
	else if(birthmm.equals("ก.พ.")&&(birthdd.equals("30")||birthdd.equals("31")) )
		datecheck=false;
	else 
		datecheck=true;

	if(!username.equals("-")) {
		rset=sessionBeanHP.setRset("select","SELECT  username FROM home_user WHERE username='"+username+"'");
		if(rset.next())
			usernamecheck=false;
		else
			usernamecheck=true;
	}
	if(first_name.equals("-")&&last_name.equals("-")&&address.equals("-")&&telephone.equals("-")&&email.equals("-")&&username.equals("-")&&password.equals("-")&&password2.equals("-")&&birthyy.equals("0"))
		i=0;
	if(first_name.equals("-")||last_name.equals("-")||address.equals("-")||telephone.equals("-")||email.equals("-")||username.equals("-")||password.equals("-")||password2.equals("-")||birthyy.equals("0")||passwordcheck==false||usernamecheck==false||datecheck==false)
	{	allcheck=false;}
	else
		allcheck=true;
%>
<table width="83%" border="0" align="center">
  <tr> 
    <td colspan="3"> 
      <div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_Project.gif" width="554" height="120"></a></div>
      <div align="center"></div>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <div align="center"><font face="MS Sans Serif" size="2">เชิญสมัครเป็นสมาชิก 
        Home Projectวันนี้ คุณจะได้รับสิทธิประโยชน์มากมาย ที่เราเตรียมไว้เฉพาะสมาชิกเท่านั้น 
        ไม่ต้องเสียค่าใช้จ่าย และไม่มีข้อผูกมัดใดๆ </font></div>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <div align="center"></div>
      <div align="center"><font face="CordiaUPC" size="4">เช่น คุณสามารถประกาศขาย/ให้เช่าบ้านฟรี 
        และคุณสามารถเปลี่ยนแปลงแก้ไขประกาศของคุณได้เอง</font></div>
    </td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#009999" align="center" valign="middle"> 
    <td colspan="3"> 
      <table width="820" border="0" bgcolor="#FFFFFF" height="101%" align="center">
        <tr bgcolor="#006666"> 
          <td> 
	   <%if(!allcheck)  {%>
	
	    <form method="post" action="">
              <table width="800" border="0" align="center" height="98%">
                <tr> 
                  <td rowspan="11" height="163" bgcolor="#009999" width="4%">&nbsp;</td>
                  <td colspan="2" bgcolor="#66CCCC" height="5"><font face="CordiaUPC" size="1"></font></td>
                  <td rowspan="11" height="163" width="5%" bgcolor="#009999">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="28"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">ชื่อ</font></b></font></div>
                  </td>
                  <td width="56%" height="28">
				<font face="CordiaUPC" size="4"> 
                    <%if(first_name.equals("-")&&(i==1)){ %> <b><font color="#FF0000" size="6">[</font></b>  <%} %>
				</font> 

		
                    <input type="text" name="first_name" size="15"  <%if(!first_name.equals("-")&&(i==1))  {%>   value="<%=first_name%>"   <%} %> maxlength="20" >
				<font face="CordiaUPC" size="4"> 
	  	                <%if(first_name.equals("-")&&(i==1)){ %> <b><font color="#FF0000" size="6">]</font></b>  <%} %>
				</font> 
			</td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="15"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">นามสกุล</font></b></font></div>
                  </td>
                  <td width="56%" height="15"> 
				<font face="CordiaUPC" size="4"> 
			        <%if(last_name.equals("-")&&(i==1)){ %> <b><font color="#FF0000" size="6">[</font></b>  <%} %>
				</font> 
		            <input type="text" name="last_name" size="15" <%if(!last_name.equals("-")&&(i==1))  {%>   value="<%=last_name%>"   <%} %> maxlength="20">
				<font face="CordiaUPC" size="4"> 
	  	                <%if(last_name.equals("-")&&(i==1)){ %> <b><font color="#FF0000" size="6">]</font></b>  <%} %>
				</font> 
	        </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="23"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">วัน/เดือน/ปี 
                      เกิด</font></b></font></div>
                  </td>
                  <td width="56%" height="23"> <font size="2" face="CordiaUPC"> 
		  <%if(datecheck==false){%> <b><font color="#FF0000" size="6">[</font></b>  <%} %>

		    <select name="birthdd">
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
                    <select name="birthmm">
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
    		  <%if(datecheck==false){%> <b><font color="#FF0000" size="6">]</font></b>  <%} %>
                    </font>/ 
			    	<font face="CordiaUPC" size="4"> 
			        <%if(birthyy.equals("0")&&(i==1)){ %> <b><font color="#FF0000" size="6">[</font></b>  <%} %>
				</font> 
                    <input type="text" name="birthyy" size="4" maxlength="4" <%if(!birthyy.equals("0")&&(i==1))  {%>   value="<%=birthyy%>"   <%} %>>
				<font face="CordiaUPC" size="4" > 
			        <%if(birthyy.equals("0")&&(i==1)){ %> <b><font color="#FF0000" size="6">]</font></b>  <%} %>
				</font> 
		  
		  </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="17"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">ที่อยู่</font></b></font></div>
                  </td>
                  <td width="56%" height="17"> 
			    	<font face="CordiaUPC" size="4"> 
			        <%if(address.equals("-")&&(i==1)){ %> <b><font color="#FF0000" size="6">[</font></b>  <%} %>
				</font> 
                                
                    <input type="text" name="address" size="50"   <%if(!address.equals("-")&&(i==1))  {%>   value="<%=address%>"   <%} %> maxlength="50">
                  	    	<font face="CordiaUPC" size="4"> 
			        <%if(address.equals("-")&&(i==1)){ %> <b><font color="#FF0000" size="6">]</font></b>  <%} %>
				</font> 
		 </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="22"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">เบอร์โทรศัพท์</font></b></font></div>
                  </td>
                  <td width="56%" height="22"> 
			        <%if(telephone.equals("-")&&(i==1)){ %> <b><font face="CordiaUPC" size="6"> <font color="#FF0000">[</font></font></b>  <%} %>
			         
                    <input type="text" name="telephone" size="15" <%if(!telephone.equals("-")&&(i==1))  {%>   value="<%=telephone%>"   <%} %> maxlength="15">
		                 <font face="CordiaUPC" size="4"> 
			        <%if(telephone.equals("-")&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >]</font></font></b>  <%} %>
				 
		  </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="20"> 
                     <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">Email 
                      Address</font></b></font></div>
                  </td>
                  <td width="56%" height="20"> 
		        <%if(email.equals("-")&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >[</font></font> </b>  <%} %>
	                <input type="text" name="email" size="15" <%if(!email.equals("-")&&(i==1))  {%>   value="<%=email%>"   <%} %> maxlength="30">
		        <%if(email.equals("-")&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >]</font></font></b>  <%} %>
                  </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="24"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">Username 
                      ที่ต้องการ</font></b></font></div>
                  </td>
                  <td width="56%" height="24"> 
			       <%if((usernamecheck==false||username.equals("-"))&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >[</font></font> </b>  <%} %>
		               
                    <input type="text" name="username" size="15" <%if(!username.equals("-")&&(i==1))  {%>   value="<%=username%>"   <%} %> maxlength="15">
				<%if((usernamecheck==false||username.equals("-"))&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >]
							<%if(usernamecheck==false){%> <font face="MS Sans Serif" size="1">username ที่ท่านต้องการซ้ำกับผู้ใช้ท่านอื่น </font>    <%} %></font></font> </b>  <%} %>
                  </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666" height="19"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">รหัสผ่าน</font></b></font></div>
                  </td>
                  <td width="56%" height="19"> <%if(    ((passwordcheck==false)||password.equals("-"))&&(i==1)   )
						{ %><b><font face="CordiaUPC" size="6"><font color="#FF0000" >[</font></font> 
                    </b> <%} 
			%> 
                    <input type="password" name="password" size="15" <%if(!password.equals("-")&&(i==1))  {%>   value="<%=password%>"   <%} %> maxlength="20">
   			<%if(((passwordcheck==false)||password.equals("-"))&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >]<font face="MS Sans Serif" size="1">รหัสผ่านไม่ถูกต้อง(incorrect 
                    password) </font></font></font> </b>  <%} %>
                  </td>
                </tr>
                <tr> 
                  <td width="35%" bgcolor="#006666"> 
                    <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">ยืนยันรหัสผ่าน</font></b></font></div>
                  </td>
                  <td width="56%"> <%if(((passwordcheck==false)||password2.equals("-"))&&(i==1))
				{%> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >[</font></font> 
                    </b> <%} 
		%> 
                    <input type="password" name="password2" size="15" <%if(!password2.equals("-")&&(i==1))  {%>   value="<%=password2%>"   <%} %> maxlength="20">
		  <%if(((passwordcheck==false)||password2.equals("-"))&&(i==1)){ %> <b><font face="CordiaUPC" size="6"><font color="#FF0000" >]<font face="MS Sans Serif" size="1">รหัสผ่านไม่ถูกต้อง(incorrect 
                    password) </font></font></font> </b>  <%} %>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#66CCCC" height="5"> 
                    <div align="center"><font color="#FFFFCC"><b><font face="CordiaUPC"><font face="CordiaUPC"><font size="1">
			<%if(sessionBeanHP.getUserStatus().equals("dba")){ %>
				กรุณาเลือกประเภทกลุ่มของผู้ใช้		                      
                      <select name="type">
                        <option value="customer" selected>Customer</option>
				        <option value="dba">DBA</option>
		                        <option value="webmaster">Webmaster</option>
		                      </select>
				      <%}
				  %>
                      </font></font></font></b></font></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="4"> 
                    <div align="center"> 
                      <input type="submit" name="Submit" value="Submit">
                      <input type="reset" name="Submit2" value="Reset">
                    </div>
                  </td>
                </tr>
              </table>
              </form>
	      	<%if(i==0) i++;%>
		
	<%}	else {%> 
            
	        <table width="800" border="0" align="center" height="98%">
              <tr> 
                <td rowspan="11" height="163" bgcolor="#009999" width="4%">&nbsp;</td>
                <td colspan="2" bgcolor="#66CCCC" height="5"><font face="CordiaUPC" size="1"></font></td>
                <td rowspan="11" height="163" width="5%" bgcolor="#009999">&nbsp;</td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="28"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">ชื่อ</font></b></font></div>
                </td>
                <td width="56%" height="28"><font face="MS Sans Serif" size="1"><%=first_name%></font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="15"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">นามสกุล</font></b></font></div>
                </td>
                <td width="56%" height="15"><font face="MS Sans Serif" size="1"><%=last_name%></font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="23"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">วัน/เดือน/ปี 
                    เกิด</font></b></font></div>
                </td>
                <td width="56%" height="23"><font face="MS Sans Serif" size="1"><%=birthdd%>/<%=birthmm%>/<%=birthyy%></font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="17"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">ที่อยู่</font></b></font></div>
                </td>
                <td width="56%" height="17"><font face="MS Sans Serif" size="1"><%=address%></font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="22"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">เบอร์โทรศัพท์</font></b></font></div>
                </td>
                <td width="56%" height="22"><font face="MS Sans Serif" size="1"><%=telephone%></font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="20"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">Email 
                    Address</font></b></font></div>
                </td>
                <td width="56%" height="20"><font face="MS Sans Serif" size="1"><%=email%></font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="24"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">Username 
                    ที่ต้องการ</font></b></font></div>
                </td>
                <td width="56%" height="24"><font face="MS Sans Serif" size="1"><%=username%> 
                  </font></td>
              </tr>
              <tr> 
                <td width="35%" bgcolor="#006666" height="19"> 
                  <div align="right"><font color="#FFFFCC"><b><font face="CordiaUPC">รหัสผ่าน</font></b></font></div>
                </td>
                <td width="56%" height="19"><font face="MS Sans Serif" size="1"><%=password%> 
                  </font></td>
              </tr>
              <tr> 
                <td colspan="2" bgcolor="#006666"> 
                  <div align="center"><font face="MS Sans Serif" size="1" color="#FFFFFF">ทาง 
                    Home Project ขอขอบคุณที่สมัครเป็นสมาชิก</font></div>
                </td>
              </tr>
              <tr> 
                <td colspan="2" bgcolor="#66CCCC" height="5"> 
                  <div align="center"><font color="#FFFFCC"><b><font face="CordiaUPC"><font face="CordiaUPC"><font size="1"></font></font></font></b></font></div>
                </td>
              </tr>
              <tr> 
                <td colspan="4"> <%insertstring="INSERT INTO home_user(username,password,first_name,last_name,address,telephone,email,type,birthday) VALUES('"+username+"','"+password+"','"+first_name+"','"+last_name+"','"+address+"','"+telephone+"','"+email+"','"+type+"','"+birthdd+"-"+birthmm+"-"+birthyy+"')";%> 
                  <%sessionBeanHP.setRset("insert",insertstring);%>
		  <%if(sessionBeanHP.getStatus().equals("insert are processed")){%> 
                  <div align="center"><font face="MS Sans Serif" size="2" color="#FF00FF">การสมัครสมาชิกของท่าน 
                    เสร็จสมบูรณ</font><font color="#FF00FF">์</font> <%} else{%><font color="#CCFF00">เป็นอะไรไปหละเนี่ย</font><%} %> 
                  </div>
                </td>
              </tr>
            </table>
	  
	<%}
	%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
</div>
</body>
</html>
