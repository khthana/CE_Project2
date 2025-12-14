import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;

public class AuthorizeFrame extends JFrame
{
  OwnerUserInfo   oUserInfo;
  ContactUserInfo cUserInfo;

  Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
  Image imageFrameHead  = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon sicqIcon    = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  ImageIcon image       = new ImageIcon(getClass().getResource("images/face.gif"));
  TitledBorder titleRequest= new TitledBorder(defaultBorder, "Enter Request Reason:");
  JPanel headPanel      = new JPanel();
  JPanel jPanel1        = new JPanel();
  JPanel msgPanel       = new JPanel();
  JPanel btPanel        = new JPanel();
  JButton btRequest     = new JButton("Request");
  JButton btCancel      = new JButton("Cancel");
  JLabel labelImage     = new JLabel(image);
  JLabel label1         = new JLabel();
  JLabel label2         = new JLabel();
  JTextPane tpMessage   = new JTextPane();
  JScrollPane jScrollPane1= new JScrollPane(tpMessage);
  Component component1;

  public AuthorizeFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo)
  {
    this.oUserInfo=oUserInfo;
    this.cUserInfo=cUserInfo;
    oUserInfo.allFrame.addElement(this);
    try
    {
      jbInit();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    setSize(new Dimension(330,225));
    setFrameLocation();
    setResizable(false);
    setVisible(true);
  }

  private void jbInit() throws Exception
  {
    setIconImage(imageFrameHead);
    setTitle("User's Authorization is required");
    label1.setText("Can't add him/her to your contact list");
    label2.setText("Him/Her must authorize your request to add Him/Her.");
    tpMessage.setText("Plese authorize me.");
    component1 = Box.createVerticalStrut(8);
    tpMessage.setFont(defaultFont);
    btRequest.setFont(defaultFont);
    btCancel.setFont(defaultFont);
    labelImage.setFont(defaultFont);
    label1.setFont(defaultFont);
    label2.setFont(defaultFont);
    titleRequest.setTitleFont(defaultFont);
    msgPanel.setBorder(titleRequest);
    labelImage.setBorder(defaultBorder);
    tpMessage.setBorder(null);
    btRequest.setBorder(defaultBorder);
    btCancel.setBorder(defaultBorder);
    jScrollPane1.setBorder(defaultBorder);
    jScrollPane1.setAutoscrolls(true);
    tpMessage.setAutoscrolls(false);
    tpMessage.setForeground(Color.black);
    btRequest.setForeground(Color.black);
    btCancel.setForeground(Color.black);
    label1.setForeground(Color.black);
    label2.setForeground(Color.black);
    titleRequest.setTitleColor(Color.black);
    btRequest.setMaximumSize(new Dimension(75, 30));
    btRequest.setMinimumSize(new Dimension(75, 30));
    btRequest.setPreferredSize(new Dimension(75, 30));
    btCancel.setMaximumSize(new Dimension(75, 30));
    btCancel.setMinimumSize(new Dimension(75, 30));
    btCancel.setPreferredSize(new Dimension(75, 30));
    labelImage.setMaximumSize(new Dimension(50, 30));
    labelImage.setMinimumSize(new Dimension(50, 30));
    labelImage.setPreferredSize(new Dimension(50, 30));
    label1.setMaximumSize(new Dimension(200, 25));
    label1.setMinimumSize(new Dimension(200, 25));
    label1.setPreferredSize(new Dimension(200, 25));
    label2.setMaximumSize(new Dimension(200, 25));
    label2.setMinimumSize(new Dimension(200, 25));
    label2.setPreferredSize(new Dimension(200, 25));
    btRequest.setMaximumSize(new Dimension(80, 30));
    btRequest.setMinimumSize(new Dimension(80, 30));
    btRequest.setPreferredSize(new Dimension(80, 30));
    btCancel.setMaximumSize(new Dimension(80, 30));
    btCancel.setMinimumSize(new Dimension(80, 30));
    btCancel.setPreferredSize(new Dimension(80, 30));
    tpMessage.setMaximumSize(new Dimension(71, 23));
    btRequest.setMargin(new Insets(2, 2, 2, 2));
    btCancel.setMargin(new Insets(2, 2, 2, 2));
    btPanel.setLayout(new GridBagLayout());
    jPanel1.setLayout(new BorderLayout());
    headPanel.setLayout(new GridBagLayout());
    msgPanel.setLayout(new GridBagLayout());
    getContentPane().add(jPanel1, BorderLayout.CENTER);
    jPanel1.add(msgPanel, BorderLayout.CENTER);
    jPanel1.add(btPanel, BorderLayout.SOUTH);
    jPanel1.add(headPanel, BorderLayout.NORTH);
    msgPanel.add(jScrollPane1, new GridBagConstraints(1, 1, 1, 1, 1.0, 1.0
                ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0));
    btPanel.add(btCancel, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 2, 0, 5), 0, 0));
    btPanel.add(btRequest, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 2), 0, 0));
    btPanel.add(component1, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    headPanel.add(labelImage, new GridBagConstraints(0, 0, 1, 3, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 0, 0), 0, 0));
    headPanel.add(label1, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.SOUTH, GridBagConstraints.HORIZONTAL, new Insets(0, 10, 0, 0), 0, 0));
    headPanel.add(label2, new GridBagConstraints(1, 1, GridBagConstraints.REMAINDER, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 10, 0, 0), 0, 0));

    btRequest.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        String message = tpMessage.getText();
        oUserInfo.authRequest(cUserInfo,message);
        dispose();
      }
    });

    btCancel.addActionListener(new ActionListener()
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
    Dimension screenSize = getToolkit().getScreenSize();
    x = (screenSize.width-getSize().width)/2;
    y = (screenSize.height-getSize().height)/2;
    setLocation(x,y);
  }
}
