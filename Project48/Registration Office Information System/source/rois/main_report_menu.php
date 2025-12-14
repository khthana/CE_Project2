<?php
	include('function.php');
	include('database.php');
	
	head_html("เมนูรายงาน");
	database_connect();	
		
	check_session();	
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
		<tr>
			<td>			
				<table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
					<tr>
						<td><p  align="center" class="headTable">รายงาน</p></td>
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
									<td>รายงานการประมาณการรายจ่าย</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>	
							<form method="post" action="report_estimate_expense.php">					
								<table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
									<tr>
										<td bgcolor="#F3F3F3" align="right" width="30%">ปีงบประมาณ : </td>
										<td bgcolor="#F3F3F3" width="70%"><?php year_list_box(); ?></td>
									</tr>
									<tr>
										<td bgcolor="#F3F3F3" align="right">ฝ่าย : </td>
										<td bgcolor="#F3F3F3"><?php list_box2("side",database_query("select * from side where department_id = '08'")); ?></td>
									</tr>
									<tr>
										<td bgcolor="#F3F3F3"></td>
										<td bgcolor="#F3F3F3"><input type="submit" value="Submit"></td>
									</tr>
								</table>
							</form>	
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
									<td>รายงานการประมาณการรายรับ</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>	
							<form method="post" action="report_estimate_receipt.php">					
								<table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
									<tr>
										<td bgcolor="#F3F3F3" align="right" width="30%">ปีงบประมาณ : </td>
										<td bgcolor="#F3F3F3" width="70%"><?php year_list_box(); ?></td>
									</tr>									
									<tr>
										<td bgcolor="#F3F3F3"></td>
										<td bgcolor="#F3F3F3"><input type="submit" value="Submit"></td>
									</tr>
								</table>
							</form>	
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
									<td>รายงานรายจ่ายจริง</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>	
							<form method="post" action="report_real_expense.php">					
								<table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
									<tr>
										<td bgcolor="#F3F3F3" align="right" width="30%">ปีงบประมาณ : </td>
										<td bgcolor="#F3F3F3" width="70%"><?php year_list_box(); ?></td>
									</tr>	
									<tr>
										<td bgcolor="#F3F3F3" align="right">ฝ่าย : </td>
										<td bgcolor="#F3F3F3"><?php list_box2("side",database_query("select * from side where department_id = '08'")); ?></td>
									</tr>								
									<tr>
										<td bgcolor="#F3F3F3"></td>
										<td bgcolor="#F3F3F3"><input type="submit" value="Submit"></td>
									</tr>
								</table>
							</form>	
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
									<td>รายงานรายรับจริง</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>	
							<form method="post" action="report_real_receipt.php">					
								<table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
									<tr>
										<td bgcolor="#F3F3F3" align="right" width="30%">ปีงบประมาณ : </td>
										<td bgcolor="#F3F3F3" width="70%"><?php year_list_box(); ?></td>
									</tr>									
									<tr>
										<td bgcolor="#F3F3F3"></td>
										<td bgcolor="#F3F3F3"><input type="submit" value="Submit"></td>
									</tr>
								</table>
							</form>	
						</td>
					</tr>					
				</table>
			</td>
		</tr>						
	</table>

<?php
	end_head_html();
?>