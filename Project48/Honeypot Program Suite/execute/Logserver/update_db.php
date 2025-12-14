<?
include("dbconnect.php");

$sql="SELECT count(*) FROM sensor";
$dbquery = mysql_db_query($dbname,$sql);
$result = mysql_fetch_array($dbquery);
$sensor = $result[0];

$sid = 1;

while($sid  <= $sensor)
{

$sql1="SELECT max(cid) FROM acid_event WHERE sid=$sid";
$dbquery = mysql_db_query($dbname,$sql1);
$result = mysql_fetch_array($dbquery);
$cid = $result[0];

/* TCP Event update to response_event */

$update_tcp="
INSERT INTO acid_event (sid,cid,signature,sig_class_id,sig_priority,timestamp,
                        ip_src,ip_dst,ip_proto,
                        layer4_sport,layer4_dport,
                        sig_name)
SELECT event.sid as sid, event.cid as cid, signature,sig_class_id,sig_priority, timestamp, 
       ip_src, ip_dst, ip_proto,
       tcp_sport as layer4_sport, tcp_dport as layer4_dport,sig_name
FROM event INNER JOIN signature ON (signature = signature.sig_id)
INNER JOIN iphdr ON (event.sid=iphdr.sid AND event.cid=iphdr.cid) 
LEFT JOIN tcphdr ON (event.sid=tcphdr.sid AND event.cid=tcphdr.cid)
WHERE (event.sid = '$sid' AND event.cid > '$cid') AND ip_proto = 6
";

/* UDP Event update to response_event */

$update_udp="
INSERT INTO acid_event (sid,cid,signature,sig_class_id,sig_priority,timestamp,
                        ip_src,ip_dst,ip_proto,
                        layer4_sport,layer4_dport,
                        sig_name)
SELECT event.sid as sid, event.cid as cid, signature,sig_class_id,sig_priority, timestamp,
       ip_src, ip_dst, ip_proto,
       udp_sport as layer4_sport, udp_dport as layer4_dport,sig_name
FROM event INNER JOIN signature ON (signature = signature.sig_id)
INNER JOIN iphdr ON (event.sid=iphdr.sid AND event.cid=iphdr.cid)
LEFT JOIN udphdr ON (event.sid=udphdr.sid AND event.cid=udphdr.cid)
WHERE (event.sid = '$sid' AND event.cid > '$cid') AND ip_proto = 17
";

/* ICMP Event update to response_event */

$update_icmp="
INSERT INTO acid_event (sid,cid,signature,sig_class_id,sig_priority,timestamp,
                        ip_src,ip_dst,ip_proto,
                        sig_name)
SELECT event.sid as sid, event.cid as cid, signature,sig_class_id,sig_priority, timestamp,
       ip_src, ip_dst, ip_proto,sig_name
FROM event INNER JOIN signature ON (signature = signature.sig_id)
INNER JOIN iphdr ON (event.sid=iphdr.sid AND event.cid=iphdr.cid)
LEFT JOIN icmphdr ON (event.sid=icmphdr.sid AND event.cid=icmphdr.cid)
WHERE (event.sid = '$sid' AND event.cid > '$cid') and ip_proto = 1
";

/* IP Event update to response_event */

$update_ipevent="
INSERT INTO acid_event (sid,cid,signature,sig_class_id,sig_priority,timestamp,
                        ip_src,ip_dst,ip_proto,
                        sig_name)
SELECT event.sid as sid, event.cid as cid, signature,sig_class_id,sig_priority, timestamp,
       ip_src, ip_dst, ip_proto,sig_name
FROM event INNER JOIN signature ON (signature = signature.sig_id)
LEFT JOIN iphdr ON (event.sid=iphdr.sid AND event.cid=iphdr.cid)
WHERE (NOT (ip_proto IN (1,6,17))) AND (NOT (sig_name LIKE 'spp_%')) AND (event.sid = '$sid' AND event.cid > '$cid')
";

/* Event update to response_event */

$update_event="
INSERT INTO acid_event (sid,cid,signature,sig_class_id,sig_priority,timestamp,
                        ip_src,ip_dst,ip_proto,
                        sig_name)
SELECT event.sid as sid, event.cid as cid, signature,sig_class_id,sig_priority, timestamp,
       ip_src, ip_dst, ip_proto,sig_name
FROM event INNER JOIN signature ON (signature = signature.sig_id)
LEFT JOIN iphdr ON (event.sid=iphdr.sid AND event.cid=iphdr.cid)
WHERE (sig_name LIKE 'spp_%') AND 
(event.sid = '$sid' AND event.cid > '$cid')
";

/* Signature update to sran_sig */

$update_sig="
INSERT INTO sran_sig (sid,cid,signature,sig_name,sig_class_name,sig_priority,
                      sig_sid,ref_id,ref_tag,ref_system_id,ref_system_name)
SELECT event.sid as sid,event.cid as cid,signature,sig_name,sig_class_name,
sig_priority,sig_sid,reference.ref_id as ref_id,ref_tag,
reference_system.ref_system_id as ref_system_id,ref_system_name 
FROM event
INNER JOIN signature ON (event.signature=signature.sig_id)
INNER JOIN sig_class ON (signature.sig_class_id=sig_class.sig_class_id) 
INNER JOIN sig_reference ON (signature.sig_id=sig_reference.sig_id) 
INNER JOIN reference ON (sig_reference.ref_id=reference.ref_id)
INNER JOIN reference_system ON (reference.ref_system_id=reference_system.ref_system_id)
WHERE (event.sid = '$sid' AND event.cid > '$cid')
";

/*
echo"<pre>
	$update_tcp<br>
	$update_udp<br>
	$update_icmp<br>
	$update_ipevent<br>
	$update_event<br>
	$update_sig<br>
	Sensor id = $sid";
*/
mysql_select_db("snort", $con);
mysql_query($update_tcp);
mysql_query($update_udp);
mysql_query($update_icmp);
mysql_query($update_ipevent);
mysql_query($update_event);
mysql_query($update_sig);

$sid++;
}

?>
