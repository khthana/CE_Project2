<?php
	// function for form_estimate_expense and form_real_expense
	function java_script() {
?>
		<script language="JavaScript">		
<?php
		// ประเภทรายจ่าย
		$ret = database_query("select * from expense_type");
		$numberOfRow = mysql_num_rows($ret);
		print "var expense_type_row = ".$numberOfRow.";";
		print "var expense_type_text = new Array(" . $numberOfRow . ");\n";
		print "var expense_type_id = new Array(" . $numberOfRow . ");\n";
		print "var expense_type_account_id = new Array(" . $numberOfRow . ");\n";
		$i = 0;
		while($object = mysql_fetch_array($ret)){
			print "expense_type_id[" . $i . "]='" . $object[0] . "';     expense_type_text[" . $i . "] = '" . $object[1] . "';      expense_type_account_id[" . $i . "] = '" . 	$object[2] . "'; \n";
			$i++;
		}
		print "\n";
		// ประเภทรายจ่ายย่อย
		$ret = database_query("select * from expense_type_sub");
		$numberOfRow = mysql_num_rows($ret);
		print "var expense_type_sub_row = ".$numberOfRow.";";
		print "var expense_type_sub_text = new Array(" . $numberOfRow . ");\n";
		print "var expense_type_sub_id = new Array(" . $numberOfRow . ");\n";
		print "var expense_type_sub_expense_type_id = new Array(" . $numberOfRow . ");\n";
		$i = 0;
		while($object = mysql_fetch_array($ret)){
			print "expense_type_sub_id[" . $i . "]='" . $object[0] . "';     expense_type_sub_text[" . $i . "] = '" . $object[1] . "';      expense_type_sub_expense_type_id[" . $i . "] = '" . 	$object[2] . "'; \n";
			$i++;
		}
		print "\n";
		// หัวข้อรายจ่าย
		$ret = database_query("SELECT * FROM expense_sub;");
		$numberOfRow = mysql_num_rows($ret);	
		print "var expense_sub_row = ".$numberOfRow.";\n";
		print "var expense_sub_text = new Array(" . $numberOfRow . ");\n";
		print "var expense_sub_id = new Array(" . $numberOfRow . ");\n";
		print "var expense_sub_expense_type_sub_id = new Array(" . $numberOfRow . ");\n";
		$i = 0;
		while($object = mysql_fetch_array($ret)) {
			print "expense_sub_id[" . $i . "]='" . $object[0] . "';     expense_sub_text[" . $i . "] = '" . $object[1] . "';      expense_sub_expense_type_sub_id[" . $i . "] = '" . $object[2] . "';\n";
			$i++;
		}
		print "\n";
?>
		function onChange(select,id,obj,obj2) {
			var count = 0;	
			var temp = '0';	
			//alert(select);
			if(select == "account") {
					obj.options[count] = new Option("---- เลือกรายการ -----","");
					count++;
					for(var i=0;i<expense_type_row;i++) {
						if(expense_type_account_id[i] == id) {
							obj.options[count] = new Option(expense_type_text[i],expense_type_id[i]);
							count++;
						}
					}
					obj.length = count;								
			}
			else if(select == "expense_type") {
					obj.options[count] = new Option("---- เลือกรายการ ----","");
					count++;
					for(var i=0;i<expense_type_sub_row;i++) {
						if(expense_type_sub_expense_type_id[i] == id) {
							obj.options[count] = new Option(expense_type_sub_text[i],expense_type_sub_id[i]);
							count++;
						}					
					}		
					obj.length = count;							
			}
			else if(select == "expense_type_sub") {
				obj.options[count] = new Option("---- เลือกรายการ ----","");
				count++;
				for(var i=0;i<expense_sub_row;i++) {
					if(expense_sub_expense_type_sub_id[i] == id) {
						obj.options[count] = new Option(expense_sub_text[i],expense_sub_id[i]);
						count++;
					}					
				}
				obj.length = count;					
			}		
		}
	
		function onLoad(obj,obj2,obj3,obj4) {
			obj.options[0].selected = true;
			obj2.options[0] = new Option('---- เลือกรายการ ----','');
			obj3.options[0] = new Option('---- เลือกรายการ ----','');
			obj4.options[0] = new Option('---- เลือกรายการ ----','');
		}
		
		function onCheck(value,obj) {
			if(value == "0201" || value == "0301" || value == "0401") {
				obj.options[obj.length - 1].selected = true;
			}		
		}
		
		function onCheck2(value,obj,obj2) {
			if(value == "0201" || value == "0301" || value == "0401") {				
				obj.options[obj.length - 1].selected = true;
				obj2.options[obj2.length - 1].selected = true;
			}		
		}
		</script>
<?
	}
?>


<?php
	// function for form_estimate_receipt and form_real_receipt
	function java_script2() {
?>
		<script language="JavaScript">		
<?php
		// หัวข้อรายจ่าย
		$ret = database_query("SELECT * FROM receipt_sub;");
		$numberOfRow = mysql_num_rows($ret);	
		print "var receipt_sub_row = ".$numberOfRow.";\n";
		print "var receipt_sub_text = new Array(" . $numberOfRow . ");\n";
		print "var receipt_sub_id = new Array(" . $numberOfRow . ");\n";
		print "var receipt_sub_receipt_type_id = new Array(" . $numberOfRow . ");\n";
		$i = 0;
		while($object = mysql_fetch_array($ret)) {
			print "receipt_sub_id[" . $i . "]='" . $object[0] . "';     receipt_sub_text[" . $i . "] = '" . $object[1] . "';      receipt_sub_receipt_type_id[" . $i . "] = '" . $object[2] . "';\n";
			$i++;
		}
		print "\n";
?>
		function onChange(select,id,obj) {
			var count = 0;		
			//alert(id);
			if(select == "receipt_type") {
				//alert(select);
				obj.options[count] = new Option("---- เลือกรายการ -----","");
				count++;
				for(var i=0;i<receipt_sub_row;i++) {
					if(receipt_sub_receipt_type_id[i] == id) {
						obj.options[count] = new Option(receipt_sub_text[i],receipt_sub_id[i]);
						count++;
					}
				}				
			}
			obj.length = count;						
		}
	
		function onLoad(obj,obj2) {
			obj.options[0].selected = true;
			obj2.options[0] = new Option("---- เลือกรายการ -----","");
		}		
		</script>
<?
	}
?>