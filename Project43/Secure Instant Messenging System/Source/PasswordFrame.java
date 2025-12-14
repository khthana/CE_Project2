import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.border.*;
import java.util.*;

public class PasswordFrame extends JFrame
{
  OwnerUserInfo oUserInfo;
  MainFrame f;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
	JPanel jPanel1        = new JPanel();
  JPanel jPanel3        = new JPanel();
  JPanel jPanel2        = new JPanel();
  JButton okBt          = new JButton("OK");
	JButton cancelBt      = new JButton("Cancel");
	JLabel uinLabel       = new JLabel("User:");
	JLabel pwLabel        = new JLabel("Password:");
  JLabel labelHead      = new JLabel("Enter Your Password.");
	JLabel uinTf          = new JLabel();
 	JTextField pwTf       = new JTextField();
  TitledBorder titledBorder1;
  Component component1;

  public PasswordFrame(OwnerUserInfo oUserInfo)
  {
    this.oUserInfo =oUserInfo;
    this.f=this.oUserInfo.f;
    oUserInfo.initData();
    this.f.initTable();
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
    setTitle("Password Verification");
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
    uinLabel.setMaximumSize(new Dimension(60, 25));
    uinLabel.setMinimumSize(new Dimension(60, 25));
    uinLabel.setPreferredSize(new Dimension(60, 25));
		pwLabel.setForeground(Color.black);
    pwLabel.setMaximumSize(new Dimension(60, 25));
    pwLabel.setMinimumSize(new Dimension(60, 25));
    pwLabel.setPreferredSize(new Dimension(60, 25));
		pwTf.setForeground(Color.black);
		cancelBt.setForeground(Color.black);
    uinTf.setBorder(null);
    okBt.setBorder(defaultBorder);
    cancelBt.setBorder(defaultBorder);
    pwTf.setBorder(defaultBorder);
    jPanel3.setBorder(defaultBorder);
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
		pwTf.setMargin(new Insets(0, 2, 0, 2));
    pwTf.setBackground(Color.white);
    pwTf.setForeground(Color.white);
    pwTf.setSelectionColor(Color.white);
    pwTf.setSelectedTextColor(Color.white);
    uinTf.setText(oUserInfo.getNick());
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

    pwTf.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        loginProcess();
      }
    });


    okBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        loginProcess();
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

  private void loginProcess()
  {
     String password = pwTf.getText();
     if(!password.equals(oUserInfo.getPWD()))
     {
        pwTf.setText("");
     }
     else
     {
        oUserInfo.login();
        f.setEnabled (true);
        dispose();
     }
  }


  public void setFrameLocation()
  {
    int x, y;
    x = this.f.getLocationOnScreen().x+(this.f.getSize().width-getSize().width)/2;
    y = this.f.getLocationOnScreen().y+(this.f.getSize().height-getSize().height)/2;
    setLocation(x,y);
  }
}
