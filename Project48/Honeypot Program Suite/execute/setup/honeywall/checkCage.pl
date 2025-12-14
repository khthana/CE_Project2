#!/usr/bin/perl

use DBI;
#=====================[define_variable]====================
$check_user = 0;
$check_group = 0;
$check_owner = 0;
$check_pass = 0;
$check_mode = 0;
$pass_old = `cat shadow_old | grep root`;
chop($pass_old);

#=====================[define_samhain]=====================
$host_samhain = 'logserver';
$db_samhain = 'samhain';
$table_samhain = 'log';
$user_samhain = 'samhain';
$password_samhain = 'honeypot';

#=====================[define_cage]=======================
$host_cage = 'logserver';
$db_cage = 'cage';
$table_cage = 'information';
$user_cage = 'cage';
$password_cage = 'honeypot';

#====================[do job]==============================
read_config();
open_dbi_samhain();
open_dbi_cage();
query_dbi_samhain();
query_dbi_cage();
check_cage();
close_dbi_samhain();
close_dbi_cage();


#=====================[open_dbi_samhain]=======================
sub open_dbi_samhain
{
	$dbh_samhain = DBI->connect("dbi:mysql:$db_samhain:$host_samhain","$user_samhain","$password_samhain") or err_trap("Cannot connect to database");
	$drh_samhain = DBI->install_driver("mysql");
	@databases_samhain = DBI->data_sources("mysql");
	print("open samhain OK\n");
}
#=====================[query_dbi_samhain]======================
sub query_dbi_samhain
{
	$sth_samhain = $dbh_samhain->prepare("select * from $table_samhain where path like \'/etc/passwd%'");
	if(!$sth_samhain) 
	{
		die "Error:" . $dbh_samhain->errstr . "\n"
	}	
	if(!$sth_samhain->execute) 
	{
		die "Error:" . $sth_samhain->errstr . "\n";
	}
	print("query samhain OK\n");
}


#=======================[open_dbi_cage]=======================
sub open_dbi_cage
{
	$dbh_cage = DBI->connect("dbi:mysql:$db_cage:$host_cage","$user_cage","$password_cage") or err_trap("Cannot connect to database");
	$drh_cage = DBI->install_driver("mysql");
	@databases_cage = DBI->data_sources("mysql");
	print("open cage OK\n");
}
#=======================[query_dbi_cage]=====================
sub query_dbi_cage
{
	$sth_cage = $dbh_cage->prepare("select * from $table_cage where cname = \'$name\' ");
	if(!$sth_cage) 
	{
		die "Error:" . $dbh_cage->errstr . "\n"
	}
	if(!$sth_cage->execute) 
	{
		die "Error:" . $sth_cage->errstr . "\n";
	}

	$ref_cage = $sth_cage->fetchrow_hashref;
	$path = $ref_cage->{'cpath'}.'/cage/';
	$ip = $ref_cage->{'cip'};
	$cmd = 'ssh root@'.$ip.' cat /etc/shadow | grep root | cut -d \':\' -f 2';
	#$pass_new = `$cmd`;
	chop($pass_new);
	$cmd2 = '`ssh root@'.$ip.' cat /etc/passwd | wc -l\`';
	#$user_current = `$cmd`;
	chop($user_current);
	$cmd3 = 'ssh root@'.$ip.' cat /etc/group | grep root | cut -d \':\' -f 4';
	print("cmd3 = ",$cmd3,"\n");
}
#=====================[close_dbi_samhain]======================
sub close_dbi_samhain
{
	$sth_samhain->finish;
	$dbh_samhain->disconnect or err_trap("Cannot disconnect from the database");
}

#=====================[close_dbi_cage]======================
sub close_dbi_cage
{
	$sth_cage->finish;
	$dbh_cage->disconnect or err_trap("Cannot disconnect from the database");
}
#=====================[check_cage]==================
sub check_cage
{
	if($check_user)
	{
		if($user_current > $user_limit)
 		{
 			$cmd = 'vmware-cmd -q '.$path.$name.'.vmx suspended hard &';
#  			`$cmd`;
		}
	}
	elsif($check_pass)
	{
		if($pass_old ne $pass_new)
 		{
 			$cmd = 'vmware-cmd -q '.$path.$name.'.vmx suspended hard &';;
#  			`$cmd`;
		}
	}
	elsif($check_group)
	{
		
	}
	elsif($check_owner or $check_mode)
	{
		samhain_check();
	}
}
#=====================[pattern_match]==================
sub samhain_check
{	
	$stop = 1;
	while(($ref_samhain = $sth_samhain->fetchrow_hashref) and $stop)
	{
		$ref_samhain = $sth_samhain->fetchrow_hashref;
		if($check_owner)
		{
  			if($ref_samhain->{'owner_new'} ne $ref_samhain->{'owner_old'})
 			{
 				$cmd = 'vmware-cmd -q '.$path.$name.'.vmx suspended hard &';
#  				`$cmd`;
				$stop = 0;
			}	
		}
		if($check_mode)
		{
			if($ref_samhain->{'mode_old'} ne "" or $ref_samhain->{'mode_new'} ne "")
			{
				if($ref_samhain->{'mode_new'} ne $ref_samhain->{'mode_old'})
				{	
					$cmd = 'vmware-cmd -q '.$path.$name.'.vmx suspended hard &';
 					#`$cmd`;
					$stop = 0;
				}
			}
		}
	}
}

#=====================[read_config_file]=======================
sub read_config
{
	if(open(file, "./cage.conf"))
	{	
	#read line from file
		my $line = <file>;
		my $count = 0;
		#read line until end of file
		while($count lt 6)
		{
			$count++;
			chop($line);
			@word = split(/=/,$line);
			if($count eq 1)
			{
				$name = $word[1];
			}
			if($count eq 2)
			{
				$user_limit = $word[1];
				if($user_limit ne 0)
				{	
					$check_user = 1 ;
				}
			}
			if($count eq 3)
			{
				$group_limit = $word[1];
				if($group_limit ne 0)
				{	
					$check_owner = 1 ;
				}
			}
			if($count eq 4)
			{
				$owner = $word[1];
				if($owner ne "")
				{	
					$check_owner = 1 ;
				}
			}
			if($count eq 5)
			{
				if($word[1] eq "Yes")
				{
					$check_pass = 1;
				}
			}
			if($count eq 6)
			{
				$mode = $word[1];
				if($mode ne "")
				{	
					$check_mode = 1 ;
				}
			}		
			$line = <file>;
		}
	}
	else
	{
		print("cannot open file\n");
	}
}

#=====================[err_trap]=======================
sub err_trap
{
 	my $error_message = shift(@_);
 
 	die "$error_message\nERROR: $DBI::err ($DBI::errstr)\n";
}#end: err_trap

