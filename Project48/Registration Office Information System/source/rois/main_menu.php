<?php
	include('function.php');
	
	head_html("เมนูหลัก");
?>

<link rel="stylesheet" href="css/style.css" type="text/css" />

<table width="60%" border="0" cellspacing="8" cellpadding="0" align="center">
	<tr>
		<td width="20%">
			<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
				<tr>
					<td>
							 <p  align="center">							 		
									<a href="main_report_menu.php" target="mainFrame"><img src="picture/news_info.gif" width="16" height="16" border="0" alt="ดูรายงาน">รายงาน</a>
							 </p>
				   </td>
				</tr>
			</table>
		</td>
		<td width="20%">
			<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
				<tr>
					<td>
							<p  align="center">
									<a href="add_list_menu.php" target="mainFrame"><img src="picture/news_general.gif" width="16" height="16" border="0" alt="เพิ่มรายการ">เพิ่มรายการ</a>
							</p>
					</td>
				</tr>
			</table>
		</td>
		<td width="20%">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
					<tr>
						<td>
								<p  align="center">
										<a href="main_edit_list_menu.php" target="mainFrame"><img src="picture/forum_newmsg.gif" width="16" height="16" border="0" alt="แก้ไข/ลบ">แก้ไข/ลบ</a>
								</p>
						</td>
					</tr>
				</table>
		</td>
		<td width="20%">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
					<tr>
						<td>
								<p  align="center">
										<a href="basic_data_menu.php" target="mainFrame"><img src="picture/profile_small.gif" width="14" height="15" border="0" alt="ผู้ดูแล">ผู้ดูแล</a>
								</p>
						</td>
					</tr>
				</table>
		</td>
		<td width="20%">
				<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
					<tr>
						<td>
								<p  align="center">
										<a href="logout.php" target="mainFrame"><img src="picture/logoff_small.gif" width="16" height="16" border="0" alt="ออกจากระบบ">ออกจากระบบ</a>
								</p>
						</td>
					</tr>
				</table>
		</td>
	</tr>
</table>

<?php
	end_head_html();
?>