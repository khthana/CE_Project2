<?
		include("function.php");
		include("database.php");
		require_once("connect_db.php");
		require_once("headerofficer.php");
		check_session();
		header_officer("สืบค้นข้อมูลพนักงาน");	
?>	
		<br><br>
		<table align="center" >
                      <tr> 
							<td width="300" align="center">
							<form name="form1" method="post" action="search1.php">
							<tr bgcolor="#6699CC"> 
                              <td align="center">
                                <font face = "MS Sans Serif" color="#FFFFFF" size="2"><b>สืบค้นข้อมูล</b></font>
                                  </td>
                            </tr>

							<tr bgcolor="#33FFFF"> 
								<td>
										<IMG SRC="image/ic_plus.gif" WIDTH="12" HEIGHT="12" BORDER=0 ALIGN="center">
										<a class ="cate" href="form_search6.php">
										<font face = "MS Sans Serif" color="#0000FF" size="2">ข้อมูลพนักงาน</font></a>
                                  </td>
                            </tr>

							<tr bgcolor="#33FFFF"> 
								<td>
							          <IMG SRC="image/ic_plus.gif" WIDTH="12" HEIGHT="12" BORDER=0 ALIGN="center">
								      <a class ="cate" href="form_search7.php">
									  <font face = "MS Sans Serif" color="#0000FF" size="2">ข้อมูลผู้ป่วย</font>
                                 </td>
                            </tr>

							<tr bgcolor="#33FFFF"> 
								<td>
										<IMG SRC="image/ic_plus.gif" WIDTH="12" HEIGHT="12" BORDER=0 ALIGN="center">
										<a class ="cate" href="form_search5.php">
										<font face = "MS Sans Serif" color="#0000FF" size="2">ข้อมูลยา</font>
								</td>
                            </tr>

							<tr bgcolor="#33FFFF"> 
								  <td>
										<IMG SRC="image/ic_plus.gif" WIDTH="12" HEIGHT="12" BORDER=0 ALIGN="center">
										<a class ="cate" href="form_search8.php">
										<font face = "MS Sans Serif" color="#0000FF" size="2">ประวัติการรักษา</font>
								  </td>
                            </tr>        
							
							<tr bgcolor="#33FFFF" align="center"> 
								 <td>
										<font face = "MS Sans Serif" color="#0000FF" size="2">&nbsp;&nbsp;</font>
                                  </td>
                            </tr>

                            </form>
							</td>
                    </tr>
		</table><br><br>
<? 
	require_once("footer.php"); 
?>

