// Based on the Cross-Browser RTE program developed by Kevin Roth (kevinroth.com)

// init variables
var isRichText = false;
var rng;
var currentRTE;
var allRTEs = "";

var isIE;
var isGecko;
var isSafari;
var isKonqueror;

var imagesPath;
var includesPath;
var cssFile;

function initRTE(imgPath, incPath, css) {
	//set browser vars
	var ua = navigator.userAgent.toLowerCase();
	isIE = ((ua.indexOf("msie") != -1) && (ua.indexOf("opera") == -1) && (ua.indexOf("webtv") == -1)); 
	isGecko = (ua.indexOf("gecko") != -1);
	isSafari = (ua.indexOf("safari") != -1);
	isKonqueror = (ua.indexOf("konqueror") != -1);
	
	//check to see if designMode mode is available
	if (document.getElementById && document.designMode && !isSafari && !isKonqueror) {
		isRichText = true;
	}
	
	if (!isIE) document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT | Event.MOUSEDOWN | Event.MOUSEUP);
	document.onmouseover = raiseButton;
	document.onmouseout  = normalButton;
	document.onmousedown = lowerButton;
	document.onmouseup   = raiseButton;
	
	//set paths vars
	imagesPath = imgPath;
	includesPath = incPath;
	cssFile = css;
	
	if (isRichText) document.writeln('<style type="text/css">@import "' + includesPath + 'rte.css";</style>');
	
	//for testing standard textarea, uncomment the following line
	//isRichText = false;
}

function writeRichText(rte, html, width, height, buttons, readOnly) {
	if (isRichText) {
		if (allRTEs.length > 0) allRTEs += ";";
		allRTEs += rte;
		writeRTE(rte, html, width, height, buttons, readOnly);
	} else {
		writeDefault(rte, html, width, height, buttons, readOnly);
	}
}

function writeDefault(rte, html, width, height, buttons, readOnly) {
	if (!readOnly) {
		document.writeln('<textarea id="' + rte + '" name="contents" style="width: ' + width + 'px;" rows="12" cols="80" tabindex="2">' + html + '</textarea>');
	} else {
		document.writeln('<textarea id="' + rte + '" name="contents" style="width: ' + width + 'px;" tabindex="2" readonly>' + html + '</textarea>');
	}
}

function raiseButton(e) {
	if (isIE) {
		var el = window.event.srcElement;
	} else {
		var el= e.target;
	}
	
	className = el.className;
	if (className == 'rteImage' || className == 'rteImageLowered' || className == 'rteImageDisabled') {
		el.className = 'rteImageRaised';
	}
}

function normalButton(e) {
	if (isIE) {
		var el = window.event.srcElement;
	} else {
		var el= e.target;
	}
	
	className = el.className;
	if (className == 'rteImageRaised' || className == 'rteImageLowered' || className == 'rteImageDisabled') {
		el.className = 'rteImage';
	}
}

function disabledButton(e) {
	if (isIE) {
		var el = window.event.srcElement;
	} else {
		var el= e.target;
	}
	
	className = el.className;
	if (className == 'rteImage' || className == 'rteImageRaised' || className == 'rteImage' || className == 'rteImageLowered') {
		el.className = 'rteImageDisabled';
        }
}

function lowerButton(e) {
	if (isIE) {
		var el = window.event.srcElement;
	} else {
		var el= e.target;
	}
	
	className = el.className;
	if (className == 'rteImage' || className == 'rteImageRaised' || className == 'rteImageDisabled') {
		el.className = 'rteImageLowered';
	}
}

function toggleHTMLlink(rte) {
if(document.info.htmlsource.checked == true) {
  document.info.htmlsource.checked = false;
  toggleHTMLSrc(rte);
} else {
  document.info.htmlsource.checked = true;
  toggleHTMLSrc(rte);
}
}


function writeRTE(rte, html, width, height, buttons, readOnly) {
	if (readOnly) buttons = false;
	
	//adjust minimum table widths
	if (isIE) {
		if (buttons && (width < 600)) width = 600;
		var tablewidth = width;
	} else {
		if (buttons && (width < 500)) width = 500;
		var tablewidth = width + 4;
	}
	
	if (buttons == true) {
		document.writeln('<table width="100%" cellpadding="0" cellspacing="0" style="margin-top: 2px;"><tr><td style="padding: 0px; border: 1px solid #808080;"><table class="rteBack2" cellpadding="0" cellspacing="0" id="Buttons1_' + rte + '">');
		document.writeln('	<tr>');
		document.writeln('		<td>');
		document.writeln('			<select tabindex="2" name="font" style="font-size: 9pt;" id="fontname_' + rte + '" onchange="Select(\'' + rte + '\', this.id)">');
		document.writeln('				<option value="Font" selected>[Font]</option>');
		document.writeln('				<option value="Arial, Helvetica, sans-serif">Arial</option>');
		document.writeln('				<option value="Courier New, Courier, mono">Courier New</option>');
		document.writeln('				<option value="Georgia, Arial, Helvetica, sans-serif">Georgia</option>');
		document.writeln('				<option value="Impact, Times New Roman, sans-serif">Impact</option>');
		document.writeln('				<option value="Lucida Console, Lucida Sans Unicode, sans-serif">Lucida Console</option>');
		document.writeln('				<option value="Modern, Modern MS Sans Serif, sans-serif">Modern</option>');
		document.writeln('				<option value="Palatino Linotype, Palatino, sans-serif">Palatino</option>');
		document.writeln('				<option value="Tahoma, sans-serif">Tahoma</option>');
		document.writeln('				<option value="Times New Roman, Times, serif">Times New Roman</option>');
		document.writeln('				<option value="Trebuchet MS, Arial, Helvetica, sans-serif">Trebuchet</option>');
		document.writeln('				<option value="Verdana, Arial, Helvetica, sans-serif">Verdana</option>');
		document.writeln('				<option value="Webdings, Wingdings, sans-serif">Webdings</option>');
		document.writeln('				<option value="Wingdings, Webdings, sans-serif">Wingdings</option>');
		document.writeln('			</select>');
		document.writeln('		</td>');
		document.writeln('		<td>');
		document.writeln('			<select tabindex="3" name="size" style="font-size: 9pt;" unselectable="on" id="fontsize_' + rte + '" onchange="Select(\'' + rte + '\', this.id);">');
		document.writeln('				<option value="Size">[Size]</option>');
		document.writeln('				<option value="1">1</option>');
		document.writeln('				<option value="2">2</option>');
		document.writeln('				<option value="3">3</option>');
		document.writeln('				<option value="4">4</option>');
		document.writeln('				<option value="5">5</option>');
		document.writeln('				<option value="6">6</option>');
		document.writeln('				<option value="7">7</option>');
		document.writeln('			</select>');
		document.writeln('		</td>');
		document.writeln('		<td NOWRAP>');
		document.writeln('	<table cellpadding="0" cellspacing="0"><tr><td><input tabindex="4" type="checkbox" name="htmlsource" id="chkSrc' + rte + '" onclick="toggleHTMLSrc(\'' + rte + '\');" /></td><td style="padding-top: 2px;" NOWRAP><a tabindex="5" href="javascript: toggleHTMLlink(\'' + rte + '\');" style="text-decoration: none; color: #000000;">&nbsp;HTML</a></td></tr></table>');
		document.writeln('		</td>');
		document.writeln('		<td><img class="rteVertSep" src="' + imagesPath + 'blackdot.gif" width="1" height="20" border="0" alt=""></td>');
		document.writeln('		<td><img class="rteImage" name="hr" src="' + imagesPath + 'hr.gif" width="25" height="24" alt="Horizontal Rule" title="Horizontal Rule" onClick="FormatText(\'' + rte + '\', \'inserthorizontalrule\', \'\')"></td>');
		document.writeln('		<td><img class="rteVertSep" src="' + imagesPath + 'blackdot.gif" width="1" height="20" border="0" alt=""></td>');
		document.writeln('		<td><img class="rteImage" name="hyperlink" src="' + imagesPath + 'hyperlink.gif" width="25" height="24" alt="Insert Link" title="Insert Link" onClick="FormatText(\'' + rte + '\', \'createlink\')"></td>');
		document.writeln('		<td><img class="rteImage" name="image" src="' + imagesPath + 'image.gif" width="25" height="24" alt="Add Image" title="Add Image" onClick="AddImage(\'' + rte + '\')"></td>');
		document.writeln('		<td><img class="rteImage" name="smilie" src="' + imagesPath + 'smilie.gif" width="25" height="24" alt="Insert Smilie" title="Insert Smilie" onClick="insertSmilie()"></td>');
		document.writeln('		<td><img class="rteVertSep" src="' + imagesPath + 'blackdot.gif" width="1" height="20" border="0" alt=""></td>');
		document.writeln('		<td><img class="rteImage" name="eraser" src="' + imagesPath + 'eraser.gif" width="25" height="24" alt="Clear Formatting" title="Clear Formatting" onClick="clearFormatting(\'' + rte + '\')"></td>');
		document.writeln('		</td>');
		document.writeln('		<td width="100%"></td>');
		document.writeln('	</tr>');
		document.writeln('</table>');
		document.writeln('<table class="rteBack2" cellpadding="0" cellspacing="0" id="Buttons2_' + rte + '">');
		document.writeln('	<tr>');
		document.writeln('		<td><img class="rteImage" name="bold" src="' + imagesPath + 'bold.gif" width="25" height="24" alt="Bold" title="Bold" onClick="FormatText(\'' + rte + '\', \'bold\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="italic" src="' + imagesPath + 'italic.gif" width="25" height="24" alt="Italic" title="Italic" onClick="FormatText(\'' + rte + '\', \'italic\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="underline" src="' + imagesPath + 'underline.gif" width="25" height="24" alt="Underline" title="Underline" onClick="FormatText(\'' + rte + '\', \'underline\', \'\')"></td>');
		document.writeln('		<td><img class="rteVertSep" src="' + imagesPath + 'blackdot.gif" width="1" height="20" border="0" alt=""></td>');
		document.writeln('		<td><img class="rteImage" name="left_just" src="' + imagesPath + 'left_just.gif" width="25" height="24" alt="Align Left" title="Align Left" onClick="FormatText(\'' + rte + '\', \'justifyleft\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="centre" src="' + imagesPath + 'centre.gif" width="25" height="24" alt="Center" title="Center" onClick="FormatText(\'' + rte + '\', \'justifycenter\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="right_just" src="' + imagesPath + 'right_just.gif" width="25" height="24" alt="Align Right" title="Align Right" onClick="FormatText(\'' + rte + '\', \'justifyright\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="justifyfull" src="' + imagesPath + 'justifyfull.gif" width="25" height="24" alt="Justify Full" title="Justify Full" onclick="FormatText(\'' + rte + '\', \'justifyfull\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="numbered_list" src="' + imagesPath + 'numbered_list.gif" width="25" height="24" alt="Ordered List" title="Ordered List" onClick="FormatText(\'' + rte + '\', \'insertorderedlist\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="list" src="' + imagesPath + 'list.gif" width="25" height="24" alt="Unordered List" title="Unordered List" onClick="FormatText(\'' + rte + '\', \'insertunorderedlist\', \'\')"></td>');
		document.writeln('		<td><img class="rteVertSep" src="' + imagesPath + 'blackdot.gif" width="1" height="20" border="0" alt=""></td>');
		document.writeln('		<td><img class="rteImage" name="outdent" src="' + imagesPath + 'outdent.gif" width="25" height="24" alt="Outdent" title="Outdent" onClick="FormatText(\'' + rte + '\', \'outdent\', \'\')"></td>');
		document.writeln('		<td><img class="rteImage" name="indent" src="' + imagesPath + 'indent.gif" width="25" height="24" alt="Indent" title="Indent" onClick="FormatText(\'' + rte + '\', \'indent\', \'\')"></td>');
		document.writeln('		<td><div id="forecolor_' + rte + '"><img class="rteImage" name="textcolor" src="' + imagesPath + 'textcolor.gif" width="25" height="24" alt="Text Color" title="Text Color" onClick="FormatText(\'' + rte + '\', \'forecolor\', \'\')"></div></td>');
		document.writeln('		<td><div id="hilitecolor_' + rte + '"><img class="rteImage" name="bgcolor" src="' + imagesPath + 'bgcolor.gif" width="25" height="24" alt="Background Color" title="Background Color" onClick="FormatText(\'' + rte + '\', \'hilitecolor\', \'\')"></div></td>');
		document.writeln('		<td width="100%"></td>');
		document.writeln('	</tr>');
		document.writeln('</table></td></tr></table>');
	}
	document.writeln('<iframe id="' + rte + '" name="' + rte + '" width="' + width + 'px" height="' + height + 'px"></iframe>');
	document.writeln('<iframe width="154" height="104" id="cp' + rte + '" src="' + includesPath + 'palette.htm" marginwidth="0" marginheight="0" scrolling="no" style="visibility:hidden; display: none; position: absolute;"></iframe>');
	document.writeln('<input type="hidden" id="hdn' + rte + '" name="' + rte + '" value="">');
	document.getElementById('hdn' + rte).value = html;
	enableDesignMode(rte, html, readOnly);
}






// opens new window to select smilie
function insertSmilie() {
if(document.info.htmlsource.checked == false) {
var w = 220;
var h = 275;
var winl = (screen.width - w) / 2;
var wint = (screen.height - h) / 2;
var page='richtext.php?task=addsmilie';
var features = 'width='+w+',height='+h+',top='+wint+',left='+winl+',toolbar=0,status=0,resizable=0,scrollbars=1';
win3=window.open(page,"Smilie",features)
}}



// adds smilie
function addSmilie(imagePath, rte) {
	var oRTE;


        if (window.opener.document.info.htmlsource.checked == false) {
	oRTE = window.opener.document.getElementById(rte).contentWindow;
					
	if ((imagePath != null) && (imagePath != "")) {
		oRTE.focus();
		oRTE.document.execCommand('InsertImage', false, imagePath);
		oRTE.focus();
	}
	}
}


function enableDesignMode(rte, html, readOnly) {
	var frameHtml = "<html id=\"" + rte + "\">\n";
	frameHtml += "<head>\n";
	//to reference your stylesheet, set href property below to your stylesheet path and uncomment
	if (cssFile.length > 0) {
		frameHtml += "<link media=\"all\" type=\"text/css\" href=\"" + cssFile + "\" rel=\"stylesheet\">\n";
	} else {
		frameHtml += "<style type='text/css'>\n";
		frameHtml += "body {\n";
		frameHtml += "	background: #FFFFFF;\n";
		frameHtml += "	margin: 0px;\n";
		frameHtml += "	padding: 0px;\n";
		frameHtml += "	font-family: Times, \"Times New Roman\", serif;\n";
		frameHtml += "	font-size: 12pt;\n";
		frameHtml += "}\n";
		frameHtml += "p {\n";
		frameHtml += "	margin: 0px;\n";
		frameHtml += "}\n";
		frameHtml += "</style>\n";
	}
	frameHtml += "</head>\n";
	frameHtml += "<body>\n";
	frameHtml += html + "\n";
	frameHtml += "</body>\n";
	frameHtml += "</html>";
	
	if (document.all) {
		var oRTE = frames[rte].document;
		oRTE.open();
		oRTE.write(frameHtml);
		oRTE.close();
		if (!readOnly) oRTE.designMode = "On";
	} else {
		try {
			if (!readOnly) document.getElementById(rte).contentDocument.designMode = "on";
			try {
				var oRTE = document.getElementById(rte).contentWindow.document;
				oRTE.open();
				oRTE.write(frameHtml);
				oRTE.close();
				if (isGecko && !readOnly) {
					//attach a keyboard handler for gecko browsers to make keyboard shortcuts work
					oRTE.addEventListener("keypress", kb_handler, true);
				}
			} catch (e) {
				alert("Error preloading content.");
			}
		} catch (e) {
			//gecko may take some time to enable design mode.
			//Keep looping until able to set.
			if (isGecko) {
				setTimeout("enableDesignMode('" + rte + "', '" + html + "', " + readOnly + ");", 10);
			} else {
				return false;
			}
		}
	}
}

function updateRTEs() {
	var vRTEs = allRTEs.split(";");
	for (var i = 0; i < vRTEs.length; i++) {
		updateRTE(vRTEs[i]);
	}
}

function updateRTE(rte) {
	if (!isRichText) return;
	
	//set message value
	var oHdnMessage = document.getElementById('hdn' + rte);
	var oRTE = document.getElementById(rte);
	var readOnly = false;
	
	//check for readOnly mode
	if (document.all) {
		if (frames[rte].document.designMode != "On") readOnly = true;
	} else {
		if (document.getElementById(rte).contentDocument.designMode != "on") readOnly = true;
	}
	
	if (isRichText && !readOnly) {
		//if viewing source, switch back to design view
		if (document.getElementById("chkSrc" + rte).checked) {
			document.getElementById("chkSrc" + rte).checked = false;
			toggleHTMLSrc(rte);
		}
		
		if (oHdnMessage.value == null) oHdnMessage.value = "";
		if (document.all) {
			oHdnMessage.value = frames[rte].document.body.innerHTML;
		} else {
			oHdnMessage.value = oRTE.contentWindow.document.body.innerHTML;
		}
		
		//if there is no content (other than formatting) set value to nothing
		if (stripHTML(oHdnMessage.value.replace("&nbsp;", " ")) == "" 
			&& oHdnMessage.value.toLowerCase().search("<hr") == -1
			&& oHdnMessage.value.toLowerCase().search("<img") == -1) oHdnMessage.value = "";
		//fix for gecko
		if (escape(oHdnMessage.value) == "%3Cbr%3E%0D%0A%0D%0A%0D%0A") oHdnMessage.value = "";
	}
}

function toggleHTMLSrc(rte) {
	// portions contributed by Bob Hutzel
	var oRTE;
	if (document.all) {
		oRTE = frames[rte].document;
	} else {
		oRTE = document.getElementById(rte).contentWindow.document;
	}

	if (document.getElementById("chkSrc" + rte).checked) {
                document.info.style.disabled = true;
                document.info.font.disabled = true;
                document.info.size.disabled = true;
                document.onmouseover = disabledButton;
                document.onmousedown = disabledButton;
                document.onmouseup = disabledButton;
                document.onmouseout = disabledButton;
                document.bold.src='images/bold_d.gif';
                document.italic.src='images/italic_d.gif';
                document.underline.src='images/underline_d.gif';
                document.left_just.src='images/left_just_d.gif';
                document.centre.src='images/centre_d.gif';
                document.right_just.src='images/right_just_d.gif';
                document.justifyfull.src='images/justifyfull_d.gif';
                document.hr.src='images/hr_d.gif';
                document.numbered_list.src='images/numbered_list_d.gif';
                document.list.src='images/list_d.gif';
                document.outdent.src='images/outdent_d.gif';
                document.indent.src='images/indent_d.gif';
                document.textcolor.src='images/textcolor_d.gif';
                document.bgcolor.src='images/bgcolor_d.gif';
                document.hyperlink.src='images/hyperlink_d.gif';
                document.image.src='images/image_d.gif';
                document.smilie.src='images/smilie_d.gif';
                document.eraser.src='images/eraser_d.gif';
		oRTE.body.style.fontFamily = '"Courier New", courier, arial, tahoma';
		oRTE.body.style.fontSize = '9pt';
		if (document.all) {
			oRTE.body.innerText = oRTE.body.innerHTML;
		} else {
			var htmlSrc = oRTE.createTextNode(oRTE.body.innerHTML);
			oRTE.body.innerHTML = "";
			oRTE.body.appendChild(htmlSrc);
		}
	} else {
                document.info.style.disabled = false;
                document.info.font.disabled = false;
                document.info.size.disabled = false;
		document.onmouseover = raiseButton;
		document.onmouseout  = normalButton;
		document.onmousedown = lowerButton;
		document.onmouseup   = raiseButton;
                document.bold.src='images/bold.gif';
                document.italic.src='images/italic.gif';
                document.underline.src='images/underline.gif';
                document.left_just.src='images/left_just.gif';
                document.centre.src='images/centre.gif';
                document.right_just.src='images/right_just.gif';
                document.justifyfull.src='images/justifyfull.gif';
                document.hr.src='images/hr.gif';
                document.numbered_list.src='images/numbered_list.gif';
                document.list.src='images/list.gif';
                document.outdent.src='images/outdent.gif';
                document.indent.src='images/indent.gif';
                document.textcolor.src='images/textcolor.gif';
                document.bgcolor.src='images/bgcolor.gif';
                document.hyperlink.src='images/hyperlink.gif';
                document.image.src='images/image.gif';
                document.smilie.src='images/smilie.gif';
                document.eraser.src='images/eraser.gif';
		oRTE.body.style.fontFamily = 'Times, "Times New Roman", serif;';
		oRTE.body.style.fontSize = '12pt';
		if (document.all) {
			//fix for IE
			var output = escape(oRTE.body.innerText);
			output = output.replace("%3CP%3E%0D%0A%3CHR%3E", "%3CHR%3E");
			output = output.replace("%3CHR%3E%0D%0A%3C/P%3E", "%3CHR%3E");
			oRTE.body.innerHTML = unescape(output);

		} else {
			var htmlSrc = oRTE.body.ownerDocument.createRange();
			htmlSrc.selectNodeContents(oRTE.body);
			oRTE.body.innerHTML = htmlSrc.toString();
			if(oRTE.body.innerHTML == "") { FormatText(rte, "fontname", "Times New Roman"); }
		}
	}
}

function ButtonToggle (rte, command, option) {
	if (command == "bold") {
		if (document.bold.src='images/bold_d.gif') { 
			document.bold.src='images/bold.gif';
			document.italic.src='images/italic_d.gif';}
		else { 
			document.bold.src='images/bold_d.gif';
			document.underline.src='images/underline_d.gif';}
	}
    (command == "italic") ? document.italic.src='images/italic_d.gif':"";
    (command == "underline") ? document.underline.src='images/underline_d.gif':"";
    (command == "justifyleft") ? document.left_just.src='images/left_just_d.gif':"";
    (command == "justifycentre") ? document.centre.src='images/centre_d.gif':"";
    (command == "justifyright") ? document.right_just.src='images/right_just_d.gif':"";
    (command == "justifyfull") ? document.justifyfull.src='images/justifyfull_d.gif':"";
    (command == "inserthorizontalrule") ? document.hr.src='images/hr_d.gif':"";
    (command == "insertorderedlist") ? document.numbered_list.src='images/numbered_list_d.gif':"";
    (command == "insertunorderedlist") ? document.list.src='images/list_d.gif':"";
    (command == "outdent") ? document.outdent.src='images/outdent_d.gif':"";
    (command == "indent") ? document.indent.src='images/indent_d.gif':"";
	FormatText(rte, command, option);
}

//Function to format text in the text box
function FormatText(rte, command, option) {
	var oRTE;
        if (document.info.htmlsource.checked == false) {
	if (document.all) {
		oRTE = frames[rte];
		
		//get current selected range
		var selection = oRTE.document.selection; 
		if (selection != null) {
			rng = selection.createRange();
		}
	} else {
		oRTE = document.getElementById(rte).contentWindow;
		
		//get currently selected range
		var selection = oRTE.getSelection();
		rng = selection.getRangeAt(selection.rangeCount - 1).cloneRange();
	}
	
	try {
		if ((command == "forecolor") || (command == "hilitecolor")) {
			//save current values
			parent.command = command;
			currentRTE = rte;
			
			//position and show color palette
			buttonElement = document.getElementById(command + '_' + rte);
			// Ernst de Moor: Fix the amount of digging parents up, in case the RTE editor itself is displayed in a div.
			document.getElementById('cp' + rte).style.left = getOffsetLeft(buttonElement, 4) + "px";
			document.getElementById('cp' + rte).style.top = (getOffsetTop(buttonElement, 4) + buttonElement.offsetHeight + 4) + "px";
			if (document.getElementById('cp' + rte).style.visibility == "hidden") {
				document.getElementById('cp' + rte).style.visibility = "visible";
				document.getElementById('cp' + rte).style.display = "inline";
			} else {
				document.getElementById('cp' + rte).style.visibility = "hidden";
				document.getElementById('cp' + rte).style.display = "none";
			}
		} else if (command == "createlink") {
			var szURL = prompt("Enter a web address (URL):", "http://");
			try {
				//ignore error for blank urls
				oRTE.document.execCommand("Unlink", false, null);
				oRTE.document.execCommand("CreateLink", false, szURL);
			} catch (e) {
				//do nothing
			}
		} else {
			oRTE.focus();
		  	oRTE.document.execCommand(command, false, option);
			oRTE.focus();
		}
	} catch (e) {
		alert(e);
	}
	}
}

//Function to set color
function setColor(color) {
	var rte = currentRTE;
	var oRTE;
	if (document.all) {
		oRTE = frames[rte];
	} else {
		oRTE = document.getElementById(rte).contentWindow;
	}
	
	var parentCommand = parent.command;
	if (document.all) {
		//retrieve selected range
		var sel = oRTE.document.selection; 
		if (parentCommand == "hilitecolor") parentCommand = "backcolor";
		if (sel != null) {
			var newRng = sel.createRange();
			newRng = rng;
			newRng.select();
		}
	}
	oRTE.focus();
	oRTE.document.execCommand(parentCommand, false, color);
	oRTE.focus();
	document.getElementById('cp' + rte).style.visibility = "hidden";
	document.getElementById('cp' + rte).style.display = "none";
}

//Function to add image
function AddImage(rte) {
	var oRTE;
        if (document.info.htmlsource.checked == false) {
	if (document.all) {
		oRTE = frames[rte];
		
		//get current selected range
		var selection = oRTE.document.selection; 
		if (selection != null) {
			rng = selection.createRange();
		}
	} else {
		oRTE = document.getElementById(rte).contentWindow;
		
		//get currently selected range
		var selection = oRTE.getSelection();
		rng = selection.getRangeAt(selection.rangeCount - 1).cloneRange();
	}
	
	imagePath = prompt('Enter Image URL:', 'http://');				
	if ((imagePath != null) && (imagePath != "")) {
		oRTE.focus();
		oRTE.document.execCommand('InsertImage', false, imagePath);
		oRTE.focus();
	}
	}
}


// Ernst de Moor: Fix the amount of digging parents up, in case the RTE editor itself is displayed in a div.
function getOffsetTop(elm, parents_up) {
	var mOffsetTop = elm.offsetTop;
	var mOffsetParent = elm.offsetParent;
	
	if(!parents_up) {
		parents_up = 10000; // arbitrary big number
	}
	while(parents_up>0 && mOffsetParent) {
		mOffsetTop += mOffsetParent.offsetTop;
		mOffsetParent = mOffsetParent.offsetParent;
		parents_up--;
	}
	
	return mOffsetTop;
}

// Ernst de Moor: Fix the amount of digging parents up, in case the RTE editor itself is displayed in a div.
function getOffsetLeft(elm, parents_up) {
	var mOffsetLeft = elm.offsetLeft;
	var mOffsetParent = elm.offsetParent;
	
	if(!parents_up) {
		parents_up = 10000; // arbitrary big number
	}
	while(parents_up>0 && mOffsetParent) {
		mOffsetLeft += mOffsetParent.offsetLeft;
		mOffsetParent = mOffsetParent.offsetParent;
		parents_up--;
	}
	
	return mOffsetLeft;
}

function Select(rte, selectname) {
	var oRTE;
	if (document.all) {
		oRTE = frames[rte];
		
		//get current selected range
		var selection = oRTE.document.selection; 
		if (selection != null) {
			rng = selection.createRange();
		}
	} else {
		oRTE = document.getElementById(rte).contentWindow;
		
		//get currently selected range
		var selection = oRTE.getSelection();
		rng = selection.getRangeAt(selection.rangeCount - 1).cloneRange();
	}
	
	var idx = document.getElementById(selectname).selectedIndex;
	// First one is always a label
	if (idx != 0) {
		var selected = document.getElementById(selectname).options[idx].value;
		var cmd = selectname.replace('_' + rte, '');
		oRTE.focus();
		oRTE.document.execCommand(cmd, false, selected);
		oRTE.focus();
		document.getElementById(selectname).selectedIndex = 0;
	}
}









// function to clear formatting of selected text
function clearFormatting(rte) {
var oRTE;
if (document.all) {
oRTE = frames[rte];
} else {
oRTE = document.getElementById(rte).contentWindow;
}


oRTE.focus();
oRTE.document.execCommand("RemoveFormat");
oRTE.focus();
}










function kb_handler(evt) {
	var rte = evt.target.id;
	
	//contributed by Anti Veeranna (thanks Anti!)
	if (evt.ctrlKey) {
		var key = String.fromCharCode(evt.charCode).toLowerCase();
		var cmd = '';
		switch (key) {
			case 'b': cmd = "bold"; break;
			case 'i': cmd = "italic"; break;
			case 'u': cmd = "underline"; break;
		};

		if (cmd) {
			FormatText(rte, cmd, true);
			//evt.target.ownerDocument.execCommand(cmd, false, true);
			// stop the event bubble
			evt.preventDefault();
			evt.stopPropagation();
		}
 	}
}

function docChanged (evt) {
	alert('changed');
}

function stripHTML(oldString) {
	var newString = oldString.replace(/(<([^>]+)>)/ig,"");
	
	//replace carriage returns and line feeds
   newString = newString.replace(/\r\n/g," ");
   newString = newString.replace(/\n/g," ");
   newString = newString.replace(/\r/g," ");
	
	//trim string
	newString = trim(newString);
	
	return newString;
}

function trim(inputString) {
   // Removes leading and trailing spaces from the passed string. Also removes
   // consecutive spaces and replaces it with one space. If something besides
   // a string is passed in (null, custom object, etc.) then return the input.
   if (typeof inputString != "string") return inputString;
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
	
   while (ch == " ") { // Check for spaces at the beginning of the string
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   ch = retValue.substring(retValue.length-1, retValue.length);
	
   while (ch == " ") { // Check for spaces at the end of the string
      retValue = retValue.substring(0, retValue.length-1);
      ch = retValue.substring(retValue.length-1, retValue.length);
   }
	
	// Note that there are two spaces in the string - look for multiple spaces within the string
   while (retValue.indexOf("  ") != -1) {
		// Again, there are two spaces in each of the strings
      retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length);
   }
   return retValue; // Return the trimmed string back to the user
}
