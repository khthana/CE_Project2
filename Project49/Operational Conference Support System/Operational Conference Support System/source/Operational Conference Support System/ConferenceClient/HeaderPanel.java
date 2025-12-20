import javax.swing.*;
import java.awt.*;

public class HeaderPanel extends JPanel {

  	private JLabel lbllogo;
  	private ImageIcon imagelogo;


  	public HeaderPanel() {
    	try {
      	Init();
    	} catch(Exception e) { e.printStackTrace(); }
  	}
  	public void Init() throws Exception {
    	imagelogo = new ImageIcon(HeaderPanel.class.getResource("head.png"));
    	lbllogo = new JLabel(imagelogo);
    	add(lbllogo);
    	setBackground(Color.WHITE);
  	}

} // End of HeaderPanel class