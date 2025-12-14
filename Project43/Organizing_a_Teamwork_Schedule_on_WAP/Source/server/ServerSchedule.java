/*
 * 1.1 Swing version.
 */
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
import java.sql.*;
/* 
 * Based on Arthur van Hoff's animation examples, this application
 * can serve as a template for all animation applications.
 */

public class ServerSchedule extends JFrame implements ActionListener {
    int frameNumber = -1;
    int delay;
    boolean frozen = false;
    JLabel label;
    javax.swing.Timer timer; //Is the priority of this thread too high?
		 //Sometimes I can't interrupt the program easily.
	GregorianCalendar g;

    ServerSchedule(int minute, String windowTitle) {
        super(windowTitle);
        //delay = (fps > 0) ? (1000 / fps) : 100;
		delay = minute*60*1000;
        //Set up a timer that calls this object's action handler.
        timer = new javax.swing.Timer(delay, this);
        timer.setInitialDelay(0);
        timer.setCoalesce(true);
        addWindowListener(new WindowAdapter() {
            public void windowIconified(WindowEvent e) {
                stopAnimation();
            }
            public void windowDeiconified(WindowEvent e) {
                startAnimation();
            }
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }  
        });

        Container contentPane = getContentPane();
        contentPane.addMouseListener(new MouseAdapter() {
            public void mousePressed(MouseEvent e) {
                if (frozen) {
                    frozen = false;
                    startAnimation();
                } else {
                    frozen = true;
                    stopAnimation();
                }
            }
        });
	label = new JLabel("Frame       ", JLabel.CENTER);
	contentPane.add("Center", label);
    }

    public void startAnimation() {
        if (frozen) {
            //Do nothing.  The user has requested that we
            //stop changing the image.
        } else {
            //Start (or restart) animating!
            timer.start();
        }
    }

    public void stopAnimation() {
        //Stop the animating thread.
        timer.stop();
    }

    public void actionPerformed(ActionEvent e) {
        //Advance the animation frame.
		g  = new GregorianCalendar();
		frameNumber++;
        //label.setText("Frame " + frameNumber+" Time "+g.getTime());
        label.setText("Time "+g.getTime());
		int year = g.get(Calendar.YEAR);
		int month = g.get(Calendar.MONTH);
		int date = g.get(Calendar.DATE);
		int hour = g.get(Calendar.HOUR);
		int minute = g.get(Calendar.MINUTE);
		timers tsend = new timers(hour,minute);
		timers tadd = new timers(0,5);
		tsend.addtime(tadd);
		if (g.get(Calendar.AM_PM) == 1)
		{
			tadd = new timers(12,0);
			tsend.addtime(tadd);
		}
		schedule s = new schedule(year,month,date);
		s.delete();
		tschedule ts = new tschedule(year,month,date);
		ts.delete();
		reschedule res = new reschedule(year,month,date);
		res.delete();
		System.out.println(g.getTime());
    }

    public static void main(String args[]) {
        ServerSchedule animator = null;
        int fps = 1;
		int minute = 1440;
        // Get frames per second from the command line argument
        if (args.length > 0) {
            try {
                fps = Integer.parseInt(args[0]);
            } catch (Exception e) {}
        }

        animator = new ServerSchedule(minute, "ServerSchedule");
		animator.setSize(300,300);
		animator.getContentPane().setLayout(new GridLayout(1,80));
        animator.pack();
        animator.setVisible(true);
        animator.startAnimation();
    }
}