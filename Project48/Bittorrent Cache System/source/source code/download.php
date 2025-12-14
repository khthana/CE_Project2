<?php
/* ----------------------------------------------------------------------------------- */
/* Require */
	require("bencode.inc.php");
	require("func_download.php");	

/* Define variable */	
	/* Get url */
	$url = $_GET['url'];	
	
	/* Get file name */
	$file_name  = strrchr($url,"/");

	/* File Path Setting */
	$save_path = "/opt/lampp/htdocs/torrent/original/".$file_name;
	$modified_path = "/opt/lampp/htdocs/torrent/modified/".$file_name;
	$return_path = "/opt/lampp/htdocs/torrent/return/".$file_name;


	/* Bittorrent Client Setting */
	$bit_client = "/usr/bin/bittorrent";
	$ip_peer = "161.246.5.224";
	$port = 6881;
	$peer_id = 'M4-4-0--c0b67690aaaa';

	/* Tracker Setting */
	$url_tracker = "http://161.246.5.224/phpBB2/bt/announce.php";

	/* Database Setting */
	$dbserver = 'localhost';
	$dbname = 'tracker';
	$dbuser = 'root';
	$dbpass = 'bittorrent';
	$table_torrent = "phpbb_bt_torrents";
	$table_tracker = "phpbb_bt_tracker";
	$table_filetorrents = "phpbb_bt_filetorrents";
	$id_torrent = 0;

/* ----------------------------------------------------------------------------------- */
/* Begin Main Program*/	
	// Download file
	if(download($url, $save_path) == false){
		echo "error reading or opening file";
		exit;
	};

	// Check info hash
	$files = check_hashinfo($save_path, $dbserver, $dbuser, $dbpass, $dbname, $table_filetorrents);
	if($files != null){
		return_file(strrchr($files,"/"), $files);
		exit;
	}

	// Copy file for modify
	copy($save_path, $modified_path);

	// Modify torrent
	$mt_handle =  modify_torrent($modified_path, $url_tracker);
	copy($modified_path, $return_path);

	
	// Return files to client
	return_file($file_name, $return_path);
	
	// Add record to database
	$id_torrent = add_db($modified_path, $dbserver, $dbuser, $dbpass, $dbname, $table_torrent, $table_filetorrents);

	// Execute bittorrent client
	exec_bit_client($bit_client, $save_path);

	// Edit DB tracker
	edit_db_tracker($dbserver, $dbuser, $dbpass, $dbname, $table_tracker, $ip_peer, $id_torrent, $port, $peer_id);

	exit;

// End Program
/* ----------------------------------------------------------------------------------- */
?>
