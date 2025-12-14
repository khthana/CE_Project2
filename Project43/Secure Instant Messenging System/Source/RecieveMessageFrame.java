import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;

public class RecieveMessageFrame extends JFrame
{
 	ContactUserInfo cUserInfo;
  OwnerUserInfo   oUserInfo;
  DataReceive     dReceive;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  ImageIcon sicqIcon    = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  TitledBorder titleFrom= new TitledBorder(defaultBorder, "From");
  JPanel jPanel1        = new JPanel();
  JPanel panelSendMsg   = new JPanel();
  JPanel panelMsg       = new JPanel();
  JPanel panelHead      = new JPanel();
  JButton btReply       = new JButton("Reply");
  JButton btClose       = new JButton("Close");
  JButton btReadNext    = new JButton("ReadNext - xx");
  JLabel labelUIN       = new JLabel("ICQ#");
  JLabel labelNick      = new JLabel("NICK:");
  JLabel labelEmail     = new JLabel("E-MAIL:");
  JLabel labelHead      = new JLabel("Message");
  JLabel jLabel5        = new JLabel(image);
  JTextField tfUIN      = new JTextField();
  JTextField tfNick     = new JTextField();
  JTextField tfEmail    = new JTextField();
  JTextPane taMessage   = new JTextPane();
  JScrollPane jScrollPane1 = new JScrollPane(taMessage);
  Component component2;

  public RecieveMessageFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo,DataReceive dReceive)
  {
    this.oUserInfo=oUserInfo;
    this.cUserInfo =cUserInfo;
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
        closeFrame();
      }
    });
    setSize(new Dimension(410,260));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("Incoming Message");
    titleFrom.setTitleFont(defaultFont);
    labelUIN.setFont(defaultFont);
    tfUIN.setFont(defaultFont);
    labelNick.setFont(defaultFont);
    tfNick.setFont(defaultFont);
    labelEmail.setFont(defaultFont);
    tfEmail.setFont(defaultFont);
    btReply.setFont(defaultFont);
    btClose.setFont(defaultFont);
    taMessage.setFont(defaultFont);
    jScrollPane1.setFont(defaultFont);
    labelHead.setFont(defaultFont);
    btReadNext.setFont(defaultFont);
    panelMsg.setBorder(defaultBorder);
    btClose.setBorder(defaultBorder);
    btReply.setBorder(defaultBorder);
    tfUIN.setBorder(defaultBorder);
    tfNick.setBorder(defaultBorder);
    tfEmail.setBorder(defaultBorder);
    taMessage.setBorder(null);
    panelHead.setBorder(titleFrom);
    jScrollPane1.setBorder(defaultBorder);
    jLabel5.setBorder(defaultBorder);
    btReadNext.setBorder(defaultBorder);
    titleFrom.setTitleColor(Color.black);
    labelUIN.setForeground(Color.black);
    labelNick.setForeground(Color.black);
    labelEmail.setForeground(Color.black);
    labelHead.setForeground(Color.black);
    tfUIN.setForeground(Color.black);
    tfNick.setForeground(Color.black);
    tfEmail.setForeground(Color.black);
    taMessage.setForeground(Color.black);
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
    labelHead.setMaximumSize(new Dimension(120, 25));
    labelHead.setMinimumSize(new Dimension(120, 25));
    labelHead.setPreferredSize(new Dimension(120, 25));
    taMessage.setPreferredSize(new Dimension(80, 80));
    taMessage.setMaximumSize(new Dimension(80, 40));
    taMessage.setMinimumSize(new Dimension(80, 40));
    btReply.setMaximumSize(new Dimension(85, 30));
    btReply.setMinimumSize(new Dimension(85, 30));
    btReply.setPreferredSize(new Dimension(85, 30));
    btClose.setMaximumSize(new Dimension(85, 30));
    btClose.setMinimumSize(new Dimension(85, 30));
    btClose.setPreferredSize(new Dimension(85, 30));
    jLabel5.setMaximumSize(new Dimension(50, 30));
		jLabel5.setMinimumSize(new Dimension(50, 30));
		jLabel5.setPreferredSize(new Dimension(50, 30));
    panelMsg.setMaximumSize(new Dimension(126, 120));
    panelMsg.setMinimumSize(new Dimension(126, 120));
    panelHead.setMaximumSize(new Dimension(126, 85));
    panelHead.setMinimumSize(new Dimension(126, 85));
    panelHead.setPreferredSize(new Dimension(126, 85));
    btReadNext.setPreferredSize(new Dimension(100, 30));
    btReadNext.setMinimumSize(new Dimension(100, 30));
    btReadNext.setMaximumSize(new Dimension(100, 30));
    jPanel1.setMaximumSize(new Dimension(268, 35));
    jPanel1.setMinimumSize(new Dimension(268, 35));
    jPanel1.setPreferredSize(new Dimension(268, 35));
    taMessage.setEditable(false);
    tfUIN.setEditable(false);
    tfNick.setEditable(false);
    tfEmail.setEditable(false);
    tfUIN.setSelectionColor(Color.white);
    tfNick.setSelectionColor(Color.white);
    tfEmail.setSelectionColor(Color.white);
    taMessage.setSelectionColor(Color.white);
    taMessage.setMargin(new Insets(2, 2, 2, 2));
    btReply.setMargin(new Insets(2, 2, 2, 2));
    btClose.setMargin(new Insets(2, 2, 2, 2));
    btReadNext.setMargin(new Insets(2, 2, 2, 2));
    labelHead.setAlignmentX((float) 0.5);
    jScrollPane1.setAutoscrolls(true);
    component2 = Box.createVerticalStrut(8);
    taMessage.setAutoscrolls(false);
    tfUIN.setText(String.valueOf (cUserInfo.getUIN()));
    tfNick.setText(cUserInfo.getNick());
    tfEmail.setText(cUserInfo.getEmail());
    taMessage.setText(dReceive.getMessage());
    btReadNext.setText("ReadNext "+cUserInfo.dataQueue.size());

    if(cUserInfo.dataQueue.size()>0)
    {
      btReadNext.setEnabled(true);
    }
    else
    {
      btReadNext.setEnabled(false);
    }

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
    panelMsg.add(labelHead, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.05
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 3, 0, 0), 0, 0));
    panelMsg.add(jScrollPane1, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 3, 3, 3), 0, 0));
    jPanel1.add(btClose, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(btReply, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(jLabel5, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 0, 3), 0, 0));
    jPanel1.add(component2, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, -1000, 0, 0), 0, 0));
    jPanel1.add(btReadNext, new GridBagConstraints(4, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
    panelSendMsg.add(panelHead, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(-5, 0, 0, 0), 0, 0));
    panelSendMsg.add(panelMsg, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));
    panelSendMsg.add(jPanel1, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));
    getContentPane().add(panelSendMsg, BorderLayout.CENTER);
    setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);

		btReply.addActionListener(new ActionListener()	//send
		{
			public void actionPerformed(ActionEvent e)
			{
        SendMessageFrame sMessage=new  SendMessageFrame(oUserInfo,cUserInfo);
        closeFrame();
			}
		});

		btClose.addActionListener(new ActionListener() //cancel
		{
			public void actionPerformed(ActionEvent e)
			{
        closeFrame();
			}
		});

    btReadNext.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
          if(cUserInfo.getDataStatus()==cUserInfo.c_MsgText)
          {
             dReceive=cUserInfo.getData();
             taMessage.setText(dReceive.getMessage());
             btReadNext.setText("ReadNext "+cUserInfo.dataQueue.size());
             if(cUserInfo.dataQueue.size()>0)
             {
              btReadNext.setEnabled(true);
             }
             else
             {
              btReadNext.setEnabled(false);
             }
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgUserAdd)
          {

             InAddedFrame iAddedFrame=new InAddedFrame(oUserInfo,cUserInfo,cUserInfo.getData());
             dispose();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgAuthReq)
          {

             InReqAuthorizeFrame InReq=new InReqAuthorizeFrame(oUserInfo,cUserInfo,cUserInfo.getData());
             dispose();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgAuthGrant)
          {

             AcceptAuthorizeFrame aAuth=new AcceptAuthorizeFrame(oUserInfo,cUserInfo,cUserInfo.getData());
             dispose();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgAuthIgnore)
          {
             AcceptAuthorizeFrame nAuth=new AcceptAuthorizeFrame(oUserInfo,cUserInfo,cUserInfo.getData());
             dispose();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgURL)
          {
             cUserInfo.getData();
             dispose();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgContact)
          {
             cUserInfo.getData();
             dispose();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgFile)
          {
             if(!cUserInfo.getFileAbort())
             {
              RecieveFileFrame rFileFrame=new RecieveFileFrame(oUserInfo,cUserInfo,cUserInfo.getData());
             }
             else
             {
              cUserInfo.getData();
              WarningFrame wFrame=new WarningFrame(cUserInfo.getNick()+" abort to send file.");
             }
             dispose();
          }
          else if(cUserInfo.getDataStatus()!=cUserInfo.c_NoMsg)
          {
             cUserInfo.getData();
             dispose();
          }
      }
		});
  }

  public void closeFrame()
  {
  		dispose();
  }

  public void setFrameLocation()
  {
    int x, y;
    Dimension screenSize = getToolkit().getScreenSize();
    x = (screenSize.width-getSize().width)/2;
    y = (screenSize.height-getSize().height)/2;//center screen
    setLocation(x,y);
  }

}
