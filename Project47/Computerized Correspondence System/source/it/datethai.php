<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
		function datethai($date)
		{
				$day=substr("$date",6,2);
				$month = substr("$date",4,2);
				$month = (int)$month-1;
				$year = substr("$date",0,4);
				$year =$year+543;
				//$thaimonth = array("ม.ก.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค.");
				$thaimonth = array("มกราคม ","กุมพาพันธ์ ","มีนาคม ","เมษายน ","พฤษภาคม ","มิถุนายน ","กรกฎาคม ","สิงหาคม ","กันยายน ","ตุลาคม ","พฤศจิกายน ","ธันวาคม ");
				$month = $thaimonth[$month];
				return (int)$day." ".$month."".$year;
		} 
		$today =getdate();
		$mmonth = $today["mon"];
		$mday = $today["mday"];
		$myear = $today["year"];
		$data_date=datethai("$myear $mmonth$mday");
		//echo "$data_date";
		$hour =$today["hours"];
		$minute=$today["minutes"];
		$data_time="$hour" .":". "$minute น.";
		//echo "เวลา $data_time";
?>
</body>
</html>
