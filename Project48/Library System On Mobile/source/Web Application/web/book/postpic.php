<?php

// store.php3 - by Florian Dittmer <dittmer@gmx.net>
// Example php script to demonstrate the storing of binary files into
// an sql database. More information can be found at http://www.phpbuilder.com/
?>

<html>
<head><title>Store binary data into SQL Database</title></head>
<body>

<?php
// code that will be executed if the form has been submitted:

if ($submit) {

    // connect to the database
    // (you may have to adjust the hostname,username or password)

    MYSQL_CONNECT("localhost","root","");
    mysql_select_db("databook");

    $data = addslashes(fread(fopen($form_data, "r"), filesize($form_data)));

    $result=MYSQL_QUERY("INSERT INTO binary_data (description,bin_data,filename,filesize,filetype) ".
        "VALUES ('$form_description','$data','$form_data_name','$form_data_size','$form_data_type')");

    $id=1;
    print "<p>This file has the following Database ID: <b>$id</b>";

    MYSQL_CLOSE();

} else {

    // else show the form to submit new data:
?>

    <form method="post" action="addboard.php" enctype="multipart/form-data">
    File Description:<br>
    <input type="text" name="detail"  size="40">
    <input type="hidden" name="MAX_FILE_SIZE" value="24000000">
    <br>File to upload/store in database:<br>
    <input type="file" name="picture"  size="40">
    <p><input type="submit" name="submit" value="submit">
    </form>

<?php

}

?>

</body>
</html>

