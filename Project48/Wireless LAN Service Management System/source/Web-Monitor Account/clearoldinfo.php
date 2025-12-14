<?php

	// Kill darkstat process and delete darkstat.db
	class Timer {

   var $classname = "Timer";
   var $start     = 0;
   var $stop      = 0;
   var $elapsed   = 0;

   # Constructor
   function Timer( $start = true ) {
      if ( $start )
         $this->start();
   }

   # Start counting time
   function start() {
      $this->start = $this->_gettime();
   }

   # Stop counting time
   function stop() {
      $this->stop    = $this->_gettime();
      $this->elapsed = $this->_compute();
   }
   
   # Get Elapsed Time
   function elapsed() {
      if ( !$elapsed )
         $this->stop();

      return $this->elapsed;
   }
   
   # Get Elapsed Time
   function reset() {
      $this->start   = 0;
      $this->stop    = 0;
      $this->elapsed = 0;
   }

   #### PRIVATE METHODS ####
   
   # Get Current Time
   function _gettime() {
      $mtime = microtime();
      $mtime = explode( " ", $mtime );
      return $mtime[1] + $mtime[0];
   }
   
   # Compute elapsed time
   function _compute() {
      return $this->stop - $this->start;
   }
}	

	session_start();
	//execute for find pid of dardstat
	exec("sudo ps -C darkstat -o pid > /usr/local/src/wms/pid.txt");
	
	//delay
	$timer = new Timer();
	while($timer->elapsed() < 2)
	{
	 	
	}
	
	//open pid.txt find and search for pid number of darkstat
	$fileopen = fopen("/usr/local/src/wms/pid.txt" , "r+");
    $filename = "/usr/local/src/wms/pid.txt";
    $size = filesize($filename);
	$mydata = fread($fileopen, $size);
	
	if(preg_match_all("([0-9]+)",$mydata,$match,PREG_PATTERN_ORDER))
    {
        $pid = $match[0][0];
    }
    else
    {
        echo "Can't find PID.";
    }
     //kill process of darkstat
	 exec("sudo kill -s SIGTERM $pid");
	 
	 //destroy session
	 session_destroy();
	 
	 //delay
	 $timer = new Timer();
	 while($timer->elapsed() < 5)
	 {
	 	
	 }

    exec("sudo rm -f /usr/local/src/darkstat/darkstat-2.6/darkstat.db");
    
    echo "Clear Old Infomation Complete"."<br>";
    echo "<a href = \"http://127.0.0.1/manage.php\">"."Go back to management page"."</a>"."\n";
?>
