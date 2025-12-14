import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.util.*;

public class DeleteUserFrame extends JFrame
{
  OwnerUserInfo     oUserInfo;
  ContactUserInfo   cUserInfo;
  MainFrame         f;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
	JPanel jPanel1        = new JPanel();
  JPanel jPanel3        = new JPanel();
  JPanel jPanel2        = new JPanel();
  JButton okBt          = new JButton("OK");
	JButton cancelBt      = new JButton("Cancel");
  JLabel labelHead      = new JLabel();
  JLabel labelImage     = new JLabel(image);
  TitledBorder titledBorder1;
  Component component1;

  public DeleteUserFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo)
  {
    this.oUserInfo=oUserInfo;
    this.cUserInfo=cUserInfo;
    this.f=oUserInfo.f;
    oUserInfo.allFrame.addElement(this);
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
    setSize(275,170);
    setFrameLocation();
	  setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    f.setEnabled (false);
    setIconImage(imageFrameHead);
    setTitle("Confirm Delete User");
    component1 = Box.createVerticalStrut(8);
		okBt.setFont(defaultFont);
		cancelBt.setFont(defaultFont);
    labelHead.setFont(defaultFont);
    labelHead.setForeground(Color.black);
		okBt.setForeground(Color.black);
		cancelBt.setForeground(Color.black);
    okBt.setBorder(defaultBorder);
    cancelBt.setBorder(defaultBorder);
    jPanel3.setBorder(defaultBorder);
    labelImage.setBorder(defaultBorder);
    okBt.setMaximumSize(new Dimension(80, 30));
    okBt.setMinimumSize(new Dimension(80, 30));
		okBt.setPreferredSize(new Dimension(80, 30));
    cancelBt.setMaximumSize(new Dimension(80, 30));
    cancelBt.setMinimumSize(new Dimension(80, 30));
    cancelBt.setPreferredSize(new Dimension(80, 30));
		labelHead.setMinimumSize(new Dimension(100, 25));
		labelHead.setPreferredSize(new Dimension(100, 25));
		labelHead.setMaximumSize(new Dimension(100, 25));
    labelImage.setMaximumSize(new Dimension(50, 30));
    labelImage.setMinimumSize(new Dimension(50, 30));
    labelImage.setPreferredSize(new Dimension(50, 30));
    okBt.setMargin(new Insets(2, 2, 2, 2));
    cancelBt.setMargin(new Insets(2, 2, 2, 2));
    labelHead.setText ("Delete "+cUserInfo.getNick());
		jPanel1.setLayout(new GridBagLayout());
		jPanel2.setLayout(new GridBagLayout());
		jPanel3.setLayout(new GridBagLayout());
		getContentPane().setLayout(new BorderLayout());
    getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(jPanel3, new GridBagConstraints(0, 0, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 0, 0));
    jPanel3.add(labelImage, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(30, 20, 30, 10), 0, 0));
    jPanel3.add(labelHead, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(30, 0, 30, 30), 0, 0));
    jPanel1.add(jPanel2, new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.NORTH, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    jPanel2.add(okBt, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(5, 0, 5, 0), 0, 0));
    jPanel2.add(cancelBt, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(5, 5, 5, 8), 0, 0));
    jPanel2.add(component1, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));

    okBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
            if(cUserInfo.getTableStore()==cUserInfo.c_tableOffline)
            {cUserInfo.removeFromTable (f.offlineTm);}
            else if(cUserInfo.getTableStore()==cUserInfo.c_tableOnline)
            {cUserInfo.removeFromTable(f.onlineTm);}
            else if(cUserInfo.getTableStore()==cUserInfo.c_tableSecure)
            {cUserInfo.removeFromTable(f.secureTm);}
            else if(cUserInfo.getTableStore()==cUserInfo.c_tableAwait)
            {cUserInfo.removeFromTable(f.awaitTm);}
            else if(cUserInfo.getTableStore()==cUserInfo.c_tableNotin)
            {cUserInfo.removeFromTable(f.notinTm);}
            f.updateList();
            cUserInfo.CloseEstablish();
            cUserInfo.removeFromVector();
            WriteContactDataFile wContactDataFile =new WriteContactDataFile(oUserInfo.getUIN()+".ifo",oUserInfo.contactUser);
            f.setEnabled (true);
            dispose();
      }
    });

    cancelBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
         f.setEnabled (true);
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
