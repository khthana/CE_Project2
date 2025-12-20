import javax.swing.*;
import java.awt.*;

public class HelpSwotPanel extends JPanel {
	private JPanel upperPanel = new JPanel(); 
	private JPanel centerPanel = new JPanel();
	private JPanel lowerPanel = new JPanel();
		
	private JLabel bS,bW,bO,bT;
	private ImageIcon icobS,icobW,icobO,icobT; // picture menu icon
	
	public HelpSwotPanel() {
		try {
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() { 
		icobS = new ImageIcon(HelpSwotPanel.class.getResource("SButtonWithDetail.png"));
		icobW = new ImageIcon(HelpSwotPanel.class.getResource("WButtonWithDetail.png"));
		icobO = new ImageIcon(HelpSwotPanel.class.getResource("OButtonWithDetail.png"));
		icobT = new ImageIcon(HelpSwotPanel.class.getResource("TButtonWithDetail.png"));
		
		bS = new JLabel(icobS); 
		bW = new JLabel(icobW); 
		bO = new JLabel(icobO);
		bT = new JLabel(icobT); 
		
		upperPanel.add(bS); //menupanel.add(ld);
    	upperPanel.add(bW);
    	centerPanel.add(bO);
    	centerPanel.add(bT);
		
		setLayout(new BorderLayout());
    	add(upperPanel,BorderLayout.NORTH);
    	add(centerPanel,BorderLayout.CENTER);		
		add(lowerPanel,BorderLayout.SOUTH);
	}
} // End of class