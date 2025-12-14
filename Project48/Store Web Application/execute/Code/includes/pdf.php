<?php
// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Direct Access to this location is not allowed.' );

global $mosConfig_offset, $mosConfig_hideAuthor, $mosConfig_hideModifyDate, $mosConfig_hideCreateDate, $mosConfig_live_site;

$safe="0";
if (get_php_setting('safe_mode') == 'ON') {
	$safe="1";
}

if ($safe == "0") {

	if (@file_exists( "/usr/bin/htmldoc" )) {
		$id = strtolower( trim( mosGetParam( $_REQUEST, 'id',1 ) ) );
		$article = $mosConfig_live_site . '/index2.php?option=content&task=view&pop=1&page=0&hide_js=1&pdf=1&id=' . $id;
		header( "Content-Type: application/pdf" );
		header( "Content-Disposition: inline; filename=\"pdf-mambo.pdf\"" );
		flush();
		//following line for Linux only - windows may need the path as well...
		passthru( "/usr/bin/htmldoc --no-localfiles --no-compression -t pdf14 --jpeg --webpage --header t.D --footer ./. --size letter --left 0.5in '$article'" );
	} else {
		dofreePDF ($database);
	}
} else {

	dofreePDF ($database);
}

function dofreePDF ($database) {
	global $mosConfig_live_site, $mosConfig_sitename, $mosConfig_offset, $mosConfig_hideCreateDate, $mosConfig_hideAuthor, $mosConfig_hideModifyDate;

	$id = strtolower( trim( mosGetParam( $_REQUEST, 'id',1 ) ) );
	$row = new mosContent( $database );
	$row->load($id);
	//Find Author Name
	$users_rows = new mosUser( $database );
	$users_rows->load($row->created_by);
	$row->author = $users_rows->name;
	$row->usertype = $users_rows->usertype;
	
	//Gets the images
	if (trim( $row->images )) {
		$row->images = explode( "\n", $row->images );
	} else {
		$row->images = array();
	}

	$images2 = array();
	foreach($row->images as $file) {
		$temp = explode( '|', $file );
		$images2[] = $temp[0];
	}

	//Gets the text
	$row->introtext = RemoveTags($row->introtext);
	$row->fulltext = RemoveTags($row->fulltext);
	$g = $row->introtext;
	$h = $row->fulltext;
	$html = $g."<br>".$h;
	
	//Replace the tag {mosimages}
	for ($j=0, $m=count( $images2 ); $j < $m; $j++) {
		$imagepos = strpos($html,"{mosimage}");
		if($imagepos>=0) {
			$part1 = substr($html, 0, ($imagepos + 9));
			$part2 = substr($html, $imagepos + 9);
			$html = $part1.$j.$part2;
		}
	}
	
	//Place images
	for ($j=0, $m=count( $images2 ); $j < $m; $j++) {
		$html = str_replace("{mosimage$j}", "<img src=\"images/stories/".$images2[$j]."\">", $html);
		//print $j." - ".$images2[$j];
	}

	//Treat the images that directly in the HTML
	preg_match_all('/<IMG.+\>/', $html, $htmlimages);
	for($zzz=0; $zzz < count($htmlimages); $zzz++) {
		preg_match('/src=\"http:.+\"/', $htmlimages[0][0], $imagehtml);
		$html = str_replace($htmlimages[0][0], '<IMG '.$imagehtml[0].'>', $html);
	}
	
//print htmlspecialchars($html);
	require("classes/html2pdf.class.php");
	$pdf = new PDF('P','pt','A4');
	$pdf->AddFont('angsana','I','angsanai.php');
     $pdf->AddFont('angsana','B','angsanab.php');
     $pdf->AddFont('angsana','','angsana.php');
	$pdf->Open();
	$pdf->AliasNbPages();
	$pdf->SetLeftMargin(25);
	$pdf->AddPage();

	//Title
	$pdf->changeClass("title");
	$f = "<input type=\"hidden\" class=\"texte\">" . $f;
	$f = $row->title."<br><br>";
	$f = $pdf->PrepareTxt($f);
	$f = $pdf->ExplodeHTML($f);
	$pdf->ParseHTML($f);

	//Author and Date information
	$mod_date = null; $create_date = null;
	if (intval( $row->modified ) <> 0) {
		$mod_date = mosFormatDate($row->modified);
	}
	if (intval( $row->created ) <> 0) {
		$create_date = mosFormatDate($row->created);
	}

	if ($mosConfig_hideCreateDate == "0") {
		$txt2 .= "(".$create_date.") - ";
	}

	if ($mosConfig_hideAuthor == "0") {
		if ($row->author != "" && $mosConfig_hideAuthor == "0") {
			if ($row->usertype == 'administrator' || $row->usertype == 'superadministrator') {
				$txt2 .=  _WRITTEN_BY." ".($row->created_by_alias ? $row->created_by_alias : $row->author);
			} else {
				$txt2 .=  _AUTHOR_BY." ".($row->created_by_alias ? $row->created_by_alias : $row->author);
			}
		}
	}

	if ($mosConfig_hideModifyDate == "0") {
		$txt2 .= " - " . _LAST_UPDATED." (".$mod_date.") ";
	}
	$pdf->SetY(60);
	$pdf->SetFont('angsana','I',12);
	$pdf->Cell(182,10,$txt2,0,0,'L');
	$pdf->ln(20);

	//Body
	//$h = $row->fulltext;
	$html = "<input type=\"hidden\" class=\"texte\">" . $html;
	$html = $pdf->PrepareTxt($html);
	$html = $pdf->ExplodeHTML($html);
	$pdf->ParseHTML($html);
	
	//Output the file
	$pdf->Output();
	
}

function get_php_setting($val) {
	$r =  (ini_get($val) == '1' ? 1 : 0);
	return $r ? 'ON' : 'OFF';
}

function RemoveTags($html) {
	$html = str_replace("<B>", "<b>", $html);
	$html = str_replace("</B>", "</b>", $html);
	$html = str_replace("<U>", "<u>", $html);
	$html = str_replace("</U>", "</u>", $html);
	$html = str_replace("<I>", "<i>", $html);
	$html = str_replace("</I>", "</i>", $html);
	$html = str_replace("<P>", "<p>", $html);
	$html = str_replace("</P>", "</p>", $html);
	$html = str_replace("<UL>", "<ul>", $html);
	$html = str_replace("</UL>", "</ul>", $html);
	$html = str_replace("<OL>", "<ol>", $html);
	$html = str_replace("</OL>", "</ol>", $html);
	$html = str_replace("<LI>", "<li>", $html);
	$html = str_replace("</LI>", "</li>", $html);
	$html = str_replace("<SPAN>", "<span>", $html);
	$html = str_replace("</SPAN>", "</span>", $html);
	$html = str_replace("<SUP>", "<sup>", $html);
	$html = str_replace("</SUP>", "</sup>", $html);
	$html = str_replace("<SUB>", "<sub>", $html);
	$html = str_replace("</SUB>", "</sub>", $html);
	$html = str_replace("<BR>", "<br>", $html);
	$html = str_replace("<A ", "<a ", $html);
	$html = str_replace("</A>", "</a>", $html);
	$html = str_replace("<STRONG>", "<b>", $html);
	$html = str_replace("</STRONG>", "</b>", $html);
	$html = str_replace("<strong>", "<b>", $html);
	$html = str_replace("</strong>", "</b>", $html);
	$html = str_replace("<TBODY>", "", $html);
	$html = str_replace("</TBODY>", "", $html);
	$html = str_replace("<tbody>", "", $html);
	$html = str_replace("</tbody>", "", $html);
	$html = str_replace("<DIV ", "<p ", $html);
	$html = str_replace("<DIV>", "<p>", $html);
	$html = str_replace("</DIV>", "</p>", $html);
	$html = str_replace("<div ", "<p ", $html);
	$html = str_replace("</div>", "</p>", $html);
	$html = str_replace("<TABLE ", "<table ", $html);
	$html = str_replace("<TABLE>", "<table>", $html);
	$html = str_replace("</TABLE>", "</table>", $html);
	$html = str_replace("<TR>", "<tr>", $html);
	$html = str_replace("</TR>", "</tr>", $html);
	$html = str_replace("<TD ", "<td ", $html);
	$html = str_replace("<TD>", "<td>", $html);
	$html = str_replace("</TD>", "</td>", $html);
	$html = str_replace("<FONT ", "<font ", $html);
	$html = str_replace("</FONT>", "</font>", $html);
	$html = str_replace("cellSpacing", "cellspacing", $html);
	$html = str_replace("cellPadding", "cellpadding", $html);
	$html = str_replace("&#8364;", "€", $html);
	$html = str_replace("<li>", "</li><li>", $html);
	$html = str_replace("<p>&nbsp;</p>", "", $html);
	
	##	Fix the lists
	$continue=true;
	while($continue==true) {
		$iPos = strpos($html, "<ul>");

		if(substr($html, ($iPos+6), 5)!= "</li>") {
			$continue==false;
			break;
		}
		
		$html2 .= substr($html, 0, $iPos+4);
		$html = substr($html, ($iPos+11));
	}

	$html2 .= $html;
	$html = $html2;

	##	Remove links from the HTML
	$continue=true;
	while($continue==true) {
		$iPos = strpos($html, "<a ");

		if($iPos===false) {
			$continue = false;
			break;
		}

		$iPosEnd = strpos($html, "</a>");
		
		$temp = "";
		for ($i = $iPos; $i <= strlen($html); $i++) {
			$temp .= substr($html, $i, 1);
			if(substr($html, $i, 1)==">") {
				$html = str_replace($temp, "", $html);
				break;
			}
		}
	}

	return $html;
}
?>