import java.util.Calendar;
import javax.swing.Timer;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Clock extends JLabel {
	private Timer t;
	public Clock() {
		t = new Timer(1000,new ActionListener() {
      	public void actionPerformed(ActionEvent e) {
         	Calendar now = Calendar.getInstance();
            int h = now.get(Calendar.HOUR_OF_DAY);
            int m = now.get(Calendar.MINUTE);
            int s = now.get(Calendar.SECOND);
            
            setText("Time :: " + h + ":" + m + ":" + s);
        	}
      });
      t.start();  // Start the timer
	} // end of constructor
} // end of class