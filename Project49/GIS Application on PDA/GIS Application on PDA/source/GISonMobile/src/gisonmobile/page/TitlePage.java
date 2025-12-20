package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;

public class TitlePage extends Canvas //implements CommandListener
{
    private Image img;
   // Command ok = new Command("Skip",Command.OK,0);

	public TitlePage()
    {
        
    //   this.addCommand(ok);
	//   this.setCommandListener(this);
        try
        {
              img = Image.createImage("/logo/title.png");
        }
        catch (java.io.IOException e) 
		{
	//		CampusGISMain.instance.ShowAlertPage("Error load image",e.getMessage());
		}
		repaint();
		
    }

    public void paint(Graphics g) {
              int h = getHeight();
              int w = getWidth();
              g.drawImage(img, w / 2, h / 2,
                          Graphics.VCENTER | Graphics.HCENTER);
    }
 /*
    public void commandAction(Command command, Displayable displayable)
    {
        if (command  == ok)
		{
			//////  get data to preference  //////////
        	
        	
           
        }
    }
*/
}

