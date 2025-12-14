import org.python.core.*;

public class ScriptUtils extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject i$1;
        private static PyObject i$2;
        private static PyObject s$3;
        private static PyObject i$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject s$7;
        private static PyObject s$8;
        private static PyObject s$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject s$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject s$22;
        private static PyObject s$23;
        private static PyObject s$24;
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyObject s$27;
        private static PyObject s$28;
        private static PyObject s$29;
        private static PyObject s$30;
        private static PyObject s$31;
        private static PyObject s$32;
        private static PyObject s$33;
        private static PyObject i$34;
        private static PyObject s$35;
        private static PyObject s$36;
        private static PyObject s$37;
        private static PyObject s$38;
        private static PyObject s$39;
        private static PyObject s$40;
        private static PyObject s$41;
        private static PyObject s$42;
        private static PyObject s$43;
        private static PyObject s$44;
        private static PyObject s$45;
        private static PyObject s$46;
        private static PyObject s$47;
        private static PyObject s$48;
        private static PyObject s$49;
        private static PyObject s$50;
        private static PyObject s$51;
        private static PyObject s$52;
        private static PyObject s$53;
        private static PyObject s$54;
        private static PyObject s$55;
        private static PyObject i$56;
        private static PyObject i$57;
        private static PyObject s$58;
        private static PyObject s$59;
        private static PyObject i$60;
        private static PyObject i$61;
        private static PyObject s$62;
        private static PyObject i$63;
        private static PyObject i$64;
        private static PyObject i$65;
        private static PyObject i$66;
        private static PyObject i$67;
        private static PyObject i$68;
        private static PyObject i$69;
        private static PyObject s$70;
        private static PyObject s$71;
        private static PyObject s$72;
        private static PyObject s$73;
        private static PyObject s$74;
        private static PyObject s$75;
        private static PyObject s$76;
        private static PyObject s$77;
        private static PyObject s$78;
        private static PyObject s$79;
        private static PyObject s$80;
        private static PyObject s$81;
        private static PyObject s$82;
        private static PyObject s$83;
        private static PyObject s$84;
        private static PyObject s$85;
        private static PyObject s$86;
        private static PyObject s$87;
        private static PyObject s$88;
        private static PyObject s$89;
        private static PyObject s$90;
        private static PyObject s$91;
        private static PyObject s$92;
        private static PyObject s$93;
        private static PyObject i$94;
        private static PyObject i$95;
        private static PyObject s$96;
        private static PyObject i$97;
        private static PyObject s$98;
        private static PyObject s$99;
        private static PyObject i$100;
        private static PyObject s$101;
        private static PyObject s$102;
        private static PyObject i$103;
        private static PyObject s$104;
        private static PyObject i$105;
        private static PyObject i$106;
        private static PyObject s$107;
        private static PyObject s$108;
        private static PyObject s$109;
        private static PyObject s$110;
        private static PyObject s$111;
        private static PyObject s$112;
        private static PyObject s$113;
        private static PyObject s$114;
        private static PyObject s$115;
        private static PyObject s$116;
        private static PyObject s$117;
        private static PyObject s$118;
        private static PyObject s$119;
        private static PyObject s$120;
        private static PyObject s$121;
        private static PyObject s$122;
        private static PyObject s$123;
        private static PyObject s$124;
        private static PyObject s$125;
        private static PyObject s$126;
        private static PyObject s$127;
        private static PyObject s$128;
        private static PyObject s$129;
        private static PyObject s$130;
        private static PyObject s$131;
        private static PyObject s$132;
        private static PyObject s$133;
        private static PyObject s$134;
        private static PyObject s$135;
        private static PyObject s$136;
        private static PyObject s$137;
        private static PyObject s$138;
        private static PyObject s$139;
        private static PyObject s$140;
        private static PyObject i$141;
        private static PyObject s$142;
        private static PyObject i$143;
        private static PyObject s$144;
        private static PyObject s$145;
        private static PyObject s$146;
        private static PyObject i$147;
        private static PyObject s$148;
        private static PyObject s$149;
        private static PyObject i$150;
        private static PyObject s$151;
        private static PyObject i$152;
        private static PyObject s$153;
        private static PyObject i$154;
        private static PyObject s$155;
        private static PyObject i$156;
        private static PyObject i$157;
        private static PyObject s$158;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_getDefaultMailServer;
        private static PyCode c$1_openWebPage;
        private static PyCode c$2_uploadFile;
        private static PyCode c$3_downloadFile;
        private static PyCode c$4_sendMail;
        private static PyCode c$5_numMail;
        private static PyCode c$6_checkMail;
        private static PyCode c$7_sendSMS;
        private static PyCode c$8_playWav;
        private static PyCode c$9_playingWav;
        private static PyCode c$10_playMidi;
        private static PyCode c$11___init__;
        private static PyCode c$12_windowClosing;
        private static PyCode c$13_MyWindowAdapter;
        private static PyCode c$14___init__;
        private static PyCode c$15_closeWindow;
        private static PyCode c$16_playMusic;
        private static PyCode c$17_midiFrame;
        private static PyCode c$18_showMessage;
        private static PyCode c$19_sendLANMessage;
        private static PyCode c$20_startFile;
        private static PyCode c$21_shutdownComputer;
        private static PyCode c$22_runCMD;
        private static PyCode c$23_lambda;
        private static PyCode c$24___init__;
        private static PyCode c$25_waitingToHide;
        private static PyCode c$26_onPopupPushed;
        private static PyCode c$27_Alert;
        private static PyCode c$28___init__;
        private static PyCode c$29_Owner;
        private static PyCode c$30___init__;
        private static PyCode c$31_BrowserOwner;
        private static PyCode c$32___init__;
        private static PyCode c$33_FTPOwner;
        private static PyCode c$34___init__;
        private static PyCode c$35_MailOwner;
        private static PyCode c$36___init__;
        private static PyCode c$37_SMSOwner;
        private static PyCode c$38___init__;
        private static PyCode c$39_runCGI;
        private static PyCode c$40_getHomeSource;
        private static PyCode c$41_saveHomeAs;
        private static PyCode c$42_showCurPage;
        private static PyCode c$43_WebSite;
        private static PyCode c$44___init__;
        private static PyCode c$45_inquireGrade;
        private static PyCode c$46_inquireTotGrade;
        private static PyCode c$47_extractGPA;
        private static PyCode c$48_KMITL;
        private static PyCode c$49___init__;
        private static PyCode c$50_search;
        private static PyCode c$51_Yahoo;
        private static PyCode c$52_temperature;
        private static PyCode c$53_rain;
        private static PyCode c$54_wind;
        private static PyCode c$55_cloud;
        private static PyCode c$56_weather;
        private static PyCode c$57_pressure;
        private static PyCode c$58_Weather;
        private static PyCode c$59_createTable;
        private static PyCode c$60_main;
        private static void initConstants() {
            s$0 = Py.newString("\012Programmable Web Browser v 2.0\012Module : ScriptUtils Module\012Description : Contain parser of script language, definition of language datatype, and event function\012Last Updated : 31 January 2002\012Programmer :Mr. Thanawat Keawka\012            Mr. Boontawee Suntisrivaraporn\012Professor : Dr. Visit Hirankitti                        \012===========================================\012System Requirement\012- Java 1.3\012- Jython 2.1\012- Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2\012\012");
            i$1 = Py.newInteger(1);
            i$2 = Py.newInteger(0);
            s$3 = Py.newString("PWB-Exception");
            i$4 = Py.newInteger(100);
            s$5 = Py.newString("sounds/wav/");
            s$6 = Py.newString("sounds/wav/missed.wav");
            s$7 = Py.newString("sounds/wav/hello.wav");
            s$8 = Py.newString("openWebPage(url) -> None");
            s$9 = Py.newString("<<Script>> Fail to get page : ");
            s$10 = Py.newString("<<Script>> Open web page complete");
            s$11 = Py.newString("uploadFile(server, userName, passwd, localFile, remotePath) -> None");
            s$12 = Py.newString("<<Script>> Fail to upload file : cannot connect");
            s$13 = Py.newString("<<Script>> Fail to upload file : transfer error");
            s$14 = Py.newString("<<Script>> Upload file complete");
            s$15 = Py.newString("downloadFile(server, userName, passwd, remoteFile, localPath) -> None");
            s$16 = Py.newString("<<Script>> Fail to download file : cannot connect");
            s$17 = Py.newString("<<Script>> Fail to download file : transfer error");
            s$18 = Py.newString("<<Script>> Download file complete");
            s$19 = Py.newString("sendMail(toAddress, fromAddr, subject, body) -> None");
            s$20 = Py.newString("diamond.ce.kmitl.ac.th");
            s$21 = Py.newString("<<Event>> Fail to send e-mail : transfer error or input parameter incorrect");
            s$22 = Py.newString("numMail(servAddr, user, password) -> number of mails in mail account");
            s$23 = Py.newString("<<Event>> Error for connecting to Mail server ");
            s$24 = Py.newString("checkMail(servAddr, user, password) -> None ");
            s$25 = Py.newString("<<Event>> Fail to retrieve e-mail : transfer error or input parameter incorrect");
            s$26 = Py.newString("sendSMS(telNo, message, server, password) -> None");
            s$27 = Py.newString("<<Event>> Fail to send SMS : transfer error or input parameter incorrect");
            s$28 = Py.newString("");
            s$29 = Py.newString("playWav(pathfile) -> None");
            s$30 = Py.newString("file:");
            s$31 = Py.newString("<<ScriptUtils>> Cannot open wav file");
            s$32 = Py.newString("playMidi(pathfile) -> None");
            s$33 = Py.newString("<<ScriptUtils>> Fail to play midi file");
            i$34 = Py.newInteger(180);
            s$35 = Py.newString("images/gear.gif");
            s$36 = Py.newString("Playing... ");
            s$37 = Py.newString("stop");
            s$38 = Py.newString("showMessage(message) -> None");
            s$39 = Py.newString("PWB Message");
            s$40 = Py.newString("sendLANMessage(destIP, message) -> None");
            s$41 = Py.newString("net send ");
            s$42 = Py.newString(" \"");
            s$43 = Py.newString("\"");
            s$44 = Py.newString("startFile(pathfile) -> None");
            s$45 = Py.newString("start \"PWB\" \"");
            s$46 = Py.newString(" these two function always use with time=0 -- control time by event manager\012force used whenever do not need to ask for unsafe docs\012shutdown windows 2000/xp system ");
            s$47 = Py.newString("shutdownComputer([mode, force]) -> None");
            s$48 = Py.newString("shutdown ");
            s$49 = Py.newString("-s ");
            s$50 = Py.newString("-r ");
            s$51 = Py.newString("-f ");
            s$52 = Py.newString("-t 0");
            s$53 = Py.newString("runCMD(command) -> boolean success");
            s$54 = Py.newString("<<Script>> Security or IO exception");
            s$55 = Py.newString("Alert(msg [,func [,delay]]) -> popup obj");
            i$56 = Py.newInteger(130);
            i$57 = Py.newInteger(110);
            s$58 = Py.newString("Push here");
            s$59 = Py.newString("images/go.gif");
            i$60 = Py.newInteger(10);
            i$61 = Py.newInteger(20);
            s$62 = Py.newString("Tahoma");
            i$63 = Py.newInteger(12);
            i$64 = Py.newInteger(40);
            i$65 = Py.newInteger(190);
            i$66 = Py.newInteger(250);
            i$67 = Py.newInteger(135);
            i$68 = Py.newInteger(138);
            i$69 = Py.newInteger(15);
            s$70 = Py.newString("<<Script>> User defined function error");
            s$71 = Py.newString("<<Script>> URL error : ");
            s$72 = Py.newString("GET");
            s$73 = Py.newString("?");
            s$74 = Py.newString("POST");
            s$75 = Py.newString("w");
            s$76 = Py.newString("Save file error!");
            s$77 = Py.newString("KMITL() -> WebSite object located to KMITL");
            s$78 = Py.newString("http://www.kmitl.ac.th");
            s$79 = Py.newString("inquireGrade(id, pass, year, term) -> result");
            s$80 = Py.newString("http://161.246.10.36:8080/servlet/");
            s$81 = Py.newString("UnGraStuServlet");
            s$82 = Py.newString("id");
            s$83 = Py.newString("pass");
            s$84 = Py.newString("year");
            s$85 = Py.newString("term");
            s$86 = Py.newString("<<Script>> KMITL - Inquire grade of ");
            s$87 = Py.newString(" of term ");
            s$88 = Py.newString(" year ");
            s$89 = Py.newString("inquireTotGrade(id, pass) -> result");
            s$90 = Py.newString("UnGraTotServlet");
            s$91 = Py.newString("<<Script>> KMITL - Inquire total grade of ");
            s$92 = Py.newString("extractGPA(html) -> string\012        html : string of KMITL-grade report");
            s$93 = Py.newString("<TD WIDTH=100 ALIGN=center>");
            i$94 = Py.newInteger(27);
            i$95 = Py.newInteger(35);
            s$96 = Py.newString("ID : ");
            i$97 = Py.newInteger(36);
            s$98 = Py.newString("<TD WIDTH=440 ALIGN=left>&nbsp;");
            s$99 = Py.newString("</TD>");
            i$100 = Py.newInteger(31);
            s$101 = Py.newString(" ");
            s$102 = Py.newString(" Name : ");
            i$103 = Py.newInteger(5);
            s$104 = Py.newString("<TD WIDTH=80 ALIGN=center>");
            i$105 = Py.newInteger(26);
            i$106 = Py.newInteger(34);
            s$107 = Py.newString("&nbsp;");
            s$108 = Py.newString("</TD><TD WIDTH=60 ALIGN=center>");
            s$109 = Py.newString("</TD><TD WIDTH=50 ALIGN=center>");
            s$110 = Py.newString("\012");
            s$111 = Py.newString("|");
            s$112 = Py.newString(" Yahoo() -> WebSite object located to Yahoo");
            s$113 = Py.newString("http://www.yahoo.com");
            s$114 = Py.newString("search(keyword) -> result");
            s$115 = Py.newString("http://search.yahoo.com/bin/");
            s$116 = Py.newString("search");
            s$117 = Py.newString("p");
            s$118 = Py.newString("<<Script>> Yahoo - Search information regard ");
            s$119 = Py.newString("Station");
            s$120 = Py.newString("C");
            s$121 = Py.newString("F");
            s$122 = Py.newString("dew");
            s$123 = Py.newString("Rain Quantity(mm.)");
            s$124 = Py.newString("Km/h.");
            s$125 = Py.newString("Knot.");
            s$126 = Py.newString("Wind direction");
            s$127 = Py.newString("Cloud indication");
            s$128 = Py.newString("Weather indication");
            s$129 = Py.newString("Pressure(bar)");
            s$130 = Py.newString("region");
            s$131 = Py.newString("Choice");
            s$132 = Py.newString("start retrieve");
            s$133 = Py.newString("http://www.thaimet.tmd.go.th/eng/weather.asp");
            s$134 = Py.newString("retrieve ok");
            s$135 = Py.newString("error reterieveing page ");
            s$136 = Py.newString("<!-------------- Start Temparature ----------->");
            s$137 = Py.newString("<TR>");
            s$138 = Py.newString("<Hr Width=\"50%\">");
            s$139 = Py.newString("</FONT></TD>");
            s$140 = Py.newString("COLOR=\"Blue\">");
            i$141 = Py.newInteger(13);
            s$142 = Py.newString("SIZE=\"+1\">");
            i$143 = Py.newInteger(22);
            s$144 = Py.newString("<!------------ Start Quantity Rain  ----------->");
            s$145 = Py.newString("found start point");
            s$146 = Py.newString("COLOR=\"Blue\" >");
            i$147 = Py.newInteger(32);
            s$148 = Py.newString("<!------------ Start Indication Wind  ----------->");
            s$149 = Py.newString("COLOR=\"RED\">");
            i$150 = Py.newInteger(42);
            s$151 = Py.newString("<!------------ Start Indication Cloud  ----------->");
            i$152 = Py.newInteger(52);
            s$153 = Py.newString("<!------------ Start Indication weather ----------->");
            i$154 = Py.newInteger(62);
            s$155 = Py.newString("createTable(title, body, head) -> Table GUI");
            i$156 = Py.newInteger(400);
            i$157 = Py.newInteger(300);
            s$158 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py");
            funcTable = new _PyInner();
            c$0_getDefaultMailServer = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "getDefaultMailServer", false, false, funcTable, 0, null, null, 0, 1);
            c$1_openWebPage = Py.newCode(1, new String[] {"urlName", "browser"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "openWebPage", false, false, funcTable, 1, null, null, 0, 1);
            c$2_uploadFile = Py.newCode(5, new String[] {"server", "userName", "passwd", "localFile", "remotePath", "ftp"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "uploadFile", false, false, funcTable, 2, null, null, 0, 1);
            c$3_downloadFile = Py.newCode(5, new String[] {"server", "userName", "passwd", "remoteFile", "localPath", "ftp"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "downloadFile", false, false, funcTable, 3, null, null, 0, 1);
            c$4_sendMail = Py.newCode(4, new String[] {"toAddr", "fromAddr", "subject", "body", "mail"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "sendMail", false, false, funcTable, 4, null, null, 0, 1);
            c$5_numMail = Py.newCode(3, new String[] {"servername", "user", "passwd", "msgBytes", "msgCount", "server"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "numMail", false, false, funcTable, 5, null, null, 0, 1);
            c$6_checkMail = Py.newCode(3, new String[] {"servAddr", "usr", "pwd", "mail"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "checkMail", false, false, funcTable, 6, null, null, 0, 1);
            c$7_sendSMS = Py.newCode(4, new String[] {"teleNo", "mesg", "server", "password", "sms"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "sendSMS", false, false, funcTable, 7, null, null, 0, 1);
            c$8_playWav = Py.newCode(1, new String[] {"song", "auClip", "file", "fileName"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "playWav", false, false, funcTable, 8, null, null, 0, 1);
            c$9_playingWav = Py.newCode(1, new String[] {"clip"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "playingWav", false, false, funcTable, 9, null, null, 0, 1);
            c$10_playMidi = Py.newCode(1, new String[] {"song", "midi"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "playMidi", false, false, funcTable, 10, null, null, 0, 1);
            c$11___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 11, null, null, 0, 1);
            c$12_windowClosing = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "windowClosing", false, false, funcTable, 12, null, null, 0, 1);
            c$13_MyWindowAdapter = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "MyWindowAdapter", false, false, funcTable, 13, null, null, 0, 0);
            c$14___init__ = Py.newCode(2, new String[] {"self", "song", "label"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 14, null, null, 0, 1);
            c$15_closeWindow = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "closeWindow", false, false, funcTable, 15, null, null, 0, 1);
            c$16_playMusic = Py.newCode(1, new String[] {"self", "file", "currentSound"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "playMusic", false, false, funcTable, 16, null, null, 0, 1);
            c$17_midiFrame = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "midiFrame", false, false, funcTable, 17, null, null, 0, 0);
            c$18_showMessage = Py.newCode(1, new String[] {"msg"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "showMessage", false, false, funcTable, 18, null, null, 0, 1);
            c$19_sendLANMessage = Py.newCode(2, new String[] {"destIP", "message", "cmd", "success"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "sendLANMessage", false, false, funcTable, 19, null, null, 0, 1);
            c$20_startFile = Py.newCode(1, new String[] {"pathfile", "cmd", "success"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "startFile", false, false, funcTable, 20, null, null, 0, 1);
            c$21_shutdownComputer = Py.newCode(2, new String[] {"mode", "force", "cmd", "success"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "shutdownComputer", false, false, funcTable, 21, null, null, 0, 1);
            c$22_runCMD = Py.newCode(1, new String[] {"cmd", "return_status"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "runCMD", false, false, funcTable, 22, null, null, 0, 1);
            c$23_lambda = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "<lambda>", false, false, funcTable, 23, null, null, 0, 1);
            c$24___init__ = Py.newCode(4, new String[] {"self", "msg", "func", "delay", "toolkit", "factory", "btDo", "pane", "max", "txMsg"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 24, null, null, 0, 1);
            c$25_waitingToHide = Py.newCode(2, new String[] {"self", "delay"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "waitingToHide", false, false, funcTable, 25, null, null, 0, 1);
            c$26_onPopupPushed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "onPopupPushed", false, false, funcTable, 26, null, null, 0, 1);
            c$27_Alert = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "Alert", false, false, funcTable, 27, null, null, 0, 0);
            c$28___init__ = Py.newCode(5, new String[] {"self", "browser", "ftp", "mail", "sms"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 28, null, null, 0, 1);
            c$29_Owner = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "Owner", false, false, funcTable, 29, null, null, 0, 0);
            c$30___init__ = Py.newCode(2, new String[] {"self", "favorites"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 30, null, null, 0, 1);
            c$31_BrowserOwner = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "BrowserOwner", false, false, funcTable, 31, null, null, 0, 0);
            c$32___init__ = Py.newCode(5, new String[] {"self", "server", "username", "password", "favorites"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 32, null, null, 0, 1);
            c$33_FTPOwner = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "FTPOwner", false, false, funcTable, 33, null, null, 0, 0);
            c$34___init__ = Py.newCode(5, new String[] {"self", "server", "address", "password", "addrbook"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 34, null, null, 0, 1);
            c$35_MailOwner = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "MailOwner", false, false, funcTable, 35, null, null, 0, 0);
            c$36___init__ = Py.newCode(4, new String[] {"self", "username", "password", "phonebook"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 36, null, null, 0, 1);
            c$37_SMSOwner = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "SMSOwner", false, false, funcTable, 37, null, null, 0, 0);
            c$38___init__ = Py.newCode(2, new String[] {"self", "url"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 38, null, null, 0, 1);
            c$39_runCGI = Py.newCode(6, new String[] {"self", "path", "cgi", "params", "method", "getSource", "url", "f", "result"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "runCGI", false, false, funcTable, 39, null, null, 0, 1);
            c$40_getHomeSource = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "getHomeSource", false, false, funcTable, 40, null, null, 0, 1);
            c$41_saveHomeAs = Py.newCode(2, new String[] {"self", "destPath", "f"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "saveHomeAs", false, false, funcTable, 41, null, null, 0, 1);
            c$42_showCurPage = Py.newCode(1, new String[] {"self", "frm"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "showCurPage", false, false, funcTable, 42, null, null, 0, 1);
            c$43_WebSite = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "WebSite", false, false, funcTable, 43, null, null, 0, 0);
            c$44___init__ = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 44, null, null, 0, 1);
            c$45_inquireGrade = Py.newCode(5, new String[] {"self", "_id", "_pass", "_year", "_term", "cgi", "params", "result", "path"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "inquireGrade", false, false, funcTable, 45, null, null, 0, 1);
            c$46_inquireTotGrade = Py.newCode(3, new String[] {"self", "_id", "_pass", "result", "cgi", "path", "params"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "inquireTotGrade", false, false, funcTable, 46, null, null, 0, 1);
            c$47_extractGPA = Py.newCode(2, new String[] {"self", "html", "credit", "p2", "grade", "p1", "subject", "target2", "target1", "t", "p", "id", "out", "table", "buff", "tmp", "subjID", "name"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "extractGPA", false, false, funcTable, 47, null, null, 0, 1);
            c$48_KMITL = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "KMITL", false, false, funcTable, 48, null, null, 0, 0);
            c$49___init__ = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "__init__", false, false, funcTable, 49, null, null, 0, 1);
            c$50_search = Py.newCode(2, new String[] {"self", "_keyword", "result", "cgi", "path", "params"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "search", false, false, funcTable, 50, null, null, 0, 1);
            c$51_Yahoo = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "Yahoo", false, false, funcTable, 51, null, null, 0, 0);
            c$52_temperature = Py.newCode(2, new String[] {"self", "region", "itemList", "f", "d", "res", "c", "postDataDict", "pro", "encodedData", "item", "st"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "temperature", false, false, funcTable, 52, null, null, 0, 1);
            c$53_rain = Py.newCode(2, new String[] {"self", "region", "itemList", "res", "c", "postDataDict", "pro", "encodedData", "item", "st"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "rain", false, false, funcTable, 53, null, null, 0, 1);
            c$54_wind = Py.newCode(2, new String[] {"self", "region", "itemList", "f", "d", "res", "c", "postDataDict", "pro", "encodedData", "item", "st"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "wind", false, false, funcTable, 54, null, null, 0, 1);
            c$55_cloud = Py.newCode(2, new String[] {"self", "region", "itemList", "res", "c", "postDataDict", "pro", "encodedData", "item", "st"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "cloud", false, false, funcTable, 55, null, null, 0, 1);
            c$56_weather = Py.newCode(2, new String[] {"self", "region", "itemList", "res", "c", "postDataDict", "pro", "encodedData", "item", "st"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "weather", false, false, funcTable, 56, null, null, 0, 1);
            c$57_pressure = Py.newCode(2, new String[] {"self", "region", "itemList", "res", "c", "postDataDict", "pro", "encodedData", "item", "st"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "pressure", false, false, funcTable, 57, null, null, 0, 1);
            c$58_Weather = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "Weather", false, false, funcTable, 58, null, null, 0, 0);
            c$59_createTable = Py.newCode(3, new String[] {"title", "data", "head", "table", "frame"}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "createTable", false, false, funcTable, 59, null, null, 0, 1);
            c$60_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\ScriptUtils.py", "main", false, false, funcTable, 60, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$60_main == null) _PyInner.initConstants();
            return c$60_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.getDefaultMailServer$1(frame);
                case 1:
                return _PyInner.openWebPage$2(frame);
                case 2:
                return _PyInner.uploadFile$3(frame);
                case 3:
                return _PyInner.downloadFile$4(frame);
                case 4:
                return _PyInner.sendMail$5(frame);
                case 5:
                return _PyInner.numMail$6(frame);
                case 6:
                return _PyInner.checkMail$7(frame);
                case 7:
                return _PyInner.sendSMS$8(frame);
                case 8:
                return _PyInner.playWav$9(frame);
                case 9:
                return _PyInner.playingWav$10(frame);
                case 10:
                return _PyInner.playMidi$11(frame);
                case 11:
                return _PyInner.__init__$12(frame);
                case 12:
                return _PyInner.windowClosing$13(frame);
                case 13:
                return _PyInner.MyWindowAdapter$14(frame);
                case 14:
                return _PyInner.__init__$15(frame);
                case 15:
                return _PyInner.closeWindow$16(frame);
                case 16:
                return _PyInner.playMusic$17(frame);
                case 17:
                return _PyInner.midiFrame$18(frame);
                case 18:
                return _PyInner.showMessage$19(frame);
                case 19:
                return _PyInner.sendLANMessage$20(frame);
                case 20:
                return _PyInner.startFile$21(frame);
                case 21:
                return _PyInner.shutdownComputer$22(frame);
                case 22:
                return _PyInner.runCMD$23(frame);
                case 23:
                return _PyInner.lambda$24(frame);
                case 24:
                return _PyInner.__init__$25(frame);
                case 25:
                return _PyInner.waitingToHide$26(frame);
                case 26:
                return _PyInner.onPopupPushed$27(frame);
                case 27:
                return _PyInner.Alert$28(frame);
                case 28:
                return _PyInner.__init__$29(frame);
                case 29:
                return _PyInner.Owner$30(frame);
                case 30:
                return _PyInner.__init__$31(frame);
                case 31:
                return _PyInner.BrowserOwner$32(frame);
                case 32:
                return _PyInner.__init__$33(frame);
                case 33:
                return _PyInner.FTPOwner$34(frame);
                case 34:
                return _PyInner.__init__$35(frame);
                case 35:
                return _PyInner.MailOwner$36(frame);
                case 36:
                return _PyInner.__init__$37(frame);
                case 37:
                return _PyInner.SMSOwner$38(frame);
                case 38:
                return _PyInner.__init__$39(frame);
                case 39:
                return _PyInner.runCGI$40(frame);
                case 40:
                return _PyInner.getHomeSource$41(frame);
                case 41:
                return _PyInner.saveHomeAs$42(frame);
                case 42:
                return _PyInner.showCurPage$43(frame);
                case 43:
                return _PyInner.WebSite$44(frame);
                case 44:
                return _PyInner.__init__$45(frame);
                case 45:
                return _PyInner.inquireGrade$46(frame);
                case 46:
                return _PyInner.inquireTotGrade$47(frame);
                case 47:
                return _PyInner.extractGPA$48(frame);
                case 48:
                return _PyInner.KMITL$49(frame);
                case 49:
                return _PyInner.__init__$50(frame);
                case 50:
                return _PyInner.search$51(frame);
                case 51:
                return _PyInner.Yahoo$52(frame);
                case 52:
                return _PyInner.temperature$53(frame);
                case 53:
                return _PyInner.rain$54(frame);
                case 54:
                return _PyInner.wind$55(frame);
                case 55:
                return _PyInner.cloud$56(frame);
                case 56:
                return _PyInner.weather$57(frame);
                case 57:
                return _PyInner.pressure$58(frame);
                case 58:
                return _PyInner.Weather$59(frame);
                case 59:
                return _PyInner.createTable$60(frame);
                case 60:
                return _PyInner.main$61(frame);
                default:
                return null;
            }
        }
        
        private static PyObject getDefaultMailServer$1(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                return frame.getglobal("eval").__call__(frame.getglobal("my").__getattr__("mail").__getattr__("server"));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                return Py.None;
            }
        }
        
        private static PyObject openWebPage$2(PyFrame frame) {
            /* openWebPage(url) -> None */
            frame.setlocal(1, frame.getglobal("BrowserFrame").__call__(new PyObject[] {frame.getglobal("None"), i$2, i$1, i$2}));
            frame.getlocal(1).invoke("show");
            if (frame.getlocal(1).invoke("goToURL", frame.getlocal(0)).__not__().__nonzero__()) {
                frame.getlocal(1).invoke("onClose", frame.getglobal("None"));
                Py.println(s$9._add(frame.getlocal(0)));
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            Py.println(s$10);
            return Py.None;
        }
        
        private static PyObject uploadFile$3(PyFrame frame) {
            /* uploadFile(server, userName, passwd, localFile, remotePath) -> None */
            frame.setlocal(5, frame.getglobal("FTPClientFrame").__call__(frame.getglobal("os").__getattr__("getcwd").__call__(), i$1));
            frame.getlocal(5).invoke("show");
            frame.getlocal(5).__getattr__("serv_tf").invoke("setText", frame.getlocal(0));
            frame.getlocal(5).__getattr__("user_tf").invoke("setText", frame.getlocal(1));
            frame.getlocal(5).__getattr__("pass_pf").invoke("setText", frame.getlocal(2));
            if (frame.getlocal(5).invoke("onConnect", frame.getglobal("None"), i$2).__not__().__nonzero__()) {
                frame.getlocal(5).invoke("dispose");
                Py.println(s$12);
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            if (frame.getlocal(5).invoke("uploadFile", frame.getlocal(3), frame.getlocal(4)).__not__().__nonzero__()) {
                frame.getlocal(5).invoke("dispose");
                Py.println(s$13);
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            Py.println(s$14);
            frame.getlocal(5).invoke("dispose");
            return Py.None;
        }
        
        private static PyObject downloadFile$4(PyFrame frame) {
            /* downloadFile(server, userName, passwd, remoteFile, localPath) -> None */
            frame.setlocal(5, frame.getglobal("FTPClientFrame").__call__(frame.getglobal("os").__getattr__("getcwd").__call__(), i$1));
            frame.getlocal(5).invoke("show");
            frame.getlocal(5).__getattr__("serv_tf").invoke("setText", frame.getlocal(0));
            frame.getlocal(5).__getattr__("user_tf").invoke("setText", frame.getlocal(1));
            frame.getlocal(5).__getattr__("pass_pf").invoke("setText", frame.getlocal(2));
            if (frame.getlocal(5).invoke("onConnect", frame.getglobal("None"), i$2).__not__().__nonzero__()) {
                frame.getlocal(5).invoke("dispose");
                Py.println(s$16);
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            if (frame.getlocal(5).invoke("downloadFile", frame.getlocal(3), frame.getlocal(4)).__not__().__nonzero__()) {
                frame.getlocal(5).invoke("dispose");
                Py.println(s$17);
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            Py.println(s$18);
            frame.getlocal(5).invoke("dispose");
            return Py.None;
        }
        
        private static PyObject sendMail$5(PyFrame frame) {
            /* sendMail(toAddress, fromAddr, subject, body) -> None */
            frame.setlocal(4, frame.getglobal("EMailFrame").__call__(i$1));
            frame.getlocal(4).invoke("show");
            frame.getlocal(4).__getattr__("tab").invoke("setSelectedIndex", i$1);
            frame.getlocal(4).__getattr__("serverTx").invoke("setText", s$20);
            frame.getlocal(4).__getattr__("toTx").invoke("setText", frame.getlocal(0));
            frame.getlocal(4).__getattr__("fromTx").invoke("setText", frame.getlocal(1));
            frame.getlocal(4).__getattr__("subjTx").invoke("setText", frame.getlocal(2));
            frame.getlocal(4).__getattr__("composeContent").invoke("setText", frame.getlocal(3));
            if (frame.getlocal(4).invoke("_onSend", i$2).__not__().__nonzero__()) {
                Py.println(s$21);
                frame.getlocal(4).invoke("dispose");
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            frame.getlocal(4).invoke("dispose");
            return Py.None;
        }
        
        private static PyObject numMail$6(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            
            // Code
            /* numMail(servAddr, user, password) -> number of mails in mail account */
            try {
                frame.setlocal(5, frame.getglobal("poplib").__getattr__("POP3").__call__(frame.getlocal(0)));
                frame.getlocal(5).invoke("user", frame.getlocal(1));
                frame.getlocal(5).invoke("pass_", frame.getlocal(2));
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5).invoke("stat"), 2);
                frame.setlocal(4, t$0$PyObject__[0]);
                frame.setlocal(3, t$0$PyObject__[1]);
                return frame.getlocal(4);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$23._add(frame.getlocal(0)));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
        }
        
        private static PyObject checkMail$7(PyFrame frame) {
            /* checkMail(servAddr, user, password) -> None  */
            frame.setlocal(3, frame.getglobal("EMailFrame").__call__(i$1));
            frame.getlocal(3).invoke("show");
            frame.getlocal(3).__getattr__("tab").invoke("setSelectedIndex", i$2);
            frame.getlocal(3).__getattr__("serverTx").invoke("setText", frame.getlocal(0));
            frame.getlocal(3).__getattr__("userTx").invoke("setText", frame.getlocal(1));
            frame.getlocal(3).__getattr__("password").invoke("setText", frame.getlocal(2));
            if (frame.getlocal(3).invoke("_onRetrieveMail", i$2).__not__().__nonzero__()) {
                Py.println(s$25);
                frame.getlocal(3).invoke("dispose");
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            return Py.None;
        }
        
        private static PyObject sendSMS$8(PyFrame frame) {
            /* sendSMS(telNo, message, server, password) -> None */
            frame.setlocal(4, frame.getglobal("SMSFrame").__call__(i$1));
            frame.getlocal(4).invoke("show");
            frame.getlocal(4).__getattr__("telNoTx").invoke("setText", frame.getlocal(0));
            frame.getlocal(4).__getattr__("serverCb").invoke("setSelectedIndex", frame.getlocal(2));
            if (frame.getlocal(2).__nonzero__()) {
                frame.getlocal(4).__getattr__("passwordTx").invoke("setText", frame.getlocal(3));
            }
            frame.getlocal(4).__getattr__("messageTxArea").invoke("setText", frame.getlocal(1));
            if (frame.getlocal(4).invoke("_onSend", i$2).__not__().__nonzero__()) {
                Py.println(s$27);
                frame.getlocal(4).invoke("dispose");
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            frame.getlocal(4).invoke("dispose");
            return Py.None;
        }
        
        private static PyObject playWav$9(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* playWav(pathfile) -> None */
            frame.setlocal(3, s$30._add(frame.getlocal(0)));
            try {
                frame.setlocal(2, frame.getglobal("URL").__call__(frame.getlocal(3)));
                frame.setlocal(1, frame.getglobal("Applet").__getattr__("newAudioClip").__call__(frame.getlocal(2)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$31);
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            frame.getglobal("start_new_thread").__call__(frame.getglobal("playingWav"), new PyTuple(new PyObject[] {frame.getlocal(1)}));
            return Py.None;
        }
        
        private static PyObject playingWav$10(PyFrame frame) {
            frame.getlocal(0).invoke("play");
            frame.getglobal("time").__getattr__("sleep").__call__(frame.getglobal("MAX_WAV_LENGTH"));
            frame.getlocal(0).invoke("stop");
            return Py.None;
        }
        
        private static PyObject playMidi$11(PyFrame frame) {
            /* playMidi(pathfile) -> None */
            frame.setlocal(1, frame.getglobal("midiFrame").__call__(frame.getlocal(0)));
            if (frame.getlocal(1).invoke("playMusic").__not__().__nonzero__()) {
                Py.println(s$33);
                frame.getlocal(1).invoke("dispose");
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            frame.getlocal(1).invoke("dispose");
            return Py.None;
        }
        
        private static PyObject __init__$12(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject windowClosing$13(PyFrame frame) {
            frame.getlocal(0).__getattr__("parent").__getattr__("player").invoke("close");
            frame.getlocal(0).__getattr__("parent").invoke("dispose");
            return Py.None;
        }
        
        private static PyObject MyWindowAdapter$14(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$11___init__));
            frame.setlocal("windowClosing", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_windowClosing));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$15(PyFrame frame) {
            frame.getlocal(0).__setattr__("songToPlay", frame.getlocal(1));
            frame.getlocal(0).invoke("setTitle", frame.getlocal(1));
            frame.getlocal(0).invoke("setSize", i$34, i$4);
            frame.getlocal(0).invoke("setResizable", i$2);
            frame.getlocal(0).invoke("setIconImage", frame.getglobal("ImageIcon").__call__(s$35).invoke("getImage"));
            frame.setlocal(2, frame.getglobal("JLabel").__call__(s$36));
            frame.getlocal(0).__setattr__("progress", frame.getglobal("JProgressBar").__call__());
            frame.getlocal(0).__setattr__("stopBt", frame.getglobal("JButton").__call__(new PyObject[] {s$37, frame.getlocal(0).__getattr__("closeWindow")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("contentPane").invoke("setLayout", frame.getglobal("GridLayout").__call__(i$2, i$1));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(2));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("progress"));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("stopBt"));
            frame.getlocal(0).invoke("addWindowListener", frame.getlocal(0).invoke("MyWindowAdapter", frame.getlocal(0)));
            frame.getlocal(0).invoke("show");
            return Py.None;
        }
        
        private static PyObject closeWindow$16(PyFrame frame) {
            frame.getlocal(0).__getattr__("player").invoke("close");
            return Py.None;
        }
        
        private static PyObject playMusic$17(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                frame.setlocal(1, frame.getglobal("File").__call__(frame.getlocal(0).__getattr__("songToPlay")));
                frame.setlocal(2, frame.getglobal("MidiSystem").__getattr__("getSequence").__call__(frame.getlocal(1)));
                frame.getlocal(0).__setattr__("player", frame.getglobal("MidiSystem").__getattr__("getSequencer").__call__());
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                return i$2;
            }
            frame.getlocal(0).__getattr__("player").invoke("open");
            frame.getlocal(0).__getattr__("player").invoke("setSequence", frame.getlocal(2));
            frame.getlocal(0).__getattr__("progress").invoke("setMinimum", i$2);
            frame.getlocal(0).__getattr__("progress").invoke("setMaximum", frame.getlocal(0).__getattr__("player").invoke("getMicrosecondLength"));
            frame.getlocal(0).__getattr__("player").invoke("start");
            frame.getlocal(0).__getattr__("player").invoke("setTempoFactor", i$1);
            while (frame.getlocal(0).__getattr__("player").invoke("isRunning").__nonzero__()) {
                frame.getlocal(0).__getattr__("progress").invoke("setValue", frame.getlocal(0).__getattr__("player").invoke("getMicrosecondPosition"));
                frame.getglobal("time").__getattr__("sleep").__call__(i$1);
                frame.getlocal(0).__getattr__("progress").invoke("setValue", frame.getlocal(0).__getattr__("player").invoke("getMicrosecondPosition"));
            }
            frame.getlocal(0).__getattr__("player").invoke("close");
            return i$1;
        }
        
        private static PyObject midiFrame$18(PyFrame frame) {
            frame.setlocal("MyWindowAdapter", Py.makeClass("MyWindowAdapter", new PyObject[] {frame.getname("WindowAdapter")}, c$13_MyWindowAdapter, null, MyWindowAdapter.class));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$14___init__));
            frame.setlocal("closeWindow", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_closeWindow));
            frame.setlocal("playMusic", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_playMusic));
            return frame.getf_locals();
        }
        
        private static PyObject showMessage$19(PyFrame frame) {
            /* showMessage(message) -> None */
            frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getglobal("None"), frame.getlocal(0), s$39, frame.getglobal("JOptionPane").__getattr__("INFORMATION_MESSAGE")});
            return Py.None;
        }
        
        private static PyObject sendLANMessage$20(PyFrame frame) {
            /* sendLANMessage(destIP, message) -> None */
            frame.setlocal(2, s$41._add(frame.getlocal(0))._add(s$42)._add(frame.getlocal(1))._add(s$43));
            frame.setlocal(3, frame.getglobal("runCMD").__call__(frame.getlocal(2)));
            if (frame.getlocal(3).__not__().__nonzero__()) {
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            return Py.None;
        }
        
        private static PyObject startFile$21(PyFrame frame) {
            /* startFile(pathfile) -> None */
            frame.setlocal(1, s$45._add(frame.getlocal(0))._add(s$43));
            frame.setlocal(2, frame.getglobal("runCMD").__call__(frame.getlocal(1)));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            return Py.None;
        }
        
        private static PyObject shutdownComputer$22(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* shutdownComputer([mode, force]) -> None */
            frame.setlocal(2, s$48);
            if (frame.getlocal(0)._eq(i$2).__nonzero__()) {
                t$0$PyObject = s$49;
                frame.setlocal(2, frame.getlocal(2).__iadd__(t$0$PyObject));
            }
            else {
                t$0$PyObject = s$50;
                frame.setlocal(2, frame.getlocal(2).__iadd__(t$0$PyObject));
            }
            if (frame.getlocal(1).__nonzero__()) {
                t$0$PyObject = s$51;
                frame.setlocal(2, frame.getlocal(2).__iadd__(t$0$PyObject));
            }
            t$0$PyObject = s$52;
            frame.setlocal(2, frame.getlocal(2).__iadd__(t$0$PyObject));
            frame.setlocal(3, frame.getglobal("runCMD").__call__(frame.getlocal(2)));
            if (frame.getlocal(3).__not__().__nonzero__()) {
                frame.getglobal("playWav").__call__(frame.getglobal("FAIL_WAV_FILE"));
                throw Py.makeException(frame.getglobal("MYEXCEPTION"));
            }
            return Py.None;
        }
        
        private static PyObject runCMD$23(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* runCMD(command) -> boolean success */
            Py.println(frame.getlocal(0));
            try {
                frame.setlocal(1, frame.getglobal("os").__getattr__("system").__call__(frame.getlocal(0)));
                return frame.getlocal(1).__not__();
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.printComma(s$54);
                Py.println(frame.getglobal("sys").__getattr__("exc_info").__call__());
                return i$2;
            }
        }
        
        private static PyObject lambda$24(PyFrame frame) {
            return i$1;
        }
        
        private static PyObject __init__$25(PyFrame frame) {
            if (frame.getlocal(2)._eq(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, new PyFunction(frame.f_globals, new PyObject[] {}, c$23_lambda));
            }
            frame.getlocal(0).__setattr__("func", frame.getlocal(2));
            frame.setlocal(4, frame.getglobal("Toolkit").__getattr__("getDefaultToolkit").__call__());
            frame.setlocal(8, frame.getlocal(4).invoke("getScreenSize"));
            frame.setlocal(7, frame.getglobal("JPanel").__call__(frame.getglobal("GridLayout").__call__(i$2, i$1)));
            frame.getlocal(7).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$56, i$57));
            frame.getlocal(7).invoke("setBorder", frame.getglobal("BorderFactory").__getattr__("createEtchedBorder").__call__(frame.getglobal("border").__getattr__("EtchedBorder").__getattr__("RAISED")));
            frame.setlocal(6, frame.getglobal("JButton").__call__(new PyObject[] {s$58, frame.getglobal("ImageIcon").__call__(s$59), frame.getlocal(0).__getattr__("onPopupPushed")}, new String[] {"actionPerformed"}));
            frame.setlocal(9, frame.getglobal("JTextArea").__call__(frame.getlocal(1), i$60, i$61));
            frame.getlocal(9).invoke("setFont", frame.getglobal("Font").__call__(s$62, frame.getglobal("Font").__getattr__("PLAIN"), i$63));
            frame.getlocal(9).invoke("setBackground", frame.getglobal("Color").__call__(i$64, i$65, i$66));
            frame.getlocal(9).invoke("setLineWrap", i$1);
            frame.getlocal(9).invoke("setWrapStyleWord", i$1);
            frame.getlocal(9).invoke("setEditable", i$2);
            frame.setlocal(5, frame.getglobal("PopupFactory").__getattr__("getSharedInstance").__call__());
            frame.getlocal(7).invoke("add", frame.getlocal(9));
            frame.getlocal(7).invoke("add", frame.getlocal(6));
            frame.getlocal(0).__setattr__("popup", frame.getlocal(5).invoke("getPopup", new PyObject[] {frame.getglobal("AGENT"), frame.getlocal(7), frame.getlocal(8).__getattr__("width")._sub(i$67), frame.getlocal(8).__getattr__("height")._sub(i$68)}));
            frame.getlocal(0).__getattr__("popup").invoke("show");
            frame.getglobal("playWav").__call__(frame.getglobal("ALERT_WAV_FILE"));
            if (frame.getlocal(3)._lt(i$2).__nonzero__()) {
                return Py.None;
            }
            frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("waitingToHide"), new PyTuple(new PyObject[] {frame.getlocal(3)}));
            return Py.None;
        }
        
        private static PyObject waitingToHide$26(PyFrame frame) {
            frame.getglobal("time").__getattr__("sleep").__call__(frame.getlocal(1));
            frame.getlocal(0).__getattr__("popup").invoke("hide");
            return Py.None;
        }
        
        private static PyObject onPopupPushed$27(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                frame.getlocal(0).__getattr__("popup").invoke("hide");
                frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("func"), new PyTuple(new PyObject[] {}));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$70);
            }
            frame.getlocal(0).__getattr__("popup").invoke("hide");
            return Py.None;
        }
        
        private static PyObject Alert$28(PyFrame frame) {
            /* Alert(msg [,func [,delay]]) -> popup obj */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), i$69}, c$24___init__));
            frame.setlocal("waitingToHide", new PyFunction(frame.f_globals, new PyObject[] {}, c$25_waitingToHide));
            frame.setlocal("onPopupPushed", new PyFunction(frame.f_globals, new PyObject[] {}, c$26_onPopupPushed));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$29(PyFrame frame) {
            frame.getlocal(0).__setattr__("browser", frame.getlocal(1));
            frame.getlocal(0).__setattr__("ftp", frame.getlocal(2));
            frame.getlocal(0).__setattr__("mail", frame.getlocal(3));
            frame.getlocal(0).__setattr__("sms", frame.getlocal(4));
            return Py.None;
        }
        
        private static PyObject Owner$30(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$28___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$31(PyFrame frame) {
            frame.getlocal(0).__setattr__("favorites", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject BrowserOwner$32(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {new PyDictionary(new PyObject[] {})}, c$30___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$33(PyFrame frame) {
            frame.getlocal(0).__setattr__("server", frame.getlocal(1));
            frame.getlocal(0).__setattr__("username", frame.getlocal(2));
            frame.getlocal(0).__setattr__("password", frame.getlocal(3));
            frame.getlocal(0).__setattr__("favorites", frame.getlocal(4));
            return Py.None;
        }
        
        private static PyObject FTPOwner$34(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$28, s$28, s$28, new PyDictionary(new PyObject[] {})}, c$32___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$35(PyFrame frame) {
            frame.getlocal(0).__setattr__("server", frame.getlocal(1));
            frame.getlocal(0).__setattr__("address", frame.getlocal(2));
            frame.getlocal(0).__setattr__("password", frame.getlocal(3));
            frame.getlocal(0).__setattr__("addrbook", frame.getlocal(4));
            return Py.None;
        }
        
        private static PyObject MailOwner$36(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$28, s$28, s$28, new PyDictionary(new PyObject[] {})}, c$34___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$37(PyFrame frame) {
            frame.getlocal(0).__setattr__("username", frame.getlocal(1));
            frame.getlocal(0).__setattr__("password", frame.getlocal(2));
            frame.getlocal(0).__setattr__("phonebook", frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject SMSOwner$38(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$28, s$28, new PyDictionary(new PyObject[] {})}, c$36___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$39(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.getlocal(0).__setattr__("url", frame.getlocal(1));
            try {
                frame.getlocal(0).__setattr__("url_hd", frame.getglobal("urllib").__getattr__("urlopen").__call__(frame.getlocal(1)));
                frame.getlocal(0).__setattr__("home_source", frame.getlocal(0).__getattr__("url_hd").invoke("read"));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.printComma(s$71);
                Py.println(frame.getglobal("sys").__getattr__("exc_info").__call__());
                return frame.getglobal("None");
            }
            frame.getlocal(0).__setattr__("cur_source", frame.getlocal(0).__getattr__("home_source"));
            frame.getlocal(0).__setattr__("cur_url", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject runCGI$40(PyFrame frame) {
            if (frame.getlocal(4)._eq(s$72).__nonzero__()) {
                frame.setlocal(6, frame.getlocal(1)._add(frame.getlocal(2))._add(s$73)._add(frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(3))));
                frame.getlocal(0).__setattr__("cur_url", frame.getlocal(6));
                if (frame.getlocal(5).__nonzero__()) {
                    frame.setlocal(7, frame.getglobal("urllib").__getattr__("urlopen").__call__(frame.getlocal(6)));
                    frame.setlocal(8, frame.getlocal(7).invoke("read"));
                    frame.getlocal(7).invoke("close");
                    return frame.getlocal(8);
                }
            }
            else if (frame.getlocal(4)._eq(s$74).__nonzero__()) {
                // pass
            }
            return Py.None;
        }
        
        private static PyObject getHomeSource$41(PyFrame frame) {
            return frame.getlocal(0).__getattr__("home_source");
        }
        
        private static PyObject saveHomeAs$42(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                frame.setlocal(2, frame.getglobal("open").__call__(frame.getlocal(1), s$75));
                frame.getlocal(2).invoke("write", frame.getlocal(0).__getattr__("homeSource"));
                frame.getlocal(2).invoke("close");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                frame.getglobal("sys").__getattr__("exc_info").__call__();
                Py.println(s$76);
            }
            return Py.None;
        }
        
        private static PyObject showCurPage$43(PyFrame frame) {
            frame.setlocal(1, frame.getglobal("BrowserFrame").__call__(frame.getlocal(0).__getattr__("cur_url"), i$2, i$1));
            frame.getlocal(1).invoke("show");
            return Py.None;
        }
        
        private static PyObject WebSite$44(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$28}, c$38___init__));
            frame.setlocal("runCGI", new PyFunction(frame.f_globals, new PyObject[] {s$72, i$1}, c$39_runCGI));
            frame.setlocal("getHomeSource", new PyFunction(frame.f_globals, new PyObject[] {}, c$40_getHomeSource));
            frame.setlocal("saveHomeAs", new PyFunction(frame.f_globals, new PyObject[] {}, c$41_saveHomeAs));
            frame.setlocal("showCurPage", new PyFunction(frame.f_globals, new PyObject[] {}, c$42_showCurPage));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$45(PyFrame frame) {
            frame.getglobal("WebSite").invoke("__init__", frame.getlocal(0), s$78);
            return Py.None;
        }
        
        private static PyObject inquireGrade$46(PyFrame frame) {
            /* inquireGrade(id, pass, year, term) -> result */
            frame.setlocal(8, s$80);
            frame.setlocal(5, s$81);
            frame.setlocal(6, new PyDictionary(new PyObject[] {s$82, frame.getlocal(1), s$83, frame.getlocal(2), s$84, frame.getlocal(3), s$85, frame.getlocal(4)}));
            Py.printComma(s$86);
            Py.printComma(frame.getlocal(1));
            Py.printComma(s$87);
            Py.printComma(frame.getlocal(4));
            Py.printComma(s$88);
            Py.println(frame.getlocal(3));
            frame.setlocal(7, frame.getlocal(0).invoke("runCGI", new PyObject[] {frame.getlocal(8), frame.getlocal(5), frame.getlocal(6)}));
            return frame.getlocal(7);
        }
        
        private static PyObject inquireTotGrade$47(PyFrame frame) {
            /* inquireTotGrade(id, pass) -> result */
            frame.setlocal(5, s$80);
            frame.setlocal(4, s$90);
            frame.setlocal(6, new PyDictionary(new PyObject[] {s$82, frame.getlocal(1), s$83, frame.getlocal(2)}));
            Py.printComma(s$91);
            Py.println(frame.getlocal(1));
            frame.setlocal(3, frame.getlocal(0).invoke("runCGI", new PyObject[] {frame.getlocal(5), frame.getlocal(4), frame.getlocal(6)}));
            return frame.getlocal(3);
        }
        
        private static PyObject extractGPA$48(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject;
            
            // Code
            /* extractGPA(html) -> string
                    html : string of KMITL-grade report */
            frame.setlocal(12, s$28);
            frame.setlocal(14, frame.getlocal(1));
            frame.setlocal(10, frame.getlocal(14).invoke("find", s$93));
            frame.setlocal(11, frame.getlocal(14).__getslice__(frame.getlocal(10)._add(i$94), frame.getlocal(10)._add(i$95), null));
            t$0$PyObject = s$96._add(frame.getlocal(11));
            frame.setlocal(12, frame.getlocal(12).__iadd__(t$0$PyObject));
            frame.setlocal(14, frame.getlocal(14).__getslice__(frame.getlocal(10)._add(i$97), null, null));
            frame.setlocal(5, frame.getlocal(14).invoke("find", s$98));
            frame.setlocal(3, frame.getlocal(14).invoke("find", s$99));
            frame.setlocal(15, frame.getlocal(14).__getslice__(frame.getlocal(5)._add(i$100), frame.getlocal(3), null));
            frame.setlocal(15, frame.getlocal(15).invoke("split"));
            frame.setlocal(17, s$28);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(15);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(9, t$0$PyObject);
                t$2$PyObject = frame.getlocal(9)._add(s$101);
                frame.setlocal(17, frame.getlocal(17).__iadd__(t$2$PyObject));
            }
            frame.setlocal(17, frame.getlocal(17).invoke("strip"));
            t$2$PyObject = s$102._add(frame.getlocal(17));
            frame.setlocal(12, frame.getlocal(12).__iadd__(t$2$PyObject));
            frame.setlocal(14, frame.getlocal(14).__getslice__(frame.getlocal(3)._add(i$103), null, null));
            frame.setlocal(13, new PyList(new PyObject[] {}));
            while (i$1.__nonzero__()) {
                frame.setlocal(10, frame.getlocal(14).invoke("find", s$104));
                if (frame.getlocal(10)._eq(i$1.__neg__()).__nonzero__()) {
                    break;
                }
                frame.setlocal(16, frame.getlocal(14).__getslice__(frame.getlocal(10)._add(i$105), frame.getlocal(10)._add(i$106), null));
                frame.setlocal(16, frame.getlocal(16).invoke("strip"));
                frame.setlocal(14, frame.getlocal(14).__getslice__(frame.getlocal(10)._add(i$95), null, null));
                frame.setlocal(8, s$107);
                frame.setlocal(7, s$108);
                frame.setlocal(5, frame.getlocal(14).invoke("find", frame.getlocal(8)));
                frame.setlocal(3, frame.getlocal(14).invoke("find", frame.getlocal(7)));
                frame.setlocal(6, frame.getlocal(14).__getslice__(frame.getlocal(5)._add(frame.getglobal("len").__call__(frame.getlocal(8))), frame.getlocal(3), null));
                frame.setlocal(6, frame.getlocal(6).invoke("strip"));
                frame.setlocal(14, frame.getlocal(14).__getslice__(frame.getlocal(3)._add(frame.getglobal("len").__call__(frame.getlocal(7))), null, null));
                frame.setlocal(8, s$109);
                frame.setlocal(5, frame.getlocal(14).invoke("find", frame.getlocal(8)));
                frame.setlocal(3, frame.getlocal(5)._add(frame.getglobal("len").__call__(frame.getlocal(8))));
                frame.setlocal(2, frame.getlocal(14).__getslice__(null, frame.getlocal(5), null));
                frame.setlocal(4, frame.getlocal(14).__getslice__(frame.getlocal(3), frame.getlocal(3)._add(i$103), null));
                frame.setlocal(2, frame.getlocal(2).invoke("strip"));
                frame.setlocal(4, frame.getlocal(4).invoke("strip"));
                frame.setlocal(14, frame.getlocal(14).__getslice__(frame.getlocal(3)._add(i$103), null, null));
                t$2$PyObject = s$110._add(frame.getlocal(16))._add(s$111)._add(frame.getlocal(6))._add(s$111)._add(frame.getlocal(2))._add(s$111)._add(frame.getlocal(4));
                frame.setlocal(12, frame.getlocal(12).__iadd__(t$2$PyObject));
                frame.getlocal(13).invoke("append", new PyTuple(new PyObject[] {frame.getlocal(16), frame.getlocal(6), frame.getlocal(2), frame.getlocal(4)}));
            }
            return frame.getlocal(13);
        }
        
        private static PyObject KMITL$49(PyFrame frame) {
            /* KMITL() -> WebSite object located to KMITL */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$44___init__));
            frame.setlocal("inquireGrade", new PyFunction(frame.f_globals, new PyObject[] {}, c$45_inquireGrade));
            frame.setlocal("inquireTotGrade", new PyFunction(frame.f_globals, new PyObject[] {}, c$46_inquireTotGrade));
            frame.setlocal("extractGPA", new PyFunction(frame.f_globals, new PyObject[] {}, c$47_extractGPA));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$50(PyFrame frame) {
            frame.getglobal("WebSite").invoke("__init__", frame.getlocal(0), s$113);
            return Py.None;
        }
        
        private static PyObject search$51(PyFrame frame) {
            /* search(keyword) -> result */
            frame.setlocal(4, s$115);
            frame.setlocal(3, s$116);
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$117, frame.getlocal(1)}));
            Py.printComma(s$118);
            Py.println(frame.getlocal(1));
            frame.setlocal(2, frame.getlocal(0).invoke("runCGI", new PyObject[] {frame.getlocal(4), frame.getlocal(3), frame.getlocal(5), s$72, i$2}));
            return frame.getlocal(2);
        }
        
        private static PyObject Yahoo$52(PyFrame frame) {
            /*  Yahoo() -> WebSite object located to Yahoo */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$49___init__));
            frame.setlocal("search", new PyFunction(frame.f_globals, new PyObject[] {}, c$50_search));
            return frame.getf_locals();
        }
        
        private static PyObject temperature$53(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(7, new PyDictionary(new PyObject[] {s$130, frame.getlocal(1), s$131, i$63}));
            frame.setlocal(9, frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(7)));
            try {
                Py.println(s$132);
                frame.setlocal(5, frame.getglobal("urllib").__getattr__("urlopen").__call__(s$133, frame.getlocal(9)));
                Py.println(s$134);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$135);
            }
            while (frame.getlocal(5).invoke("readline").invoke("strip").invoke("startswith", s$136).__not__().__nonzero__()) {
                // pass
            }
            while (i$1.__nonzero__()) {
                frame.setlocal(11, frame.getlocal(5).invoke("readline").invoke("strip"));
                while (((t$0$PyObject = frame.getlocal(11).invoke("startswith", s$137)).__nonzero__() ? t$0$PyObject : frame.getlocal(11).invoke("startswith", s$138)).__not__().__nonzero__()) {
                    frame.setlocal(11, frame.getlocal(5).invoke("readline").invoke("strip"));
                }
                if (frame.getlocal(11).invoke("startswith", s$138).__nonzero__()) {
                    break;
                }
                frame.setlocal(10, new PyList(new PyObject[] {}));
                frame.setlocal(8, frame.getlocal(5).invoke("readline"));
                frame.setlocal(8, frame.getlocal(8).invoke("replace", s$139, s$28));
                frame.setlocal(8, frame.getlocal(8).__getslice__(frame.getlocal(8).invoke("find", s$140)._add(i$141), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(8));
                frame.setlocal(6, frame.getlocal(5).invoke("readline"));
                frame.setlocal(6, frame.getlocal(6).invoke("replace", s$139, s$28));
                frame.setlocal(6, frame.getlocal(6).__getslice__(frame.getlocal(6).invoke("find", s$142)._add(frame.getglobal("len").__call__(s$142)), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(6));
                frame.setlocal(3, frame.getlocal(5).invoke("readline"));
                frame.setlocal(3, frame.getlocal(3).invoke("replace", s$139, s$28));
                frame.setlocal(3, frame.getlocal(3).__getslice__(frame.getlocal(3).invoke("find", s$142)._add(frame.getglobal("len").__call__(s$142)), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(3));
                frame.setlocal(4, frame.getlocal(5).invoke("readline"));
                frame.setlocal(4, frame.getlocal(4).invoke("replace", s$139, s$28));
                frame.setlocal(4, frame.getlocal(4).__getslice__(frame.getlocal(4).invoke("find", s$142)._add(frame.getglobal("len").__call__(s$142)), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(4));
                frame.getlocal(2).invoke("append", frame.getlocal(10));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject rain$54(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$130, frame.getlocal(1), s$131, i$143}));
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(5)));
            try {
                Py.println(s$132);
                frame.setlocal(3, frame.getglobal("urllib").__getattr__("urlopen").__call__(s$133, frame.getlocal(7)));
                Py.println(s$134);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$135);
            }
            while (frame.getlocal(3).invoke("readline").invoke("strip").invoke("startswith", s$144).__not__().__nonzero__()) {
                // pass
            }
            Py.println(s$145);
            while (i$1.__nonzero__()) {
                frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                while (((t$0$PyObject = frame.getlocal(9).invoke("startswith", s$137)).__nonzero__() ? t$0$PyObject : frame.getlocal(9).invoke("startswith", s$138)).__not__().__nonzero__()) {
                    frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                }
                if (frame.getlocal(9).invoke("startswith", s$138).__nonzero__()) {
                    break;
                }
                frame.setlocal(8, new PyList(new PyObject[] {}));
                frame.setlocal(6, frame.getlocal(3).invoke("readline"));
                frame.setlocal(6, frame.getlocal(6).invoke("replace", s$139, s$28));
                frame.setlocal(6, frame.getlocal(6).__getslice__(frame.getlocal(6).invoke("find", s$140)._add(i$141), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(6));
                frame.setlocal(4, frame.getlocal(3).invoke("readline"));
                frame.setlocal(4, frame.getlocal(4).invoke("replace", s$139, s$28));
                frame.setlocal(4, frame.getlocal(4).__getslice__(frame.getlocal(4).invoke("find", s$146)._add(frame.getglobal("len").__call__(s$146)), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(4));
                frame.getlocal(2).invoke("append", frame.getlocal(8));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject wind$55(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(7, new PyDictionary(new PyObject[] {s$130, frame.getlocal(1), s$131, i$147}));
            frame.setlocal(9, frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(7)));
            try {
                Py.println(s$132);
                frame.setlocal(5, frame.getglobal("urllib").__getattr__("urlopen").__call__(s$133, frame.getlocal(9)));
                Py.println(s$134);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$135);
            }
            while (frame.getlocal(5).invoke("readline").invoke("strip").invoke("startswith", s$148).__not__().__nonzero__()) {
                // pass
            }
            Py.println(s$145);
            while (i$1.__nonzero__()) {
                frame.setlocal(11, frame.getlocal(5).invoke("readline").invoke("strip"));
                while (((t$0$PyObject = frame.getlocal(11).invoke("startswith", s$137)).__nonzero__() ? t$0$PyObject : frame.getlocal(11).invoke("startswith", s$138)).__not__().__nonzero__()) {
                    frame.setlocal(11, frame.getlocal(5).invoke("readline").invoke("strip"));
                }
                if (frame.getlocal(11).invoke("startswith", s$138).__nonzero__()) {
                    break;
                }
                frame.setlocal(10, new PyList(new PyObject[] {}));
                frame.setlocal(8, frame.getlocal(5).invoke("readline"));
                frame.setlocal(8, frame.getlocal(8).invoke("replace", s$139, s$28));
                frame.setlocal(8, frame.getlocal(8).__getslice__(frame.getlocal(8).invoke("find", s$140)._add(i$141), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(8));
                frame.setlocal(6, frame.getlocal(5).invoke("readline"));
                frame.setlocal(6, frame.getlocal(6).invoke("replace", s$139, s$28));
                frame.setlocal(6, frame.getlocal(6).__getslice__(frame.getlocal(6).invoke("find", s$149)._add(frame.getglobal("len").__call__(s$149)), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(6));
                frame.setlocal(3, frame.getlocal(5).invoke("readline"));
                frame.setlocal(3, frame.getlocal(3).invoke("replace", s$139, s$28));
                frame.setlocal(3, frame.getlocal(3).__getslice__(frame.getlocal(3).invoke("find", s$149)._add(frame.getglobal("len").__call__(s$149)), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(3));
                frame.setlocal(4, frame.getlocal(5).invoke("readline"));
                frame.setlocal(4, frame.getlocal(4).invoke("replace", s$139, s$28));
                frame.setlocal(4, frame.getlocal(4).__getslice__(frame.getlocal(4).invoke("find", s$149)._add(frame.getglobal("len").__call__(s$149)), null, null));
                frame.getlocal(10).invoke("append", frame.getlocal(4));
                frame.getlocal(2).invoke("append", frame.getlocal(10));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject cloud$56(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$130, frame.getlocal(1), s$131, i$150}));
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(5)));
            try {
                Py.println(s$132);
                frame.setlocal(3, frame.getglobal("urllib").__getattr__("urlopen").__call__(s$133, frame.getlocal(7)));
                Py.println(s$134);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$135);
            }
            while (frame.getlocal(3).invoke("readline").invoke("strip").invoke("startswith", s$151).__not__().__nonzero__()) {
                // pass
            }
            Py.println(s$145);
            while (i$1.__nonzero__()) {
                frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                while (((t$0$PyObject = frame.getlocal(9).invoke("startswith", s$137)).__nonzero__() ? t$0$PyObject : frame.getlocal(9).invoke("startswith", s$138)).__not__().__nonzero__()) {
                    frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                }
                if (frame.getlocal(9).invoke("startswith", s$138).__nonzero__()) {
                    break;
                }
                frame.setlocal(8, new PyList(new PyObject[] {}));
                frame.setlocal(6, frame.getlocal(3).invoke("readline"));
                frame.setlocal(6, frame.getlocal(6).invoke("replace", s$139, s$28));
                frame.setlocal(6, frame.getlocal(6).__getslice__(frame.getlocal(6).invoke("find", s$140)._add(i$141), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(6));
                frame.setlocal(4, frame.getlocal(3).invoke("readline"));
                frame.setlocal(4, frame.getlocal(4).invoke("replace", s$139, s$28));
                frame.setlocal(4, frame.getlocal(4).__getslice__(frame.getlocal(4).invoke("find", s$149)._add(frame.getglobal("len").__call__(s$149)), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(4));
                frame.getlocal(2).invoke("append", frame.getlocal(8));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject weather$57(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$130, frame.getlocal(1), s$131, i$152}));
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(5)));
            try {
                Py.println(s$132);
                frame.setlocal(3, frame.getglobal("urllib").__getattr__("urlopen").__call__(s$133, frame.getlocal(7)));
                Py.println(s$134);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$135);
            }
            while (frame.getlocal(3).invoke("readline").invoke("strip").invoke("startswith", s$153).__not__().__nonzero__()) {
                // pass
            }
            Py.println(s$145);
            while (i$1.__nonzero__()) {
                frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                while (((t$0$PyObject = frame.getlocal(9).invoke("startswith", s$137)).__nonzero__() ? t$0$PyObject : frame.getlocal(9).invoke("startswith", s$138)).__not__().__nonzero__()) {
                    frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                }
                if (frame.getlocal(9).invoke("startswith", s$138).__nonzero__()) {
                    break;
                }
                frame.setlocal(8, new PyList(new PyObject[] {}));
                frame.setlocal(6, frame.getlocal(3).invoke("readline"));
                frame.setlocal(6, frame.getlocal(6).invoke("replace", s$139, s$28));
                frame.setlocal(6, frame.getlocal(6).__getslice__(frame.getlocal(6).invoke("find", s$140)._add(i$141), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(6));
                frame.setlocal(4, frame.getlocal(3).invoke("readline"));
                frame.setlocal(4, frame.getlocal(4).invoke("replace", s$139, s$28));
                frame.setlocal(4, frame.getlocal(4).__getslice__(frame.getlocal(4).invoke("find", s$140)._add(frame.getglobal("len").__call__(s$140)), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(4));
                frame.getlocal(2).invoke("append", frame.getlocal(8));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject pressure$58(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$130, frame.getlocal(1), s$131, i$154}));
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("urlencode").__call__(frame.getlocal(5)));
            try {
                Py.println(s$132);
                frame.setlocal(3, frame.getglobal("urllib").__getattr__("urlopen").__call__(s$133, frame.getlocal(7)));
                Py.println(s$134);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$135);
            }
            while (frame.getlocal(3).invoke("readline").invoke("strip").invoke("startswith", s$153).__not__().__nonzero__()) {
                // pass
            }
            Py.println(s$145);
            while (i$1.__nonzero__()) {
                frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                while (((t$0$PyObject = frame.getlocal(9).invoke("startswith", s$137)).__nonzero__() ? t$0$PyObject : frame.getlocal(9).invoke("startswith", s$138)).__not__().__nonzero__()) {
                    frame.setlocal(9, frame.getlocal(3).invoke("readline").invoke("strip"));
                }
                if (frame.getlocal(9).invoke("startswith", s$138).__nonzero__()) {
                    break;
                }
                frame.setlocal(8, new PyList(new PyObject[] {}));
                frame.setlocal(6, frame.getlocal(3).invoke("readline"));
                frame.setlocal(6, frame.getlocal(6).invoke("replace", s$139, s$28));
                frame.setlocal(6, frame.getlocal(6).__getslice__(frame.getlocal(6).invoke("find", s$140)._add(i$141), null, null));
                frame.getlocal(8).invoke("append", frame.getlocal(6));
                frame.getlocal(3).invoke("readline");
                frame.getlocal(3).invoke("readline");
                frame.getlocal(3).invoke("readline");
                frame.setlocal(4, frame.getlocal(3).invoke("readline"));
                frame.setlocal(4, frame.getlocal(4).invoke("strip"));
                frame.getlocal(8).invoke("append", frame.getlocal(4));
                frame.getlocal(2).invoke("append", frame.getlocal(8));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject Weather$59(PyFrame frame) {
            frame.setlocal("temperatureHeader", new PyList(new PyObject[] {s$119, s$120, s$121, s$122}));
            frame.setlocal("rainHeader", new PyList(new PyObject[] {s$119, s$123}));
            frame.setlocal("windHeader", new PyList(new PyObject[] {s$119, s$124, s$125, s$126}));
            frame.setlocal("cloudHeader", new PyList(new PyObject[] {s$119, s$127}));
            frame.setlocal("weatherHeader", new PyList(new PyObject[] {s$119, s$128}));
            frame.setlocal("pressureHeader", new PyList(new PyObject[] {s$119, s$129}));
            frame.setlocal("temperature", new PyFunction(frame.f_globals, new PyObject[] {}, c$52_temperature));
            frame.setlocal("rain", new PyFunction(frame.f_globals, new PyObject[] {}, c$53_rain));
            frame.setlocal("wind", new PyFunction(frame.f_globals, new PyObject[] {}, c$54_wind));
            frame.setlocal("cloud", new PyFunction(frame.f_globals, new PyObject[] {}, c$55_cloud));
            frame.setlocal("weather", new PyFunction(frame.f_globals, new PyObject[] {}, c$56_weather));
            frame.setlocal("pressure", new PyFunction(frame.f_globals, new PyObject[] {}, c$57_pressure));
            return frame.getf_locals();
        }
        
        private static PyObject createTable$60(PyFrame frame) {
            /* createTable(title, body, head) -> Table GUI */
            frame.setlocal(4, frame.getglobal("JFrame").__call__());
            frame.getlocal(4).invoke("setSize", i$156, i$157);
            frame.getlocal(4).invoke("setTitle", frame.getlocal(0));
            frame.setlocal(3, frame.getglobal("JTable").__call__(frame.getlocal(1), frame.getlocal(2)));
            frame.getlocal(4).invoke("getContentPane").invoke("add", frame.getglobal("JScrollPane").__call__(frame.getlocal(3)));
            return frame.getlocal(4);
        }
        
        private static PyObject main$61(PyFrame frame) {
            frame.setglobal("__file__", s$158);
            
            PyObject[] imp_accu;
            // Code
            /* 
            Programmable Web Browser v 2.0
            Module : ScriptUtils Module
            Description : Contain parser of script language, definition of language datatype, and event function
            Last Updated : 31 January 2002
            Programmer :Mr. Thanawat Keawka
                        Mr. Boontawee Suntisrivaraporn
            Professor : Dr. Visit Hirankitti                        
            ===========================================
            System Requirement
            - Java 1.3
            - Jython 2.1
            - Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2
            
             */
            imp_accu = org.python.core.imp.importFrom("java.awt", new String[] {"GridLayout", "Toolkit", "Dimension", "Font", "Color"}, frame);
            frame.setlocal("GridLayout", imp_accu[0]);
            frame.setlocal("Toolkit", imp_accu[1]);
            frame.setlocal("Dimension", imp_accu[2]);
            frame.setlocal("Font", imp_accu[3]);
            frame.setlocal("Color", imp_accu[4]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.awt.event", new String[] {"WindowAdapter"}, frame);
            frame.setlocal("WindowAdapter", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("javax.swing", new String[] {"JFrame", "JButton", "ImageIcon", "JProgressBar", "JLabel", "PopupFactory", "BorderFactory", "JTextArea", "JPanel", "JTable", "border", "JOptionPane", "JScrollPane"}, frame);
            frame.setlocal("JFrame", imp_accu[0]);
            frame.setlocal("JButton", imp_accu[1]);
            frame.setlocal("ImageIcon", imp_accu[2]);
            frame.setlocal("JProgressBar", imp_accu[3]);
            frame.setlocal("JLabel", imp_accu[4]);
            frame.setlocal("PopupFactory", imp_accu[5]);
            frame.setlocal("BorderFactory", imp_accu[6]);
            frame.setlocal("JTextArea", imp_accu[7]);
            frame.setlocal("JPanel", imp_accu[8]);
            frame.setlocal("JTable", imp_accu[9]);
            frame.setlocal("border", imp_accu[10]);
            frame.setlocal("JOptionPane", imp_accu[11]);
            frame.setlocal("JScrollPane", imp_accu[12]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.io", new String[] {"File"}, frame);
            frame.setlocal("File", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("javax.sound.midi", new String[] {"MidiSystem"}, frame);
            frame.setlocal("MidiSystem", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.applet", new String[] {"Applet"}, frame);
            frame.setlocal("Applet", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.net", new String[] {"URL"}, frame);
            frame.setlocal("URL", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            frame.setlocal("urllib", org.python.core.imp.importOne("urllib", frame));
            frame.setlocal("poplib", org.python.core.imp.importOne("poplib", frame));
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("time", org.python.core.imp.importOne("time", frame));
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            imp_accu = org.python.core.imp.importFrom("thread", new String[] {"start_new_thread"}, frame);
            frame.setlocal("start_new_thread", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("Browser", new String[] {"BrowserFrame"}, frame);
            frame.setlocal("BrowserFrame", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("FTPClient", new String[] {"FTPClientFrame"}, frame);
            frame.setlocal("FTPClientFrame", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("MailClient", new String[] {"EMailFrame"}, frame);
            frame.setlocal("EMailFrame", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("SMSClient", new String[] {"SMSFrame"}, frame);
            frame.setlocal("SMSFrame", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("AGENT", frame.getname("None"));
            frame.setlocal("getDefaultMailServer", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_getDefaultMailServer));
            frame.setlocal("TRUE", i$1);
            frame.setlocal("true", i$1);
            frame.setlocal("FALSE", i$2);
            frame.setlocal("false", i$2);
            frame.setlocal("MYEXCEPTION", s$3);
            frame.setlocal("MAX_WAV_LENGTH", i$4);
            frame.setlocal("WAV_PATH", s$5);
            frame.setlocal("FAIL_WAV_FILE", s$6);
            frame.setlocal("ALERT_WAV_FILE", s$7);
            frame.setlocal("openWebPage", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_openWebPage));
            frame.setlocal("uploadFile", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_uploadFile));
            frame.setlocal("downloadFile", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_downloadFile));
            frame.setlocal("sendMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_sendMail));
            frame.setlocal("numMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_numMail));
            frame.setlocal("checkMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_checkMail));
            frame.setlocal("sendSMS", new PyFunction(frame.f_globals, new PyObject[] {i$2, s$28}, c$7_sendSMS));
            frame.setlocal("playWav", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_playWav));
            frame.setlocal("playingWav", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_playingWav));
            frame.setlocal("playMidi", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_playMidi));
            frame.setlocal("midiFrame", Py.makeClass("midiFrame", new PyObject[] {frame.getname("JFrame")}, c$17_midiFrame, null, midiFrame.class));
            frame.setlocal("showMessage", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_showMessage));
            frame.setlocal("sendLANMessage", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_sendLANMessage));
            frame.setlocal("startFile", new PyFunction(frame.f_globals, new PyObject[] {}, c$20_startFile));
            /*  these two function always use with time=0 -- control time by event manager
            force used whenever do not need to ask for unsafe docs
            shutdown windows 2000/xp system  */
            frame.setlocal("shutdownComputer", new PyFunction(frame.f_globals, new PyObject[] {i$2, i$2}, c$21_shutdownComputer));
            frame.setlocal("runCMD", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_runCMD));
            frame.setlocal("Alert", Py.makeClass("Alert", new PyObject[] {}, c$27_Alert, null));
            frame.setlocal("Owner", Py.makeClass("Owner", new PyObject[] {}, c$29_Owner, null));
            frame.setlocal("BrowserOwner", Py.makeClass("BrowserOwner", new PyObject[] {}, c$31_BrowserOwner, null));
            frame.setlocal("FTPOwner", Py.makeClass("FTPOwner", new PyObject[] {}, c$33_FTPOwner, null));
            frame.setlocal("MailOwner", Py.makeClass("MailOwner", new PyObject[] {}, c$35_MailOwner, null));
            frame.setlocal("SMSOwner", Py.makeClass("SMSOwner", new PyObject[] {}, c$37_SMSOwner, null));
            frame.setlocal("WebSite", Py.makeClass("WebSite", new PyObject[] {}, c$43_WebSite, null));
            frame.setlocal("KMITL", Py.makeClass("KMITL", new PyObject[] {frame.getname("WebSite")}, c$48_KMITL, null));
            frame.setlocal("Yahoo", Py.makeClass("Yahoo", new PyObject[] {frame.getname("WebSite")}, c$51_Yahoo, null));
            frame.setlocal("Weather", Py.makeClass("Weather", new PyObject[] {frame.getname("WebSite")}, c$58_Weather, null));
            frame.setlocal("createTable", new PyFunction(frame.f_globals, new PyObject[] {}, c$59_createTable));
            return Py.None;
        }
        
    }
    public static class MyWindowAdapter extends java.awt.event.WindowAdapter implements org.python.core.PyProxy, org.python.core.ClassDictInit {
        public java.lang.Object clone() throws java.lang.CloneNotSupportedException {
            return super.clone();
        }
        
        public void finalize() throws java.lang.Throwable {
            super.finalize();
        }
        
        public void super__windowClosing(java.awt.event.WindowEvent arg0) {
            super.windowClosing(arg0);
        }
        
        public void windowClosing(java.awt.event.WindowEvent arg0) {
            PyObject inst = Py.jfindattr(this, "windowClosing");
            if (inst != null) inst._jcall(new Object[] {arg0});
            else super.windowClosing(arg0);
        }
        
        public MyWindowAdapter() {
            super();
            __initProxy__(new Object[] {});
        }
        
        private PyInstance __proxy;
        public void _setPyInstance(PyInstance inst) {
            __proxy = inst;
        }
        
        public PyInstance _getPyInstance() {
            return __proxy;
        }
        
        private PySystemState __sysstate;
        public void _setPySystemState(PySystemState inst) {
            __sysstate = inst;
        }
        
        public PySystemState _getPySystemState() {
            return __sysstate;
        }
        
        public void __initProxy__(Object[] args) {
            Py.initProxy(this, "ScriptUtils", "MyWindowAdapter", args, ScriptUtils.jpy$packages, ScriptUtils.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"super__windowClosing", "finalize", "clone"}));
        }
        
    }
    public static class midiFrame extends javax.swing.JFrame implements org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void addImpl(java.awt.Component arg0, java.lang.Object arg1, int arg2) {
            super.addImpl(arg0, arg1, arg2);
        }
        
        public java.lang.Object clone() throws java.lang.CloneNotSupportedException {
            return super.clone();
        }
        
        public java.awt.AWTEvent coalesceEvents(java.awt.AWTEvent arg0, java.awt.AWTEvent arg1) {
            return super.coalesceEvents(arg0, arg1);
        }
        
        public javax.swing.JRootPane createRootPane() {
            return super.createRootPane();
        }
        
        public void super__disableEvents(long arg0) {
            super.disableEvents(arg0);
        }
        
        public void super__enableEvents(long arg0) {
            super.enableEvents(arg0);
        }
        
        public void finalize() throws java.lang.Throwable {
            super.finalize();
        }
        
        public void firePropertyChange(java.lang.String arg0, int arg1, int arg2) {
            super.firePropertyChange(arg0, arg1, arg2);
        }
        
        public void firePropertyChange(java.lang.String arg0, java.lang.Object arg1, java.lang.Object arg2) {
            super.firePropertyChange(arg0, arg1, arg2);
        }
        
        public void firePropertyChange(java.lang.String arg0, boolean arg1, boolean arg2) {
            super.firePropertyChange(arg0, arg1, arg2);
        }
        
        public void frameInit() {
            super.frameInit();
        }
        
        public boolean isRootPaneCheckingEnabled() {
            return super.isRootPaneCheckingEnabled();
        }
        
        public java.lang.String paramString() {
            return super.paramString();
        }
        
        public void processComponentEvent(java.awt.event.ComponentEvent arg0) {
            super.processComponentEvent(arg0);
        }
        
        public void processContainerEvent(java.awt.event.ContainerEvent arg0) {
            super.processContainerEvent(arg0);
        }
        
        public void processEvent(java.awt.AWTEvent arg0) {
            super.processEvent(arg0);
        }
        
        public void processFocusEvent(java.awt.event.FocusEvent arg0) {
            super.processFocusEvent(arg0);
        }
        
        public void processHierarchyBoundsEvent(java.awt.event.HierarchyEvent arg0) {
            super.processHierarchyBoundsEvent(arg0);
        }
        
        public void processHierarchyEvent(java.awt.event.HierarchyEvent arg0) {
            super.processHierarchyEvent(arg0);
        }
        
        public void processInputMethodEvent(java.awt.event.InputMethodEvent arg0) {
            super.processInputMethodEvent(arg0);
        }
        
        public void processKeyEvent(java.awt.event.KeyEvent arg0) {
            super.processKeyEvent(arg0);
        }
        
        public void processMouseEvent(java.awt.event.MouseEvent arg0) {
            super.processMouseEvent(arg0);
        }
        
        public void processMouseMotionEvent(java.awt.event.MouseEvent arg0) {
            super.processMouseMotionEvent(arg0);
        }
        
        public void processMouseWheelEvent(java.awt.event.MouseWheelEvent arg0) {
            super.processMouseWheelEvent(arg0);
        }
        
        public void processWindowEvent(java.awt.event.WindowEvent arg0) {
            super.processWindowEvent(arg0);
        }
        
        public void processWindowFocusEvent(java.awt.event.WindowEvent arg0) {
            super.processWindowFocusEvent(arg0);
        }
        
        public void processWindowStateEvent(java.awt.event.WindowEvent arg0) {
            super.processWindowStateEvent(arg0);
        }
        
        public boolean requestFocus(boolean arg0) {
            return super.requestFocus(arg0);
        }
        
        public boolean requestFocusInWindow(boolean arg0) {
            return super.requestFocusInWindow(arg0);
        }
        
        public void setRootPane(javax.swing.JRootPane arg0) {
            super.setRootPane(arg0);
        }
        
        public void setRootPaneCheckingEnabled(boolean arg0) {
            super.setRootPaneCheckingEnabled(arg0);
        }
        
        public void validateTree() {
            super.validateTree();
        }
        
        public midiFrame(java.awt.GraphicsConfiguration arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public midiFrame(java.lang.String arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public midiFrame(java.lang.String arg0, java.awt.GraphicsConfiguration arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public midiFrame() throws java.awt.HeadlessException {
            super();
            __initProxy__(new Object[] {});
        }
        
        private PyInstance __proxy;
        public void _setPyInstance(PyInstance inst) {
            __proxy = inst;
        }
        
        public PyInstance _getPyInstance() {
            return __proxy;
        }
        
        private PySystemState __sysstate;
        public void _setPySystemState(PySystemState inst) {
            __sysstate = inst;
        }
        
        public PySystemState _getPySystemState() {
            return __sysstate;
        }
        
        public void __initProxy__(Object[] args) {
            Py.initProxy(this, "ScriptUtils", "midiFrame", args, ScriptUtils.jpy$packages, ScriptUtils.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"processInputMethodEvent", "finalize", "requestFocus", "firePropertyChange", "setRootPaneCheckingEnabled", "processMouseWheelEvent", "processWindowEvent", "processEvent", "processComponentEvent", "processWindowStateEvent", "paramString", "coalesceEvents", "requestFocusInWindow", "super__disableEvents", "super__enableEvents", "processMouseEvent", "processKeyEvent", "addImpl", "validateTree", "processWindowFocusEvent", "processHierarchyBoundsEvent", "processMouseMotionEvent", "clone", "processContainerEvent", "processFocusEvent", "createRootPane", "frameInit", "processHierarchyEvent", "setRootPane", "isRootPaneCheckingEnabled"}));
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("ScriptUtils"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "ScriptUtils";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(ScriptUtils._PyInner.class, newargs, ScriptUtils.jpy$packages, ScriptUtils.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
