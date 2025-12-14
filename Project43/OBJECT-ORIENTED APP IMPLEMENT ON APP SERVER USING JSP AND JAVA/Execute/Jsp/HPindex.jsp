<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=Windows-874" %>


<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session"/>
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean"  scope="session"/>
<jsp:setProperty name="sessionBeanHP" property="*"/>


<%! String username,password,status,action,first_name,last_name;%>
<%! ResultSet rset=null;
	HttpSession sessioin;
%>
<%session=request.getSession(true);%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPindex.jsp");%>

<html>
<head>
<title>Home Project</title>
</head>

<body bgcolor="#FFFFFF">
<div align="center"><img src="/www/picture/logo/Home_Project.gif" width="554" height="120"><br>
</div>
<table width="92%" border="0" align="center">
  <tr bgcolor="#0000FF"> 
    <td colspan="3" height="5"> 
      <p>&nbsp;</p>
      </td>
  </tr>
  <tr> 
    <td width="24%" height="10%">

   <%if(sessionBeanHP.getUserStatus().equals("guest")||sessionBeanHP.getUserStatus().equals("login_fail"))
           {%>
	      <%username=request.getParameter("username");%> 
	      <%password=request.getParameter("password");%> 
	    <%}

   %>
   <%action=request.getParameter("action");%> 
   <%if(action==null||action.equals(""))
				action="none";
          if(action.equals("logout")){
		  sessionBeanHP.setUsername("guest");
  		  sessionBeanHP.setUserStatus("login_fail");
		  username="";
		  password="";
		  }
	if(username==null || username.equals(""))
		username="none";
	if(password==null || password.equals(""))
		password="none";
%> 
<%if( username.equals("none")  && password.equals("none")&&sessionBeanHP.getUserStatus().equals("login_fail") )  {%> 
	<%@include  file="_HPlogin.html"%>
   <%}
   else if(!sessionBeanHP.getUserStatus().equals("login_fail")&&!(sessionBeanHP.getUsername().equals("guest")))
            {%>  <%@include  file="_HPloginok.html"%><%}
   else   {%> 
                <%action=request.getParameter("Submit");
		    if(action==null || action.equals(""))
				action="none";
		    else if(action.equals("login")&& !username.equals("none")&& !password.equals("none") )
   	            {%> <%status=sessionBeanHP.setLogin(username,password); %>
		             <%if(status.equals("login_fail"))                 {%> <%@include  file="_HPloginfail.html"%>  <%} 	 
				else{%>	<%@include  file="_HPloginok.html"%><%}
			     
			     %> 

  		     <%}
		 %>
		<%}
%>
   </td>
    <td width="54%" height="10%"> 
      <table width="99%" border="0" bgcolor="#0000FF">
        <tr> 
          <td> 
            <table width="99%" border="0" bgcolor="#FFFFFF" align="center">
              <tr> 
                <td> 
                  <table width="50%" border="0" align="center">
                    <tr bgcolor="#66CCFF"> 
                      <td> 
                        <div align="center"><font face="MS Sans Serif" size="1">ข่าวอสังหาริมทรัพย์  </font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
               <%if(sessionBeanHP.getUserStatus().equals("dba")||sessionBeanHP.getUserStatus().equals("webmaster"))
			{%>
			      <tr>
			           <td height="18"> 
			                  <table width="50%" border="0" align="center">
				               <tr bgcolor="#FF6666"> 
				                <td width="33%" height="20"> 
					                
                        <div align="center"><font face="MS Sans Serif" size="1"> 
                          <a href="HPdelnews.jsp">ลบ </a></font></div>
				                 </td>
			                         <td width="33%" height="20"> 
				                        
                        <div align="center"><font face="MS Sans Serif" size="1"><a href="/jsp/HPaddnews.jsp">เพิ่ม</a></font></div>
				                 </td>
				                  <td width="34%" height="20"> 
					                 
                        <div align="center"><font face="MS Sans Serif" size="1"><a href="HPeditnews.jsp">แก้ไข</a></font></div>
				                  </td>
					    </tr>
			                  </table>
			                </td>
			            </tr>
	         	<%}
		%>
              <tr bgcolor="#FFFFCC">
	      <td height="135"> 
	      <%! int i=0;%> <% rset= sessionBeanHP.setRset("select","SELECT headnews,id  FROM  home_webnews ORDER BY 2 DESC");%> 
                  <%i=0;%> 
                  <ul>
                    <%while(rset.next()&&(i<5))
		    {%>   <li>
                      <div align="left"><font face="MS Sans Serif" size="1"><a href="HPnews.jsp?id=<%=rset.getInt(2)%>"> 
                        <%=rset.getString(1)%> </a> </font></div>
                    </li>
                    <%i++;%> <%}
                     %> 
                  </ul>
                </td>
              </tr>
              <tr> 
                <td height="2"> 
                  <div align="center"> 
		  <a href="<%=response.encodeURL("HPallnews.jsp")%>"><img src="/www/picture/next.gif" width="47" height="23" border="0"></a> 
                    <input type="hidden" name="action" value="news">
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="22%" height="10%"> 
      <table width="99%" border="0" bgcolor="#0000FF">
        <tr> 
          <td> 
            <table width="99%" border="0" bgcolor="#FFFFFF" align="center">
              <tr> 
                <td> 
                  <table width="75%" border="0" align="center">
                    <tr bgcolor="#9966FF"> 
                      <td> 
                        <div align="center"><font face="MS Sans Serif" size="1"><b><font color="#FFFFFF">มุมนักตกแต่ง</font></b></font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

		 <%if(sessionBeanHP.getUserStatus().equals("dba")||sessionBeanHP.getUserStatus().equals("webmaster"))
			{%>
			      <tr>
			           <td height="18"> 
			                  <table width="50%" border="0" align="center">
				               <tr bgcolor="#FF6666"> 
				                <td width="33%" height="20"> 
					                
                        <div align="center"><font face="MS Sans Serif" size="1"> 
                          <a href="HPdelinterior.jsp">ลบ </a></font></div>
				                 </td>
			                         <td width="33%" height="20"> 
				                        
                        <div align="center"><font face="MS Sans Serif" size="1"><a href="/jsp/HPaddinterior.jsp">เพิ่ม</a></font></div>
				                 </td>
				                  <td width="34%" height="20"> 
					                 
                        <div align="center"><font face="MS Sans Serif" size="1"><a href="HPeditinterior.jsp">แก้ไข</a></font></div>
				                  </td>
					    </tr>
			                  </table>
			                </td>
			            </tr>
	         	<%}
		%>

		<tr bgcolor="#FFFFCC">
	      <td height="135"> 
	      <% rset= sessionBeanHP.setRset("select","SELECT headnews,id  FROM  home_interior ORDER BY 2 DESC");%> 
                  <%i=0;%> 
                  <ul>
                    <%while(rset.next()&&(i<5))
		    {%>   <li>
                      <div align="left"><font face="MS Sans Serif" size="1"><a href="HPinterior.jsp?id=<%=rset.getInt(2)%>"> 
                        <%=rset.getString(1)%> </a> </font></div>
                    </li>
                    <%i++;%> <%}
                     %> 
                  </ul>
                </td>
              </tr>
              <tr> 
                <td height="2"> 
                  <div align="center"> <a href="HPallinterior.jsp"><img src="/www/picture/next.gif" width="47" height="23" border="0"></a> 
                    <input type="hidden" name="action" value="news">
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td width="24%" height="27%"> 
      <table width="100%" border="0">
        <tr bgcolor="#3333FF"> 
          <td> 
            <table width="99%" border="0" bgcolor="#CCFFFF" align="center">
              <tr bgcolor="#FFFF33"> 
                <td> 
                  <div align="center"><font face="MS Sans Serif" size="1" color="#FF0000"><b><font color="#0000FF"><a href="HPregistration.jsp">สมัครสมาชิก</a></font></b></font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td height="27%"> <br>
    </td>
    <td height="27%"> 
      <table width="100%" border="0">
        <tr bgcolor="#3333FF"> 
          <td> 
            <table width="99%" border="0" bgcolor="#CCFFFF" align="center">
              <tr bgcolor="#003333"> 
                <td> 
                  <div align="center"><font face="MS Sans Serif" size="1" color="#FF0000"><b><font color="#CCCCCC">เว็บบอร์ดคนรักบ้าน</font></b></font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="200"> 
      <table width="99%" border="0" bgcolor="#0000FF">
        <tr> 
          <td> 
            <table width="99%" border="0" bgcolor="#FFFFFF" align="center">
              <tr> 
                <td> 
                  <table width="75%" border="0" align="center">
                    <tr bgcolor="#FFCCCC"> 
                      <td> 
                        <div align="center"><font face="MS Sans Serif" size="1"><b><font color="#0000FF">ประกาศขาย/ให้เช่า 
                          อสังหาริมทรัพย์</font></b></font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            <%if(sessionBeanHP.getUserStatus().equals("dba")||sessionBeanHP.getUserStatus().equals("webmaster"))
	         {%>
	      <tr>
                <td height="17"> 
                  <table width="75%" border="0" align="center">
                    <tr bgcolor="#FF6666"> 
                      <td width="33%" bgcolor="#FF6666" height="13"> 
                        <div align="center"><font face="CordiaUPC"><font face="CordiaUPC"><font face="MS Sans Serif" size="1">ลบ</font><font size="1"></font></font></font></div>
                      </td>
                      <td width="33%" height="13"> 
                        <div align="center"></div>
                      </td>
                      <td width="33%" height="13"> 
                        <div align="center"><font face="MS Sans Serif" size="1">แก้ไข</font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
	      <%}
	      %>
              <tr bgcolor="#CCCCFF"> 
                <td height="2"> 
		  <%rset= sessionBeanHP.setRset("select","SELECT DISTINCT  home_name,home_id,project_id  FROM  home WHERE status='empty'   ORDER BY 2 DESC");%> 
                  <%i=0;%> <%while(rset.next()&&(i<5)) 
			{%> 
                  <div align="center"><font face="MS Sans Serif" size="1"> <a href="HPhome.jsp?Hid=<%=rset.getInt(2)%>&Pid=<%=rset.getInt(3)%>"> 
                    <%=rset.getString(1)%></a><BR>
                    <%i++;%> </font></div>
                  <%}     
		    %> </td>
              </tr>
              <tr> 
                <td height="2"> 
                  <div align="center"> <a href="HPallhome.jsp"><img src="/www/picture/next.gif" width="47" height="23" border="0"></a></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td height="200"> 
      <table width="100%" border="0" bgcolor="#FF6666">
        <tr> 
          <td> 
            <table width="99%" border="0" bgcolor="#FFFFFF" align="center">
              <tr> 
                <td height="28"> 
                  <table width="50%" border="0" align="center">
                    <tr bgcolor="#66CCFF"> 
                      <td> 
                        <div align="center"><font face="MS Sans Serif" size="1" color="#FF0033"><b>ดูแลรักษาบ้าน</b></font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

<%if(sessionBeanHP.getUserStatus().equals("dba")||sessionBeanHP.getUserStatus().equals("webmaster"))
			{%>
			      <tr>
			           <td height="18"> 
			                  <table width="50%" border="0" align="center">
				               <tr bgcolor="#FF6666"> 
				                <td width="33%" height="20"> 
					                
                        <div align="center"><font face="MS Sans Serif" size="1"> 
                          <a href="HPdelhomecare.jsp">ลบ </a></font></div>
				                 </td>
			                         <td width="33%" height="20"> 
				                        
                        <div align="center"><font face="MS Sans Serif" size="1"><a href="/jsp/HPaddhomecare.jsp">เพิ่ม</a></font></div>
				                 </td>
				                  <td width="34%" height="20"> 
					                 
                        <div align="center"><font face="MS Sans Serif" size="1"><a href="HPedithomecare.jsp">แก้ไข</a></font></div>
				                  </td>
					    </tr>
			                  </table>
			                </td>
			            </tr>
	         	<%}
		%>

              <tr bgcolor="#CCCCFF"> 
                <td height="2"> 

		 <% rset= sessionBeanHP.setRset("select","SELECT headnews,id  FROM  home_care ORDER BY 2 DESC");%> 
                  <%i=0;%> 
                  <ul>
                    <%while(rset.next()&&(i<5))
		    {%>   <li>
                      <div align="left"><font face="MS Sans Serif" size="1"><a href="HPhomecare.jsp?id=<%=rset.getInt(2)%>"> 
                        <%=rset.getString(1)%> </a> </font></div>
                    </li>
                    <%i++;%> 
		    <%}
                     %> 
                  </ul>
                </td>
              </tr>
              <tr> 
                <td height="2"> 
                  <div align="center"> <a href="HPallhomecare.jsp"><img src="/www/picture/next.gif" width="47" height="23" border="0"></a> 
                    <input type="hidden" name="action" value="news">
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td height="200"> 
      <table width="96%" border="0" bgcolor="#0000FF" height="213">
        <tr> 
          <td height="148"> 
            <table width="100%" border="0" bgcolor="#FFFFFF" align="center" height="203">
              <tr> 
                <td> 
                  <table width="68%" border="0" align="center">
                    <tr bgcolor="#FFFFCC"> 
                      <td> 
                        <div align="center"><font face="MS Sans Serif" size="1" color="#336600"><b>อุปกรณ์ตกแต่งบ้าน</b></font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
           <%if(sessionBeanHP.getUserStatus().equals("dba")||sessionBeanHP.getUserStatus().equals("webmaster"))
	{%>
	      <tr>
                <td height="24"> 
                  <table width="68%" border="0" align="center">
                    <tr bgcolor="#FF6666"> 
                      <td width="33%" bgcolor="#FF6666"> 
                        <div align="center"><font face="MS Sans Serif" size="1"><font color="#000000">ลบ</font></font></div>
                      </td>
                      <td width="33%"> 
                        <div align="center"><font face="MS Sans Serif" size="1">เพิ่ม</font></div>
                      </td>
                      <td width="33%"> 
                        <div align="center"><font face="MS Sans Serif" size="1">แก้ไข</font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
	      <%}
	      %>
              <tr bgcolor="#CCCCFF"> 
                <td height="199"> 
                  <div align="left"> 
                    <ul>
                      <li> <font face="MS Sans Serif" size="1"><a href="HPindex.jsp">ห้องนอน</a></font></li>
                      <li> <font face="MS Sans Serif" size="1"><a href="HPindex.jsp">ห้องนั่งเล่น</a></font></li>
                      <li> <font face="MS Sans Serif" size="1"><a href="HPindex.jsp"> 
                        ห้องน้ำ</a></font></li>
                      <li> <font face="MS Sans Serif" size="1"> <a href="HPindex.jsp">ห้องครัว</a></font></li>
                      <li> <font face="MS Sans Serif" size="1"><a href="HPindex.jsp"> 
                        ห้องทำงาน</a></font></li>
                      <li> <font face="MS Sans Serif" size="1"><a href="HPindex.jsp"> 
                        โรงรถและห้องเก็บอุปกรณทำสวน</a></font></li>
                    </ul>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td width="24%" height="10%"> 
      <table width="100%" border="0">
        <tr bgcolor="#3333FF"> 
          <td> 
            <table width="99%" border="0" bgcolor="#CCFFFF" align="center">
              <tr bgcolor="#CCFFCC"> 
                <td> 
                  <div align="center"><font face="MS Sans Serif" size="1" color="#FF0000"><b><a href="/jsp/HPshowhome.jsp">ค้นหาบ้าน</a></b></font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="54%" height="10%"> 
      <table width="100%" border="0" height="22">
        <tr bgcolor="#3333FF"> 
          <td height="26"> 
            <table width="99%" border="0" bgcolor="#CCFFFF" align="center">
              <tr> 
                <td> 
                  <div align="center"><font face="MS Sans Serif" size="1" color="#FF0000"><b>โครงการบ้านที่น่าสนใจ</b></font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="22%" height="10%"> 
      <table width="100%" border="0">
        <tr bgcolor="#3333FF"> 
          <td> 
            <table width="99%" border="0" bgcolor="#CCFFFF" align="center">
              <tr bgcolor="#FFCCFF"> 
                <td> 
                  <div align="center"><font face="MS Sans Serif" size="1" color="#FF0000"><b>อัตราดอกเบี้ย</b></font></div>
                </td>
              </tr>
<%if(sessionBeanHP.getUserStatus().equals("dba")||sessionBeanHP.getUserStatus().equals("webmaster"))
	{%>
	      <tr bgcolor="#FFFFFF"> 
                <td>
                  <table width="50%" border="0" align="center">
                    <tr bgcolor="#FF6666"> 
                      <td width="33%" bgcolor="#FF6666"> 
                        <div align="center"><font face="MS Sans Serif" size="1"><font color="#000000">ลบ</font></font></div>
                      </td>
                      <td width="33%"> 
                        <div align="center"><font face="MS Sans Serif" size="1">เพิ่ม</font></div>
                      </td>
                      <td width="33%"> 
                        <div align="center"><font face="MS Sans Serif" size="1">แก้ไข</font></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
      <%}
      %>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>



</body>
</html>
