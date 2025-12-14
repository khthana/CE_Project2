<?php

	class Timer 
	{
   	var $classname = "Timer";
   	var $start     = 0;
   	var $stop      = 0;
   	var $elapsed   = 0;

   	// Constructor
   	function Timer( $start = true ) 
   	{
      	if ( $start )
         	$this->start();
   	}

   	// Start counting time
   	function start() 
   	{
      	$this->start = $this->_gettime();
   	}

   	// Stop counting time
   	function stop() 
   	{
      	$this->stop    = $this->_gettime();
      	$this->elapsed = $this->_compute();
   	}
   
   	// Get Elapsed Time
   	function elapsed() 
   	{
      	if ( !$elapsed )
         	$this->stop();

      	return $this->elapsed;
   	}
   
   	// Get Elapsed Time
   	function reset() 
   	{
      	$this->start   = 0;
      	$this->stop    = 0;
      	$this->elapsed = 0;
   	}

   	// PRIVATE METHODS 
   
   	// Get Current Time
   	function _gettime() 
   	{
      	$mtime = microtime();
      	$mtime = explode( " ", $mtime );
      	return $mtime[1] + $mtime[0];
   	}
   
   	// Compute elapsed time
   	function _compute() 
   	{
      	return $this->stop - $this->start;
   	}
	}
	
    function checkipaddress($ip,$rad)
    {
        $countrad = count($rad);
        for($z = 0; $z < $countrad; $z++)
        {
            $radip = $rad[$z]->ipaddress;
            //$out = FALSE;
            if($ip == $radip)
            {
                return $z + 1;      // protect $z = 0, must add 1
            }
        }
        return 0;
    }

    function findindex($userip, $user)
    {
      $countuser = count($user);
      for($x = 0; $x < $countuser; $x++)
      {
        if($userip == $user[$x]->ipaddress)
        {
          return $x;
        }
      }
    }
    
   function rm($fileglob)
	{
   	if (is_string($fileglob)) 
   	{
       	if (is_file($fileglob)) 
       	{
           return unlink($fileglob);
       	} 
       	else if (is_dir($fileglob)) 
       	{
           $ok = rm("$fileglob/*");
           if (! $ok) 
           {
               return false;
           }
           return rmdir($fileglob);
       	} 
       	else 
       	{
           $matching = glob($fileglob);
           if ($matching === false) 
           {
               trigger_error(sprintf('No files match supplied glob %s', $fileglob), E_USER_WARNING);
               return false;
           }     
           $rcs = array_map('rm', $matching);
           if (in_array(false, $rcs)) 
           {
               return false;
           }
       	}     
   	} 
   	else if (is_array($fileglob)) 
   	{
       	$rcs = array_map('rm', $fileglob);
       	if (in_array(false, $rcs)) 
       	{
           return false;
       	}
   	} 
   	else 
   	{
       	trigger_error('Param #1 must be filename or glob pattern, or array of filenames or glob patterns', E_USER_ERROR);
       	return false;
   	}

   	return true;
	}

    // User class
    class User
    {
        // variables
        var $ipaddress; // store ip address of that user
        var $username;  // store username of that user
        var $inbyte;    // store receive bytes of that user
        var $outbyte;   // store output bytes of that user
        var $totalbyte; // store total bytes of that user
        var $dateandtime;   // store date and time when that user LOGIN
        var $show;      // flag indicate show output ,or not? TRUE = show , FALSE = not show

        // methods

    }

    session_start();
	 if(!(isset($_SESSION["turn"])))
	 {
    	$_SESSION["turn"] = 1;

    	//--> Step 1) Run darkstat
    	exec("sudo /usr/local/sbin/darkstat -d /usr/local/src/darkstat/darkstat-2.6 -i eth1 -e \"net 192.168.182.0/24\" -n > /usr/local/src/wms/dark.txt &");
    
	 	$timer = new Timer();
	 	while($timer->elapsed() < 2.5)
	 	{
	 	
	 	}
	 
    	//--> Step 2) Create object of all ip address at chillispot distribute
    	for($i=0; $i<=255 ;$i++)
    	{
    	    $userdata[$i] = new User;   // create new obj
    	  	 $_SESSION["userdata[".$i."]->ipaddress"] = "192.168.182." . $i; // set ipaddress of obj
    	  	 $_SESSION["userdata[".$i."]->show"] = 0; // set show = false
    	  	 $_SESSION["userdata[".$i."]->username"] = NULL;
    	  	 $_SESSION["userdata[".$i."]->inbyte"] = 0;
    	  	 $_SESSION["userdata[".$i."]->outbyte"] = 0;
    	  	 $_SESSION["userdata[".$i."]->totalbyte"] = 0;
    	  	 $_SESSION["userdata[".$i."]->dateandtime"] = NULL;
    	}
    	$_SESSION["sessioncountuser"] = count($userdata);
	}

    //--> Step 3) Store ip address from darkstat
    $url = "http://127.0.0.1:666/hosts-ip-full.html";
    $mydatax = file_get_contents($url);
    
    // white gray
    $mydata = "";
    $filteripw = "((<tr><td bgcolor=\"#F0F0F0\">(192\.168\.182\.[0-9]{1,3})</td><td bgcolor=\"#F0F0F0\">&nbsp;</td><td align=\"right\" bgcolor=\"#F0F0F0\">(([0-9]*(\,)*)*)</td><td align=\"right\" bgcolor=\"#F0F0F0\">(([0-9]*(\,)*)*)</td><td align=\"right\" bgcolor=\"#F0F0F0\">(([0-9]*(\,)*)*)</td></tr>))";
    if(preg_match_all($filteripw,$mydatax,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);
        //echo $i . " ";

        // Store ip address to obj of each user
        for($x = 0; $x < $i; $x++)
        {
        	 //echo $match[1][$x] . " ";
          $mydata = $mydata . $match[1][$x];
        }
    }
    else
    {
        
    }

    // gray
    $filteripg = "((<tr><td bgcolor=\"#E0E0E0\">(192\.168\.182\.[0-9]{1,3})</td><td bgcolor=\"#E0E0E0\">&nbsp;</td><td align=\"right\" bgcolor=\"#E0E0E0\">(([0-9]*(\,)*)*)</td><td align=\"right\" bgcolor=\"#E0E0E0\">(([0-9]*(\,)*)*)</td><td align=\"right\" bgcolor=\"#E0E0E0\">(([0-9]*(\,)*)*)</td></tr>))";
    if(preg_match_all($filteripg,$mydatax,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);

        // Store ip address to obj of each user
        for($x = 0; $x < $i; $x++)
        {
        	 //echo $match[1][$x] . " ";
          $mydata = $mydata . $match[1][$x];
        }
    }
    else
    {

  	 }
    
    //delay
	 $timer = new Timer();
	 while($timer->elapsed() < 1)
	 {
	 	
	 }
    
    // Separate each infomation from text file and store it in OBJ

    // Store ip address of user in LIGHT GRAY COLOR in html page
    $iplgre = "(<td bgcolor=\"#F0F0F0\">([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))";
    if(preg_match_all($iplgre,$mydata,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);

        // Store ip address to obj of each user
        for($x = 0; $x < $i; $x++)
        {
          $user[$x] = new User;
          $user[$x]->ipaddress = $match[1][$x];
        }
    }
    else
    {
    }

    // Store input usage, output usage, total usage of user in LIGHT GRAY COLOR in html page
    $in = "(<td align=\"right\" bgcolor=\"#F0F0F0\">(([0-9]*(\,)*)*))";
    if(preg_match_all($in,$mydata,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);
        $j = $i/3;
        $k = 0;
        
        // Store ip address to obj of each user
        for($x = 0; $x < $j; $x++)
        {
          $splitinbyte = explode(",", $match[1][$k]);
          $mergeinbyte = implode("", $splitinbyte);
          $user[$x]->inbyte = $mergeinbyte;
          $k++;

          $splitoutbyte = explode(",", $match[1][$k]);
          $mergeoutbyte = implode("", $splitoutbyte);
          $user[$x]->outbyte = $mergeoutbyte;
          $k++;

          $splittotalbyte = explode(",", $match[1][$k]);
          $mergetotalbyte = implode("", $splittotalbyte);
          $user[$x]->totalbyte = $mergetotalbyte;
          $k++;
        }
    }
    else
    {
    }

    // Store ip address of user in DARK GRAY COLOR in html page
    $ipdgre = "(<td bgcolor=\"#E0E0E0\">([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))";
    $nowuser = count($user);
    if(preg_match_all($ipdgre,$mydata,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);

        $k = 0;

        // Store ip address to obj of each user
        for($x = $nowuser; $x < $i + $nowuser; $x++)
        {
          $user[$x] = new User;
          $user[$x]->ipaddress = $match[1][$k];
          $k++;
        }
    }
    else
    {
    }

    // Store input usage, output usage, total usage of user in DARK GRAY COLOR in html page
    $indg = "(<td align=\"right\" bgcolor=\"#E0E0E0\">(([0-9]*(\,)*)*))";
    if(preg_match_all($indg,$mydata,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);
        $j = $i/3;
        $k = 0;

        // Store ip address to obj of each user
        for($x = $nowuser; $x < $j + $nowuser; $x++)
        {
          $splitinbyte = explode(",", $match[1][$k]);
          $mergeinbyte = implode("", $splitinbyte);
          $user[$x]->inbyte = $mergeinbyte;
          $k++;

          $splitoutbyte = explode(",", $match[1][$k]);
          $mergeoutbyte = implode("", $splitoutbyte);
          $user[$x]->outbyte = $mergeoutbyte;
          $k++;

          $splittotalbyte = explode(",", $match[1][$k]);
          $mergetotalbyte = implode("", $splittotalbyte);
          $user[$x]->totalbyte = $mergetotalbyte;
          $k++;
        }
    }
    else
    {
    }

    // Step 4) Check ip address from darkstat with radwho

    // execute radwho and save it to radwho.txt
    exec("sudo /usr/bin/radwho > /usr/local/src/wms/radwho.txt");
    
    //delay
	 $timer = new Timer();
	 while($timer->elapsed() < 1)
	 {
	 	
	 }
	 
	 $fileopenrad = fopen("/usr/local/src/wms/radwho.txt" , "r+");
     $filenamerad = "/usr/local/src/wms/radwho.txt";
     $sizerad = filesize($filenamerad);
	 $mydatarad = fread($fileopenrad, $sizerad);
    
    // Store IP Address and Name in new obj
    class Raduser
    {
        // variables
        var $ipaddress; // store ip address of that user
        var $username;  // store username of that user
        var $dateandtime;   // store date and time when that user LOGIN
    }

    // Scan radwho.txt and store each data in variable of each obj
    // store ip address
    if(preg_match_all("([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})",$mydatarad,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[0]);

        // Store ip address to obj of each user
        for($x = 0,$y = 1; $x < $i/2; $x++)
        {
          $rad[$x] = new Raduser;
          $rad[$x]->ipaddress = $match[0][$y];
          $y = $y+2;
        }
    }
    else
    {
        echo "IP Address was not found.\n";
    }

    // store date and time to obj of each user
    if(preg_match_all("((Mon|Tue|Wed|Thu|Fri|Sat|Sun)\s[0-9]+:[0-9]+)",$mydatarad,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[0]);

        // Store date and time to obj of each user
        for($x = 0; $x < $i; $x++)
        {
          $rad[$x]->dateandtime = $match[0][$x];
        }
    }
    else
    {
        echo "Data and time was not found.\n";
    }

    // store username to obj of each user
    if(preg_match_all("([^Login      Name              What  TTY  When      From      Location][a-zA-Z0-9]+)",$mydatarad,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[0]);

        // Store date and time to obj of each user
        for($x = 0,$y = 0; $x < $i/15; $x++)
        {
          $rad[$x]->username = $match[0][$y];
          $y = $y+15;
        }
    }
    else
    {
        echo "Username was not found.\n";
    }

    $countuser = count($user);
    for($x = 0; $x < $countuser; $x++)
    {
      $userip = $user[$x]->ipaddress;
      $z = checkipaddress($userip, $rad);
      if($z)
      {
            // Case match
            // Set show = TRUE at that ipaddress obj
            preg_match_all("([0-9]{1,3}$)",$userip,$match,PREG_PATTERN_ORDER);
            $_SESSION["userdata[".$match[0][0]."]->show"] = 1;
    
            // Store username and dateandtime at that ipaddress obj
            $_SESSION["userdata[".$match[0][0]."]->username"] = $rad[$z-1]->username;
            $_SESSION["userdata[".$match[0][0]."]->dateandtime"] = $rad[$z-1]->dateandtime;
      }
      else
      {

            // Case not match
            // Set show = FALSE at that ipaddress obj
            preg_match_all("([0-9]{1,3}$)",$userip,$match,PREG_PATTERN_ORDER);
            $_SESSION["userdata[".$match[0][0]."]->show"] = 0;

            // Clear username and dateandtime at that ipaddress obj
            $_SESSION["userdata[".$match[0][0]."]->username"] = NULL;
            $_SESSION["userdata[".$match[0][0]."]->dateandtime"] = NULL;

            // Store IN, OUT, TOTAL Usage at that ipaddress obj
            $_SESSION["userdata[".$match[0][0]."]->inbyte"] = $user[$x]->inbyte;
            $_SESSION["userdata[".$match[0][0]."]->outbyte"] = $user[$x]->outbyte;
            $_SESSION["userdata[".$match[0][0]."]->totalbyte"] = $user[$x]->totalbyte;
      }

    }
    
    // Step 5) Output data to web interface
    $countdisconnectuser = 0;

    echo "<form name=\"userlist\" method=\"post\" action=\"disconnectuser.php\">";
    echo "<table border = \"1\">" . "\n";
    echo "<tr bgcolor = \"red\">"   . "\n";
    echo "<td> IP Address</td>" .
    		"<td> Username </td>" .
    		"<td> IN(bytes)</td>" .
    		"<td> OUT(bytes)</td>" .
    		"<td> TOTAL(bytes)</td>" .
    		"<td> When </td>" .
    		"<td> Logout</td>". "</tr>";
    		
	 $bkcolor = 0;
    for($x=0; $x<$_SESSION["sessioncountuser"]; $x++)
    {
      if($_SESSION["userdata[".$x."]->show"] == 1)
      {
        $bkcolor++;
        if($bkcolor % 2 == 0)
        {
          $backgroundcolor = "white";
        }
        else
        {
          $backgroundcolor = "lightgray";
        }
        $index = findindex($_SESSION["userdata[".$x."]->ipaddress"], $user);
        $inbyte = $user[$index]->inbyte - $_SESSION["userdata[".$x."]->inbyte"];
        $outbyte = $user[$index]->outbyte - $_SESSION["userdata[".$x."]->outbyte"];
        $totalbyte = $user[$index]->totalbyte - $_SESSION["userdata[".$x."]->totalbyte"];
        $name = $_SESSION["userdata[".$x."]->username"];
			
        echo "<tr bgcolor = $backgroundcolor>"   . "\n";
        echo "<td>" . $_SESSION["userdata[".$x."]->ipaddress"]   . "</td>" .
             "<td>" . "<a href=\"javascript:NewWindow=window.open('http://192.168.182.1/radtest.php?name=$name','newWin','width=400,height=300,left=0,top=0,toolbar=No,location=No,scrollbars=Yes,status=No,resizable=Yes,fullscreen=No');NewWindow.focus(); void(0);\">" . $_SESSION["userdata[".$x."]->username"] . "</a>" . "</td>".
             "<td>" . $inbyte                    . "</td>" .
             "<td>" . $outbyte                   . "</td>" .
             "<td>" . $totalbyte                 . "</td>" .
             "<td>" . $_SESSION["userdata[".$x."]->dateandtime"] . "</td>" .

             "<td>" . "<input type=\"checkbox\" name=\"chkbox[]\" value=$name>" .
             "</td>" . "\n";
        echo "</tr>" . "\n";
        $countdisconnectuser++;
      }
    }
    echo "</table>";
    echo "<input type=\"submit\" name=\"disconnect\" value=\"Disconnect User\">";
    echo "</form>";
    
    echo "\n";
    
    echo "<table>" . "\n";
    echo "<tr>"."\n";
    echo "<td>"."\n";
    echo "<form name = \"clearoldinfo\" method=\"post\" action=\"clearoldinfo.php\">";
    echo "<input type=\"submit\" name=\"clearinfoname\" value=\"Clear Old Infomation\">";
	 echo "</form>";
	 echo "</td>"."\n";
	 
	 echo "<td>"."\n";
    echo "<form name = \"kill\" method=\"post\" action=\"killprocess.php\">";
    echo "<input type=\"submit\" name=\"killprocess\" value=\"Kill Process\">";
	 echo "</form>";
	 echo "</td>"."\n";
	 echo "</tr>"."\n";
	 echo "</table>";

    fclose($fileopenrad);
?>

  <script>
	// Configure refresh interval (in seconds)
	var refreshinterval=15

	// Shall the coundown be displayed inside your status bar? Say "yes" or "no" below:
	var displaycountdown="yes"

	// Do not edit the code below
	var starttime
	var nowtime
	var reloadseconds=0
	var secondssinceloaded=0

	function starttime() 
	{
		starttime=new Date()
		starttime=starttime.getTime()
		countdown()
	}

	function countdown() 
	{
		nowtime= new Date()
		nowtime=nowtime.getTime()
		secondssinceloaded=(nowtime-starttime)/1000
		reloadseconds=Math.round(refreshinterval-secondssinceloaded)
		if (refreshinterval>=secondssinceloaded) 
		{
			var timer=setTimeout("countdown()",1000)
			if (displaycountdown=="yes") 
			{
				window.status="Page refreshing in "+reloadseconds+ " seconds"
			}
		}
		else 
		{
			clearTimeout(timer)
			window.location.reload(true)
		} 
	}
	window.onload=starttime
</script> 
 
