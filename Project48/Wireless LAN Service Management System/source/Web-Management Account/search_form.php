<?php
include 'menu.php';
@session_start();
 ?>
<!doctype html public "-//W3C//DTD HTML 4.01//EN">

<html>

   <head>
      <title>Search</title>
      <meta http-equiv="generator" content="PHP Designer 2005" />
   </head>

   <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
<form action="search.php" method="POST"  name="search_form">
<center>
<table>
<tr>
         <td>Filter </td>
         <td><input type="text" size="40" name="filter" /></td>
</tr>
<tr>
	<td colspan="2"><center><input type="submit" name="btsearch" value="<?php echo ('Search'); ?>" /></center></td>
</tr>
</table>
</center>
</form>

   </body>
</html>
