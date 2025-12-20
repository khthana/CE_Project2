package gisonmobile;

//import javax.microedition.lcdui.AlertType;

import org.kxml.kdom.*;

public class ObjectElement
{	
	public final static int LOAD_CONTACT=333;
	public final static int LOAD_RECORD=222;
	public final static int LOAD_BUS=111;
	public final static int USER=0;
	public final static int BUS=1;
	public int type,id,objectid;
	public double posx[]=null;
	public double posy[]=null;
	public long time[]=null;
	public String label;
	
	public ObjectElement(Element element)
	{ 
		this.id = Integer.parseInt(element.getAttribute("id").getValue());
		this.objectid =  Integer.parseInt(element.getAttribute("objectid").getValue());
		this.type =  Integer.parseInt(element.getAttribute("type").getValue());
		this.label =  element.getAttribute("label").getValue();
		
		int count = element.getChildCount();
		
		this.posx = new double[count/2];
		this.posy = new double[count/2];
		this.time = new long[count/2];
		System.out.println(count/2);
		for(int i=1;i!=count;i+=2)
		{
			Node position = (Node)element.getChild(i);
			
			this.posx[i/2] = Double.parseDouble(((Node)position.getChild(1)).getText());
			this.posy[i/2] = Double.parseDouble(((Node)position.getChild(3)).getText());
			this.time[i/2] = Long.parseLong(((Node)position.getChild(5)).getText());
		}
	}
		
};