<?php
class DB {
	var $conn = "";
	var $errdesc = "";
	var $errno = 0;
	var $queryid = 0;
	var $row = array();
	
	########### Connect The Database ###########
	function conn() {
		global $mySql;
		$this->conn = mysql_connect($mySql['host'],$mySql['usql'],$mySql['psql']);
		if(!$this->conn) $this->error("Connect failed");

		if(!mysql_select_db($mySql['database'],$this->conn)) $this->error("Can not use database ".$mySql['database']);
		$this->query('set charset tis620');
	}
	################# Query ##################
	function query($query_string) {
		$this->queryid = mysql_query($query_string,$this->conn);
		if(!$this->queryid) {
		  $this->error("Invalid SQL : ".$query_string);
		}
		return $this->queryid;
	}
	############### First Query #################
	function query_first($query_string) {
		$queryid = $this->query($query_string);
		$returnarray = $this->fetch_array($queryid,$query_string);
		$this->free_result($queryid);
		return $returnarray;
	}
	############## First Cell Query ###############
	function query_first_cell($query_string) {
		$queryid = $this->query($query_string);
		$return = $this->fetch_array($queryid,$query_string);
		$returnarray = $return[0];
		$this->free_result($queryid);
		return $returnarray;
	}
	############### Fetch Array #################
	function fetch_array($queryid=-1,$query_string) {
		if($queryid <> -1) {
			$this->queryid = $queryid;
		}
		if(isset($this->queryid)) {
			$this->row = mysql_fetch_array($this->queryid);
		}  
		else {
			if(!empty($query_string)) {
				$this->error("Invalid query id (".$this->queryid.") on query string : ".$query_string);
			 }
			else {
		        $this->error("Invalid query id : ".$this->queryid);
			}
		 }
		return $this->row;
	}
	############### Push Array #################
	function push_query($query) {
		$result = array();
        if ($p_result = $this->query($query)) {
 	       while($arr = $this->fetch_array($p_result,$query)) {
				@array_push($result,$arr);
		   }
		   $this->free_result($p_result);
        }
        return $result;
	}
	############### Num Rows ##################
	function get_num_rows() {
		return mysql_num_rows($this->queryid);
	}
	############### Free Result ##################
	function free_result($queryid=-1) {
		if($queryid <> -1) {
			$this->queryid = $queryid;
		}
		return mysql_free_result($this->queryid);
	}
	############### Affected Rows ##################
	function get_affected_rows() {
		return mysql_affected_rows();
	}
	############### Close connect ################
	function closeconn() {
		return mysql_close();
	}
	################### Error ###################
	function error($msg) {
		global $webSite;
		$this->errdesc = mysql_error();
		$this->errno = mysql_errno();

		$message = "Database error in ".$webSite['name']."\r\n\r\n";
		$message.= $msg."\r\n";
		$message.= "Error : ".$this->errdesc."\r\n";
		$message.= "Date : ".gmdate("l dS of F Y h:i:s A")."\r\n";
		$message .= "File: http://".$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
		echo "<p><textarea rows='10' cols='60'>".htmlspecialchars($message)."</textarea></p>";
		exit();
	}
}
?>