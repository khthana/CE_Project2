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
	else if($select == "expense_sub") 	$head = "หัวข้อรายจ่าย";
	else if($select == "receipt_type") 	$head = "ประเภทรายรับ";
	else if($select == "receipt_sub") 	$head = "หัวข้อรายรับ";
	else if($select == "fund") 	$head = "กองทุน";
	else if($select == "department") 	$head = "หน่วยงาน";
	else if($select == "side") 	$head = "ฝ่าย";
?>

	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<table width="75%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">เพิ่มข้อมูล <?php print $head; ?></p></td>
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
                                                <?php
                                                	if(mysql_num_fields($db) == 3) {
                                                		print "<form method='post' action='process_edit_delete_data_basic.php?mode=add&table_name=".$select."' name='form'>";
                                                ?>                                                    
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%" class="normalFont"><?php print mysql_field_name($db, 0); ?> : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<?php
                                                                                			print "<input type='text' name='id'>";
                                                                                		?>
                                                                                	</td>	
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont"><?php print mysql_field_name($db, 1); ?> : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<?php
                                                                                			print "<input type='text' name='var1'>";
                                                                                		?>
                                                                                </td>
                                                                        </tr>                                                                        
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont"><?php print mysql_field_name($db, 2); ?> : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<?php
                                                                                			print "<textarea name='var2' rows='5' cols='60'></textarea>";
                                                                                		?>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                        		  <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>                                                                                
                                                                        </tr>    
                                                                        <tr>
                                                                        		  <td bgcolor="#F3F3F3"></td>
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="Submit"><input type="reset"></td>                                                                                
                                                                        </tr> 
                                                                </table>
                                                        </form>
                                                <?php
                                                }
                                                else if(mysql_num_fields($db) == 4) {
                                                	print "<form method='post' action='process_edit_delete_data_basic.php?mode=add&table_name=".$select."' name='form'>";
                                                ?>                                                		
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%" class="normalFont"><?php print mysql_field_name($db, 0); ?> : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<?php
                                                                                			print "<input type='text' name='id'>";
                                                                                		?>
                                                                                	</td>	
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont"><?php print mysql_field_name($db, 1); ?> : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<?php
                                                                                			print "<input type='text' name='var1'>";
                                                                                		?>
                                                                                </td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont"><?php print mysql_field_name($db, 2); ?> : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<?php
                                                                                			print "<input type='text' name='var2'>";
                                                                                		?>
                                                                                </td>
                                                                        </tr>                                                                    
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" class="normalFont"><?php print mysql_field_name($db, 3); ?> : </td>
                                                                                <td bgcolor="#F3F3F3">
                                                                                		<?php
                                                                                			print "<textarea name='var3' rows='5' cols='60'></textarea>";
                                                                                		?>
                                                                                </td>
                                                                        </tr> 
                                                                         <tr>
                                                                        		  <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>                                                                                
                                                                        </tr>    
                                                                        <tr>
                                                                        		  <td bgcolor="#F3F3F3"></td>
                                                                                
                                                                                <td bgcolor="#F3F3F3"><input type="submit" value="Submit"><input type="reset"></td>                                                                                
                                                                        </tr>   
                                                                </table>
                                                        </form>
                                                <?php
                                                }
                                                ?>                                             
                                                </td>
                                        </tr>
                                </table>
                        </td>
                </tr>
        </table>

<?php
	end_head_html();
?>