
function overToggle( btnid )
{	
	btn = htmldocument.getElementById(btnid);
	
	if( btn.getAttribute("value") == "unchecked" )
	{
		btn.setAttribute("src", "./picture/gui/greenun.gif");
	}
	else
	{
		btn.setAttribute("src", "./picture/gui/greench.gif");
	}
}

function outToggle( btnid )
{	
	btn = htmldocument.getElementById(btnid);
	
	if( btn.getAttribute("value") == "unchecked" )
	{
		btn.setAttribute("src", "./picture/gui/blueun.gif");
	}
	else
	{
		btn.setAttribute("src", "./picture/gui/bluech.gif");
	}
}

function overSearch( btnid )
{	
	btn = htmldocument.getElementById(btnid);	
	btn.setAttribute("src", "./picture/gui/greengo.png");	
}
function outSearch( btnid )
{	
	btn = htmldocument.getElementById(btnid);	
	btn.setAttribute("src", "./picture/gui/bluego.png");	
}