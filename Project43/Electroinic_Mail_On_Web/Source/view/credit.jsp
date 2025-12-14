<HTML>
<HEAD>
	<TITLE>JRun Credits</TITLE>
	<LINK HREF='/includes/JRunAdmin.css' REL='stylesheet' TYPE='text/css'>

	<STYLE>
	#credits { WIDTH : 300;
		BACKGROUND-COLOR : white;
		TEXT-ALIGN : center; }
	</STYLE>
	<SCRIPT>
	var speed = 50; // in milliseconds
	var count = new Number(0); // ongoing count
	var resetCount = new Number(350); // reset the scroll
	if( document.layers ) { // netscape resets too early
		resetCount += 50;
	}
	
	function go() {
		scrollNow = window.setInterval("doScroll(1)",speed)
	}
	
	function doScroll(vertAmount) {
		count++;
		scrollBy(0,vertAmount);
		if( count == resetCount ) { // return to top, Need to play with the count number
			scrollTo(0,0);
			count = 0;
		}
	}
	
	function pause() {
		window.clearInterval(scrollNow);
	}
	</SCRIPT>
</HEAD>

<BODY onLoad='go()'>

<BR><BR>
<CENTER>
<DIV ID='credits' onMouseOver='pause();' onMouseOut='go();'>
<LAYER ID='credits' ALIGN='center' onMouseOver='pause()' onMouseOut='go();'>

<IMG SRC="/images/credits/jrun_logo.gif" WIDTH="43" HEIGHT="54" ALT="" BORDER="0">
<IMG SRC="images/credits/jrunCredits.jpg" WIDTH="154" HEIGHT="34" ALT="" BORDER="0">
<HR SIZE=1 NOSHADE>
<b>CAST</b><br><br>
Yuttana Pongpradit <BR>
Peerapong Charoenpong <BR>
<br><br><b>DIRECTOR</b><br><br>
Kietikul Jearanaitanakij <BR>

<BR><BR><BR>

</LAYER>
</DIV>
</CENTER>

</BODY>
</HTML>
