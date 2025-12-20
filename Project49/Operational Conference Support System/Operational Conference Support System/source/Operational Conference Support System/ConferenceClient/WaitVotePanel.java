import javax.swing.*;
import java.awt.*;

public class WaitVotePanel extends JPanel {
	private JLabel lblrule;
	private GridBagConstraints gc = new GridBagConstraints();
	private static JLabel lblname = new JLabel("");
	private static JLabel lblstatus = new JLabel("");
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	private JLabel lbx = new JLabel("You are ");
	private JLabel lby = new JLabel(" in the system");
	
	private ImageIcon iconWait;
	private JLabel labelWait;
	
	public WaitVotePanel() {
		try {
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() {
		iconWait = new ImageIcon(WaitVotePanel.class.getResource("wait.png"));
		labelWait = new JLabel(iconWait);
		
		setLayout(new GridBagLayout());
		lblrule = new JLabel("Wait for secretary to create vote");
		lblrule.setFont(new Font("",0,50));
		lblrule.setOpaque(true);
		lblrule.setBackground(Color.ORANGE);
		
		setBackground(Color.WHITE);
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelWait,gc);
	}
	
} // End of class