import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.util.*;

public class RemoveICQFrame extends JFrame
{
  MainFrame   f;
  OwnerUserInfo rUserInfo,aUserInfo;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
	JPanel jPanel1        = new JPanel();
  JPanel jPanel3        = new JPanel();
  JPanel jPanel2        = new JPanel();
  JButton okBt          = new JButton("OK");
	JButton cancelBt      = new JButton("Cancel");
	JLabel nickLabel      = new JLabel("User:");
	JLabel pwLabel        = new JLabel("Password:");
  JLabel labelHead      = new JLabel("Enter Your Password.");
	JLabel nickTf         = new JLabel();
	JTextField pwTf       = new JTextField();
  TitledBorder titledBorder1;
  Component component1;

  public RemoveICQFrame(OwnerUserInfo rUserInfo,OwnerUserInfo aUserInfo)
  {
    this.rUserInfo=rUserInfo;
    this.aUserInfo=aUserInfo;
    this.f=aUserInfo.f;
    aUserInfo.allFrame.addElement(this);
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
    setSize(new Dimension(275,170));
    setFrameLocation();
  	setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    f.setEnabled (false);
    setIconImage(imageFrameHead);
    setTitle("Remove User");
    component1 = Box.createVerticalStrut(8);
    nickTf.setFont(defaultFont);
		okBt.setFont(defaultFont);
		nickLabel.setFont(defaultFont);
		pwLabel.setFont(defaultFont);
		pwTf.setFont(defaultFont);
		cancelBt.setFont(defaultFont);
    labelHead.setFont(defaultFont);
    labelHead.setForeground(Color.black);
		nickTf.setForeground(Color.black);
		okBt.setForeground(Color.black);
		nickLabel.setForeground(Color.black);
    nickLabel.setMaximumSize(new Dimension(60, 25));
    nickLabel.setMinimumSize(new Dimension(60, 25));
    nickLabel.setPreferredSize(new Dimension(60, 25));
		pwLabel.setForeground(Color.black);
    pwLabel.setMaximumSize(new Dimension(60, 25));
    pwLabel.setMinimumSize(new Dimension(60, 25));
    pwLabel.setPreferredSize(new Dimension(60, 25));
		pwTf.setForeground(Color.black);
		cancelBt.setForeground(Color.black);
    nickTf.setBorder(null);
    okBt.setBorder(defaultBorder);
    cancelBt.setBorder(defaultBorder);
    pwTf.setBorder(defaultBorder);
    jPanel3.setBorder(defaultBorder);
    nickTf.setMaximumSize(new Dimension(150, 25));
    nickTf.setMinimumSize(new Dimension(150, 25));
		nickTf.setPreferredSize(new Dimension(150, 25));
    okBt.setMaximumSize(new Dimension(80, 30));
    okBt.setMinimumSize(new Dimension(80, 30));
		okBt.setPreferredSize(new Dimension(80, 30));
    cancelBt.setMaximumSize(new Dimension(80, 30));
    cancelBt.setMinimumSize(new Dimension(80, 30));
    cancelBt.setPreferredSize(new Dimension(80, 30));
		pwTf.setMinimumSize(new Dimension(150, 25));
    pwTf.setPreferredSize(new Dimension(150, 25));
    pwTf.setMaximumSize(new Dimension(150, 25));
		labelHead.setMinimumSize(new Dimension(100, 25));
		labelHead.setPreferredSize(new Dimension(100, 25));
		labelHead.setMaximumSize(new Dimension(100, 25));
    okBt.setMargin(new Insets(2, 2, 2, 2));
    cancelBt.setMargin(new Insets(2, 2, 2, 2));
		pwTf.setMargin(new Insets(0, 2, 0, 2));
    pwTf.setBackground(Color.white);
    pwTf.setForeground(Color.white);
    pwTf.setSelectionColor(Color.white);
    pwTf.setSelectedTextColor(Color.white);
    nickTf.setText(rUserInfo.getNick());
		jPanel1.setLayout(new GridBagLayout());
		jPanel2.setLayout(new GridBagLayout());
		jPanel3.setLayout(new GridBagLayout());
		getContentPane().setLayout(new BorderLayout());
    this.getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(jPanel3, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 0, 0));
    jPanel3.add(nickLabel, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(10, 20, 0, 20), 0, 0));
    jPanel3.add(nickTf, new GridBagConstraints(1, 0, GridBagConstraints.REMAINDER, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(10, 0, 0, 20), 0, 0));
    jPanel3.add(pwLabel, new GridBagConstraints(0, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.SOUTHEAST, GridBagConstraints.NONE, new Insets(10, 20, 10, 20), 0, 0));
    jPanel3.add(pwTf, new GridBagConstraints(1, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.SOUTHWEST, GridBagConstraints.NONE, new Insets(10, 0, 10, 20), 0, 0));
    jPanel1.add(labelHead, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.NORTHWEST, GridBagConstraints.HORIZONTAL, new Insets(0, 8, 5, 0), 0, 0));
    jPanel1.add(jPanel2, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
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
       removeProcess();
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
    pwTf.addActionListener(new ActionListener()
    {
     public void actionPerformed(ActionEvent e)
     {
       removeProcess();
     }
    });
  }

  private void removeProcess()
  {
     String password = pwTf.getText();

      if(password.equals(rUserInfo.getPWD()))
       {
      		if(rUserInfo.getUIN()==aUserInfo.getUIN ())
 		  		{
               aUserInfo.disconnect ();
               f.removeOwner(rUserInfo);
               if(f.ownerUsers.size()>0)
               {
                OwnerUserInfo oUserT=(OwnerUserInfo)f.ownerUsers.elementAt(0);
                f.setActiveUser(oUserT);
                f.setEnabled(true);
                PasswordFrame pFrame=new PasswordFrame(oUserT);
               }
               else
               {
                f.setEnabled(true);
                AddICQFrame aFrame=new AddICQFrame(f);
               }
					}
          else
          {
              f.removeOwner (rUserInfo);
              f.setEnabled(true);
          }
         dispose();
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
}
