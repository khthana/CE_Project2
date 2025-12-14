import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;
import java.io.*;

public class OverwriteFrame extends JFrame
{
  OwnerUserInfo   oUserInfo;
  ReceiveFileSeq  rFileSeq;
  File            oFile;

  String filename1  = "";
  String filename2  = "";
  File file1,file2;
  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  ImageIcon sicqIcon    = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  TitledBorder titleRequest = new TitledBorder(defaultBorder, "Confirm Overwrite?");
  JPanel jPanel1        = new JPanel();
  JPanel panelSendMsg   = new JPanel();
  JPanel panelMsg       = new JPanel();
  JButton btNoToAll     = new JButton("No to All");
  JButton btNo          = new JButton("No");
  JButton btYes         = new JButton("Yes");
  JButton btYesToAll    = new JButton("Yes to All");
  JTextArea taMessage   = new JTextArea();
  JLabel  label         = new JLabel(image);
  Component component2;

  public OverwriteFrame(OwnerUserInfo oUserInfo,File oFile,ReceiveFileSeq  rFileSeq)
  {
    this.rFileSeq=rFileSeq;
    this.oFile=oFile;
    this.oUserInfo=oUserInfo;
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
       	closeFrame();
      }
    });
    setSize(new Dimension(410,200));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("Confirm Overwrite Incoming File(s)");
    titleRequest.setTitleFont(defaultFont);
    btNoToAll.setFont(defaultFont);
    btNo.setFont(defaultFont);
    taMessage.setFont(defaultFont);
    btYes.setFont(defaultFont);
    btYesToAll.setFont(defaultFont);
    panelMsg.setBorder(titleRequest);
    btNo.setBorder(defaultBorder);
    btNoToAll.setBorder(defaultBorder);
    taMessage.setBorder(null);
    btYes.setBorder(defaultBorder);
    btYesToAll.setBorder(defaultBorder);
    label.setBorder(defaultBorder);
    titleRequest.setTitleColor(Color.black);
    taMessage.setForeground(Color.black);
    btNo.setForeground(Color.black);
    btNoToAll.setForeground(Color.black);
    btYes.setForeground(Color.black);
    btYesToAll.setForeground(Color.black);
    label.setPreferredSize(new Dimension(45, 45));
    label.setMaximumSize(new Dimension(45, 45));
    label.setMinimumSize(new Dimension(45, 45));
    taMessage.setPreferredSize(new Dimension(120, 45));
    taMessage.setMaximumSize(new Dimension(120, 45));
    taMessage.setMinimumSize(new Dimension(120, 45));
    btNoToAll.setMaximumSize(new Dimension(85, 35));
    btNoToAll.setMinimumSize(new Dimension(85, 30));
    btNoToAll.setPreferredSize(new Dimension(85, 30));
    btNo.setMaximumSize(new Dimension(85, 30));
    btNo.setMinimumSize(new Dimension(85, 30));
    btNo.setPreferredSize(new Dimension(85, 30));
    panelMsg.setMaximumSize(new Dimension(126, 120));
    panelMsg.setMinimumSize(new Dimension(126, 120));
    jPanel1.setMaximumSize(new Dimension(268, 35));
    jPanel1.setMinimumSize(new Dimension(268, 35));
    jPanel1.setPreferredSize(new Dimension(268, 35));
    taMessage.setMargin(new Insets(2, 2, 2, 2));
    btNoToAll.setMargin(new Insets(2, 2, 2, 2));
    btNo.setMargin(new Insets(2, 2, 2, 2));
    btYes.setMargin(new Insets(2, 2, 2, 2));
    btYesToAll.setMargin(new Insets(2, 2, 2, 2));
    taMessage.setEditable(false);
    taMessage.setLineWrap(true);
    taMessage.setWrapStyleWord(true);
    component2 = Box.createVerticalStrut(8);
    taMessage.setAutoscrolls(false);
    taMessage.setBackground(jPanel1.getBackground());
    taMessage.append("Do you want to Replace "+oFile.getName()+"\n");
    panelSendMsg.setLayout(new GridBagLayout());
    panelMsg.setLayout(new GridBagLayout());
    jPanel1.setLayout(new GridBagLayout());
    getContentPane().setLayout(new BorderLayout());
    btYes.setPreferredSize(new Dimension(85, 30));
    btYes.setMinimumSize(new Dimension(85, 30));
    btYes.setMaximumSize(new Dimension(85, 30));
    btYesToAll.setPreferredSize(new Dimension(85, 30));
    btYesToAll.setMinimumSize(new Dimension(85, 30));
    btYesToAll.setMaximumSize(new Dimension(85, 30));
    getContentPane().add(panelSendMsg, BorderLayout.CENTER);
    jPanel1.add(btNo, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(btNoToAll, new GridBagConstraints(4, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 2), 0, 0));
    jPanel1.add(component2, new GridBagConstraints(2, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, -1000, 0, 0), 0, 0));
    jPanel1.add(btYesToAll, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 5, 0, 5), 0, 0));
    jPanel1.add(btYes, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 2, 0, 0), 0, 0));
    panelSendMsg.add(panelMsg, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));
    panelMsg.add(label, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 20, 0, 20), 0, 0));
    panelMsg.add(taMessage, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 20), 0, 0));
    panelSendMsg.add(jPanel1, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));

    btYes.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        rFileSeq.overWriteMode=rFileSeq.c_Yes;
        rFileSeq.resume();
				dispose();
			}
		});
    btYesToAll.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        rFileSeq.overWriteMode=rFileSeq.c_YesToAll;
        rFileSeq.resume();
				dispose();
			}
		});
		btNoToAll.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        rFileSeq.overWriteMode=rFileSeq.c_NoToAll;
        rFileSeq.resume();
				dispose();
			}
		});
		btNo.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        rFileSeq.overWriteMode=rFileSeq.c_No;
        rFileSeq.resume();
				dispose();
			}
		});
  }

  public void setFrameLocation()
  {
    int x, y;
    Dimension screenSize = getToolkit().getScreenSize();
    x = (screenSize.width-getSize().width)/2;
    y = (screenSize.height-getSize().height)/2;//center screen
    setLocation(x,y);

  }

  private void closeFrame()
  {
     rFileSeq.overWriteMode=rFileSeq.c_No;
     rFileSeq.resume();
     dispose();
  }
}
