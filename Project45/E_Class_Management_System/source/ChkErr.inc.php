<?php
	function CheckSpace($STR,$STRNAME){
		//$STR=trim($HTTP_POST_VARS[$STR]);
		$STR = trim($STR);
		//echo $STR;
		if($STR == '' ){
			$ERRORMESSAGE="String ".$STRNAME." is Emtry.";
			Error($ERRORMESSAGE);
			exit;
		}
	}
	
	function ShowErr($message) {
			$ERRORMESSAGE = $message;
			Error($ERRORMESSAGE);
	}

	function Error($ALERT){
		print "<script language=javascript>";
	    print "alert('".$ALERT."');";
	    print "history.back();";
	    print "</script>";
	}
?>