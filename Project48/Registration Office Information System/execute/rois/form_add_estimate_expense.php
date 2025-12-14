<?php
        include('function.php');
        include('database.php');
        include('java_script.php');
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> เพิ่มรายการการประมาณการรายจ่าย </title>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
</head>

<body onLoad="onLoad(document.form.account,document.form.expense_type,document.form.expense_type_sub,document.form.expense_sub)">

<?php       
			check_offier_program();

        database_connect();
         java_script();                           
?>

			<link rel="stylesheet" href="css/style.css" type="text/css" />

        <table width="75%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">เพิ่มรายการประมาณการรายจ่าย</p></td>
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
                                                <td>
                                                        <form method="post" action="process_add_data_to_database.php?mode=estimate_expense" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ปีงบประมาณ : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php year_list_box(); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ฝ่าย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php list_box("side",database_query("select * from side where department_id = '08'")); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ประเภทแหล่งเงิน : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php list_box("money_type",database_query("select * from money_type")); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">งาน (กิจกรรมหลัก) : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<select name="project" size="1" onChange="onCheck(this.value,document.form.activity)">
																													<?php
																														$ret = database_query("select * from project");
																														while($rows = mysql_fetch_array($ret)) {
																															print "<option value='".$rows[0]."'>".$rows[1]."</option>\n";
																														}
																													?>
																												</select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">กิจกรรม (กิจกรรมรอง) : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php list_box("activity",database_query("select * from activity")); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">กองทุน : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php list_box("fund",database_query("select * from fund")); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">งบ : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                        <select name="account" size="1" onChange="onChange('account',this.value,document.form.expense_type)">
                                                                                                <option value="">---- เลือกรายการ ----</option>
                                                                                                <?php
                                                                                                $ret = database_query("select * from account");
                                                                                                while($rows = mysql_fetch_array($ret)) {
                                                                                                        print "<option value='" . $rows[0] . "'>". $rows[1] . "</option>\n";
                                                                                                }
                                                                                                ?>
                                                                                        </select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ประเภทรายจ่าย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><select name="expense_type" size="1" onChange="onChange('expense_type',this.value,document.form.expense_type_sub)"></select></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ประเภทรายจ่ายย่อย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><select name="expense_type_sub" size="1" onChange="onChange('expense_type_sub',this.value,document.form.expense_sub)"></select></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">หัวข้อรายจ่าย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><select name="expense_sub" size="1"></select></td>
                                                                        </tr>
                                                                         <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">เพิ่มเติม : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="expand"></td>
                                                                        </tr>
                                                                         <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="amount"></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">คำอธิบาย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><textarea name="description" rows="5" cols="60"></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3"></td>
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="Submit"><input type="reset"></td>
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