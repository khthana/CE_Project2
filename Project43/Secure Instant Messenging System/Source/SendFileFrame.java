import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;
import java.io.File;
import java.util.Vector;
import javax.swing.filechooser.*;

public class SendFileFrame extends JFrame
{
 	ContactUserInfo cUserInfo;
  OwnerUserInfo   oUserInfo;
  int             totalSize=0;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  ImageIcon sicqIcon    = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  TitledBorder titleTo  = new TitledBorder(defaultBorder, "To");
  JPanel jPanel1        = new JPanel();
  JPanel panelSendMsg   = new JPanel();
  JPanel panelMsg       = new JPanel();
  JPanel panelHead      = new JPanel();
  JPanel panelFile      = new JPanel();
  JButton btSend        = new JButton("Send");
  JButton btCancel      = new JButton("Cancel");
  JLabel labelSelFile   = new JLabel("0 file(s): Total Size 0 Bytes.");
  JButton btRemove      = new JButton("Remove");
  JButton btAdd         = new JButton("Add");
  JLabel labelUIN       = new JLabel("ICQ#");
  JLabel labelNick      = new JLabel("NICK:");
  JLabel labelEmail     = new JLabel("E-MAIL:");
  JLabel labelHead      = new JLabel("File's Description:");
  JTextField tfUIN      = new JTextField();
  JTextField tfNick     = new JTextField();
  JTextField tfEmail    = new JTextField();
  JTextField taMessage  = new JTextField();
  JFileChooser jFile    = new JFileChooser();
  DefaultListModel selFileLm = new DefaultListModel();
  JList listFile        = new JList();
  JScrollPane jScrollPane1 = new JScrollPane(taMessage);
  JScrollPane jScrollPane2 = new JScrollPane(listFile);
  Component component2;

  public SendFileFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo)
  {
    this.oUserInfo=oUserInfo;
    this.cUserInfo =cUserInfo;
    cUserInfo.waitSendFile=true;
    oUserInfo.allFrame.addElement (this);
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
    setSize(new Dimension(400,330));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("Send File(s)");
    titleTo.setTitleFont(defaultFont);
    labelUIN.setFont(defaultFont);
    tfUIN.setFont(defaultFont);
    labelNick.setFont(defaultFont);
    tfNick.setFont(defaultFont);
    labelEmail.setFont(defaultFont);
    tfEmail.setFont(defaultFont);
    btSend.setFont(defaultFont);
    btCancel.setFont(defaultFont);
    taMessage.setFont(defaultFont);
    jScrollPane1.setFont(defaultFont);
    labelHead.setFont(defaultFont);
    labelSelFile.setFont(defaultFont);
    btRemove.setFont(defaultFont);
    btAdd.setFont(defaultFont);
    listFile.setFont(defaultFont);
    jFile.setFont(defaultFont);
    panelMsg.setBorder(defaultBorder);
    btCancel.setBorder(defaultBorder);
    btSend.setBorder(defaultBorder);
    tfUIN.setBorder(defaultBorder);
    tfNick.setBorder(defaultBorder);
    tfEmail.setBorder(defaultBorder);
    taMessage.setBorder(null);
    panelHead.setBorder(titleTo);
    jScrollPane1.setBorder(defaultBorder);
    btRemove.setBorder(defaultBorder);
    btAdd.setBorder(defaultBorder);
    jScrollPane2.setBorder(defaultBorder);
    listFile.setBorder(null);
    titleTo.setTitleColor(Color.black);
    labelUIN.setForeground(Color.black);
    labelNick.setForeground(Color.black);
    labelEmail.setForeground(Color.black);
    labelHead.setForeground(Color.black);
    labelSelFile.setForeground(Color.black);
    tfUIN.setForeground(Color.black);
    tfNick.setForeground(Color.black);
    tfEmail.setForeground(Color.black);
    taMessage.setForeground(Color.black);
    listFile.setForeground(Color.black);
    jFile.setForeground(Color.black);
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
    taMessage.setPreferredSize(new Dimension(80, 25));
    taMessage.setMaximumSize(new Dimension(80, 25));
    taMessage.setMinimumSize(new Dimension(80, 25));
    btSend.setMaximumSize(new Dimension(85, 30));
    btSend.setMinimumSize(new Dimension(85, 30));
    btSend.setPreferredSize(new Dimension(85, 30));
    btCancel.setMaximumSize(new Dimension(85, 30));
    btCancel.setMinimumSize(new Dimension(85, 30));
    btCancel.setPreferredSize(new Dimension(85, 30));
    panelMsg.setMaximumSize(new Dimension(126, 120));
    panelMsg.setMinimumSize(new Dimension(126, 120));
    panelHead.setMaximumSize(new Dimension(126, 85));
    panelHead.setMinimumSize(new Dimension(126, 85));
    panelHead.setPreferredSize(new Dimension(126, 85));
    jPanel1.setMaximumSize(new Dimension(268, 35));
    jPanel1.setMinimumSize(new Dimension(268, 35));
    jPanel1.setPreferredSize(new Dimension(268, 35));
    labelSelFile.setMaximumSize(new Dimension(84, 25));
    labelSelFile.setMinimumSize(new Dimension(84, 25));
    labelSelFile.setPreferredSize(new Dimension(84, 25));
    jScrollPane1.setMaximumSize(new Dimension(100, 30));
    jScrollPane1.setMinimumSize(new Dimension(100, 30));
    jScrollPane1.setPreferredSize(new Dimension(100, 30));
    jScrollPane2.setMaximumSize(new Dimension(100, 60));
    jScrollPane2.setMinimumSize(new Dimension(100, 60));
    jScrollPane2.setPreferredSize(new Dimension(100, 60));
    btRemove.setPreferredSize(new Dimension(85, 30));
    btRemove.setMinimumSize(new Dimension(85, 30));
    btRemove.setMaximumSize(new Dimension(85, 30));
    btAdd.setPreferredSize(new Dimension(85, 30));
    btAdd.setMinimumSize(new Dimension(85, 30));
    btAdd.setMaximumSize(new Dimension(85, 30));
    jFile.setPreferredSize(new Dimension(400, 250));
    jFile.setMaximumSize(new Dimension(400, 200));
    jFile.setMinimumSize(new Dimension(400, 200));
    taMessage.setMargin(new Insets(2, 2, 2, 2));
    btSend.setMargin(new Insets(2, 2, 2, 2));
    btCancel.setMargin(new Insets(2, 2, 2, 2));
    btAdd.setMargin(new Insets(2, 2, 2, 2));
    btRemove.setMargin(new Insets(2, 2, 2, 2));
    tfUIN.setEditable(false);
    tfNick.setEditable(false);
    tfEmail.setEditable(false);
    tfUIN.setSelectionColor(Color.white);
    tfNick.setSelectionColor(Color.white);
    tfEmail.setSelectionColor(Color.white);
    labelHead.setAlignmentX((float) 0.5);
    component2 = Box.createVerticalStrut(8);
    jScrollPane1.setAutoscrolls(true);
    taMessage.setAutoscrolls(false);
    jScrollPane2.setAutoscrolls(true);
    listFile.setAutoscrolls(true);
    listFile.setFixedCellHeight(20);
    listFile.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    listFile.setSelectionMode(0);
    jScrollPane2.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    jFile.setDialogTitle("Select File(s) to Send");
    listFile.setModel(selFileLm);
    jFile.setCurrentDirectory(jFile.getCurrentDirectory());
    jFile.setSelectedFile(jFile.getCurrentDirectory());
    tfUIN.setText(String.valueOf (cUserInfo.getUIN()));
    tfNick.setText(cUserInfo.getNick());
    tfEmail.setText(cUserInfo.getEmail());
    panelSendMsg.setLayout(new GridBagLayout());
    panelHead.setLayout(new GridBagLayout());
    panelMsg.setLayout(new GridBagLayout());
    panelFile.setLayout(new BorderLayout());
    jPanel1.setLayout(new GridBagLayout());
    getContentPane().setLayout(new BorderLayout());
    panelFile.add(jScrollPane2, BorderLayout.CENTER);
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
    panelMsg.add(labelHead, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 3, 0, 0), 0, 0));
    panelMsg.add(jScrollPane1, new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 3, 3, 3), 0, 0));
    panelMsg.add(labelSelFile, new GridBagConstraints(0, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 3, 0, 0), 0, 0));
    panelMsg.add(panelFile, new GridBagConstraints(0, 3, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 3, 3, 3), 0, 0));
    jPanel1.add(btCancel, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(btSend, new GridBagConstraints(4, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
    jPanel1.add(component2, new GridBagConstraints(2, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, -1000, 0, 0), 0, 0));
    jPanel1.add(btRemove, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(btAdd, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
    panelSendMsg.add(panelHead, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(-5, 0, 0, 0), 0, 0));
    panelSendMsg.add(panelMsg, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));
    panelSendMsg.add(jPanel1, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 2, 0, 2), 0, 0));
    getContentPane().add(panelSendMsg, BorderLayout.CENTER);

    btRemove.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        remSelFile();
			}
		});
    btAdd.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        addSelFile();
			}
		});
		btSend.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				Vector selFiles = new Vector();
				for(int i=0; i<selFileLm.getSize(); i++)
				{
         	selFiles.addElement(((File)selFileLm.getElementAt(i)));
					System.out.println(selFiles.elementAt(i).toString());
				}

        if(selFiles.size()>0)
        {
         oUserInfo.sendFileReq(cUserInfo,taMessage.getText(),selFiles);
         dispose();
        }
        else
        {
          closeFrame();
        }
			}
		});
		btCancel.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
  				closeFrame();
			}
		});
  }

  public void addSelFile()
  {
    int fc = jFile.showDialog(this, "Add");
    if(fc==jFile.APPROVE_OPTION)
    {
        File selFile = jFile.getSelectedFile();
        if(selFile.isFile())
        {
          for(int i=0; i<selFileLm.getSize(); i++)
          {
            File file1 = (File)selFileLm.elementAt(i);
            if(selFile.getAbsolutePath().equals(file1.getAbsolutePath()))return;
          }
          selFileLm.addElement(selFile);
          totalSize=totalSize+(int)selFile.length();
          if(totalSize>1024)
          {
             labelSelFile.setText(String.valueOf(selFileLm.getSize())+" file(s): Total Size "+(int)(totalSize/1024)+"KB.");
          }
          else
          {
             labelSelFile.setText(String.valueOf(selFileLm.getSize())+" file(s): Total Size "+totalSize+"Bytes.");
          }
       }
    }
  }

  public void remSelFile()
  {
	  int index = -1;
    File rFile;
	  if(!listFile.isSelectionEmpty())
	  {
		  index = listFile.getSelectedIndex();
      rFile=(File)selFileLm.elementAt(index);
      totalSize=totalSize-(int)rFile.length();
		  selFileLm.remove(index);
      if(totalSize>1024)
      {
       labelSelFile.setText(String.valueOf(selFileLm.getSize())+" file(s): Total Size "+(int)(totalSize/1024)+"KB.");
      }
      else
      {
       labelSelFile.setText(String.valueOf(selFileLm.getSize())+" file(s): Total Size "+totalSize+"Bytes.");
      }
	  }
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
      cUserInfo.waitSendFile=false;
      dispose();
  }

}
