<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=Windows-874" %>
<%!  ResultSet rset=null,rset2=null;
         java.util.Date date1 = new java.util.Date();
	String status;
	StringBuffer home_name_option= new StringBuffer(),home_id_optioin= new StringBuffer(),property_type_option = new StringBuffer(),area_option= new StringBuffer();
	StringBuffer price_option= new StringBuffer(), stage_option= new StringBuffer(),bedroom_option= new StringBuffer(),bathroom_option= new StringBuffer(),need_option=new StringBuffer();
	StringBuffer project_name_option=new StringBuffer(),home_status_option=new StringBuffer();
	String queryString="",project_name1,project_name2,home_status1,home_status2,home_name1,home_name2,area1,area2,type1,type2,need1,need2,price1,price2,stage1,stage2,bedroom1,bedroom2,bathroom1,bathroom2,where,project_id;
	String image,bgcolor;
%>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPshowhome.jsp");%>
<html>
<head>
<title>ค้นหาโครงการณ์</title>
</head>
	
<body bgcolor="#FFFFFF" background="/www/picture/background/flower.gif">
<%if(sessionBeanHP.getCount()==0)
	{	sessionBeanHP.setStmt();
		sessionBeanHP.setCount(1);
	}
	rset= sessionBeanHP.setRset("select","SELECT DISTINCT  project_name,project_id  FROM  home_project  ORDER BY 2 ASC");
	
	project_name_option.delete(0,project_name_option.length());
	project_name_option.append("<select name=\"project_name1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
	 while(rset.next())
	{        project_name_option.append("<option value=\""+rset.getString(2)+"\">");
	         if(rset.getString(1).equals(null))
				project_name_option.append("-");	
	         else
				project_name_option.append(rset.getString(1));
			        project_name_option.append("</option>");
	}
	project_name_option.append("</select>");	

	rset= sessionBeanHP.setRset("select","SELECT DISTINCT  status  FROM  home  ORDER BY 1 ASC");
	home_status_option.delete(0,home_status_option.length());
	home_status_option.append("<select name=\"home_status1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
	 while(rset.next())
	{        home_status_option.append("<option value=\""+rset.getString(1)+"\">");
	         if(rset.getString(1).equals("empty"))
			  home_status_option.append("ว่าง");
	       else if(rset.getString(1).equals("reserve"))
			  home_status_option.append("ถูกจองแล้ว");
		else
			  home_status_option.append("ไม่ระบุ");
	        home_status_option.append("</option>");
	}
	home_status_option.append("</select>");	



	rset= sessionBeanHP.setRset("select","SELECT DISTINCT  home_name  FROM  home  ORDER BY 1 ASC");
	home_name_option.delete(0,home_name_option.length());
		home_name_option.append("<select name=\"home_name1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{         home_name_option.append("<option value=\""+rset.getString(1)+"\">");
					         if(rset.getString(1).equals(null))
								home_name_option.append("-");	
					         else
								home_name_option.append(rset.getString(1));
					         home_name_option.append("</option>");
				}
		home_name_option.append("</select>");	
                //	ประเภทอสังหาริมทรัพย์
               rset= sessionBeanHP.setRset("select","SELECT DISTINCT  type  FROM  home ORDER BY 1 ASC");
		property_type_option.delete(0,property_type_option.length());
		property_type_option.append("<select name=\"property_type1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{                  if(! rset.getString(1).equals(null))
						   {  	property_type_option.append("<option value=\""+rset.getString(1)+"\">");
							property_type_option.append(rset.getString(1));
					                property_type_option.append("</option>");
						  }
				}
		property_type_option.append("</select>");	

		//พื้นที่
		rset= sessionBeanHP.setRset("select","SELECT DISTINCT  area  FROM  home ORDER BY 1 ASC");
		area_option.delete(0,area_option.length());
		area_option.append("<select name=\"area1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{          if(!rset.getString(1).equals(null))
					    {	area_option.append("<option value=\""+rset.getString(1)+"\">");
						area_option.append(rset.getString(1));
						area_option.append("</option>");
					    }
				}
		area_option.append("</select>");	

               //ต้องการ
		rset= sessionBeanHP.setRset("select","SELECT DISTINCT  need  FROM  home ORDER BY 1 ASC");
		need_option.delete(0,need_option.length());
		need_option.append("<select name=\"need1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{                  if(!rset.getString(1).equals(null))
						    {	need_option.append("<option value=\""+rset.getString(1)+"\">");
							need_option.append(rset.getString(1));
							need_option.append("</option>");
						    }
				}
		need_option.append("</select>");	


               //ราคา
		rset= sessionBeanHP.setRset("select","SELECT DISTINCT  price  FROM  home  ORDER BY 1 ASC");
		price_option.delete(0,price_option.length());
		price_option.append("<select name=\"price1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{            if(!rset.getString(1).equals(null))
						{      price_option.append("<option value=\""+rset.getString(1)+"\">");
							price_option.append(rset.getString(1));
						        price_option.append("</option>");
						}
				}
		price_option.append("</select>");	

		//ชั้น
		rset= sessionBeanHP.setRset("select","SELECT DISTINCT  stage  FROM  home  ORDER BY 1 ASC");
		stage_option.delete(0,stage_option.length());
		stage_option.append("<select name=\"stage1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{         
					         if(!rset.getString(1).equals(null))
						{  	 stage_option.append("<option value=\""+rset.getString(1)+"\">");
							  stage_option.append(rset.getString(1));
						          stage_option.append("</option>");
						}
				}
		stage_option.append("</select>");	
		// ห้องนอน
		rset= sessionBeanHP.setRset("select","SELECT DISTINCT  bedroom  FROM  home  ORDER BY 1 ASC");
		bedroom_option.delete(0,bedroom_option.length());
		bedroom_option.append("<select name=\"bedroom1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{                 if(!rset.getString(1).equals(null))
						  {		bedroom_option.append("<option value=\""+rset.getString(1)+"\">");
								bedroom_option.append(rset.getString(1));
					                        bedroom_option.append("</option>");
						   }
				}
		bedroom_option.append("</select>");	
		// ห้องน้ำ
		rset= sessionBeanHP.setRset("select","SELECT DISTINCT  bathroom  FROM  home  ORDER BY 1 ASC");
		bathroom_option.delete(0,bathroom_option.length());
		bathroom_option.append("<select name=\"bathroom1\"> <option value=\"none\" selected>-----ไม่ระบุ-----</option>");
		 while(rset.next())
				{                 if(!rset.getString(1).equals(null))
						  {		bathroom_option.append("<option value=\""+rset.getString(1)+"\">");
								bathroom_option.append(rset.getString(1));
					                        bathroom_option.append("</option>");
						   }
				}
		bathroom_option.append("</select>");	
%>
<%		project_name1=request.getParameter("project_name1");
		project_name2=request.getParameter("project_name2");

		home_status1=request.getParameter("home_status1");
		home_status2=request.getParameter("home_status2");
		
		home_name1=request.getParameter("home_name1");
	       home_name2=request.getParameter("home_name2");
	       
	       type1=request.getParameter("property_type1");
	       type2=request.getParameter("property_type2");
	       
	       area1=request.getParameter("area1");
	       area2=request.getParameter("area2");
	       
	       need1=request.getParameter("need1");
	       need2=request.getParameter("need2");

	       price1=request.getParameter("price1");
	       price2=request.getParameter("price2");
	       
	       stage1=request.getParameter("stage1");
	       stage2=request.getParameter("stage2");
	       
	       bedroom1=request.getParameter("bedroom1");
	       bedroom2=request.getParameter("bedroom2");
	       
	       bathroom1=request.getParameter("bathroom1");	     
	       bathroom2=request.getParameter("bathroom2");	     
%>
<% if((project_name1==null)||(project_name1.equals("")))
			project_name1="none";
	if((project_name2==null)||(project_name2.equals("")))
			project_name2="none";
	
	if((home_status1==null)||(home_status1.equals("")))
			home_status1="none";

	if((home_status2==null)||(home_status2.equals("")))
			home_status2="none";

	if((home_name1==null)||(home_name1.equals("")))
			home_name1="none";
	if((home_name2==null)||(home_name2.equals("")))
			home_name2="none";

	if((type1==null)||(type1.equals("")))
			type1="none";
	if((type2==null)||(type2.equals("")))
			type2="none";
	
	if((area1==null)||(area1.equals("")))
			area1="none";
	if((area2==null)||(area2.equals("")))
			area2="none";

	if((need1==null)||(need1.equals("")))
			need1="none";
	if((need2==null)||(need2.equals("")))
			need2="none";
	
	if((price1==null)||(price1.equals("")))
			price1="none";
	if((price2==null)||(price2.equals("")))
			price2="none";

	if((stage1==null)||(stage1.equals("")))
			stage1="none";
	if((stage2==null)||(stage2.equals("")))
			stage2="none";

	if((bedroom1==null)||(bedroom1.equals("")))
				bedroom1="none";
	if((bedroom2==null)||(bedroom2.equals("")))
				bedroom2="none";
	
	if((bathroom1==null)||(bathroom1.equals("")))
			bathroom1="none";
	if((bathroom2==null)||(bathroom2.equals("")))
			bathroom2="none";
%>
<%where=" WHERE ";%>

<%      if( !(home_name1.equals("none"))  )
		{      where+="home_name='"+home_name1+"'";
		   	  if(   !(home_name2.equals("none"))  )
					 where+=" OR ";
		}
	if(!(home_name2.equals("none")) )
		{	where +="home_name  LIKE '%"+home_name2+"%'";
		}

	if(!project_name1.equals("none"))
	{        if(!where.equals(" WHERE "))
				where+=" AND ";
		where+="project_id="+project_name1;
		 if(!project_name2.equals("none"))
				where += " OR  ";
	}
	if(!project_name2.equals("none"))
	{     rset=sessionBeanHP.setRset("select","SELECT project_id FROM home_project WHERE project_name LIKE '%"+project_name2+"%'"); 	
	      
	       while(rset.next())
	       { 	 where += " project_id= "+rset.getInt(1); 
		         where+=" OR "; 
			status="in";
		}
		if(status.equals("in"))
			where=where.substring(0,where.length()-4);
		else
			where+="project_id="+project_name2;
	}

	if(!home_status1.equals("none"))
	{      if(!where.equals(" WHERE "))
				where+=" AND ";
		where+="status='"+home_status1+"'";
	}
	if(    !(type1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="type  ='"+type1+"'";
			if(  !(type2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(type2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(type1.equals("none")))
				where+=" AND ";
			where +="type  LIKE '%"+type2+"%'";
		}

	if(    !(area1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="area='"+area1+"'";
			if(  !(area2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(area2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(area1.equals("none")))
				where+=" AND ";
			where +="area  LIKE '%"+area2+"%'";
		}

	if(    !(need1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="need='"+need1+"'";
			if(  !(need2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(need2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(need1.equals("none")))
				where+=" AND ";
			where +="need  LIKE '%"+need2+"%'";
		}


	if(    !(price1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="price='"+price1+"'";
			if(  !(price2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(price2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(price1.equals("none")))
				where+=" AND ";
			where +="price  LIKE '%"+price2+"%'";
		}

	if(    !(stage1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="stage='"+stage1+"'";
			if(  !(stage2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(stage2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(stage1.equals("none")))
				where+=" AND ";
			where +="stage  LIKE '%"+stage2+"%'";
		}
	if(    !(bedroom1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="bedroom='"+bedroom1+"'";
			if(  !(bedroom2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(bedroom2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(bedroom1.equals("none")))
				where+=" AND ";
			where +="bedroom  LIKE '%"+bedroom2+"%'";
		}

	if(    !(bathroom1.equals("none"))    )
		{	if(!where.equals(" WHERE "))
				where+=" AND ";
			where +="bathroom='"+bathroom1+"'";
			if(  !(bathroom2.equals("none"))  )
				where+= " OR ";
		}
	if(    !(bathroom2.equals("none"))    )
		{	if(!where.equals(" WHERE ")&&(bathroom1.equals("none")))
				where+=" AND ";
			where +="bathroom  LIKE '%"+bathroom2+"%'";
		}
	%>
	<%queryString="SELECT home_name,type,need,area,price,stage,bathroom,bedroom,home_id,project_id,status FROM home";%>
	<%    if(!where.equals(" WHERE "))
		          queryString+=where;
	          queryString+=" ORDER BY home_id DESC ";  	%>
	  <%rset= sessionBeanHP.setRset("select",queryString);%>
	<table width="83%" border="0">
	  <tr> 
		    <td width="16%">
					<b><img src="/www/picture/logo/home2.gif" width="100" height="63"></b>
		     </td>
		     <td width="80%"> 
				      <div align="center">
				      <b><font face="MS Sans Serif" size="4"><font color="#FF3333" size="5">โครงการอสังหาริมทรัพย์</font></font></b></div>
		    </td>
	  </tr>
	</table>
<form method="post" action="">
  <table width="100%" border="0">
    <tr>
      <td width="18%" bgcolor="#CCCC00">
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ชื่อโครงการ</b></font></div>
      </td>
      <td width="5%"><font face="MS Sans Serif" size="2"><%=project_name_option%></font></td>
      <td width="22%"><font face="MS Sans Serif" size="2">
        <input type="text" name="project_name2" size="10" maxlength="50">
        </font></td>
      <td width="14%" bgcolor="#CCCC00">
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>สถานะบ้าน</b></font></div>
      </td>
      <td width="5%"><%=home_status_option%></td>
      <td width="35%"><font face="MS Sans Serif" size="2"> </font></td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ชื่อบ้าน</b></font></div>
      </td>
      <td width="5%"><font face="MS Sans Serif" size="2"><%=home_name_option%></font></td>
      <td width="22%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="home_name2" size="10" maxlength="50">
        </font></td>
      <td width="14%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ราคา</b></font></div>
      </td>
      <td width="5%"><font face="MS Sans Serif" size="2"> <%=price_option%> </font></td>
      <td width="35%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="price2" size="10" maxlength="50">
        </font></td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ประเภท</b></font></div>
      </td>
      <td width="5%"><font face="MS Sans Serif" size="2"><%=property_type_option%></font></td>
      <td width="22%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="property_type2" size="10" maxlength="50">
        </font></td>
      <td width="14%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ชั้น</b></font></div>
      </td>
      <td width="6%"><font face="MS Sans Serif" size="2"><%=stage_option%></font></td>
      <td width="35%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="stage2" size="10" maxlength="50">
        </font></td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ต้องการ</b></font></div>
      </td>
      <td width="5%"><font face="MS Sans Serif" size="2"><%=need_option%></font></td>
      <td width="22%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="need2" size="10" maxlength="50">
        </font></td>
      <td width="14%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ห้องนอน</b></font></div>
      </td>
      <td width="6%"><font face="MS Sans Serif" size="2"><%=bedroom_option%></font></td>
      <td width="35%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="bedroom2" size="10" maxlength="50">
        </font></td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>พื้นที่</b></font></div>
      </td>
      <td width="5%"><font face="MS Sans Serif" size="2"><%=area_option%></font></td>
      <td width="22%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="area2" size="10" maxlength="50">
        </font></td>
      <td width="14%" bgcolor="#CCCC00"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF"><b>ห้องน้ำ</b></font></div>
      </td>
      <td width="6%"><font face="MS Sans Serif" size="2"><%=bathroom_option%></font></td>
      <td width="35%"><font face="MS Sans Serif" size="2"> 
        <input type="text" name="bathroom2" size="10" maxlength="50">
        </font></td>
    </tr>
    <tr> 
      <td colspan="6" height="43"> 
        <div align="center"> 
          <table width="100%" border="0">
            <tr> 
              <td> 
                <div align="center"> 
                  <input type="submit" name="Submit" value="Send Form">
                  <input type="hidden" name="project_id" value=    <%= project_id%> >
                </div>
              </td>
              <td> 
                <input type="reset" name="Submit2" value="Reset Form">
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  </form>
  <div align="center"><br><a href="/jsp/HPindex.jsp"><img src="/www/picture/logo/Home_Project.gif" width="199" height="53" border="0"></a><br></div>


<table width="100%" border="0" height="41">
  <tr> 
    <td width="211" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ชือ</font></b></font></div>
    </td>
    <td width="121" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ประเภท</font></b></font></div>
    </td>
    <td width="79" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ต้องการ</font></b></font></div>
    </td>
    <td width="81" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">พื้นที่</font></b></font></div>
    </td>
    <td width="48" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">สถานะ</font></b></font></div>
    </td>
    <td width="117" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ราคา</font></b></font></div>
    </td>
    <td width="61" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ชั้น</font></b></font></div>
    </td>
    <td width="71" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ห้องน้ำ</font></b></font></div>
    </td>
    <td width="82" bgcolor="#FF9999"> 
      <div align="center"><font color="#0000FF"><b><font face="MS Sans Serif" size="1">ห้องนอน</font></b></font></div>
    </td>
    <td width="90"> 
      <div align="center"></div>
    </td>
    <%!int i=0;%>
        <%i=0;%>
  </tr>
    
    
    <%while(rset.next())
    {%><tr>
		<%if((i%2)==0)
			{%> <%image="/www/picture/more_10049.gif";%> 
				<%bgcolor="#999900";%>
				  
			<%}
		else
			{%><%image="/www/picture/More_08974.gif";%> 
				<%bgcolor="#00CC99";%>
			 <%}
	      %>
    <%i++;%> 
    <td width="211" height="18" bgcolor="<%=bgcolor%>"  > 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(1)%> 
        </font></div>
    </td>
    <td width="121" height="18" bgcolor="<%=bgcolor%>" > 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(2)%> 
        </font></div>
    </td>
    <td width="79" height="18" bgcolor="<%=bgcolor%>" > 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(3)%> 
        </font></div>
    </td>
    <td width="81" height="18" bgcolor="<%=bgcolor%>"> 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(4)%> 
        </font></div>
    </td>
    <td width="48" height="18" bgcolor="<%=bgcolor%>"> 
      <div align="center"><font face="MS Sans Serif" size="1"> 
	 <%status=rset.getString(11);%> 
	 <%if(status.equals("empty"))
			status="ว่าง";
	       else if(status.equals("reserve"))
			status="ถูกจองแล้ว";
		else
			status="ไม่ระบุ";
	 %>
      <%=status%>
     	</font></div>
    </td>
    <td width="117" height="18" bgcolor="<%=bgcolor%>" > 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getInt(5)%> 
        </font></div>
    </td>
    <td width="61" height="18" bgcolor="<%=bgcolor%>"> 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(6)%> 
        </font></div>
    </td>
    <td width="71" height="18" bgcolor="<%=bgcolor%>"> 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(7)%> 
        </font></div>
    </td>
    <td width="82" height="18" bgcolor="<%=bgcolor%>"> 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=rset.getString(8)%> 
        </font></div>
    </td>
    <td width="90" height="18"> 
      <form name="form2" action="/jsp/HPhome.jsp" method="post" >
        <input type="image" border="0" name="submitt"  src="<%=image%>" width="80" height="15">
        <input type="hidden"  name="Hid" value=<%=rset.getInt(9)%>>
        <input type="hidden"  name="Pid" value=<%=rset.getInt(10)%>>
      </form>
    </td>
    </tr>
    <%}
     %> 
      <%if(i==0){%> <tr>
    <td  colspan=9 bgcolor="#006666"> 
      <div align="center"><font face="MS Sans Serif" size="2" color="#FF9999">ขออภัยไม่มีข้อมูลที่ท่านต้องการค้นหา</font></div>
    </td>
  </tr><%}%>
  </table>
<br>
<p>&nbsp;</p>
</body>
</html>