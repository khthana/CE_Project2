import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import javax.swing.table.*;
import java.util.*;

public class SearchFrame extends JFrame
{
  OwnerUserInfo oUserInfo;
  MainFrame     f;
  SearchSeq     sSeq;
  boolean       searchStart=false;

	Vector vResult          = new Vector();
  Border defaultBorder    = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
	Font defaultFont        = new Font("dialogInput",Font.PLAIN, 16);
  String titleText        = "User Found";
  TitledBorder titleSearch= new TitledBorder(defaultBorder, titleText);
	DefaultTableModel searchTm;
  Image imageFrameHead    = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/middle.gif"));
  ImageIcon image         = new ImageIcon(getClass().getResource("images/face.gif"));
  ImageIcon sicqIcon      = new ImageIcon(getClass().getResource("images/sicqIcon.gif"));
  ImageIcon iconAFace     = new ImageIcon(getClass().getResource("images/anim.gif"));
  ImageIcon iconBAddUser  = new ImageIcon(getClass().getResource("images/bAddUser.gif"));
  ImageIcon iconMInfo     = new ImageIcon(getClass().getResource("images/mInfo.gif"));
  ImageIcon iconMessage   = new ImageIcon(getClass().getResource("images/message.gif"));
  ImageIcon iconTabUIN    = new ImageIcon(getClass().getResource("images/sOnline.gif"));
  ImageIcon iconTabName   = new ImageIcon(getClass().getResource("images/sOnline.gif"));
  ImageIcon iconTabEmail  = new ImageIcon(getClass().getResource("images/sOnline.gif"));
	JPopupMenu searchPopup  = new JPopupMenu();
	JMenuItem addMenu       = new JMenuItem("Add To List");
	JMenuItem sendMsgMenu   = new JMenuItem("Send Message");
	JMenuItem detailMenu    = new JMenuItem("User's Detail");
	JTable searchTable      = new JTable();
  JPanel panelSearch      = new JPanel();
	JButton btSearch        = new JButton("Search");
	JButton btStop          = new JButton("Stop");
	JLabel labelNick        = new JLabel("NickName");
	JLabel labelFirst       = new JLabel("FirstName");
	JLabel labelLast        = new JLabel("LastName");
	JLabel labelEmail       = new JLabel("E-mail");
	JLabel labelUIN         = new JLabel("ICQ#");
	JLabel imageLabel       = new JLabel();
	JTextField tfNick       = new JTextField();
	JTextField tfFirst      = new JTextField();
	JTextField tfLast       = new JTextField();
	JTextField tfEmail      = new JTextField();
	JTextField tfUIN        = new JTextField();
	JTabbedPane tabSearch   = new JTabbedPane();
	JScrollPane jScrollPane1= new JScrollPane(searchTable);
	JPanel tabUIN           = new JPanel();
	JPanel tabName          = new JPanel();
	JPanel tabEmail         = new JPanel();
	JPanel panelSearchBt    = new JPanel();
	JPanel panelResult      = new JPanel();
  JLabel labelSearchResult= new JLabel("ICQ#");

  public SearchFrame(OwnerUserInfo oUserInfo)
  {
    this.oUserInfo =oUserInfo;
    this.f=oUserInfo.f;
    oUserInfo.allFrame.addElement (this);

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
          closeSearch();
      }
    });
    setSize(new Dimension(400,370));
    setFrameLocation();
    setResizable(false);
    setVisible(true);
  }

	private void jbInit() throws Exception
	{
    setIconImage(imageFrameHead);
    setTitle("Search User(s)");
		searchTm = new DefaultTableModel()
		{
			public Class getColumnClass(int col)
			{
				switch (col)
				{
					case  0: return Integer.class;
					case  1: return String.class;
					case  2: return String.class;
					case  3: return String.class;
					case  4: return String.class;
					case  5: return Byte.class;
					default: return Object.class;
				}
			}
    		public boolean isCellEditable(int row, int col){ return false; }
		};

		DefaultTableCellRenderer authorizeRenderer = new DefaultTableCellRenderer()
		{
			public void setValue(Object value)
			{
  			if (value instanceof Byte)
				{
					if(Integer.parseInt(value.toString())==0){setText("Authorize");}
					else setText("Always");
					setHorizontalTextPosition(LEFT);
          setBorder(null);
				}
			}
		};
		DefaultTableCellRenderer uinRenderer = new DefaultTableCellRenderer()
		{
			public void setValue(Object value)
			{
				setText(value.toString());
    		setHorizontalTextPosition(LEFT);
        setBorder(null);
			}
		};
		DefaultTableCellRenderer textRenderer = new DefaultTableCellRenderer()
		{
			public void setValue(Object value)
			{
				setText(value.toString());
				setHorizontalTextPosition(CENTER);
        setBorder(null);
			}
		};

		searchTm.addColumn("UIN#");
		searchTm.addColumn("Nick");
		searchTm.addColumn("First");
		searchTm.addColumn("Last");
		searchTm.addColumn("E-mail");
		searchTm.addColumn("Authorize");
		searchTable.setModel(searchTm);
		searchTable.setRowHeight(24);
		searchTable.setAutoscrolls(false);
		searchTable.getColumn("UIN#").setCellRenderer(uinRenderer);
		searchTable.getColumn("Nick").setCellRenderer(textRenderer);
		searchTable.getColumn("First").setCellRenderer(textRenderer);
		searchTable.getColumn("Last").setCellRenderer(textRenderer);
		searchTable.getColumn("E-mail").setCellRenderer(textRenderer);
		searchTable.getColumn("Authorize").setCellRenderer(authorizeRenderer);
		searchTable.setColumnSelectionAllowed(false);
		searchTable.setIntercellSpacing(new Dimension(0, 0));
		searchTable.setRowSelectionAllowed(true);
		searchTable.setShowHorizontalLines(false);
		searchTable.setShowVerticalLines(false);
		searchTable.setShowGrid(false);
		searchTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		searchTable.getTableHeader().setFont(defaultFont);
		searchTable.getTableHeader().setReorderingAllowed(false);
    addMenu.setIcon(iconBAddUser);
    sendMsgMenu.setIcon(iconMessage);
    detailMenu.setIcon(iconMInfo);
	  imageLabel.setIcon(image);
    imageLabel.setHorizontalAlignment(SwingConstants.CENTER);
    imageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
    addMenu.setForeground(Color.black);
	  sendMsgMenu.setForeground(Color.black);
	  detailMenu.setForeground(Color.black);
    labelNick.setForeground(Color.black);
    btSearch.setForeground(Color.black);
    btStop.setForeground(Color.black);
    tfNick.setForeground(Color.black);
    labelFirst.setForeground(Color.black);
    tfFirst.setForeground(Color.black);
    labelLast.setForeground(Color.black);
    tfLast.setForeground(Color.black);
    labelEmail.setForeground(Color.black);
    tfEmail.setForeground(Color.black);
    labelUIN.setForeground(Color.black);
    tfUIN.setForeground(Color.black);
    searchTable.setForeground(Color.black);
    tabSearch.setForeground(Color.black);
    jScrollPane1.setBackground(Color.white);
    searchTable.setBackground(Color.white);
    panelResult.setBackground(Color.white);
    labelSearchResult.setForeground(Color.black);
    searchTable.setFont(defaultFont);
	  addMenu.setFont(defaultFont);
	  sendMsgMenu.setFont(defaultFont);
	  detailMenu.setFont(defaultFont);
    labelNick.setFont(defaultFont);
    btSearch.setFont(defaultFont);
    btStop.setFont(defaultFont);
    tfNick.setFont(defaultFont);
    labelFirst.setFont(defaultFont);
    tfFirst.setFont(defaultFont);
    labelLast.setFont(defaultFont);
    tfLast.setFont(defaultFont);
    labelEmail.setFont(defaultFont);
    tfEmail.setFont(defaultFont);
    labelUIN.setFont(defaultFont);
    tfUIN.setFont(defaultFont);
	  searchTable.setFont(defaultFont);
    tabSearch.setFont(defaultFont);
    labelSearchResult.setFont(defaultFont);
    tabName.setBorder(defaultBorder);
	  tabUIN.setBorder(defaultBorder);
	  tabEmail.setBorder(defaultBorder);
    imageLabel.setBorder(defaultBorder);
	  tfNick.setBorder(defaultBorder);
    tfFirst.setBorder(defaultBorder);
    tfLast.setBorder(defaultBorder);
    btSearch.setBorder(defaultBorder);
    btStop.setBorder(defaultBorder);
    tfUIN.setBorder(defaultBorder);
    tfEmail.setBorder(defaultBorder);
    jScrollPane1.getViewport().setBackground(Color.white);
    jScrollPane1.setBorder(null);
    labelSearchResult.setBorder(null);
    tfNick.setMargin(new Insets(0, 2, 0, 2));
    tfFirst.setMargin(new Insets(0, 2, 0, 2));
    tfLast.setMargin(new Insets(0, 2, 0, 2));
    btSearch.setMargin(new Insets(2, 2, 2, 2));
    btStop.setMargin(new Insets(2, 2, 2, 2));
    tfUIN.setMargin(new Insets(0, 2, 0, 2));
    tfEmail.setMargin(new Insets(2, 2, 2, 2));
    btSearch.setMaximumSize(new Dimension(100, 30));
    btSearch.setMinimumSize(new Dimension(100, 30));
    btSearch.setPreferredSize(new Dimension(100, 30));
    btStop.setMinimumSize(new Dimension(100, 30));
    btStop.setPreferredSize(new Dimension(100, 30));
    btStop.setMaximumSize(new Dimension(100, 30));
    jScrollPane1.setMaximumSize(new Dimension(454, 404));
    jScrollPane1.setMinimumSize(new Dimension(454, 404));
    jScrollPane1.setPreferredSize(new Dimension(454, 404));
    imageLabel.setMaximumSize(new Dimension(45, 45));
    imageLabel.setMinimumSize(new Dimension(45, 45));
    imageLabel.setPreferredSize(new Dimension(45, 45));
    tfUIN.setMaximumSize(new Dimension(100, 25));
    tfUIN.setPreferredSize(new Dimension(100, 25));
    tfUIN.setMinimumSize(new Dimension(100, 25));
	  tabSearch.setMaximumSize(new Dimension(270, 160));
	  tabSearch.setMinimumSize(new Dimension(270, 160));
	  tabSearch.setPreferredSize(new Dimension(270, 160));
    labelNick.setPreferredSize(new Dimension(70, 25));
	  labelNick.setMaximumSize(new Dimension(70, 25));
    labelNick.setMinimumSize(new Dimension(70, 25));
    labelFirst.setMaximumSize(new Dimension(70, 25));
    labelFirst.setPreferredSize(new Dimension(70, 25));
    labelFirst.setMinimumSize(new Dimension(70, 25));
    labelLast.setMaximumSize(new Dimension(70, 25));
    labelLast.setPreferredSize(new Dimension(70, 25));
    labelLast.setMinimumSize(new Dimension(70, 25));
    tfNick.setMaximumSize(new Dimension(130, 25));
    tfNick.setPreferredSize(new Dimension(130, 25));
    tfNick.setMinimumSize(new Dimension(130, 25));
    tfFirst.setMaximumSize(new Dimension(130, 25));
    tfFirst.setPreferredSize(new Dimension(130, 25));
    tfFirst.setMinimumSize(new Dimension(130, 25));
    tfLast.setMaximumSize(new Dimension(130, 25));
    tfLast.setPreferredSize(new Dimension(130, 25));
    tfLast.setMinimumSize(new Dimension(130, 25));
    tfEmail.setMaximumSize(new Dimension(160, 25));
    tfEmail.setPreferredSize(new Dimension(170, 25));
    tfEmail.setMinimumSize(new Dimension(170, 25));
    labelEmail.setMaximumSize(new Dimension(40, 25));
    labelEmail.setPreferredSize(new Dimension(40, 25));
    labelEmail.setMinimumSize(new Dimension(40, 25));
    labelUIN.setPreferredSize(new Dimension(30, 25));
    labelUIN.setMinimumSize(new Dimension(30, 25));
    labelUIN.setMaximumSize(new Dimension(30, 25));
    tfNick.setText("");
    tfFirst.setText("");
    tfLast.setText("");
    tfEmail.setText("");
    tfUIN.setText("");
	  btStop.setEnabled(false);
    tabUIN.setName("tabUIN");
    tabName.setName("tabName");
    tabEmail.setName("tabEmail");
    labelSearchResult.setMaximumSize(new Dimension(30, 25));
    labelSearchResult.setMinimumSize(new Dimension(30, 25));
    labelSearchResult.setPreferredSize(new Dimension(30, 25));
    labelSearchResult.setText("User Found "+vResult.size()+" User(s).");
    labelSearchResult.setOpaque(true);
    jScrollPane1.setOpaque(true);
    searchPopup.add(addMenu);
	  searchPopup.add(sendMsgMenu);
	  searchPopup.add(detailMenu);
    tabSearch.addTab("UIN#", iconTabUIN, tabUIN);
    tabSearch.addTab("NAME", iconTabName, tabName);
    tabSearch.addTab("E-mail", iconTabEmail, tabEmail);
    this.getContentPane().setLayout(new BorderLayout());
    getContentPane().add(panelSearch);
	  tabName.setLayout(new GridBagLayout());
	  panelResult.setLayout(new GridBagLayout());
	  panelSearch.setLayout(new GridBagLayout());
    tabEmail.setLayout(new GridBagLayout());
    tabUIN.setLayout(new GridBagLayout());
	  panelSearchBt.setLayout(new GridBagLayout());
	  panelSearch.add(tabSearch, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.NORTHWEST, GridBagConstraints.NONE, new Insets(5, 5, 0, 5), 0, 0));
	  panelSearch.add(panelSearchBt, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
			,GridBagConstraints.NORTHEAST, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0));
    panelSearch.add(panelResult, new GridBagConstraints(0, 1, 2, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(5, 5, 5, 5), 0, 0));
    panelSearchBt.add(btSearch, new GridBagConstraints(0, 1, 2, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(40, 5, 5, 5), 0, 0));
    panelSearchBt.add(btStop, new GridBagConstraints(0, 2, 2, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 5, 0, 5), 0, 0));
    panelSearchBt.add(imageLabel, new GridBagConstraints(0, 4, 2, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(10, 0, 0, 0), 0, 0));
	  tabEmail.add(labelEmail, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 25, 10, 0), 0, 0));
    tabEmail.add(tfEmail, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 10, 10), 0, 0));
    tabUIN.add(labelUIN, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 30, 10, 0), 10, 0));
    tabUIN.add(tfUIN, new GridBagConstraints(1, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 10, 10), 10, 0));
    tabName.add(labelNick, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(10, 5, 10, 0), 0, 0));
    tabName.add(tfNick, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(10, 0, 10, 0), 10, 0));
    tabName.add(tfFirst, new GridBagConstraints(1, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 10, 0), 10, 0));
    tabName.add(tfLast, new GridBagConstraints(1, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.WEST, GridBagConstraints.NONE, new Insets(0, 0, 10, 0), 10, 0));
    tabName.add(labelFirst, new GridBagConstraints(0, 1, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 5, 10, 0), 0, 0));
    tabName.add(labelLast, new GridBagConstraints(0, 2, 1, 1, 0.0, 0.0
            ,GridBagConstraints.EAST, GridBagConstraints.NONE, new Insets(0, 5, 10, 0), 0, 0));
    panelResult.add(labelSearchResult, new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
	  panelResult.add(jScrollPane1, new GridBagConstraints(0, 1, GridBagConstraints.REMAINDER, GridBagConstraints.REMAINDER, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0));
	  jScrollPane1.getViewport().add(searchTable, null);
	  jScrollPane1.setAutoscrolls(true);

		searchTable.addMouseListener(new MouseAdapter()
		{
		  public void mousePressed(MouseEvent e)
		  {
        JTable table = (JTable)e.getSource();
			  if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
				  int r = table.rowAtPoint(e.getPoint());
          table.setRowSelectionInterval(r,r);
				  table.grabFocus();
			  }
		  }
		  public void mouseClicked(MouseEvent e)
		  {
			  int r = searchTable.rowAtPoint(e.getPoint());
			  searchTable.setRowSelectionInterval(r,r);
			  searchTable.grabFocus();
			  if (e.getClickCount()==2&&(!SwingUtilities.isRightMouseButton(e)))
			  {
				  ContactUserInfo cUserInfo = (ContactUserInfo)vResult.elementAt(r);
				  System.out.println(cUserInfo.getUIN());
          boolean found=false;
          Vector vUser=oUserInfo.getContactList();
          ContactUserInfo cU=new ContactUserInfo(oUserInfo);
          VectorManager vManager=new VectorManager();
          cU.setUIN(0);
          cU=vManager.findContactUser(vUser,cU,cUserInfo.getUIN());
          if(cU.getUIN()!=0)
          {
            found=true;
          }

          if((!found)&&(cUserInfo.getUIN()!=oUserInfo.getUIN()))
          {
            AddToListFrame aToListFrame=new AddToListFrame(oUserInfo,cUserInfo);
          }
			  }
			  else if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
				  int c=0;
				  searchPopup.show(e.getComponent(),e.getX(),e.getY());
				  searchPopup.setVisible(true);
				  ContactUserInfo cUserInfo = (ContactUserInfo)vResult.elementAt(r);
				  System.out.println(cUserInfo.getUIN());
			  }
      }
    });

	  addMenu.addActionListener(new ActionListener()
	  {
		  public void actionPerformed(ActionEvent e)
		  {
        boolean found=false;
			  int r = searchTable.getSelectedRow();
			  ContactUserInfo cUserInfo = (ContactUserInfo)vResult.elementAt(r);
  		  System.out.println(cUserInfo.getUIN());
        Vector vUser=oUserInfo.getContactList();
        ContactUserInfo cU=new ContactUserInfo(oUserInfo);
        VectorManager vManager=new VectorManager();
        cU.setUIN(0);
        cU=vManager.findContactUser(vUser,cU,cUserInfo.getUIN());
        if(cU.getUIN()!=0)
        {
          found=true;
        }

        if((!found)&&(cUserInfo.getUIN()!=oUserInfo.getUIN()))
        {
          AddToListFrame aToListFrame=new AddToListFrame(oUserInfo,cUserInfo);
        }
		  }
	  });

	  sendMsgMenu.addActionListener(new ActionListener()
	  {
		  public void actionPerformed(ActionEvent e)
		  {
			  int r = searchTable.getSelectedRow();
			  ContactUserInfo cUserInfo = (ContactUserInfo)vResult.elementAt(r);
  		  System.out.println(cUserInfo.getUIN());
        SendMessageFrame  sMessageFrame=new SendMessageFrame(oUserInfo,cUserInfo);
		  }
	  });

	  detailMenu.addActionListener(new ActionListener()
	  {
		  public void actionPerformed(ActionEvent e)
		  {
			  int r = searchTable.getSelectedRow();
			  ContactUserInfo cUserInfo = (ContactUserInfo)vResult.elementAt(r);
			  System.out.println(cUserInfo.getUIN());
        UserDetailFrame uDetailFrame=new UserDetailFrame(oUserInfo,cUserInfo);
		  }
	  });

	  btSearch.addActionListener(new ActionListener()
	  {
		  public void actionPerformed(ActionEvent e)
		  {
       imageLabel.setIcon(iconAFace);
       if(oUserInfo.getOnline())
       {
         btSearch.setEnabled(false);
			   btStop.setEnabled(true);
			   clearResult();
         sSeq=new SearchSeq(oUserInfo,SearchFrame.this);
         searchStart=true;
       }
         System.out.println(tabSearch.getSelectedIndex());
		  }
	  });

	  btStop.addActionListener(new ActionListener()
	  {
		  public void actionPerformed(ActionEvent e)
		  {
        imageLabel.setIcon(image);
        sSeq.cancelSearch();
        searchStart=false;
			  showSearchResult();
			  btStop.setEnabled(false);
        btSearch.setEnabled(true);
        System.out.println(tabSearch.getSelectedIndex());
		  }
	  });
}

  public void closeSearch()
  {
     if(searchStart)
     {
       sSeq.cancelSearch();
     }
     dispose();
  }

	public void showSearchResult()
	{
		for(int i=0; i<vResult.size(); i++)
		{
			ContactUserInfo cUserInfo = (ContactUserInfo)vResult.elementAt(i);
			searchTm.addRow( new Object[]{new Integer(cUserInfo.getUIN()), cUserInfo.getNick(), cUserInfo.getFirst(), cUserInfo.getLast(), cUserInfo.getEmail(),new Byte(cUserInfo.getAuth())});
		}
		System.out.println(searchTm.getRowCount()+" total user "+vResult.size());
    panelResult.add(labelSearchResult, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
    labelSearchResult.setText("Found "+vResult.size()+" User(s).");
	}

	public void clearResult()
	{
		for(int i=vResult.size()-1; i>=0; i--)vResult.removeElementAt(i);
		for(int i=searchTm.getRowCount()-1; i>=0; i--)searchTm.removeRow(i);
    labelSearchResult.setText("User Found "+vResult.size()+" User(s).");
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
