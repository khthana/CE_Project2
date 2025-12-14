<?php
	include("function.php");
	include("database.php");
	
	head_html("เพิ่มข้อมูล");
	database_connect();
	
	$db = database_query("select * from ".$select."");	
	//$row = mysql_fetch_array($db);
	
	$head = "";
	if($select == "money_type")		$head = "ประเภทแหล่งเงิน";
	else if($select == "money_type_receipt") 	$head = "ประเภทแหล่งเงินรายรับ";
	else if($select == "sector") 	$head = "ด้าน";
	else if($select == "program") 	$head = "แผนงาน";
	else if($select == "project") 	$head = "โครงการ";
	else if($select == "activity") 	$head = "กิจกรรม";
	else if($select == "activity_sub") 	$head = "กิจกรรมย่อย";
	else if($select == "account") 	$head = "งบ";
	else if($select == "expense_type") 	$head = "ประเภทรายรจ่าย";
	else if($select == "expense_type_sub") 	$head = "ประเภทรายรจ่ายย่อย";
	else if($select == "expense_sub") 	$head = "หัวข้อรายจ่าย";
	else if($select == "receipt_type") 	$head = "ประเภทรายรับ";
	else if($select == "receipt_sub") 	$head = "หัวข้อรายรับ";
	else if($select == "fund") 	$head = "กองทุน";
	else if($select == "department") 	$head = "หน่วยงาน";
	else if($select == "side") 	$head = "ฝ่าย";
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="50%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">ค้นหาข้อมูล <?php print $head; ?></p></td>
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
                                                <?                                                	
                                                		print "<form method='post' action='form_edit_data_basic.php?select=".$select."' name='form'>";
                                                ?>                                                    
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0" class="normalFont">
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ID : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<?php
                                                                                			print "<input type='text' name='id'>";
                                                                                		?>
                                                                                	</td>	
                                                                        </tr>                                                                        
                                                                        <tr>
                                                                        		  <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>                                                                                
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