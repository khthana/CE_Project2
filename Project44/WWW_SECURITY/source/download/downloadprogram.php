<?
include "db.php";
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$pname = $HTTP_GET_VARS["pname"];

if ($pname) { 		// มีการคลิกชื่อไฟล์เพื่อดาวน์โหลดเอกสาร

		$query3 = "select user, download from download_program where filename = '$pname'";         // เอาจำนวนครั้งที่ดาวน์โหลดมาจากตาราง
		$data_query3 = mysql_query($query3) or die("ไม่สามารถ select field download ในตาราง download_program ได้");
		$arr3 = mysql_fetch_array($data_query3);
		$u = $arr3[user];
		$total_dl = $arr3[download] + 1;			// นับจำนวนครั้งที่ดาวน์โหลดเพิ่ม 1

		$query4 = "update download_program set download = '$total_dl' where filename = '$pname'";
		$data_query4 = mysql_query($query4) or die("ไม่สามารถ update field download ในตาราง download_program ได้");

		if ($u == "G") {					      
				$path = "../file/filedownload/gteiopojpmr/".$pname;
							//  ใช้ "http://isag02.ce.kmitl.ac.th/file/filedownload/gteiopojpmr/".$pname ไม่ได้
		}
		elseif ($u == "L") {
					$path = "../file/filedownload/lwepfdeiowj/".$pname;
		}

		header("location: $path");
		
}

?>