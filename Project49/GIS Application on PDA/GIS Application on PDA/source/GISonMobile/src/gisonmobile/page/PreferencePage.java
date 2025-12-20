package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;

public class PreferencePage extends Form implements CommandListener
{
	Command saveCommand		 = new Command("Save Option",Command.OK,0);
//	Command okCommand		 = new Command("OK",Command.OK,1);
	Command backCommand		 = new Command("Back",Command.BACK,1);
	ChoiceGroup positionGroup = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup mode = new ChoiceGroup("", ChoiceGroup.POPUP);
	TextField ipServer = new TextField("Server IP",CampusGISMain.instance.ipServer,50,TextField.ANY) ;
	ChoiceGroup saveState = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup showMyPos = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup showContactPos = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup showBusPos = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup loadAnnouncement = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup loadGroup = new ChoiceGroup("", ChoiceGroup.POPUP);
	ChoiceGroup loadUser = new ChoiceGroup("", ChoiceGroup.POPUP);
	
	public PreferencePage()
    {
        super("Campus GIS : Preference");
        
        try {
            jbInit();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    private void jbInit() throws Exception {
        // add the Exit command
        this.addCommand(backCommand);
  //      this.addCommand(okCommand);
        this.addCommand(saveCommand);
		this.setCommandListener(this);
        
		///////////////   Initial Choice Group //////////////////////////
		positionGroup.setLabel("Position");
        positionGroup.append("GPS",null);
        positionGroup.append("Hotspot",null);
        positionGroup.append("Manual",null);
        positionGroup.append("Demon",null);
		mode.setLabel("Mode");
        mode.append("Offline",null);
		mode.append("Online",null);
		saveState.setLabel("Remember State");
		saveState.append("Save",null);
		saveState.append("Not Save",null);
		showMyPos.setLabel("Show My Position");
		showMyPos.append("Yes", null);
		showMyPos.append("No", null);
		showContactPos.setLabel("Show My Contact Position");
		showContactPos.append("Yes", null);
		showContactPos.append("No", null);
		showBusPos.setLabel("Show Bus Position");
		showBusPos.append("Yes", null);
		showBusPos.append("No", null);
		loadAnnouncement.setLabel("Update Announcement");
		loadAnnouncement.append("Yes", null);
		loadAnnouncement.append("No", null);
		loadGroup.setLabel("Update Group");
		loadGroup.append("Yes", null);
		loadGroup.append("No", null);
		loadUser.setLabel("Update User");
		loadUser.append("Yes", null);
		loadUser.append("No", null);
		
		if (CampusGISMain.instance.mode.equals("Offline"))
			mode.setSelectedIndex(0,true);
		else if(CampusGISMain.instance.mode.equals("Online"))
			mode.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.position.equals("GPS"))
			positionGroup.setSelectedIndex(0,true);
		else if (CampusGISMain.instance.position.equals("Hotspot"))
			positionGroup.setSelectedIndex(1,true);
		else if (CampusGISMain.instance.position.equals("Manual"))
			positionGroup.setSelectedIndex(2,true);
		else if (CampusGISMain.instance.position.equals("Demon"))
			positionGroup.setSelectedIndex(3,true);
		
		if (CampusGISMain.instance.saveState != -1)
			saveState.setSelectedIndex(0,true);
		else
			saveState.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.showMyPosition.equals("Yes"))
			showMyPos.setSelectedIndex(0,true);
		else
			showMyPos.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.showContactPosition.equals("Yes"))
			showContactPos.setSelectedIndex(0,true);
		else
			showContactPos.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.showBusPosition.equals("Yes"))
			showBusPos.setSelectedIndex(0,true);
		else
			showBusPos.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.loadAnnouncement.equals("Yes"))
			loadAnnouncement.setSelectedIndex(0,true);
		else
			loadAnnouncement.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.loadGroup.equals("Yes"))
			loadGroup.setSelectedIndex(0,true);
		else
			loadGroup.setSelectedIndex(1,true);
		
		if (CampusGISMain.instance.loadUser.equals("Yes"))
			loadUser.setSelectedIndex(0,true);
		else
			loadUser.setSelectedIndex(1,true);
		////////////////////////////////////////////////////////////////////
		
        this.append(positionGroup);
		this.append(mode);
		this.append(saveState);
		this.append(ipServer);
		this.append(showMyPos);
		this.append(showContactPos);
		this.append(showBusPos);
		this.append(loadAnnouncement);
		this.append(loadGroup);
		this.append(loadUser);
    }

    public void commandAction(Command command, Displayable displayable) {
    //    if (command == okCommand) {
        	
     //   }
         if(command == saveCommand)
        {
        	int tmpMode = 0;
        	if(CampusGISMain.instance.mode.equals("Offline") && mode.getString(mode.getSelectedIndex()).equals("Online"))
				tmpMode = 1;
			else if (CampusGISMain.instance.mode.equals("Online") && mode.getString(mode.getSelectedIndex()).equals("Offline"))
				CampusGISMain.instance.sessionkey = "";
			
        	/////////     set option //////////
        	CampusGISMain.instance.mode = mode.getString(mode.getSelectedIndex());
			
        	CampusGISMain.instance.position = positionGroup.getString(positionGroup.getSelectedIndex());
			
        	CampusGISMain.instance.showMyPosition = showMyPos.getString(showMyPos.getSelectedIndex());
        	
        	CampusGISMain.instance.showContactPosition = showContactPos.getString(showContactPos.getSelectedIndex());
        	
        	CampusGISMain.instance.showBusPosition = showBusPos.getString(showBusPos.getSelectedIndex());
        	
        	CampusGISMain.instance.loadAnnouncement = loadAnnouncement.getString(loadAnnouncement.getSelectedIndex());
        	
        	CampusGISMain.instance.loadGroup = loadGroup.getString(loadGroup.getSelectedIndex());
        	
        	CampusGISMain.instance.loadUser = loadUser.getString(loadUser.getSelectedIndex());
        	
        	if(saveState.getSelectedIndex() == 0)
				CampusGISMain.instance.saveState = 1;
			else
				CampusGISMain.instance.saveState = -1;
			
        	CampusGISMain.instance.ipServer = ipServer.getString();
			/////////////////////////////////////
        	
        	CampusGISMain.instance.location.update();
			
			if(tmpMode == 0)
				CampusGISMain.instance.ShowMainPage();
			else if (tmpMode == 1)
				CampusGISMain.instance.ShowLoginPage();
        	DataRecord.saveOption();
        }
        else if(command == backCommand){
				CampusGISMain.instance.ShowMainPage();
		}
    }

   

}
