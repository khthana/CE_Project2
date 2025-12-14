<?php
	global $passkey;
	global $client;

	print "<img src='images/domain_random.jpg' width='190px' height='24px'><br>";

	$params["passkey"] = $passkey;
	$message = $client->call('obtain_randomblog', $params);
	$success = $message["success"];
				
	if ($success == "no") {
		$error_msg = $message["error_message"];
		print "<div style='width:100%; color:#FF0000; background-color:#FFFFCC; text-align:center;'>".$error_msg."</div>"; 
	} else {
		$other_title = $message["title"];
		$other_url = $message["url"];
		$i = 0;

		print "<div style='text-align:left; width:95%; padding:3px; margin:2px;'>";

		while ($other_url[$i]) {
			(strlen($other_title[$i]) > 35)  ? $other_title[$i] = substr ($other_title[$i],0,32)."..." : "" ;
			print "<img src='images/domain_bullet2.jpg' width='20' height='20'>
					<a href=\"".$other_url[$i]."\" class=\"green\">".$other_title[$i]." </a><br>";
			$i++;
		}

		print "</div>";
	}
?>