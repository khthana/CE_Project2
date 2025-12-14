<html>
<head>
<title>++ Fuzzy Advanced Search ++</title>

<Style>
a:link { Color:blue; TEXT-DECORATION: underline }
a:visited { Color:blue; TEXT-DECORATION: underline } 
a:hover { Color:red; TEXT-DECORATION: underline }
a:active { TEXT-DECORATION: none }

</Style>
<LINK rel="stylesheet"
      href="fig0810.css"
      type="text/css">
</head>

<body bgcolor="#FFFFFF" background="pic/background.jpg">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="16%"><img src="pic/logo_min.jpg" width="163" height="101"></td>
    <td width="84%"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr bordercolor="#FFFFFF" bgcolor="#3333FF"> 
          <td nowrap> 
            <div align="center"><font color="#FFFF66"><b>Advanced Search</b></font></div>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <div align="right"><font size="-3"><a href="search.jsp">Fuzzy normal search</a></font></div>
    </td>
  </tr>
</table>
<form action="search.jsp" method="get">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr bgcolor="#666666"> 
      <td height="30"> 
        <div align="center"><b><font color="#FFFFFF">Fuzzy Advanced Search</font></b></div>
      </td>
    </tr>
    <tr bgcolor="#0099CC"> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="125"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#0099cc">
                <tr> 
                  <td width="20%" vAlign=top bgcolor="#FF9999" nowrap><font size="2"><b><font color="#666666">&nbsp;&nbsp;<font size="1">Find 
                    Result</font></font></b></font></td>
                  <td width="80%"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#0099CC">
                      <tr> 
                        <td bgcolor="#0099cc" width="68%"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="50%" bgcolor="#0099CC" nowrap ><font size=-1> 
                                &nbsp;</font>&nbsp;<font size="-3">with <b>all</b> 
                                of the words</font></td>
                              <td width="50%" vAlign=top bgcolor="#0099CC"> 
                                <input type="text" name="st_and" size="30">
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td bgcolor="#0099CC" width="32%">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#0099cc" width="68%" height="33"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="50%" height="28" bgcolor="#0099CC" nowrap ><font size="-1">&nbsp;</font>&nbsp;<font size="-3">with<b> 
                                operation</b></font></td>
                              <td width="50%" vAlign=bottom bgcolor="#0099CC"> 
                                <select name="operation">
                                  <option value="and" selected>AND</option>
                                  <option value="or">OR</option>
                                </select>
                              </td>
                            </tr>
                            <tr> 
                              <td width="50%" bgcolor="#0099CC" nowrap ><font size=-1>&nbsp;</font>&nbsp;<font size="-3">with 
                                <b>any</b> of the words</font></td>
                              <td width="50%" vAlign=top bgcolor="#0099CC"> 
                                <input type="text" name="st_or" size="30">
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td bgcolor="#0099CC" width="32%" height="33">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#0099cc" width="68%"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="50%" bgcolor="#0099CC" nowrap ><b>&nbsp; 
                                <font size="-3">without</font></b><font size="-3"> 
                                the words</font></td>
                              <td width="50%" vAlign=top bgcolor="#0099CC"> 
                                <input type="text" name="st_not" size="30">
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td bgcolor="#0099CC" width="32%"> 
                          <input type="submit" name="Submit" value="FUZZY  SEARCH">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr bgcolor="#0099cc"> 
            <td> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="20%" bgcolor="#FF9999">&nbsp;</td>
                  <td width="80%" bgcolor="#0099CC">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<input type="hidden" name="from_page" value="adv_search">
</form>
<form action="spe_search.jsp" method="post">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#666666"> 
      <td height="30"> 
        <div align="center"><b><font color="#FFFFFF">Specific Search</font></b></div>
      </td>
    </tr>
    <tr bgcolor="#0099CC"> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="20%" valign="top" bgcolor="#FFFF00" nowrap><font size=+0><b><font size="1" color="#666666">&nbsp;&nbsp;Specific 
              Result </font></b></font></td>
            <td width="80%"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="92%"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="37%" bgcolor="#0099CC" nowrap><font size="-1">&nbsp;&nbsp;</font><font size="-3">search 
                          by <b>Author</b></font></td>
                        <td width="37%" bgcolor="#0099CC"> 
                          <input type="text" name="author" size="30">
                        </td>
                        <td width="26%" bgcolor="#0099CC">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td width="37%" bgcolor="#0099CC" nowrap><font size="-1">&nbsp;&nbsp;</font><font size="-3">search 
                          by <b>Title</b></font></td>
                        <td width="37%" bgcolor="#0099CC"> 
                          <input type="text" name="pname" size="30">
                        </td>
                        <td width="26%" bgcolor="#0099CC">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td width="37%" bgcolor="#0099CC" nowrap> <font size="-1">&nbsp;<font size="-2">&nbsp;search 
                          by <b>Abstract</b></font></font></td>
                        <td width="37%" bgcolor="#0099CC">
                          <input type="text" name="description" size="30">
                        </td>
                        <td width="26%" bgcolor="#0099CC"> 
                          <input type="submit" name="Submit2" value="SPECIFIC  SEARCH">
                        </td>
                      </tr>
                      <tr> 
                        <td width="37%" bgcolor="#0099CC" nowrap>&nbsp;</td>
                        <td width="37%" bgcolor="#0099CC">&nbsp;</td>
                        <td width="26%" bgcolor="#0099CC">&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                  <td width="8%" bgcolor="#0099CC">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="20%" bgcolor="#FFFF00">&nbsp;</td>
            <td width="80%" bgcolor="#0099CC">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
