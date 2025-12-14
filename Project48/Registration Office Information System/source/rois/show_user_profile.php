<?php
	include("function.php");
	include("database.php");
	
	head_html("แสดงข้อมูลผุ้ใช้งาน");
	database_connect();
?>
	
	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="100%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">ข้อมูลผุ้ใช้งาน</p></td>
                                        </tr>
                                </table>
                        </td>
                </tr>
                <tr>
                			<td  align="center">
                					<a href="form_add_user_profile.php"><< เพิ่มผู้ใช้ใหม่ >></a> 
                			</td>
                </tr>
                <tr>
                        <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">                                       
                                        <tr>
                                                <td>                                                        
																	<table width="100%" border="0" cellspacing="1" cellpadding="0">
																		<tr>
																			<td width="20%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center" class="normalFont">FIRST NAME</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="20%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center" class="normalFont">LAST NAME</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="20%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center" class="normalFont">USER NAME</p></td>
																					</tr>
																				</table>
																			</td>																			
																			<td width="20%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center" class="normalFont">PASSWORD</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="10%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center" class="normalFont">STATUS</p></td>
																					</tr>
																				</table>
																			</td>
																			<td width="10%">
																				<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0000DD">
																					<tr>
																						<td bgcolor="#A6A6FF"><p  align="center" class="normalFont">OPERATE</p></td>
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
																			<td bgcolor=<? print $color; ?> class="normalFont"><?php print $rows["FIRST_NAME"]; ?></td>
																			<td bgcolor=<? print $color; ?> class="normalFont"><?php print $rows["LAST_NAME"]; ?></td>
																			<td bgcolor=<? print $color; ?> class="normalFont"><?php print $rows["USER_NAME"]; ?></td>
																			<td bgcolor=<? print $color; ?> class="normalFont"><?php print $rows["PASSWORD"]; ?></td>
																			<td bgcolor=<? print $color; ?>  align="center" class="normalFont">
																				<?php 
																					if($rows["STATUS"] == "0") 
																						print "ผู้ดูแล";
																					else if($rows["STATUS"] == "1")
																						print "ฝ่ายแผนงาน";
																					else if($rows["STATUS"] == "2")
																						print "ฝ่ายการเงิน";
																				?>
																			</td>
																			<td bgcolor=<? print $color; ?>>
																				<?php print "<a href='form_edit_user_profile.php?id=".$rows["ID"]."'>"; ?>
																					<img src="picture/b_edit.gif" width="16" height="16" border="0" alt="แก้ไขข้อมูลนี้้"> 
																				</a>
																				<?php print "<a href='process_user_profile.php?mode=delete&id=".$rows["ID"]."'>"; ?>
																					<img src="picture/b_drop.gif" width="16" height="16" border="0" alt="ลบข้อมูลนี้">
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
        </table>

<?php	
	end_head_html();
?>