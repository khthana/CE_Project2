#! /usr/bin/perl
my $host = "localhost";
my $user = "magazine";
my $password = "magazine";
my $dbname = "magazine";

use Mysql;
use Time::JulianDay;
use Mail::Sendmail;
#
# connect Database by "Mysql->" and assign to object "$dbh"
#
#print "    Mime-version: 1.0"
#print "        Content-type: 'text/plain; charset="iso-8859-1"'
@thaimonth = ("มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฏาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
$dbh = Mysql->connect($host, $dbname, $user, $password) || die ("cannot connect\n");

($sec,$min,$hour,$mday,$mon,$year,$wday,$ydat,$isdst) = localtime();
$year+=1900;
$mon+=1;
$today= "$year-$mon-$mday";
  $jdtoday = julian_day($year,$mon,$mday);
$sql1=$dbh->query("select sch_id,mem_id,sch_date,sch_time,sch_remind_before,sch_remind_before_hour,sch_sendmail from schedule where sch_date>= '$today' and sch_remind_mail='Y' and sch_sendmail<>'Y' order by sch_date,sch_time")|| die ("cannot query\n");
# load fields into array @row

#print "Content-Type: text/html\n\n";
while(@row=$sql1->fetchrow)   {
#	print "$row[0] $row[1] $row[2] $row[3] \n";
	$sch_tmp=$row[2]; #date
	$sch_time=int substr($row[3],0,2);
	$sch_remind_day=int $row[4];
	$sch_remind_hour=int $row[5];
	if($row[6]!="") {
		$sch_sendmail==$row[6];
	}else
	{
		$sch_sendmail="";
	}
	@sch_date=split(/-/,$sch_tmp);
	#print "$sch_date[0] LL $sch_date[1] LL $sch_date[2] \n";
	$jd_sch = julian_day($sch_date[0],$sch_date[1],$sch_date[2]);
	$diff_day=$jd_sch-$jdtoday;
	$diff_hour=$sch_time-$hour;
	$diff_sch=$diff_hour+($diff_day*24);
	$sch_remind=($sch_remind_day*24)+$sch_remind_hour;

	#----------check for sending mail ------------
	if($diff_sch>=0)  #it's mean the job is now or future
	{

	if ( $sch_remind>=$diff_sch) {
		$mem_id=$row[1];
		$sch_id=$row[0];
		$sql2=$dbh->query("select  mem_fname,mem_lname,mem_email from member where mem_id= $mem_id")|| die ("cannot query\n");
		@mem=$sql2->fetchrow;
		#print "$mem[0] $mem[1] -- $mem[2] \n";
		$sql3=$dbh->query("select  sch_title,sch_note,sch_duration,sch_time,app_id from schedule where sch_id= $sch_id")|| die ("cannot query\n");
		@sch=$sql3->fetchrow;
#		print "$sch[0] $sch[1] -- $sch[2]--$row[1] \n";
#		print "-------------------------------- \n ";
		$sch_year= int $sch_date[0] +543;
		$sch_time= substr($sch[3],0,5);
		$tmp_month=int ($sch_date[1] - 1);
		if($sch[4]!="")
		{
			$app_id=$sch[4];
			$tmp1="ผู้ร่วมนัด :  ";
			$friend="";
			$sql_app=$dbh->query("select mem_username,mem_fname from member m1, schedule s1 where s1.mem_id=m1.mem_id and s1.mem_id<>$mem_id and app_id=$app_id order by mem_username")|| die("cannot query \n");
			while(@appfriend=$sql_app->fetchrow){
				$friend.="$appfriend[0] ( $appfriend[1] )";
			}
			if(length($friend)>1)
			{ $friend=$tmp1.$friend." \n";
			}
		}else
		{ $app_id="";
		}
		%mail = ( Header => "Content-type: text/plain; charset=US-ASCII",
		To      => "$mem[2]",
		From    => 'magazine@olala05.ce.kmitl.ac.th',
		Subject => "เตือนงาน: $sch[0]",
		Message => "ถึง.. คุณ $mem[0]  $mem[1] \n วันที่ : $sch_date[2] $thaimonth[$tmp_month] $sch_year    เวลา : $sch_time   ระยะเวลา: $sch[2]  ชม. \n".
				"มีงานเรื่อง: $sch[0] \n รายละเอียดของงาน: $sch[1] \n $friend".
			"--------------------------------------\n ระบบปฏิทินนัดหมาย ใน http://document.ce.kmitl.ac.th \n"
		 );
		sendmail(%mail) or die $Mail::Sendmail::error;
		$sql4=$dbh->query("update schedule set sch_sendmail='Y' where sch_id=$sch_id")|| die ("cannot query \n");
		print "OK. Log says:\n", $Mail::Sendmail::log;

	} #if chk_remind
	} # diff_sch


} #while


#print "$year-$mon-$mday \n";
#$jd = julian_day($year,$mon,$mday);
#print "jd-$jd \n";
#($year2, $month2, $day2) = inverse_julian_day($jd);      
#print "$year2-$month2-$day2 \n";
#$jd = julian_day($year,$mon,$mday+1);
#print "jd1-$jd \n";
#$jd = julian_day($year,$mon,$mday+7);
#print "jd7-$jd \n";
#$jd = local_julian_day($seconds_since_1970);
#print "jd-$jd \n";
#$jd = gm_julian_day($seconds_since_1970);
#print "jd-$jd \n";
#($year2, $month2, $day2) = inverse_julian_day($jd);
#print "$year2-$month2-$day2 \n";
