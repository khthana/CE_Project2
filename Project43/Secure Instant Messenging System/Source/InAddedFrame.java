import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;

public class InAddedFrame extends JFrame
{
 	ContactUserInfo cUserInfo;
  OwnerUserInfo   oUserInfo;
  DataReceive     dReceive;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon sicqIcon    = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  TitledBorder titleTo  = new TitledBorder(defaultBorder, "From");
  TitledBorder titleRequest = new TitledBorder(defaultBorder, "\"You were added\"");
  JPanel jPanel1        = new JPanel();
  JPanel panelSendMsg   = new JPanel();
  JPanel panelMsg       = new JPanel();
  JPanel panelHead      = new JPanel();
  JButton btClose       = new JButton("Close");
  JLabel labelUIN       = new JLabel("ICQ#");
  JLabel labelNick      = new JLabel("NICK:");
  JLabel labelEmail     = new JLabel("E-MAIL:");
  JLabel labelHeadMsg   = new JLabel("The user added you to his/her contact list.");
  JLabel jLabel6        = new JLabel(image);
  JTextField tfUIN      = new JTextField();
  JTextField tfNick     = new JTextField();
  JTextField tfEmail    = new JTextField();
  JTextPane taMessage   = new JTextPane();
  Component component2;

  public InAddedFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo,DataReceive dReceive)
  {
    this.oUserInfo=oUserInfo;
    this.cUserInfo=cUserInfo;
    this.dReceive=dReceive;
    oUserInfo.allFrame.addElement(this);
    try
    {
      jbInit();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

    this.addWindowListener(new WindowAdapter()
    {
     	public void windowClosing(WindowEvent e)
      {
       	dispose();
      }
    });
    setSize(new Dimension(380,250));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("Incoming \"You were added\"");
    titleTo.setTitleFont(defaultFont);
    titleRequest.setTitleFont(defaultFont);
    labelUIN.setFont(defaultFont);
    tfUIN.setFont(defaultFont);
    labelNick.setFont(defaultFont);
    tfNick.setFont(defaultFont);
    labelEmail.setFont(defaultFont);
    tfEmail.setFont(defaultFont);
    btClose.setFont(defaultFont);
    taMessage.setFont(defaultFont);
    labelHeadMsg.setFont(defaultFont);
    panelMsg.setBorder(titleRequest);
    btClose.setBorder(defaultBorder);
    tfUIN.setBorder(defaultBorder);
    tfNick.setBorder(defaultBorder);
    tfEmail.setBorder(defaultBorder);
    taMessage.setBorder(null);
    panelHead.setBorder(titleTo);
    jLabel6.setBorder(defaultBorder);
    titleTo.setTitleColor(Color.black);
    titleRequest.setTitleColor(Color.black);
    labelUIN.setForeground(Color.black);
    labelNick.setForeground(Color.black);
    labelEmail.setForeground(Color.black);
    tfUIN.setForeground(Color.black);
    tfNick.setForeground(Color.black);
    tfEmail.setForeground(Color.black);
    taMessage.setForeground(Color.black);
    labelHeadMsg.setForeground(Color.black);
    tfUIN.setBackground(Color.white);
    tfNick.setBackground(Color.white);
    tfEmail.setBackground(Color.white);
    labelUIN.setMaximumSize(new Dimension(50, 25));
    labelUIN.setMinimumSize(new Dimension(50, 25));
    labelUIN.setPreferredSize(new Dimension(50, 25));
    tfUIN.setMaximumSize(new Dimension(130, 25));
    tfUIN.setMinimumSize(new Dimension(130, 25));
    tfUIN.setPreferredSize(new Dimension(130, 25));
    labelNick.setMaximumSize(new Dimension(50, 25));
    labelNick.setMinimumSize(new Dimension(50, 25));
    labelNick.setPreferredSize(new Dimension(50, 25));
    tfNick.setMaximumSize(new Dimension(100, 25));
    tfNick.setMinimumSize(new Dimension(100, 25));
    tfNick.setPreferredSize(new Dimension(100, 25));
    labelEmail.setMaximumSize(new Dimension(50, 25));
    labelEmail.setMinimumSize(new Dimension(50, 25));
    labelEmail.setPreferredSize(new Dimension(50, 25));
    tfEmail.setMaximumSize(new Dimension(200, 25));
    tfEmail.setMinimumSize(new Dimension(200, 25));
    tfEmail.setPreferredSize(new Dimension(200, 25));
    taMessage.setPreferredSize(new Dimension(80, 80));
    taMessage.setMaximumSize(new Dimension(80, 40));
    taMessage.setMinimumSize(new Dimension(80, 40));
    btClose.setMaximumSize(new Dimension(85, 30));
    btClose.setMinimumSize(new Dimension(85, 30));
    btClose.setPreferredSize(new Dimension(85, 30));
    panelMsg.setMaximumSize(new Dimension(126, 120));
    panelMsg.setMinimumSize(new Dimension(126, 120));
    panelHead.setMaximumSize(new Dimension(126, 85));
    panelHead.setMinimumSize(new Dimension(126, 85));
    panelHead.setPreferredSize(new Dimension(126, 85));
    jPanel1.setMaximumSize(new Dimension(268, 35));
    jPanel1.setMinimumSize(new Dimension(268, 35));
    jPanel1.setPreferredSize(new Dimension(268, 35));
    labelHeadMsg.setAlignmentX((float) 0.5);
    labelHeadMsg.setPreferredSize(new Dimension(250, 25));
    labelHeadMsg.setMinimumSize(new Dimension(250, 25));
    labelHeadMsg.setMaximumSize(new Dimension(250, 25));
    jLabel6.setPreferredSize(new Dimension(50, 30));
    jLabel6.setMinimumSize(new Dimension(50, 30));
    jLabel6.setMaximumSize(new Dimension(50, 30));
    taMessage.setEditable(false);
    tfUIN.setEditable(false);
    tfNick.setEditable(false);
    tfEmail.setEditable(false);
    tfUIN.setSelectionColor(Color.white);
    tfNick.setSelectionColor(Color.white);
    tfEmail.setSelectionColor(Color.white);
    taMessage.setSelectionColor(Color.white);
    tfUIN.setMargin(new Insets(0, 2, 0, 2));
    tfNick.setMargin(new Insets(0, 2, 0, 2));
    tfEmail.setMargin(new Insets(0, 2, 0, 2));
    taMessage.setMargin(new Insets(2, 2, 2, 2));
    btClose.setMargin(new Insets(2, 2, 2, 2));
    component2 = Box.createVerticalStrut(8);
    taMessage.setAutoscrolls(false);
    tfUIN.setText(String.valueOf (cUserInfo.getUIN()));
    tfNick.setText(cUserInfo.getNick());
    tfEmail.setText(cUserInfo.getEmail());
    panelSendMsg.setLayout(new GridBagLayout());
    panelHead.setLayout(new GridBagLayout());
    panelMsg.setLayout(new GridBagLayout());
    jPanel1.setLayout(new GridBagLayout());
    getContentPane().setLayout(new BorderLayout());
    panelHead.add(labelUIN, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 0, 0), 0, 0));
    panelHead.add(tfUIN, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    panelHead.add(labelNick, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 57, 0, 0), 0, 0));
    panelHead.add(tfNick, new GridBagConstraints(3, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 1), 37, 0));
    panelHead.add(labelEmail, new GridBagConstraints(0, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(5, 5, 5, 0), 0, 0));
    panelHead.add(tfEmail, new GridBagConstraints(1, 1, 3, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 1), 124, 0));
    panelMsg.add(labelHeadMsg, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 0), 0, 0));
    panelMsg.add(jLabel6, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 15, 0, 0), 0, 0));
    jPanel1.add(btClose, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(component2, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, -1000, 0, 0), 0, 0));
    panelSendMsg.add(panelHead, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(-5, 0, 0, 0), 0, 0));
    panelSendMsg.add(panelMsg, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 1, 0, 1), 0, 0));
    panelSendMsg.add(jPanel1, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));
    getContentPane().add(panelSendMsg, BorderLayout.CENTER);

		btClose.addActionListener(new ActionListener()
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
