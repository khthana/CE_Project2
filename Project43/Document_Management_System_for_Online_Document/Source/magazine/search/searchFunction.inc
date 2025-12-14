<?
// Check and edit user's input to correct input form.
function correctInputForm($clause) {
 //conver input to "...+...+...".
   while (strpos($clause," +"))
      $clause = str_replace(" +","+",$clause);
   while (strpos($clause,"+ "))
      $clause = str_replace("+ ","+",$clause);
 //conver input to "...-...-...".
	while (strpos($clause," -"))
      $clause = str_replace(" -","-",$clause);
   while (strpos($clause,"- "))
      $clause = str_replace("- ","-",$clause);
 //conver input to "...&...&...".
	while (strpos($clause," &"))
      $clause = str_replace(" &","&",$clause);
   while (strpos($clause,"& "))
      $clause = str_replace("& ","&",$clause);
 //conver input to "...\...\...".
   while (strpos($clause,"/ "))
      $clause = str_replace("/ ","/",$clause);
 //conver input to "... ... ...".
	while (strpos($clause,"  "))
      $clause = str_replace("  "," ",$clause);
	return $clause;
}
//-----------------------------------------------------------------
function get_operation($clause) {
	trim($clause);
	if (strpos(" $clause","+") == 1)
		$opt = "+";
	else if (strpos(" $clause","-") == 1)
		$opt = "-";
	else if (strpos(" $clause","&") == 1)
		$opt = "&";
	return $opt; 
}
function token_index($clause) {
	trim($clause);
// *If token is "string".
	$found = false;
	if ((strpos(" $clause","\\\"") == 1)) {
		$index = strlen($clause);
		$tem = strpos(" $clause","\"+");
		if ($tem>0 && $tem<$index) {
			$index = $tem+1;
			$found = true;
		}
		$tem = strpos(" $clause","\"-");
		if ($tem>0 && $tem<$index) {
			$index = $tem+1;
			$found = true;
		}
		$tem = strpos(" $clause","\"&");
		if ($tem>0 && $tem<$index) {
			$index = $tem+1;
			$found = true;
		}
		$tem = strrpos(" $clause","\\\"");
		if ( !$found && ($tem>1) && ($tem == strlen($clause)-1) ) {
			$index = strlen($clause)+1;
			$found = true;
		}
	}
// *If token is string.
	if (!$found) {
		$index = 1;
		while ($clause!="" && !$found) {
			if (strpos(" $clause","\\\\") == 1) {
				$buffer = $clause;
				$buffer = substr($buffer,3);
				if (strpos(" $buffer","\\") == 1) {
					$clause = substr($clause,2);
					$index = $index + 2;
					if (strpos(" $clause","\\") != 1) {
						$clause = $buffer;
						$index++;
					}
				}
				else {
					$clause = $buffer;
					$index = $index + 3;
				}
			}
			else if ((strpos(" $clause","+") == 1) ||
					   (strpos(" $clause","-") == 1) ||
					   (strpos(" $clause","&") == 1)) {
				$found = true;
			}
			else {
				$clause = substr($clause,1);
				$index++;				
			}
		}
	}
	return $index-1;
}
//------------------------------------------------------------
// Tranfer text field.
function SQLcondition ($clause,$con) {
// *Convert to syntax.
	trim($clause);
	while ($clause!="") {
	// *Set variable.
		$boolean = "";
		$open_brace = "";
	   $per = "%";
		$like = "like";
		$close_brace = "";
	// *Read fist operation.
      $opt = get_operation($clause);
		if ($opt != "")
		   $clause = substr($clause,1);
	// *Read token.
      $index = token_index($clause);
		$token = substr($clause,0,$index);
	// Check braces.
		while (strpos(" $token","(") == 1) {
	      $token = substr($token,1);
			$open_brace = $open_brace."(";
		}
		$tem = strlen($token);
		while ( ($tem>0 && (strrpos(" $token",")")==$tem) && (strrpos(" $token","\\)")!=$tem-1)) ||
					$token == ")") {
			$token = substr($token,0,$tem-1);
			$tem = strlen($token);
			$close_brace = $close_brace.")";
		}
		$clause = substr($clause,$index);
	// *Conver "..." to ...
		$buffer = trim($token);
		$buffer = substr($buffer,2);
		if ( (strpos(" $token","\\\"")==1) &&
		     (strrpos(" $buffer","\"")==strlen($buffer)) && strlen($buffer)>0) {
			$token = substr($token,2);
	      $token = substr($token,0,strlen($token)-2);
			$per = "";
			$like = "=";
		}
		else {
			while (strpos(" $token","\\+"))
				$token = str_replace("\\+","+",$token);
			while (strpos(" $token","\\-"))
				$token = str_replace("\\-","-",$token);
			while (strpos(" $token","\\&"))
				$token = str_replace("\\&","&",$token);
			while (strpos(" $token","\\("))
				$token = str_replace("\\(","(",$token);
			while (strpos(" $token","\\)"))
				$token = str_replace("\\)",")",$token);
			while (strpos(" $token","%%"))
				$token = str_replace("%%","%",$token);
		}
	// *Check '%'.
		if (strpos(" $token","%"))
			$per = "";
	// *Check and,or,and.
		if ($opt == "-") {
			$boolean = "and not";
			if ($open_brace == "") {
				$open_brace = "(";
				$close_brace = $close_brace.")";
			}
		}
		else if ($opt == "+")
			$boolean = " or";
		else if ($opt == "&")
			$boolean = "and";
	// *Insert condition.
		if ($con == "key_word") {
			$like = "=";
			$per = "";
		}
		$condition = $condition." $boolean $open_brace $con $like \"$per".trim($token)."$per\"$close_brace";
	}
	trim($condition);
	if ($condition != "") {
		$clause = " and ($condition)";
	   while (strpos($clause,"  "))
	      $clause = str_replace("  "," ",$clause);
		while (strpos($clause," and $con like \"%%\""))
	      $clause = str_replace(" and $con like \"%%\"","",$clause);
		while (strpos($clause," $con like \"%%\" and"))
	      $clause = str_replace(" $con like \"%%\" and","",$clause);
		while (strpos($clause," or $con like \"%%\""))
	      $clause = str_replace(" or $con like \"%%\"","",$clause);
		while (strpos($clause," $con like \"%%\" or"))
	      $clause = str_replace(" $con like \"%%\" or","",$clause);
		while (strpos($clause,"( or"))
			$clause = str_replace("( or","(",$clause);
		while (strpos($clause,"( and"))
			$clause = str_replace("( and","(",$clause);
		while (strpos(" $clause"," and ()"))
			$clause = str_replace(" and ()","",$clause);
	}
   return $clause;
}
//------------------------------------------------------------
// Tranfer date.
function dateCondition ($dateIni,$monthIni,$yearIni,$dateDes,$monthDes,$yearDes) {
   // --- Set date/month/year.
   $ini_YMD = $yearIni."/".$monthIni."/".$dateIni;				//line 30
   $des_YMD = $yearDes."/".$monthDes."/".$dateDes;
   if ($ini_YMD == $des_YMD) {
		$yearDes = "";
		$rather = "=";
	}
	else {
      $rather = ">=";
		$less = "<=";
   }
   if ($yearIni) {
      $ini_YMD = "$rather \"$ini_YMD\"";
      if ($yearDes > $yearIni) $and = "and date_write";
      else if ($yearDes < $yearIni) $and = "or date_write";
      else if ($monthDes > $monthIni) $and = "and date_write";
      else if ($monthDes < $monthIni) $and = "or date_write";
      else if ($dateDes > $dateIni) $and = "and date_write";
      else $and = "or date_write";
   }
   else $ini_YMD = "";
   if ($yearDes) {
      $des_YMD = "$and $less \"$des_YMD\"";
   }
   else $des_YMD = "";
   if ($ini_YMD != "" or $des_YMD != "") {
      $date = " and (date_write $ini_YMD $des_YMD)";
   }
   return $date;
}
//------------------------------------------------------------
// Tranfer column.
function	columnCondition ($comp,$game,$health,$movie,$music,$sport,$travel,$women) {
	if (!($comp || $game || $health || $movie || $music || $sport || $travel || $women))
		$comp=$game=$health=$movie=$music=$sport=$travel=$women=true;
	if (!($comp && $game && $health && $movie && $music && $sport && $travel && $women)) {
		$or = "";
		if ($comp) {
			$comp = "col_name=\"computer\"";
			$or = "or";
		}
		if ($game) {
			$game = "$or col_name=\"games\"";
			$or = "or";
		}
		if ($health) {
			$health = "$or col_name=\"healthy\"";
			$or = "or";
		}
		if ($movie) {
			$movie = "$or col_name=\"movies\"";
			$or = "or";
		}
		if ($music) {
			$music = "$or col_name=\"music\"";
			$or = "or";
		}
		if ($sport) {
			$sport = "$or col_name=\"sport\"";
			$or = "or";
		}
		if ($travel) {
			$travel = "$or col_name=\"travel\"";
			$or = "or";
		}
		if ($women) {
			$women = "$or col_name=\"women\"";
			$or = "or";
		}
		$col = " and ($comp $game $health $movie $music $sport $travel $women)";
	}
	return $col;
}
//------------------------------------------------------------
// Tranfer rating.
function rateCondition ($maxValue,$low,$middle,$hight) {
   $minRate = $maxValue/3;
   $maxRate = $minRate * 2;
   if (!($low || $middle || $hight))
      $low = $middle = $hight = true;
   if ($low) {
      $rateLow = "num_reader < $minRate";
      $or = "or";
   }
   if ($middle) {
      $rateMiddle = " $or (num_reader >= $minRate and num_reader <= $maxRate)";
      $or = "or";
   }
   if ($hight) {
      $rateHight = " $or num_reader > $maxRate";
   }
   if (!($low && $middle && $hight))
      $rating = " and ($rateLow $rateMiddle $rateHight) ";
   return $rating;
}
?>
