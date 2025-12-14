<html>
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ต</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="./style.css" rel="stylesheet" type="text/css">
</head>
<body>
 <?php
 require('./libraries/grab_globals.lib.php');
 include('./connectDB.php');
 function update_quiz($CHID,$CID,$TF,$CH,$Pass){
									connect_db();
									$sql="UPDATE chapters SET TF=$TF,CH= $CH,Pass=$Pass WHERE ID=$CHID";
									$result=mysql_query($sql);
									if(!$result)
									{
											mysql_close();
											echo"<center>";
											echo "ไม่สามารถแก้ไข เนื้อหาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
								else	
								mysql_close();
	}
 	if($ok)
	{
	for( $i=0;$i< count($chapter);$i++)
		{
				// if emty $CH initialize $CH=0
				if(!$CH)
				$CH=0;
				// if emty $TF initialize $TF=0
				if(!$TF)
				$TF=0;
				update_quiz($chapter[$i],$ID,$TF,$CH,$Pass);
				echo "สร้างแบบทดสอบเรียบร้อยแล้วครับ";
	   	}
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= quiz.php?TID=$TID&ID=$ID\">";// ให้มัน refresh หน้าจอใหม่ 
	 }  
 ?>
</body>
</html>
