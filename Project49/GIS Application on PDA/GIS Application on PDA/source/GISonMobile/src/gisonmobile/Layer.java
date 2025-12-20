package gisonmobile;

//import javax.microedition.lcdui.AlertType;

import org.kxml.kdom.*;

public class Layer
{	
	public int nearestID=-1;
	public int[] nearbyID=null;
	public String layerName="";
	public int layerID=-1;
	public boolean choose = true;
	
	public Layer(Element layer)
	{
		this.layerID = Integer.parseInt(layer.getAttribute("id").getValue());
		this.layerName = layer.getText();
	}
		
};