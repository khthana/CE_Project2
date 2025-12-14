<?php
include 'menu.php';
 ?>
<!doctype html public "-//W3C//DTD HTML 4.01//EN">

<html>

   <head>
      <title>Delete</title>
      <meta http-equiv="generator" content="PHP Designer 2005" />
   </head>

   <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
<form action="delete.php" method="POST"  name="delete_form">
<center>
<table>
<tr>
         <td>Delete DN </td>
         <td><input type="text" size="40" name="deldn" /></td>
</tr>
<tr>
	<td colspan="2"><center><input type="submit" name="btdel" value="<?php echo ('Delete'); ?>" /></center></td>
</tr>
</table>
</center>
</form>

   </body>
</html>
