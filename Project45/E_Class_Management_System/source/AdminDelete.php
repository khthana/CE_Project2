<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
	require('./libraries/grab_globals.lib.php'); 
	include('./connectDB.php');
function delcourse($TID,$ID){
									//delete course from table and floder
									connect_db();
									$sql="delete  from courses where ID=$ID"	;
									$result=mysql_query($sql);
									$sql1="delete from regist where CID=$ID"	;
									$result1 = mysql_query($sql1);
									if(!result1)
										die("ไม่สามารถ query ได้");
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ วิชาได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
									else
									{
										$dir=opendir("./Techer/$TID/Courses/$ID");
										$count=0;
										while($file=readdir($dir))
										 {		
										 		//echo "$file<br>";
												if($count >=2)
												{
												if(strstr($file,"."))
												unlink("./Techer/$TID/Courses/$ID/$file");
												else
												{
													$dir1=opendir("./Techer/$TID/Courses/$ID/$file");
													$count1=0;
													while($file1=readdir($dir1))
										 				{
													//echo $file1."<br>";			
										 			if($count1>=2)
																{
															if(strstr($file1,"."))
																unlink("./Techer/$TID/Courses/$ID/$file/$file1");
															else
																rmdir("./Techer/$TID/Courses/$ID/$file/$file1");
																}
															$count1+=1;
										  					}
															closedir($dir1);
															rmdir("./Techer/$TID/Courses/$ID/$file");
														}
												}
												$count +=1;
										  }
									closedir($dir);
									rmdir("./Techer/$TID/Courses/$ID");
									}
									//delete chapter from table chapter
									$sql="delete  from chapters where CID=$ID"	;
									$result=mysql_query($sql);
									if(!$result)
									{
											echo"<center>";
											echo "ไม่สามารถลบ บทเรียนได้ โปรดตรวจสอบสิทธิ์ของท่านอีกครั้ง";
											echo"</center>";
									}
									//delete chapter in learn table
									$sql="delete from learn where CID=$ID";
									mysql_query($sql);
									//delete chapter in homework table
									$sql="delete from homwork where CID=$ID";
									mysql_query($sql);
									//drop tquestion table for each clourse
									$sql="DROP TABLE `question".$ID."`";
									mysql_query($sql);
									mysql_close();
	}
?>
</body>
</html>
