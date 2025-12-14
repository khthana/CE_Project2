<?php

    exec("sudo /usr/bin/radlast > /usr/local/src/wms/radlast.txt");

	$fileopen = fopen("/usr/local/src/wms/radlast.txt" , "r+");
    $filename = "/usr/local/src/wms/radlast.txt";
    $size = filesize($filename);
	$mydata = fread($fileopen, $size);
    
    //run radlast and save it to text file
    //store it in mydata
    
    $name = $_GET['name'];
    if(preg_match_all("(($name *[0-9]*:localhos [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} *(Mon|Tue|Wed|Thu|Fri|Sat|Sun)\s(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)(\s\s|\s)[0-9]+\s[0-9]+:[0-9]+\s(-\s[0-9]+:[0-9]+ *\([0-9]+:[0-9]+\)| *still\slogged\sin)))",$mydata,$match,PREG_PATTERN_ORDER))
    {
        $i = count($match[1]);

        // Store ip address to obj of each user
        for($x = 0; $x < $i; $x++)
        {
          echo $match[1][$x] . "<br />";
        }
   }
   else
   {
        echo "This user don't have old infomation.";
   }   
?>
