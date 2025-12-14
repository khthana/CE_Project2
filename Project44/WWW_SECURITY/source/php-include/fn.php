<?
function getsize($filename)
{
	$size = filesize($filename); 
	$exp = 1; 
	while($size >= pow(1024, $exp)) 
		{ 
			$exp++; 
		} 
	$ext = array(" B", " KB", " MB", " GB", " TB"); 
	$summary = round(($size * 100) / pow(1024, ($exp - 1))) / 100; 
	$strsize = sprintf("%.2f%s", $summary, $ext[$exp - 1]);
	return $strsize;
}

?>