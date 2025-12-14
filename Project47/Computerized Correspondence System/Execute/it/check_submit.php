<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="100%" border="0">
<? 
   if(request=='request'){ ?>
  <tr>
    <td><form name="form1" method="post" action="index2.php?data=form_request&username=<?=$username;?>&pwd=<?=$pwd;?>">
			<meta http-equiv="refresh" content="0;URL=index2.php?data=form_request&username=<?=$username;?>&pwd=<?=$pwd;?>">
      </form></td>
  </tr>
 <? }
  elseif(example=='example'){?>
  <tr>
    <td><form name="form2" method="post" action="/htdocs/internalbook.php?data_date=<?=$data_date;?>&username=<?=$re_username;?>">
	<meta http-equiv="refresh" content="0;URL=/htdocs/internalbook.php?data_date=<?=$data_date;?>&username=<?=$re_username;?>">

      </form></td>
  </tr>
 <?  }
  else 
  {
  		echo "cannot submit";
  }
  ?>
</table>
</body>
</html>
