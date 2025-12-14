#!/usr/bin/perl
#Get the input
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});

# Split the name-value pairs
@pairs = split(/&/,$buffer);
foreach $pair (@pairs) {
	($name, $value) = split (/=/, $pair);
	# Un=Webify plus signs and %-encoding
	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
	$FORM{$name} = $value;
}

$file = "guest.txt";
open(INFO,">>$file");
print INFO "$FORM{'name'}","EndL";
print INFO "$FORM{'email'}","EndL";
$FORM{'messages'} =~ tr/\n/ /;
print INFO "$FORM{'messages'}","EndL";
$time_miss = 15; 
($sec,$min,$hour,$day,$mon,$year,$wday,$yday,$isdst) = localtime(time+($time_miss*3600)); 
$mon++; 
if ($mon<10) {$mon="0$mon";}
if ($day<10) {$day="0$day";} 
if ($hour<10){$hour="0$hour";} 
if ($min<10) {$min="0$min";} 
if ($sec<10) {$sec="0$sec";}
$temp=`date`;
$nameday=substr($temp,0,4);
$year=substr($temp,-5,4); 
$date = "$nameday$day/$mon/$year ($hour\:$min\:$sec)"; 

print INFO "$date\n";
close(INFO);

print "Content-type: text/html\n\n";
print <<ENDTEXT;
<html><HEAD>
<TITLE> T H A N K  Y O U </TITLE>
</HEAD>
<body>
thank you
</body></html>
ENDTEXT
exit;
