<?php

// getdata.php3 - by Florian Dittmer <dittmer@gmx.net>
// Example php script to demonstrate the direct passing of binary data
// to the user. More infos at http://www.phpbuilder.com
// Syntax: getdata.php3?id=<id>
$id=$id;
if($id) {

    // you may have to modify login information for your database server:
    @MYSQL_CONNECT("localhost","root","");

    @mysql_select_db("databook");

    $query = "select pic,filetype from book where id=$id";
    $result = @MYSQL_QUERY($query);

    $data = @MYSQL_RESULT($result,0,"pic");
    $type = @MYSQL_RESULT($result,0,"filetype");

    Header( "Content-type: $type");
if($data!=="")
{
    echo $data;
}
else{
$data = "webboard/picture.jpg";

echo $data;

}
};
?>
