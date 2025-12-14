<?php
	include("function.php");
	include("database.php");
	require_once("headeradmin.php");
	check_permit();
	header_admin("สืบค้นข้อมูลพนักงาน");	
	database_connect();
?>
	<br>
	<table width="85%" border="0" cellspacing="10" cellpadding="0" align="center">
         <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">                                       
                                        <tr>
                                                <td>                                                        
																	<table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
																			<td width="20%">
																				<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">ชื่อ</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="20%">
																				<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">นามสกุล</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="20%">
																				<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">ชื่อผู้ใช้</p></td>
																					</tr>
																				</table>
																			</td>																			
																			<td width="20%">
																				<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">รหัสผ่าน</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="10%">
																				<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">สถานะ</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="10%">
																				<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center">ดำเนินการ</p></td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<?php
																		$db = database_query("select * from user_profile");
																		$isRow = true;
																		$color;
																		while($rows = mysql_fetch_array($db)) {
																			if($isRow) {
																				$color = "#F3F3F3";
																				$isRow = false;
																			}
																			else {
																				$color = "#FAFAFA";
																				$isRow = true;
																			}
																		?>
																		<tr>
																			<td bgcolor=<? print $color; ?>><?php print $rows["FIRST_NAME"]; ?></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows["LAST_NAME"]; ?></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows["USER_NAME"]; ?></td>
																			<td bgcolor=<? print $color; ?>><?php print $rows["PASSWORD"]; ?></td>
																			<td bgcolor=<? print $color; ?>  align="left">
																				<?php 
																					if($rows["STATUS"] == "0") 
																						print "ผู้ดูแล";
																					else if($rows["STATUS"] == "1")
																						print "พนักงาน";
																					else
																						print "สมาชิก";
																				?>
																			</td>
																			<td align="center" bgcolor=<? print $color; ?>>
																				<?php print "<a href='form_edit_user_profile.php?id=".$rows["ID"]."'>"; ?>เเก้ไข 
																				</a>&nbsp;&nbsp;
																				<?php print "<a href='process_user_profile.php?mode=delete&id=".$rows["ID"]."'>"; ?>ลบ
																				</a>
																			</td>
																		</tr>
																		<?php
																		}
																		?>
																	</table>
                                                </td>
                                        </tr>
                                </table>
                        </td>
                </tr>
					<tr>
							<td align="center"><IMG SRC="image/icon_online.gif" WIDTH="25" HEIGHT="18" BORDER=0 ALT=""></td>
					</tr>
					<tr>		
                			<td  align="center">
                					<a href="form_add_user_profile.php"><< เพิ่มผู้ใช้ใหม่ >></a> 
                			</td>
                </tr>
        </table>

<?php	
	require_once("footer.php");
?>