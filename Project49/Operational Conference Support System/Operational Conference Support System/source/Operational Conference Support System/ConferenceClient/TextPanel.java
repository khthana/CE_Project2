import javax.swing.*;
import java.awt.*;

public class TextPanel extends JPanel {
	private GridBagConstraints gc = new GridBagConstraints();
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	private static JLabel text1 = new JLabel("");
	private static JLabel text2 = new JLabel("");
	
	public TextPanel() {
		try {
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() {
		setLayout(new GridBagLayout());
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,40));
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		
		setBackground(Color.WHITE);
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(text1,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(lb1,gc);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(text2,gc);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(lb2,gc);
	}
	public static void setTextDisplay(String topic1) {
		text1.setText(topic1);
		text1.setFont(new Font("",0,30));
	}
	public  static void setTextDisplay(String topic1 , String topic2) {
		text1.setText(topic1);
		text1.setFont(new Font("",0,30));
		
		text2.setText(topic2);
		text2.setFont(new Font("",0,30));
	}
} // End of class