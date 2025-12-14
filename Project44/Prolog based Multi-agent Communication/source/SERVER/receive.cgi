#!/usr/bin/perl
$filepath = "c:\\temp\\proweb\\";
print "Content-type:plain/text\n\n";
$length = $ENV{'CONTENT_LENGTH'};
$a = 0;
while( $a < 100000 ){
	$a = int( (rand() * 1000000) );
}
$filename = $filepath."f".$a.".pl";
open(FILE, ">$filename");
while(( $length )&&( $a = read( STDIN,$data,$length ) )){
	print FILE $data;
	$length -= $a;
}
print FILE "\n";
close(FILE);
printf("Filename=%s", $filename);


