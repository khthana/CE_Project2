package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;


public class ChooseModePage extends List implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 1);

    public ChooseModePage()
    {
        super("Choose Mode", List.IMPLICIT,
                                new String[] {"Online", "Offline"}, null);
        try {

            jbinit();
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }

    public void jbinit() {
        setSelectCommand(selectCommand);
        setCommandListener(this);
    }

    public void commandAction(Command c, Displayable d) {
        if (c == selectCommand) {
            switch (getSelectedIndex()) {
            case 0:
                CampusGISMain.instance.ShowLoginPage();
                break;
            case 1:
                CampusGISMain.instance.ShowMainPage();
                break;
            default: // do nothing
            }
        }
    }
}
