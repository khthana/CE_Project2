package gisonmobile;

//import javax.microedition.lcdui.AlertType;

import org.kxml.kdom.*;

public class MyContactElement extends ObjectElement
{	
	
	public MyContactElement(Element element)
	{
		super(element);
	}
	
	public double getPosX()
	{
		if(posx!=null)
			return posx[posx.length-1];
		else
			return -1; 
	}
	
	public double getPosY()
	{
		if(posy!=null)
			return posy[posy.length-1];
		else
			return -1; 
	}
		
};