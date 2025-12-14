import java.awt.*;

import java.awt.event.*;
import java.applet.*;

public class LobbyRoom extends Frame {

  Label LName = new Label();
  Button BQuit = new Button();
  List LsRoom = new List();
  Button BJoin = new Button();
  TextField TaMessage = new TextField();
  TextField TfWho = new TextField();
  Button BSend = new Button();
  Label LRoom = new Label();
  List list2 = new List();
  TextArea TaChat = new TextArea();
  Label LChat = new Label();
  Label LUser = new Label();
  Label LMessage = new Label();
  Label Lwho = new Label();
  ClientC you;	
 	int room=-1;
  public LobbyRoom(ClientC c) {
    try {
       you = c;
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  
  private void jbInit() throws Exception {
  	setLayout(null);
    LName.setText("NAME : XXXXXXXX");
    BQuit.setLabel("QUIT");
    BJoin.setLabel("JOIN GAME");
    BSend.setLabel("Send Message");
    LRoom.setText("Detail of each room");
    TaChat.appendText("ver 1.0");
    LChat.setText("Chat Message");
    LUser.setText("ALL User");
    LMessage.setText("Message");
    Lwho.setText("Send to(Option)");
    add(LName);
    LName.setBounds(13, 35, 100, 22);
    add(LsRoom);LsRoom.setBounds(13, 72, 367, 83);
    for (int i=0;i<=5;i++){
    	LsRoom.addItem(setTable(i));
    }
    
    add(LRoom);LRoom.setBounds(15, 52, 100, 22);
    add(TaMessage);TaMessage.setBounds(12, 275, 175, 22);
    add(TfWho);TfWho.setBounds(196, 275, 58, 22);
    add(BSend);BSend.setBounds(290, 271, 100, 22);
    add(list2);list2.setBounds(302, 176, 74, 77);
    add(TaChat);TaChat.setBounds(15, 178, 261, 75);
    add(LChat);LChat.setBounds(15, 161, 100, 22);
    add(LUser);LUser.setBounds(301, 157, 100, 22);
    add(LMessage);LMessage.setBounds(13, 259, 100, 22);
    add(Lwho);Lwho.setBounds(197, 257, 100, 22);
    add(BJoin);BJoin.setBounds(297, 39, 80, 22);
    add(BQuit);BQuit.setBounds(233, 39, 60, 22);
    LName.setText("NAME : "+you.myNAME);
    setSize(400,320);
    show();
  }
/*  public static void main(String arg[]){
  LobbyRoom x= new LobbyRoom();
  }*/
 	void UpdateGameRoom(){
 		LsRoom.removeAll();
 		for(int i=0;i<6;i++)
 			LsRoom.addItem(setTable(i));
 	}
public String setTable(int index){
	String returnS="Room "+index+" >> ";
	for(int i=0;i<4;i++)
	if (you.g_tables[index].players[i]!=null)
		returnS = returnS+i+") "+you.g_tables[index].players[i].name+". " ;
	return returnS;
}
public synchronized boolean action(Event evt,Object what){
	
			if (evt.target == BQuit){	
				you.output(Packet.CPQuit());
				
			}
			if (evt.target == BSend){
				if (TfWho.getText().equals("")){
				you.output(Packet.CPMessage(TaMessage.getText()));
				}else{			
				int id = you.findId(TfWho.getText());
				if (id != -1){
				you.output(Packet.MSG2CP(id,TaMessage.getText()));
				}else {
					TaChat.setForeground(Color.red);
					TaChat.appendText(TfWho.getText()+" is not valid user!!\n");
					TaChat.setForeground(Color.black);
				}
				}
			}
			if (evt.target == BJoin){
				
				if (room !=-1){
				you.output(Packet.CPJoinTable(room));
				}else{
					TaChat.appendText("Please select room first\n");
				}
			}
			if (evt.target == LsRoom){
			
				room = LsRoom.getSelectedIndex();
			
			}
			if (evt.target == list2){
			
				TfWho.setText(list2.getSelectedItem());
			
			}		
			
			
			return true;
		}
}
