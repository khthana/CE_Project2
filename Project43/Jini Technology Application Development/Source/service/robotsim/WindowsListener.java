package project.service.robotsim;

import java.awt.event.*;
import net.jini.lookup.*;

class WindowsListener extends WindowAdapter{
	private JoinManager jManager;

	WindowsListener(JoinManager mgr){
		this.jManager = mgr;
	}

	public void windowClosing(WindowEvent e){
		try{ 
			jManager.terminate();
		} catch(Exception ex){
			System.out.println("Can't cancel all leases");
			System.out.println(ex);
		}
		System.exit(0);
	}
}