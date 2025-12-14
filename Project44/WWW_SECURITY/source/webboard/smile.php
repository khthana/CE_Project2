<?
include "interface.inc.php";
include "accesscontrol.php";
?>
<HTML><HEAD><TITLE>ISAG Staff Webboard --> Smilies List</TITLE>
<SCRIPT language=javascript type=text/javascript>
<!--
function WinOpen(url,x,y) {
  var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
  msgWindow=window.open(url,"WinOpen",options);
}
// -->
</SCRIPT>

<SCRIPT language=JavaScript>
function smilie(smilietext) 
{	opener.document.vbform.Detail.value += smilietext+" ";
//opener.vbform.message.focus();
}
</SCRIPT>
</HEAD>

<BODY id=all text=#000000 vLink=#000000 aLink=#000000 link=#000000  bgColor=#b0c0d0>
<TABLE cellSpacing=1 cellPadding=4 width="100%" bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD bgColor=#ffffff colSpan=4><FONT face="verdana, arial, helvetica" 
      size=2><B>Smilies List</B></FONT><BR><FONT face=verdana,arial,helvetica 
      size=1>Click a smilie to insert it into your message.</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#cddeed><A href="javascript:smilie(':)')"><IMG alt=smile 
      src="smile_files/smile.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
    size=2>:)</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':(')"><IMG alt=frown 
      src="smile_files/frown.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
    size=2>:(</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':o')"><IMG 
      alt=embarrasment src="smile_files/redface.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
    size=2>:o</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':D')"><IMG alt="big grin" 
      src="smile_files/biggrin.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
    size=2>:D</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#cddeed><A href="javascript:smilie(';)')"><IMG alt=wink 
      src="smile_files/wink.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
    size=2>;)</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':p')"><IMG 
      alt="stick out tongue" src="smile_files/tongue.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
    size=2>:p</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':cool:')"><IMG alt=cool 
      src="smile_files/cool.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:cool:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':rolleyes:')"><IMG 
      alt="roll eyes (sarcastic)" src="smile_files/rolleyes.gif" 
border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:rolleyes:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#cddeed><A href="javascript:smilie(':mad:')"><IMG alt=mad 
      src="smile_files/mad.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:mad:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':eek:')"><IMG alt=eek! 
      src="smile_files/eek.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:eek:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':confused:')"><IMG 
      alt=confused src="smile_files/confused.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:confused:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':bawling:')"><IMG 
      alt=Bawling src="smile_files/bawling.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:bawling:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#cddeed><A href="javascript:smilie(':devil:')"><IMG alt=Devil 
      src="smile_files/devil.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:devil:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':dodgy:')"><IMG alt=Dodgy 
      src="smile_files/dodgy.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:dodgy:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':eek2:')"><IMG alt=Eek2 
      src="smile_files/eek2.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:eek2:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':EL:')"><IMG 
      alt="Embarassed Laugh" src="smile_files/embarassedlaugh.gif" 
    border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:EL:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#cddeed><A href="javascript:smilie(':goof:')"><IMG alt=Goof 
      src="smile_files/goof.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:goof:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':idea:')"><IMG alt=Idea 
      src="smile_files/idea.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:idea:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':kaioken:')"><IMG 
      alt=Kaioken src="smile_files/kaioken.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:kaioken:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':karate:')"><IMG 
      alt=Karate src="smile_files/karate.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:karate:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#cddeed><A href="javascript:smilie(':kiss:')"><IMG alt=Kiss 
      src="smile_files/kiss.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:kiss:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':nighty:')"><IMG 
      alt=Nighty src="smile_files/nighty.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:nighty:</FONT></TD></TR>
  <TR> <!------------------------------------------------------------------------------------------------------------------->
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':redhot:')"><IMG 
      alt="Red Hot" src="smile_files/redhot.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:redhot:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':sleeping:')"><IMG 
      alt=Sleeping src="smile_files/sleeping.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:sleeping:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':smash:')"><IMG alt=Smash 
      src="smile_files/smash.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:smash:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':splat:')"><IMG alt=Splat 
      src="smile_files/splat.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:splat:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':teleport:')"><IMG 
      alt=Teleport src="smile_files/teleport.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:teleport:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':wavey:')"><IMG alt=Wavey 
      src="smile_files/wavey.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:wavey:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':yawn:')"><IMG alt=Yawn 
      src="smile_files/yawnb.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:yawn:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':vampire:')"><IMG 
      alt=Vampire src="smile_files/vampire.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:vampire:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':heart:')"><IMG alt=Heart 
      src="smile_files/heart.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:heart:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':bat:')"><IMG alt=Bat 
      src="smile_files/blackbat.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:bat:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':cold:')"><IMG alt=Cold 
      src="smile_files/cold.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:cold:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':angel:')"><IMG alt=Angel 
      src="smile_files/angel.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:angel:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':flake:')"><IMG 
      alt=Snowflake src="smile_files/flake.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:flake:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':lol:')"><IMG 
      alt="Laugh Out Loud" src="smile_files/FRlol.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:lol:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':frosty:')"><IMG 
      alt=Snowman src="smile_files/frosty.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:frosty:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':good:')"><IMG alt=Good? 
      src="smile_files/goodbad.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:good:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':witch:')"><IMG alt=Witch 
      src="smile_files/heks.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:witch:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':kitty:')"><IMG alt=Kitty 
      src="smile_files/kitty.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:kitty:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':alien:')"><IMG alt=Alien 
      src="smile_files/alien.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:alien:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':stpatty:')"><IMG 
      alt="St. Patrick's Day" src="smile_files/patty.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:stpatty:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':apresent:')"><IMG 
      alt=Present src="smile_files/present.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:apresent:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':eyes:')"><IMG 
      alt="Look Out" src="smile_files/privateeyes.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:eyes:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':jack1:')"><IMG 
      alt=Pumpkin src="smile_files/pumpkin.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:jack1:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':rainbow:')"><IMG 
      alt=Rainbow src="smile_files/rainbow.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:rainbow:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':santa:')"><IMG alt=Santa 
      src="smile_files/santasmile.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:santa:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':rwb:')"><IMG 
      alt="Red White Blue" src="smile_files/rwb.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:rwb:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':xeye:')"><IMG 
      alt=Cross-Eyed src="smile_files/xeye.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:xeye:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':santa2:')"><IMG 
      alt="Santa #2" src="smile_files/xmas.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:santa2:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':jack2:')"><IMG 
      alt="Pumpkin #2" src="smile_files/pumpkin2.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:jack2:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':sparty:')"><IMG alt=Party 
      src="smile_files/party.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:sparty:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':bday:')"><IMG 
      alt=Birthday src="smile_files/bday.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:bday:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':nod:')"><IMG alt=Noddy 
      src="smile_files/agree.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:nod:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':angel2:')"><IMG 
      alt=Angel2 src="smile_files/angel1.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:angel2:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':angel3:')"><IMG 
      alt=Angel3 src="smile_files/angel2.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:angel3:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':angel4:')"><IMG 
      alt=Angel4 src="smile_files/angel3.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:angel4:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':angel5:')"><IMG 
      alt=Angel5 src="smile_files/angel_2.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:angel5:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':angel6:')"><IMG 
      alt=Angel6 src="smile_files/angelfly.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:angel6:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':argue:')"><IMG alt=Argue 
      src="smile_files/argue.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:argue:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':zzz:')"><IMG alt=Sleep 
      src="smile_files/as-sleep.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:zzz:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':hbday:')"><IMG 
      alt="Happy Birthday" src="smile_files/bday_2.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:hbday:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':apart:')"><IMG 
      alt="Pull Apart" src="smile_files/bighug.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:apart:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':blush:')"><IMG alt=Blush 
      src="smile_files/blush.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:blush:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':wall:')"><IMG 
      alt="Bang Head" src="smile_files/brickwall.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:wall:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':eyebrow:')"><IMG 
      alt=Eyebrows src="smile_files/brow.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:eyebrow:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':bubbly:')"><IMG 
      alt=Bubbly src="smile_files/bubbly.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:bubbly:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':bunny:')"><IMG alt=Bunny 
      src="smile_files/bunny.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:bunny:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':cheer:')"><IMG alt=Cheer 
      src="smile_files/cheer.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:cheer:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':cheer2:')"><IMG 
      alt=Cheer2 src="smile_files/cheer4.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:cheer2:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':clown:')"><IMG alt=Clown 
      src="smile_files/clown.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:clown:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':confused2:')"><IMG 
      alt=Confused2 src="smile_files/confused2.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:confused2:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':cool2:')"><IMG alt=Cool2 
      src="smile_files/cool_2.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:cool2:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':badpc:')"><IMG 
      alt="Bad PC" src="smile_files/crash.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:badpc:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':wacko:')"><IMG alt=Wacko 
      src="smile_files/crazy.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:wacko:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':xtree:')"><IMG 
      alt="Xmas Tree" src="smile_files/ctree.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:xtree:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':daisy:')"><IMG alt=Daisy 
      src="smile_files/daisy.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:daisy:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':musicman:')"><IMG 
      alt=MusicMan src="smile_files/dazzler.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:musicman:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':sick:')"><IMG alt=Sick 
      src="smile_files/dead.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:sick:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':weyes:')"><IMG 
      alt="Wild Eyes" src="smile_files/dizzy.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:weyes:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':dollar:')"><IMG 
      alt=Dollar src="smile_files/dollar.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:dollar:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':drinky:')"><IMG 
      alt=Drinky src="smile_files/drink.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:drinky:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':elf:')"><IMG alt=Elf 
      src="smile_files/elf.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:elf:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':ghost:')"><IMG alt=Ghost 
      src="smile_files/eyemouth.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:ghost:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':flower:')"><IMG 
      alt=Flower src="smile_files/flower.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:flower:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':fangel:')"><IMG 
      alt="Fallen Angel" src="smile_files/headscratch.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:fangel:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':looko:')"><IMG 
      alt="Look Around" src="smile_files/headshake.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:looko:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':love:')"><IMG 
      alt="In Love" src="smile_files/hearts.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:love:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':kitty2:')"><IMG 
      alt="Kitty 2" src="smile_files/hello.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:kitty2:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':deer:')"><IMG alt=Deer 
      src="smile_files/hert.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:deer:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':hangin:')"><IMG 
      alt="Hang Loose" src="smile_files/i2.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:hangin:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':note:')"><IMG 
      alt="Music Note" src="smile_files/i20.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:note:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':warning:')"><IMG 
      alt="Warning Light" src="smile_files/i21.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:warning:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':mcamara:')"><IMG 
      alt="Movie Camera" src="smile_files/i3.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:mcamara:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':cd:')"><IMG alt=CD 
      src="smile_files/i5.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:cd:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':jester:')"><IMG 
      alt=Jester src="smile_files/jester.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:jester:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':jester2:')"><IMG 
      alt=Jester2 src="smile_files/joker.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:jester2:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':bouncy:')"><IMG 
      alt=Bouncy src="smile_files/jump.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:bouncy:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':bouncy2:')"><IMG 
      alt="Multi Bouncy" src="smile_files/jump2.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:bouncy2:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':bouncy3:')"><IMG 
      alt="Fiery Bouncy" src="smile_files/jump3.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:bouncy3:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':flippy:')"><IMG 
      alt="Flip for Joy" src="smile_files/jumping.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:flippy:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':king:')"><IMG alt=King 
      src="smile_files/king.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:king:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':kiss2:')"><IMG 
      alt="Kiss 2" src="smile_files/kiss1.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:kiss2:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':queen:')"><IMG alt=Queen 
      src="smile_files/kitfly.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:queen:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':girl:')"><IMG alt=Girl 
      src="smile_files/lady.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:girl:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':lman:')"><IMG 
      alt="Lady's Man" src="smile_files/ladysman.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:lman:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':mears:')"><IMG 
      alt="Mouse Ears" src="smile_files/mickmouse.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:mears:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':agree:')"><IMG alt=Agree 
      src="smile_files/nod.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:agree:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':lympics:')"><IMG 
      alt=Olympics src="smile_files/olympics.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:lympics:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':lightbulb:')"><IMG 
      alt="Light BUlb" src="smile_files/lightbulb.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:lightbulb:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':lips:')"><IMG alt=Lips 
      src="smile_files/lips.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:lips:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':Partyguy:')"><IMG 
      alt="Party Guy" src="smile_files/party1.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:Partyguy:</FONT></TD></TR>
  <TR>
    <TD bgColor=#cddeed><A href="javascript:smilie(':Partier:')"><IMG 
      alt="Party Goer" src="smile_files/party2.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:Partier:</FONT></TD>
    <TD bgColor=#cddeed><A href="javascript:smilie(':Partydude:')"><IMG 
      alt="Party Dude" src="smile_files/party_2.gif" border=0></A></TD>
    <TD bgColor=#cddeed><FONT face="verdana, arial, helvetica" 
      size=2>:Partydude:</FONT></TD></TR>
  <TR>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':tup:')"><IMG 
      alt="Thumbs Up" src="smile_files/thumbs_up.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:tup:</FONT></TD>
    <TD bgColor=#ebf1f7><A href="javascript:smilie(':tdown:')"><IMG 
      alt="Thumbs Down" src="smile_files/thumbs_down.gif" border=0></A></TD>
    <TD bgColor=#ebf1f7><FONT face="verdana, arial, helvetica" 
      size=2>:tdown:</FONT></TD></TR>
  <TR>
    <TD align=middle bgColor=#ffffff colSpan=4><FONT 
      face=verdana,arial,helvetica size=1>[<A 
      href="javascript:self.close()">close this 
window</A>]</FONT></TD></TR></TBODY></TABLE></BODY></HTML>
