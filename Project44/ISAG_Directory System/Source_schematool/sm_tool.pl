#!/usr/bin/perl

use Term::ReadKey;
require Term::Screen;

$path = ".",@FileData,@NewFileData,@DataSec1,@DataSec2,@DataSec3,@DataSec4,
@DataSec5,$LastObjId,$LastAttId,$ObjNum,$AttNum,$FileTempData,$TempData1,$TempData2,
$TempData3,$TempData4,$TempData5,$NewInitData, 
$PObj,$PAtt;

sub creat_file
{
	my $InitData,$InitData1,$InitData2,$InitData3,$InitData4;
		
	$InitData1 = "#%>Sec1;\n#%>LastObjId=0;\n#%>LastAttId=0;\n#%>ObjNum=0;\n#%>AttNum=0;\n#%>End Sec1;\n\n";
	$InitData2 = "#%>Sec2;\n#%>PrefixObjId=1.3.6.1.4.3;\n#%>PrefixAttId=1.3.6.1.4.4;\n#%>End Sec2;\n\n";
    $InitData3 = "#%>Att Section;\n#%>End Att;\n\n#%>Obj Section;\n#%>End Obj;\n\n";
    $InitData4 = "#%>View Section;\n#--------------\n#Attribute:Type\n#--------------\n#end_att\n#-------------------\n#ObjectClass:Member\n#-------------------\n#end_obj\n#%>End View;";
    $InitData = $InitData1.$InitData2.$InitData3.$InitData4;

	open (FILE,">$path/ext.schema");
    print FILE $InitData;
	#print "Creat InitFile....complete\n";
	close (FILE);
}
#--------------------------------------------------------------------------------------
sub read_file
{
	my $idx1,$idx2;	
	if (!(-e "$path/ext.schema"))
	{
		&creat_file;
	}
	open (FILE,"$path/ext.schema");
	@FileData = <FILE>;
	close (FILE); 	
	#----Read Initial value.
	$FileTempData = join ("!",@FileData);
	#--------Read Data form sec1
	$idx1 = index ($FileTempData,"#%>End Sec1;");
	$TempData1 = substr ($FileTempData,0,$idx1+13);
	@DataSec1 = split (/!/,$TempData1);
    $idx1 = index ($DataSec1[1],"=");
	$idx2 = index ($DataSec1[1],";");
	$LastObjId = substr ($DataSec1[1],$idx1+1,($idx2-$idx1)-1);
	$idx1 = index ($DataSec1[2],"=");
	$idx2 = index ($DataSec1[2],";");
	$LastAttId = substr ($DataSec1[2],$idx1+1,($idx2-$idx1)-1);
	$idx1 = index ($DataSec1[3],"=");
	$idx2 = index ($DataSec1[3],";");
	$ObjNum = substr ($DataSec1[3],$idx1+1,($idx2-$idx1)-1);
	$idx1 = index ($DataSec1[4],"=");
	$idx2 = index ($DataSec1[4],";");
	$AttNum = substr ($DataSec1[4],$idx1+1,($idx2-$idx1)-1);
	#--------Read Data from sec2
	$idx1 = index ($FileTempData,"#%>Sec2;");
	$idx2 = index ($FileTempData,"#%>End Sec2;");
	$TempData2 = substr ($FileTempData,$idx1,($idx2-$idx1)+13);
	@DataSec2 = split (/!/,$TempData2);
	$idx1 = index ($DataSec2[1],"=");
	$idx2 = index ($DataSec2[1],";");
	$PObj = substr ($DataSec2[1],$idx1+1,($idx2-$idx1)-1);
    $idx1 = index ($DataSec2[2],"=");
	$idx2 = index ($DataSec2[2],";");
	$PAtt = substr ($DataSec2[2],$idx1+1,($idx2-$idx1)-1);
	#--------Read Data from att sec
	$idx1 = index ($FileTempData,"#%>Att Section;");
	$idx2 = index ($FileTempData,"#%>End Att;");
	$TempData3 = substr ($FileTempData,$idx1,($idx2-$idx1)+13);
	#--------Read Data from obj sec
	$idx1 = index ($FileTempData,"#%>Obj Section;");
	$idx2 = index ($FileTempData,"#%>End Obj;");
	$TempData4 = substr ($FileTempData,$idx1,($idx2-$idx1)+13);
	$idx1 = index ($FileTempData,"#%>View Section;");
	$idx2 = index ($FileTempData,"#%>End View;");
	$TempData5 = substr ($FileTempData,$idx1,($idx2-$idx1)+13);
}
#--------------------------------------------------------------------------------------
sub in_att
{
	my $AttName,$AttType,@Att,$ch,$tch,$exit,$num,$text1;
		
	$num = @Att;
	$#Att = $#Att - $num;#กำหนดขนาดของ array
	$AttName = "";
	$AttType = "";
	$tch = "";
	$ch = "";
	
	$scr->at(3,3)->bold();
	print "Enter Attribute Name:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch = $scr->getch();
		$tch = $tch.$ch;
	}until (ord($ch)== 13);
	chop ($tch);
	$AttName = $tch;
	$text1 = "\'$AttName\'";
	if ($TempData3 =~ /$text1/i)#หาว่ามี att อยู่ใน schema แล้วหรือไม่ 
	{
		$AttType = 0;
		return @Att = ($AttName,$AttType); 
	}
	$scr->at(5,3);print "1. caseIngnoreString";
	$scr->at(6,3);print "2. caseExactString";
	$scr->at(7,3);print "3. Integer";
	$scr->at(8,3);print "4. Boolean";
	$Attype = 0;
	$exit = 0;
	do
	{
		$scr->at(4,3)->bold();print "Attribute Type:";
		$scr->normal();
		$scr->noecho();#hide cursor
		$SelectType = $scr->getch();
		if (ord($SelectType) == 49)
		{
			$scr->at(9,3)->clreol();#clear error mesg
			$scr->at(4,18)->clreol();
			$AttType = 1;
			print "caseIngnoreString";
		}
		elsif (ord($SelectType) == 50)
		{
			$scr->at(9,3)->clreol();#clear error mesg
			$scr->at(4,18)->clreol();
			$AttType = 2;
			print "caseExactString";
		}
		elsif (ord($SelectType) == 51)
		{	
			$scr->at(9,3)->clreol();#clear error mesg
			$scr->at(4,18)->clreol();
			$AttType = 3;
			print "Integer";
		}
		elsif (ord($SelectType) == 52)
		{
			$scr->at(9,3)->clreol();#clear error mesg
			$scr->at(4,18)->clreol();
			$AttType = 4;
			print "Boolean";
		}
		elsif (ord($SelectType) == 13)#Enter
		{
			if ($AttType == 0)
			{
				$exit = 0;
			}
			else
			{
				$exit = 1;
			}
		}
		else
		{
			$scr->at(4,18)->clreol();
			$scr->at(9,3)->bold();
			print "Invalid key please press 1-4 to select type!";
			$scr->normal();
			$AttType = 0;
		}
	}until (($exit == 1)&&($AttType!=0));
	#Clear Type
	$scr->at(2,0);
	for ($i = 5;$i <= 9;$i++)
	{
		$scr->at($i,0)->clreol();
	}
	#End Clear Type
	return @Att = ($AttName,$AttType); 
}    
#--------------------------------------------------------------------------------------
sub add_att($$) 
{
	my ($att,$type) = @_;
    my $equ,$ord,$sub,$syntax,$newatt,$text1,$text2,$viewatt;	
	
	$scr->at(12,3);
	$text1 = "\'$att\'";
	if (($TempData3 =~ /$text1/i)||($att eq ""))#หาว่ามี att อยู่ใน schema แล้วหรือไม่ 
	{
		if ($att eq "")
		{
			$scr->at(4,3)->bold();
		    print "$att is empty name..Can not add!";
		    $scr->at(5,3)->bold();
		     print "Press any key to return to menu";
		    $scr->normal();
		}
		else
		{
			$scr->at(4,3)->bold();
			print "$att Already in schema..Can not add!";
			$scr->at(5,3)->bold();
			print "Press any key to return to menu";
			$scr->normal();
		}	
		return 0;#ถ้ามีแล้วออกจากการ add
	}
	
	if ($type == "1")#caseIgnoreString
	{
		$LastAttId +=1;
		$AttNum += 1; 
		$equ = "caseIgnoreMatch";
		$ord = "caseIgnoreOrderingMatch";
		$sub = "caseIgnoreSubstringsMatch";
		$syntax = "1.3.6.1.4.1.1466.115.121.1.15";
		$newatt = "\n#s_$att;\nattributetype ($PAtt.$LastAttId NAME \'$att\'\n\tEQUALITY $equ\n\tORDERING $ord\n\tSUBSTR $sub\n\tSYNTAX $syntax)\n#e_$att;\n#%>End Att;";		  
		$viewatt = "$att:caseIngnoreString";
	}
	elsif ($type == "2")#CaseExactString
    {
		$LastAttId +=1;
		$AttNum += 1; 
		$equ = "caseExactIA5Match";
		$ord = "caseIgnoreOrderingMatch";
		$sub = "caseIgnoreSubstringsMatch";
		$syntax = "1.3.6.1.4.1.1466.115.121.1.26";
		$newatt = "\n#s_$att;\nattributetype ($PAtt.$LastAttId NAME \'$att\'\n\tEQUALITY $equ\n\tORDERING $ord\n\tSUBSTR $sub\n\tSYNTAX $syntax)\n#e_$att;\n#%>End Att;";
		$viewatt = "$att:caseExactString";
	}
	elsif ($type == "3")#Integer
	{
		$LastAttId +=1;
		$AttNum += 1; 
		$equ = "IntegerMatch";
		$ord = "caseIgnoreOrderingMatch";
        $sub = "caseIgnoreSubstringsMatch";
		$syntax = "1.3.6.1.4.1.1466.115.121.1.7";
		$newatt = "\n#s_$att;\nattributetype ($PAtt.$LastAttId NAME \'$att\'\n\tEQUALITY $equ\n\tORDERING $ord\n\tSUBSTR $sub\n\tSYNTAX $syntax)\n#e_$att;\n#%>End Att;";
		$viewatt = "$att:Integer";
	}
	elsif ($type == "4")#Boolean
	{
		$LastAttId +=1;
		$AttNum += 1;
		$equ = "caseExactIA5Match";
		$syntax = "1.3.6.1.4.1.1466.115.121.1.27";
		$newatt = "\n#s_$att;\nattributetype ($PAtt.$LastAttId NAME \'$att\'\n\tEQUALITY $equ\n\tSYNTAX $syntax)\n#e_$att;\n#%>End Att;";
		$viewatt = "$att:Boolean";
	}	
	
	
	#Update ค่าของ att id และจำนวน att
	$TempData1 =~  s/LastAttId=[0-9]*;/LastAttId=$LastAttId;/i;
	$TempData1 =~  s/AttNum=[0-9]*;/AttNum=$AttNum;/i;
	#เพิ่ม att ลงใน schema
	$text1 = "#%>End Att;";
	$TempData3 =~  s/$text1/$newatt/i;
    #เพิ่ม att ลงใน view	
	$text1 = "#end_att";
	$text2= "# $viewatt\n#end_att";
	$TempData5 =~  s/$text1/$text2/i;
	
	#แยกข้อมูลลงในแต่ละส่วน
	@DataSec1 = split (/!/,$TempData1);
	@DataSec3 = split (/!/,$TempData3);
	@DataSec4 = split (/!/,$TempData4);
	@DataSec5 = split (/!/,$TempData5);
	@NewFileData = (@DataSec1,"\n",@DataSec2,"\n",@DataSec3,"\n",@DataSec4,"\n","\n",@DataSec5);
	
	#ทำ Backup file	
	open (FILE,">$path/ext.schema.bak");
    print FILE @FileData;
	close (FILE);
	chmod (0644,"$path/ext.schema.bak");
    #เขียนข้อมูลลงใน file อันใหม่
	open (FILE,">$path/ext.schema");
    print FILE @NewFileData;
	close (FILE);
	chmod (0644,"$path/ext.schema");
	$scr->at(5,3)->bold();
	print "Add Attribute complete!";
	$scr->at(6,3)->bold();
	print "Press any key to return to menu";
	$scr->normal();
}
#--------------------------------------------------------------------------------------
sub remove_att
{
	my $AttName,$text,$idx1,$idx2,$ch,$tch,$len,$temp1,$temp2;
    	
	$ch = "";
	$tch = "";
	$AttName = "";
	$scr->at(3,3)->bold();
	print "Enter Attribute Name:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch = $scr->getch();
		$tch = $tch.$ch;
	}until (ord($ch)== 13);
	chop ($tch);
	$AttName = $tch;
	$len = length ($AttName);
	$idx1 = index ($TempData3,"#s_$AttName;");
	$idx2 = index ($TempData3,"#e_$AttName;");
	if (($idx1 == -1)&($idx2 == -1))#หาว่ามี attribute ที่ต้องการจะ remove หรือไม่
	{
		$scr->at(4,3)->bold();
		print "$AttName Not fount in schema!";
		$scr->at(5,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
	else#ถ้ามีจะทำการ remove
	{
		$temp1 = substr ($TempData3,0,$idx1-3);#copy ข้อมูลตั้งแต่ต้นจนถึงก่อน att
		$idx1 = index ($TempData3,"#%>End Att;");
		$temp2 = substr ($TempData3,$idx2+5+$len,($idx1-($idx2+5+$len)+12));#copy ข้อมูลตั้งแต่หลัง att จนหมด section
		$TempData3 = $temp1.$temp2;#เอามาต่อกัน
		$AttNum -= 1;
		$TempData1 =~  s/AttNum=[0-9]*;/AttNum=$AttNum;/i;
		#Remove form Obj Section 
		if ($TempData4 =~ /$AttName\$/gi)
		{
			$TempData4 =~ s/$AttName\$//gi;
		}
		if ($TempData4 =~ /\$$AttName/gi)
		{
			$TempData4 =~ s/\$$AttName//gi;
		}
		if ($TempData4 =~ /$AttName/gi)
		{
			$TempData4 =~ s/$AttName//gi;
		}
		if ($TempData4 =~ /MUST \(\)/gi)
		{
			$TempData4 =~ s/\tMUST \(\)\n//gi;
		}
		#Remove form ViewSection
		#เอา att ออกจาก view ของ att
		$text = "# $AttName:[a-z0-9]*\n";
		$TempData5 =~  s/$text//i;
		#เอา att ออกจาก view ของ obj
		if ($TempData5 =~ /$AttName\$/gi)
		{
			$TempData5 =~ s/$AttName\$//gi;
		}
		if ($TempData5 =~ /\$$AttName/gi)
		{
			$TempData5 =~ s/\$$AttName//gi;
		}
		if ($TempData5 =~ /$AttName/gi)
		{
			$TempData5 =~ s/$AttName//gi;
		}
			
		#แยกข้อมูลลงในแต่ละส่วน
		@DataSec1 = split (/!/,$TempData1);
		@DataSec3 = split (/!/,$TempData3);
		@DataSec4 = split (/!/,$TempData4);
		@DataSec5 = split (/!/,$TempData5);
		@NewFileData = (@DataSec1,"\n",@DataSec2,"\n",@DataSec3,"\n",@DataSec4,"\n","\n",@DataSec5);
	
		#ทำ Backup file	
		open (FILE,">$path/ext.schema.bak");
		print FILE @FileData;
		close (FILE);
		chmod (0644,"$path/ext.schema.bak");
		#เขียนข้อมูลลงใน file อันใหม่
		open (FILE,">$path/ext.schema");
		print FILE @NewFileData;
		close (FILE);
		chmod (0644,"$path/ext.schema");
		$scr->at(4,3)->bold();
		print "Remove $AttName complete!";
		$scr->at(5,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
}
#--------------------------------------------------------------------------------------
sub add_obj
{
	my $ObjName,$InObjMem,$WrObjMem,@ObjMem,@TempObj,$each,$text1,$text2,$newobj,$num,
	   $ch1,$ch2,$tch1,$tch2,$i;
	
	$ch1 = "";
	$ch2 = "";
	$tch1 = "";
	$tch2 = "";
	$ObjName = "";
	
	$scr->at(3,3)->bold();
	print "Enter Objectclass Name:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch1 = $scr->getch();
		$tch1 = $tch1.$ch1;
	}until (ord($ch1)== 13);
	chop ($tch1);
	$ObjName = $tch1;
	$text1 = "\'$ObjName\'";
	if (($TempData4 =~ /$text1/i)||($ObjName eq "")) 
	{
		if ($ObjName eq "")
		{
			$scr->at(4,3)->bold();
		    print "$ObjName is empty name..Can not add!";
		    $scr->at(5,3)->bold();
		     print "Press any key to return to menu";
		    $scr->normal();
		}
		else
		{
			$scr->at(4,3)->bold();
			print "$ObjName Already in schema..Can not add!";
			$scr->at(5,3)->bold();
			print "Press any key to return to menu";
			$scr->normal();
		}	
		return 0;
	}
	$scr->at(5,3);
	print "Add Attribute into Objectclass Ex ==> attname_1,attname_2,...,attname_n";
	$scr->at(4,3)->bold();
	print "Add Member:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch2 = $scr->getch();
		$tch2 = $tch2.$ch2;
	}until (ord($ch2)== 13);
	chop ($tch2);
	$InObjMem = $tch2;#ชื่อของ att ที่จะใส่ลงใน obj
    @ObjMem = split (/,/,$InObjMem);#นำมาแยกใส่ array โดยดูจากตัวคั่น
	$num = @TempObj;#จำนวนสมากชินใน array
	$#TempObj = $#TempObj - $num;#ปรับขนาดของ array
	$i = 5;
	foreach  $each (@ObjMem)
	{
		 #$i++;
		 $text1 = "\'$each\'";
		 if (!($TempData3 =~ /$text1/i))#ตรวจดูว่า att ที่ป้อนเข้ามามีอยู่ใน schema หรือไม่
		 {
			 $i++;
			 $scr->at($i,3);
			 print "$each Not found can't not add to objectclass! ";
			 $each = "";
			 @TempObj = @TempObj;#ถ้าไม่มี att ก็ให้ array มีค่าเหมือนเดิม
		 }
		 else
		 {
			 @TempObj = (@TempObj,$each);#เอา att มาใส่ใน array
		 }
	}
	
	$WrObjMem = join ("\$",@TempObj);#เอามารวมเป็น string
	$LastObjId += 1;
	$ObjNum +=1;
	$newobj = "\n#s_$ObjName;\nobjectclass ($PObj.$LastObjId Name \'$ObjName\'\n\tSUP top STRUCTURAL\n\tMUST ($WrObjMem)\n\tMAY description)\n#e_$ObjName;\n#%>End Obj;";
	
	$TempData1 =~  s/LastObjId=[0-9]*;/LastObjId=$LastObjId;/i;
	$TempData1 =~  s/ObjNum=[0-9]*;/ObjNum=$ObjNum;/i;
	#เพิ่ม obj ลงใน schema
	$text1 = "#%>End Obj;";
	$TempData4 =~  s/$text1/$newobj/i;#เอาไปใส่ใน TempData4
    #เพิ่ม obj ลงใน view
	$text1 = "#end_obj";
	$text2= "# $ObjName:$WrObjMem\n#end_obj";
	$TempData5 =~  s/$text1/$text2/i;#เอาไปใส่ใน TempData5

	#แยกข้อมูลลงในแต่ละส่วน
    @DataSec1 = split (/!/,$TempData1);
	@DataSec3 = split (/!/,$TempData3);
	@DataSec4 = split (/!/,$TempData4);
	@DataSec5 = split (/!/,$TempData5);
	@NewFileData = (@DataSec1,"\n",@DataSec2,"\n",@DataSec3,"\n",@DataSec4,"\n","\n",@DataSec5);
	
	#ทำ Backup file	
	open (FILE,">$path/ext.schema.bak");
	print FILE @FileData;
	close (FILE);
	chmod (0644,"$path/ext.schema.bak");
		
	#เขียนข้อมูลลงใน file อันใหม่
	open (FILE,">$path/ext.schema");
	print FILE @NewFileData;
	close (FILE);
	chmod (0644,"$path/ext.schema");
	
	$scr->at($i+1,3)->bold();
	print "Add Objectclass complete!";
	$scr->at($i+2,3)->bold();
	print "Press any key to return to menu";
	$scr->normal();
}
#--------------------------------------------------------------------------------------
sub remove_obj
{
	my $ObjName,$text,$idx1,$idx2,$ch,$tch,$len,$temp1,$temp2;
    	
	$ch = "";
	$tch = "";
	$ObjName = "";
	$scr->at(3,3)->bold();
	print "Enter ObjClass Name:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch = $scr->getch();
		$tch = $tch.$ch;
	}until (ord($ch)== 13);
	chop ($tch);
	$ObjName = $tch;
	$len = length ($ObjName);
	$idx1 = index ($TempData4,"#s_$ObjName;");
	$idx2 = index ($TempData4,"#e_$ObjName;");
	if (($idx1 == -1)&($idx2 == -1))#ตรวจดูว่ามี obj ใน schema หรือไม่
	{
		 $scr->at(4,3)->bold();
		print "$ObjName Not fount in schema!";
		$scr->at(5,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
	else
	{
		#ตัดเอาท่อนบนก่อนถึง obj นั้น
		$temp1 = substr ($TempData4,0,$idx1-3);
		$idx1 = index ($TempData4,"#%>End Obj;");
		#ตัดเอาท่อนล่างหลังจาก obj นั้น
		$temp2 = substr ($TempData4,$idx2+5+$len,($idx1-($idx2+5+$len)+12));
		$TempData4 = $temp1.$temp2;
		$ObjNum -= 1;
		$TempData1 =~  s/ObjNum=[0-9]*;/ObjNum=$ObjNum;/i;
				
		#เอา obj ออกจาก view
		$text = "# $ObjName:[a-z0-9]*\n";
		$TempData5 =~  s/$text//i;#remove att
		
		#แยกข้อมูลลงในแต่ละส่วน
		@DataSec1 = split (/!/,$TempData1);
		@DataSec3 = split (/!/,$TempData3);
		@DataSec4 = split (/!/,$TempData4);
		@DataSec5 = split (/!/,$TempData5);
		@NewFileData = (@DataSec1,"\n",@DataSec2,"\n",@DataSec3,"\n",@DataSec4,"\n","\n",@DataSec5);
	
		#ทำ Backup file	
		open (FILE,">$path/ext.schema.bak");
		print FILE @FileData;
		close (FILE);
		chmod (0644,"$path/ext.schema.bak");
		
		#เขียนข้อมูลลงใน file อันใหม่
		open (FILE,">$path/ext.schema");
		print FILE @NewFileData;
		close (FILE);
		chmod (0644,"$path/ext.schema");
		$scr->at(4,3)->bold();
		print "Remove $ObjName complete!";
		$scr->at(5,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
}
#--------------------------------------------------------------------------------------
sub obj_add_att
{
	my  $ObjName,$ch1,$tch1,$ch2,$tch2,$idx1,$idx2,$len,$temp1,$temp2,$temp3,$text1,$text2,$InObjMem,
		    @ObjMem,@TempObj,$WrObjMem;
	
	$ch1 = "";
	$ch2 = "";
	$tch1 = "";
	$tch2 = "";
	$ObjName = "";

	$scr->at(3,3)->bold();
	print "Enter Objectclass Name:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch1 = $scr->getch();
		$tch1 = $tch1.$ch1;
	}until (ord($ch1)== 13);
	chop ($tch1);
	$ObjName = $tch1;
	$text1 = "\'$ObjName\'";
	if ($TempData4 =~ /$text1/gi)#ตรวจว่ามี obj ใน schema หรือไม่ 
	{
		$idx1 = index ($TempData4,"#s_$ObjName;");
		$idx2 = index ($TempData4,"#e_$ObjName;");
		$len = length ($ObjName);
		$temp1 = substr ($TempData4,$idx1,($idx2-$idx1)+$len+4+1);#ตัดเอาแต่ส่วนของ obj อันที่ต้องการ +# e _  ; \n
		$scr->at(5,3);
	    print "Add Attribute into Objectclass Ex ==> attname_1,attname_2,...,attname_n";
	    $scr->at(4,3)->bold();
	    print "Add Member:";
	    $scr->normal();
	    do
        {
			$scr->echo();
			$ch2 = $scr->getch();
			$tch2 = $tch2.$ch2;
		}until (ord($ch2)== 13);
		chop ($tch2);
		$InObjMem = $tch2;
		@ObjMem = split (/,/,$InObjMem);#แยกข้อมูลจาก list ใส่ใน array
		$num = @TempObj;
		$#TempObj = $#TempObj - $num;
		$i = 5;
		foreach  $each (@ObjMem)
		{
			$text1 = "\'$each\'";
			if (!($TempData3 =~ /$text1/i))#ตรวจสอบว่ามี att ที่ป้อนมาหรือไม่
			{
				$i++;
				$scr->at($i,3);
				print "$each Not found can't not add to objectclass! ";
				$each = "ee";
			}
			else
			{
				if ($temp1 =~ /$each/i)#ตรวจว่า att ที่ป้อนมาซ้ำกับที่มีอยู่ใน obj หรือไม่
				{
					$each="ee";
				}
				else
				{
					@TempObj = (@TempObj,$each);
				}
			}
		}
		$scr->at(20,20);
		print "----@TempOb";
		$WrObjMem = join ("\$",@TempObj);#join กลับเป็น list เหมือนเดิม
		if (($WrObjMem eq "ee")||($WrObjMem eq ""))
		{
			$text1 = "MUST ($WrObjMem";
		}
		else
		{
			$text1 = "MUST ($WrObjMem\$";
		}
		$temp1 =~ s/MUST \(/$text1/i;#ใส่ att ใหม่ใน obj
		$idx1 = index ($TempData4,"#s_$ObjName;");
		$idx2 = index ($TempData4,"#e_$ObjName;");
		$len = length ($ObjName);
		$temp2 = substr ($TempData4,0,$idx1-3);#ตัดเอาท่อนบนก่อนถึง obj นั้น
		
		$idx1 = index ($TempData4,"#%>End Obj;");
		$temp3 = substr ($TempData4,$idx2+5+$len,($idx1-($idx2+5+$len)+12));#ตัดเอาท่อนล่างหลังจาก obj นั้น
		
		$TempData4 = $temp2."\n".$temp1.$temp3;#เอามาต่อกัน
		#เอาไปใส่ใน view		
		$text1 = "$ObjName:";
        if (($WrObjMem eq "ee")||($WrObjMem eq ""))
		{
			$text2 = "$ObjName:$WrObjMem";
		}
		else
		{
			$text2 = "$ObjName:$WrObjMem\$";
		}
		$TempData5 =~ s/$text1/$text2/i;
		#แยกข้อมูลลงในแต่ละส่วน
		@DataSec1 = split (/!/,$TempData1);
		@DataSec3 = split (/!/,$TempData3);
		@DataSec4 = split (/!/,$TempData4);
		@DataSec5 = split (/!/,$TempData5);
		@NewFileData = (@DataSec1,"\n",@DataSec2,"\n",@DataSec3,"\n",@DataSec4,"\n","\n",@DataSec5);
	
		#ทำ Backup file	
		open (FILE,">$path/ext.schema.bak");
		print FILE @FileData;
		close (FILE);
		chmod (0644,"$path/ext.schema.bak");
		
		#เขียนข้อมูลลงใน file อันใหม่
		open (FILE,">$path/ext.schema");
		print FILE @NewFileData;
		close (FILE);
		chmod (0644,"$path/ext.schema");
		$scr->at($i+1,3)->bold();
		print "Add Attribute to $ObjName complete!";
		$scr->at($i+2,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
	else
	{
		$scr->at(4,3)->bold();
		print "$ObjName Not found in schema!";
		$scr->at(5,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
}
#--------------------------------------------------------------------------------------
sub obj_remove_att
{
	my  $ObjName,$ch1,$tch1,$ch2,$tch2,$idx1,$idx2,$len,$temp1,$temp2,$temp3,$text1,$text2,$InObjMem,@ObjMem,@TempObj;
	
	$ch1 = "";
	$ch2 = "";
	$tch1 = "";
	$tch2 = "";
	$ObjName = "";

	$scr->at(3,3)->bold();
	print "Enter Objectclass Name:";
	$scr->normal();
	do
    {
		$scr->echo();
		$ch1 = $scr->getch();
		$tch1 = $tch1.$ch1;
	}until (ord($ch1)== 13);
	chop ($tch1);
	$ObjName = $tch1;
	$text1= "\'$ObjName\'";
	if ($TempData4 =~ /$text1/i)#ตรวจว่ามี obj ใน schema หรือไม่ 
	{
		$idx1 = index ($TempData4,"#s_$ObjName;");
		$idx2 = index ($TempData4,"#e_$ObjName;");
		$len = length ($ObjName);
		$temp1 = substr ($TempData4,$idx1,($idx2-$idx1)+$len+4+1);#ตัดเอาแต่ส่วนของ obj อันที่ต้องการ +# e _  ; \n
		$scr->at(5,3);
	    print "Remove Attribute from Objectclass Ex ==> attname_1,attname_2,...,attname_n";
	    $scr->at(4,3)->bold();
	    print "Remove Member:";
	    $scr->normal();
		do
        {
			$scr->echo();
			$ch2 = $scr->getch();
			$tch2 = $tch2.$ch2;
		}until (ord($ch2) == 13);
		chop ($tch2);
		$InObjMem = $tch2;
		@ObjMem = split (/,/,$InObjMem);#แยกข้อมูลจาก list ใส่ใน array
		$num = @TempObj;
		$#TempObj = $#TempObj - $num;
		$i = 5;
		foreach  $each (@ObjMem)
		{
			$text1 = "\'$each\'";
			if ($temp1 =~ /$each/i)#ตรวจว่า att ที่ป้อนมามีอยู่ใน obj หรือไม่
			{
				#Remove form Obj Section 
				if ($temp1 =~ /$each\$/gi)
				{
					$TempData4 =~ s/$each\$//gi;
				}
				if ($temp1 =~ /\$$each/gi)
				{
					$temp1 =~ s/\$$each//gi;
				}
				if ($temp1 =~ /$each/gi)
				{
					$temp1 =~ s/$each//gi;
				}
				#Remove form ViewSection
				#เอา att ออกจาก view ของ obj
				if ($TempData5 =~ /$ObjName:[a-z0-9]*$each\$[a-z0-9]*/gi)
				{
					$TempData5 =~ s/$each\$//gi;
				}
				if ($TempData5 =~ /$ObjName:[a-z0-9]*\$$each[a-z0-9]*/gi)
				{
					$TempData5 =~ s/\$$each//gi;
				}
				if ($TempData5 =~ /$ObjName:[a-z0-9]*$each[a-z0-9]*/gi)
				{
					$TempData5 =~ s/$each//gi;
				}
			}
			else
			{
				$i++;
				$scr->at($i,3);
				print "$each Not found can't not remove from objectclass! ";
			}
		}	
		if ($temp1 =~ /MUST \(\)/gi)#ตรวจว่ามี must ที่ไม่มี att หรือไม่
		{
			$temp1 =~ s/\tMUST \(\)\n//gi;
		}
		$idx1 = index ($TempData4,"#s_$ObjName;");
		$idx2 = index ($TempData4,"#e_$ObjName;");
		$len = length ($ObjName);
		$temp2 = substr ($TempData4,0,$idx1-3);#ตัดเอาท่อนบนก่อนถึง obj นั้น
		
		$idx1 = index ($TempData4,"#%>End Obj;");
		$temp3 = substr ($TempData4,$idx2+5+$len,($idx1-($idx2+5+$len)+12));#ตัดเอาท่อนล่างหลังจาก obj นั้น
		
		$TempData4 = $temp2."\n".$temp1.$temp3;#เอามาต่อกัน
		#แยกข้อมูลลงในแต่ละส่วน
		@DataSec1 = split (/!/,$TempData1);
		@DataSec3 = split (/!/,$TempData3);
		@DataSec4 = split (/!/,$TempData4);
		@DataSec5 = split (/!/,$TempData5);
		@NewFileData = (@DataSec1,"\n",@DataSec2,"\n",@DataSec3,"\n",@DataSec4,"\n","\n",@DataSec5);
	
		#ทำ Backup file	
		open (FILE,">$path/ext.schema.bak");
		print FILE @FileData;
		close (FILE);
		chmod (0644,"$path/ext.schema.bak");
	
		#เขียนข้อมูลลงใน file อันใหม่
		open (FILE,">$path/ext.schema");
		print FILE @NewFileData;
		close (FILE);
		chmod (0644,"$path/ext.schema");
		$scr->at($i+1,3)->bold();
		print "Remove Attribute from $ObjName complete!";
		$scr->at($i+2,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();	
	}
	else
	{
		$scr->at(4,3)->bold();
		print "$ObjName Not found in schema!";
		$scr->at(5,3)->bold();
		print "Press any key to return to menu";
		$scr->normal();
	}
}
#--------------------------------------------------------------------------------------
sub view
{
	my $temp.$idx1,$idx2,$i;
	$idx1 = index ($TempData5,"#%>View Section;");
	$idx2 = index ($TempData5,"#%>End View;");
	$temp = substr ($TempData5,$idx1+17,($idx2-$idx1)-17);
	
	$temp =~ s/\#//g;
	$temp =~ s/end_att//g;
	$temp =~ s/end_obj//g;
	@view = split (/!/,$temp);
	$i = 3;
	foreach  $each (@view) 
	{
		$scr->at($i,4);
		print "$each";
		$i++;
	}
}
#--------------------------------------------------------------------------------------
sub menu
{
	my $choice,@Att_to,$quit,$key,$exit,$quit,$point;
	
	
	$choice = 0;
	$key = 0;
	$point = 1;
	$quit = 0;
	$scr->normal();
	for ($i = 0;$i <=110;$i++)
	{
		$scr->reverse();
		$scr->at(0,$i);
		print " ";
	}
	$scr->at(0,2);
	print "Schema Tool V 0.1";
	
	$scr->at(5,37);
	print "1.Add Attribute to Schema";
	$scr->normal();
	$scr->at(7,37);
	print "2.Add ObjectClass to Schema";
	$scr->at(9,37);
	print "3.Remove Attribute from Schema";
	$scr->at(11,37);
	print "4.Remove ObjectClass from Schema";
	$scr->at(13,37);
	print "5.Add Attribute to ObjectClass";
	$scr->at(15,37);	
	print "6.Remove Attribute from ObjectClass";
	$scr->at(17,37);	
	print "7.View Attribute&ObjectClass";
	$scr->at(19,37);	
	print "8.Exit....";
		
	$scr->at(5,37)->reverse();
	print "1.Add Attribute to Schema";
	$scr->normal();
	do
	{
		do
		{
			$key = $scr->getch();
		 
			if ($key eq 'ku')
			{
				$point--;
				if ($point == 0)
				{
					$point = 1;
				}
				if ($point == 1)#ku
				{
					$scr->normal();
					
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->normal();
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
		
					$scr->at(5,37)->reverse();
					print "1.Add Attribute to Schema";
					$scr->normal();
				}
				if ($point == 2)#ku
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";

					$scr->at(7,37)->reverse();
					print "2.Add ObjectClass to Schema";
					$scr->normal();
				}
				if ($point == 3)#ku
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
											
					$scr->at(9,37)->reverse();
					print "3.Remove Attribute from Schema";
					$scr->normal();
				}
				if ($point == 4)#ku
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
				
					$scr->at(11,37)->reverse();
					print "4.Remove ObjectClass from Schema";
					$scr->normal();
				}
				if ($point == 5)#ku
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(13,37)->reverse();	
					print "5.Add Attribute to ObjectClass";
					$scr->normal();
				}
				if ($point == 6)#ku
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(15,37)->reverse();	
					print "6.Remove Attribute from ObjectClass";
					$scr->normal();
				}
				if ($point == 7)#ku
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(17,37)->reverse();	
					print "7.View Attribute&ObjectClass";
					$scr->normal();
				}
		     }#edn if ku
			elsif ($key eq 'kd')
			{
				$point++;
				if ($point == 9)#kd
				{
					$point = 8;
				}
				if ($point == 2)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";

					$scr->at(7,37)->reverse();
					print "2.Add ObjectClass to Schema";
					$scr->normal();
				}
				if ($point == 3)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
											
					$scr->at(9,37)->reverse();
					print "3.Remove Attribute from Schema";
					$scr->normal();
				}
				if ($point == 4)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
				
					$scr->at(11,37)->reverse();
					print "4.Remove ObjectClass from Schema";
					$scr->normal();
				}
				if ($point == 5)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(13,37)->reverse();	
					print "5.Add Attribute to ObjectClass";
					$scr->normal();
				}
				if ($point == 6)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(15,37)->reverse();	
					print "6.Remove Attribute from ObjectClass";
					$scr->normal();
				}
				if ($point == 7)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(17,37)->reverse();	
					print "7.View Attribute&ObjectClass";
					$scr->normal();
				}
				if ($point == 8)#kd
				{
					$scr->at(5,37);
					print "1.Add Attribute to Schema";
					$scr->at(7,37);
					print "2.Add ObjectClass to Schema";
					$scr->at(9,37);
					print "3.Remove Attribute from Schema";
					$scr->at(11,37);
					print "4.Remove ObjectClass from Schema";
					$scr->at(13,37);
					print "5.Add Attribute to ObjectClass";
					$scr->at(15,37);	
					print "6.Remove Attribute from ObjectClass";
					$scr->at(17,37);	
					print "7.View Attribute&ObjectClass";
					$scr->at(19,37);	
					print "8.Exit....";
	
					$scr->at(19,37)->reverse();	
					print "8.Exit....";
					$scr->normal();
				}
			}#end else kd
        }until (ord ($key) == 13);#end do
	
		if ($point == 1)#select 1
		{
			$scr->at(0,19)->reverse();
			print " : [Add Attribute]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			@Att_to = &in_att;
			&add_att(@Att_to[0],@Att_to[1]);
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                                            ";
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 2)#select 2
		{
			$scr->at(40,0)->clreol();#clear select choice
			$scr->at(0,19)->reverse();
			print " : [Add ObjectClass]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			&add_obj;
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                  ";
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 3)#select 3
		{
			$scr->at(40,0)->clreol();#clear select choice
			$scr->at(0,19)->reverse();
			print " : [Remove Attribute]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			&remove_att;
			$scr->normal();
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                  ";
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 4)#select 4
		{
			$scr->at(40,0)->clreol();#clear select choice
			$scr->at(0,19)->reverse();
			print " : [Remove ObjectClass]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			&remove_obj;
			$scr->normal();
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                  ";
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 5)#select 5
		{
			$scr->at(40,0)->clreol();#clear select choice
			$scr->at(0,19)->reverse();
			print " : [Add Attribute to ObjectClass]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			&obj_add_att;
			$scr->normal();
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                  ";
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 6)#select 6
		{
			 $scr->at(40,0)->clreol();#clear select choice
			$scr->at(0,19)->reverse();
			print " : [Remove Attribute from ObjectClass]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			&obj_remove_att;
			$scr->normal();
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                  ";
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 7)#select 7
		{
			$scr->at(40,0)->clreol();#clear select choice
			$scr->at(0,19)->reverse();
			print " : [View Attribute&ObjectClass]";
			$scr->normal();
			#Clear Menu
			$scr->at(2,0);
			for ($i = 2;$i <= 26;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Menu
			&read_file;
			&view;
			$scr->at(40,0)->bold();
			print "Press any key to return to menu";
			$scr->normal();
			$scr->noecho();#hide curser
			$scr->getch();
			$scr->flush_input();
			$scr->at(0,19)->reverse();
			print "                                                                         ";#clear title name
			#Clear Att Screen
			$scr->at(2,0);
			for ($i = 2;$i <= 41;$i++)
			{
				$scr->at($i,0)->clreol();
			}
			#End Clear Att Screen
			$point = 1;
		}
		if ($point == 8)#select 8
		{
			$quit = 1;
		}
		
		for ($i = 0;$i <=110;$i++)
		{
			$scr->reverse();
			$scr->at(0,$i);
			print " ";
		}
		$scr->at(0,2);
		print "Schema Tool V 0.1";	

		$scr->at(5,37);
		print "1.Add Attribute to Schema";
		$scr->normal();
		$scr->at(7,37);
		print "2.Add ObjectClass to Schema";
		$scr->at(9,37);
		print "3.Remove Attribute from Schema";
		$scr->at(11,37);
		print "4.Remove ObjectClass from Schema";
		$scr->at(13,37);
		print "5.Add Attribute to ObjectClass";
		$scr->at(15,37);	
		print "6.Remove Attribute from ObjectClass";
		$scr->at(17,37);	
		print "7.View Attribute&ObjectClass";
		$scr->at(19,37);	
		print "8.Exit....";
		
		$scr->at(5,37)->reverse();
		print "1.Add Attribute to Schema";
		$scr->normal();
	}until ($quit == 1);
}
#Main----------------------------------------------------------------------------------
system ("clear");
$scr = new Term::Screen;
unless ($scr) { die " Something's wrong \n"; }
$scr->at(0,0);
&menu;
system ("clear");