import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.util.*;

public class AddICQFrame extends JFrame
{
  MainFrame     f;
  AddOwnerSeq   aOwner;
  OwnerUserInfo oUserTemp;
  boolean       newUser=false;
  String        password;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
	JPanel jPanel1        = new JPanel();
  JPanel jPanel3        = new JPanel();
  JPanel jPanel2        = new JPanel();
  JButton okBt          = new JButton("OK");
	JButton cancelBt      = new JButton("Cancel");
	JLabel uinLabel       = new JLabel("ICQ#:");
	JLabel pwLabel        = new JLabel("Password:");
  JLabel labelHead      = new JLabel("Enter Your ICQ# and Password.");
	JTextField uinTf      = new JTextField();
	JTextField pwTf        = new JTextField();
  TitledBorder titledBorder1;
  Component component1;

  public AddICQFrame(MainFrame f)
  {
    this.f = f;
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
         closeAddOwner();
		  }
	  });
    setSize(new Dimension(275,170));
    setFrameLocation();
	  setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    f.setVisible (false);
    f.setEnabled (false);
    setIconImage(imageFrameHead);
    setTitle("Add Another Register User");
    component1 = Box.createVerticalStrut(8);
    uinTf.setFont(defaultFont);
		okBt.setFont(defaultFont);
		uinLabel.setFont(defaultFont);
		pwLabel.setFont(defaultFont);
		pwTf.setFont(defaultFont);
		cancelBt.setFont(defaultFont);
    labelHead.setFont(defaultFont);
    labelHead.setForeground(Color.black);
		uinTf.setForeground(Color.black);
		okBt.setForeground(Color.black);
		uinLabel.setForeground(Color.black);
		pwLabel.setForeground(Color.black);
		pwTf.setForeground(Color.black);
		cancelBt.setForeground(Color.black);
    uinTf.setBorder(defaultBorder);
    uinTf.setDoubleBuffered(true);
    okBt.setBorder(defaultBorder);
    cancelBt.setBorder(defaultBorder);
    pwTf.setBorder(defaultBorder);
    jPanel3.setBorder(defaultBorder);

    uinLabel.setMaximumSize(new Dimension(60, 25));
    uinLabel.setMinimumSize(new Dimension(60, 25));
    uinLabel.setPreferredSize(new Dimension(60, 25));
    pwLabel.setMaximumSize(new Dimension(60, 25));
    pwLabel.setMinimumSize(new Dimension(60, 25));
    pwLabel.setPreferredSize(new Dimension(60, 25));
    uinTf.setMaximumSize(new Dimension(150, 25));
    uinTf.setMinimumSize(new Dimension(150, 25));
		uinTf.setPreferredSize(new Dimension(150, 25));
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
    uinTf.setMargin(new Insets(0, 2, 0, 2));
		pwTf.setMargin(new Insets(0, 2, 0, 2));
    uinTf.setEditable(true);
    pwTf.setBackground(Color.white);
    pwTf.setForeground(Color.white);
    pwTf.setSelectionColor(Color.white);
    pwTf.setSelectedTextColor(Color.white);
		jPanel1.setLayout(new GridBagLayout());
		jPanel2.setLayout(new GridBagLayout());
		jPanel3.setLayout(new GridBagLayout());
		getContentPane().setLayout(new BorderLayout());
    this.getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(jPanel3, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 0, 5), 0, 0));
    jPanel3.add(uinLabel, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(10, 20, 0, 20), 0, 0));
    jPanel3.add(uinTf, new GridBagConstraints(1, 0, GridBagConstraints.REMAINDER, 1, 1.0, 0.0
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
         addOwnerStart();
      }
    });
    cancelBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        if(newUser)
        {
          if(!aOwner.getAddresult())
          {
             oUserTemp.disconnect();
             f.setEnabled(false);
             f.setVisible (false);
             newUser=false;
             okBt.setEnabled (true);
          }
        }
        else
        {
             checkOwner();
        }
      }
    });
    pwTf.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        addOwnerStart();
      }
    });
  }

  public void closeAddOwner()
  {
        if(newUser)
        {
          if(!aOwner.getAddresult())
          {
             oUserTemp.disconnect();
             f.setEnabled(false);
             f.setVisible (false);
             newUser=false;
             okBt.setEnabled (true);
             checkOwner();
          }
        }
        else
        {
             checkOwner();
        }
  }

  private void addOwnerStart()
  {
        int   uin=0;
        short loginResult=0;
        boolean found=false;
        boolean uinCorrect=false;

        String password = String.valueOf(pwTf.getText());
        oUserTemp=new OwnerUserInfo(f);
        newUser=false;

        if((!uinTf.getText().equals (""))&&(!password.equals("")))
        {
           try{
             uin = Integer.parseInt(uinTf.getText());
             uinCorrect=true;
           }catch(Exception ex)
           {
             uinCorrect=false;
           }
         if(uinCorrect)
         {
           for(int i=0;i<f.ownerUsers.size ();i++)
           {
              OwnerUserInfo oUser=(OwnerUserInfo)f.ownerUsers.elementAt(i);
              if(uin==oUser.getUIN())found=true;
           }

           if(!found)
           {
            okBt.setEnabled (false);

            oUserTemp.setUIN(uin);
            oUserTemp.setPWD(password);
            oUserTemp.initData();

            aOwner=new AddOwnerSeq(oUserTemp,AddICQFrame.this);
            newUser=true;
           }
         }
        }
  }

  private void checkOwner()
  {
     if(f.ownerUsers.size()>0)
     {
       f.setEnabled(true);
       f.setVisible (true);
       dispose();
     }
     else
     {
       System.exit(0);
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

}
