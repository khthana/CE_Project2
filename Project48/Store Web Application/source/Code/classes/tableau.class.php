<?
class Tableau
	{
	var $Width = 1;
	var $Html;
	var $Title = '';
	var $BorderColor = "000000";
	var $Border = 0;
	var $CellPadding = 2;
	var $CellSpacing = 0;
	##	$infRows[$curRow][] = [nameCell, colspan, rowspan, txt]
	var $infRows = array();
	var $infCols = array();
	var $nbCols = 0;
	##	Stocke les coordonnées des cellules a tracer
	var $drawData = array();
	
	function Tableau($pdf, $html, $w = '')
		{
		global $pdf;
		if (empty($w) or !isset($w))
			$this->Width = $pdf->wPt - $pdf->lMargin - $pdf->rMargin;
		else
			$this->Width = ($pdf->wPt - $pdf->lMargin - $pdf->rMargin)*$w;
		
		$this->Param = eregi_replace('(<table[^>]*>).*', '\\1', $html);
		eregi("<caption[^>]*>(.*)</caption>", $html, $t);
		if (strlen($t[1]))
			$this->Title = $t[1];
		$this->Html = ereg_replace("(</?table[^>]*>)|(<caption[^>]*>(.*)</caption>)", "", $html);
		$this->GetNfoTable("BorderColor", "#([[:alnum:]]{6})");
		$this->GetNfoTable("CellPadding", "([[:alnum:]]+)");
		$this->GetNfoTable("CellSpacing", "([[:alnum:]]+)");
		$this->GetNfoTable("Width", "([[:alnum:]]+)%");
		$this->GetNfoTable("Border", "([[:alnum:]]+)");
		//$this->Width = ($this->Width > 1)?$this->Width / 100:$this->Width;
		//$this->Width = ($pdf->wPt - $pdf->lMargin - $pdf->rMargin) * $this->Width;
		$this->Width = 500;
		$this->OldLMargin = $pdf->lMargin;
		$this->OldRMargin = $pdf->rMargin;
		##	Tableau centré 
		$this->Margin = ($pdf->wPt - $this->Width) / 2;
		$this->splitTabHTML();
		}
	
	function GetNfoTable($prop, $reg)
		{
		eregi('<table[^>]*'.strtolower($prop).'="'.$reg.'"', $this->Param, $a);
		if (strlen($a[1]))
			$this->$prop = $a[1];
		}
	
	function splitTabHTML()
		{
		$this->Rows = preg_split('/<\/?tr>/U', $this->Html, -1, PREG_SPLIT_NO_EMPTY );
		$DecalRowSpan = array();
		for ($nRows = 0; $nRows < count($this->Rows); $nRows ++)
			{
			$this->Cells = preg_split('/<(\/?td.*)>/U', $this->Rows[$nRows], -1, PREG_SPLIT_DELIM_CAPTURE|PREG_SPLIT_NO_EMPTY );
			$curCell = 1;
			$curRow = chr(65 + $nRows);
			for ($p = 0; $p < count($this->Cells); $p += 3)
				{
				$col = array();
				$row = array();
				$nameCell = $curRow.$curCell;
				if (in_array($nameCell, $DecalRowSpan))
					{
					$curCell ++;
					$nameCell = $curRow.$curCell;
					}
				$this->nbCols = max($this->nbCols, $curCell);
				ereg('.*colspan="([[:digit:]]+)".*', $this->Cells[$p], $col);
				ereg('.*rowspan="([[:digit:]]+)".*', $this->Cells[$p], $row);
				$txtCell = $this->Cells[$p + 1];
				$this->infCols[$curCell]["width"] = max($this->infCols[$curCell]["width"], strlen($txtCell));
				$minWord = $this->MinWidthCell($txtCell);
				if (strlen($minWord) > strlen($this->infCols[$curCell]["minWidth"]))
					$this->infCols[$curCell]["minWidth"] = $minWord;
				if ($col[1] > 1)
					for ($i = 2; $i <= $col[1]; $i ++)
						{
						$curCell ++;
						$nomCell .= "¤".$curRow.$curCell;
						}
				else $col[1] = 1;
				
				if ($row[1] > 1)
					for ($i = 2; $i <= $row[1]; $i ++)
						{
						$nameCell .= "¤".chr(65 + $nRows + $i - 1).$curCell;
						$DecalRowSpan[] = chr(65 + $nRows + $i - 1).$curCell;
						}
				else $row[1] = 1;
				
				$this->infRows[$curRow][] = array($nameCell, $col[1], $row[1], $txtCell);
				$nbCellule = $curCell;
				$curCell ++;
				}
			}
		}
	
	function TestWriteTable($pdfTest)
		{
		$CurrPage = $pdfTest->page;
		$this->WriteTable(&$pdfTest);
		if ($pdfTest->page != $CurrPage)
			return true;
		else return false;
		}
	
	function WriteTable($pdf, $addPage = false)
		{
		if ($addPage)
			$pdf->AddPage();
		$noRow = 0;
		$pdf->SetLeftMargin($this->Margin);
		$pdf->SetRightMargin($this->Margin);
		//$pdf->ParseHTML($pdf->ExplodeHTML(""));
		while (list($ligne, $cellule) = each($this->infRows))
			{
			$noRow ++;
			$this->drawData[$noRow] = array();
			$htCell = 0;
			$yBase = $pdf->GetY();
			$wCurrCell = 0;
			for ($i = 0; $i < count($cellule); $i ++)
				{
				##	Recupere info cellule 
				$nom = $cellule[$i][0];
				$colSpan = $cellule[$i][1];
				$rowSpan = $cellule[$i][2];
				$contenu = $cellule[$i][3];
				$curCell = substr($nom, 1, 1);
				$dimCell = $pdf->GetDimCell("¤", $nom);
				##	Calcul et placement pour dessin cellule 
				$pdf->SetY($yBase);
				//$lMarge = $this->Margin;
				$lMarge = 50;
				for ($col = $curCell - 1; $col >= 1; $col -- )
					$lMarge += $this->infCols[$col]["width"] + $this->CellSpacing;
				
				$pdf->SetLeftMargin($lMarge + $this->CellSpacing);
				$wCurrCell = $this->infCols[$curCell]["width"];
				
				if ($colSpan > 1)
					for($z = 1; $z < $colSpan; $z ++)
						$wCurrCell += $this->infCols[$curCell + $z]["width"] + $this->CellSpacing;
				
				$pdf->SetRightMargin($pdf->wPt - $pdf->lMargin - $wCurrCell);
				$pdf->SetX($pdf->lMargin);
				$this->drawData[$noRow]["cellule"][] = array($pdf->GetX(), $pdf->GetY(), $wCurrCell, $rowSpan);
				
				##	Placement pour ecriture texte 
				$pdf->SetLeftMargin($pdf->lMargin + $this->CellPadding);
				$pdf->SetX($pdf->lMargin);
				
				$pdf->SetRightMargin($pdf->rMargin + $this->CellPadding);
				$pdf->SetY($yBase + $this->CellPadding);
				
				$pdf->ParseHTML($pdf->ExplodeHTML($contenu));
				if ($pdf->GetY() - $yBase > $htCell)
					$htCell = $pdf->GetY() - $yBase;
				if ($rowSpan * $htCelluleParDefaut > $htCell)
					$htCell = $rowSpan * $htCelluleParDefaut;
				$pdf->SetLeftMargin($pdf->lMargin - $this->CellPadding);
				}
			$this->drawData[$noRow]["hauteur"] = $htCell + $pdf->FontSize + $this->CellPadding * 2;
			$pdf->SetY($yBase + $htCell + $pdf->FontSize + $this->CellPadding * 2 + $this->CellSpacing);
			}
		$pdf->SetLeftMargin($this->OldLMargin);
		$pdf->SetRightMargin($this->OldRMargin);
		}
	
	function DrawCell($pdf)
		{
		if ($this->Border < 1) return;
		$pdf->SetLineWidth($this->Border);
		$pdf->SetDrawRGBColor($this->BorderColor);
		##	Dessin des cellules 
		##	Incrementation des lignes ($k) 
		for ($k = 1; $k <= count($this->drawData); $k ++)
			##	Incrementation des cellules ($i) 
			##	[$k]["cellule"] = array(x, y, w, rowSpan)
			for ($i = 0; $i < count($this->drawData[$k]["cellule"]); $i ++)
				{
				$Cell = $this->drawData[$k]["cellule"][$i];
				$htCell = $this->drawData[$k]["hauteur"];
				if ($Cell[3] > 1)
					for ($j = 1; $j < $Cell[3]; $j ++)
						$htCell +=  $this->drawData[$k + 1]["hauteur"] + $this->CellSpacing;
				$pdf->TraceCell($Cell[0], $Cell[1], $Cell[2], $htCell);
				}
		##	Trace le cadre du tableau 
		if ($this->CellSpacing > 0)
			{
			$t = count($this->drawData);
			$c = count($this->drawData[$t]["cellule"]) - 1;
			$pdf->TraceCell(
				$this->Margin, 
				$this->drawData[1]["cellule"][0][1] - $this->CellSpacing, 
				$this->Width + (2 + count($this->infCols) - 1) * $this->CellSpacing, 
				$this->drawData[$t]["cellule"][$c][1] + $this->drawData[$t]["hauteur"] - $this->drawData[1]["cellule"][0][1] + 2 * $this->CellSpacing 
				);
			}
		}
	
	function MinWidthCell($t)
		{
		##	Calcul de la largeur minimale d'une cellule 
		##	Eclatement de la chaine en mot 
		$t = strip_tags($t);
		$l = preg_split("/ /U", $t, -1, PREG_SPLIT_NO_EMPTY );
		for ($i = 0; $i < count($l); $i ++)
			if (strlen($mot) < strlen($l[$i]))
				$mot = $l[$i];
		return $mot;
		}
	
	function WidthCol($pdf)
		{
		for ($i = 1; $i <= count($this->infCols); $i ++)
			{
			$SumCol += $this->infCols[$i]["width"];
			$SumMinCol += $pdf->GetStringWidth($this->infCols[$i]["minWidth"]);
			}
		##	Reste entre la largeur du tableau et les largeurs minimales 
		##	de colonnes a repartir entre les colonnes selon leur poids 
		##	respectifs (nb total de caractères) => part 
		$reste = $this->Width - $SumMinCol;
		for ($i = 1; $i <= count($this->infCols); $i ++)
			{
			$part = $reste / $SumCol * $this->infCols[$i]["width"];
			$this->infCols[$i]["width"] = $pdf->GetStringWidth($this->infCols[$i]["minWidth"]) + $part;
			}
		}
	}
?>