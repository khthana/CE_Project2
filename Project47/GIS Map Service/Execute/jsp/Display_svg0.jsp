<%@ page contentType="text/html; charset=MS874" %>
  <html>
<head>
<title>Web Map Service---&gt;View Map</title>
<script language=JavaScript src="picker.js"></script>
<jsp:useBean id="DisplaySvg" scope="session" class="project.gensvg" />
<jsp:useBean id="GML" scope="session" class="project.genGML" />
<jsp:useBean id="manageRuntime" scope="session" class="project.manageRuntime" />
<body bgcolor="#ffffcc">
<jsp:useBean id="changDefault" scope="session" class="project.editDatabase" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" background="Background.JPG" link="#00FFFF">
  <%
  	session.setAttribute("checked","");
  %>

<%
	String userName = (String)session.getAttribute("UserName");//**************session***********
	String level = (String)session.getAttribute("level");//********** session***********
	String Group = (String)session.getAttribute("group");//********** session***********
	String[] t =DisplaySvg.getAllLayerName(Group);
        	String[]  checkType2=new String[t.length];
       	String[] testC =new String[t.length];
               	String[] Stroke0 =new String[t.length];
                       	String[] Size20 =new String[t.length];
               	String[] Stroke =new String[t.length];
                       	String[] Size2 =new String[t.length];
                	String submit=request.getParameter("submit");
                            String search=request.getParameter("ok");
	String back=request.getParameter("back");
	String[] check =request.getParameterValues("layer");
	String downloadGML = request.getParameter("downloadGML");
                            String query = request.getParameter("query");
        	String name=request.getParameter("name");
                	String name1=request.getParameter("name1");
        	String[] nameColor=new String[t.length];
                            String[] Stroke2=new String[t.length];
                          	char checkType='a';
                            String restore=request.getParameter("restore");
                   //           String NameFile=UserName+".svg";
                             String[] x=new String[t.length];
                             String[] h=new String[t.length];
                             String picture="http://161.246.6.212:8080//"+userName+".svg";


         ///////////////////////



	for(int i=0;i<t.length;i++){
        		testC[i]=t[i];
                        		Stroke0[i]=i+"b";
                                        	Size20[i]=(i)+"a";
                                                	checkType=DisplaySvg.getType(t[i]);
                                            checkType2[i]=checkType+"";



	}




       	String[] size=new String[3];
        	String    color="";
                	size[0]="normal";
              	size[1]="small";
        	size[2]="large";

                    	char[] ch ;
        	String lastChecked=(String)session.getAttribute("checked");

        	if (lastChecked.equals(""))
        	{
        		ch= new char[t.length];
                		for(int i =0;i<t.length;i++)  ch[i]='1';

        	}
        	else {
            		ch = lastChecked.toCharArray();
        	}

          	String editcolor2,temp;
                   	int k = 0;


	 if(submit != null){

              	int g=t.length-check.length;
     	String[] notCheck=new String[g];
 	for(int i=0;i<t.length;i++)
	{

  	boolean flag=false;
 	 for (int j = 0 ;j<check.length;j++){
  	if(check[j].equals(t[i]))
  	{ flag=true;
    	 j = check.length;}

  	}
 	 if (!flag) {
    	notCheck[k] = t[i];
    	ch[i]='0';
   	 k++;
 	 }
  	else ch[i] = '1';

	}

	DisplaySvg.replaceString(notCheck,userName);
	for (int j=0;j< t.length; j++){

			nameColor[j]=request.getParameter(testC[j]);
                                                                                      Stroke[j]=request.getParameter(Stroke0[j]);
                                                                                      Size2[j]=request.getParameter(Size20[j]);

                        			if(checkType2[j].equals("b")){
                                                  			if(Stroke[j].equals("small")){
                                                                            			DisplaySvg.replaceStroke(t[j],false,userName);
                                                  			}
                                                                          		else if(Stroke[j].equals("large")){
                                                                            			DisplaySvg.replaceStroke(t[j],true,userName);
                                                  			}


                        			}
                                                		else if(checkType2[j].equals("c")){
                                                  			if(Size2[j].equals("small")){
                                                                            			DisplaySvg.replaceRadias(t[j],false,userName);
                                                  			}
                                                                          		else if(Size2[j].equals("large")){
                                                                            			DisplaySvg.replaceRadias(t[j],true,userName);
                                                  			}
                        			}
		}



	DisplaySvg.replaceColor(t,nameColor,userName);
 	}
	if(downloadGML!=null)
	 {
   		GML.file(Group,check,userName);
                   		manageRuntime.zipGMLFile(userName);
                                   	manageRuntime.zipSVGFile(userName,false);
                                   	response.sendRedirect("downloadGmlSvg.jsp");


 	}

	        session.setAttribute("checked",DisplaySvg.char2string(ch));
                         if(search!= null){
                                   String find=request.getParameter("find");
                           //  changDefault.getGeometryCenterByName(t,find);
                           DisplaySvg.addSymbol(t,find,userName);

                           }
                            if(query != null){
                             String[] coordinate=new String[4];

                             coordinate[0]=request.getParameter("xmax");
                             coordinate[1]=request.getParameter("xmin");
                             coordinate[2]=request.getParameter("ymax");
                             coordinate[3]=request.getParameter("ymin");
                             DisplaySvg.genSVGfromAllLayer(Group,coordinate,userName);
                           }
                           if(restore != null){
                             response.sendRedirect("Display_svgFirst.jsp");
                           }


 %>
<form name="tcp_test" method="post">
<table width="100%" height="100%" border="1" bordercolor="#663300">
  <tr>
    <td width="29%" rowspan="3"> <div align="left">
        <table width="100%" height="100%" border="0" bordercolor="#FFFFCC" bgcolor="#FF6600">
          <tr>
            <td width="100%"><div align="center">
                <p align="left"><font color="#FFFFFF" size="+4">GIS </font></p>
                <p align="left"><font color="#FFFFFF" size="+4">Map</font></p>
                <p align="left"><font color="#FFFFFF" size="+4">Service :.</font></p>
              </div></td>
          </tr>
          <tr>
            <td><div align="center">
                <hr color="#FFFFFF">
              </div></td>
          </tr>
          <tr>
            <td bordercolor="#FFFF99" bgcolor="#FF6600"><div align="center">
                <p>&nbsp;</p>
              </div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+2"><strong>[<font color="#0000FF">my</font></strong></font><strong><font color="#FFFF99" size="+2">GISMapService</font><font size="+2">]</font></strong></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+1"><strong><a href="Login.jsp">Login</a></strong></font></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+1"><strong><a href="LogOut.jsp">Logout</a></strong></font></div></td>
          </tr>

          <tr>
            <td height="21"><div align="center"><font size="+1"><strong><a href= "Change_pw.jsp">Change
                Password</a></strong></font></div></td></tr>

          <tr>
            <td height="21"><div align="center"></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center">
                <p>&nbsp;</p>
              </div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+2"><strong>[<font color="#0000FF">menu</font><font color="#FFCCFF"><font color="#FFFF99">GISMapService</font></font>]</strong></font></div></td>
          </tr>

             <%if(level.equals("a")){%>
          <tr>
            <td height="21"><div align="center"><font color="#FFCCFF" size="+1"><strong><a href="Edit_DB.jsp">Edit
                Database</a></strong></font></div></td>
          </tr>
             <%}
                else
                {%>
                <tr>
            <td height="21"><div align="center"><font color="#FFCCFF" size="+1"><strong>Edit
                Database</a></strong></font></div></td>
          </tr>
           <%}%>

          <tr>
            <td height="21" bordercolor="#FFFFCC"><div align="center"><font color="#FFCCFF" size="+1"><strong><a href="Display_svgFirst.jsp">View
                Map</a></strong></font></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font color="#FFCCFF" size="+1"><strong><a href="convert.jsp">Convert
                GML to SVG</a></strong></font></div></td>
          </tr>
          <tr>
            <td height="21">&nbsp;</td>
          </tr>
          <tr>
            <td height="21">&nbsp;</td>
          </tr>
          <tr>
            <td height="21">&nbsp;</td>
          </tr>

        </table>
      </div></td>
    <td height="54" valign="top" background="Map.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="978" valign="top"><div align="left">
        <p align="center">&nbsp;</p>
        <p align="center"><strong><font color="#0000FF" size="+2">m</font></strong>
          <font size="+2"><strong><font color="#0000FF">y</font><font color="#FF6600">GISMapService</font><font color="#000000">
          || <font color="#FF0000"><u>View Map</u></font></font></strong></font></p>
        <table width="100%" height="151" border="1" bordercolor="#000000" background="Background.JPG" bgcolor="#FFFF99">
          <tr>
            <td colspan="2"><div align="center"><strong><font color="#0000FF" size="+1">Insert  Boundary</font></strong></div></td>
            <td width="17%"><div align="center">X</div></td>
            <td width="16%"><div align="center">Y</div></td>
            <td width="49%" colspan="3" rowspan="5" valign="top"><font color="#0000FF" size="+1"><strong>Find&gt;&gt;</strong></font>
        	<br><br><center><font color="#A10000">
          	Insert the name of the place you want to locate : <br><br>

                  	<input type="text" name="find" value="">&nbsp;&nbsp;
                              <input type="submit" name="ok" value="Search">
                            </font>
	</center>
  	</td>
          </tr>
          <tr>
              <td width="11%" rowspan="4"><div align="center"><img src="showCoordinate.jpg" width="200" height="200"></div></td>
            <td width="15%" height="26"><div align="center">(X max,Y max)</div></td>
            <td><div align="center">
                <input type="text" name="xmax">
              </div></td>
            <td><div align="center">
                <input type="text" name="ymax">
              </div></td>
          </tr>
          <tr>
            <td height="26"><div align="center">(X min,Y min)</div></td>
            <td><div align="center">
                <input type="text" name="xmin">
              </div></td>
            <td><div align="center">
                <input type="text" name="ymin">
              </div></td>
          </tr>
          <td colspan="3"><center><input type="submit" name="query" value="Clip"></center></td>

        </table>

      </div>
      <table width="872" height="400" border="1">
        <tr>
          <td   colspan="4" width="600" ><embed width="900" height="500" src=<%=picture%> name="printable_map" type="image/svg+xml"></td>

        </tr>
        <tr>
  	<td> Select  Layer</td>
  	<td> Change Display Color</td>

</tr>
<% h=DisplaySvg.getColorFromFile(t,userName);
               	for (int j=0;j<= (t.length)-1; j++)
              	{%>
                        	<tr>
                      	<td><%
              		String ttemp = "";
      	                        	if ( ch[j] == '1') ttemp = "checked";
                                              	h[j]=DisplaySvg.color2HexColor(h[j]);


                              %>
              		<input type="checkbox" name="layer" value=<%=t[j]%> <%=ttemp%>><font color=<%=h[j]%> size="+2"> <%=t[j]%></font>&nbsp;
                        	</td>

  	<td>
	<input type="Text" name=<%=testC[j]%>  value="" readonly="readonly">
                        	<a href="javascript:TCP.popup(document.forms['tcp_test'].elements['<%=testC[j]%>'])">
	<img width="15" height="13" border="0" alt="Click Here to Pick up the color" src="img/sel.gif"></a>
	</td>


                  	<%checkType=DisplaySvg.getType(t[j]);
                      	      checkType2[j]=checkType+"";
                              if( checkType=='b'){%>
                              <td>Change Stroke width :  &nbsp;
                             <select name=<%=Stroke0[j]%>>

           			<%for(int y=0;y<3;y++){%>
                                                     			<option value=<%=size[y]%>><%=size[y]%> </option>
			<%}%>


  	</select>
          	</td>
                  	<%}
                               if( checkType=='c'){%>
                              <td>Change Size :  &nbsp;
                  	<!--&nbsp;&nbsp;-->
        	<select name=<%=Size20[j]%>>

          			<%for(int y=0;y<3;y++){%>
                                                     			<option value=<%=size[y]%>><%=size[y]%> </option>
			<%}%>
	</select>
  	</td>
          	<%}%>
      	</tr>
	<%}%>

      </table>
           <input type="submit" name="submit" value="Submit">
           <input type="submit" name="downloadGML" value="Download File GML or SVG">
          <input type="submit" name="restore" value="Restore">

   </td>
  </tr>

</table>
</form>
</body>
</html>



