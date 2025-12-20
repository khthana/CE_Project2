package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;


public class IMPage extends List implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 1);

    public IMPage()
    {
        super("User", List.IMPLICIT,
                                new String[] {"keng","ton","bird",
                                "kai", "pack", "jaroon", "golf"}, null);
        try {

            jbinit();
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }

    public void jbinit() {
        this.setSelectCommand(selectCommand);
        this.addCommand(new Command("Back", Command.BACK, 1));
        this.addCommand(new Command("OK", Command.OK, 2));
        this.setCommandListener(this);

    }

    public void commandAction(Command c, Displayable d) {
        if (c == selectCommand) {
            switch (getSelectedIndex()) {
            case 0:

                break;
            case 1:

                break;
            case 2:

                break;
            case 3:

                break;
            case 4:

                break;
            case 5:

                break;
            case 6:

                break;
            default: // do nothing
            }
        }
        else if (c.getCommandType() == Command.BACK) {
              // stop the MIDlet
              CampusGISMain.instance.ShowMainPage();
        }
        else if(c.getCommandType() == Command.OK)
        {
               CampusGISMain.instance.ShowRunningPage("Connecting");
        }

    }
}
