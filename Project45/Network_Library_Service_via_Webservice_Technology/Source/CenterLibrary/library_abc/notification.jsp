<%@ page contentType="text/html; charset=windows-874" language="java"  errorPage="" %>
<%@ page import="java.util.*"%>
<%
	String id2=request.getParameter("id");
	long id=0;
	if (id2.equalsIgnoreCase("0")){
		Date now=new Date();
		id=now.getTime();
	}
%>
<html>
<head>
<title>การประกาศข่าวสาร</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="100%" border="0">
        <tr> 
                <td width="13%">&nbsp;</td>
                <td width="37%">&nbsp;</td>
                <td width="37%">&nbsp;</td>
                <td width="13%">&nbsp;</td>
        </tr>
        <tr> 
                <td colspan="4"><table width="100%" border="0">
                                <tr> 
                                        <td width="56%">&nbsp;</td>
                                        <td width="11%">&nbsp;</td>
                                        <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button7.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button7.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
                                        <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button38.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button38.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
                                        <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button40.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button40.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
                                </tr>
                        </table></td>
        </tr>
        <tr> 
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
        </tr>
        <tr> 
                <td>&nbsp;</td>
                <td colspan="2"> <div align="center"> 
                                <form name="form1" method="post" action="notification2.jsp">
                                        <table width="85%" border="1" rules="none">
                                                <tr> 
                                                        
              <td colspan="5" bgcolor="#FFFF99"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>&nbsp;แจ้งข่าวสาร&nbsp;&nbsp;</strong></font></td>
                                                </tr>
                                                <tr> 
                                                        <td width="1%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="19%"><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อหัวข้อ</font></td>
                                                        <td width="70%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                                                                <input name="title" type="text" size="30" maxlength="50">
                                                                </font></td>
                                                        <td width="5%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                </tr>
                                                <tr> 
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                        <td><p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p></td>
                                                        <td><p><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">เนื้อเรื่อง</font></p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p></td>
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                                                                <textarea name="text" cols="40" rows="10"></textarea>
                                                                </font></td>
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                </tr>
                                                <tr> 
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                        <td>&nbsp;</td>
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ประเภทข่าวสาร</font></td>
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                                                                <select name="subject">
                                                                        <option value="3">แจ้งประกาศทั่วไป(สำคัญ)</option>
                                                                        <option value="4">แจ้งรายการภาพยนต์</option>
                                                                        <option value="5">แจ้งประกาศสัมนา</option>
                                                                        <option value="6">แจ้งประกาศทั่วไป</option>
                                                                        <option value="a">A--GENERAL 
                                                                        WORKS(ทั่วไป)</option>
                                                                        <option value="b">B--PHILOSOPHY, 
                                                                        PSYCHOLOGY, 
                                                                        RELIGION(ปรัชญา, 
                                                                        จิตศาสตร์, 
                                                                        ศาสนา)</option>
                                                                        <option value="c">C--HISTORY 
                                                                        (AUXILIARY 
                                                                        SCIENCES: 
                                                                        (ประวัตศาสตร์, 
                                                                        โบราณคดี, 
                                                                        พันธุศาสตร์)</option>
                                                                        <option value="d">D--HISTORY 
                                                                        (EXCEPT 
                                                                        AMERICA)	
                                                                        (ประวัติศาสตร์ 
                                                                        ยกแว้นอเมริกา)</option>
                                                                        <option value="e">E-F--AMERICA 
                                                                        AND UNITED 
                                                                        STATES(อเมริกา)</option>
                                                                        <option value="g">G--GEOGRAPHY, 
                                                                        ANTHROPOLOGY(ภูมิศาสตร์)</option>
                                                                        <option value="h">H--SOCIAL 
                                                                        SCIENCES(สังคมศาสตร์)</option>
                                                                        <option value="j">J--POLITICAL 
                                                                        SCIENCE(การเมืองการปกครอง)</option>
                                                                        <option value="k">K--LAW(กฎหมาย)</option>
                                                                        <option value="l">L--EDUCATION(การศึกษา)</option>
                                                                        <option value="m">M--MUSIC(การดนตรี)</option>
                                                                        <option value="n">N--FINE 
                                                                        ARTS (ศิลป์ศาสตร์)</option>
                                                                        <option value="p">P--LANGUAGE 
                                                                        AND LITERATURE(ภาษาศาสตร์, 
                                                                        อักขษรศาสตร์, 
                                                                        วรรณคดี)</option>
                                                                        <option value="q">Q--SCIENCE(วิทยาศาสตร์)</option>
                                                                        <option value="r">R--MEDICINE(แพทย์ศาสตร์)</option>
                                                                        <option value="s">S--AGRICULTURE(เกษตรศาสตร์, 
                                                                        กสิกรรม)</option>
                                                                        <option value="t">T--TECHNOLOGY 
                                                                        AND ENGINEERING(เทคโนโลยี, 
                                                                        วิศวกรรมศาสตร์)</option>
                                                                        <option value="u">U--MILITARY 
                                                                        SCIENCE(การทหาร)</option>
                                                                        <option value="v">V--NAVAL 
                                                                        SCIENCE(ทหารเรือ)</option>
                                                                        <option value="z">Z--BIBLIOGRAPHY 
                                                                        &amp; 
                                                                        LIBRARY 
                                                                        SCIENCE(ห้องสมุดศาสตร์)</option>
                                                                </select>
                                                                </font></td>
                                                        <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                </tr>
                                                <tr> 
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><div align="center"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                                                                        <input type="submit" name="Submit" value="   ตกลง   ">
									<input name="id" type="hidden" value="<%=id%>">
                                                                        </font></div></td>
                                                        <td>&nbsp;</td>
                                                </tr>
                                                <tr> 
                                                        <td colspan="5"bgcolor="#FFFF99">
<div align="center"> 
                                                                        <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                                                                        </font></div>
                                                                <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
                                                </tr>
                                        </table>
                                </form>
                        
        <table width="85%" border="1">
          <tr> 
            <td colspan="3"bgcolor="#FFFF99"><font size="+2" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>กำหนดเวลาการแจ้งเตือน</strong></font></td>
          </tr>
          <tr> 
            <td width="8%">&nbsp;</td>
            <td width="85%"> 
              <table width="100%" border="1">
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td><form name="form2" method="post" action="notification3.jsp">
                      <table width="90%" border="0" align="center">
                        <tr> 
                          <td width="58%">ทำการส่งครั้งแรกในเวลา</td>
                          <td width="42%"> 
                            <% if (id2.equalsIgnoreCase("0")) {%>
                            <input type="text" name="timeout"> 
                            <% }else{ %>
                            <input type="text" name="timeout" disabled> 
                            <% } %>
                          </td>
                        </tr>
                        <tr> 
                          <td>ทำการส่งครั้งต่อไปเมื่อเวลาผ่านไป</td>
                          <td> 
                            <% if (id2.equalsIgnoreCase("0")) {%>
                            <input type="text" name="repeat"> 
                            <% }else{ %>
                            <input type="text" name="repeat" disabled> 
                            <% } %>
                          </td>
                        </tr>
                        <tr> 
                          <td colspan="2"><div align="center"> 
                              <% if (id2.equalsIgnoreCase("0")) {%>
                              <input type="submit" name="Submit2" value="  ทำการส่ง  ">
                              <% }else{ %>
                              <input type="submit" name="Submit2" value="  ทำการส่ง  " disabled>
                              <% } %>
                            </div></td>
                        </tr>
                      </table>
                      <input name="id" type="hidden" value="<%=id%>">
                    </form></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td><div align="left"> 
                      <% if (id2.equalsIgnoreCase("0")) {%>
                      <form name="form3" method="post" action="notification4.jsp" >
                        <div align="center"> 
                          <input type="submit" name="Submit3" value=" หยุดทำการส่ง " disabled>
                        </div>
                        <input name="id" type="hidden" value="<%=id2%>" >
                      </form>
                      <% }else{ %>
                      <form name="form3" method="post" action="notification4.jsp">
                        <div align="center"> 
                          <input type="submit" name="Submit3" value=" หยุดทำการส่ง ">
                        </div>
                        <input name="id" type="hidden" value="<%=id2%>" >
                      </form>
                      <% } %>
                    </div></td>
                </tr>
              </table></td>
            <td width="7%">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="3"bgcolor="#FFFF99">&nbsp;</td>
          </tr>
        </table>
      </div></td>
                <td>&nbsp;</td>
        </tr>
        <tr> 
                <td>&nbsp;</td>
                <td><div align="center"> </div></td>
                <td><div align="center"></div></td>
                <td>&nbsp;</td>
        </tr>
</table>
</body>
</html>
