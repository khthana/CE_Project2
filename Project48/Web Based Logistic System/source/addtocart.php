<?
		session_start();
			require('connect.php');
			$today = date("Y-n-j");  
			$intitial=20;
			////////////////// เลือกพื้นที่ ในการคำนวนราคา /////////////////////
			$sql="select  * from place where send_place='$sess_place'  and res_place='$rprovince' ";
			$result=mysql_db_query($dbname,$sql);
			if($result)
			{
			$array=mysql_fetch_array($result);
			$price=$array[place_rate];
			$place_id=$array[place_id];
				////////////////// กรณีน้ำหนัก มากกว่า 20 กิโลกรัม ///////////////
				if($weight>$intitial)
					{
						$sweight=$weight-20;
						$sql="select * from packtype where packid='$packid'";
						$result=mysql_db_query($dbname,$sql);
						if($result){
							$array=mysql_fetch_array($result);
							$packrate=$array[packrate];
							$sprice=$sweight*$packrate;
							$price+=$sprice;
							}
					}
			//print"$raddrs";
					//////////////// บันทึก ตารางการส่ง /////////////////////
			if($nameres==""||$surres==""||$ratt==""||$rmoo==""||$rdistrict==""||$ramphur==""||$rprovince==""||$rzipcode==""||$packid==""||$place_id=="")		
			{
			print"<center>Error!! ท่านกรอกข้อมูลไม่ครบ<br><input type=button onclick='history.back()' value=แก้ไขข้อมูลใหม่></center></center>";
			}else{
			$sql="insert into temp values(null,'$cusid','$nameres','$surres','$ratt','$rmoo','$rdistrict','$ramphur','$rprovince','$rzipcode','$today','$packid','$place_id','$price','$total','$session_id')";
			$result=mysql_db_query($dbname,$sql);
		mysql_close();
		print("บันทึกข้อมูลเรียบร้อยแล้ว");
		print"<meta http-equiv=\"refresh\" content=\"0;URL=viewcart.php\">";
}
}
?>
