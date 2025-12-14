import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;

public class ProgressFrame extends JFrame
{
 	ContactUserInfo cUser;
  OwnerUserInfo   oUser;
  boolean         sendFileStart=false;
  SendFileSeq     sFileSeq;
  ReceiveFileSeq  rFileSeq;
  String          title;
  String          status;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  JPanel panelButton    = new JPanel();
  JPanel panelHead      = new JPanel();
  JLabel labelFileName  = new JLabel("FileName:");
  JLabel labelNumFille  = new JLabel("Files:");
  JLabel labelBatchFile = new JLabel("Batch:");
  JLabel labelFile      = new JLabel("File:");
  JLabel labelFileSize  = new JLabel("Size:");
  JLabel labelBatchSize = new JLabel("Size:");
  JButton btAbort       = new JButton("Abort");
  JTextField tfFileName = new JTextField();
  JTextField tfNumFile  = new JTextField();
  Component component2;
  JPanel panelProgress  = new JPanel();
  JProgressBar progressFile = new JProgressBar();
  JProgressBar progressBatch = new JProgressBar();
  JTextField tfFileSize = new JTextField();
  JTextField tfBatchSize= new JTextField();

  public ProgressFrame(OwnerUserInfo oUser,ContactUserInfo cUser,String title,String status)
  {
    this.oUser=oUser;
    this.cUser =cUser;
    this.title=title;
    this.status=status;
    oUser.allFrame.addElement(this);
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
         	abort();
      }
    });
    setSize(new Dimension(410,205));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle(title);
    labelFileName.setFont(defaultFont);
    tfFileName.setFont(defaultFont);
    labelNumFille.setFont(defaultFont);
    tfNumFile.setFont(defaultFont);
    labelFile.setFont(defaultFont);
    progressFile.setFont(defaultFont);
    labelBatchFile.setFont(defaultFont);
    progressBatch.setFont(defaultFont);
    labelFileSize.setFont(defaultFont);
    tfFileSize.setFont(defaultFont);
    labelBatchSize.setFont(defaultFont);
    tfBatchSize.setFont(defaultFont);
    btAbort.setFont(defaultFont);
    btAbort.setBorder(defaultBorder);
    tfFileName.setBorder(defaultBorder);
    tfNumFile.setBorder(defaultBorder);
    progressFile.setBorder(defaultBorder);
    progressBatch.setBorder(defaultBorder);
    tfFileSize.setBorder(defaultBorder);
    tfBatchSize.setBorder(defaultBorder);
    panelHead.setBorder(defaultBorder);
    panelProgress.setBorder(defaultBorder);
    labelFileName.setForeground(Color.black);
    tfFileName.setForeground(Color.black);
    labelNumFille.setForeground(Color.black);
    tfNumFile.setForeground(Color.black);
    labelFile.setForeground(Color.black);
    labelBatchFile.setForeground(Color.black);
    labelFileSize.setForeground(Color.black);
    tfFileSize.setForeground(Color.black);
    labelBatchSize.setForeground(Color.black);
    tfBatchSize.setForeground(Color.black);
    btAbort.setForeground(Color.black);
    tfFileName.setBackground(Color.white);
    tfNumFile.setBackground(Color.white);
    progressFile.setBackground(Color.white);
    progressBatch.setBackground(Color.white);
    tfFileSize.setBackground(Color.white);
    tfBatchSize.setBackground(Color.white);
    labelFileName.setMaximumSize(new Dimension(50, 25));
    labelFileName.setMinimumSize(new Dimension(50, 25));
    labelFileName.setPreferredSize(new Dimension(50, 25));
    tfFileName.setMaximumSize(new Dimension(130, 25));
    tfFileName.setMinimumSize(new Dimension(130, 25));
    tfFileName.setPreferredSize(new Dimension(130, 25));
    labelNumFille.setMaximumSize(new Dimension(30, 25));
    labelNumFille.setMinimumSize(new Dimension(30, 25));
    labelNumFille.setPreferredSize(new Dimension(30, 25));
    tfNumFile.setMaximumSize(new Dimension(75, 25));
    tfNumFile.setMinimumSize(new Dimension(75, 25));
    tfNumFile.setPreferredSize(new Dimension(75, 25));
    btAbort.setMaximumSize(new Dimension(85, 30));
    btAbort.setMinimumSize(new Dimension(85, 30));
    btAbort.setPreferredSize(new Dimension(85, 30));
    panelHead.setMaximumSize(new Dimension(126, 45));
    panelHead.setMinimumSize(new Dimension(126, 45));
    panelHead.setPreferredSize(new Dimension(126, 45));
    panelButton.setMaximumSize(new Dimension(268, 35));
    panelButton.setMinimumSize(new Dimension(268, 35));
    panelButton.setPreferredSize(new Dimension(268, 35));
    panelProgress.setMaximumSize(new Dimension(160, 80));
    panelProgress.setMinimumSize(new Dimension(160, 80));
    panelProgress.setPreferredSize(new Dimension(160, 80));
    progressFile.setMaximumSize(new Dimension(60, 25));
    progressFile.setMinimumSize(new Dimension(60, 25));
    progressFile.setPreferredSize(new Dimension(60, 25));
    progressBatch.setMaximumSize(new Dimension(150, 25));
    progressBatch.setMinimumSize(new Dimension(150, 25));
    progressBatch.setPreferredSize(new Dimension(150, 25));
    tfFileSize.setMaximumSize(new Dimension(75, 25));
    tfFileSize.setMinimumSize(new Dimension(75, 25));
    tfFileSize.setPreferredSize(new Dimension(75, 25));
    tfBatchSize.setMaximumSize(new Dimension(75, 25));
    tfBatchSize.setMinimumSize(new Dimension(75, 25));
    tfBatchSize.setPreferredSize(new Dimension(75, 25));
    labelFile.setMaximumSize(new Dimension(50, 25));
    labelFile.setMinimumSize(new Dimension(50, 25));
    labelFile.setPreferredSize(new Dimension(50, 25));
    labelBatchFile.setMaximumSize(new Dimension(50, 25));
    labelBatchFile.setMinimumSize(new Dimension(50, 25));
    labelBatchFile.setPreferredSize(new Dimension(50, 25));
    labelFileSize.setMaximumSize(new Dimension(30, 25));
    labelFileSize.setMinimumSize(new Dimension(30, 25));
    labelFileSize.setPreferredSize(new Dimension(30, 25));
    labelBatchSize.setMaximumSize(new Dimension(30, 25));
    labelBatchSize.setMinimumSize(new Dimension(30, 25));
    labelBatchSize.setPreferredSize(new Dimension(30, 25));
    btAbort.setMargin(new Insets(2, 2, 2, 2));
    tfFileName.setMargin(new Insets(2, 2, 2, 2));
    tfNumFile.setMargin(new Insets(2, 2, 2, 2));
    component2 = Box.createVerticalStrut(8);
    tfFileName.setEditable(false);
    tfNumFile.setEditable(false);
    tfFileSize.setEditable(false);
    tfBatchSize.setEditable(false);
    tfFileName.setSelectionColor(Color.white);
    tfNumFile.setSelectionColor(Color.white);
    tfFileSize.setSelectionColor(Color.white);
    tfBatchSize.setSelectionColor(Color.white);
    progressFile.setMinimum(0);
    progressFile.setMaximum(100);
    progressFile.setValue(0);
    progressBatch.setMinimum(0);
    progressBatch.setMaximum(100);
    progressBatch.setValue(0);
    progressFile.setBorderPainted(true);
    progressBatch.setBorderPainted(true);
    progressFile.setStringPainted(true);
    progressBatch.setStringPainted(true);
    panelHead.setLayout(new GridBagLayout());
    panelProgress.setLayout(new GridBagLayout());
    panelButton.setLayout(new GridBagLayout());
    getContentPane().setLayout(new GridBagLayout());
    this.getContentPane().add(panelHead, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 10, 0), 0, 0));
    panelHead.add(labelFileName, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(-4, 5, 0, 0), 0, 0));
    panelHead.add(tfFileName, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    panelHead.add(labelNumFille, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 10, 0, 0), 0, 0));
    panelHead.add(tfNumFile, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 5), 0, 0));
    this.getContentPane().add(panelProgress, new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0));
    panelProgress.add(labelFileSize, new GridBagConstraints(2, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 10, 10, 0), 0, 0));
    panelProgress.add(labelBatchFile, new GridBagConstraints(0, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 0, 0), 0, 0));
    panelProgress.add(labelFile, new GridBagConstraints(0, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 10, 0), 0, 0));
    panelProgress.add(labelBatchSize, new GridBagConstraints(2, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 10, 0, 0), 0, 0));
    panelProgress.add(progressFile, new GridBagConstraints(1, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 10, 0), 0, 0));
    panelProgress.add(progressBatch, new GridBagConstraints(1, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    panelProgress.add(tfFileSize, new GridBagConstraints(3, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 10, 5), 0, 0));
    panelProgress.add(tfBatchSize, new GridBagConstraints(3, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    this.getContentPane().add(panelButton, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    panelButton.add(btAbort, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(5, 0, 0, 5), 0, 0));
    panelButton.add(component2, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, -1000, 0, 0), 0, 0));

		btAbort.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
          abort();
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

  public void abort()
  {
     if(status.equals("send"))
     {
       System.out.println("Send abort.");
       if(sendFileStart)
       {
          sFileSeq.stopSend();
       }
       else
       {
          cUser.sendFileCancel();
       }

       cUser.waitSendFile=false;
       dispose();
     }
     else if(status.equals("receive"))
     {
       System.out.println("Receive abort.");
       rFileSeq.stopReceive();
       dispose();
     }
  }

  public void closeFrame()
  {
      cUser.waitSendFile=false;
      dispose();
  }
}
