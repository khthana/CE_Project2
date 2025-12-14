<?
/****************************************************************************
* ThaiPDF v.1.0  modify by Akarawuth Tamrareang
*  http://www.mambohub.com
*
* This script is base on FPDF    http://www.fpdf.org
* Software: FPDF                                                                                            *
* Version:  1.51                                                                                                 *
* Date:     2002/08/03                                                                                     *
* Author:   Olivier PLATHEY                                                                        *
* License:  Freeware                                                                                      *
*                                                                                                                             *
****************************************************************************/


define('FPDF_FONTPATH','includes/font/');
define('POLICE_PAR_DEFAUT', 'angsana');
require ('includes/fpdf.php');
require ('tableau.class.php');

class PDF extends FPDF
	{
	var $Ol = array();
	var $Ul = array();
	var $Classe = array();
	var $FooterH = 15;
	var $nomUtilisateur;
	var $Balise = array();
	var $Classe = array();
	
	//Page header
	function Header()
	{
		$this->line(25,40,578,40);
		$this->ln(15);

	}

	//Page footer
	function Footer()
	{
		global $mosConfig_live_site, $mosConfig_sitename;
		
		$this->SetLeftMargin(25);
		$this->line(25,815,578,815);
		$this->SetFont('angsana','I',10);
		$this->SetY(-25);
		$this->Cell(182,10,$mosConfig_live_site . " - " . $mosConfig_sitename,0,0,'L');
		$this->Cell(182,10,"Powered by Mambo Open Source ÀÒÉÒä·Â â´Â MamboHub.com",0,0,'C');
		$this->Cell(182,10,"Generated: " . date("j F, Y, H:i", time()+$mosConfig_offset*60*60),0,0,'R');
		$this->SetY(-18);
		$this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
	}

	function FrDate()
		{
		$mf = array(1 => "janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre");
		$d = (substr(date("d"), 0, 1) == 0)?substr(date("d"), 1, 1):date("d");
		$d .= ($df == 1)?"er":"";
		$m = (substr(date("m"), 0, 1) == 0)?substr(date("m"), 1, 1):date("m");
		return "$d ".$mf[$m]." ".date("Y");
		}
	
	function ConvertirGrec($t)
		{
		$grec = array("&alpha;" => 97, "&Alpha;" => 65, "&beta;" => 98, "&Beta;" => 66, "&gamma;" => 103, "&Gamma;" => 71, "&delta;" => 100, "&Delta;" => 68, "&epsilon;" => 101, "&Epsilon;" => 69, "&zeta;" => 122, "&Zeta;" => 90, "&eta;" => 104, "&Eta;" => 72, "&theta;" => 113, "&Theta;" => 81, "&iota;" => 105, "&Iota;" => 73, "&kappa;" => 107, "&Kappa;" => 75, "&lambda;" => 108, "&Lambda;" => 76, "&mu;" => 109, "&Mu;" => 77, "&nu;" => 110, "&Nu;" => 78, "&xi;" => 120, "&Xi;" => 88, "&omicron;" => 111, "&Omicron;" => 79, "&pi;" => 112, "&Pi;" => 80, "&rho;" => 114, "&Rho;" => 82, "&sigma;" => 115, "&Sigma;" => 83, "&tau;" => 116, "&Tau;" => 84, "&upsilon;" => 117, "&Upsilon;" => 85, "&phi;" => 106, "&Phi;" => 74, "&chi;" => 99, "&Chi;" => 67, "&psi;" => 121, "&Psi;" => 89, "&omega;" => 119, "&Omega;" => 87);
		while (list($k, $v) = each($grec))
			{
			$t = str_replace($k, "<span class=\"symbol\">".chr($v)."</span>", $t);
			}
		return $t;
		}
	function PrepareTxt($t)
		{
		##	Suppression des commentaires HTML 
		$t = preg_replace("/<!--(.*)-->/U", "", $t);
		$t = preg_replace("/{[A-Z]+}(.*){\/[A-Z]+}/U", "", $t);
		$t = $this->ConvertirGrec($t);
		##	Conversion des caracteres et nettoyage 
		$trans_tbl = get_html_translation_table (HTML_ENTITIES);
		$trans_tbl = array_merge(array_flip($trans_tbl), array("&#946;" => "ß", "&rsquo;" => "'", "&oelig;" => "œ", "&ndash;" => "-", "\t" => '', "\n" => '', "\r" => ''));
		$t = stripslashes(strtr($t, $trans_tbl));
		return $t;
		}
	
	function ExplodeHTML($t)
		{
		$HTML = preg_split('/(<.*>)/U', $t, -1, PREG_SPLIT_DELIM_CAPTURE|PREG_SPLIT_NO_EMPTY );
		return $HTML;
		}
	
	function changeType($t)
		{
		switch($t)
			{
			case "I":
				$this->rangOl = array(1 => "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX", "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI");
			break;
			
			case "i":
				$this->rangOl = array(1 => "i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x", "xi", "xii", "xiii", "xiv", "xv", "xvi", "xvii", "xviii", "xix", "xx", "xxi", "xxii", "xxiii", "xxiv", "xxv", "xxvi");
			break;
			
			case "1":
				$this->rangOl = array(1 => "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26");
			break;
			
			case "A":
				$this->rangOl = array(1 => "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
			break;
			
			case "a":
				$this->rangOl = array(1 => "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
			break;
			
			default:
				$this->rangOl = array(1 => "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26");
			break;
			}
		}
	
		function changeClass($c)
		{
		switch ($c)
			{
			case "link":
				//$this->SetTextColor( 59, 55, 107 );
			break;
			
			case "texte":
				$this->SetTextColor( 0, 0, 0 );
				$this->SetFont(POLICE_PAR_DEFAUT,'',14);   //11
			break;
			
			case "little":
				$this->SetTextColor( 0, 0, 0 );
				$this->SetFont(POLICE_PAR_DEFAUT,'', 9);
			break;
			
			case "intro":
				$this->SetTextColor( 0, 0, 0 );
				$this->SetFont(POLICE_PAR_DEFAUT,'I',16);
			break;
			
			case "title":
				$this->SetTextColor( 59, 55, 107 );
				$this->SetFont(POLICE_PAR_DEFAUT,'B',16);
			break;
			
			case "t_art":
				$this->SetTextColor( 59, 55, 107 );
				$this->SetFont(POLICE_PAR_DEFAUT,'B',13);
			break;
			
			case "tb":
				$this->SetTextColor( 59, 55, 107 );
				$this->SetFont(POLICE_PAR_DEFAUT,'B',11);
			break;
			
			case "tc":
				$this->SetTextColor( 59, 55, 107 );
				$this->SetFont(POLICE_PAR_DEFAUT,'I',11);
			break;
			
			case "NoPage":
				$this->SetTextColor( 255, 255, 255 );
				$this->SetFont(POLICE_PAR_DEFAUT,'B',18);
			break;
			
			case "mention":
				$this->SetTextColor( 255, 255, 255 );
				$this->SetFont("Times",'I',10);
			break;
			
			case "symbol":
				$this->SetFont("Symbol", $this->FontStyle, $this->FontSize);
			break;
			
			case "sommaire":
				$this->SetTextColor( 0, 0, 0 );
				$this->SetFont(POLICE_PAR_DEFAUT,'B',14);   //12
			break;
			}
		}
	
	function changeBalise($b, $c, $t)
		{
		$this->Interligne = $this->FontSize + 2;
		$pos = count($this->Balise);
		if (empty($c) and !strpos($b, "/"))
			$c = $this->Classe[$pos - 1];
		switch($b)
			{
			##	texte souligné
			case 'u':
				if (!strpos($this->FontStyle, "U"))
					{
					$this->Balise[$pos] = 'i';
					$style = $this->FontStyle.'U';
					$this->SetFont($this->FontFamily, $style);
					}
			break;
			##	texte en gras
			case 'b':
				if (!strpos($this->FontStyle, "B"))
					{
					$this->Balise[$pos] = 'b';
					$style = $this->FontStyle.'B';
					$this->SetFont($this->FontFamily, $style);
					}
			break;
			##	texte en italique
			case 'i':
				if (!strpos($this->FontStyle, "I"))
					{
					$this->Balise[$pos] = 'i';
					$style = $this->FontStyle.'I';
					$this->SetFont($this->FontFamily, $style);
					}
			break;
			##	fin texte en gras
			case '/b':
				unset($this->Balise[$pos - 1]);
				$style = str_replace( 'B', '', $this->FontStyle );
				$this->SetFont($this->FontFamily, $style);
			break;
			##	fin texte en italique
			case '/i':
				unset($this->Balise[$pos - 1]);
				$style = str_replace( 'I', '', $this->FontStyle );
				$this->SetFont($this->FontFamily, $style);
			break;
			
			##	fin texte souligné
			case '/u':
				unset($this->Balise[$pos - 1]);
				$style = str_replace( 'U', '', $this->FontStyle );
				$this->SetFont($this->FontFamily, $style);
			break;
			
			case "p":
				$this->Balise[$pos] = 'p';
				$this->Classe[$pos] = $c;
				$this->Ln();
			break;
			
			case "/p":
				unset($this->Balise[$pos - 1]);
				unset($this->Classe[$pos - 1]);
				$c = $this->Classe[$pos - 2];
				$this->Ln();
			break;
			
			case "span":
				$this->Balise[$pos] = 'span';
				$this->Classe[$pos] = $c;
			break;
			
			case "/span":
				unset($this->Balise[$pos - 1]);
				unset($this->Classe[$pos - 1]);
				$c = $this->Classe[$pos - 2];
			break;
			
			case "br":
				$this->Ln();
			break;
			
			case "ul":
				$this->Balise[$pos] = 'ul';
				$this->Classe[$pos] = $c;
				$this->Ln();
				$this->SetLeftMargin($this->lMargin + 20);
				$this->SetRightMargin($this->rMargin + 20);
			break;
			
			case "/ul":
				unset($this->Balise[$pos - 1]);
				unset($this->Classe[$pos - 1]);
				$c = $this->Classe[$pos - 2];
				$this->SetLeftMargin($this->lMargin - 20);
				$this->SetRightMargin($this->rMargin - 20);
				$this->Ln();
			break;
			
			case "ol":
				$this->Balise[$pos] = 'ol';
				$this->Classe[$pos] = $c;
				$this->SetLeftMargin($this->lMargin + 20);
				$this->SetRightMargin($this->rMargin + 20);
				if (!is_array($this->Ol[count($this->Ol)]))
					$this->Ol[count($this->Ol)] = array($t, 1);
				$this->changeType($this->Ol[count($this->Ol) - 1][0]);
			break;
			
			case "/ol":
				unset($this->Balise[$pos - 1]);
				unset($this->Classe[$pos - 1]);
				$c = $this->Classe[$pos - 2];
				$this->SetLeftMargin($this->lMargin - 20);
				$this->SetRightMargin($this->rMargin - 20);
				unset($this->Ol[count($this->Ol) - 1]);
				$this->changeType($this->Ol[count($this->Ol) - 1][0]);
				$this->Ln();
			break;
			
			case "li":
				$this->Balise[$pos] = 'li';
				$this->Classe[$pos] = $c;
				$this->Interligne = $this->FontSize + 4;
				$this->Ln();
				$oldX = $this->GetX();
				$oldY = $this->GetY();
				if ($this->Balise[$pos - 1] == "ol")
					{
					$this->SetX($oldX - $this->GetStringWidth("      "));
					$this->changeType($this->Ol[count($this->Ol) - 1][0]);
					$this->Write($this->Interligne, $this->rangOl[$this->Ol[count($this->Ol) - 1][1]].".  ");
					$this->Ol[count($this->Ol) - 1][1] ++;
					}
				if ($this->Balise[$pos - 1] == "ul")
					{
					$this->SetX($oldX - $this->GetStringWidth("   "));
					$this->Write($this->Interligne, chr(149)."  ");
					}
				$this->SetXY($oldX, $oldY);
			break;
			
			case "/li":
				unset($this->Balise[$pos - 1]);
				unset($this->Classe[$pos - 1]);
				$c = $this->Classe[$pos - 2];
			break;
			
			case 'sup':
				$this->Balise[$pos] = 'sup';
				$this->OldFontSize = $this->FontSizePt;
				$this->SetFontSize($this->OldFontSize - 2);
				$this->SetXY($this->GetX(),$this->GetY() - 2);
			break;
			
			case '/sup':
				unset($this->Balise[$pos - 1]);
				$this->SetXY($this->GetX(),$this->GetY() + 2);
				$this->SetFontSize($this->OldFontSize);
			break;
			
			case 'sub':
				$this->Balise[$pos] = 'sub';
				$this->OldFontSize = $this->FontSizePt;
				$this->OldY = $this->GetY();
				$this->SetFontSize($this->FontSizePt - 2);
				$this->SetXY($this->GetX(),$this->GetY() + $this->OldFontSize / 3);
			break;
			
			case '/sub':
				unset($this->Balise[$pos - 1]);
				$this->SetXY($this->GetX(), $this->OldY);
				$this->SetFontSize($this->OldFontSize);
			break;
			
			case "newPage":
				$this->AddPage();
			break;
			}
		$this->changeClass($c);
		}
	
	function ParseTable($t)
		{
		$this->Ln();
		$pdfTest = $this;
		$tab = new Tableau(&$pdfTest, $t);
		$tab->WidthCol(&$pdfTest);
		$addPage = $tab->TestWriteTable(&$pdfTest);
		
		$tab = new Tableau(&$this, $t);
		$tab->WidthCol(&$this);
		$tab->WriteTable(&$this, $addPage);
		$tab->DrawCell(&$this);
		}
	
	function WriteLink($href, $t)
		{
		$pos = count($this->Balise);
		$OldClass = $this->Classe[$pos - 1];
		$this->changeClass("link");
		$href = eregi_replace('<a[^>]* href="([^"]+)"[^>]*>', "\\1", $href);
		$this->Write($this->FontSizePt+2, $t, $href);
		$this->changeClass($OldClass);
		}
	
	function AddImage($t)
		{
		global $CFG;
		eregi('<img src="([^".]+)\.([^"]{3})"[^>]*>', $t, $i);
		$ext = strtolower($i[2]);
		$f = $CFG->PDFDocRoot.$i[1].".".$ext;
		if ($ext == "jpg" or $ext == "png")
			{
			eregi('alt="([^"]+)"', $t, $z);
			$info = getimagesize($f);
			$this->Ln();
			if ($info[0] > $this->wPt)
				$info[0] = $this->wPt - $this->lMargin - $this->rMargin;
			$x = $this->GetX();
			$this->SetX(($this->wPt - $info[0]) / 2);
			if ($this->GetY() + $info[1] > $this->hPt)
				$this->AddPage();
			if (strlen($z[1]) > 0)
				{
				$this->Write($this->FontSizePt+2, $z[1]);
				$this->Ln($this->FontSizePt+2);
				}
			$y = $this->GetY();
			$this->Image($f, ($this->wPt - $info[0]) / 2, $y, $info[0], $info[1]);
			$this->SetXY($x, $y + $info[1] + $this->FontSizePt+2);
			}
		else
			echo $i[1].".".$i[2]." $ext : Format d'image non supporté";
		}
	
	function ParseHTML($HTML)
		{
		for ($i = 0; $i < count($HTML); $i ++)
			{
			if (ereg("<[^>]*>", $HTML[$i]))
				{
				##	Traitement des tableaux 
				if (eregi("<table[^>]*>", $HTML[$i]))
					{
					$t = '';
					while (!eregi("</table[^>]*>", $HTML[$i]))
						{
						$t .= $HTML[$i];
						$i ++;
						}
					$this->ParseTable($t);
					}
				##	Traitement des liens 
				else if (eregi('<a[^>]* href="[^"]+"[^>]*>', $HTML[$i]))
					{
					$this->WriteLink($HTML[$i], $HTML[$i + 1]);
					$i += 3;
					}
				else if (eregi('<img src="[^"]+"[^>]*>', $HTML[$i]))
					{
					$this->AddImage($HTML[$i]);
					}
				else
					{
					$type = array();
					$classe = array();
					$balise = array();
					##	$align = array();
					##	eregi('<[^>]*align="([^"]*)"[^>]*>', $HTML[$i], $align);
					eregi('<(/?[a-zA-Z]*)[^>]*>', $HTML[$i], $balise);
					eregi('<[^>]*type="([^"]*)"[^>]*>', $HTML[$i], $type);
					eregi('<[^>]*class="([^"]*)"[^>]*>', $HTML[$i], $classe);
					$this->changeBalise($balise[1], $classe[1], $type[1]);
					}
				}
			else
				$this->Write($this->FontSizePt+2, $HTML[$i]);
			}
		}
	function GetDimCell($d, $coordCell)
		{
		$l = split($d, $coordCell);
		$dimCell = array("lg" => 1, "ht" => 1);
		for ($i = 0; $i < count($l) - 1; $i ++)
			{
			if (substr($l[$i], 0, 1) == substr($l[$i + 1], 0, 1))
				$dimCell["lg"] ++;
			if (substr($l[$i], 1, 1) == substr($l[$i + 1], 1, 1))
				$dimCell["ht"] ++;
			}
		return $dimCell;
		}
	
	function TraceCell($x, $y, $w, $h)
		{
		$this->Line($x, $y, $x + $w, $y);
		$this->Line($x + $w, $y, $x + $w, $y + $h);
		$this->Line($x + $w, $y + $h, $x, $y + $h);
		$this->Line($x, $y + $h, $x, $y);
		}
	
	function SetDrawRGBColor($rgb)
		{
		$r = hexdec(substr($rgb, 0, 2));
		$g = hexdec(substr($rgb, 2, 2));
		$b = hexdec(substr($rgb, 4, 2));
		$this->SetDrawColor($r,	$g, $b);
		}
	}
?>