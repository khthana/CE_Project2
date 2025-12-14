<?php
	#Search Form
	print "<img src='images/domain_search.jpg' width='190px' height='24px'><br>
			<form name='seach' method='get' action='search.php?page=1' style='text-align:left; margin:5px;'>
			<input type='hidden' name='page' value='1'>
			<div style='width:95%; text-align:center; margin:3px;'>
				<input name='tsearch' type='text' id='search' size='22' maxlength='50'>
			</div><strong>Scope :</strong>
			<input name='scoperadio' type='radio' value='local' checked> Local&nbsp;&nbsp;&nbsp;&nbsp;
            <input name='scoperadio' type='radio' value='global'>Global<br>
			<strong>Option : </strong>
			<input name='checktopic' type='checkbox' disabled id='checktopic' value='yes' checked>Topic
			<input name='checkmsg' type='checkbox' id='checkmsg' value='yes'>Content<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name='checkcomment' type='checkbox' id='checkcomment' value='yes'>Comment
			<div style='width:100%; text-align:right; margin:0px; margin-top:5px;'>
				<a  onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('submit2','','images/domain_searchbt1.jpg',1)\">
				<input name='searchbt' type='image' value='submit' src='images/domain_searchbt.jpg'  width='55' height='18'>
			</div></form>";
?>