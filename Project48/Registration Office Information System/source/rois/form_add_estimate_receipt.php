<?php
        include('function.php');
        include('database.php');
        include('java_script.php');
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> เพิ่มรายการรายรับจริง </title>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
</head>

<body onLoad="onLoad(document.form2.receipt_type,document.form2.receipt_sub)">

<?php       
			check_offier_program();

        database_connect();
         java_script2();                           
?>

			<link rel="stylesheet" href="css/style.css" type="text/css" />

        <table width="75%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">เพิ่มรายการประมาณการรายรับ</p></td>
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
                                                        <form method="post" action="process_add_data_to_database.php?mode=estimate_receipt1" name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
                                                                			<tr>
                                                                                <td bgcolor="#F3F3F3"  align="left" width="30%">เงินงบประมาณ </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">ปีงบประมาณ : </td>
                                                                                <td bgcolor="#F3F3F3"><?php year_list_box(); ?></td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="amount"></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">คำอธิบาย : </td>
                                                                                <td bgcolor="#F3F3F3"><textarea name="description" rows="5" cols="60"></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
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
                                                        <form method="post" action="process_add_data_to_database.php?mode=estimate_receipt2" name="form2">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
                                                                			<tr>
                                                                                <td bgcolor="#F3F3F3"  align="left" width="30%">เงินรายได้สถาบัน </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">ปีงบประมาณ</td>
                                                                                <td bgcolor="#F3F3F3"><?php year_list_box(); ?></td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">ประเภทรายรับ</td>
                                                                                <td bgcolor="#F3F3F3">                                                                                		
                                                                                		<select name="receipt_type" size="1" onChange="onChange('receipt_type',this.value,document.form2.receipt_sub)">
                                                                                                <option value="">---- เลือกรายการ ----</option>
                                                                                                <?php
                                                                                                $ret = database_query("select * from receipt_type");
                                                                                                while($rows = mysql_fetch_array($ret)) {
                                                                                                        print "<option value='" . $rows[0] . "'>". $rows[1] . "</option>\n";
                                                                                                }
                                                                                                ?>
                                                                                     </select>
                                                                                	</td>
                                                                        </tr>     
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">หัวข้อรายรับ</td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                <select name="receipt_sub" size="1">
																											</select>
                                                                                </td>
                                                                        </tr>                                                                                                                                          
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">เพิ่มเติม : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="expand1"></td>
                                                                        </tr>                                                                     
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">จำนวนหน่วย * จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="expand2"></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="amount"></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">คำอธิบาย : </td>
                                                                                <td bgcolor="#F3F3F3"><textarea name="description" rows="5" cols="60"></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
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