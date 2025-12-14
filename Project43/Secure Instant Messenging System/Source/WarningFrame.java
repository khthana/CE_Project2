import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.util.*;

public class WarningFrame extends JFrame
{
  String warnMsg        = "";
  String warnMsg2       = "";
  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
	JPanel jPanel1        = new JPanel();
  JPanel jPanel3        = new JPanel();
  JPanel jPanel2        = new JPanel();
  JButton okBt          = new JButton("OK");
	JLabel labelWarning   = new JLabel(image);
  JLabel labelWarningMsg = new JLabel("Warning Message");
  JLabel labelWarningMsg2= new JLabel("");

  public WarningFrame(String warnMsg)
  {
    this.warnMsg = warnMsg;
    try
    {
      jbInit();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  	addWindowListener(new WindowAdapter()
	  {
		  public void windowClosing(WindowEvent e)
		  {
			  dispose();
		  }
	  });
    setSize(new Dimension(275,150));
    setFrameLocation();
	  setResizable(false);
    setVisible(true);
  }

  public WarningFrame(String warnMsg, String warnMsg2)
  {
    this.warnMsg = warnMsg;
    this.warnMsg2 = warnMsg2;
    try
    {
      jbInit();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  	addWindowListener(new WindowAdapter()
	  {
		  public void windowClosing(WindowEvent e)
		  {
			  dispose();
		  }
	  });
    setSize(new Dimension(275,150));
    setFrameLocation();
	  setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("Warning Message");
    labelWarningMsg.setText(warnMsg);
    labelWarningMsg2.setText(warnMsg2);
    okBt.setFont(defaultFont);
		labelWarning.setFont(defaultFont);
    labelWarningMsg.setFont(defaultFont);
    labelWarningMsg2.setFont(defaultFont);
    okBt.setBorder(defaultBorder);
    jPanel3.setBorder(defaultBorder);
    labelWarning.setBorder(defaultBorder);
		okBt.setForeground(Color.black);
		labelWarning.setForeground(Color.black);
    labelWarningMsg.setForeground(Color.black);
    labelWarningMsg2.setForeground(Color.black);
    labelWarning.setMaximumSize(new Dimension(30, 30));
    labelWarning.setMinimumSize(new Dimension(30, 30));
    labelWarning.setPreferredSize(new Dimension(30, 30));
    okBt.setMaximumSize(new Dimension(80, 30));
    okBt.setMinimumSize(new Dimension(80, 30));
		okBt.setPreferredSize(new Dimension(80, 30));
    labelWarningMsg.setPreferredSize(new Dimension(180, 25));
    labelWarningMsg.setMinimumSize(new Dimension(180, 25));
    labelWarningMsg.setMaximumSize(new Dimension(180, 25));
    labelWarningMsg2.setPreferredSize(new Dimension(180, 25));
    labelWarningMsg2.setMinimumSize(new Dimension(180, 25));
    labelWarningMsg2.setMaximumSize(new Dimension(180, 25));
    okBt.setMargin(new Insets(2, 2, 2, 2));
		jPanel1.setLayout(new GridBagLayout());
		jPanel2.setLayout(new GridBagLayout());
		jPanel3.setLayout(new GridBagLayout());
		getContentPane().setLayout(new BorderLayout());
    this.getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(jPanel3, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    jPanel3.add(labelWarning, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTHWEST, GridBagConstraints.NONE, new Insets(25, 10, 10, 10), 0, 0));
    jPanel3.add(labelWarningMsg, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(-10, 0, 0, 10), 0, 0));
    jPanel3.add(labelWarningMsg2, new GridBagConstraints(1, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.NONE, new Insets(-35, 0, 10, 10), 0, 0));
    jPanel1.add(jPanel2, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    jPanel2.add(okBt, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(5, 0, 5, 0), 0, 0));

    okBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
           dispose();
      }
    });

  }

  public void setFrameLocation()
  {
    int x, y;
    Dimension screenSize = getToolkit().getScreenSize();
    x = (screenSize.width-getSize().width)/2;
    y = (screenSize.height-getSize().height)/2;
    setLocation(x,y);
  }

}
