import java.util.*;
import javax.swing.JTabbedPane;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import java.awt.*;
import java.awt.event.*;

public class TabbedObd extends JPanel {
    
	static public Component panel2 ;//= /*showSensors();//*/makeTextPanel("Sensors");
	static public Component panel1 ;

	public TabbedObd() { 


		ImageIcon icon = new ImageIcon("Bullet.gif");
		JTabbedPane tabbedPane = new JTabbedPane();

        Component  panel1 = makeTextPanel("Dash");
        tabbedPane.addTab("Dash", icon, panel1, "Display Dash board");
        tabbedPane.setSelectedIndex(0);

		panel2 = /*showSensors();//*/makeTextPanel("Sensors");
		        
        tabbedPane.addTab("Sensors", icon, panel2, "Display Sensors");

        Component panel3 = makeTextPanel("Graphs");
        tabbedPane.addTab("Graphs", icon, panel3, "Display Graphs");

        Component panel4 = makeTextPanel("Diagnostic Code");
        tabbedPane.addTab("OBD II Diagnostic Code", icon, panel4, "Display OBD II Diagnostic Code");

		Component panel5 = makeTextPanel("Recordings");
		tabbedPane.addTab("Recordings", icon, panel5, "Display Recordings");

		Component panel6 = makeTextPanel("Fuel Table");
		tabbedPane.addTab("Fuel Table", icon, panel6, "Display Fuel Rom Code");

		Component panel7 = makeTextPanel("Ignition Table");
		tabbedPane.addTab("Ignition Table", icon, panel7, "Display Ignition Rom Code");

		
        setLayout(new GridLayout(1, 1)); 
		add(tabbedPane);
    }
	
	public TabbedObd(VJTable table ) { 

		ImageIcon icon = new ImageIcon("Bullet.gif");
		JTabbedPane tabbedPane = new JTabbedPane();

        Component  panel1 = makeTextPanel("Dash");
        tabbedPane.addTab("Dash", icon, panel1, "Display Dash board");
        tabbedPane.setSelectedIndex(0);

		panel2 = /*showSensors();//*/makeTablePanel("Sensors",table);
		        
        tabbedPane.addTab("Sensors", icon, panel2, "Display Sensors");

        Component panel3 = makeTextPanel("Graphs");
        tabbedPane.addTab("Graphs", icon, panel3, "Display Graphs");

        Component panel4 = makeTextPanel("Diagnostic Code");
        tabbedPane.addTab("OBD II Diagnostic Code", icon, panel4, "Display OBD II Diagnostic Code");

		Component panel5 = makeTextPanel("Recordings");
		tabbedPane.addTab("Recordings", icon, panel5, "Display Recordings");

		Component panel6 = makeTextPanel("Rom Code");
		tabbedPane.addTab("Rom Code", icon, panel6, "Display Ecu Rom Code");

        setLayout(new GridLayout(1, 1)); 
		add(tabbedPane);
    }

	public TabbedObd(Component AllMeter, CJTable table,VJTable table2, VJTable table3 ,
												CJTable table4) { 

		ImageIcon icon = new ImageIcon("Bullet.gif");
		JTabbedPane tabbedPane = new JTabbedPane();

		Component panel1 = AllMeter;
		tabbedPane.addTab("Meter", icon, panel1, "Display Meter");

		panel2 = /*showSensors();//*/makeTablePanel("Sensors",table);
		        
        tabbedPane.addTab("Sensors", icon, panel2, "Display Sensors");


		Component panel4 = makeTablePanel("Diagnostic Code",table4);
        tabbedPane.addTab("OBD II Diagnostic Code", icon, panel4, "Display OBD II Diagnostic Code");

		Component panel6 = makeTablePanel("Fuel Table",table2);
		tabbedPane.addTab("Fuel Table", icon, panel6, "Display Fuel Rom Code");

		Component panel7 = makeTablePanel("Ignition Table",table3);
		tabbedPane.addTab("Ignition Table", icon, panel7, "Display Ignition Rom Code");
		
        setLayout(new GridLayout(1, 1)); 
		add(tabbedPane);
    }

	protected Component makeTextPanel(String text) {
        JPanel panel = new JPanel(false);
        JLabel filler = new JLabel(text);
        filler.setHorizontalAlignment(JLabel.CENTER);
		panel.setLayout(new GridLayout(1, 1));
        panel.add(filler);
        return panel;
    }

	protected Component makeDashPanel(JPanel dash) {
        return dash;
    }

    protected Component makeTablePanel(String text, VJTable table) {
        JPanel panel = new JPanel(false);
		JLabel filler = new JLabel(text);
        JLabel filler2 = new JLabel("OBD II ");

		JScrollPane scrollPane = new JScrollPane(table);
		filler.setHorizontalAlignment(JLabel.LEFT);
        filler2.setHorizontalAlignment(JLabel.LEFT);

		panel.setLayout(new BorderLayout() );
		panel.add(filler, BorderLayout.NORTH);
		panel.add(scrollPane, BorderLayout.CENTER);
		panel.add(filler2, BorderLayout.SOUTH);

		return panel;
    }

	protected Component makeTablePanel(String text, CJTable table) {
        JPanel panel = new JPanel(false);
		JLabel filler = new JLabel(text);
        JLabel filler2 = new JLabel("OBD II ");

		JScrollPane scrollPane = new JScrollPane(table);
		filler.setHorizontalAlignment(JLabel.LEFT);
        filler2.setHorizontalAlignment(JLabel.LEFT);

		panel.setLayout(new BorderLayout() );
		panel.add(filler, BorderLayout.NORTH);
		panel.add(scrollPane, BorderLayout.CENTER);
		panel.add(filler2, BorderLayout.SOUTH);

		return panel;
    }


	protected Component makeTablePanel(String text,Object [][] data, String [] column) {
        JPanel panel = new JPanel(false);
        JLabel filler = new JLabel(text);
        filler.setHorizontalAlignment(JLabel.CENTER);
		VJTable t1 = new VJTable (data, column);
		panel.setLayout(new GridLayout(1, 2));
		panel.add(t1);
        return panel;
    }

}

