import javax.swing.*;
import java.awt.*;

public class RulePanel extends JPanel {
	private JLabel lblrule;
	private GridBagConstraints gc = new GridBagConstraints();
	private static JLabel lblname = new JLabel("");
	private static JLabel lblstatus = new JLabel("");
	private JLabel lb1 = new JLabel("1");
	private JLabel lb2 = new JLabel("1");
	private JLabel lbx = new JLabel("คุณคือ ");
	private JLabel lby = new JLabel(" ในที่ประชุม");
	
	public RulePanel() {
		try {
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() {
		setLayout(new GridBagLayout());
		lblrule = new JLabel("ยินดีต้อนรับสู่ระบบสนับสนุนการประชุมเชิงปฏิบัติการ");
		lblrule.setFont(new Font("",0,30));
		lblrule.setForeground(Color.BLUE);
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,40));
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		lbx.setFont(new Font("",0,30));
		lby.setFont(new Font("",0,30));
		
		setBackground(Color.WHITE);
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(lblrule,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(lb1,gc);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(lblname,gc);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(lb2,gc);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		add(lblstatus,gc);
	}
	
	public static void setWelcome(String name,String stat) {
		lblname.setText(name);
		lblname.setFont(new Font("",0,50));
	//	lblname.setForeground(Color.BLUE);
		
		lblstatus.setText("คุณคือ " + stat + " ในที่ประชุม");
		lblstatus.setForeground(Color.BLUE);
		lblstatus.setFont(new Font("",0,40));
	}
}	 // End of class