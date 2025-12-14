<?php
        include('function.php');
        include('database.php');
        include('java_script.php');
?>

<?php       
			head_html("แก้ไขรายงานประมาณการรายรับ");
        database_connect();
         java_script();
         
         //print "select * from estimate_receipt where id = ".$id."";
         $db = database_query("select * from estimate_receipt where id = ".$id."");	
			$row = mysql_fetch_array($db);			
?>

		 <link rel="stylesheet" href="css/style.css" type="text/css" />

       <table width="75%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">แก้ไขรายการประมาณการรายรับ</p></td>
                                        </tr>
                                </table>
                        </td>
                </tr>
                <? if($row["MONEY_TYPE_RECEIPT_ID"] == "42000") { ?>
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
                                                        <? print "<form method='post' action='process_edit_delete_list.php?mode=edit&select=estimate_receipt&money_type_receipt=42000&id=".$id."' name='form'>"; ?>
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
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
                                                                                <td bgcolor="#F3F3F3"><?php edit_year_box($row["YEAR"]); ?></td>
                                                                        </tr>    
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="amount" <? print "value='".$row["AMOUNT"]."'"; ?>></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">คำอธิบาย : </td>
                                                                                <td bgcolor="#F3F3F3"><textarea name="description" rows="5" cols="60"><? print $row["DESCRIPTION"]; ?></textarea></td>
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
                <? } 
                 else if($row["MONEY_TYPE_RECEIPT_ID"] == "43000")  { 
               		$row_receipt_type = mysql_fetch_array(database_query("select * from receipt_type where id = (select receipt_type_id from receipt_sub where id = ".$row["RECEIPT_SUB_ID"].")")); // ประเภทรายรับ			
							$row_receipt_sub = mysql_fetch_array(database_query("select * from receipt_sub where id = (select receipt_sub_id from estimate_receipt where id = ".$id.")"));
                 ?>
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
                                                        <? print "<form method='post' action='process_edit_delete_list.php?mode=edit&select=estimate_receipt&money_type_receipt=43000&id=".$id."' name='form2'>"; ?>
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
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
                                                                                <td bgcolor="#F3F3F3"><?php edit_year_box($row["YEAR"]); ?></td>
                                                                        </tr>  
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">ประเภทรายรับ</td>
                                                                                <td bgcolor="#F3F3F3">                                                                                		
                                                                                		<select name="receipt_type" size="1" onChange="onChange('receipt_type',this.value,document.form2.receipt_sub)">
                                                                                                <option value="">---- เลือกรายการ ----</option>
                                                                                                <?php
                                                                                                $ret = database_query("select * from receipt_type");
                                                                                                while($rows = mysql_fetch_array($ret)) {
                                                                                                	if($rows["ID"] == $row_receipt_type["ID"])
                                                                                                        print "<option value='" . $rows[0] . "' selected>". $rows[1] . "</option>\n";
                                                                                                   else 
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
                                                                                		<? print "<option value='".$row["RECEIPT_SUB_ID"]."'>".$row_receipt_sub["RECEIPT_SUB"]."</option>"; ?>
																										  </select>
                                                                                </td>
                                                                        </tr>                                                                                                                                          
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">เพิ่มเติม : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="expand1" <? print "value='".$row["EXPAND1"]."'"; ?>></td>
                                                                        </tr>                                                                     
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">จำนวนหน่วย * จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="expand2" <? print "value='".$row["EXPAND2"]."'"; ?>></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3"><input type="text" name="amount" <? print "value='".$row["AMOUNT"]."'"; ?>></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right">คำอธิบาย : </td>
                                                                                <td bgcolor="#F3F3F3"><textarea name="description" rows="5" cols="60"><? print $row["DESCRIPTION"]; ?></textarea></td>
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
                <? } ?>
        </table>

<?php
        end_head_html();
?>