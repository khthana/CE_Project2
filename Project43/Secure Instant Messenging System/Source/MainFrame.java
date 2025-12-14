import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.JFrame;
import javax.swing.border.*;
import javax.swing.UIManager;
import javax.swing.table.*;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.event.TableModelListener;
import javax.swing.event.TableModelEvent;
import java.util.Vector;

public class MainFrame extends JFrame
{
   static Vector ownerUsers=new Vector();
   static OwnerUserInfo oUserInfo;
   UpdateIcon   uIcon;
   int rowSelect;
   int a;
   static MainFrame f;
   ContactListUser activeUser;
   Dimension screenSize;
   Dimension frameSize;

   Border defaultBorder  = BorderFactory.createEtchedBorder(Color.white,new java.awt.Color(110, 110, 110));;
   TitledBorder titleTo  = new TitledBorder(defaultBorder, "To");
	 Font defaultFont      = new Font("dialogInput",Font.PLAIN, 16);
	 Font boldFont         = new Font("dialogInput",Font.BOLD, 20);

  boolean secureF = false;
  boolean onlineF = false;
  boolean offlineF= false;
  boolean awaitF  = false;
  boolean notinF  = false;

  Color colorSecure     = new Color(0,0,255);
  Color colorOnline     = new Color(0,0,255);
  Color colorOffline    = new Color(255,0,0);
  Color colorAwait      = new Color(128,0,64);
  Color colorNotin      = new Color(0,0,128);

  public Image imageFrameHead         = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/sOnline.gif"));
  public final ImageIcon iconAFace    = new ImageIcon(getClass().getResource("images/aFace.gif"));
	public Border beveledBorder         = BorderFactory.createBevelBorder(BevelBorder.LOWERED,Color.white,Color.white, new java.awt.Color(134, 134, 134),new java.awt.Color(93, 93, 93));
	public Border etchedBorder          = BorderFactory.createEtchedBorder(Color.white, new java.awt.Color(134, 134, 134));
  public final ImageIcon iconGIcq     = new ImageIcon(getClass().getResource("images/gIcq.gif"));
  public final ImageIcon iconSConnecting=new ImageIcon(getClass().getResource("images/sConnecting.gif"));
  public final ImageIcon iconSOnline  = new ImageIcon(getClass().getResource("images/sOnline.gif"));
  public final ImageIcon iconSOffline = new ImageIcon(getClass().getResource("images/sOffline.gif"));
  public final ImageIcon iconSInvisible=new ImageIcon(getClass().getResource("images/sInvisible.gif"));
  public final ImageIcon iconSAway    = new ImageIcon(getClass().getResource("images/sAway.gif"));
  public final ImageIcon iconSNa      = new ImageIcon(getClass().getResource("images/sNa.gif"));
  public final ImageIcon iconSOccupied= new ImageIcon(getClass().getResource("images/sOccupied.gif"));
  public final ImageIcon iconSDnd     = new ImageIcon(getClass().getResource("images/sDnd.gif"));
  public final ImageIcon iconBAddUser = new ImageIcon(getClass().getResource("images/bAddUser.gif"));
  public final ImageIcon iconBIsagQ   = new ImageIcon(getClass().getResource("images/world.gif"));
  public final ImageIcon iconMInfo    = new ImageIcon(getClass().getResource("images/mInfo.gif"));
  public final ImageIcon iconMChange  = new ImageIcon(getClass().getResource("images/mChange.gif"));
  public final ImageIcon iconMNew     = new ImageIcon(getClass().getResource("images/mNew.gif"));
  public final ImageIcon iconMDel     = new ImageIcon(getClass().getResource("images/mDel.gif"));
  public final ImageIcon iconMShutdown= new ImageIcon(getClass().getResource("images/mShutdown.gif"));
  public final ImageIcon iconMessage  = new ImageIcon(getClass().getResource("images/message.gif"));
  public final ImageIcon iconFile     = new ImageIcon(getClass().getResource("images/file.gif"));
  public final ImageIcon iconServer   = new ImageIcon(getClass().getResource("images/server.gif"));
  public final ImageIcon iconGMessage = new ImageIcon(getClass().getResource("images/gMessage.gif"));
  public final ImageIcon iconGFile    = new ImageIcon(getClass().getResource("images/gFile.gif"));
  public final ImageIcon iconGServer  = new ImageIcon(getClass().getResource("images/gServer.gif"));
  public final ImageIcon iconAMessage = new ImageIcon(getClass().getResource("images/aMessage.gif"));
  public final ImageIcon iconAFile    = new ImageIcon(getClass().getResource("images/aFile.gif"));
  public final ImageIcon iconAServer  = new ImageIcon(getClass().getResource("images/aServer.gif"));
  public final ImageIcon iconFace     = new ImageIcon(getClass().getResource("images/face.gif"));
  public final ImageIcon iconCheck    = new ImageIcon(getClass().getResource("images/check.gif"));
  public final ImageIcon iconBlank    = new ImageIcon(getClass().getResource("images/blank.gif"));
  public final ImageIcon iconAllUser  = new ImageIcon(getClass().getResource("images/allUser.gif"));
  public final ImageIcon iconOnlineUser= new ImageIcon(getClass().getResource("images/onlineUser.gif"));


  public final GridBagConstraints gcadd = new GridBagConstraints(0, 0, GridBagConstraints.REMAINDER, 1,
    1.0, 0.0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
	public final GridBagConstraints gcsicq = new GridBagConstraints(0, 1, 1, 1,
    0.0, 0.0, GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
	public final GridBagConstraints gcstatus = new GridBagConstraints(1, GridBagConstraints.RELATIVE, 1, 1,
    1.0, 0.0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gcfill = new GridBagConstraints(0, 4, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gcscroll = new GridBagConstraints(0, 0, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc0 = new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc1 = new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc2 = new GridBagConstraints(0, 2, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc3 = new GridBagConstraints(0, 3, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc4 = new GridBagConstraints(0, 4, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc5 =  new GridBagConstraints(0, 5, 1, 1, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gc6 =  new GridBagConstraints(0, 5, 1, GridBagConstraints.REMAINDER, 1.0, 1.0
            ,GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gchp = new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gclp = new GridBagConstraints(0, 1, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gcl = new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gcsubp = new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.NONE, new Insets(0, 0, 0, 0), 0, 0);
  public final GridBagConstraints gcline = new GridBagConstraints(0, 0, 1, 1, 1.0, 0.0
            ,GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0);

  JPanel topPanel     = new JPanel();
  JPanel centerPanel  = new JPanel();
  JPanel botPanel     = new JPanel();
  JPanel fillP        = new JPanel();
  JPanel scrollP      = new JPanel();
  JPanel secureP      = new JPanel();
  JPanel onlineP      = new JPanel();
  JPanel offlineP     = new JPanel();
  JPanel awaitP       = new JPanel();
  JPanel notinP       = new JPanel();

  public JPanel secureHP  = new JPanel();
  public JPanel secureLP  = new JPanel();
  public JPanel onlineHP  = new JPanel();
  public JPanel onlineLP  = new JPanel();
  public JPanel offlineHP = new JPanel();
  public JPanel offlineLP = new JPanel();
  public JPanel awaitHP   = new JPanel();
  public JPanel awaitLP   = new JPanel();
  public JPanel notinHP   = new JPanel();
  public JPanel notinLP   = new JPanel();
  public JPanel subSecureP= new JPanel();
  public JPanel subOnlineP= new JPanel();
  public JPanel subOfflineP= new JPanel();
  public JPanel subAwaitP = new JPanel();
  public JPanel subNotinP = new JPanel();

  public JButton allOnBt  = new JButton();
  public JButton addBt    = new JButton();
  public JButton sicqBt   = new JButton();
  public JButton statusBt = new JButton();

  JLabel secureHL = new JLabel();
  JLabel secureH  = new JLabel();
  JLabel onlineH  = new JLabel();
  JLabel onlineHL = new JLabel();
  JLabel offlineH = new JLabel();
  JLabel offlineHL= new JLabel();
  JLabel awaitH   = new JLabel();
  JLabel awaitHL  = new JLabel();
  JLabel notinH   = new JLabel();
  JLabel notinHL  = new JLabel();
  JScrollPane centerScrollPane = new JScrollPane();

  JPopupMenu sicqPopup        = new JPopupMenu();
  JPopupMenu statusPopup      = new JPopupMenu();
  JMenuItem changeDetailMenu  = new JMenuItem();
  JMenu changeICQMenu      		= new JMenu();
  JMenuItem addICQMenu        = new JMenuItem();
  JMenu remICQMenu            = new JMenu();
  JMenuItem shutdownMenu      = new JMenuItem();
  JMenuItem changeMenuItem    = new JMenuItem();
  JMenuItem remMenuItem       = new JMenuItem();

  JMenuItem onlineMenu        = new JMenuItem();
  JMenuItem awayMenu		      = new JMenuItem();
  JMenuItem extAwayMenu		    = new JMenuItem();
  JMenuItem occupiedMenu		  = new JMenuItem();
  JMenuItem dndMenu           = new JMenuItem();
  JMenuItem invisMenu         = new JMenuItem();
  JMenuItem offlineMenu       = new JMenuItem();

  ButtonGroup remGroup        = new ButtonGroup();
  ButtonGroup changeGroup     = new ButtonGroup();

  JPopupMenu securePopup      = new JPopupMenu();
  JMenuItem sendSecureMsgMenu = new JMenuItem("Message");
  JMenuItem sendSecureFileMenu= new JMenuItem("File");
  JMenuItem secureDetailMenu  = new JMenuItem("Detail");
  JMenuItem secureDeleteMenu  = new JMenuItem("Delete");

  JPopupMenu onlinePopup      = new JPopupMenu();
  JMenuItem sendOnMsgMenu     = new JMenuItem("Message");
  JMenuItem sendOnFileMenu    = new JMenuItem("File");
  JMenuItem onDetailMenu      = new JMenuItem("Detail");
  JMenuItem onDeleteMenu      = new JMenuItem("Delete");

  JPopupMenu offlinePopup     = new JPopupMenu();
  JMenuItem sendOffMsgMenu    = new JMenuItem("Message");
  JMenuItem offDetailMenu     = new JMenuItem("Detail");
  JMenuItem offDeleteMenu     = new JMenuItem("Delete");

  JPopupMenu notinPopup       = new JPopupMenu();
  JMenuItem sendNotinMsgMenu  = new JMenuItem("Message");
  JMenuItem notinDetailMenu   = new JMenuItem("Detail");
  JMenuItem addToListMenu     = new JMenuItem("Add to Contact List");
  JMenuItem notinDeleteMenu   = new JMenuItem("Delete");

  JPopupMenu awaitPopup       = new JPopupMenu();
  JMenuItem sendAwaitMsgMenu  = new JMenuItem("Message");
  JMenuItem awaitDetailMenu   = new JMenuItem("Detail");
  JMenuItem reAuthorizeMenu   = new JMenuItem("Re-Request");
  JMenuItem awaitDeleteMenu   = new JMenuItem("Delete");

  JTable secureTable  = new JTable();
  JTable onlineTable  = new JTable();
  JTable offlineTable = new JTable();
  JTable awaitTable   = new JTable();
  JTable notinTable   = new JTable();
  DefaultTableModel secureTm,onlineTm,offlineTm,awaitTm,notinTm;

  public MainFrame()
  {

    try
    {
       UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
       ownerUsers=readOwnerUser();
       jbInit();
       setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
       setSize(new Dimension(150,400));
       screenSize = Toolkit.getDefaultToolkit().getScreenSize();
       frameSize = getSize();
       if (frameSize.height > screenSize.height) frameSize.height = screenSize.height;
       if (frameSize.width > screenSize.width) frameSize.width = screenSize.width;
       setLocation((screenSize.width-frameSize.width)/2, (screenSize.height-frameSize.height)/2);
       this.setVisible (false);
       this.setEnabled(false);
       for(int i=0;i<ownerUsers.size();i++)
       {
           OwnerUserInfo oUsers=(OwnerUserInfo)ownerUsers.elementAt(i);
           newMenuItem (oUsers);
       }

       if(ownerUsers.size()>0)
       {
          this.setVisible (true);
          OwnerUserInfo oUserT= (OwnerUserInfo)ownerUsers.elementAt (0);
          setActiveUser (oUserT);
          PasswordFrame loginFrame1 = new PasswordFrame(oUserInfo); //beer edit
       }
       else
       {
          AddICQFrame aICQFrame=new AddICQFrame(this);
       }
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  }

  protected void processWindowEvent(WindowEvent e)
  {
    super.processWindowEvent(e);
    if(e.getID() == WindowEvent.WINDOW_CLOSING)
    {
      oUserInfo.disconnect();
      WriteOwnerDataFile   wOwnerDataFile   =new WriteOwnerDataFile("sicq.ifo",ownerUsers);
      System.out.println("Bye Bye.");
      System.exit(0);
    }
    else if(e.getID()==WindowEvent.WINDOW_OPENED)
    {
			System.out.println("Start Program.......");
    }
  }

  public static void Begin()
  {
    f = new MainFrame();
  }

//********************** Init ************************************
  private void jbInit() throws Exception
  {
		secureTm = new DefaultTableModel()
    {
      public boolean isCellEditable(int row, int col) {return false;}
    };

    onlineTm = new DefaultTableModel()
    {
      public boolean isCellEditable(int row, int col) {return false;}
    };

    offlineTm = new DefaultTableModel()
    {
      public boolean isCellEditable(int row, int col) {return false;}
    };

    awaitTm = new DefaultTableModel()
    {
      public boolean isCellEditable(int row, int col) {return false;}
    };

    notinTm = new DefaultTableModel()
    {
      public boolean isCellEditable(int row, int col) {return false;}
    };
		DefaultTableCellRenderer myRenderer = new DefaultTableCellRenderer()
		{
	    public void setValue(Object value)
      {
      	if (value instanceof ContactUserInfo)
				{
					ContactUserInfo user = (ContactUserInfo)value;
					setText(user.getNick());
					setBorder(null);

					if(user.getDataStatus()==user.c_MsgText)
          {setIcon(iconAMessage);user.iconIdle=iconGMessage;}
          else if(user.getDataStatus()==user.c_MsgUserAdd)
          {setIcon(iconAServer);user.iconIdle=iconGServer;}
          else if(user.getDataStatus()==user.c_MsgAuthReq)
          {setIcon(iconAServer);user.iconIdle=iconGServer;}
          else if(user.getDataStatus()==user.c_MsgAuthGrant)
          {setIcon(iconAServer);user.iconIdle=iconGServer;}
          else if(user.getDataStatus()==user.c_MsgAuthIgnore)
          {setIcon(iconAServer);user.iconIdle=iconGServer;}
          else if(user.getDataStatus()==user.c_MsgURL)
          {setIcon(iconAServer);user.iconIdle=iconGServer;}
          else if(user.getDataStatus()==user.c_MsgContact)
          {setIcon(iconAServer);user.iconIdle=iconGServer;}
				  else if(user.getDataStatus()==user.c_MsgFile)
          {setIcon(iconAFile);user.iconIdle=iconGFile;}
					else if(user.getDataStatus()==user.c_NoMsg)
          {
              if((user.getUserStatus()==user.c_Online)||(user.getUserStatus()==user.c_Offline))setIcon(user.iconIdle);
              else if(user.getUserStatus()==user.c_Away){setIcon(iconSAway);}
              else if(user.getUserStatus()==user.c_Na){setIcon(iconSNa);}
              else if(user.getUserStatus()==user.c_Occupied){setIcon(iconSOccupied);}
              else if(user.getUserStatus()==user.c_Dnd){setIcon(iconSDnd);}
              else setIcon(user.iconIdle);
          }
          else{setIcon(iconAServer);user.iconIdle=iconGServer;}
				}
	    }
		};

    secureTable.addFocusListener(new FocusAdapter()
    {
      public void focusLost(FocusEvent e)	{secureTable.clearSelection();}
    });
    onlineTable.addFocusListener(new FocusAdapter()
    {
      public void focusLost(FocusEvent e)	{onlineTable.clearSelection();}
    });
    offlineTable.addFocusListener(new FocusAdapter()
    {
      public void focusLost(FocusEvent e)	{offlineTable.clearSelection();}
    });
    awaitTable.addFocusListener(new FocusAdapter()
    {
      public void focusLost(FocusEvent e)	{awaitTable.clearSelection();}
    });
    notinTable.addFocusListener(new FocusAdapter()
    {
      public void focusLost(FocusEvent e)	{notinTable.clearSelection();}
    });

    secureTable.addMouseListener(new MyContactListener()
    {
		  public void mouseClicked(MouseEvent e)
		  {
        int r = secureTable.rowAtPoint(new Point(e.getX(),e.getY()));
        secureTable.setRowSelectionInterval(r,r);
        secureTable.grabFocus();
        ContactUserInfo cUserInfo = (ContactUserInfo)(secureTm.getValueAt(r,0));
        if (e.getClickCount()==2&&(!SwingUtilities.isRightMouseButton(e)))
			  {
          getDataFromContact(cUserInfo);
			  }
			  else if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
          securePopup.show(e.getComponent(),e.getX(),e.getY());
          rowSelect = r;
          securePopup.setVisible(true);
			  }
			}
    });

    onlineTable.addMouseListener(new MyContactListener()
    {
		  public void mouseClicked(MouseEvent e)
		  {
        int r = onlineTable.rowAtPoint(new Point(e.getX(),e.getY()));
        onlineTable.setRowSelectionInterval(r,r);
        onlineTable.grabFocus();
        ContactUserInfo cUserInfo = (ContactUserInfo)(onlineTm.getValueAt(r,0));
        if (e.getClickCount()==2&&(!SwingUtilities.isRightMouseButton(e)))
			  {
          getDataFromContact(cUserInfo);
        }
			  else if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
          onlinePopup.show(e.getComponent(),e.getX(),e.getY());
          rowSelect = r;
          onlinePopup.setVisible(true);
			  }
			}
    });

    offlineTable.addMouseListener(new MyContactListener()
    {
		  public void mouseClicked(MouseEvent e)
		  {
        int r = offlineTable.rowAtPoint(new Point(e.getX(),e.getY()));
        offlineTable.setRowSelectionInterval(r,r);
        offlineTable.grabFocus();
			  ContactUserInfo cUserInfo = (ContactUserInfo)(offlineTm.getValueAt(r,0));
        if (e.getClickCount()==2&&(!SwingUtilities.isRightMouseButton(e)))
			  {
          getDataFromContact(cUserInfo);
			  }
			  else if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
          offlinePopup.show(e.getComponent(),e.getX(),e.getY());
          rowSelect = r;
          offlinePopup.setVisible(true);
			  }
			}
    });
    awaitTable.addMouseListener(new MyContactListener()
    {
		  public void mouseClicked(MouseEvent e)
		  {
        int r = awaitTable.rowAtPoint(new Point(e.getX(),e.getY()));
        awaitTable.setRowSelectionInterval(r,r);
        awaitTable.grabFocus();
        ContactUserInfo cUserInfo = (ContactUserInfo)(awaitTm.getValueAt(r,0));
        if (e.getClickCount()==2&&(!SwingUtilities.isRightMouseButton(e)))
			  {
          getDataFromContact(cUserInfo);
			  }
			  else if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
          awaitPopup.show(e.getComponent(),e.getX(),e.getY());
          rowSelect = r;
          awaitPopup.setVisible(true);
			  }
			}
    });
    notinTable.addMouseListener(new MyContactListener()
    {
		  public void mouseClicked(MouseEvent e)
		  {
        int r = notinTable.rowAtPoint(new Point(e.getX(),e.getY()));
        notinTable.setRowSelectionInterval(r,r);
        notinTable.grabFocus();
        ContactUserInfo cUserInfo = (ContactUserInfo)(notinTm.getValueAt(r,0));
        if (e.getClickCount()==2&&(!SwingUtilities.isRightMouseButton(e)))
			  {
          getDataFromContact(cUserInfo);
        }
			  else if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
          notinPopup.show(e.getComponent(),e.getX(),e.getY());
          rowSelect = r;
          notinPopup.setVisible(true);
			  }
			}
    });

    notinTm.addColumn("Name");
    awaitTm.addColumn("Name");
    offlineTm.addColumn("Name");
    onlineTm.addColumn("Name");
    secureTm.addColumn("Name");
    secureTable.setModel(secureTm);
    onlineTable.setModel(onlineTm);
    offlineTable.setModel(offlineTm);
    awaitTable.setModel(awaitTm);
    notinTable.setModel(notinTm);
	  secureTable.getColumn("Name").setCellRenderer(myRenderer);
	  onlineTable.getColumn("Name").setCellRenderer(myRenderer);
	  offlineTable.getColumn("Name").setCellRenderer(myRenderer);
	  awaitTable.getColumn("Name").setCellRenderer(myRenderer);
	  notinTable.getColumn("Name").setCellRenderer(myRenderer);

    this.getContentPane().setLayout(new BorderLayout());
    secureTable.setBackground(new java.awt.Color(204, 204, 204));
    secureTable.setAutoscrolls(false);
    secureTable.setIntercellSpacing(new Dimension(0, 0));
    secureTable.setShowHorizontalLines(false);
    secureTable.setShowVerticalLines(false);
    onlineTable.setBackground(new java.awt.Color(204, 204, 204));
    onlineTable.setAutoscrolls(false);
    onlineTable.setIntercellSpacing(new Dimension(0, 0));
    onlineTable.setShowHorizontalLines(false);
    onlineTable.setShowVerticalLines(false);
    offlineTable.setBackground(new java.awt.Color(204, 204, 204));
    offlineTable.setAutoscrolls(false);
    offlineTable.setIntercellSpacing(new Dimension(0, 0));
    offlineTable.setShowHorizontalLines(false);
    offlineTable.setShowVerticalLines(false);
    awaitTable.setBackground(new java.awt.Color(204, 204, 204));
    awaitTable.setAutoscrolls(false);
    awaitTable.setIntercellSpacing(new Dimension(0, 0));
    awaitTable.setShowHorizontalLines(false);
    awaitTable.setShowVerticalLines(false);
    notinTable.setBackground(new java.awt.Color(204,204,204));
    notinTable.setAutoscrolls(false);
    notinTable.setShowHorizontalLines(false);
    notinTable.setShowVerticalLines(false);
    secureTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    onlineTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    offlineTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    awaitTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    notinTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
    secureTable.setRowHeight(24);
    onlineTable.setRowHeight(24);
    offlineTable.setRowHeight(24);
    awaitTable.setRowHeight(24);
    notinTable.setRowHeight(24);

    //-------------- end ContactList Table -------------------
    allOnBt.setBorder(defaultBorder);
    allOnBt.setPreferredSize(new Dimension(60, 27));
    allOnBt.setMaximumSize(new Dimension(60, 27));
    allOnBt.setMinimumSize(new Dimension(60, 27));
    allOnBt.setMargin(new Insets(2, 2, 2, 2));
    statusBt.setBorder(defaultBorder);
    statusBt.setMargin(new Insets(2, 2, 2, 2));
    statusBt.setMinimumSize(new Dimension(60, 27));
    statusBt.setMaximumSize(new Dimension(60, 27));
    statusBt.setPreferredSize(new Dimension(60, 27));
    sicqBt.setBorder(defaultBorder);
    sicqBt.setMaximumSize(new Dimension(60, 27));
    sicqBt.setMinimumSize(new Dimension(60, 27));
    sicqBt.setPreferredSize(new Dimension(60, 27));
    sicqBt.setMargin(new Insets(2, 2, 2, 2));
    addBt.setBorder(defaultBorder);
    addBt.setMinimumSize(new Dimension(60, 27));
    addBt.setMaximumSize(new Dimension(60, 27));
    addBt.setPreferredSize(new Dimension(60, 27));
    addBt.setMargin(new Insets(2, 2, 2, 2));
    fillP.setMinimumSize(new Dimension(125, 0));
    fillP.setPreferredSize(new Dimension(125, 0));

    //----------start of Add Menu and button Listener------------
    sendSecureMsgMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        sendSecureMsgMenu_actionPerformed(e);
      }
    });
    sendSecureFileMenu.addActionListener(new ActionListener()
		{

			public void actionPerformed(ActionEvent e)
			{
				sendSecureFileMenu_actionPerformed(e);
			}
		});
    secureDetailMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        secureDetailMenu_actionPerformed(e);
      }
    });
    secureDeleteMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        secureDeleteMenu_actionPerformed(e);
      }
    });
    sendOnMsgMenu.addActionListener(new ActionListener()
    {

      public void actionPerformed(ActionEvent e)
      {
        sendOnMsgMenu_actionPerformed(e);
      }
    });
    sendOnFileMenu.addActionListener(new ActionListener()
		{

			public void actionPerformed(ActionEvent e)
			{
				sendOnFileMenu_actionPerformed(e);
			}
		});
    onDeleteMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        onDeleteMenu_actionPerformed(e);
      }
    });
    onDetailMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        onDetailMenu_actionPerformed(e);
      }
    });
    sendNotinMsgMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        sendNotinMsgMenu_actionPerformed(e);
      }
    });
    notinDetailMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        notinDetailMenu_actionPerformed(e);
      }
    });
    addToListMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        addToListMenu_actionPerformed(e);
      }
    });
    notinDeleteMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        notinDeleteMenu_actionPerformed(e);
      }
    });

		sendOffMsgMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        sendOffMsgMenu_actionPerformed(e);
      }
    });
    offDetailMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        offDetailMenu_actionPerformed(e);
      }
    });
    offDeleteMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        offDeleteMenu_actionPerformed(e);
      }
    });
    sendAwaitMsgMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        sendAwaitMsgMenu_actionPerformed(e);
      }
    });
    awaitDetailMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        awaitDetailMenu_actionPerformed(e);
      }
    });
    awaitDeleteMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        awaitDeleteMenu_actionPerformed(e);
      }
    });
    reAuthorizeMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        reAuthorizeMenu_actionPerformed(e);
      }
    });

    changeDetailMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        changeDetailMenu_actionPerformed(e);
      }
    });
    addICQMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        addICQMenu_actionPerformed(e);
      }
    });
    shutdownMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        shutdownMenu_actionPerformed(e);
      }
    });
    onlineMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        onlineMenu_actionPerformed(e);
      }
    });

    offlineMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        offlineMenu_actionPerformed(e);
      }
    });

	//---------------------------------------------------------------
    awayMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        awayMenu_actionPerformed(e);
      }
    });
    dndMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        dndMenu_actionPerformed(e);
      }
    });
    invisMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        invisMenu_actionPerformed(e);
      }
    });
    extAwayMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        extAwayMenu_actionPerformed(e);
      }
    });
    occupiedMenu.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        occupiedMenu_actionPerformed(e);
      }
    });

 	//-----------------------------button------------------------
    allOnBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        allOnBt_actionPerformed(e);
      }
    });
    statusBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        statusBt_actionPerformed(e);
      }
    });
    sicqBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        sicqBt_actionPerformed(e);
      }
    });
    addBt.addActionListener(new ActionListener()
    {
      public void actionPerformed(ActionEvent e)
      {
        addBt_actionPerformed(e);
      }
    });
    //----------end of add menu and button listener--------------

    centerScrollPane.setBorder(defaultBorder);
    awaitH.setAlignmentX((float) 0.5);
    awaitH.setMaximumSize(new Dimension(111, 20));
    awaitH.setMinimumSize(new Dimension(111, 20));
    awaitH.setPreferredSize(new Dimension(111, 20));
    awaitH.setHorizontalAlignment(SwingConstants.CENTER);
    awaitH.setHorizontalTextPosition(SwingConstants.CENTER);
    notinH.setAlignmentX((float) 0.5);
    notinH.setMaximumSize(new Dimension(53, 20));
    notinH.setMinimumSize(new Dimension(53, 20));
    notinH.setPreferredSize(new Dimension(53, 20));
    notinH.setHorizontalAlignment(SwingConstants.CENTER);
    notinH.setHorizontalTextPosition(SwingConstants.CENTER);
    offlineH.setAlignmentX((float) 0.5);
    offlineH.setMaximumSize(new Dimension(36, 20));
    offlineH.setMinimumSize(new Dimension(36, 20));
    offlineH.setPreferredSize(new Dimension(36, 20));
    offlineH.setHorizontalAlignment(SwingConstants.CENTER);
    offlineH.setHorizontalTextPosition(SwingConstants.CENTER);
    onlineH.setAlignmentX((float) 0.5);
    onlineH.setMaximumSize(new Dimension(36, 20));
    onlineH.setMinimumSize(new Dimension(36, 20));
    onlineH.setPreferredSize(new Dimension(36, 20));
    onlineH.setHorizontalAlignment(SwingConstants.CENTER);
    onlineH.setHorizontalTextPosition(SwingConstants.CENTER);
    secureH.setAlignmentX((float) 0.5);
    secureH.setMaximumSize(new Dimension(40, 20));
    secureH.setMinimumSize(new Dimension(40, 20));
    secureH.setPreferredSize(new Dimension(40, 20));
    secureH.setHorizontalAlignment(SwingConstants.CENTER);
    secureH.setHorizontalTextPosition(SwingConstants.CENTER);
    this.setIconImage(imageFrameHead);
    this.getContentPane().add(topPanel, BorderLayout.NORTH);
    this.getContentPane().add(centerPanel, BorderLayout.CENTER);
    this.getContentPane().add(botPanel, BorderLayout.SOUTH);
    topPanel.setLayout(new BorderLayout());
    centerPanel.setLayout(new GridBagLayout());
    botPanel.setLayout(new GridBagLayout());
    secureLP.setLayout(new BorderLayout());
    onlineLP.setLayout(new BorderLayout());
    offlineLP.setLayout(new BorderLayout());
    awaitLP.setLayout(new BorderLayout());
    notinLP.setLayout(new BorderLayout());
//-----------------------------------------------------------
    topPanel.setForeground(Color.black);
    centerPanel.setForeground(Color.black);
    botPanel.setForeground(Color.black);
    addICQMenu.setForeground(Color.black);
    remICQMenu.setForeground(Color.black);
    changeICQMenu.setForeground(Color.black);
    changeDetailMenu.setForeground(Color.black);
    shutdownMenu.setForeground(Color.black);
    onlineMenu.setForeground(Color.black);
    offlineMenu.setForeground(Color.black);
    allOnBt.setForeground(Color.black);
    addBt.setForeground(Color.black);
    sicqBt.setForeground(Color.black);
    statusBt.setForeground(Color.black);
    secureH.setForeground(Color.black);
    onlineH.setForeground(Color.black);
    offlineH.setForeground(Color.black);
    awaitH.setForeground(Color.black);
    notinH.setForeground(Color.black);
    sendSecureMsgMenu.setForeground(Color.black);
    sendSecureFileMenu.setForeground(Color.black);
    secureDetailMenu.setForeground(Color.black);
    secureDeleteMenu.setForeground(Color.black);
    sendOnMsgMenu.setForeground(Color.black);
    sendOnFileMenu.setForeground(Color.black);
    onDetailMenu.setForeground(Color.black);
    onDeleteMenu.setForeground(Color.black);
	  awayMenu.setForeground(Color.black);
	  dndMenu.setForeground(Color.black);
	  invisMenu.setForeground(Color.black);
	  extAwayMenu.setForeground(Color.black);
	  occupiedMenu.setForeground(Color.black);
    secureTable.setForeground(colorSecure);
    onlineTable.setForeground(colorOnline);
    offlineTable.setForeground(colorOffline);
    awaitTable.setForeground(colorAwait);
    notinTable.setForeground(colorNotin);
//-------------------------------------------------------------
    topPanel.setFont(defaultFont);
    centerPanel.setFont(defaultFont);
    botPanel.setFont(defaultFont);
    addICQMenu.setFont(defaultFont);
    remICQMenu.setFont(defaultFont);
    changeICQMenu.setFont(defaultFont);
    changeDetailMenu.setFont(defaultFont);
    shutdownMenu.setFont(defaultFont);
    onlineMenu.setFont(defaultFont);
    offlineMenu.setFont(defaultFont);
    allOnBt.setFont(defaultFont);
    addBt.setFont(defaultFont);
    sicqBt.setFont(defaultFont);
    statusBt.setFont(defaultFont);
    secureH.setFont(defaultFont);
    onlineH.setFont(defaultFont);
    offlineH.setFont(defaultFont);
    awaitH.setFont(defaultFont);
    notinH.setFont(defaultFont);
    sendSecureMsgMenu.setFont(defaultFont);
    sendSecureFileMenu.setFont(defaultFont);
    secureDetailMenu.setFont(defaultFont);
    secureDeleteMenu.setFont(defaultFont);
    sendOnMsgMenu.setFont(defaultFont);
    sendOnFileMenu.setFont(defaultFont);
    onDetailMenu.setFont(defaultFont);
    onDeleteMenu.setFont(defaultFont);

    secureTable.setFont(boldFont);
    onlineTable.setFont(boldFont);
    offlineTable.setFont(boldFont);
    awaitTable.setFont(boldFont);
    notinTable.setFont(boldFont);
//-----------------------------------------------------------------
  	awayMenu.setFont(defaultFont);
	  dndMenu.setFont(defaultFont);
	  invisMenu.setFont(defaultFont);
	  extAwayMenu.setFont(defaultFont);
	  occupiedMenu.setFont(defaultFont);
//----------------------------------------------------------------
  onlineMenu.setIcon(iconSOnline);
	awayMenu.setIcon(iconSAway);
	extAwayMenu.setIcon(iconSNa);
	dndMenu.setIcon(iconSDnd);
	occupiedMenu.setIcon(iconSOccupied);
	invisMenu.setIcon(iconSInvisible);
  offlineMenu.setIcon(iconSOffline);
//----------------------------------------------------------------
  onlineMenu.setText("Available/Connect");
	awayMenu.setText("Away");
	extAwayMenu.setText("N/A [Extended Away]");
	dndMenu.setText("DND [Do not Disturb]");
	occupiedMenu.setText("Occupied [Urgent Msgs]");
	invisMenu.setText("Privacy [Invisible]");
  offlineMenu.setText("Offline/Disconnect");
//----------------set icon ----------------------------------------

    allOnBt.setIcon(iconOnlineUser);
    sicqBt.setIcon(iconBIsagQ);
    statusBt.setIcon(iconSOffline);
    addBt.setIcon(iconBAddUser);
    addICQMenu.setIcon(iconMNew);
    remICQMenu.setIcon(iconMDel);
    changeICQMenu.setIcon(iconMChange);
    changeDetailMenu.setIcon(iconMInfo);
    shutdownMenu.setIcon(iconMShutdown);

//---------------setText-----------------------------------------
    allOnBt.setText("Online");
    addBt.setText("Add User");
    sicqBt.setText("IsagQ");
    statusBt.setText("Offline");
    addICQMenu.setText("Add ICQ# to Computer");
    remICQMenu.setText("Remove ICQ# from Computer");
    changeICQMenu.setText("Change Active User");
    changeDetailMenu.setText("Change/View My Detail");
    shutdownMenu.setText("Shutdown");

    sendOffMsgMenu.setFont(defaultFont);
    sendNotinMsgMenu.setFont(defaultFont);
    sendAwaitMsgMenu.setFont(defaultFont);
    offDetailMenu.setFont(defaultFont);
    notinDetailMenu.setFont(defaultFont);
    awaitDetailMenu.setFont(defaultFont);
    offDeleteMenu.setFont(defaultFont);
    notinDeleteMenu.setFont(defaultFont);
    awaitDeleteMenu.setFont(defaultFont);
    addToListMenu.setFont(defaultFont);
    reAuthorizeMenu.setFont(defaultFont);

    sendOffMsgMenu.setIcon(iconMessage);
    sendNotinMsgMenu.setIcon(iconMessage);
    sendAwaitMsgMenu.setIcon(iconMessage);

    offDetailMenu.setIcon(iconMInfo);
    notinDetailMenu.setIcon(iconMInfo);
    awaitDetailMenu.setIcon(iconMInfo);

    offDeleteMenu.setIcon(iconMDel);
    notinDeleteMenu.setIcon(iconMDel);
    awaitDeleteMenu.setIcon(iconMDel);

    addToListMenu.setIcon(iconBAddUser);
    reAuthorizeMenu.setIcon(this.iconServer);

//--------------Popup Menu--------------------------------------
    sendSecureMsgMenu.setIcon(iconMessage);
    sendSecureFileMenu.setIcon(iconFile);
    secureDetailMenu.setIcon(iconMInfo);
    secureDeleteMenu.setIcon(iconMDel);

    sendOnMsgMenu.setIcon(iconMessage);
    sendOnFileMenu.setIcon(iconFile);
    onDetailMenu.setIcon(iconMInfo);
    onDeleteMenu.setIcon(iconMDel);

    sicqPopup.add(changeDetailMenu);
    sicqPopup.addSeparator();
	  sicqPopup.add(changeICQMenu);
    sicqPopup.add(addICQMenu);
    sicqPopup.add(remICQMenu);
    sicqPopup.addSeparator();
    sicqPopup.add(shutdownMenu);
//--------------------------------------------------------------
    statusPopup.add(onlineMenu);
    statusPopup.addSeparator();
	  statusPopup.add(awayMenu);
	  statusPopup.add(extAwayMenu);
    statusPopup.addSeparator();
	  statusPopup.add(occupiedMenu);
	  statusPopup.add(dndMenu);
    statusPopup.addSeparator();
	  statusPopup.add(invisMenu);
    statusPopup.add(offlineMenu);
//-------------------------------------------------------------
    securePopup.add(sendSecureMsgMenu);
    securePopup.add(sendSecureFileMenu);
    securePopup.add(secureDetailMenu);
    securePopup.addSeparator();
    securePopup.add(secureDeleteMenu);

    onlinePopup.add(sendOnMsgMenu);
    onlinePopup.add(sendOnFileMenu);
    onlinePopup.add(onDetailMenu);
    onlinePopup.addSeparator();
    onlinePopup.add(onDeleteMenu);

		offlinePopup.add(sendOffMsgMenu);
		offlinePopup.add(offDetailMenu);
		offlinePopup.addSeparator();
		offlinePopup.add(offDeleteMenu);

		notinPopup.add(sendNotinMsgMenu);
		notinPopup.add(notinDetailMenu);
		notinPopup.add(addToListMenu);
		notinPopup.addSeparator();
		notinPopup.add(notinDeleteMenu);

		awaitPopup.add(sendAwaitMsgMenu);
		awaitPopup.add(awaitDetailMenu);
		awaitPopup.add(reAuthorizeMenu);
		awaitPopup.addSeparator();
		awaitPopup.add(awaitDeleteMenu);

    scrollP.setLayout(new GridBagLayout());
    centerScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    centerScrollPane.getViewport().setBackground(new Color(204,204,204));
    centerScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

    secureP.setLayout(new GridBagLayout());
    onlineP.setLayout(new GridBagLayout());
    offlineP.setLayout(new GridBagLayout());
    awaitP.setLayout(new GridBagLayout());
    notinP.setLayout(new GridBagLayout());
    fillP.setLayout(new GridBagLayout());

    secureHP.setLayout(new GridBagLayout());
    secureHL.setBorder(defaultBorder);
    secureHL.setMinimumSize(new Dimension(0, 2));
    secureHL.setPreferredSize(new Dimension(0, 2));
    secureH.setText(" Secure ");
    subSecureP.setLayout(new FlowLayout());
    onlineHP.setLayout(new GridBagLayout());
    onlineH.setText(" Online ");
    subOnlineP.setLayout(new FlowLayout());
    onlineHL.setPreferredSize(new Dimension(0, 2));
    onlineHL.setMinimumSize(new Dimension(0, 2));
    onlineHL.setBorder(defaultBorder);
    offlineHP.setLayout(new GridBagLayout());
    offlineH.setText(" Offline ");
    subOfflineP.setLayout(new FlowLayout());
    offlineHL.setBorder(defaultBorder);
    offlineHL.setMinimumSize(new Dimension(0, 2));
    offlineHL.setPreferredSize(new Dimension(0, 2));
    awaitHP.setLayout(new GridBagLayout());
    subAwaitP.setLayout(new FlowLayout());
    awaitH.setText(" Awaiting Authorization ");
    awaitHL.setPreferredSize(new Dimension(0, 2));
    awaitHL.setMinimumSize(new Dimension(0, 2));
    awaitHL.setBorder(defaultBorder);
    notinHP.setLayout(new GridBagLayout());
    notinH.setText(" Not in List ");
    subNotinP.setLayout(new FlowLayout());
    notinHL.setBorder(defaultBorder);
    notinHL.setMinimumSize(new Dimension(0, 2));
    notinHL.setPreferredSize(new Dimension(0, 2));

    this.getContentPane().add(topPanel, BorderLayout.NORTH);
    topPanel.add(allOnBt, BorderLayout.WEST);
    this.getContentPane().add(centerPanel, BorderLayout.CENTER);
    centerPanel.add(centerScrollPane, gcscroll);
    centerScrollPane.getViewport().add(scrollP, null);

    secureP.add(secureHP, gchp);
    secureHP.add(subSecureP, gcsubp);
    subSecureP.add(secureH, null);
    secureHP.add(secureHL, gcline);
    secureP.add(secureLP, gclp);
    secureLP.add(secureTable, BorderLayout.CENTER);

    onlineP.add(onlineHP, gchp);
    onlineHP.add(subOnlineP, gcsubp);
    subOnlineP.add(onlineH, null);
    onlineHP.add(onlineHL, gcline);
    onlineP.add(onlineLP, gclp);
    onlineLP.add(onlineTable, BorderLayout.CENTER);

    offlineP.add(offlineHP, gchp);
    offlineHP.add(subOfflineP, gcsubp);
    subOfflineP.add(offlineH, null);
    offlineHP.add(offlineHL, gcline);
    offlineP.add(offlineLP, gclp);
    offlineLP.add(offlineTable, BorderLayout.CENTER);

    awaitP.add(awaitHP, gchp);
    awaitHP.add(subAwaitP, gcsubp);
    subAwaitP.add(awaitH, null);
    awaitHP.add(awaitHL, gcline);
    awaitP.add(awaitLP, gclp);
    awaitLP.add(awaitTable, BorderLayout.CENTER);

    notinP.add(notinHP, gchp);
    notinHP.add(subNotinP, gcsubp);
    subNotinP.add(notinH, null);
    notinHP.add(notinHL, gcline);
    notinP.add(notinLP, gclp);
    notinLP.add(notinTable, BorderLayout.CENTER);
    scrollP.add(fillP,gc5);

    this.getContentPane().add(botPanel, BorderLayout.SOUTH);
    botPanel.add(addBt, gcadd);
    botPanel.add(sicqBt, gcsicq);
    botPanel.add(statusBt, gcstatus);

    uIcon=new UpdateIcon(500,this);
}
//******************************** end Init ***************************

  public void sicqBt_actionPerformed(ActionEvent e)//Show SICQ POPUP
  {
  	int x,y;
    sicqPopup.setVisible(true);
    x = -sicqPopup.getWidth();
    y = -(sicqPopup.getHeight() - sicqBt.getHeight()+1);
    sicqPopup.show(sicqBt, x, y);
  }

  public void statusBt_actionPerformed(ActionEvent e)//Change Status online,offline
  {
    int x,y;
    statusPopup.setVisible(true);
    x = statusBt.getWidth()-1;
    y = -(statusPopup.getHeight() - statusBt.getHeight()+1);
    statusPopup.show(statusBt, x, y);
  }

  public void allOnBt_actionPerformed(ActionEvent e) //Change to view online or All Contact
  {
    JButton jBt = (JButton)(e.getSource());
    if(jBt.getActionCommand().equals("Online"))	showOnlinePanel();
    else if(jBt.getActionCommand().equals("All"))	showAllPanel();
  }

  void showOnlinePanel() //show online+secure
  {
    allOnBt.setText("All");
    allOnBt.setIcon(iconAllUser);
    updateList();
  }

  void showAllPanel() //show all ContactList
  {
    allOnBt.setText("Online");
    allOnBt.setIcon(iconOnlineUser);
    updateList();
  }

  public void updateList()  //Update number of ContactList
  {
    secureF = (secureTm.getRowCount()==0) ? false : true;
    onlineF = (onlineTm.getRowCount()==0) ? false : true;
    offlineF = (offlineTm.getRowCount()==0) ? false : true;
    awaitF = (awaitTm.getRowCount()==0) ? false : true;
    notinF = (notinTm.getRowCount()==0) ? false : true;
    if(allOnBt.getText().equals("All"))  //show online + secure
    {
      scrollP.removeAll();	scrollP.add(fillP,gc5);
      if(secureF)	{ scrollP.add(secureP, gc0);}
      else{ scrollP.remove(secureP);}
      if(onlineF) { scrollP.add(onlineP, gc1);}
      else{ scrollP.remove(onlineP);}
    }
    else if(allOnBt.getText().equals("Online")) //show all
    {
    	if(secureF){ scrollP.add(secureP, gc0);}
      else{ scrollP.remove(secureP);}
    	if(onlineF){ scrollP.add(onlineP, gc1);}
    	else{ scrollP.remove(onlineP);}
    	if(offlineF){ scrollP.add(offlineP, gc2);}
      else{ scrollP.remove(offlineP);}
    	if(awaitF){ scrollP.add(awaitP, gc3);}
      else{ scrollP.remove(awaitP);}
    	if(notinF){	scrollP.add(notinP, gc4);}
    	else{ scrollP.remove(notinP);}
    }
    scrollP.invalidate();
    scrollP.revalidate();
    scrollP.repaint();
  }

  void addBt_actionPerformed(ActionEvent e)//Open Search Frame  for Add User to ContactList
  {
    JButton jBt = (JButton)(e.getSource());
    System.out.println("action event detected from "+ jBt.getText());
	  SearchFrame sFrame = new SearchFrame(oUserInfo);
    //call addUser for add to contact list
  }

  void addICQMenu_actionPerformed(ActionEvent e) //Add ICQ# to Computer
  {
    oUserInfo.disconnect();
    AddICQFrame addICQ = new AddICQFrame(this);
  }

  void onlineMenu_actionPerformed(ActionEvent e)  //Change Active's Status to Online
  {
      if(!oUserInfo.getOnline())
      {
        PasswordFrame loginFrame2 = new PasswordFrame(oUserInfo);
      }else
      {
        statusBt.setIcon(this.iconSOnline);
        statusBt.setText("Online");
        oUserInfo.changeStatus(oUserInfo.c_Online);
      }
  }

  void offlineMenu_actionPerformed(ActionEvent e) //Change Active's Status to Offline
  {
      statusBt.setIcon(iconSOffline);
      statusBt.setText("Offline");
      oUserInfo.disconnect();
  }

  void awayMenu_actionPerformed(ActionEvent e)
  {
      if(oUserInfo.getOnline())
      {
       statusBt.setIcon(iconSAway);
       statusBt.setText("Away");
       oUserInfo.changeStatus(oUserInfo.c_Away);
      }

  }

  void extAwayMenu_actionPerformed(ActionEvent e)
  {
     if(oUserInfo.getOnline())
      {
       statusBt.setIcon(iconSNa);
       statusBt.setText("N/A");
       oUserInfo.changeStatus(oUserInfo.c_Na);
      }
  }

  void occupiedMenu_actionPerformed(ActionEvent e)
  {
     if(oUserInfo.getOnline())
      {
       statusBt.setIcon(iconSOccupied);
       statusBt.setText("Occupied");
       oUserInfo.changeStatus(oUserInfo.c_Occupied);
      }
  }

  void dndMenu_actionPerformed(ActionEvent e)
  {
      if(oUserInfo.getOnline())
      {
       statusBt.setIcon(iconSDnd);
       statusBt.setText("DND");
       oUserInfo.changeStatus(oUserInfo.c_Dnd);
      }
  }

  void invisMenu_actionPerformed(ActionEvent e)
  {
      if(oUserInfo.getOnline())
      {
       statusBt.setIcon(iconSInvisible);
       statusBt.setText("Privacy");
       oUserInfo.changeStatus(oUserInfo.c_Invisible);
      }
  }

  void changeDetailMenu_actionPerformed(ActionEvent e)
  {
    ViewMyDetailFrame vDetail = new ViewMyDetailFrame(oUserInfo);

  }

  void shutdownMenu_actionPerformed(ActionEvent e)  //Close Program
  {
    oUserInfo.disconnect();
    WriteOwnerDataFile wOwnerDataFile =new WriteOwnerDataFile("sicq.ifo",ownerUsers);
  	System.exit(0);
  }

  boolean addICQToComp(OwnerUserInfo oUser)	//add new owner to com + add to rem-change menu
  {
	 	ownerUsers.addElement(oUser);
		newMenuItem(oUser);
		setActiveUser(oUser);
	  return true;
 	}//end addICQToComp

 	void newMenuItem(OwnerUserInfo oUser)
 	{
    String oUserT=oUser.getNick ()+"["+oUser.getUIN()+"]";
 		JMenuItem remItem = new JMenuItem(oUserT,iconCheck);
		JMenuItem changeItem = new JMenuItem(oUserT,iconCheck);
		remItem.setIcon(iconCheck);
		changeItem.setIcon(iconCheck);
    remItem.setFont(defaultFont);
		changeItem.setFont(defaultFont);
    remItem.setForeground(Color.black);
		changeItem.setForeground(Color.black);
		remICQMenu.add(remItem);
		changeICQMenu.add(changeItem);

		remItem.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
        String oUserName="";
				OwnerUserInfo oUserI;
				JMenuItem item = (JMenuItem)e.getSource();
				for(int i=0; i<ownerUsers.size(); i++)
				{
					oUserI = (OwnerUserInfo)ownerUsers.elementAt(i);
          oUserName=oUserI.getNick ()+"["+oUserI.getUIN()+"]";
					if(oUserName.equals(item.getText()))
					{
            RemoveICQFrame rICQ=new RemoveICQFrame(oUserI,oUserInfo);
					}
				}//end for
			}
		});//end remItemListener

		changeItem.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				OwnerUserInfo oUserI;
        String oUserName="";
				JMenuItem item = (JMenuItem)e.getSource();
				for(int i=0; i<ownerUsers.size(); i++)
				{
					oUserI = (OwnerUserInfo)ownerUsers.elementAt(i);
          oUserName=oUserI.getNick ()+"["+oUserI.getUIN()+"]";
					if(oUserName.equals(item.getText()))
					{
            if(!(oUserI.getUIN()==oUserInfo.getUIN ()))
						{
               oUserInfo.disconnect();
               setActiveUser(oUserI);
               PasswordFrame changeICQ = new PasswordFrame(oUserI);
     				}
					}
				}//end for
			}
		});//end changeItemListener
	}//end newMenuItem

	void setActiveUser(OwnerUserInfo oUserI)
	{
    oUserInfo=oUserI;
		for(int i=0; i<ownerUsers.size(); i++)
		{
			OwnerUserInfo oUser = (OwnerUserInfo)ownerUsers.elementAt(i);
      if(oUserI.getUIN()==oUser.getUIN())
      {
		    remICQMenu.getItem(i).setIcon(iconCheck);
		    changeICQMenu.getItem(i).setIcon(iconCheck);
		    setTitle(String.valueOf(oUserI.getUIN()));
      }
      else
      {
        remICQMenu.getItem(i).setIcon(iconBlank);
        changeICQMenu.getItem(i).setIcon(iconBlank);
      }
		}
	}

  void removeOwner(OwnerUserInfo rUser)
  {
    OwnerUserInfo oUserT;
    for(int i=0; i<ownerUsers.size(); i++)
    {
      oUserT = (OwnerUserInfo)ownerUsers.elementAt(i);
      if(oUserT.getUIN()==rUser.getUIN())
      {
          ownerUsers.removeElementAt(i);
          remICQMenu.remove(remICQMenu.getItem(i));
          changeICQMenu.remove(changeICQMenu.getItem(i));
      }
    }
    WriteOwnerDataFile wOwnerDataFile =new WriteOwnerDataFile("sicq.ifo",ownerUsers);
  }


  void sendSecureMsgMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)secureTm.getValueAt (rowSelect,0);
    SendMessageFrame sendMsg = new SendMessageFrame(oUserInfo,cUser);
  }
  void sendSecureFileMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)secureTm.getValueAt (rowSelect,0);
    if(!cUser.waitSendFile)
    {
    SendFileFrame sendMsg = new SendFileFrame(oUserInfo,cUser);
    }
  }
  void secureDetailMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)secureTm.getValueAt (rowSelect,0);
    UserDetailFrame userDetail = new UserDetailFrame(oUserInfo,cUser);
  }
  void secureDeleteMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)secureTm.getValueAt (rowSelect,0);
    DeleteUserFrame deleteFrame = new DeleteUserFrame(oUserInfo,cUser);
  }

  void sendOnMsgMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)onlineTm.getValueAt (rowSelect,0);
    SendMessageFrame sendMsg = new SendMessageFrame(oUserInfo,cUser);
  }
  void sendOnFileMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)onlineTm.getValueAt (rowSelect,0);
    if(!cUser.waitSendFile)
    {
    SendFileFrame sendMsg = new SendFileFrame(oUserInfo,cUser);
    }

  }
  void onDetailMenu_actionPerformed(ActionEvent e)
  {
      ContactUserInfo cUser=(ContactUserInfo)onlineTm.getValueAt (rowSelect,0);
      UserDetailFrame userDetail = new UserDetailFrame(oUserInfo,cUser);
  }
  void onDeleteMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)onlineTm.getValueAt (rowSelect,0);
    DeleteUserFrame deleteFrame = new DeleteUserFrame(oUserInfo,cUser);
  }

  void sendOffMsgMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)offlineTm.getValueAt (rowSelect,0);
    SendMessageFrame sendMsg = new SendMessageFrame(oUserInfo,cUser);
  }

  void offDetailMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)offlineTm.getValueAt (rowSelect,0);
    UserDetailFrame userDetail = new UserDetailFrame(oUserInfo,cUser);
  }

  void offDeleteMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)offlineTm.getValueAt (rowSelect,0);
    DeleteUserFrame deleteFrame = new DeleteUserFrame(oUserInfo,cUser);
  }

  void sendAwaitMsgMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)awaitTm.getValueAt (rowSelect,0);
    SendMessageFrame sendMsg = new SendMessageFrame(oUserInfo,cUser);
  }

  void awaitDetailMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)awaitTm.getValueAt (rowSelect,0);
    UserDetailFrame userDetail = new UserDetailFrame(oUserInfo,cUser);
  }

  void reAuthorizeMenu_actionPerformed(ActionEvent e)
  {
     ContactUserInfo cUser=(ContactUserInfo)awaitTm.getValueAt (rowSelect,0);
     AuthorizeFrame sendAuthorizeFrame = new AuthorizeFrame(oUserInfo,cUser);
  }

  void awaitDeleteMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)awaitTm.getValueAt (rowSelect,0);
    DeleteUserFrame deleteFrame = new DeleteUserFrame(oUserInfo,cUser);
  }

  void sendNotinMsgMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)notinTm.getValueAt (rowSelect,0);
    SendMessageFrame sendMsg = new SendMessageFrame(oUserInfo,cUser);
  }

  void notinDetailMenu_actionPerformed(ActionEvent e)
  {
    ContactUserInfo cUser=(ContactUserInfo)notinTm.getValueAt (rowSelect,0);
    UserDetailFrame userDetail = new UserDetailFrame(oUserInfo,cUser);
  }

  void addToListMenu_actionPerformed(ActionEvent e)
  {
     ContactUserInfo cUser=(ContactUserInfo)notinTm.getValueAt (rowSelect,0);
     AddToListFrame addToListFrame = new AddToListFrame(oUserInfo,cUser);
  }

  void notinDeleteMenu_actionPerformed(ActionEvent e)
  {
     ContactUserInfo cUser=(ContactUserInfo)notinTm.getValueAt (rowSelect,0);
     DeleteUserFrame deleteFrame = new DeleteUserFrame(oUserInfo,cUser);
  }


//---MouseListener of PopupMenu in Contact List---------------
	  class MyContactListener extends MouseAdapter
	  {
		  public void mousePressed(MouseEvent e)
		  {
      	JTable table = (JTable)e.getSource();
			  if(javax.swing.SwingUtilities.isRightMouseButton(e))
			  {
          int r = table.rowAtPoint(new Point(e.getX(),e.getY()));
		  		table.setRowSelectionInterval(r,r);
          table.grabFocus();
			  }
		  }
	  }
//---End of MouseListener of PopupMenu in Contact List---------------

  private void getDataFromContact(ContactUserInfo cUserInfo)
  {
          if(cUserInfo.getDataStatus()==cUserInfo.c_MsgText)
          {
             RecieveMessageFrame rMessageFrame=new RecieveMessageFrame(oUserInfo,cUserInfo,cUserInfo.getData());
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgUserAdd)
          {
             InAddedFrame iAddedFrame=new InAddedFrame(oUserInfo,cUserInfo,cUserInfo.getData());
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgAuthReq)
          {
             InReqAuthorizeFrame InReq=new InReqAuthorizeFrame(oUserInfo,cUserInfo,cUserInfo.getData());
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgAuthGrant)
          {
             AcceptAuthorizeFrame aAuth=new AcceptAuthorizeFrame(oUserInfo,cUserInfo,cUserInfo.getData());
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgAuthIgnore)
          {
             AcceptAuthorizeFrame nAuth=new AcceptAuthorizeFrame(oUserInfo,cUserInfo,cUserInfo.getData());
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgURL)
          {
             cUserInfo.getData();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgContact)
          {
             cUserInfo.getData();
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_MsgFile)
          {
             if(!cUserInfo.getFileAbort())
             {
              RecieveFileFrame rFileFrame=new RecieveFileFrame(oUserInfo,cUserInfo,cUserInfo.getData());
             }
             else
             {
              cUserInfo.getData();
              WarningFrame wFrame=new WarningFrame(cUserInfo.getNick()+" abort to send file.");
             }
          }
          else if(cUserInfo.getDataStatus()==cUserInfo.c_NoMsg)
          {
            SendMessageFrame sFrame=new SendMessageFrame(oUserInfo,cUserInfo);
          }
          else
          {
            cUserInfo.getData();
          }
  }

  public synchronized void initTable()
  {
     clearAllTable();
     Vector vUser=new Vector();
     vUser=oUserInfo.getContactList();
     for(int i=0;i<vUser.size ();i++)
     {
        ContactUserInfo cU=(ContactUserInfo)vUser.elementAt (i);
        if(cU.contactStatus==cU.c_contactNormal)
        {
          addToTable(cU,cU.c_tableOffline);
        }
        else if(cU.contactStatus==cU.c_contactAwait)
        {
          addToTable(cU,cU.c_tableAwait);
        }
        else
        {
          addToTable(cU,cU.c_tableNotin);
        }
     }
     updateList();
  }

  public synchronized void addToTable(ContactUserInfo cUserTemp,int table)
  {
      boolean found=false;
      Vector vUser=new Vector();
      vUser=oUserInfo.getContactList();
      VectorManager   vManager=new VectorManager();
      ContactUserInfo cU=new ContactUserInfo(oUserInfo);
      cU.setUIN(0);
      cU=vManager.findContactUser(vUser,cU,cUserTemp.getUIN());
      if(cU.getUIN()!=0)
      {
          System.out.println("contactUser found "+cU.getUIN());

          if(cU.getTableStore()!=table)
          {
            if(cU.getTableStore()==cU.c_tableOffline)
            {cU.removeFromTable (offlineTm);}
            else if(cU.getTableStore()==cU.c_tableOnline)
            {cU.removeFromTable(onlineTm);}
            else if(cU.getTableStore()==cU.c_tableSecure)
            {cU.removeFromTable(secureTm);}
            else if(cU.getTableStore()==cU.c_tableAwait)
            {cU.removeFromTable(awaitTm);}
            else if(cU.getTableStore()==cU.c_tableNotin)
            {cU.removeFromTable(notinTm);}

            cU.setTableStore(table);
            cU.addToTable(table);
          }
     }
     else
     {
           System.out.println("New user "+cUserTemp.getUIN());
           cUserTemp.setTableStore(table);
           oUserInfo.contactUser.addElement(cUserTemp);
           cUserTemp.addToTable(table);
           WriteContactDataFile wContactDataFile =new WriteContactDataFile(oUserInfo.getUIN()+".ifo",oUserInfo.contactUser);
     }
     updateList();
  }

  public synchronized void clearAllTable() //---------test synch
  {
       while(secureTm.getRowCount()>0){secureTm.removeRow (0);}
       while(onlineTm.getRowCount()>0){onlineTm.removeRow (0);}
       while(offlineTm.getRowCount()>0){offlineTm.removeRow (0);}
       while(awaitTm.getRowCount()>0){awaitTm.removeRow (0);}
       while(notinTm.getRowCount()>0){notinTm.removeRow (0);}
       updateList();
  }

  public Vector readOwnerUser()
	{
    Vector oUser=new Vector();
    try{
		ReadOwnerDataFile ownerFile = new ReadOwnerDataFile(this);
    oUser=ownerFile.ReadFile("sicq.ifo");
    }catch(Exception e){System.out.println (e);}
    return oUser;
	}

}
