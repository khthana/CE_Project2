<?php
        include('function.php');
        include('database.php');
        include('java_script.php');
?>

<?php       
			head_html("แก้ไขรายงานรายจ่ายจริง");
        database_connect();
         java_script();
         
         //print "select * from real_expense where id = ".$id."";
         $db = database_query("select * from real_expense where id = ".$id."");	
			$row = mysql_fetch_array($db);
			
			$row_account = mysql_fetch_array(database_query("select * from account where id = (select account_id from expense_type where id = (select expense_type_id from expense_type_sub where id = (select expense_type_sub_id from expense_sub where id = ".$row["EXPENSE_SUB_ID"].")))")); // งบ
			$row_expense_type = mysql_fetch_array(database_query("select * from expense_type where id = (select expense_type_id from expense_type_sub where id = (select expense_type_sub_id from expense_sub where id = ".$row["EXPENSE_SUB_ID"]."))")); // ประเภทรายจ่าย
			$row_expense_sub = mysql_fetch_array(database_query("select * from expense_sub where id = ".$row["EXPENSE_SUB_ID"].""));					
?>

			<link rel="stylesheet" href="css/style.css" type="text/css" />

        <table width="75%" border="0" cellspacing="10" cellpadding="0" align="center">
                <tr>
                        <td>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FF5C0F" bordercolor="#000000">
                                        <tr>
                                                <td><p  align="center" class="headTable">แก้ไขรายการรายจ่ายจริง</p></td>
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
                                                        <form method="post" <? print "action='process_edit_delete_list.php?mode=edit&select=real_expense&id=".$id."'" ?> name="form">
                                                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ปีงบประมาณ : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><? edit_year_box($row["YEAR"]); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ฝ่าย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php edit_list_box("side",database_query("select * from side where department_id = '08'"),$row["SIDE_ID"]); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ประเภทแหล่งเงิน : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<?php                                                                                 		
                                                                                			edit_list_box("money_type",database_query("select * from money_type"),$row["MONEY_TYPE_ID"]); 
																												?>
																											</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">งาน (กิจกรรมหลัก) : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                <select name="project" size="1" onChange="onCheck2(this.value,document.form.activity,document.form.activity_sub)">
																													<?php
																														$ret = database_query("select * from project");
																														while($rows = mysql_fetch_array($ret)) {
																															if($rows["ID"] == $row["PROJECT_ID"])
																																print "<option value='".$rows[0]."' selected>".$rows[1]."</option>\n";
																															else	
																																print "<option value='".$rows[0]."'>".$rows[1]."</option>\n";
																														}
																													?>
																											</select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">กิจกรรม (กิจกรรมรอง) : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php edit_list_box("activity",database_query("select * from activity"),$row["ACTIVITY_ID"]); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">กิจกรรมย่อย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php edit_list_box("activity_sub",database_query("select * from activity_sub"),$row["ACTIVITY_SUB_ID"]); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">กองทุน : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><?php edit_list_box("fund",database_query("select * from fund"),$row["FUND_ID"]); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">งบ : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                        <select name="account" size="1" onChange="onChange('account',this.value,document.form.expense_type)">
                                                                                                <option value="">---- เลือกรายการ ----</option>
                                                                                                <?php
                                                                                                $ret = database_query("select * from account");
                                                                                                while($rows = mysql_fetch_array($ret)) {
                                                                                                	if($rows["ID"] == $row_account["ID"])
                                                                                                        print "<option value='" . $rows[0] . "' selected>". $rows[1] . "</option>\n";
                                                                                                   else
                                                                                                   		print "<option value='" . $rows[0] . "'>". $rows[1] . "</option>\n";
                                                                                                }
                                                                                                ?>
                                                                                        </select>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">ประเภทรายจ่าย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<select name="expense_type" size="1" onChange="onChange('expense_type',this.value,document.form.expense_sub)">
																														<? print "<option value='".$row_expense_type["ID"]."'>".$row_expense_type["EXPENSE_TYPE"]."</option>" ?>
																												</select>
																											</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">หัวข้อรายจ่าย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%">
                                                                                		<select name="expense_sub" size="1">
																													<? print "<option value='".$row_expense_sub["ID"]."'>".$row_expense_sub["EXPENSE_SUB"]."</option>" ?>
                                                                                		</select>
                                                                                	</td>
                                                                        </tr>
                                                                         <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">เพิ่มเติม : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="expand" <? print "value='".$row["EXPAND"]."'"; ?>></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">วันที่่ : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><? edit_date_box($row["DATE"]); ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">จำนวนเงิน : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="amount" <? print "value='".$row["AMOUNT"]."'"; ?>></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">เอกสารอ้างอิง : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><input type="text" name="ref" <? print "value='".$row["REF_DOCUMENT"]."'"; ?>></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#F3F3F3" align="right" width="30%">คำอธิบาย : </td>
                                                                                <td bgcolor="#F3F3F3" width="70%"><textarea name="description" rows="5" cols="60"><? print $row["DESCRIPTION"]; ?></textarea></td>
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