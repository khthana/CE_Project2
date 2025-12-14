<?php

//
// Run this script form phpBB root
//

//define('DEBUG_MODE', TRUE);

$sql_ary = array();
$err = '';

################################################################################

// sql-delimiter is ; (semicolon)
$sql_1 = "
UPDATE `phpbb_groups` SET `group_description` = '' WHERE `group_description` = 'Personal User';
DELETE FROM `phpbb_bt_config` WHERE `config_name` = 'calc_ann_intv';
DELETE FROM `phpbb_bt_config` WHERE `config_name` = 'max_ann_rate';
ALTER TABLE `phpbb_bt_users_dl_status` ADD `compl_count` TINYINT(1) UNSIGNED DEFAULT '0' NOT NULL AFTER `user_status`;
UPDATE `phpbb_bt_users_dl_status` SET `compl_count` = 1 WHERE `user_status` = 2;
UPDATE `phpbb_config` SET `config_value` = '.0.17' WHERE `config_name` = 'version' LIMIT 1;
UPDATE `phpbb_attachments_config` SET `config_value` = '2.3.14' WHERE `config_name` = 'attach_version' LIMIT 1;
";

$sql_fin = "
ANALYZE TABLE `phpbb_bt_config`, `phpbb_bt_search_results`, `phpbb_bt_tor_dl_stat`, `phpbb_bt_torrents`, `phpbb_bt_tracker`, `phpbb_bt_users`, `phpbb_bt_users_dl_status`;
OPTIMIZE TABLE `phpbb_bt_config`, `phpbb_bt_search_results`, `phpbb_bt_tor_dl_stat`, `phpbb_bt_torrents`, `phpbb_bt_tracker`, `phpbb_bt_users`, `phpbb_bt_users_dl_status`;
";

################################################################################

function get_sql_ary ($sql_str)
{
	global $table_prefix;

	if (isset($table_prefix) && $table_prefix != 'phpbb_')
	{
		$sql_str = preg_replace('/phpbb_/', $table_prefix, $sql_str);
	}
	return explode(';', str_replace("\n", '', trim($sql_str)));
}

function print_sql_err ($sql)
{
	global $db, $err;

	$sql_error = $db->sql_error();
	$mess = $sql_error['message'];
	$err = $sql_error['code'];

	echo "\n<font color=darkred>$sql\n";
	echo "<b>Error $err: $mess</b>\n</font>";
}

function print_sql_ok ($sql)
{
	global $err;

	echo ($err) ? "\n" : '';
	$err = '';

	echo "<font color=darkgreen><b>OK</b> - " . str_replace("\n", ' ', str_replace("\t", '',  $sql))  . "</font>\n";
}

function run_sql_query ($sql_ary)
{
	global $db;

	for ($i=0, $cnt=count($sql_ary); $i<$cnt; $i++)
	{
		if ( defined('DEBUG_MODE') )
		{
			print_r ($sql_ary);
			exit;
		}

		if (!$sql = trim($sql_ary[$i]))
		{
			continue;
		}

		if ( !$db->sql_query($sql) )
		{
			print_sql_err($sql);
			continue;
		}

		print_sql_ok($sql);
	}
}

error_reporting(E_ALL & ~E_NOTICE);
set_magic_quotes_runtime(0);
@ob_implicit_flush();
@set_time_limit(600);

define('IN_PHPBB', true);
$phpbb_root_path = './';

$script_name = basename($HTTP_SERVER_VARS['SCRIPT_NAME']);

if ( !file_exists($phpbb_root_path . 'extension.inc') )
{
	die("Please place <b>$script_name</b> within the phpBB <b>root folder</b>");
}

include($phpbb_root_path . 'extension.inc');
include($phpbb_root_path . 'config.'.$phpEx);
include($phpbb_root_path . 'includes/constants.'.$phpEx);

if ( !preg_match("/^mysql/i", $dbms) )
{
	die("Not supported database, must be <b>MySQL</b>");
}

// Make the database connection.
include($phpbb_root_path . 'includes/db.'.$phpEx);

echo '<pre>';

run_sql_query($sql_ary = get_sql_ary($sql_1));
$sql_ary = array();

//
// Build other SQL update queries
//


//

run_sql_query($sql_ary = get_sql_ary($sql_fin));

echo '</pre>';

echo '<br />Update complete';

?>