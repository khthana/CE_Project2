<?php
require('./libraries/grab_globals.lib.php');
include('./connectDB.php');	
function insert_question($TID,$CID,$Question,$Answers,$Correct_answer,$Type){
			//echo $TID.",".$CID.",".$Question.",".$Answers.",".$Correct_answer.",".$Type;
			connect_db();
			//when true/fault question
			if($Type=="TF")
			$sql="INSERT INTO questionTF".$CID."(CID,Question,Answer,Correct_answer) VALUES ('$CID','$Question','$Answers','$Correct_answer')";
			//when choice question
			elseif($Type=="CH")
			$sql="INSERT INTO questionCH".$CID."(CID,Question,Answer,Correct_answer) VALUES ('$CID','$Question','$Answers','$Correct_answer')";
			
			$result=mysql_query($sql);
			if(!$result)
			{
			echo"<center>";
			echo "ไม่สามารถทำการบันทึกคำถามได้";
			echo"<meta http-equiv=\"REFRESH\" content=\"3;URL=make_question.php?TID=$TID&ID=$CID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาท
			echo"</center>";
			mysql_close();
			}
			else
			{
			echo"<center>";
			echo "ทำการบันทึกข้อสอบไว้ในฐานข้อมูลเรียบร้อยแล้วครับ";
			echo"</center>";		
			echo"<meta http-equiv=\"REFRESH\" content=\"0;URL=make_question.php?TID=$TID&ID=$CID\">";// ให้มัน refresh หน้าจอใหม่ ทุกๆ 3 วินาท
			mysql_close();
			}
	}
	
//----------------------------------------- work space -----------------------------------//
	
		if($TF)//make n True and False question
   			{
				for($i=1;$i<=$TF;$i++)//n question
					 {
					    //$ch="ch".$i;
					 	//$q="q".$i;
						$Correct_answer=$ch;
						$file =$q;
						$answers ="True\nFalse";
					}	
			}
		if($CH)//make n question m choise
			{   for($i=1;$i<=$CH;$i++)//n question
					 {  $ch="ch".$i;
					 	$q="q".$i;
						$Correct_answer=$$ch;
						$file =$$q;
						for($j=1;$j<=$CH_N;$j++)//m choise
						 {  $ans="ans".$i.$j;
							$answers.=$$ans."\n";
						 }
					}
				}
			$file=AddSlashes($file);
			$answers=AddSlashes($answers);
			if($TF)
			insert_question($TID,$ID,$file,$answers,$Correct_answer,"TF");
			if($CH)
			insert_question($TID,$ID,$file,$answers,$Correct_answer,"CH");
?>