<?
	include('function.php');
	include('database.php');
	require_once("headerofficer.php");	
	database_connect();
	check_office();
	header_officer("ข้อความใหม่")
?>
<br>
			<table align="center" width="800">
    				<tr>		
						<td>
				  				<IFRAME id=classical name="list1"src="listday2.php" width=100% height=150></IFRAME>
						</td>
					</tr>
					<tr>
                  		<td>
								<IFRAME id=classical  src="listday1.php"  name ="list2" width=100% height=250> </IFRAME>
						</td>
					</tr>
              </table>
<?
	  		print "<meta http-equiv=\"refresh\" content=\"60;URL=list.php\">\n";
			require_once("footer.php");
?>
