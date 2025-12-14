<?
		include("database.php");
		include("function.php");	
		require_once("connect_db.php");
		require_once("headerofficer.php");
		require_once("connect_db.php");
		require_once("check_data.php");
		check_session();
		header_officer("สืบค้นข้อมูลพนักงาน");		
?>	
		<br><br>
		<table align="center" >
                      <tr> 
							<td width="300" align="center">
								<form name="form1" method="post" action="search5.php">
									<tr bgcolor="#6699CC"> 
										<td colspan="3" align="center">
											<font face = "MS Sans Serif" color="#FFFFFF" size="2"><b>สืบค้นข้อมูลยา</b></font>
										</td>
									</tr>
									
									<tr> 
										<td bgcolor="#33FFFF"><font face = "MS Sans Serif" color="#000000" size="2"><b>ค้นหาจาก:</b></font>
											<SELECT  name=type>
												<OPTION  value = DgID>- รหัสยา</OPTION>
												<OPTION  value = DgName>- ชื่อยา</OPTION>
											</SELECT>
										</td>
										
										<td bgcolor="#33FFFF">
											<font face = "MS Sans Serif" color="#000000" size="2"><b>ค้นหา: </b></font>
											<input type="text" name="search" >
										</td>
                            
										<td>
											<input type="submit" name="Search" value="ค้นหาข้อมูล">
										</td>
									</tr>
                            </form>
						</td>
                    </tr>
		</table>
		<br><br>
<? 
	require_once("footer.php"); 
?>