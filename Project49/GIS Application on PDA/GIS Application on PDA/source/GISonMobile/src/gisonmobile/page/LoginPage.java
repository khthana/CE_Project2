package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;

public class LoginPage extends Form implements CommandListener
{
    private TextField textField1 = new TextField("", "", 15, TextField.ANY);
    private TextField textField2 = new TextField("", "", 15, TextField.ANY);
    StringItem stringItem1 = new StringItem("", "");

    public LoginPage()
    {
        super("Campus GIS : Login");
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
        this.addCommand(new Command("OK", Command.OK, 2));
        this.addCommand(new Command("Sign Up",Command.HELP,3));
        this.setCommandListener(this);
        this.append(textField1);
        this.append(textField2);
        this.append(stringItem1);
        textField1.setLabel("Username   ");
        textField1.setMaxSize(30);
        textField1.setPreferredSize(50, 20);
        textField2.setLabel("Password   ");
        textField2.setMaxSize(30);
        textField2.setPreferredSize(50, 20);
        textField1.setString(CampusGISMain.instance.profile.username);
        textField2.setString(CampusGISMain.instance.profile.password);
   //     textField2.setConstraints(TextField.PASSWORD);
        stringItem1.setText(
                "If you don\'t have account,please signup to give your information");
        stringItem1.setPreferredSize(200, 29);
        stringItem1.setFont(Font.getFont(Font.FACE_SYSTEM, Font.STYLE_ITALIC , Font.SIZE_SMALL));
    }

    public void commandAction(Command command, Displayable displayable) {
        if (command.getCommandType() == Command.BACK) {
            // stop the MIDlet
            CampusGISMain.instance.ShowChooseModePage();
        }
        else if(command.getCommandType() == Command.OK)
        {
            ConnectService con = new ConnectService();
            con.login(textField1.getString(),textField2.getString());
        }
        else if(command.getCommandType() == Command.HELP )
        {
            CampusGISMain.instance.ShowSignupPage();
        }

    }

}
