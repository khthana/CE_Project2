<?
include "config.inc.php";

$link = mysql_connect("$host","$db_username","$db_password");
mysql_select_db(regisblog);

############ Check for domain expire #################

$mNow = getdate();
$xNow = $mNow['year']."-".$mNow['mon']."-".$mNow['mday'];
$yNow = $mNow['mday']."/".$mNow['mon']."/".$mNow['year']." ".$mNow['hours'].":".$mNow['minutes'];

$strSQL = "SELECT domain_id,(TO_DAYS( '$xNow' ) - TO_DAYS( valid_date )) AS overdays,service_type,no_user,credit_left FROM domain WHERE TO_DAYS( '$xNow' ) - TO_DAYS( valid_date ) < 7 AND TO_DAYS( '$xNow' ) - TO_DAYS( valid_date ) > 0 LIMIT 0 , 30";
$result = mysql_query($strSQL);
$num = mysql_num_rows($result);

if($num > 0){ // if there is domain expire today

	while($row = mysql_fetch_array($result)){

		$strSQL2 = "SELECT * FROM cron_service WHERE domain_id = '$row[domain_id]'";
		$result2 = mysql_query($strSQL2);
		$row2 = mysql_fetch_array($result2);
		$num2 = mysql_num_rows($result2);
		if($num2 > 0){ // if the domain is changing there service type in incoming month

			if($row2["service_type"] == "unlimited"){ // if service_type = unlimited

				$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'unlimited'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);
				$total = $row3["payment_cost"];

				// if no_user = NULL (in case of service_type = unlimited , change it to 0
				if($row2["no_user"] == ""){
					$row2["no_user"] = "0";
				}

			} else if($row2["service_type"] == "limited"){

				$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_base'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);
				$total = $row3["payment_cost"];

				$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_per_user'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);

				// if no_user in case of service_type = limited has less than current no _user then change no_user to current no_user
				$strSQL3 = "SELECT COUNT(*) FROM user WHERE domain_id = '$row[domain_id]'";
				$result3 = mysql_query($strSQL3);
				$num3 = mysql_fetch_array($result3);

				if($row2["no_user"] < $num3[0]){
					$row2["no_user"] = $num3[0];
				}

				$total = $total + ($row3["payment_cost"] * $row2["no_user"]);

			} // end if service_type = unlimited

			if($row["credit_left"] >= $total){ // if credit left is enough to pay for incoming month

				$strSQL3 = "UPDATE domain SET credit_left = credit_left-$total,valid_date = FROM_DAYS(TO_DAYS(valid_date)+30) WHERE domain_id = $row[domain_id]";
				$result3 = mysql_query($strSQL3);


				$strSQL3 = "UPDATE domain SET service_type = '".$row2["service_type"]."' , no_user = '".$row2["no_user"]."' WHERE domain_id = $row[domain_id]";
				$result3 = mysql_query($strSQL3);

				$strSQL3 = "DELETE FROM cron_service WHERE domain_id = $row[domain_id]";
				$result3 = mysql_query($strSQL3);

				$strSQLEmail = "SELECT * FROM domain,user WHERE domain.admin_user_id = user.user_id AND domain.domain_id = $row[domain_id]";
				$resultEmail = mysql_query($strSQLEmail);
				$rowEmail = mysql_fetch_array($resultEmail);

				list($year,$month,$day) = explode("-",$rowEmail["valid_date"]);

				$sendto = $rowEmail["email"];
				$subject = "แจ้งการหักยอดเงินจากบัญชีของ domain $rowEmail[domain_name]";
				$message = "เรียนคุณ $rowEmail[alias_name] \n \t Regisblog Service ได้ทำการหักยอดเงินจากบัญชีของคุณเป็นจำนวน $total บาท เพื่อใช้เป็นค่าบริการของ domain ของคุณในรอบบิลปัจจุบัน \n ในรอบบิลนี้ คุณได้เปลี่ยนแปลงรูปแบบการให้บริการเป็นแบบ ";

				if($row2["service_type"] == "unlimited"){
					$message = $message."unlimited";
				} else if($row2["service_type"] == "limited"){
					$message = $message."limited โดยมีจำนวน blog ได้ไม่เกิน $row2[no_user] blog";
				}

				$message = $message."\n รอบบิลถัดไปของคุณคือวันที่ :  $day/$month/$year \n ขอบพระคุณเป็นอย่างสูงที่เลือกใช้บริการ Regisblog Service \n Regisblog.com \n service@regisblog.com ";
				$headers = 'Return-Path: service@regisblog.com'."\r\n".'From: service@regisblog.com' . "\r\n" .'Reply-To: service@regisblog.com' . "\r\n".'X-Mailer: PHP/' . phpversion();

				mail($sendto,$subject,$message,$headers);

				$log = file("cron.log");
				$fp = fopen("cron.log" , "w+");
				fputs($fp , "$yNow ; ตัดเงิน $total บาท จาก domain id $row[domain_id] , เปลี่ยน service_type เป็น $row2[service_type] , no_user เป็น $row2[no_user] \n");

				for($i=0;$i<sizeof($log);$i++){
					fputs($fp,$log[$i]);
				}

				fclose($fp);

			} else {

				$strSQLEmail = "SELECT * FROM domain,user WHERE domain.admin_user_id = user.user_id AND domain.domain_id = $row[domain_id]";
				$resultEmail = mysql_query($strSQLEmail);
				$rowEmail = mysql_fetch_array($resultEmail);

				list($year,$month,$day) = explode("-",$rowEmail["valid_date"]);

				$sendto = $rowEmail["email"];
				$subject = "แจ้งเตือนยอดเงินของบัญชี domain $rowEmail[domain_name] ไม่พอต่อการใช้งานรอบเดือนถัดไป";
				$message = "เรียนคุณ $rowEmail[alias_name] \n \t  รอบบิลที่แล้วของคุณได้หมดลงในวันที่ $day/$month/$year ซึ่งยอดเงินในบัญชีปัจจุบันของคุณไม่เพียงพอต่อการใช้งานในเดือนถัดไป (รอบบิลถัดไปของคุณต้องการเงิน $total บาท , ในบัญชีของคุณมียอดเงินคงเหลือ $row[credit_left] บาท) กรุณาเติมเงินภายใน 7 วันหลังจากบัญชีของคุณหมดอายุ หากครบ 7 วันแล้วยังไม่มีการเติมเงิน Regisblog Service ขอสงวนสิทธิ์ในการระงับการใช้งาน domain ของคุณ \n ขอบพระคุณเป็นอย่างสูงที่เลือกใช้บริการ Regisblog Service \n Regisblog.com \n service@regisblog.com ";
				$headers = 'Return-Path: service@regisblog.com'."\r\n".'From: service@regisblog.com' . "\r\n" .'Reply-To: service@regisblog.com' . "\r\n".'X-Mailer: PHP/' . phpversion();

				mail($sendto,$subject,$message,$headers);

			} // end if credit left is enough to pay for incoming month

		} else {

			if($row["service_type"] == "unlimited"){ // if service_type = unlimited

				$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'unlimited'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);
				$total = $row3["payment_cost"];

			} else if($row["service_type"] == "limited"){

				$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_base'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);
				$total = $row3["payment_cost"];

				$strSQL3 = "SELECT * FROM payment_cost WHERE payment_type = 'limited_per_user'";
				$result3 = mysql_query($strSQL3);
				$row3 = mysql_fetch_array($result3);

				$total = $total + ($row3["payment_cost"] * $row["no_user"]);

			} // end if service_type = unlimited

			if($row["credit_left"] >= $total){ // if credit left is enough to pay for incoming month
	
				$strSQL2 = "UPDATE domain SET credit_left = credit_left-".$total.",valid_date = FROM_DAYS(TO_DAYS(valid_date)+30) WHERE domain_id = $row[domain_id]";
				$result2 = mysql_query($strSQL2);

				$strSQLEmail = "SELECT * FROM domain,user WHERE domain.admin_user_id = user.user_id AND domain.domain_id = $row[domain_id]";
				$resultEmail = mysql_query($strSQLEmail);
				$rowEmail = mysql_fetch_array($resultEmail);

				list($year,$month,$day) = explode("-",$rowEmail["valid_date"]);

				$sendto = $rowEmail["email"];
				$subject = "แจ้งการหักยอดเงินจากบัญชีของ domain $rowEmail[domain_name]";
				$message = "เรียนคุณ $rowEmail[alias_name] \n \t Regisblog Service ได้ทำการหักยอดเงินจากบัญชีของคุณเป็นจำนวน $total บาท เพื่อใช้เป็นค่าบริการของ domain ของคุณในรอบบิลปัจจุบัน \n รอบบิลถัดไปของคุณคือวันที่ :  $day/$month/$year \n ขอบพระคุณเป็นอย่างสูงที่เลือกใช้บริการ Regisblog Service \n Regisblog.com \n service@regisblog.com ";
				$headers = 'Return-Path: service@regisblog.com'."\r\n".'From: service@regisblog.com' . "\r\n" .'Reply-To: service@regisblog.com' . "\r\n".'X-Mailer: PHP/' . phpversion();

				mail($sendto,$subject,$message,$headers);

				$log = file("cron.log");
				$fp = fopen("cron.log" , "w+");
				fputs($fp , "$yNow ; ตัดเงิน $total บาท จาก domain id $row[domain_id] \n");

				for($i=0;$i<sizeof($log);$i++){
					fputs($fp,$log[$i]);
				}

				fclose($fp);

			} else {

				$strSQLEmail = "SELECT * FROM domain,user WHERE domain.admin_user_id = user.user_id AND domain.domain_id = $row[domain_id]";
				$resultEmail = mysql_query($strSQLEmail);
				$rowEmail = mysql_fetch_array($resultEmail);

				list($year,$month,$day) = explode("-",$rowEmail["valid_date"]);

				$sendto = $rowEmail["email"];
				$subject = "แจ้งเตือนยอดเงินของบัญชี domain $rowEmail[domain_name] ไม่พอต่อการใช้งานรอบเดือนถัดไป";
				$message = "เรียนคุณ $rowEmail[alias_name] \n \t  รอบบิลที่แล้วของคุณได้หมดลงในวันที่ $day/$month/$year ซึ่งยอดเงินในบัญชีปัจจุบันของคุณไม่เพียงพอต่อการใช้งานในเดือนถัดไป (รอบบิลถัดไปของคุณต้องการเงิน $total บาท , ในบัญชีของคุณมียอดเงินคงเหลือ $row[credit_left] บาท) กรุณาเติมเงินภายใน 7 วันหลังจากบัญชีของคุณหมดอายุ หากครบ 7 วันแล้วยังไม่มีการเติมเงิน Regisblog Service ขอสงวนสิทธิ์ในการระงับการใช้งาน domain ของคุณ \n ขอบพระคุณเป็นอย่างสูงที่เลือกใช้บริการ Regisblog Service \n Regisblog.com \n service@regisblog.com ";
				$headers = 'Return-Path: service@regisblog.com'."\r\n".'From: service@regisblog.com' . "\r\n" .'Reply-To: service@regisblog.com' . "\r\n".'X-Mailer: PHP/' . phpversion();

				mail($sendto,$subject,$message,$headers);

			} // end if credit left is enough to pay for incoming month

		} // end if the domain is changing there service type in incoming month

	} // end while

} // end if there is domain expire today

#############################################


mysql_close($link);
?>