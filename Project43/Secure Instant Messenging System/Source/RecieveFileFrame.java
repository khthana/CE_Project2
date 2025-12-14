import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;
import java.io.File;
import java.util.Vector;
import javax.swing.filechooser.*;

public class RecieveFileFrame extends JFrame
{
 	ContactUserInfo cUserInfo;
  OwnerUserInfo   oUserInfo;
  DataReceive     dReceive;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  ImageIcon sicqIcon    = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  TitledBorder titleTo  = new TitledBorder(defaultBorder, "From");
  JPanel jPanel1        = new JPanel();
  JPanel panelSendMsg   = new JPanel();
  JPanel panelMsg       = new JPanel();
  JPanel panelHead      = new JPanel();
  JLabel labelUIN       = new JLabel("ICQ#");
  JLabel labelNick      = new JLabel("NICK:");
  JLabel labelEmail     = new JLabel("E-MAIL:");
  JLabel labelSelFile   = new JLabel("Filename(s):");
  JLabel labelHead      = new JLabel("File's Description:");
  JButton btCancel      = new JButton("Cancel");
  JButton btIgnore      = new JButton("Ignore");
  JButton btAccept      = new JButton("Accept");
  JTextField tfUIN      = new JTextField();
  JTextField tfNick     = new JTextField();
  JTextField tfEmail    = new JTextField();
  JTextField taMessage  = new JTextField();
  JFileChooser jFile    = new JFileChooser();
  DefaultListModel selFileLm = new DefaultListModel();
  JTextField listFile   = new JTextField();
  JScrollPane jScrollPane1 = new JScrollPane(taMessage);
  Component component2;
  String  selPath       = "";
  JLabel labelFileSize  = new JLabel("File's Description:");
  JTextField tfFileSize = new JTextField();

  public RecieveFileFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo,DataReceive dReceive)
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
       	cancelReceive();
      }
    });
    setSize(new Dimension(400,270));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("Incoming File Request");
    titleTo.setTitleFont(defaultFont);
    labelUIN.setFont(defaultFont);
    tfUIN.setFont(defaultFont);
    labelNick.setFont(defaultFont);
    tfNick.setFont(defaultFont);
    labelEmail.setFont(defaultFont);
    tfEmail.setFont(defaultFont);
    btCancel.setFont(defaultFont);
    taMessage.setFont(defaultFont);
    jScrollPane1.setFont(defaultFont);
    labelHead.setFont(defaultFont);
    labelSelFile.setFont(defaultFont);
    btIgnore.setFont(defaultFont);
    btAccept.setFont(defaultFont);
    listFile.setFont(defaultFont);
    jFile.setFont(defaultFont);
    panelMsg.setBorder(defaultBorder);
    btCancel.setBorder(defaultBorder);
    tfUIN.setBorder(defaultBorder);
    tfNick.setBorder(defaultBorder);
    tfEmail.setBorder(defaultBorder);
    taMessage.setBorder(null);
    panelHead.setBorder(titleTo);
    jScrollPane1.setBorder(defaultBorder);
    btIgnore.setBorder(defaultBorder);
    btAccept.setBorder(defaultBorder);
    listFile.setBorder(defaultBorder);
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
    listFile.setMaximumSize(new Dimension(400, 30));
    listFile.setMinimumSize(new Dimension(400, 30));
    listFile.setPreferredSize(new Dimension(400, 30));
    btIgnore.setPreferredSize(new Dimension(85, 30));
    btIgnore.setMinimumSize(new Dimension(85, 30));
    btIgnore.setMaximumSize(new Dimension(85, 30));
    btAccept.setPreferredSize(new Dimension(85, 30));
    btAccept.setMinimumSize(new Dimension(85, 30));
    btAccept.setMaximumSize(new Dimension(85, 30));
    jFile.setPreferredSize(new Dimension(400, 250));
    jFile.setMaximumSize(new Dimension(400, 200));
    jFile.setMinimumSize(new Dimension(400, 200));
    taMessage.setEditable(false);
    listFile.setEditable(false);
    tfUIN.setEditable(false);
    tfNick.setEditable(false);
    tfEmail.setEditable(false);
    tfUIN.setSelectionColor(Color.white);
    tfNick.setSelectionColor(Color.white);
    tfEmail.setSelectionColor(Color.white);
    listFile.setBackground(Color.white);
    listFile.setSelectionColor(Color.white);
    taMessage.setBackground(Color.white);
    taMessage.setSelectionColor(Color.white);
    taMessage.setMargin(new Insets(2, 2, 2, 2));
    btCancel.setMargin(new Insets(2, 2, 2, 2));
    btAccept.setMargin(new Insets(2, 2, 2, 2));
    btIgnore.setMargin(new Insets(2, 2, 2, 2));
    labelHead.setAlignmentX((float) 0.5);
    component2 = Box.createVerticalStrut(8);
    jScrollPane1.setAutoscrolls(true);
    taMessage.setAutoscrolls(false);
    listFile.setAutoscrolls(true);
    jFile.setDialogTitle("Save File(s) to:");
    jFile.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
    jFile.setCurrentDirectory(jFile.getCurrentDirectory());
    jFile.setSelectedFile(jFile.getCurrentDirectory());
    jFile.setFileFilter(new DirFilter());
    jFile.setApproveButtonText("Save To");
    tfUIN.setText(String.valueOf(cUserInfo.getUIN()));
    tfNick.setText(cUserInfo.getNick());
    tfEmail.setText(cUserInfo.getEmail());
    taMessage.setText(dReceive.getMessage());
    listFile.setText(dReceive.getFileName());
    tfFileSize.setText(String.valueOf(dReceive.getFileSize()));
    panelSendMsg.setLayout(new GridBagLayout());
    panelHead.setLayout(new GridBagLayout());
    panelMsg.setLayout(new GridBagLayout());
    jPanel1.setLayout(new GridBagLayout());
    getContentPane().setLayout(new BorderLayout());
    labelFileSize.setAlignmentX((float) 0.5);
    labelFileSize.setPreferredSize(new Dimension(120, 25));
    labelFileSize.setText("Total Size (Bytes):");
    labelFileSize.setMinimumSize(new Dimension(120, 25));
    labelFileSize.setMaximumSize(new Dimension(120, 25));
    labelFileSize.setForeground(Color.black);
    labelFileSize.setFont(defaultFont);
    tfFileSize.setEditable(false);
    tfFileSize.setAutoscrolls(true);
    tfFileSize.setSelectionColor(Color.white);
    tfFileSize.setBackground(Color.white);
    tfFileSize.setPreferredSize(new Dimension(120, 30));
    tfFileSize.setMinimumSize(new Dimension(120, 30));
    tfFileSize.setMaximumSize(new Dimension(120, 30));
    tfFileSize.setForeground(Color.black);
    tfFileSize.setBorder(defaultBorder);
    tfFileSize.setFont(defaultFont);
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
    panelMsg.add(labelHead, new GridBagConstraints(0, 0, 2, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 3, 0, 0), 0, 0));
    panelMsg.add(jScrollPane1, new GridBagConstraints(0, 1, 4, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 3, 3, 3), 0, 0));
    panelMsg.add(labelSelFile, new GridBagConstraints(0, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 3, 0, 0), 0, 0));
    panelMsg.add(listFile, new GridBagConstraints(0, 4, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 3, 0, 3), 0, 0));
    panelMsg.add(labelFileSize, new GridBagConstraints(2, 2, 1, 2, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 0, 0), 0, 0));
    panelMsg.add(tfFileSize, new GridBagConstraints(2, 4, 2, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 0, 3), 0, 0));
    jPanel1.add(btCancel, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
    jPanel1.add(component2, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, -1000, 0, 0), 0, 0));
    jPanel1.add(btIgnore, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    jPanel1.add(btAccept, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    panelSendMsg.add(panelHead, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(-5, 0, 0, 0), 0, 0));
    panelSendMsg.add(panelMsg, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 2, 0, 2), 0, 0));
    panelSendMsg.add(jPanel1, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 2, 0, 2), 0, 0));
    getContentPane().add(panelSendMsg, BorderLayout.CENTER);

    btIgnore.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        cancelReceive();
			}
		});
    btAccept.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        acceptFile();
			}
		});
		btCancel.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				cancelReceive();
			}
		});
  }

  public void acceptFile()
  {
    int fc = jFile.showDialog(this,"Save");
    if (fc == jFile.APPROVE_OPTION)
    {
      System.out.println("Press Save Button ");
      File selFile = jFile.getCurrentDirectory();
      if(selFile.isDirectory())
      selPath = selFile.getPath();
      cUserInfo.saveFilePath=selPath;
      System.out.println(selPath);
      cUserInfo.sendFileAccept(oUserInfo.getFilePort());
      dispose();
    }
  }

  public void setFrameLocation()
  {
    int x, y;
    Dimension screenSize = getToolkit().getScreenSize();
    x = (screenSize.width-getSize().width)/2;
    y = (screenSize.height-getSize().height)/2;
    setLocation(x,y);
  }

  private void cancelReceive()
  {
      cUserInfo.sendFileAccept((short)0);
      dispose();
  }

  class DirFilter extends FileFilter
  {
    public boolean accept(File f)
    {
        if (f.isDirectory())
        {
          return true;
        }
        return false;
    }
    public String getDescription()
    {
        return "Directory";
    }
  }
}
