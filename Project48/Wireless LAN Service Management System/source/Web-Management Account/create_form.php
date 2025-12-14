<?php
include 'menu.php';
 ?>
<!doctype html public "-//W3C//DTD HTML 4.01//EN">

<html>

   <head>
      <title>Create User</title>
      <meta http-equiv="generator" content="PHP Designer 2005" />
   </head>

   <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">

<form action="create.php" method="POST"  name="create_form">
<center>
<table>
<tr>
         <td>Name </td>
         <td><input type="text" name="name" /></td>
</tr>
<tr>
         <td>Surname</td>
         <td><input type="text" name="surname" /></td>
</tr>
<tr>
         <td>Email</td>
         <td><input type="text" name="email" /></td>
</tr>
<tr>
         <td>User name</td>
         <td><input type="text" name="uname" /></td>
</tr>
<tr>
         <td>Password</td>
         <td><input type="password" name="password" /></td>
</tr>
<tr>
         <td>Re password</td>
         <td><input type="password" name="rpassword" /></td>
</tr>
<tr>
	<td colspan="2"><center><input type="submit" name="btadd" value="<?php echo ('Create'); ?>" /></center></td>
</table>
</center>

</form>

   </body>
</html>
