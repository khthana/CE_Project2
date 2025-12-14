<?php
	include('function.php');
	
	head_html("เมนูเพิ่มรายการ");
	
	check_session();
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
		<tr>
			<td>			
				<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
					<tr>
						<td><p  align="center" class="headTable">เพิ่มรายการ</p></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>		
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;<a href="form_add_estimate_expense.php">เพิ่มรายการการประมาณการรายจ่าย</a></td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;<a href="form_add_estimate_receipt.php">เพิ่มรายการการประมาณการรายรับ</a></td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;<a href="form_add_real_expense.php">เพิ่มรายการรายจ่ายจริง</a></td>
					</tr>
					<tr>
						<td bgcolor="#F3F3F3">&nbsp;&nbsp;&nbsp;&nbsp;<a href="form_add_real_receipt.php">เพิ่มรายการรายรับจริง</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

<?
	end_head_html();
?>