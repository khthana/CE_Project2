<?
		include("database.php");
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("connect_db.php");
		require_once("check_data.php");
		check_permit();
		header_admin("สืบค้นข้อมูลผู้ป่วย");		
?>	
		<br><br>
		<table align="center" >
                      <tr> 
							<td width="300" align="center">
								<form name="form1" method="post" action="search2.php">
									<tr bgcolor="#6699CC"> 
										<td colspan="3" align="center">
											<font face = "MS Sans Serif" color="#FFFFFF" size="2"><b>สืบค้นข้อมูลผู้ป่วย</b></font>
										</td>
									</tr>
									
									<tr> 
										<td bgcolor="#33FFFF"><font face = "MS Sans Serif" color="#000000" size="2"><b>ค้นหาจาก:</b></font>
											<SELECT  name=type>
												<OPTION  value = PatientID>- รหัสผู้ป่วย</OPTION>
												<OPTION  value = DoctorID>- รหัสเเพทย์</OPTION>
												<OPTION  value = ContactID>- รหัสญาติ</OPTION>
												<OPTION  value = FName>- ชื่อ</OPTION>
												<OPTION  value = Name>- ชื่อเต็ม</OPTION>
												<OPTION  value = LName>- นามสกุล</OPTION>
												<OPTION  value = Mobile_Phone>- เบอร์โทรศัพท์มือถือ</OPTION>
												<OPTION  value = Phone>- เบอร์โทรศัพท์บ้าน</OPTION>
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