<?php

// Declare function //
/* ----------------------------------------------------------------------------------- */
// Download Function
function download($file_source, $file_target) {
       $rh = fopen($file_source, 'rb');
       $wh = fopen($file_target, 'wb');
       if ($rh===false || $wh===false) {
		   // error reading or opening file
           return false;
       }
       while (!feof($rh)) {
           if (fwrite($wh, fread($rh, 1024)) === FALSE) {
                   // 'Download error: Cannot write to file ('.$file_target.')';
                   return false;
               }
       }
       fclose($rh);
       fclose($wh);
       // No error
       return true;
}

// End Download Function
/* ----------------------------------------------------------------------------------- */
// Return File Function
function return_file($filename, $file_path){
	header("Content-type: application/force-download");
	header("Content-Disposition: attachment; filename=\"".basename($filename)."\";");
	readfile("$file_path");
}

// End Return File Function
/* ----------------------------------------------------------------------------------- */
// Check Hash Info Function
function check_hashinfo($file_path, $dbserver, $dbuser, $dbpass, $dbname, $table_filetorrents){
	// Open .torrent file and read to buffer
	$fh = fopen($file_path, 'r'); 
	if (!$fh)die; 
	$stream = fread($fh,204800); 
	fclose($fh);
	
	// Decode the contents of the file with the bdecode() function 
	$torrent = bdecode($stream);

	$info_hash = pack("H*", sha1(bencode($torrent["info"])));

	// Connect database
	$conn = mysql_connect($dbserver, $dbuser, $dbpass) or die("Cannot connect DB server for check info hash");
	$db = mysql_select_db($dbname, $conn) or die("Cannot select DB for check info hash");
	
	$SQL = "SELECT * FROM ".$table_filetorrents." WHERE 'info_hash'=\"$info_hash\" ";
	$result = mysql_query($SQL, $conn) or die("Cannot query for check info hash");

	if(mysql_num_rows($result) == 0){
		mysql_close($conn);	
		return null;
	}else{
		$row = mysql_fetch_array($result);
		$file_path = $result['file_path'];
	}
	mysql_close($conn);	

	return $file_path;
}

// End Check Hash Info Function
/* ----------------------------------------------------------------------------------- */
// Modify Torrent Function
function modify_torrent($file_path, $url_tracker){
	if(file_exists($file_path)){
		$fp = fopen($file_path,'r'); 
		if (!$fp) 
			die("Error opening connection."); 
		$stream = fread($fp,204800); 
		fclose($fp);

		// Decode the contents of the file with the bdecode() function 
		$torrent = bdecode($stream);

		// Change announce tracker
		$torrent["announce"] = $url_tracker;

		// If the torrent file has announce-list, set announce-list to empty("")
		if($torrent["announce-list"] != null){
			$count1 = 0;
			$count2 = 0;
			while($torrent["announce-list"][$count1][$count2] != null){
				while($torrent["announce-list"][$count1][$count2] != null){
					$torrent["announce-list"][$count1][$count2] = "";
					$count2++;
				}
				$count1++;
				$count2 = 0;
			}	
		}

		// Encode the contents of the file with the bencode() function
		$stream = bencode($torrent);

		$fp = fopen($file_path,'w+'); 
		if (!$fp) 
			die("Error opening connection."); 
		fwrite($fp, $stream); 
		fclose($fp);

		return true;
	}
	else
		return false;
}

// End Modify Torrent Function
/* ----------------------------------------------------------------------------------- */
// Add Record To Database Function
function add_db($file_path, $dbserver, $dbuser, $dbpass, $dbname, $table_torrent, $table_filetorrents){
	// Open .torrent file and read to buffer
	$fh = fopen($file_path, 'r'); 
	if (!$fh)die("Cannot open $file_path"); 
	$stream = fread($fh,204800); 
	fclose($fh);	
	
	// Decode the contents of the file with the bdecode() function 
	$torrent = bdecode($stream);

	// Connect database	
	$conn = mysql_connect($dbserver, $dbuser, $dbpass) or die("Cannot connect DBServer");
	$db = mysql_select_db($dbname, $conn) or die("Cannot select DB");

	$result = mysql_query("SELECT * FROM $table_torrent", $conn) or die;
	
	while($row = mysql_fetch_array($result))
	{
		$torrent_id = $row["torrent_id"];
		$info_hash = $row["info_hash"];
		$post_id = $row["post_id"];
		$poster_id = $row["poster_id"];
		$topic_id = $row["topic_id"];
		$attach_id = $row["attach_id"];
		$size = $row["size"];
		$piece_length = $row["piece_length"];
		$reg_time = $row["reg_time"];
		$complete_count = $row["complete_count"];
		$seeder_last_seen = $row["seeder_last_seen"];
		$last_seeder_uid = $row["last_seeder_uid"];
	}

	$count = 0;
	$length = 0;
	if($torrent["info"]["length"] != null){
		$length = $torrent["info"]["length"];
	}else{
		while($torrent["info"]["files"][$count]["length"] != null){
			$length += $torrent["info"]["files"][$count]["length"];
			$count++;
		}
	}

	$torrent_id++;
	$info_hash = pack("H*", sha1(bencode($torrent["info"])));
	$post_id += 1;
	$poster_id = 4;
	$topic_id += 1;
	$attach_id += 1;
	$size = $length;
	$piece_length = $torrent["info"]["piece length"];
	$reg_time = date(U);
	$complete_count = 0 ;
	$seeder_last_seen = 0;
	$last_seeder_uid = 0;

	$SQL = "insert into ".$table_torrent." (torrent_id, info_hash, post_id, poster_id, topic_id, attach_id, size, piece_length, reg_time, complete_count, seeder_last_seen, last_seeder_uid) values('$torrent_id', \"$info_hash\", '$post_id', '$poster_id', '$topic_id', '$attach_id', '$size', '$piece_length', '$reg_time', '$complete_count', '$seeder_last_seen', '$last_seeder_uid' ) "; 
	$result = mysql_query($SQL, $conn) or die("Cannot insert into $table_torrent ".mysql_error()."LINE".__LINE__);

	$SQL = "insert into ".$table_filetorrents." (torrent_id, info_hash, file_path) values('$torrent_id', \"$info_hash\", \"$file_path\") ";
	$result = mysql_query($SQL, $conn) or die("Cannot insert into $table_filetorrent  ".mysql_error()."LINE".__LINE__);

	mysql_close($conn);

	return $torrent_id;
}

// End Add Record To Database Function
/* ----------------------------------------------------------------------------------- */

// Execute Bittorrent Client Function
function exec_bit_client($bit_client, $original_file){
	$command = "sudo -u root ".$bit_client." ".$original_file;

	$output = shell_exec($command);

	

}



// End Execute Bittorrent Client Function
/* ----------------------------------------------------------------------------------- */

// Edit Database Tracker Function
function edit_db_tracker($dbserver, $dbuser, $dbpass, $dbname, $table_tracker, $ip_peer, $id_torrent, $port, $peer_id){
	$ip = convert_ip2hex($ip_peer);	
	$complete_percent = 100;
	$uploaded = 0;
	$download = 0;
	$seeder = 1;
	$user_id = -1;
	$last_stored_up = 0;
	$last_stored_down = 0;
	$stat_last_updated = 0;
	$speed_up = 0;
	$speed_down = 0;
	$timestamp = gmdate("Y")+1;
	$update_time = date(U)+10000000;
	$expire_time = date(U)+10000000;


	// Connect database
	$conn = mysql_connect($dbserver, $dbuser, $dbpass) or die("Cannot connect db server for edit_db_tracker");
	$db = mysql_select_db($dbname, $conn) or die("Cannot select db for edit_db_tracker");

	$SQL = "insert into ".$table_tracker."( torrent_id, peer_id, user_id, ip, port, uploaded, downloaded, complete_percent, seeder, last_stored_up, last_stored_down, stat_last_updated, speed_up, speed_down, update_time, expire_time) values( '$id_torrent', '$peer_id', '$user_id', '$ip', '$port', '$uploaded', '$downloaded', '$complete_percent', '$seeder', '$last_stored_up', '$last_stored_down', '$stat_last_updated', '$speed_up', '$speed_down', '$update_time', '$expire_time')";
	$result = mysql_query($SQL, $conn) or die("Cannot update for edit_db_tracker");

	mysql_close($conn);

}

// End Edit Database Tracker Function
/* ----------------------------------------------------------------------------------- */

// Convert DEC IP to HEX IP Function
function convert_ip2hex($ip_peer){
	$count = strlen($ip_peer);

	$i = 0;
	$tmp = "";

	$dot = ".";


	for($i=0; $i<$count; $i++){
		
		if($ip_peer[$i] == $dot){
			
			$tmp = dechex($tmp);
			if(strlen($tmp) == 1){
				
				$tmp = "0".$tmp;

			}
			$hex_ip_tracker .= $tmp;
			$tmp = "";
		}else{
			$tmp .= $ip_peer[$i];
		}

	}
	$hex_ip_tracker .= dechex($tmp);

	return $hex_ip_tracker;
}

// End Convert DEC IP to HEX IP Function
/* ----------------------------------------------------------------------------------- */

?>
