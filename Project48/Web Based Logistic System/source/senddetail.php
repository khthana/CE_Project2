<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body,td,th {
	font-family: MS Sans Serif;
	font-size: 14px;
}
a {
	font-family: MS Sans Serif;
	font-size: 14px;
	color: #000000;
}
a:hover {
	color: #3333FF;
}
a:active {
	color: #000000;
}
-->
</style></head>

<body>
<table width="100%" border="0" bgcolor="#F3F3F3">
  <tr> 
    <td > 
      <? require("formsearchid.html"); ?>
    </td>
  </tr>
  <tr> 
    <td> 
      <? if($file4=="")
  require("formsend.php"); 
  else
  require("formsend2.php");
  ?>
    </td>
  </tr>
</table>
</body>
</html>
