<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=Windows-874" %>
<%!  ResultSet rset = null;
         java.util.Date date1 = new java.util.Date();
         String dateTemp;
	 String status,home_name="xxx",type="",need="",stage="",area="",project_idT="",project_name="";
	 String bedroom="",bathroom="",detail="",location="",price="",contact="",insertString="",username="",project_address="",project_contact="";
	 char xchar;
	 String owner="";
	 int intStage=0,intBedroom=0,intBathroom=0,intPrice=0,intArea=0,maxrow=0,project_id;
	String project_option="";
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
<body bgcolor="#FFFFFF" background="/www/picture/background/b_narak14.gif">


<table width="83%" border="0">
  <tr> 
    <td width="16%"><b><img src="/www/picture/logo/home2.gif" width="100" height="63"></b></td>
    <td width="80%"> 
      <div align="center"><b><font face="MS Sans Serif" size="4"><font color="#0000FF" size="6" face="CordiaUPC">ลงประกาศโฆษณาอาคารและที่ดิน</font></font></b></div>
    </td>
  </tr>
 </table>
 <table width="83%" border="0">
 <tr><div align="center"><font face="MS Sans Serif" size="4"><font color="#FF33FF" size="5"></font></font></div></tr>
</table>

<div align="center"><br>
 <a href="HPindex.jsp"><img src="/www/picture/logo/Home_Project.gif" width="199" height="53" border="0"></a><br></div>

<%if(sessionBeanHP.getUserStatus().equals("login_fail")) {%> 
	
<div align="center"> <b><font color="#006666">Access Denine !!! You don't permission 
  to access this page please contact administrator , thank you <BR>
  คุณไม่มีสิทธิในการเข้าใช้หน้าจอนี้ กรุณาติดต่อผู้ดูแลระบบ</font></b></div>
		<%} 

	else {%>


<%	home_name=request.getParameter("home_name");
	type= request.getParameter("type");
	need=request.getParameter("need");
	detail=request.getParameter("detail");
	location=request.getParameter("location");
	contact=request.getParameter("contact");
	
	stage=request.getParameter("stage"); 
	bedroom=request.getParameter("bedroom");
	bathroom=request.getParameter("bathroom");
	area=request.getParameter("area"); 
	price=request.getParameter("price");
	project_idT=request.getParameter("project_id");
%>
<%	if(project_idT==null || project_idT.equals(""))
		project_idT="0";
	if(home_name==null||home_name.equals(""))
		home_name="-";
         if(detail==null||detail.equals(""))
		detail="-";
      if(location==null||location.equals(""))
		location="-";
      if(contact==null||contact.equals(""))
		contact="-";
      if(stage==null||stage.equals(""))
		 stage="-";
     if(bedroom==null||bedroom.equals(""))
		bedroom="-";
     if(bathroom==null||bathroom.equals(""))
		bathroom="-";
      if(area==null||area.equals(""))
		area="-";
      if(price==null || price.equals(""))
		intPrice=0;
	else
	      intPrice=Integer.parseInt(price);
     if(!project_idT.equals("0")) {
               rset=sessionBeanHP.setRset("select","SELECT address,contact FROM home_project  WHERE project_id="+project_idT);
	       rset.next();
	       project_address=rset.getString(1);
	       project_contact=rset.getString(2);
	       }
%>
<%if(!home_name.equals("-")&&!detail.equals("-")){%>
		<%rset=sessionBeanHP.setRset("select","SELECT MAX(home_id)  FROM  home WHERE project_id="+project_idT);%>  
			<%  rset.next();
				maxrow=rset.getInt(1);%>
			
		
<table width="100%" border="0" align="center" height="250">
  <tr> 
    <td height="33"> 
      <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ชื่อโครงการ</font></b> 
        </font> </div>
    </td>
    <td width="18%" height="33"> <font face="MS Sans Serif" size="1" color="#FF6666"><%rset=sessionBeanHP.setRset("select","SELECT project_name FROM home_project WHERE project_id="+project_idT);
					    {%> <%rset.next();%> <%=rset.getString(1)%> <%}
					 %> </font></td>
    <td width="31%" height="33">&nbsp;</td>
    <td width="23%" height="33">&nbsp;</td>
  </tr>
  <tr> 
    <td> 
      <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ชื่อบ้าน</font></b> 
        </font> </div>
    </td>
    <td width="18%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=home_name%> </font> </b></font></div>
    </td>
    <td width="31%"> 
      <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ชนิดของอาคาร</font></b> 
        </font> </div>
    </td>
    <td width="23%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=type%></font> </b></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ต้องการ</font></b> 
        </font> </div>
    </td>
    <td colspan="3"> 
      <div align="left"><font color="#009999"><b><font face="MS Sans Serif" size="1"><%=need%></font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">เนื้อที่(ตารางวา)</font></b> 
        </font> </div>
    </td>
    <td width="18%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=area%></font> </b></font></div>
    </td>
    <td width="31%"> 
      <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">จำนวนชั้น</font></b> 
        </font> </div>
    </td>
    <td width="23%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=stage%></font> </b></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">จำนวนห้องนอน</font></b></font></div>
    </td>
    <td width="18%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=bedroom%></font></b></font></div>
    </td>
    <td width="31%"> 
      <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">จำนวนห้องน้ำ</font></b></font></div>
    </td>
    <td width="23%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=bathroom%></font></b></font></div>
    </td>
  </tr>
  <tr> 
    <th> 
      <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">รายละเอียดเพิ่มเติม</font></b></font></div>
    </th>
    <th colspan="3"> 
      <div align="left"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=detail%> </font></b></font></div>
    </th>
  </tr>
  <tr> 
    <td> 
      <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ที่อยู่</font></b></font></div>
    </td>
    <td colspan="3"> 
      <div align="left"><font color="#009999"><b><font face="MS Sans Serif" size="1"><%=location%> 
        </font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ราคา(บาท)</font></b></font></div>
    </td>
    <td width="18%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=intPrice%> </font></b></font></div>
    </td>
    <td width="31%"> 
      <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ติดต่อ</font></b></font></div>
    </td>
    <td width="23%"> 
      <div align="center"><font color="#009999"><b><font face="MS Sans Serif" size="1"> 
        <%=contact%> </font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4"> 
      <div align="left"> </div>
    </td>
  </tr>
</table>
<%++maxrow;%> <%rset=sessionBeanHP.setRset("select","SELECT first_name,last_name FROM home_user WHERE username='"+sessionBeanHP.getUsername()+"'");
	rset.next();
	owner=rset.getString(1)+" "+rset.getString(2);
%> <%insertString="INSERT INTO home(home_id,project_id,home_name,area,stage,bedroom,bathroom,price,contact,detail,type,need,location,status,owner)VALUES ";%> 
<%insertString=insertString+"("+maxrow+","+project_idT+",'"+home_name+"','"+area+"','"+stage+"','"+bedroom+"','"+bathroom+"',"+price+",'"+contact+"','"+detail+"','"+type+"','"+need+"','"+location+"','empty','"+owner+"')";%> 
<%sessionBeanHP.setRset("insert",insertString);%> <%}else{%> 
<form method="post" action="">
  <table width="100%" border="0" align="center">
    <%if(project_idT.equals("0")) {%> 
    <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ชื่อโครงการ</font></b> 
          </font></div>
      </td>
      <td width="18%"> <font face="MS Sans Serif" size="1" color="#009999">
      <%rset=sessionBeanHP.setRset("select","SELECT first_name,last_name FROM home_user WHERE username='"+sessionBeanHP.getUsername()+"'");
		rset.next(); 
		owner=rset.getString(1)+" "+rset.getString(2);
		project_option=" <select name=\"project_id\"><option value=\"0\" selected>--ไม่ระบุ--</option>";
		rset=sessionBeanHP.setRset("select","SELECT project_id,project_name FROM home_project WHERE owner='"+owner+"'");
             	while(rset.next())
		{   project_option+="<option value=\""+rset.getInt(1) +" \">"+rset.getString(2)+"</option>";
		}
                project_option+="</select>";
     %> 
     <%=project_option%> </font></td>
      <td width="31%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
    </tr>
    <%}
      %> 
     
      <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ชื่อ</font></b> 
          </font> </div>
      </td>
      <td width="18%"> <font color="#3333FF"> <b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="home_name">
        </font> </b> </font> </td>
      <td width="31%"> 
        <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ชนิดของอาคาร</font></b> 
          </font> </div>
      </td>
      <td width="23%"> <font color="#3333FF"> <b><font face="MS Sans Serif" size="2"> 
        <select name="type">
          <option value="บ้าน">บ้าน</option>
          <option value="ทาวน์เฮ้าส์">ทาวน์เฮาส์</option>
          <option value="ที่ดินเปล่า">ที่ดินเปล่า</option>
          <option value="อาคารพานิชย์">อาคารพานิชย์</option>
        </select>
        </font></b></font> </td>
    </tr>
    <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">ต้องการ</font></b> 
          </font> </div>
      </td>
      <td colspan="3"> 
        <table width="36%" border="0">
          <tr> 
            <td width="22%"> 
              <div align="right"><font color="#0000FF" size="1"> <b><font face="MS Sans Serif">ขาย</font></b> 
                </font> </div>
            </td>
            <td width="23%"> <font color="#0000FF"> <b><font face="MS Sans Serif" size="2"> 
              <input type="radio" name="need" value="ขาย" checked>
              </font></b></font> </td>
            <td width="25%"> 
              <div align="right"><font color="#0000FF" size="1"> <b><font face="MS Sans Serif">เช่า</font></b> 
                </font></div>
            </td>
            <td width="30%"> 
              <input type="radio" name="need" value="เช่า">
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">เนื้อที่(ตารางวา)</font></b> 
          </font> </div>
      </td>
      <td width="18%"> <font color="#3333FF"> <b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="area" size="5" maxlength="10">
        </font></b></font> </td>
      <td width="31%"> 
        <div align="right"><font color="#3333FF" size="1"> <b><font face="MS Sans Serif">จำนวนชั้น</font></b> 
          </font> </div>
      </td>
      <td width="23%"> <font color="#3333FF"> <b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="stage" size="5" maxlength="10">
        </font></b></font> </td>
    </tr>
    <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">จำนวนห้องนอน</font></b></font></div>
      </td>
      <td width="18%"> <font color="#3333FF"><b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="bedroom" size="5" maxlength="10">
        </font></b></font></td>
      <td width="31%"> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">จำนวนห้องน้ำ</font></b></font></div>
      </td>
      <td width="23%"> <font color="#3333FF"><b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="bathroom" size="5" maxlength="10">
        </font></b></font></td>
    </tr>
    <tr> 
      <th> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">รายละเอียดเพิ่มเติม</font></b></font></div>
      </th>
      <th colspan="3"> 
        <div align="left"><font color="#3333FF"><b><font face="MS Sans Serif" size="2"> 
          <input type="text" name="detail" size="40" maxlength="50" >
          </font></b></font></div>
      </th>
    </tr>
    <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ที่อยู่</font></b></font></div>
      </td>
      <td colspan="3"> <font color="#3333FF"><b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="location" size="40" maxlength="50" <%if(!project_idT.equals("0")){%> value="<%=project_address%>"<%}%>  >
	
        </font></b></font></td>
    </tr>
    <tr> 
      <td> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ราคา(บาท)</font></b></font></div>
      </td>
      <td width="18%"> <font color="#3333FF"><b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="price" size="10" maxlength="20">
        </font></b></font></td>
      <td width="31%"> 
        <div align="right"><font color="#3333FF" size="1"><b><font face="MS Sans Serif">ติดต่อ</font></b></font></div>
      </td>
      <td width="23%"> <font color="#3333FF"><b><font face="MS Sans Serif" size="2"> 
        <input type="text" name="contact" size="30" maxlength="50" <%if(!project_idT.equals("0")){%> value="<%=project_contact%>"<%}%>>
	</font></b></font></td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="left"> 
          <table width="75%" border="0" align="center">
            <tr> 
              <td width="44%" height="49"> 
                <div align="center"> 
                  <input type="image" border="0" name="submit" src="/www/picture/logo/a_downdisk.gif" width="50" height="40" title="บันทึกข้อมูล">
                  <input type="hidden" name="project_id" value=<%=project_idT%> >
                  <input type="hidden" name="project_name" value=<%=project_name%> >
                </div>
              </td>
              <td width="56%" height="49"> 
                <div align="center"> 
                  <input type="reset" name="Reset" value="Reset">
                </div>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
</form>
<%}
%>
<%}
%>

</body>
</html>
