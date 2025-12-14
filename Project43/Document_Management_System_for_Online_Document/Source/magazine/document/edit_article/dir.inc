<?
$d = dir("$location");
//echo "Handle: ".$d->handle."<br>\n";
//echo "Path: ".$d->path."<br>\n";
while($entry=$d->read()) {
  
	$ext = strrchr($entry,'.'); 			
	if (($ext == ".txt")or($ext == ".html"))
	{
		//	echo "<a l$entry". "<br>\n";
		echo "<a href = ../../../document/edit_article/edit_article.php?art_id=$art_id&file_name=$entry> $entry </a><br>\n";
	}
}
$d->close();
      
?>