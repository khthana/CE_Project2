<?php
function ascii_unicode_thai($text_input) {
	$text_output = "";
	for ($i=0;$i<strlen($text_input);$i++) {
		if (ord($text_input[$i])<=126)
		$text_output .= $text_input[$i];
	else
		$text_output .= "&#".(ord($text_input[$i])-161+3585).";";
	}
	return $text_output;
}
?>