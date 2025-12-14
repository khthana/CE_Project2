
<?
		session_start();
		$result=session_unregister("username");
		session_destroy();
				if($result){
						echo "ออกจากระบบอย่างสมบูร์";
						echo "<meta http-equiv=refresh content=2;URL=index.php>";

				}
				else{
						echo "ไม่สามารถออกจากระบบได้ กรุณาออกจากระบบอีกครั้ง";
				}
?>