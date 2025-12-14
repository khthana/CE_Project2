<?
function format_output($output) {	
	//Tag ที่ใช้ได้  [b]...[/b]   [i]...[/i]   [u]...[/u]  [link="..."]...[/link] [ul]...[ul] [li] [table]..[/table] [r]..[/r]  [c]..[/c] 
	//$output = trim(htmlspecialchars(stripslashes($output)));

	$output = preg_replace('#\[b](.+?)\[/b]#is', '<b>$1</b>', $output);
	$output = preg_replace('#\[i](.+?)\[/i]#is', '<i>$1</i>', $output);
	$output = preg_replace('#\[u](.+?)\[/u]#is', '<u>$1</u>', $output);
	$output = preg_replace('#\[ce](.+?)\[/ce]#is', '<center>$1</center>', $output);

	$output = str_replace('[link=&quot;javascript', '[link=&quot; javascript', $output);
	$output = preg_replace('#\[url=([[:graph:]]+)\](.+?)\[/url]#is', '<a href="\\1" target="_new_">$2</a>', $output);
	
	//$output = preg_replace('#\[ul](.+?)\[/ul]#is', '<ul>$1</ul>', $output);
	//$output = eregi_replace('\[li]','<li>',$output);
	
	$output = preg_replace('#\[table](.+?)\[/table]#is', '<table cellpadding=1 cellspacing=1 border=0>$1</table>', $output);
	$output = preg_replace('#\[r](.+?)\[/r]#is', '<tr>$1</tr>', $output);
	$output = preg_replace('#\[c](.+?)\[/c]#is', '<td>$1</td>', $output);

	$output = preg_replace('#\[pic=&quot;([[:graph:]]+)&quot;\]#is', '<img src="../pic/temp/\\1">', $output);

	$output = preg_replace('#\[list=1](.+?)\[/list=1]#is', '<ol type=1>$1</ol>', $output);
	$output = preg_replace('#\[list=a](.+?)\[/list=a]#is', '<ol type=a>$1</ol>', $output);
	$output = preg_replace('#\[list](.+?)\[/list]#is', '<ul>$1</ul>', $output);
	$output = eregi_replace('\[\*]','<li>',$output);


$output = str_replace(':)', '<img src="../webboard/smile_files/smile.gif">', $output);
$output = str_replace(':o', '<img src="../webboard/smile_files/redface.gif">', $output);
$output = str_replace(';)', '<img src="../webboard/smile_files/wink.gif">', $output);
$output = str_replace(':cool:', '<img src="../webboard/smile_files/cool.gif">', $output);
$output = str_replace(':mad:', '<img src="../webboard/smile_files/mad.gif">', $output);
$output = str_replace(':confused:', '<img src="../webboard/smile_files/confused.gif">', $output);
$output = str_replace(':devil:', '<img src="../webboard/smile_files/devil.gif">', $output);
$output = str_replace(':eek2:', '<img src="../webboard/smile_files/eek2.gif">', $output);
$output = str_replace(':goof:', '<img src="../webboard/smile_files/goof.gif">', $output);
$output = str_replace(':kaioken:', '<img src="../webboard/smile_files/kaioken.gif">', $output);

$output = str_replace(':kiss:', '<img src="../webboard/smile_files/kiss.gif">', $output);
$output = str_replace(':redhot:', '<img src="../webboard/smile_files/redhot.gif">', $output);
$output = str_replace(':smash:', '<img src="../webboard/smile_files/smash.gif">', $output);
$output = str_replace(':teleport:', '<img src="../webboard/smile_files/teleport.gif">', $output);
$output = str_replace(':yawn:', '<img src="../webboard/smile_files/yawnb.gif">', $output);
$output = str_replace(':heart:', '<img src="../webboard/smile_files/heart.gif">', $output);
$output = str_replace(':cold:', '<img src="../webboard/smile_files/cold.gif">', $output);
$output = str_replace(':flake:', '<img src="../webboard/smile_files/flake.gif">', $output);
$output = str_replace(':frosty:', '<img src="../webboard/smile_files/frosty.gif">', $output);
$output = str_replace(':witch:', '<img src="../webboard/smile_files/heks.gif">', $output);

$output = str_replace(':alien:', '<img src="../webboard/smile_files/alien.gif">', $output);
$output = str_replace(':apresent:', '<img src="../webboard/smile_files/present.gif">', $output);
$output = str_replace(':jack1:', '<img src="../webboard/smile_files/pumpkin.gif">', $output);
$output = str_replace(':santa:', '<img src="../webboard/smile_files/santasmile.gif">', $output);
$output = str_replace(':xeye:', '<img src="../webboard/smile_files/xeye.gif">', $output);
$output = str_replace(':jack2:', '<img src="../webboard/smile_files/pumpkin2.gif">', $output);
$output = str_replace(':bday:', '<img src="../webboard/smile_files/bday.gif">', $output);
$output = str_replace(':angel2:', '<img src="../webboard/smile_files/angel1.gif">', $output);
$output = str_replace(':angel4:', '<img src="../webboard/smile_files/angel3.gif">', $output);
$output = str_replace(':angel6:', '<img src="../webboard/smile_files/angelfly.gif">', $output);

$output = str_replace(':zzz:', '<img src="../webboard/smile_files/as-sleep.gif">', $output);
$output = str_replace(':apart:', '<img src="../webboard/smile_files/bighug.gif">', $output);
$output = str_replace(':wall:', '<img src="../webboard/smile_files/brickwall.gif">', $output);
$output = str_replace(':bubbly:', '<img src="../webboard/smile_files/bubbly.gif">', $output);
$output = str_replace(':cheer:', '<img src="../webboard/smile_files/cheer.gif">', $output);
$output = str_replace(':clown:', '<img src="../webboard/smile_files/clown.gif">', $output);
$output = str_replace(':cool2:', '<img src="../webboard/smile_files/cool_2.gif">', $output);
$output = str_replace(':wacko:', '<img src="../webboard/smile_files/crazy.gif">', $output);
$output = str_replace(':daisy:', '<img src="../webboard/smile_files/daisy.gif">', $output);
$output = str_replace(':sick:', '<img src="../webboard/smile_files/dead.gif">', $output);

$output = str_replace(':dollar:', '<img src="../webboard/smile_files/dollar.gif">', $output);
$output = str_replace(':elf:', '<img src="../webboard/smile_files/elf.gif">', $output);
$output = str_replace(':flower:', '<img src="../webboard/smile_files/flower.gif">', $output);
$output = str_replace(':looko:', '<img src="../webboard/smile_files/headshake.gif">', $output);
$output = str_replace(':kitty2:', '<img src="../webboard/smile_files/hello.gif">', $output);
  $output = str_replace(':hangin:', '<img src="../webboard/smile_files/i2.gif">', $output);
$output = str_replace(':warning:', '<img src="../webboard/smile_files/i21.gif">', $output);
$output = str_replace(':cd:', '<img src="../webboard/smile_files/i5.gif">', $output);
$output = str_replace(':jester2:', '<img src="../webboard/smile_files/joker.gif">', $output);
$output = str_replace(':bouncy2:', '<img src="../webboard/smile_files/jump2.gif">', $output);

$output = str_replace(':flippy:', '<img src="../webboard/smile_files/jumping.gif">', $output);
$output = str_replace(':kiss2:', '<img src="../webboard/smile_files/kiss1.gif">', $output);
$output = str_replace(':girl:', '<img src="../webboard/smile_files/lady.gif">', $output);
$output = str_replace(':mears:', '<img src="../webboard/smile_files/mickmouse.gif">', $output);
$output = str_replace(':lympics:', '<img src="../webboard/smile_files/olympics.gif">', $output);
$output = str_replace(':lips:', '<img src="../webboard/smile_files/lips.gif">', $output);
$output = str_replace(':Partier:', '<img src="../webboard/smile_files/party2.gif">', $output);
$output = str_replace(':tup:', '<img src="../webboard/smile_files/thumbs_up.gif">', $output);

$output = str_replace(':(', '<img src="../webboard/smile_files/frown.gif">', $output);
$output = str_replace(':D', '<img src="../webboard/smile_files/biggrin.gif">', $output);
$output = str_replace(':p', '<img src="../webboard/smile_files/tongue.gif">', $output);
$output = str_replace(':rolleyes:', '<img src="../webboard/smile_files/rolleyes.gif">', $output);
$output = str_replace(':eek:', '<img src="../webboard/smile_files/eek.gif">', $output);
	    
$output = str_replace(':bawling:', '<img src="../webboard/smile_files/bawling.gif">', $output);
$output = str_replace(':dodgy:', '<img src="../webboard/smile_files/dodgy.gif">', $output);
$output = str_replace(':EL:', '<img src="../webboard/smile_files/embarassedlaugh.gif">', $output);
$output = str_replace(':idea:', '<img src="../webboard/smile_files/idea.gif">', $output);
$output = str_replace(':karate:', '<img src="../webboard/smile_files/karate.gif">', $output);

$output = str_replace(':nighty:', '<img src="../webboard/smile_files/nighty.gif">', $output);
$output = str_replace(':sleeping:', '<img src="../webboard/smile_files/sleeping.gif">', $output);
$output = str_replace(':splat:', '<img src="../webboard/smile_files/splat.gif">', $output);
$output = str_replace(':wavey:', '<img src="../webboard/smile_files/wavey.gif">', $output);
$output = str_replace(':vampire:', '<img src="../webboard/smile_files/vampire.gif">', $output);


$output = str_replace(':bat:', '<img src="../webboard/smile_files/blackbat.gif">', $output);
$output = str_replace(':angel:', '<img src="../webboard/smile_files/angel.gif">', $output);
$output = str_replace(':lol:', '<img src="../webboard/smile_files/FRlol.gif">', $output);
$output = str_replace(':good:', '<img src="../webboard/smile_files/goodbad.gif">', $output);
$output = str_replace(':kitty:', '<img src="../webboard/smile_files/kitty.gif">', $output);

$output = str_replace(':stpatty:', '<img src="../webboard/smile_files/patty.gif">', $output);
$output = str_replace(':eyes:', '<img src="../webboard/smile_files/privateeyes.gif">', $output);
$output = str_replace(':rainbow:', '<img src="../webboard/smile_files/rainbow.gif">', $output);
$output = str_replace(':rwb:', '<img src="../webboard/smile_files/rwb.gif">', $output);
$output = str_replace(':santa2:', '<img src="../webboard/smile_files/xmas.gif">', $output);
		 
$output = str_replace(':sparty:', '<img src="../webboard/smile_files/party.gif">', $output);
$output = str_replace(':nod:', '<img src="../webboard/smile_files/agree.gif">', $output);
$output = str_replace(':angel3:', '<img src="../webboard/smile_files/angel2.gif">', $output);
$output = str_replace(':angel5:', '<img src="../webboard/smile_files/angel_2.gif">', $output);
$output = str_replace(':argue:', '<img src="../webboard/smile_files/argue.gif">', $output);
		
$output = str_replace(':hbday:', '<img src="../webboard/smile_files/bday_2.gif">', $output);
$output = str_replace(':blush:', '<img src="../webboard/smile_files/blush.gif">', $output);
$output = str_replace(':eyebrow:', '<img src="../webboard/smile_files/brow.gif">', $output);
$output = str_replace(':bunny:', '<img src="../webboard/smile_files/bunny.gif">', $output);
$output = str_replace(':cheer2:', '<img src="../webboard/smile_files/cheer4.gif">', $output);

$output = str_replace(':confused2:', '<img src="../webboard/smile_files/confused2.gif">', $output);
$output = str_replace(':badpc:', '<img src="../webboard/smile_files/crash.gif">', $output);
$output = str_replace(':xtree:', '<img src="../webboard/smile_files/ctree.gif">', $output);
$output = str_replace(':musicman:', '<img src="../webboard/smile_files/dazzler.gif">', $output);
$output = str_replace(':weyes:', '<img src="../webboard/smile_files/dizzy.gif">', $output);

$output = str_replace(':drinky:', '<img src="../webboard/smile_files/drink.gif">', $output);
$output = str_replace(':ghost:', '<img src="../webboard/smile_files/eyemouth.gif">', $output);
$output = str_replace(':fangel:', '<img src="../webboard/smile_files/headscratch.gif">', $output);
$output = str_replace(':love:', '<img src="../webboard/smile_files/hearts.gif">', $output);
$output = str_replace(':deer:', '<img src="../webboard/smile_files/hert.gif">', $output);

$output = str_replace(':note:', '<img src="../webboard/smile_files/i20.gif">', $output);
$output = str_replace(':mcamara:', '<img src="../webboard/smile_files/i3.gif">', $output);
$output = str_replace(':jester:', '<img src="../webboard/smile_files/jester.gif">', $output);
$output = str_replace(':bouncy:', '<img src="../webboard/smile_files/jump.gif">', $output);
$output = str_replace(':bouncy3:', '<img src="../webboard/smile_files/jump3.gif">', $output);

$output = str_replace(':king:', '<img src="../webboard/smile_files/king.gif">', $output);
$output = str_replace(':queen:', '<img src="../webboard/smile_files/kitfly.gif">', $output);
$output = str_replace(':lman:', '<img src="../webboard/smile_files/ladysman.gif">', $output);
$output = str_replace(':agree:', '<img src="../webboard/smile_files/nod.gif">', $output);
$output = str_replace(':lightbulb:', '<img src="../webboard/smile_files/lightbulb.gif">', $output);

$output = str_replace(':Partyguy:', '<img src="../webboard/smile_files/party1.gif">', $output);
$output = str_replace(':Partydude:', '<img src="../webboard/smile_files/party_2.gif">', $output);
$output = str_replace(':tdown:', '<img src="../webboard/smile_files/thumbs_down.gif">', $output);


	//$output = str_replace(':-)', '<img src="image/smile.gif" />', $output);

	return nl2br($output);
}
function print_output($output) 
{
	echo format_output($output);
}

/*
 <B>แท็กที่สามารถใช้งานได้</B><br> 
	<table border=0 cellpadding=2 cellspacing=1>
	<tr>
			<td>รูปแบบ</td><td>ตัวอย่าง</td><td><b>ผลที่ได้</b></td>
	</tr>
	<tr>
			<td>ตัวหนา</td><td>[b] Test [/b]</td><td><b>Test</b></td>
	</tr>
	<tr>
			<td>ตัวเอียง</td><td>[i] Test [/i]</td><td><i>Test</i></td>
	</tr>
		<tr>
			<td>ตัวขีดเส้นใต้</td><td>[u] Test [/u]</td><td><u>Test</u></td>
	</tr>
		<tr>
			<td>Link</td><td>[link="http://www.cnn.com"] Test [/link]</td><td><a href="http://www.cnn.com">Test</a></td>
	</tr>
	<tr>
			<td>ย่อหน้า</td><td>[ul] Test [/ul]</td><td><ul>Test</ul></td>
	</tr>
	<tr>
			<td>ลิสต์</td><td>[li] Test [/li]</td><td><li>Test</li></td>
	</tr>
	<tr>
			<td>รูปภาพ</td><td colspan=2>เลือกรูปที่ต้องการ กด upload จะได้  code ออกมา แล้วนำไปแทรกในฟอร์ม</td>
	</tr>
	</table>


	4.  ตาราง [table]...[/table]  แทรกแถว [r]...[/r] แทรกคอลัมน์  [c]...[/c] <br> 
 */
?>