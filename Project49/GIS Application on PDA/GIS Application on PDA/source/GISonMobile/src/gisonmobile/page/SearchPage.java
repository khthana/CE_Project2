package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;

public class SearchPage extends Form implements CommandListener
{
    private TextField radius = new TextField("", "", 15, TextField.DECIMAL);
    ChoiceGroup searchBy = new ChoiceGroup("", ChoiceGroup.POPUP);
    ChoiceGroup layer = new ChoiceGroup("", ChoiceGroup.POPUP);
    ChoiceGroup searchOption = new ChoiceGroup("", ChoiceGroup.POPUP);
    
    public SearchPage()
    {
        super("Campus GIS : Search");
        try {
            jbInit();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    private void jbInit() throws Exception {
        // add the Exit command
        this.addCommand(new Command("Back", Command.BACK, 1));
        this.addCommand(new Command("Search", Command.OK, 2));
        this.setCommandListener(this);
        this.append(searchBy);
        this.append(layer);
        this.append(searchOption);
        this.append(radius);
        radius.setLabel("Search Radius : ");
        radius.setMaxSize(5);
        radius.setPreferredSize(50, 20);
        
        searchBy.setLabel("Search By");
        searchBy.append("Name", null);
        searchBy.append("Area", null);
        
        layer.setLabel("Layer");
        if(CampusGISMain.instance.layers != null)
        {
        	for(int i=0;i!=CampusGISMain.instance.layers.length;++i)
            {
            	layer.append(CampusGISMain.instance.layers[i].layerName, null);
            }
        }

        searchOption.setLabel("Search Option");
        searchOption.append("Search", null);
        searchOption.append("Search Nearest", null);
        searchOption.append("Search Near By Area", null);
    }

    public void commandAction(Command command, Displayable displayable) {
        if (command.getCommandType() == Command.BACK) {
            // stop the MIDlet
            CampusGISMain.instance.ShowMainPage();
        }
        else if(command.getCommandType() == Command.OK)
        {
            if(searchOption.getSelectedIndex() == 0)
            {
            	
            }
            else if(searchOption.getSelectedIndex() == 1)
            {
            	ConnectService con = new ConnectService();
            	con.searchNearestArea(CampusGISMain.instance.mainpage.posX,CampusGISMain.instance.mainpage.posY ,
            			CampusGISMain.instance.mainpage.width, CampusGISMain.instance.mainpage.height, 
            			""+CampusGISMain.instance.layers[layer.getSelectedIndex()].layerID+"", 
            			CampusGISMain.instance.location.x+"", CampusGISMain.instance.location.y+"");
            }
            else if(searchOption.getSelectedIndex() == 2)
            {
            	ConnectService con = new ConnectService();
            	con.searchNearbyArea(CampusGISMain.instance.mainpage.posX,CampusGISMain.instance.mainpage.posY ,
            			CampusGISMain.instance.mainpage.width, CampusGISMain.instance.mainpage.height, 
            			""+CampusGISMain.instance.layers[layer.getSelectedIndex()].layerID+"", 
            			CampusGISMain.instance.location.x+"", CampusGISMain.instance.location.y+"",radius.getString());
            }
        }
    }

}
