#!/usr/bin/perl

use strict;
use DBI;
use Term::ReadKey;

my $dbh = open_dbi();
my $sth = query_dbi();

pattern_match($sth);
close_dbi($dbh);

#=====================[open_dbi]=======================
sub open_dbi
{
 	my $host = 'logserver';
 	my $db = 'cage';
	#print "Enter username : ";
	#my $user = <STDIN>;
	#chop($user);
	#print "Enter password : ";
	#ReadMode 'noecho';
	#my $password = ReadLine 0;
	#chomp($password);
 	#ReadMode 'normal';
	
	#my $dbh = DBI->connect("dbi:mysql:$db:$host","$user","$password") or err_trap("Cannot connect to database");
	my $dbh = DBI->connect("dbi:mysql:cage:logserver","cage","honeypot") or err_trap("Cannot connect to database");
 	my $drh = DBI->install_driver("mysql");
 	my @databases = DBI->data_sources("mysql");
 	
	return $dbh;
}#end: open_dbi

#=====================[query_dbi]=====================
sub query_dbi
{
 	my $table = 'information';
 	my $sth = $dbh->prepare("select cip,chostname from $table where 'use'=0");

 	if(!$sth) {
		die "Error:" . $dbh->errstr . "\n"
 	}
	if(!$sth->execute) {
		die "Error:" . $sth->errstr . "\n";
 	}
 	return $sth;
}#end: query_dbi

#=====================[pattern_match]==================
sub pattern_match
{
	#printf("\n");
 	my $sth = shift(@_);
	while (my $ref = $sth->fetchrow_hashref)
	{
		printf("$ref->{'cip'}\t $ref->{'chostname'}\n");
		#if($ref->{'owner_new'} ne $ref->{'owner_old'})
		#{
		#	print("\n",$ref->{'path'});
		#	print(" File was changed owner\n");
		#}
		#elsif($ref->{'group_new'} ne $ref->{'group_old'})
		#{
		#	print("\n",$ref->{'path'});
		#	print(" File was changed group from  %s to %s\n",$ref->{'group_old'},$ref->{'group_new'});
		#}
		#elsif($ref->{'attr_new'} ne $ref->{'attr_old'})
		#{
		#	print("\n",$ref->{'path'});
		#	print(" File was changed attribute from  %s to %s.\n",$ref->{'attr_old'}, $ref->{'attr_new'});
		#}
		#else
		#{
			
		#}	
	}	
	print("\ntest complete\n");
}#end: pattern_match

#=====================[err_trap]=======================
sub err_trap
{
 	my $error_message = shift(@_);
 
 	die "$error_message\nERROR: $DBI::err ($DBI::errstr)\n";
}#end: err_trap

#=====================[close_dbi]======================
sub close_dbi
{
 	my $dbh = shift(@_);
 
 	$sth->finish;
	$dbh->disconnect or err_trap("Cannot disconnect from the database");
 
}#end: close_dbi 
