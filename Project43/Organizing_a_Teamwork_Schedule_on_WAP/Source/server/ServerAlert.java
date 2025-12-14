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

public class ServerAlert extends JFrame implements ActionListener {
    int frameNumber = -1;
    int delay;
    boolean frozen = false;
    JLabel label;
    javax.swing.Timer timer; //Is the priority of this thread too high?
		 //Sometimes I can't interrupt the program easily.
	GregorianCalendar g;

    ServerAlert(int minute, String windowTitle) {
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
		String table_name = "schedule_table";
		String column_2 = "syear";
		String column_3 = "smonth";
		String column_4 = "sdate";
		String column_5 = "hour_time";
		String column_6 = "minute_time";
		String column_7 = "hour_to";
		String column_8 = "minute_to";
		String column_9 = "title";
		String column_10 = "detail";
		String column_11 = "user_name";
		String driverName = "org.gjt.mm.mysql.Driver";
		String connectionURL = "jdbc:mysql://localhost/project_teamworking";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String user_name;
		String title;
		try
		{

			if (rs != null)
			{
				rs.close();
			}
			if (stmt != null)
			{
				stmt.close();
			}
			Class.forName(driverName).newInstance();
			con = DriverManager.getConnection(connectionURL);
			stmt = con.createStatement();
			StringBuffer query = new StringBuffer(100);
			query.append("SELECT  ");
			query.append(column_9);
			query.append(",");
			query.append(column_11);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_2);
			query.append("=");
			query.append(year);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(month+1);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(date);
			query.append(" AND ");
			query.append(column_5);
			query.append("=");
			query.append(tsend.gethour());
			query.append(" AND ");
			query.append(column_6);
			query.append("=");
			query.append(tsend.getminute());
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			System.out.println("--------------Result--------------");
			while (rs.next())
			{
				user_name = rs.getString(column_11);
				title = rs.getString(column_9);
				String Sminute="";
				if (minute == 0)
				{
					Sminute ="00";
				} else Sminute = String.valueOf(minute);
				String massage ="You have schedule "+title+" at "+tsend.gethour()+":"+Sminute;

				System.out.println(user_name+": massage :"+massage);
				sms S = new sms(user_name,massage);
				S.send();
			}
			rs.close();
			stmt.close();
		}
		catch (Exception ee)
		{
			ee.printStackTrace(System.err);
			System.out.println("isSchedule");

		}

		System.out.println(g.getTime());
    }

    public static void main(String args[]) {
        ServerAlert animator = null;
        int fps = 1;
		int minute = 1;
        // Get frames per second from the command line argument
        if (args.length > 0) {
            try {
                fps = Integer.parseInt(args[0]);
            } catch (Exception e) {}
        }

        animator = new ServerAlert(minute, "ServerAlert");
		animator.setSize(300,300);
		animator.getContentPane().setLayout(new GridLayout(1,80));
        animator.pack();
        animator.setVisible(true);
        animator.startAnimation();
    }
}