
<?
		session_start();
		$result=session_unregister("username");
		session_destroy();
				if($result){
						echo "ออกจากระบบอย่างสมบูร์";
				}
				else{
						echo "ไม่สามารถออกจากระบบได้ กรุณาออกจากระบบอีกครั้ง";
				}
?>