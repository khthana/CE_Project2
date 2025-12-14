<?php

@MYSQL_CONNECT("localhost","root","");

    @mysql_select_db("databook");	
$query_pic = "select pic,filetype from book where id=$id";
   $result_pic = @MYSQL_QUERY($query_pic);
 $type = @MYSQL_RESULT($result_pic,0,"filetype");
    $picture = @MYSQL_RESULT($result_pic,0,"pic");
   Header( "Content-type: $type");

?>