<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	//echo"<br/> Check choice: $check ";
	switch ($check)	{
		case 1:
			//echo"<br/> $Anick: $Apwd<br/>";
		if (Login($Anick,$Apwd,$check) ==true)
		{	Writefile_logfile($Aid,$Anick,$Apwd);
			header("Location: main_agent_access.php");
			break;
			}
		else
		{	header("Location :main.html");
			break;}
		case 2:
			echo"<br/> $Anick $Apwd <br/>";
		if (Login($Anick,$Apwd,$check) ==true)
		{	Writefile_logfile($Aid,$Anick,$Apwd);
			echo"login manager $Anick !!!ok!!!";
			echo"<a href =\"main_access.php\">Go to Manager menu</a>","<br/>";
			break;
		}
		else
		{	echo "<a href = \"main.html \" >manager error  Back to login again</a>","<br/>" ;
			break;}
		case 3:
			echo"<br/> $Anick $Apwd <br/>";
		if (Login($Anick,$Apwd,$check) ==true)
		{Writefile_logfile($Aid,$Anick,$Apwd);
			echo"login Assistance $Anick :!!!ok!!!";
			echo"<a href =\"main_access.php\"> Go to Secretary menu </a>","<br/>";
			break;
		}
		else
		{echo "<a href = \"main.html \" >secretary error  Back to login again</a>","<br/>" ;
		break;}
		default : echo"login error please try again <br/>";
						echo"<a href =\"main.html \">Back to login </a>";
	};
	CloseDB();
?>
