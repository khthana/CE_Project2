<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>


<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session"/>
<jsp:setProperty name="webstatus" property="*"/>


<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session"/>
<jsp:setProperty name="sessionBeanHP" property="*"/>

<%! ResultSet rset=null;
	String id="",date_post;
	StringBuffer sb = new StringBuffer();
	StringBuffer sb2 = new StringBuffer();
	String newsid,where,query,action,type,home_name,need,project_name,owner,detail,project_id,home_id,owner2;
	String status,area,bedroom,bathroom,stage,contact,save,priceT;
	int pid,hid,price,contract_id;
	%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPedithome.jsp");%>

<html>
<head>
<title>แก้ไขข้อมูลบ้าน</title>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <b><font face="CordiaUPC" size="7" color="#006699">แก้ไขข้อมูลบ้าน </font></b><br>
</div>
 
<%  project_id=request.getParameter("project_id");
	home_id=request.getParameter("home_id");
	action=request.getParameter("SubmitEditHome");
	save=request.getParameter("Save");

	if(home_id==null || home_id.equals(""))
	   home_id="0";
	if(project_id==null || project_id.equals(""))	
	   project_id="0";
	if(action==null || action.equals(""))
	   action="none";
	 if(save==null || save.equals(""))
	   save="none";
%> 

<%if(save.equals("Save")){%>
	<%	project_id=request.getParameter("project_id");
		home_id=request.getParameter("home_id");
		home_name=request.getParameter("home_name");
		type=request.getParameter("type");
		need=request.getParameter("need");
		area=request.getParameter("area");
		priceT=request.getParameter("price");
		stage=request.getParameter("stage");
		bedroom=request.getParameter("bedroom");
		bathroom=request.getParameter("bathroom");
		detail=request.getParameter("detail");
		status=request.getParameter("status");
		contact=request.getParameter("contact");
	%>
	<%query="UPDATE home SET home_name='"+home_name+"',type='"+type+"',area='"+area+"',price="+priceT+",stage='"+stage+"',bedroom='"+bedroom+"',bathroom='"+bathroom+"',detail='"+detail+"',status='"+status+"',contact='"+contact+"' WHERE project_id="+project_id+" AND home_id="+home_id;%>
	<%rset=sessionBeanHP.setRset("insert",query);%>
	<%if(status.equals("empty")){
	      rset=sessionBeanHP.setRset("select","SELECT contract_id FROM home_contract  WHERE home_id="+home_id+" AND project_id="+project_id);
		while(rset.next())
		{contract_id=rset.getInt(1);
		     rset=sessionBeanHP.setRset("insert","DELETE FROM home_contract WHERE contract_id="+contract_id);
	       }}
	%>
	<%=sessionBeanHP.getStatus()%>
	<%}
%> 
<%if(!sessionBeanHP.getUserStatus().equals("login_fail"))
{%>  <%rset=sessionBeanHP.setRset("select","select first_name,last_name from home_user where username='"+sessionBeanHP.getUsername()+"'");
	        rset.next();
		owner2=rset.getString(1)+" "+rset.getString(2);
	 %>
<%} 
%>

<%if(action.equals("none")) {%>
	<table width="98%" border="0" align="center">
	  <tr bgcolor="#00CCCC"> 
	    <td> 
	      
      <table width="99%" border="0" height="99%" align="center" bgcolor="#000000">
        <tr> 
          <td height="30" width="7%" bgcolor="#CCFFFF"> 
            <div align="center"><img src="/www/picture/edit.JPG" width="60" height="25"> 
            </div>
          </td>
          <td width="5%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">ประเภท</font></b></font></div>
          </td>
          <td width="8%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">ชื่อ</font></b></font></div>
          </td>
          <td width="14%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">ต้องการ</font></b></font></div>
          </td>
          <td width="12%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">เจ้าของ</font></b></font></div>
          </td>
          <td width="12%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">สถานะบ้าน</font></b></font></div>
          </td>
          <td width="15%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">ชื่อโครงการ</font></b></font></div>
          </td>
          <td width="8%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">ราคา</font></b></font></div>
          </td>
          <td width="19%" bgcolor="#CCFFCC" height="30"> 
            <div align="center"><font size="3"><b><font face="CordiaUPC">รายละเอียดเพิ่มเติม</font></b></font></div>
          </td>
        </tr>
        <%       if(sessionBeanHP.getUserStatus().equals("dba"))
                                      rset= sessionBeanHP.setRset("select","SELECT home.type, home.home_name, home.home_id, home.need,home_project.project_name,home.owner,home_project.project_id,home.price,home.detail,home.status FROM home,home_project WHERE home.project_id=home_project.project_id  ORDER BY home_project.project_id DESC ");  
			     else
			             rset= sessionBeanHP.setRset("select","SELECT home.type, home.home_name, home.home_id, home.need,home_project.project_name,home.owner,home_project.project_id,home.price,home.detail,home.status FROM home,home_project WHERE home.project_id=home_project.project_id  AND home.owner='"+owner2+"'  ORDER BY home_project.project_id DESC "); %> 
        <%while(rset.next()) 
		    {%> <%	type=rset.getString(1);
					home_name=rset.getString(2);
	    				hid=rset.getInt(3);
		  		        need=rset.getString(4);
				        project_name=rset.getString(5);
				        owner=rset.getString(6);
				        pid=rset.getInt(7);
				        price=rset.getInt(8);
				        detail=rset.getString(9);
					status=rset.getString(10);
				%> 
        <tr> 
          <td height="59" width="7%" bgcolor="#CCFFFF"> 
            <form name="form1" method="post">
              <div align="center"> 
                <input type="submit" name="SubmitEditHome" value="Edit">
                <input type="hidden" name="project_id" value="<%=pid%>">
                <input type="hidden" name="home_id" value="<%=hid%>">
              </div>
            </form>
          </td>
          <td width="5%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=type%></font></div>
          </td>
          <td width="8%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><a href="HPhome.jsp?Hid=<%=hid%>&Pid=<%=pid%>"><%=home_name%></a></font></div>
          </td>
          <td width="14%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=need%></font></div>
          </td>
          <td width="12%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=owner%></font></div>
          </td>
          <td width="12%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%if(status.equals("empty")){%>ว่าง<%}else if(status.equals("reserve")){%><font color="#FF3333"><b>ถูกจองแล้ว</b></font><%}%></font></div>
          </td>
          <td width="15%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=project_name%></font></div>
          </td>
          <td width="8%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=price%></font></div>
          </td>
          <td width="19%" bgcolor="#CCCCFF" height="59"> 
            <div align="center"><font face="MS Sans Serif" size="1"><%=detail%></font></div>
          </td>
        </tr>
        <%} 
		%> 
        <tr> 
          <td colspan="9" bgcolor="#666600" height="2">&nbsp;</td>
        </tr>
      </table>
		    </td>
	  </tr>
	</table>
	
<%}else{%> 
         <%home_id=request.getParameter("home_id"); %> 
	 <%project_id=request.getParameter("project_id"); %> 
<%rset= sessionBeanHP.setRset("select","SELECT home_name,type,need,area,price,stage,bathroom,bedroom,home_id,project_id,status,detail,contact,owner FROM  home  WHERE home_id="+home_id+" AND project_id="+project_id+" ORDER BY home_id DESC"); %> 
<%rset.next();
		      home_name=rset.getString(1);
		      type=rset.getString(2);
		      need=rset.getString(3);
		      area =rset.getString(4);
		      price = rset.getInt(5);
		      stage= rset.getString(6);
		      bathroom=rset.getString(7);
		      bedroom=rset.getString(8);
		      hid=rset.getInt(9);
		      pid=rset.getInt(10);
		      status=rset.getString(11);
		      detail=rset.getString(12);
		      contact=rset.getString(13);
		      owner=rset.getString(14);
		%> 
<%rset= sessionBeanHP.setRset("select","SELECT project_name,owner,project_id  FROM  home_project WHERE project_id="+pid+" ORDER BY project_id DESC"); 
                      rset.next();
		      project_name=rset.getString(1);
		%> <br>
<form method="post" action="">
  <table width="58%" border="0" align="center">
    <tr> 
      <td height="30" colspan="2" bgcolor="#9999FF">&nbsp;</td>
    </tr>
    <tr> 
      <td height="30" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">โครงการ </font></div>
      </td>
      <td height="30" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
	  <%=project_name%>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="30" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">เจ้าของ
          </font></div>
      </td>
      <td height="30" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
	<%=owner%>
      <%--    <input type="text" name="owner" value="<%=owner%>" size="20" maxlength="40"> --%>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="30" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ชื่อบ้าน </font></div>
      </td>
      <td height="30" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
         <input type="text" name="home_name" value="<%=home_name%>" size="20" maxlength="40">
	 </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ประเภท </font></div>
      </td>
      <td height="30" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
	<%--     <input type="text" name="type" value="<%=type%>" size="20" maxlength="40"> --%>
          <select name="type">
		<%if(type.equals("บ้าน")){%>
		    <option value="บ้าน" selected>บ้าน</option>
	            <option value="ทาวน์เฮ้าส์">ทาวน์เฮาส์</option>
	            <option value="ที่ดินเปล่า">ที่ดินเปล่า</option>
	            <option value="อาคารพานิชย์">อาคารพานิชย์</option>
	        <%} else  if(type.equals("ทาวน์เฮ้าส์")){%>
	            <option value="บ้าน">บ้าน</option>
		    <option value="ทาวน์เฮ้าส์" selected>ทาวน์เฮาส์</option>
	            <option value="ที่ดินเปล่า">ที่ดินเปล่า</option>
	            <option value="อาคารพานิชย์">อาคารพานิชย์</option>
		<%}	else  if(type.equals("ที่ดินเปล่า")){%>
	            <option value="บ้าน">บ้าน</option>
		    <option value="ทาวน์เฮ้าส์">ทาวน์เฮาส์</option>
	            <option value="ที่ดินเปล่า" selected>ที่ดินเปล่า</option>
	            <option value="อาคารพานิชย์">อาคารพานิชย์</option>
		<%}	
		      else{%>
	            <option value="บ้าน">บ้าน</option>
		    <option value="ทาวน์เฮ้าส์">ทาวน์เฮาส์</option>
	            <option value="ที่ดินเปล่า">ที่ดินเปล่า</option>
	            <option value="อาคารพานิชย์" selected>อาคารพานิชย์</option>
		<%}
		%>
          </select>
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="44" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ต้องการ </font></div>
      </td>
      <td height="44" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          </font>
          <table width="36%" border="0">
            <tr> 
              <td width="22%"> 
                <div align="right"><font color="#0000FF" size="1"> <b><font face="MS Sans Serif">ขาย</font></b> 
                  </font> </div>
              </td>
              <td width="23%"> <font color="#0000FF"> <b><font face="MS Sans Serif" size="2"> 
                <%if(need.equals("ขาย")){%>
				<input type="radio" name="need" value="ขาย" checked>
	                <%} else {%>
				<input type="radio" name="need" value="ขาย">
			<%}
		%>
		</font></b></font> </td>
              <td width="25%"> 
                <div align="right"><font color="#0000FF" size="1"> <b><font face="MS Sans Serif">เช่า</font></b> 
                  </font></div>
              </td>
              <td width="30%"> 
                <%if(need.equals("เช่า")){%>
				<input type="radio" name="need" value="เช่า" checked>
			<%}else{%> 
				<input type="radio" name="need" value="เช่า">
			<%}
		%>
              </td>
            </tr>
          </table>
          <font face="MS Sans Serif" size="1"> </font> </div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">พื้นที่ </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="area" value="<%=area%>" size="20" maxlength="40">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ราคา </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="price" value="<%=price%>" size="20" maxlength="40">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ชั้น </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="stage" value="<%=stage%>" size="20" maxlength="5">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ห้องนอน </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="bedroom"  value="<%=bedroom%>" size="20" maxlength="5">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ห้องน้ำ </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="bathroom" value="<%=bathroom%>" size="20" maxlength="5">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">รายละเอียดเพิ่มเติม</font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="detail" value="<%=detail%>" size="30" maxlength="100">
          </font></div>
      </td>
    </tr>
    <tr>
      <td height="26" width="28%" bgcolor="#CCFFFF">
        <div align="right"><font face="MS Sans Serif" size="2">สถานะบ้าน </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
	<%if(!status.equals("empty"))
			{%>
		        <select name="status">
			  <option value="empty">ว่าง</option>
		          <option value="reserve" selected>ถูกจองแล้ว</option>
		          <select name="status">
			 <%}
			 else{%> <div align="center"><font face="MS Sans Serif" size="2"> ว่าง<input type="hidden" name="status" value="empty"></font></div> <%}
		%>

	</td>
    </tr>
    <tr> 
      <td height="26" width="28%" bgcolor="#CCFFFF"> 
        <div align="right"><font face="MS Sans Serif" size="2">ติดต่อ </font></div>
      </td>
      <td height="26" width="72%" bgcolor="#FFCCCC"> 
        <div align="left"><font face="MS Sans Serif" size="1"> 
          <input type="text" name="contact" value="<%=contact%>" size="30" maxlength="50">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#6666FF"> 
        <div align="center"> 
          <input type="submit" name="Save" value="Save">
	  <input type="hidden" name="project_id" value="<%=project_id%>">
	  <input type="hidden" name="home_id" value="<%=home_id%>">
          <input type="submit" name="Save" value="Cancel">
        </div>
      </td>
    </tr>
  </table>
</form>
<%} 
%> <br>
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/back1.gif" width="104" height="82" border="0" title="โชว์รายการทั้งหมด"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
