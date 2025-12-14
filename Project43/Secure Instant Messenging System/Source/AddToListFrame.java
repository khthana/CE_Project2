import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.event.*;

public class AddToListFrame extends JFrame
{
  OwnerUserInfo   oUserInfo;
  ContactUserInfo cUserInfo;
  MainFrame       f;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  JPanel jPanel1        = new JPanel();
  JPanel btPanel        = new JPanel();
  JButton okBt          = new JButton("OK");
  JPanel headPanel      = new JPanel();
  JLabel jLabel1        = new JLabel(image);
  JTextArea jLabel2     = new JTextArea();
  JButton cancelBt      = new JButton("Cancel");
  Component component1;

  public AddToListFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo)
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
    setSize(new Dimension(275,170));
    setFrameLocation();
    setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("User has been added");
    component1 = Box.createVerticalStrut(8);
    jPanel1.setLayout(new GridBagLayout());
    jLabel2.setText(cUserInfo.getNick()+" has been added to your Contact List.");
    jLabel2.setEditable(false);
    jLabel2.setBackground(jPanel1.getBackground());
    jLabel2.setSelectionColor(jPanel1.getBackground());
    jLabel2.setWrapStyleWord(true);
    jLabel2.setRows(2);
    okBt.setFont(defaultFont);
    cancelBt.setFont(defaultFont);
    jLabel2.setFont(defaultFont);
    okBt.setForeground(Color.black);
    cancelBt.setForeground(Color.black);
    jLabel2.setForeground(Color.black);
    okBt.setBorder(defaultBorder);
    cancelBt.setBorder(defaultBorder);
    jLabel1.setBorder(defaultBorder);
    headPanel.setBorder(defaultBorder);
    okBt.setMaximumSize(new Dimension(80, 30));
    okBt.setMinimumSize(new Dimension(80, 30));
    okBt.setPreferredSize(new Dimension(80, 30));
    okBt.setMargin(new Insets(2, 2, 2, 2));
    btPanel.setLayout(new GridBagLayout());
    jLabel1.setMaximumSize(new Dimension(50, 40));
    jLabel1.setMinimumSize(new Dimension(50, 50));
    jLabel1.setPreferredSize(new Dimension(50, 50));
    jLabel2.setMaximumSize(new Dimension(250, 50));
    jLabel2.setMinimumSize(new Dimension(250, 50));
    jLabel2.setLineWrap(true);
    jLabel2.setPreferredSize(new Dimension(250, 50));
    headPanel.setLayout(new GridBagLayout());
    cancelBt.setMargin(new Insets(2, 2, 2, 2));
    cancelBt.setPreferredSize(new Dimension(80, 30));
    cancelBt.setMinimumSize(new Dimension(80, 30));
    cancelBt.setMaximumSize(new Dimension(80, 30));
    this.getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(btPanel, new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 5, 0), 0, 0));
    btPanel.add(cancelBt, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 5), 0, 0));
    btPanel.add(okBt, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 8), 0, 0));
    btPanel.add(component1, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    jPanel1.add(headPanel, new GridBagConstraints(0, 0, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    headPanel.add(jLabel1, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(10, 20, 10, 10), 0, 0));
    headPanel.add(jLabel2, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(10, 0, 10, 20), 0, 0));
		okBt.addActionListener(new java.awt.event.ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        if(cUserInfo.getAuth()==cUserInfo.c_Auth)
        {
          cUserInfo.setContactStatus(cUserInfo.c_contactAwait);
          f.addToTable(cUserInfo,cUserInfo.c_tableAwait);
          AuthorizeFrame aFrame=new AuthorizeFrame(oUserInfo,cUserInfo);
        }
        else
        {
          cUserInfo.setContactStatus(cUserInfo.c_contactNormal);
          f.addToTable(cUserInfo,cUserInfo.c_tableOffline);
          oUserInfo.addContactUser(cUserInfo.getUIN());
        }
          dispose();
    	}
		});

		cancelBt.addActionListener(new java.awt.event.ActionListener()
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
    x = this.f.getLocationOnScreen().x+(this.f.getSize().width-getSize().width)/2;
    y = this.f.getLocationOnScreen().y+(this.f.getSize().height-getSize().height)/2;
    setLocation(x,y);
  }

}