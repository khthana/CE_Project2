<?
	include("phpFunctionDB.php");
	if(Login($login,$pwd,$check))
		{
						if ($check == "agent")header("Location: Agent_Main.php");
						if ($check == "manager")header("Location: Manager_Main.php");
						if ($check == "secretary")header("Location: Secretary_Main.php");
		}else header("Location: main.php");
?>