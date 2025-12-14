<?php
	include('function.php');
	
	head_html("โครงสร้างระบบข้อมูลพื้นฐาน");
	
	check_session();
	check_permit();
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
		<tr>
			<td>			
				<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
					<tr>
						<td><p  align="center" class="headTable">โครงสร้างระบบข้อมูลพื้นฐาน</p></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>		
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00" class="normalFont">
								<tr>
									<td>เมนู แก้ไข/ลบรายการ ระบบข้อมูลพื้นฐาน</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=money_type&row_start=0&row_limit=20">ประเภทแหล่งเงิน</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=money_type_receipt&row_start=0&row_limit=20">ประเภทแหล่งเงินรายรับ</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=sector&row_start=0&row_limit=20">ด้าน</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=program&row_start=0&row_limit=20">แผนงาน</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=project&row_start=0&row_limit=20">โครงการ(กิจกรรมหลัก)</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=activity&row_start=0&row_limit=20">กิจกรรม(กิจกรรมรอง)</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=activity_sub&row_start=0&row_limit=20">กิจกรรมย่อย</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=account&row_start=0&row_limit=20">ประเภทงบ</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=expense_type&row_start=0&row_limit=20">ประเภทรายจ่าย</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=expense_type_sub&row_start=0&row_limit=20">ประเภทรายจ่ายย่อย</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=expense_sub&row_start=0&row_limit=20">หัวข้อรายจ่าย</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=receipt_type&row_start=0&row_limit=20">ประเภทรายรับ</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=receipt_sub&row_start=0&row_limit=20">หัวข้อรายรับ</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=fund&row_start=0&row_limit=20">กองทุน</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=department&row_start=0&row_limit=20">หน่วยงาน</a>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="show_data_basic.php?select=side&row_start=0&row_limit=20">ฝ่าย</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00" class="normalFont">
								<tr>
									<td>เกี่ยวกับผู้ใช้งาน</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;<a href="show_user_profile.php">ผู้ใช้งาน</a></td>
					</tr>					
				</table>
			</td>
		</tr>
	</table>

<?
	end_head_html();
?>