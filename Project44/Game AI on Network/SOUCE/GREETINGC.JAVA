	import java.lang.*;
	import java.awt.*;
	import java.io.*;
	import java.net.*;
   	import java.applet.*;
   	import javax.swing.*;
	
	public class GreetingC extends Applet{
		Button main_button = new Button("Connect server");
		static TextField Loginname = new TextField(20);
		Label  Login = new Label("Login to Network");
		ClientC webMain = null;
		String name;
		Image image;
		public void init(){
//			getContentPane().add(imagePanel);
			add(Login);
			add(Loginname);
			add(main_button);
	//		show();
		}
		
		public void restart(){
			webMain = null;
			main_button.setLabel("Connect again");
			main_button.enable();
			Loginname.enable();
		}
		public synchronized boolean action(Event evt, Object what){
			if (evt.target == main_button){
				main_button.disable();
				Loginname.disable();
				if (Loginname.getText() !=""){
				try{
					
					name = Loginname.getText();
					Socket s = new Socket(getParameter("ServerIP"),5656);
					DataInputStream i = new DataInputStream(s.getInputStream());	
					DataOutputStream o = new DataOutputStream(s.getOutputStream());
					webMain = new ClientC(s, i, o, this);
					
				} catch(IOException e){
					restart();
				}
			}
		}else {
				main_button.enable();
				Loginname.enable();
		}
			return true;
		}
	}
	
