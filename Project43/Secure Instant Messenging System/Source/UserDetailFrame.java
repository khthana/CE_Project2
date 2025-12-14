import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.border.*;

public class UserDetailFrame extends JFrame
{
  ContactUserInfo   cUserInfo;
  OwnerUserInfo     oUserInfo;
  RequestAllInfoSeq rAllInfoSeq;
  boolean           requestInfo=false;

  Border defaultBorder        = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont            = new Font("dialogInput",Font.PLAIN, 16);
	Font titleFont              = new Font("dialogInput",Font.PLAIN, 14);
  Image imageFrameHead        = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon sicqIcon          = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  ImageIcon icon              = new ImageIcon(getClass().getResource("images/face.gif"));
  ImageIcon iconAFace         = new ImageIcon(getClass().getResource("images/anim.gif"));
  ImageIcon iconTabMain       = new ImageIcon(getClass().getResource("images/sOnline.gif"));
  ImageIcon iconTabMore       = new ImageIcon(getClass().getResource("images/sOnline.gif"));
  ImageIcon iconTabAbout      = new ImageIcon(getClass().getResource("images/sOnline.gif"));

  TitledBorder titledBorder2  = new TitledBorder(defaultBorder, "Basic Information");
  TitledBorder titledBorder3  = new TitledBorder(defaultBorder, "ICQ Number");
  TitledBorder titledBorder4  = new TitledBorder(defaultBorder, "Name");
  TitledBorder titledBorder5  = new TitledBorder(defaultBorder, "Email Addresses");
  TitledBorder titledBorder6  = new TitledBorder(defaultBorder, "Additional Details");
  TitledBorder titledBorder7  = new TitledBorder(defaultBorder, "Birth Date");
  TitledBorder titledBorder8  = new TitledBorder(defaultBorder, "Additional Detail about the user");
  TitledBorder titledBorder9  = new TitledBorder(defaultBorder, "Home Address");
  TitledBorder titledBorder10 = new TitledBorder(defaultBorder, "Phone");

	JPanel panelMyDetail  = new JPanel(new BorderLayout());
	JPanel panelButton    = new JPanel(new GridBagLayout());
	JPanel tabMain        = new JPanel();
	JPanel tabMore        = new JPanel();
	JPanel tabAbout       = new JPanel();
	JPanel panelUIN       = new JPanel();
	JPanel jPanel3        = new JPanel();
  JPanel panelName      = new JPanel();
  JPanel panelEmail     = new JPanel();
  JPanel jPanel8        = new JPanel();
  JPanel panelPhone     = new JPanel();
  JPanel jPanel6        = new JPanel();
	JTabbedPane userDetailTab = new JTabbedPane();
	JButton btCancel      = new JButton("Cancel");
  JButton btRetrieve    = new JButton("Retrieve");
	JLabel labelICQ       = new JLabel("ICQ#");
	JLabel labelNick      = new JLabel("Nick Name:");
	JLabel labelEmail     = new JLabel("E-mail Address:");
	JLabel labelFirst     = new JLabel("First Name:");
	JLabel labelLast      = new JLabel("Last Name:");
	JLabel jLabel1        = new JLabel(icon);
  JLabel labelIP        = new JLabel("Current / Last IP:");
  JLabel labelState     = new JLabel("State:");
  JLabel labelCity      = new JLabel("City:");
  JLabel labelAge       = new JLabel("Age:");
  JLabel labelGender    = new JLabel("Gender:");
  JLabel labelCountry   = new JLabel("Country:");
  JLabel labelZipCode   = new JLabel("Zip Code:");
  JLabel labelPhone     = new JLabel("Phone Number:");
  JLabel labelHomepage  = new JLabel("Hompage:");
	JTextField tfICQ      = new JTextField();
	JTextField tfNick     = new JTextField();
	JTextField tfEmail    = new JTextField();
	JTextField tfFirst    = new JTextField();
	JTextField tfLast     = new JTextField();
  JTextField tfIP       = new JTextField();
  JTextField tfState    = new JTextField();
  JTextField tfCity     = new JTextField();
  JTextField tfZipCode  = new JTextField();
  JTextField tfCountry  = new JTextField();
  JTextField tfPhone    = new JTextField();
  JTextField tfHomepage = new JTextField();
  JTextField tfGender   = new JTextField();
  JTextField tfAge      = new JTextField();
	JScrollPane jScrollPane1 = new JScrollPane();
	JTextPane tpAbout  = new JTextPane();
	Component component1;

  public UserDetailFrame(OwnerUserInfo oUserInfo,ContactUserInfo cUserInfo)
  {
    this.cUserInfo=cUserInfo;
    this.oUserInfo=oUserInfo;
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
				closeUserDetail();
			}
		});
		setSize(new Dimension(430,360));
    setFrameLocation();
		setResizable(false);
		setVisible(true);

   if(oUserInfo.getOnline()&&(cUserInfo.getInfoStatus()==cUserInfo.c_infoNotReady))
   {
     requestInfo=true;
     rAllInfoSeq=new RequestAllInfoSeq(oUserInfo,cUserInfo,this);
   }
	}

	private void jbInit() throws Exception
	{
    setTitle("User Details for: "+String.valueOf(cUserInfo.getUIN()));
    setIconImage(imageFrameHead);
    btCancel.setFont(defaultFont);
    labelICQ.setFont(defaultFont);
    tfICQ.setFont(defaultFont);
    labelNick.setFont(defaultFont);
    tfNick.setFont(defaultFont);
    labelFirst.setFont(defaultFont);
    tfFirst.setFont(defaultFont);
    labelLast.setFont(defaultFont);
    tfLast.setFont(defaultFont);
    labelEmail.setFont(defaultFont);
    tfEmail.setFont(defaultFont);
    tabMain.setFont(defaultFont);
    tabMore.setFont(defaultFont);
    tabAbout.setFont(defaultFont);
    userDetailTab.setFont(defaultFont);
		titledBorder2.setTitleFont(defaultFont);
		titledBorder3.setTitleFont(defaultFont);
		titledBorder4.setTitleFont(defaultFont);
		titledBorder5.setTitleFont(defaultFont);
		titledBorder6.setTitleFont(defaultFont);
		titledBorder7.setTitleFont(defaultFont);
		titledBorder8.setTitleFont(defaultFont);
		titledBorder9.setTitleFont(defaultFont);
		titledBorder10.setTitleFont(defaultFont);
		titledBorder2.setTitleColor(Color.black);
		titledBorder3.setTitleColor(Color.black);
		titledBorder4.setTitleColor(Color.black);
		titledBorder5.setTitleColor(Color.black);
		titledBorder6.setTitleColor(Color.black);
		titledBorder7.setTitleColor(Color.black);
		titledBorder8.setTitleColor(Color.black);
		titledBorder9.setTitleColor(Color.black);
		titledBorder10.setTitleColor(Color.black);
		jLabel1.setFont(defaultFont);
    labelIP.setFont(defaultFont);
    tfIP.setFont(defaultFont);
    btRetrieve.setFont(defaultFont);
    tfState.setFont(defaultFont);
    tfCity.setFont(defaultFont);
    labelState.setFont(defaultFont);
    labelCity.setFont(defaultFont);
    tfZipCode.setFont(defaultFont);
    labelZipCode.setFont(defaultFont);
    tfCountry.setFont(defaultFont);
    labelCountry.setFont(defaultFont);
    labelPhone.setFont(defaultFont);
    tfPhone.setFont(defaultFont);
    labelHomepage.setFont(defaultFont);
    tfHomepage.setFont(defaultFont);
    labelGender.setFont(defaultFont);
    tfGender.setFont(defaultFont);
    tfAge.setFont(defaultFont);
    labelAge.setFont(defaultFont);
    tpAbout.setFont(defaultFont);
    btCancel.setMaximumSize(new Dimension(90, 30));
    btCancel.setMinimumSize(new Dimension(90, 30));
    btCancel.setPreferredSize(new Dimension(90, 30));
    tfICQ.setMaximumSize(new Dimension(120, 25));
    tfNick.setMaximumSize(new Dimension(120, 25));
    tfFirst.setMaximumSize(new Dimension(120, 25));
    tfLast.setMaximumSize(new Dimension(120, 25));
    tfEmail.setMaximumSize(new Dimension(200, 25));
    tabAbout.setMaximumSize(new Dimension(500, 200));
    tabAbout.setMinimumSize(new Dimension(500, 200));
    tabAbout.setPreferredSize(new Dimension(500, 200));
		tfICQ.setMinimumSize(new Dimension(120, 25));
		tfICQ.setPreferredSize(new Dimension(120, 25));
    labelNick.setMaximumSize(new Dimension(80, 25));
    labelNick.setMinimumSize(new Dimension(80, 25));
    labelNick.setPreferredSize(new Dimension(80, 25));
		tfNick.setMinimumSize(new Dimension(120, 25));
		tfNick.setPreferredSize(new Dimension(120, 25));
    labelEmail.setMaximumSize(new Dimension(120, 25));
    labelEmail.setMinimumSize(new Dimension(120, 25));
    labelEmail.setPreferredSize(new Dimension(120, 25));
		tfEmail.setMinimumSize(new Dimension(200, 25));
		tfEmail.setPreferredSize(new Dimension(200, 25));
    labelFirst.setMaximumSize(new Dimension(80, 25));
    labelFirst.setMinimumSize(new Dimension(80, 25));
    labelFirst.setPreferredSize(new Dimension(80, 25));
		tfFirst.setMinimumSize(new Dimension(120, 25));
		tfFirst.setPreferredSize(new Dimension(120, 25));
    labelLast.setMaximumSize(new Dimension(80, 25));
    labelLast.setMinimumSize(new Dimension(80, 25));
    labelLast.setPreferredSize(new Dimension(80, 25));
		tfLast.setMinimumSize(new Dimension(120, 25));
		tfLast.setPreferredSize(new Dimension(120, 25));
    panelUIN.setMaximumSize(new Dimension(400, 100));
    panelUIN.setMinimumSize(new Dimension(400, 100));
    panelUIN.setPreferredSize(new Dimension(400, 100));
    jScrollPane1.setMinimumSize(new Dimension(450, 200));
		jScrollPane1.setPreferredSize(new Dimension(450, 200));
		tpAbout.setPreferredSize(new Dimension(450, 200));
		tpAbout.setMinimumSize(new Dimension(450, 200));
		jLabel1.setMaximumSize(new Dimension(60, 30));
		jLabel1.setMinimumSize(new Dimension(60, 30));
		jLabel1.setPreferredSize(new Dimension(60, 30));
    panelName.setMaximumSize(new Dimension(400, 60));
    panelName.setMinimumSize(new Dimension(400, 60));
    panelName.setPreferredSize(new Dimension(400, 60));
    panelEmail.setMaximumSize(new Dimension(400, 60));
    panelEmail.setMinimumSize(new Dimension(400, 60));
    panelEmail.setPreferredSize(new Dimension(400, 60));
    tfIP.setPreferredSize(new Dimension(120, 25));
    tfIP.setMinimumSize(new Dimension(120, 25));
    tfIP.setMaximumSize(new Dimension(120, 25));
    btRetrieve.setMaximumSize(new Dimension(90, 30));
    btRetrieve.setMinimumSize(new Dimension(90, 30));
    btRetrieve.setPreferredSize(new Dimension(90, 30));
    tfState.setPreferredSize(new Dimension(120, 25));
    tfState.setMinimumSize(new Dimension(120, 25));
    tfState.setMaximumSize(new Dimension(120, 25));
    tfCity.setPreferredSize(new Dimension(120, 25));
    tfCity.setMinimumSize(new Dimension(120, 25));
    tfCity.setMaximumSize(new Dimension(120, 25));
    labelState.setMaximumSize(new Dimension(60, 25));
    labelState.setMinimumSize(new Dimension(60, 25));
    labelState.setPreferredSize(new Dimension(60, 25));
    labelICQ.setMaximumSize(new Dimension(55, 25));
    labelICQ.setMinimumSize(new Dimension(55, 25));
    labelICQ.setPreferredSize(new Dimension(55, 25));
    labelIP.setMaximumSize(new Dimension(90, 25));
    labelIP.setMinimumSize(new Dimension(90, 25));
    labelIP.setPreferredSize(new Dimension(90, 25));
    labelCity.setMaximumSize(new Dimension(60, 25));
    labelCity.setMinimumSize(new Dimension(60, 25));
    labelCity.setPreferredSize(new Dimension(60, 25));
    tfZipCode.setPreferredSize(new Dimension(120, 25));
    tfZipCode.setMinimumSize(new Dimension(120, 25));
    tfZipCode.setMaximumSize(new Dimension(120, 25));
    labelZipCode.setMaximumSize(new Dimension(60, 25));
    labelZipCode.setMinimumSize(new Dimension(60, 25));
    labelZipCode.setPreferredSize(new Dimension(60, 25));
    labelCountry.setMaximumSize(new Dimension(60, 25));
    labelCountry.setMinimumSize(new Dimension(60, 25));
    labelCountry.setPreferredSize(new Dimension(60, 25));
    tfCountry.setMaximumSize(new Dimension(120, 25));
    tfCountry.setMinimumSize(new Dimension(120, 25));
    tfCountry.setPreferredSize(new Dimension(120, 25));
    labelPhone.setPreferredSize(new Dimension(80, 25));
    labelPhone.setMinimumSize(new Dimension(80, 25));
    labelPhone.setMaximumSize(new Dimension(80, 25));
    panelPhone.setPreferredSize(new Dimension(400, 60));
    panelPhone.setMinimumSize(new Dimension(400, 60));
    panelPhone.setMaximumSize(new Dimension(400, 60));
    tfPhone.setMaximumSize(new Dimension(120, 25));
    tfPhone.setMinimumSize(new Dimension(120, 25));
    tfPhone.setPreferredSize(new Dimension(120, 25));
    labelHomepage.setMaximumSize(new Dimension(60, 25));
    labelHomepage.setMinimumSize(new Dimension(60, 25));
    labelHomepage.setPreferredSize(new Dimension(60, 25));
    tfHomepage.setMaximumSize(new Dimension(275, 25));
    tfHomepage.setMinimumSize(new Dimension(275, 25));
    tfHomepage.setPreferredSize(new Dimension(275, 25));
    labelGender.setMaximumSize(new Dimension(60, 25));
    labelGender.setMinimumSize(new Dimension(60, 25));
    labelGender.setPreferredSize(new Dimension(60, 25));
    tfGender.setMaximumSize(new Dimension(60, 25));
    tfGender.setMinimumSize(new Dimension(60, 25));
    tfGender.setPreferredSize(new Dimension(60, 25));
    tfAge.setMaximumSize(new Dimension(55, 25));
    tfAge.setMinimumSize(new Dimension(55, 25));
    tfAge.setPreferredSize(new Dimension(55, 25));
    labelAge.setMaximumSize(new Dimension(50, 25));
    labelAge.setMinimumSize(new Dimension(50, 25));
    labelAge.setPreferredSize(new Dimension(50, 25));
    btRetrieve.setMargin(new Insets(2, 2, 2, 2));
    btCancel.setMargin(new Insets(2, 2, 2, 2));
    String sex="N/A";
    if(cUserInfo.getSex()==1)sex="Female";
    else if(cUserInfo.getSex()==2) sex ="Male";
    tfGender.setText(sex);
    tfAge.setText(String.valueOf (cUserInfo.getAge()));
    tfIP.setText(cUserInfo.getIPStr());
		tfICQ.setText(String.valueOf(cUserInfo.getUIN()));
		tfNick.setText(cUserInfo.getNick());
		tfEmail.setText(cUserInfo.getEmail());
		tfFirst.setText(cUserInfo.getFirst());
		tfLast.setText(cUserInfo.getLast());
		tpAbout.setText(cUserInfo.getAbout());
    tfPhone.setText(cUserInfo.getPhone());
    tfHomepage.setText(cUserInfo.getHomepage());
		tfState.setText(cUserInfo.getState());
    tfCity.setText(cUserInfo.getCity());
    tfZipCode.setText(String.valueOf(cUserInfo.getCountryStatus()));
    tfCountry.setText(String.valueOf(cUserInfo.getCountryCode()));
		tpAbout.setEditable(false);
    tfState.setEditable(false);
    tfCity.setEditable(false);
    tfZipCode.setEditable(false);
    tfCountry.setEditable(false);
    tfPhone.setEditable(false);
    tfHomepage.setEditable(false);
    tfGender.setEditable(false);
    tfAge.setEditable(false);
    tfIP.setEditable(false);
    tfICQ.setEditable(false);
    tfNick.setEditable(false);
    tfFirst.setEditable(false);
    tfLast.setEditable(false);
    tfEmail.setEditable(false);
    tfState.setSelectionColor(Color.white);
    tfCity.setSelectionColor(Color.white);
    tfZipCode.setSelectionColor(Color.white);
    tfCountry.setSelectionColor(Color.white);
    tfPhone.setSelectionColor(Color.white);
    tfHomepage.setSelectionColor(Color.white);
    tfGender.setSelectionColor(Color.white);
    tfAge.setSelectionColor(Color.white);
    tfIP.setSelectionColor(Color.white);
    tfICQ.setSelectionColor(Color.white);
    tfNick.setSelectionColor(Color.white);
    tfFirst.setSelectionColor(Color.white);
    tfLast.setSelectionColor(Color.white);
    tfEmail.setSelectionColor(Color.white);
    tpAbout.setSelectionColor(Color.white);
    tabMain.setBorder(defaultBorder);
		tabMore.setBorder(defaultBorder);
		tabAbout.setBorder(defaultBorder);
		jScrollPane1.setBorder(null);
    tpAbout.setBorder(defaultBorder);
    btCancel.setBorder(defaultBorder);
    btRetrieve.setBorder(defaultBorder);
		panelUIN.setBorder(titledBorder4);
    panelName.setBorder(titledBorder3);
    panelEmail.setBorder(titledBorder5);
    panelPhone.setBorder(titledBorder10);
    jPanel3.setBorder(titledBorder8);
    jPanel6.setBorder(titledBorder6);
    jPanel8.setBorder(titledBorder9);
    jLabel1.setBorder(defaultBorder);
    tfState.setBorder(defaultBorder);
    tfCity.setBorder(defaultBorder);
    tfZipCode.setBorder(defaultBorder);
    tfCountry.setBorder(defaultBorder);
    tfPhone.setBorder(defaultBorder);
    tfHomepage.setBorder(defaultBorder);
    tfGender.setBorder(defaultBorder);
    tfAge.setBorder(defaultBorder);
    tfIP.setBorder(defaultBorder);
    tfICQ.setBorder(defaultBorder);
    tfNick.setBorder(defaultBorder);
    tfFirst.setBorder(defaultBorder);
    tfLast.setBorder(defaultBorder);
    tfEmail.setBorder(defaultBorder);
		labelFirst.setForeground(Color.black);
		labelICQ.setForeground(Color.black);
		labelNick.setForeground(Color.black);
		labelEmail.setForeground(Color.black);
		labelLast.setForeground(Color.black);
    labelIP.setForeground(Color.black);
    labelCity.setForeground(Color.black);
    labelState.setForeground(Color.black);
    labelZipCode.setForeground(Color.black);
    labelCountry.setForeground(Color.black);
    labelPhone.setForeground(Color.black);
    labelHomepage.setForeground(Color.black);
    labelGender.setForeground(Color.black);
    labelAge.setForeground(Color.black);
    jLabel1.setForeground(Color.black);
    tfState.setForeground(Color.black);
    tfCity.setForeground(Color.black);
    tfZipCode.setForeground(Color.black);
    tfCountry.setForeground(Color.black);
    tfPhone.setForeground(Color.black);
    tfHomepage.setForeground(Color.black);
    tfGender.setForeground(Color.black);
    tfAge.setForeground(Color.black);
    tfIP.setForeground(Color.black);
    tfICQ.setForeground(Color.black);
    tfNick.setForeground(Color.black);
    tfFirst.setForeground(Color.black);
    tfLast.setForeground(Color.black);
    tfEmail.setForeground(Color.black);
    tpAbout.setForeground(Color.black);
    tfState.setBackground(Color.white);
    tfCity.setBackground(Color.white);
    tfZipCode.setBackground(Color.white);
    tfCountry.setBackground(Color.white);
    tfPhone.setBackground(Color.white);
    tfHomepage.setBackground(Color.white);
    tfGender.setBackground(Color.white);
    tfAge.setBackground(Color.white);
    tfIP.setBackground(Color.white);
    tfICQ.setBackground(Color.white);
    tfNick.setBackground(Color.white);
    tfFirst.setBackground(Color.white);
    tfLast.setBackground(Color.white);
    tfEmail.setBackground(Color.white);
    tpAbout.setBackground(Color.white);
		component1 = Box.createVerticalStrut(8);
    userDetailTab.addTab("Main",iconTabMain,tabMain);
    userDetailTab.addTab("More",iconTabMore,tabMore);
    userDetailTab.addTab("About",iconTabAbout,tabAbout);
    getContentPane().setLayout(new BorderLayout());
		tabMain.setLayout(new GridBagLayout());
		tabMore.setLayout(new BorderLayout());
		tabAbout.setLayout(new GridBagLayout());
		panelMyDetail.setLayout(new GridBagLayout());
		panelUIN.setLayout(new GridBagLayout());
		jPanel3.setLayout(new GridBagLayout());
		panelButton.setLayout(new GridBagLayout());
		panelName.setLayout(new GridBagLayout());
    panelEmail.setLayout(new GridBagLayout());
    jPanel8.setLayout(new GridBagLayout());
    panelPhone.setLayout(new GridBagLayout());
    jPanel6.setLayout(new GridBagLayout());
    tabMore.add(jPanel8, BorderLayout.NORTH);
    jPanel8.add(labelCity, new GridBagConstraints(0, 0, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel8.add(tfCity, new GridBagConstraints(1, 0, 1, 1, 0.25, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 5, 20), 0, 0));
    jPanel8.add(labelState, new GridBagConstraints(2, 0, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel8.add(tfState, new GridBagConstraints(3, 0, 1, 1, 0.25, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel8.add(labelZipCode, new GridBagConstraints(2, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
    jPanel8.add(tfZipCode, new GridBagConstraints(3, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel8.add(labelCountry, new GridBagConstraints(0, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel8.add(tfCountry, new GridBagConstraints(1, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 5, 20), 0, 0));
    tabMore.add(panelPhone, BorderLayout.CENTER);
    panelPhone.add(labelPhone, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    panelPhone.add(tfPhone, new GridBagConstraints(1, 0, 1, 1, 0.75, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    tabMore.add(jPanel6, BorderLayout.SOUTH);
    jPanel6.add(labelHomepage, new GridBagConstraints(0, 0, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel6.add(tfHomepage, new GridBagConstraints(1, 0, 3, 1, 0.75, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(0, 5, 5, 20), 0, 0));
    jPanel6.add(labelGender, new GridBagConstraints(0, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel6.add(tfGender, new GridBagConstraints(1, 1, 1, 1, 0.75, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 0), 0, 0));
    jPanel6.add(labelAge, new GridBagConstraints(2, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
    jPanel6.add(tfAge, new GridBagConstraints(3, 1, 1, 1, 0.75, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 5), 0, 0));
    getContentPane().add(panelMyDetail, BorderLayout.CENTER);
		panelMyDetail.add(panelButton, new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
		panelButton.add(component1, new GridBagConstraints(1, 0, 1, 1, 1.0, 1.0
            ,GridBagConstraints.WEST, GridBagConstraints.BOTH, new Insets(5, 5, 5, 0), 0, 0));
		panelButton.add(btCancel, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(5, 5, 5, 3), 0, 0));
		panelButton.add(jLabel1, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(5, 3, 5, 0), 0, 0));
    panelButton.add(btRetrieve, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
		panelMyDetail.add(userDetailTab, new GridBagConstraints(0, 0, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 2, 0, 2), 0, 0));
		tabMain.add(panelUIN, new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(10, 2, 10, 2), 0, 0));
		panelUIN.add(labelNick, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 0), 0, 0));
		panelUIN.add(tfNick, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 20), 0, 0));
		panelUIN.add(labelFirst, new GridBagConstraints(0, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 0), 0, 0));
		panelUIN.add(tfFirst, new GridBagConstraints(1, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 20), 0, 0));
		panelUIN.add(labelLast, new GridBagConstraints(2, 1, 1, 1, 0.25, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 0, 5, 0), 0, 0));
		panelUIN.add(tfLast, new GridBagConstraints(3, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 5), 0, 0));
    tabMain.add(panelName, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 2, 0, 2), 0, 0));
    panelName.add(tfICQ, new GridBagConstraints(1, 0, 1, 1, 0.5, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 0), 0, 0));
    panelName.add(labelICQ, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 5, 5, 0), 0, 0));
    panelName.add(labelIP, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 10, 5, 0), 0, 0));
    panelName.add(tfIP, new GridBagConstraints(3, 0, 1, 1, 0.5, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 5, 5), 0, 0));
    tabMain.add(panelEmail, new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 2, 0, 2), 0, 0));
    panelEmail.add(labelEmail, new GridBagConstraints(0, 0, 1, 1, 0.25, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(5, 5, 5, 0), 0, 0));
    panelEmail.add(tfEmail, new GridBagConstraints(1, 0, 1, 1, 0.75, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, -50, 5, 0), 0, 0));
		tabAbout.add(jPanel3, new GridBagConstraints(0, 0, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 0, 5, 0), 0, 0));
		jPanel3.add(jScrollPane1, new GridBagConstraints(0, 1, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 5, 5, 5), 0, 0));
    jScrollPane1.getViewport().add(tpAbout, null);

		btRetrieve.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        if((!requestInfo)&&(oUserInfo.getOnline()))
        {
           requestInfo=true;
           rAllInfoSeq=new RequestAllInfoSeq(oUserInfo,cUserInfo,UserDetailFrame.this);
        }
			}
		});

		btCancel.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        if(requestInfo)
        {
          rAllInfoSeq.cancelRequest();
        }
				dispose();
			}
		});
	}

  public void closeUserDetail()
  {
       if(requestInfo)
        {
          rAllInfoSeq.cancelRequest();
        }
				dispose();
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
