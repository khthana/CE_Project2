	<?
		$pos=strpos ($date_post,"-");
		$year = substr ($date_post,0,$pos);    // returns "bcdef"
		$date_post = substr ($date_post,$pos+1);	

		$pos=strpos ($date_post,"-");
		$month = substr ($date_post,0,$pos);    // returns "bcdef"
		$date_post = substr ($date_post,$pos+1);	
		
		$date=$date_post; 

		$date_post= $date."/".$month."/".$year;
	?>