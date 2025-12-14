<!doctype html public "-//W3C//DTD HTML 4.01//EN">

<html>

   <head>
      <title>Login</title>
      <meta http-equiv="generator" content="PHP Designer 2005" />
   </head>

   <body>



<form action="login.php" method="post" name="login_form">


<center>
<table class="login">



<tr>

<td><small><?php echo ('Login DN'); ?></small></td>
<td><input type="text" name="login_dn" size="40" value="" /></td>
</tr>

<tr>
	<td><small><?php echo ('Password'); ?></small></td>
	<td><input type="password" size="40" value="" name="login_pass" /></td>
</tr>

<tr>
	<td colspan="2"><center><input type="submit" name="submit" value="<?php echo ('Authenticate'); ?>" /></center></td>
</tr>
</table>
</center>
</form>
</body>
</html>
