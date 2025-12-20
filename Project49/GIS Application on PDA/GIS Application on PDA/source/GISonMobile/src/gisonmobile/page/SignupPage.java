package gisonmobile.page;

import gisonmobile.*;
import javax.microedition.lcdui.*;

public class SignupPage extends Form implements CommandListener
{

    public SignupPage()
    {
        super("Campus GIS : Sign Up");
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
        this.addCommand(new Command("Submit", Command.OK, 2));

        this.setCommandListener(this);
        this.append(name);
        this.append(surname);
        this.append(faculty);
        this.append(major);
        this.append(email);
        this.append(type);
        this.append(year);
        this.append(phone);
        this.append(studentid);
        this.append(username);
        this.append(password);

        name.setLabel("ชื่อ");
        name.setMaxSize(50);
        surname.setLabel("นามสกุล");
        surname.setMaxSize(50);
        type.setLabel("ตำแหน่ง");
        type.append("นักศึกษา",null);
        type.append("อาจารย์",null);
        year.setLabel("ชั้นปี");
        year.setMaxSize(2);
        faculty.setLabel("คณะ");
        faculty.setMaxSize(50);
        major.setLabel("ภาควิชา");
        major.setMaxSize(50);
        phone.setLabel("เบอร์โทรศัพท์");
        phone.setMaxSize(12);
        email.setLabel("อีเมลล์");
        email.setMaxSize(50);
        studentid.setLabel("รหัสนักศึกษา");
        studentid.setMaxSize(10);
        username.setLabel("ชื่อผู้ใช้");
        username.setMaxSize(10);
        password.setLabel("รหัสผ่าน");
        password.setMaxSize(10);

    }

    public void commandAction(Command command, Displayable displayable) {
        if (command.getCommandType() == Command.BACK) {

            CampusGISMain.instance.ShowLoginPage();
        }
        else if (command.getCommandType() == Command.OK) {
            String tmp;
            if (type.getSelectedIndex() == 0)
                tmp = "student";
            else if(type.getSelectedIndex() == 1)
                tmp = "teacher";
            else
                tmp = "";

            ConnectService con = new ConnectService();
            con.signup(tmp,name.getString(),surname.getString(),year.getString(),faculty.getString(),major.getString(),phone.getString(),email.getString(),studentid.getString(),username.getString(),password.getString());
        }
    }

    TextField name = new TextField("", "", 30, TextField.ANY);
    TextField surname = new TextField("", "", 30, TextField.ANY);
    ChoiceGroup type = new ChoiceGroup("", ChoiceGroup.EXCLUSIVE );
    TextField year = new TextField("", "", 15, TextField.DECIMAL );
    TextField faculty = new TextField("", "", 15, TextField.ANY);
    TextField major = new TextField("", "", 15, TextField.ANY);
    TextField phone = new TextField("", "", 15, TextField.PHONENUMBER);
    TextField email = new TextField("", "", 15, TextField.EMAILADDR);
    TextField studentid = new TextField("", "", 15, TextField.NUMERIC);
    TextField username = new TextField("", "", 15, TextField.ANY);
    TextField password = new TextField("", "", 15, TextField.PASSWORD);
}
