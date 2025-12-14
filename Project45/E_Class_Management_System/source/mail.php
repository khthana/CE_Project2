<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
	require('./libraries/grab_globals.lib.php');
	function sendmail($sender,$recipient,$subject,$message) {
		define('CRLF', "\r\n"); 

		$server='161.246.4.3';
		$recipient=$recipient;
		$from = $sender;
		$subj=$subject;
		$msg=$message;
	
		//echo "<b>เชื่อมต่อซอคเก็ต....</b>";
		$sock = fsockopen ($server, 25); 
		if (!$sock) {		//echo "<br>อะจึ๋ย! ติดต่อ $server มะได้!*&@!";
			return false;
		}
		else {
			//echo "ติดต่อ SMTP $server Ok..<br>";
		   $reply = fgets ($sock, 1024); 		//echo $reply;

			fputs ($sock, "HELO IAMPONG\r\n");  	//echo "ส่ง: HELO IAMPONG<br>";
			$reply = fgets ($sock, 1024);  //echo "$reply <hr>";
			$pattern1 = "^250";
		 	if(!ereg($pattern1,$reply))  {
		  		return false;
		  		exit;
			}
			
			fputs($sock, "MAIL FROM: <$from>\r\n"); 		   //echo htmlspecialchars("ส่ง: MAIL FROM: $from")."<br>";
		   $reply = fgets ($sock, 1024); 			//echo "$reply<hr>";
		
			fputs ($sock, "RCPT TO: <$recipient>\r\n");			//echo htmlspecialchars("ส่ง: RCPT TO: <$recipient>")."<br>";
			$reply = fgets ($sock, 1024); 		//echo "$reply<hr>";
			$pattern1 = "^250";
		 	if(!ereg($pattern1,$reply))  {
		  		return false;
		  		exit;
			}
		
			fputs ($sock, "DATA\n");			//echo "ส่ง: DATA<br>";
			$reply = fgets ($sock, 1024); 			//echo "$reply<hr>";
			$pattern1 = "^354";
		 	if(!ereg($pattern1,$reply))  {
		  		return false;
		  		exit;
			}

			$body="To:$recipient".CRLF.
				"From: $from".CRLF.  
				"Subject: $subj".CRLF.
				"Content-Type: text/html; charset=windows-874".CRLF.
				"X-Priority: 1".CRLF.
				CRLF.   
				$msg.CRLF.".".CRLF;			//echo $body;
		
			fputs ($sock, "$body");  			//echo "ส่ง: ข้อมูล body และจบด้วย . จุด<br>";
			$reply = fgets ($sock, 1024); 			//echo "$reply<hr>";
			$pattern1 = "^250";
		 	if(!ereg($pattern1,$reply))  {
		  		return false;
		  		exit;
			}

			fputs ($sock, "QUIT\r\n"); 			//echo "ส่ง: QUIT<br>";
			$reply = fgets ($sock, 1024); 			//echo "$reply<br>";
			$pattern1 = "^221";
		 	if(!ereg($pattern1,$reply))  {
		  		return false;
		  		exit;
			}
			else	return true;
		  }
	}
?>

</body>
</html>
