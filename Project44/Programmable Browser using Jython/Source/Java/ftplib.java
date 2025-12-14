import org.python.core.*;

public class ftplib extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject i$3;
        private static PyObject i$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject i$7;
        private static PyObject s$8;
        private static PyObject s$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject i$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject i$22;
        private static PyObject i$23;
        private static PyObject i$24;
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyObject s$27;
        private static PyObject s$28;
        private static PyObject s$29;
        private static PyObject s$30;
        private static PyObject s$31;
        private static PyObject s$32;
        private static PyObject s$33;
        private static PyObject s$34;
        private static PyObject s$35;
        private static PyObject s$36;
        private static PyObject s$37;
        private static PyObject s$38;
        private static PyObject s$39;
        private static PyObject s$40;
        private static PyObject s$41;
        private static PyObject i$42;
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
        private static PyObject s$56;
        private static PyObject s$57;
        private static PyObject s$58;
        private static PyObject s$59;
        private static PyObject s$60;
        private static PyObject s$61;
        private static PyObject i$62;
        private static PyObject s$63;
        private static PyObject s$64;
        private static PyObject s$65;
        private static PyObject s$66;
        private static PyObject s$67;
        private static PyObject s$68;
        private static PyObject s$69;
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
        private static PyObject s$94;
        private static PyObject s$95;
        private static PyObject s$96;
        private static PyObject s$97;
        private static PyObject s$98;
        private static PyObject s$99;
        private static PyObject s$100;
        private static PyObject s$101;
        private static PyObject s$102;
        private static PyObject s$103;
        private static PyObject i$104;
        private static PyObject i$105;
        private static PyObject s$106;
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
        private static PyObject i$140;
        private static PyObject s$141;
        private static PyObject s$142;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_Error;
        private static PyCode c$1_error_reply;
        private static PyCode c$2_error_temp;
        private static PyCode c$3_error_perm;
        private static PyCode c$4_error_proto;
        private static PyCode c$5___init__;
        private static PyCode c$6_connect;
        private static PyCode c$7_getwelcome;
        private static PyCode c$8_set_debuglevel;
        private static PyCode c$9_set_pasv;
        private static PyCode c$10_sanitize;
        private static PyCode c$11_putline;
        private static PyCode c$12_putcmd;
        private static PyCode c$13_getline;
        private static PyCode c$14_getmultiline;
        private static PyCode c$15_getresp;
        private static PyCode c$16_voidresp;
        private static PyCode c$17_abort;
        private static PyCode c$18_sendcmd;
        private static PyCode c$19_voidcmd;
        private static PyCode c$20_sendport;
        private static PyCode c$21_makeport;
        private static PyCode c$22_ntransfercmd;
        private static PyCode c$23_transfercmd;
        private static PyCode c$24_login;
        private static PyCode c$25_retrbinary;
        private static PyCode c$26_retrlines;
        private static PyCode c$27_storbinary;
        private static PyCode c$28_storlines;
        private static PyCode c$29_acct;
        private static PyCode c$30_nlst;
        private static PyCode c$31_dir;
        private static PyCode c$32_rename;
        private static PyCode c$33_delete;
        private static PyCode c$34_cwd;
        private static PyCode c$35_size;
        private static PyCode c$36_mkd;
        private static PyCode c$37_rmd;
        private static PyCode c$38_pwd;
        private static PyCode c$39_quit;
        private static PyCode c$40_close;
        private static PyCode c$41_FTP;
        private static PyCode c$42_parse150;
        private static PyCode c$43_parse227;
        private static PyCode c$44_parse257;
        private static PyCode c$45_print_line;
        private static PyCode c$46_ftpcp;
        private static PyCode c$47___init__;
        private static PyCode c$48_get_hosts;
        private static PyCode c$49_get_account;
        private static PyCode c$50_get_macros;
        private static PyCode c$51_get_macro;
        private static PyCode c$52_Netrc;
        private static PyCode c$53_test;
        private static PyCode c$54_main;
        private static void initConstants() {
            s$0 = Py.newString("An FTP client class and some helper functions.\012\012Based on RFC 959: File Transfer Protocol (FTP), by J. Postel and J. Reynolds\012\012Example:\012\012>>> from ftplib import FTP\012>>> ftp = FTP('ftp.python.org') # connect to host, default port\012>>> ftp.login() # default, i.e.: user anonymous, passwd user@hostname\012'230 Guest login ok, access restrictions apply.'\012>>> ftp.retrlines('LIST') # list directory contents\012total 9\012drwxr-xr-x   8 root     wheel        1024 Jan  3  1994 .\012drwxr-xr-x   8 root     wheel        1024 Jan  3  1994 ..\012drwxr-xr-x   2 root     wheel        1024 Jan  3  1994 bin\012drwxr-xr-x   2 root     wheel        1024 Jan  3  1994 etc\012d-wxrwxr-x   2 ftp      wheel        1024 Sep  5 13:43 incoming\012drwxr-xr-x   2 root     wheel        1024 Nov 17  1993 lib\012drwxr-xr-x   6 1094     wheel        1024 Sep 13 19:07 pub\012drwxr-xr-x   3 root     wheel        1024 Jan  3  1994 usr\012-rw-r--r--   1 root     root          312 Aug  1  1994 welcome.msg\012'226 Transfer complete.'\012>>> ftp.quit()\012'221 Goodbye.'\012>>>\012\012A nice test that reveals some of the network dialogue would be:\012python ftplib.py -d localhost -l -p -l\012");
            s$1 = Py.newString("FTP");
            s$2 = Py.newString("Netrc");
            i$3 = Py.newInteger(1);
            i$4 = Py.newInteger(21);
            s$5 = Py.newString("\015\012");
            s$6 = Py.newString("An FTP client class.\012\012    To create a connection, call the class using these argument:\012            host, user, passwd, acct\012    These are all strings, and have default value ''.\012    Then use self.connect() with optional host and port argument.\012\012    To download a file, use ftp.retrlines('RETR ' + filename),\012    or ftp.retrbinary() with slightly different arguments.\012    To upload a file, use ftp.storlines() or ftp.storbinary(),\012    which have an open file as argument (see their definitions\012    below for details).\012    The download/upload functions first issue appropriate TYPE\012    and PORT or PASV commands.\012");
            i$7 = Py.newInteger(0);
            s$8 = Py.newString("");
            s$9 = Py.newString("Connect to host.  Arguments are:\012        - host: hostname to connect to (string, default previous host)\012        - port: port to connect to (integer, default previous port)");
            s$10 = Py.newString("rb");
            s$11 = Py.newString("Get the welcome message from the server.\012        (this is read and squirreled away by connect())");
            s$12 = Py.newString("*welcome*");
            s$13 = Py.newString("Set the debugging level.\012        The required argument level means:\012        0: no debugging output (default)\012        1: print commands and responses but not body text etc.\012        2: also print raw lines read and sent before stripping CR/LF");
            s$14 = Py.newString("Use passive or active mode for data transfers.\012        With a false argument, use the normal PORT mode,\012        With a true argument, use the PASV command.");
            i$15 = Py.newInteger(5);
            s$16 = Py.newString("pass ");
            s$17 = Py.newString("PASS ");
            s$18 = Py.newString("*");
            s$19 = Py.newString("*put*");
            s$20 = Py.newString("*cmd*");
            s$21 = Py.newString("*get*");
            i$22 = Py.newInteger(2);
            i$23 = Py.newInteger(3);
            i$24 = Py.newInteger(4);
            s$25 = Py.newString("-");
            s$26 = Py.newString("\012");
            s$27 = Py.newString("*resp*");
            s$28 = Py.newString("4");
            s$29 = Py.newString("5");
            s$30 = Py.newString("123");
            s$31 = Py.newString("Expect a response beginning with '2'.");
            s$32 = Py.newString("2");
            s$33 = Py.newString("Abort a file transfer.  Uses out-of-band data.\012        This does not follow the procedure from the RFC to send Telnet\012        IP and Synch; that doesn't seem to work with the servers I've\012        tried.  Instead, just send the ABOR command as OOB data.");
            s$34 = Py.newString("ABOR");
            s$35 = Py.newString("*put urgent*");
            s$36 = Py.newString("426");
            s$37 = Py.newString("226");
            s$38 = Py.newString("Send a command and return the response.");
            s$39 = Py.newString("Send a command and expect a response beginning with '2'.");
            s$40 = Py.newString("Send a PORT command with the current host and the given\012        port number.\012        ");
            s$41 = Py.newString(".");
            i$42 = Py.newInteger(256);
            s$43 = Py.newString("PORT ");
            s$44 = Py.newString(",");
            s$45 = Py.newString("Create a new socket and send a PORT command for it.");
            s$46 = Py.newString("Initiate a transfer over the data connection.\012\012        If the transfer is active, send a port command and the\012        transfer command, and accept the connection.  If the server is\012        passive, send a pasv command, connect to it, and start the\012        transfer command.  Either way, return the socket for the\012        connection and the expected size of the transfer.  The\012        expected size may be None if it could not be determined.\012\012        Optional `rest' argument can be a string that is sent as the\012        argument to a RESTART command.  This is essentially a server\012        marker used to tell the server to skip over any data up to the\012        given marker.\012        ");
            s$47 = Py.newString("PASV");
            s$48 = Py.newString("REST %s");
            s$49 = Py.newString("1");
            s$50 = Py.newString("150");
            s$51 = Py.newString("Like nstransfercmd() but returns only the socket.");
            s$52 = Py.newString("Login, default anonymous.");
            s$53 = Py.newString("anonymous");
            s$54 = Py.newString("LOGNAME");
            s$55 = Py.newString("USER");
            s$56 = Py.newString("@");
            s$57 = Py.newString("USER ");
            s$58 = Py.newString("3");
            s$59 = Py.newString("ACCT ");
            s$60 = Py.newString("Retrieve data in binary mode.\012\012        `cmd' is a RETR command.  `callback' is a callback function is\012        called for each block.  No more than `blocksize' number of\012        bytes will be read from the socket.  Optional `rest' is passed\012        to transfercmd().\012\012        A new port is created for you.  Return the response code.\012        ");
            s$61 = Py.newString("TYPE I");
            i$62 = Py.newInteger(8192);
            s$63 = Py.newString("Retrieve data in line mode.\012        The argument is a RETR or LIST command.\012        The callback function (2nd argument) is called for each line,\012        with trailing CRLF stripped.  This creates a new port for you.\012        print_line() is the default callback.");
            s$64 = Py.newString("TYPE A");
            s$65 = Py.newString("*retr*");
            s$66 = Py.newString("Store a file in binary mode.");
            s$67 = Py.newString("Store a file in line mode.");
            s$68 = Py.newString("Send new account name.");
            s$69 = Py.newString("Return a list of files in a given directory (default the current).");
            s$70 = Py.newString("NLST");
            s$71 = Py.newString(" ");
            s$72 = Py.newString("List a directory in long form.\012        By default list current directory to stdout.\012        Optional last argument is callback function; all\012        non-empty arguments before it are concatenated to the\012        LIST command.  (This *should* only be used for a pathname.)");
            s$73 = Py.newString("LIST");
            s$74 = Py.newString("Rename a file.");
            s$75 = Py.newString("RNFR ");
            s$76 = Py.newString("RNTO ");
            s$77 = Py.newString("Delete a file.");
            s$78 = Py.newString("DELE ");
            s$79 = Py.newString("250");
            s$80 = Py.newString("200");
            s$81 = Py.newString("Change to a directory.");
            s$82 = Py.newString("..");
            s$83 = Py.newString("CDUP");
            s$84 = Py.newString("500");
            s$85 = Py.newString("CWD ");
            s$86 = Py.newString("Retrieve the size of a file.");
            s$87 = Py.newString("SIZE ");
            s$88 = Py.newString("213");
            s$89 = Py.newString("Make a directory, return its full pathname.");
            s$90 = Py.newString("MKD ");
            s$91 = Py.newString("Remove a directory.");
            s$92 = Py.newString("RMD ");
            s$93 = Py.newString("Return current working directory.");
            s$94 = Py.newString("PWD");
            s$95 = Py.newString("Quit, and close the connection.");
            s$96 = Py.newString("QUIT");
            s$97 = Py.newString("Close the connection without assuming anything about it.");
            s$98 = Py.newString("Parse the '150' response for a RETR request.\012    Returns the expected transfer size or None; size is not guaranteed to\012    be present in the 150 message.\012    ");
            s$99 = Py.newString("150 .* \\((\\d+) bytes\\)");
            s$100 = Py.newString("Parse the '227' response for a PASV request.\012    Raises error_proto if it does not contain '(h1,h2,h3,h4,p1,p2)'\012    Return ('host.addr.as.numbers', port#) tuple.");
            s$101 = Py.newString("227");
            s$102 = Py.newString("(");
            s$103 = Py.newString(")");
            i$104 = Py.newInteger(6);
            i$105 = Py.newInteger(8);
            s$106 = Py.newString("Parse the '257' response for a MKD or PWD request.\012    This is a response to a MKD or PWD request: a directory name.\012    Returns the directoryname in the 257 reply.");
            s$107 = Py.newString("257");
            s$108 = Py.newString(" \"");
            s$109 = Py.newString("\"");
            s$110 = Py.newString("Default retrlines callback to print a line.");
            s$111 = Py.newString("Copy file from one FTP-instance to another.");
            s$112 = Py.newString("TYPE ");
            s$113 = Py.newString("STOR ");
            s$114 = Py.newString("125");
            s$115 = Py.newString("RETR ");
            s$116 = Py.newString("I");
            s$117 = Py.newString("Class to parse & provide access to 'netrc' format files.\012\012    See the netrc(4) man page for information on the file format.\012\012    WARNING: This class is obsolete -- use module netrc instead.\012\012    ");
            s$118 = Py.newString("HOME");
            s$119 = Py.newString(".netrc");
            s$120 = Py.newString("specify file to load or set $HOME");
            s$121 = Py.newString("r");
            s$122 = Py.newString("default");
            s$123 = Py.newString("machine");
            s$124 = Py.newString("login");
            s$125 = Py.newString("password");
            s$126 = Py.newString("account");
            s$127 = Py.newString("macdef");
            s$128 = Py.newString("Return a list of hosts mentioned in the .netrc file.");
            s$129 = Py.newString("Returns login information for the named host.\012\012        The return value is a triple containing userid,\012        password, and the accounting field.\012\012        ");
            s$130 = Py.newString("Return a list of all defined macro names.");
            s$131 = Py.newString("Return a sequence of lines which define a named macro.");
            s$132 = Py.newString("Test program.\012    Usage: ftp [-d] [-r[file]] host [-l[dir]] [-d[dir]] [-p] [file] ...");
            s$133 = Py.newString("-d");
            s$134 = Py.newString("-r");
            s$135 = Py.newString("Could not open account file -- using anonymous login.");
            s$136 = Py.newString("No account -- using anonymous login.");
            s$137 = Py.newString("-l");
            s$138 = Py.newString("CWD");
            s$139 = Py.newString("-p");
            i$140 = Py.newInteger(1024);
            s$141 = Py.newString("__main__");
            s$142 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py");
            funcTable = new _PyInner();
            c$0_Error = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "Error", false, false, funcTable, 0, null, null, 0, 0);
            c$1_error_reply = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "error_reply", false, false, funcTable, 1, null, null, 0, 0);
            c$2_error_temp = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "error_temp", false, false, funcTable, 2, null, null, 0, 0);
            c$3_error_perm = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "error_perm", false, false, funcTable, 3, null, null, 0, 0);
            c$4_error_proto = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "error_proto", false, false, funcTable, 4, null, null, 0, 0);
            c$5___init__ = Py.newCode(5, new String[] {"self", "host", "user", "passwd", "acct"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "__init__", false, false, funcTable, 5, null, null, 0, 1);
            c$6_connect = Py.newCode(3, new String[] {"self", "host", "port"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "connect", false, false, funcTable, 6, null, null, 0, 1);
            c$7_getwelcome = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "getwelcome", false, false, funcTable, 7, null, null, 0, 1);
            c$8_set_debuglevel = Py.newCode(2, new String[] {"self", "level"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "set_debuglevel", false, false, funcTable, 8, null, null, 0, 1);
            c$9_set_pasv = Py.newCode(2, new String[] {"self", "val"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "set_pasv", false, false, funcTable, 9, null, null, 0, 1);
            c$10_sanitize = Py.newCode(2, new String[] {"self", "s", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "sanitize", false, false, funcTable, 10, null, null, 0, 1);
            c$11_putline = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "putline", false, false, funcTable, 11, null, null, 0, 1);
            c$12_putcmd = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "putcmd", false, false, funcTable, 12, null, null, 0, 1);
            c$13_getline = Py.newCode(1, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "getline", false, false, funcTable, 13, null, null, 0, 1);
            c$14_getmultiline = Py.newCode(1, new String[] {"self", "line", "code", "nextline"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "getmultiline", false, false, funcTable, 14, null, null, 0, 1);
            c$15_getresp = Py.newCode(1, new String[] {"self", "resp", "c"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "getresp", false, false, funcTable, 15, null, null, 0, 1);
            c$16_voidresp = Py.newCode(1, new String[] {"self", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "voidresp", false, false, funcTable, 16, null, null, 0, 1);
            c$17_abort = Py.newCode(1, new String[] {"self", "line", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "abort", false, false, funcTable, 17, null, null, 0, 1);
            c$18_sendcmd = Py.newCode(2, new String[] {"self", "cmd"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "sendcmd", false, false, funcTable, 18, null, null, 0, 1);
            c$19_voidcmd = Py.newCode(2, new String[] {"self", "cmd"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "voidcmd", false, false, funcTable, 19, null, null, 0, 1);
            c$20_sendport = Py.newCode(3, new String[] {"self", "host", "port", "bytes", "pbytes", "cmd", "hbytes"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "sendport", false, false, funcTable, 20, null, null, 0, 1);
            c$21_makeport = Py.newCode(1, new String[] {"self", "port", "dummyport", "sock", "host", "dummyhost", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "makeport", false, false, funcTable, 21, null, null, 0, 1);
            c$22_ntransfercmd = Py.newCode(3, new String[] {"self", "cmd", "rest", "sock", "port", "conn", "sockaddr", "resp", "host", "size"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "ntransfercmd", false, false, funcTable, 22, null, null, 0, 1);
            c$23_transfercmd = Py.newCode(3, new String[] {"self", "cmd", "rest"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "transfercmd", false, false, funcTable, 23, null, null, 0, 1);
            c$24_login = Py.newCode(4, new String[] {"self", "user", "passwd", "acct", "realuser", "resp", "thishost"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "login", false, false, funcTable, 24, null, null, 0, 1);
            c$25_retrbinary = Py.newCode(5, new String[] {"self", "cmd", "callback", "blocksize", "rest", "conn", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "retrbinary", false, false, funcTable, 25, null, null, 0, 1);
            c$26_retrlines = Py.newCode(3, new String[] {"self", "cmd", "callback", "conn", "resp", "fp", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "retrlines", false, false, funcTable, 26, null, null, 0, 1);
            c$27_storbinary = Py.newCode(4, new String[] {"self", "cmd", "fp", "blocksize", "buf", "conn"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "storbinary", false, false, funcTable, 27, null, null, 0, 1);
            c$28_storlines = Py.newCode(3, new String[] {"self", "cmd", "fp", "buf", "conn"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "storlines", false, false, funcTable, 28, null, null, 0, 1);
            c$29_acct = Py.newCode(2, new String[] {"self", "password", "cmd"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "acct", false, false, funcTable, 29, null, null, 0, 1);
            c$30_nlst = Py.newCode(2, new String[] {"self", "args", "arg", "files", "cmd"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "nlst", true, false, funcTable, 30, null, null, 0, 1);
            c$31_dir = Py.newCode(2, new String[] {"self", "args", "arg", "func", "cmd"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "dir", true, false, funcTable, 31, null, null, 0, 1);
            c$32_rename = Py.newCode(3, new String[] {"self", "fromname", "toname", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "rename", false, false, funcTable, 32, null, null, 0, 1);
            c$33_delete = Py.newCode(2, new String[] {"self", "filename", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "delete", false, false, funcTable, 33, null, null, 0, 1);
            c$34_cwd = Py.newCode(2, new String[] {"self", "dirname", "cmd", "msg"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "cwd", false, false, funcTable, 34, null, null, 0, 1);
            c$35_size = Py.newCode(2, new String[] {"self", "filename", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "size", false, false, funcTable, 35, null, null, 0, 1);
            c$36_mkd = Py.newCode(2, new String[] {"self", "dirname", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "mkd", false, false, funcTable, 36, null, null, 0, 1);
            c$37_rmd = Py.newCode(2, new String[] {"self", "dirname"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "rmd", false, false, funcTable, 37, null, null, 0, 1);
            c$38_pwd = Py.newCode(1, new String[] {"self", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "pwd", false, false, funcTable, 38, null, null, 0, 1);
            c$39_quit = Py.newCode(1, new String[] {"self", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "quit", false, false, funcTable, 39, null, null, 0, 1);
            c$40_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "close", false, false, funcTable, 40, null, null, 0, 1);
            c$41_FTP = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "FTP", false, false, funcTable, 41, null, null, 0, 0);
            c$42_parse150 = Py.newCode(1, new String[] {"resp", "m", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "parse150", false, false, funcTable, 42, null, null, 0, 1);
            c$43_parse227 = Py.newCode(1, new String[] {"resp", "port", "left", "right", "host", "numbers"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "parse227", false, false, funcTable, 43, null, null, 0, 1);
            c$44_parse257 = Py.newCode(1, new String[] {"resp", "i", "dirname", "c", "n"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "parse257", false, false, funcTable, 44, null, null, 0, 1);
            c$45_print_line = Py.newCode(1, new String[] {"line"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "print_line", false, false, funcTable, 45, null, null, 0, 1);
            c$46_ftpcp = Py.newCode(5, new String[] {"source", "sourcename", "target", "targetname", "type", "sreply", "sourcehost", "treply", "sourceport"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "ftpcp", false, false, funcTable, 46, null, null, 0, 1);
            c$47___init__ = Py.newCode(2, new String[] {"self", "filename", "macro_lines", "fp", "in_macro", "w2", "acct", "w1", "line", "ouser", "opasswd", "macro_name", "host", "words", "passwd", "i", "default", "oacct", "user"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "__init__", false, false, funcTable, 47, null, null, 0, 1);
            c$48_get_hosts = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "get_hosts", false, false, funcTable, 48, null, null, 0, 1);
            c$49_get_account = Py.newCode(2, new String[] {"self", "host", "passwd", "user", "acct"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "get_account", false, false, funcTable, 49, null, null, 0, 1);
            c$50_get_macros = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "get_macros", false, false, funcTable, 50, null, null, 0, 1);
            c$51_get_macro = Py.newCode(2, new String[] {"self", "macro"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "get_macro", false, false, funcTable, 51, null, null, 0, 1);
            c$52_Netrc = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "Netrc", false, false, funcTable, 52, null, null, 0, 0);
            c$53_test = Py.newCode(0, new String[] {"passwd", "cmd", "file", "resp", "netrc", "debugging", "userid", "rcfile", "acct", "ftp", "host"}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "test", false, false, funcTable, 53, null, null, 0, 1);
            c$54_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\ftplib.py", "main", false, false, funcTable, 54, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$54_main == null) _PyInner.initConstants();
            return c$54_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.Error$1(frame);
                case 1:
                return _PyInner.error_reply$2(frame);
                case 2:
                return _PyInner.error_temp$3(frame);
                case 3:
                return _PyInner.error_perm$4(frame);
                case 4:
                return _PyInner.error_proto$5(frame);
                case 5:
                return _PyInner.__init__$6(frame);
                case 6:
                return _PyInner.connect$7(frame);
                case 7:
                return _PyInner.getwelcome$8(frame);
                case 8:
                return _PyInner.set_debuglevel$9(frame);
                case 9:
                return _PyInner.set_pasv$10(frame);
                case 10:
                return _PyInner.sanitize$11(frame);
                case 11:
                return _PyInner.putline$12(frame);
                case 12:
                return _PyInner.putcmd$13(frame);
                case 13:
                return _PyInner.getline$14(frame);
                case 14:
                return _PyInner.getmultiline$15(frame);
                case 15:
                return _PyInner.getresp$16(frame);
                case 16:
                return _PyInner.voidresp$17(frame);
                case 17:
                return _PyInner.abort$18(frame);
                case 18:
                return _PyInner.sendcmd$19(frame);
                case 19:
                return _PyInner.voidcmd$20(frame);
                case 20:
                return _PyInner.sendport$21(frame);
                case 21:
                return _PyInner.makeport$22(frame);
                case 22:
                return _PyInner.ntransfercmd$23(frame);
                case 23:
                return _PyInner.transfercmd$24(frame);
                case 24:
                return _PyInner.login$25(frame);
                case 25:
                return _PyInner.retrbinary$26(frame);
                case 26:
                return _PyInner.retrlines$27(frame);
                case 27:
                return _PyInner.storbinary$28(frame);
                case 28:
                return _PyInner.storlines$29(frame);
                case 29:
                return _PyInner.acct$30(frame);
                case 30:
                return _PyInner.nlst$31(frame);
                case 31:
                return _PyInner.dir$32(frame);
                case 32:
                return _PyInner.rename$33(frame);
                case 33:
                return _PyInner.delete$34(frame);
                case 34:
                return _PyInner.cwd$35(frame);
                case 35:
                return _PyInner.size$36(frame);
                case 36:
                return _PyInner.mkd$37(frame);
                case 37:
                return _PyInner.rmd$38(frame);
                case 38:
                return _PyInner.pwd$39(frame);
                case 39:
                return _PyInner.quit$40(frame);
                case 40:
                return _PyInner.close$41(frame);
                case 41:
                return _PyInner.FTP$42(frame);
                case 42:
                return _PyInner.parse150$43(frame);
                case 43:
                return _PyInner.parse227$44(frame);
                case 44:
                return _PyInner.parse257$45(frame);
                case 45:
                return _PyInner.print_line$46(frame);
                case 46:
                return _PyInner.ftpcp$47(frame);
                case 47:
                return _PyInner.__init__$48(frame);
                case 48:
                return _PyInner.get_hosts$49(frame);
                case 49:
                return _PyInner.get_account$50(frame);
                case 50:
                return _PyInner.get_macros$51(frame);
                case 51:
                return _PyInner.get_macro$52(frame);
                case 52:
                return _PyInner.Netrc$53(frame);
                case 53:
                return _PyInner.test$54(frame);
                case 54:
                return _PyInner.main$55(frame);
                default:
                return null;
            }
        }
        
        private static PyObject Error$1(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject error_reply$2(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject error_temp$3(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject error_perm$4(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject error_proto$5(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject __init__$6(PyFrame frame) {
            if (frame.getlocal(1).__nonzero__()) {
                frame.getlocal(0).invoke("connect", frame.getlocal(1));
                if (frame.getlocal(2).__nonzero__()) {
                    frame.getlocal(0).invoke("login", new PyObject[] {frame.getlocal(2), frame.getlocal(3), frame.getlocal(4)});
                }
            }
            return Py.None;
        }
        
        private static PyObject connect$7(PyFrame frame) {
            /* Connect to host.  Arguments are:
                    - host: hostname to connect to (string, default previous host)
                    - port: port to connect to (integer, default previous port) */
            if (frame.getlocal(1).__nonzero__()) {
                frame.getlocal(0).__setattr__("host", frame.getlocal(1));
            }
            if (frame.getlocal(2).__nonzero__()) {
                frame.getlocal(0).__setattr__("port", frame.getlocal(2));
            }
            frame.getlocal(0).__setattr__("sock", frame.getglobal("socket").invoke("socket", frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
            frame.getlocal(0).__getattr__("sock").invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port")}));
            frame.getlocal(0).__setattr__("file", frame.getlocal(0).__getattr__("sock").invoke("makefile", s$10));
            frame.getlocal(0).__setattr__("welcome", frame.getlocal(0).invoke("getresp"));
            return frame.getlocal(0).__getattr__("welcome");
        }
        
        private static PyObject getwelcome$8(PyFrame frame) {
            /* Get the welcome message from the server.
                    (this is read and squirreled away by connect()) */
            if (frame.getlocal(0).__getattr__("debugging").__nonzero__()) {
                Py.printComma(s$12);
                Py.println(frame.getlocal(0).invoke("sanitize", frame.getlocal(0).__getattr__("welcome")));
            }
            return frame.getlocal(0).__getattr__("welcome");
        }
        
        private static PyObject set_debuglevel$9(PyFrame frame) {
            /* Set the debugging level.
                    The required argument level means:
                    0: no debugging output (default)
                    1: print commands and responses but not body text etc.
                    2: also print raw lines read and sent before stripping CR/LF */
            frame.getlocal(0).__setattr__("debugging", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject set_pasv$10(PyFrame frame) {
            /* Use passive or active mode for data transfers.
                    With a false argument, use the normal PORT mode,
                    With a true argument, use the PASV command. */
            frame.getlocal(0).__setattr__("passiveserver", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject sanitize$11(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            if (((t$0$PyObject = frame.getlocal(1).__getslice__(null, i$15, null)._eq(s$16)).__nonzero__() ? t$0$PyObject : frame.getlocal(1).__getslice__(null, i$15, null)._eq(s$17)).__nonzero__()) {
                frame.setlocal(2, frame.getglobal("len").__call__(frame.getlocal(1)));
                while (((t$0$PyObject = frame.getlocal(2)._gt(i$15)).__nonzero__() ? frame.getlocal(1).__getitem__(frame.getlocal(2)._sub(i$3))._in(s$5) : t$0$PyObject).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(2)._sub(i$3));
                }
                frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$15, null)._add(s$18._mul(frame.getlocal(2)._sub(i$15)))._add(frame.getlocal(1).__getslice__(frame.getlocal(2), null, null)));
            }
            return frame.getlocal(1).__repr__();
        }
        
        private static PyObject putline$12(PyFrame frame) {
            frame.setlocal(1, frame.getlocal(1)._add(frame.getglobal("CRLF")));
            if (frame.getlocal(0).__getattr__("debugging")._gt(i$3).__nonzero__()) {
                Py.printComma(s$19);
                Py.println(frame.getlocal(0).invoke("sanitize", frame.getlocal(1)));
            }
            frame.getlocal(0).__getattr__("sock").invoke("send", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject putcmd$13(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("debugging").__nonzero__()) {
                Py.printComma(s$20);
                Py.println(frame.getlocal(0).invoke("sanitize", frame.getlocal(1)));
            }
            frame.getlocal(0).invoke("putline", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject getline$14(PyFrame frame) {
            frame.setlocal(1, frame.getlocal(0).__getattr__("file").invoke("readline"));
            if (frame.getlocal(0).__getattr__("debugging")._gt(i$3).__nonzero__()) {
                Py.printComma(s$21);
                Py.println(frame.getlocal(0).invoke("sanitize", frame.getlocal(1)));
            }
            if (frame.getlocal(1).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("EOFError"));
            }
            if (frame.getlocal(1).__getslice__(i$22.__neg__(), null, null)._eq(frame.getglobal("CRLF")).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$22.__neg__(), null));
            }
            else if (frame.getlocal(1).__getslice__(i$3.__neg__(), null, null)._in(frame.getglobal("CRLF")).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$3.__neg__(), null));
            }
            return frame.getlocal(1);
        }
        
        private static PyObject getmultiline$15(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            frame.setlocal(1, frame.getlocal(0).invoke("getline"));
            if (frame.getlocal(1).__getslice__(i$23, i$24, null)._eq(s$25).__nonzero__()) {
                frame.setlocal(2, frame.getlocal(1).__getslice__(null, i$23, null));
                while (i$3.__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(0).invoke("getline"));
                    frame.setlocal(1, frame.getlocal(1)._add(s$26._add(frame.getlocal(3))));
                    if (((t$0$PyObject = frame.getlocal(3).__getslice__(null, i$23, null)._eq(frame.getlocal(2))).__nonzero__() ? frame.getlocal(3).__getslice__(i$23, i$24, null)._ne(s$25) : t$0$PyObject).__nonzero__()) {
                        break;
                    }
                }
            }
            return frame.getlocal(1);
        }
        
        private static PyObject getresp$16(PyFrame frame) {
            frame.setlocal(1, frame.getlocal(0).invoke("getmultiline"));
            if (frame.getlocal(0).__getattr__("debugging").__nonzero__()) {
                Py.printComma(s$27);
                Py.println(frame.getlocal(0).invoke("sanitize", frame.getlocal(1)));
            }
            frame.getlocal(0).__setattr__("lastresp", frame.getlocal(1).__getslice__(null, i$23, null));
            frame.setlocal(2, frame.getlocal(1).__getslice__(null, i$3, null));
            if (frame.getlocal(2)._eq(s$28).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_temp"), frame.getlocal(1));
            }
            if (frame.getlocal(2)._eq(s$29).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_perm"), frame.getlocal(1));
            }
            if (frame.getlocal(2)._notin(s$30).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"), frame.getlocal(1));
            }
            return frame.getlocal(1);
        }
        
        private static PyObject voidresp$17(PyFrame frame) {
            /* Expect a response beginning with '2'. */
            frame.setlocal(1, frame.getlocal(0).invoke("getresp"));
            if (frame.getlocal(1).__getitem__(i$7)._ne(s$32).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(1));
            }
            return frame.getlocal(1);
        }
        
        private static PyObject abort$18(PyFrame frame) {
            /* Abort a file transfer.  Uses out-of-band data.
                    This does not follow the procedure from the RFC to send Telnet
                    IP and Synch; that doesn't seem to work with the servers I've
                    tried.  Instead, just send the ABOR command as OOB data. */
            frame.setlocal(1, s$34._add(frame.getglobal("CRLF")));
            if (frame.getlocal(0).__getattr__("debugging")._gt(i$3).__nonzero__()) {
                Py.printComma(s$35);
                Py.println(frame.getlocal(0).invoke("sanitize", frame.getlocal(1)));
            }
            frame.getlocal(0).__getattr__("sock").invoke("send", frame.getlocal(1), frame.getglobal("MSG_OOB"));
            frame.setlocal(2, frame.getlocal(0).invoke("getmultiline"));
            if (frame.getlocal(2).__getslice__(null, i$23, null)._notin(new PyTuple(new PyObject[] {s$36, s$37})).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"), frame.getlocal(2));
            }
            return Py.None;
        }
        
        private static PyObject sendcmd$19(PyFrame frame) {
            /* Send a command and return the response. */
            frame.getlocal(0).invoke("putcmd", frame.getlocal(1));
            return frame.getlocal(0).invoke("getresp");
        }
        
        private static PyObject voidcmd$20(PyFrame frame) {
            /* Send a command and expect a response beginning with '2'. */
            frame.getlocal(0).invoke("putcmd", frame.getlocal(1));
            return frame.getlocal(0).invoke("voidresp");
        }
        
        private static PyObject sendport$21(PyFrame frame) {
            /* Send a PORT command with the current host and the given
                    port number.
                     */
            frame.setlocal(6, frame.getlocal(1).invoke("split", s$41));
            frame.setlocal(4, new PyList(new PyObject[] {frame.getlocal(2)._div(i$42).__repr__(), frame.getlocal(2)._mod(i$42).__repr__()}));
            frame.setlocal(3, frame.getlocal(6)._add(frame.getlocal(4)));
            frame.setlocal(5, s$43._add(s$44.invoke("join", frame.getlocal(3))));
            return frame.getlocal(0).invoke("voidcmd", frame.getlocal(5));
        }
        
        private static PyObject makeport$22(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Create a new socket and send a PORT command for it. */
            frame.setlocal(3, frame.getglobal("socket").invoke("socket", frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
            frame.getlocal(3).invoke("bind", new PyTuple(new PyObject[] {s$8, i$7}));
            frame.getlocal(3).invoke("listen", i$3);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(3).invoke("getsockname"), 2);
            frame.setlocal(5, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("sock").invoke("getsockname"), 2);
            frame.setlocal(4, t$0$PyObject__[0]);
            frame.setlocal(2, t$0$PyObject__[1]);
            frame.setlocal(6, frame.getlocal(0).invoke("sendport", frame.getlocal(4), frame.getlocal(1)));
            return frame.getlocal(3);
        }
        
        private static PyObject ntransfercmd$23(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Initiate a transfer over the data connection.
            
                    If the transfer is active, send a port command and the
                    transfer command, and accept the connection.  If the server is
                    passive, send a pasv command, connect to it, and start the
                    transfer command.  Either way, return the socket for the
                    connection and the expected size of the transfer.  The
                    expected size may be None if it could not be determined.
            
                    Optional `rest' argument can be a string that is sent as the
                    argument to a RESTART command.  This is essentially a server
                    marker used to tell the server to skip over any data up to the
                    given marker.
                     */
            frame.setlocal(9, frame.getglobal("None"));
            if (frame.getlocal(0).__getattr__("passiveserver").__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("parse227").__call__(frame.getlocal(0).invoke("sendcmd", s$47)), 2);
                frame.setlocal(8, t$0$PyObject__[0]);
                frame.setlocal(4, t$0$PyObject__[1]);
                frame.setlocal(5, frame.getglobal("socket").invoke("socket", frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
                frame.getlocal(5).invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(8), frame.getlocal(4)}));
                if (frame.getlocal(2)._isnot(frame.getglobal("None")).__nonzero__()) {
                    frame.getlocal(0).invoke("sendcmd", s$48._mod(frame.getlocal(2)));
                }
                frame.setlocal(7, frame.getlocal(0).invoke("sendcmd", frame.getlocal(1)));
                if (frame.getlocal(7).__getitem__(i$7)._ne(s$49).__nonzero__()) {
                    throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(7));
                }
            }
            else {
                frame.setlocal(3, frame.getlocal(0).invoke("makeport"));
                if (frame.getlocal(2)._isnot(frame.getglobal("None")).__nonzero__()) {
                    frame.getlocal(0).invoke("sendcmd", s$48._mod(frame.getlocal(2)));
                }
                frame.setlocal(7, frame.getlocal(0).invoke("sendcmd", frame.getlocal(1)));
                if (frame.getlocal(7).__getitem__(i$7)._ne(s$49).__nonzero__()) {
                    throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(7));
                }
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(3).invoke("accept"), 2);
                frame.setlocal(5, t$0$PyObject__[0]);
                frame.setlocal(6, t$0$PyObject__[1]);
            }
            if (frame.getlocal(7).__getslice__(null, i$23, null)._eq(s$50).__nonzero__()) {
                frame.setlocal(9, frame.getglobal("parse150").__call__(frame.getlocal(7)));
            }
            return new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(9)});
        }
        
        private static PyObject transfercmd$24(PyFrame frame) {
            /* Like nstransfercmd() but returns only the socket. */
            return frame.getlocal(0).invoke("ntransfercmd", frame.getlocal(1), frame.getlocal(2)).__getitem__(i$7);
        }
        
        private static PyObject login$25(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Login, default anonymous. */
            if (frame.getlocal(1).__not__().__nonzero__()) {
                frame.setlocal(1, s$53);
            }
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(2, s$8);
            }
            if (frame.getlocal(3).__not__().__nonzero__()) {
                frame.setlocal(3, s$8);
            }
            if (((t$0$PyObject = frame.getlocal(1)._eq(s$53)).__nonzero__() ? frame.getlocal(2)._in(new PyTuple(new PyObject[] {s$8, s$25})) : t$0$PyObject).__nonzero__()) {
                frame.setlocal(6, frame.getglobal("socket").invoke("getfqdn"));
                try {
                    if (frame.getglobal("os").__getattr__("environ").__getattr__("has_key").__call__(s$54).__nonzero__()) {
                        frame.setlocal(4, frame.getglobal("os").__getattr__("environ").__getitem__(s$54));
                    }
                    else if (frame.getglobal("os").__getattr__("environ").__getattr__("has_key").__call__(s$55).__nonzero__()) {
                        frame.setlocal(4, frame.getglobal("os").__getattr__("environ").__getitem__(s$55));
                    }
                    else {
                        frame.setlocal(4, s$53);
                    }
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("AttributeError"))) {
                        frame.setlocal(4, s$53);
                    }
                    else throw t$0$PyException;
                }
                frame.setlocal(2, frame.getlocal(2)._add(frame.getlocal(4))._add(s$56)._add(frame.getlocal(6)));
            }
            frame.setlocal(5, frame.getlocal(0).invoke("sendcmd", s$57._add(frame.getlocal(1))));
            if (frame.getlocal(5).__getitem__(i$7)._eq(s$58).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(0).invoke("sendcmd", s$17._add(frame.getlocal(2))));
            }
            if (frame.getlocal(5).__getitem__(i$7)._eq(s$58).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(0).invoke("sendcmd", s$59._add(frame.getlocal(3))));
            }
            if (frame.getlocal(5).__getitem__(i$7)._ne(s$32).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(5));
            }
            return frame.getlocal(5);
        }
        
        private static PyObject retrbinary$26(PyFrame frame) {
            /* Retrieve data in binary mode.
            
                    `cmd' is a RETR command.  `callback' is a callback function is
                    called for each block.  No more than `blocksize' number of
                    bytes will be read from the socket.  Optional `rest' is passed
                    to transfercmd().
            
                    A new port is created for you.  Return the response code.
                     */
            frame.getlocal(0).invoke("voidcmd", s$61);
            frame.setlocal(5, frame.getlocal(0).invoke("transfercmd", frame.getlocal(1), frame.getlocal(4)));
            while (i$3.__nonzero__()) {
                frame.setlocal(6, frame.getlocal(5).invoke("recv", frame.getlocal(3)));
                if (frame.getlocal(6).__not__().__nonzero__()) {
                    break;
                }
                frame.getlocal(2).__call__(frame.getlocal(6));
            }
            frame.getlocal(5).invoke("close");
            return frame.getlocal(0).invoke("voidresp");
        }
        
        private static PyObject retrlines$27(PyFrame frame) {
            /* Retrieve data in line mode.
                    The argument is a RETR or LIST command.
                    The callback function (2nd argument) is called for each line,
                    with trailing CRLF stripped.  This creates a new port for you.
                    print_line() is the default callback. */
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(2, frame.getglobal("print_line"));
            }
            frame.setlocal(4, frame.getlocal(0).invoke("sendcmd", s$64));
            frame.setlocal(3, frame.getlocal(0).invoke("transfercmd", frame.getlocal(1)));
            frame.setlocal(5, frame.getlocal(3).invoke("makefile", s$10));
            while (i$3.__nonzero__()) {
                frame.setlocal(6, frame.getlocal(5).invoke("readline"));
                if (frame.getlocal(0).__getattr__("debugging")._gt(i$22).__nonzero__()) {
                    Py.printComma(s$65);
                    Py.println(frame.getlocal(6).__repr__());
                }
                if (frame.getlocal(6).__not__().__nonzero__()) {
                    break;
                }
                if (frame.getlocal(6).__getslice__(i$22.__neg__(), null, null)._eq(frame.getglobal("CRLF")).__nonzero__()) {
                    frame.setlocal(6, frame.getlocal(6).__getslice__(null, i$22.__neg__(), null));
                }
                else if (frame.getlocal(6).__getslice__(i$3.__neg__(), null, null)._eq(s$26).__nonzero__()) {
                    frame.setlocal(6, frame.getlocal(6).__getslice__(null, i$3.__neg__(), null));
                }
                frame.getlocal(2).__call__(frame.getlocal(6));
            }
            frame.getlocal(5).invoke("close");
            frame.getlocal(3).invoke("close");
            return frame.getlocal(0).invoke("voidresp");
        }
        
        private static PyObject storbinary$28(PyFrame frame) {
            /* Store a file in binary mode. */
            frame.getlocal(0).invoke("voidcmd", s$61);
            frame.setlocal(5, frame.getlocal(0).invoke("transfercmd", frame.getlocal(1)));
            while (i$3.__nonzero__()) {
                frame.setlocal(4, frame.getlocal(2).invoke("read", frame.getlocal(3)));
                if (frame.getlocal(4).__not__().__nonzero__()) {
                    break;
                }
                frame.getlocal(5).invoke("send", frame.getlocal(4));
            }
            frame.getlocal(5).invoke("close");
            return frame.getlocal(0).invoke("voidresp");
        }
        
        private static PyObject storlines$29(PyFrame frame) {
            /* Store a file in line mode. */
            frame.getlocal(0).invoke("voidcmd", s$64);
            frame.setlocal(4, frame.getlocal(0).invoke("transfercmd", frame.getlocal(1)));
            while (i$3.__nonzero__()) {
                frame.setlocal(3, frame.getlocal(2).invoke("readline"));
                if (frame.getlocal(3).__not__().__nonzero__()) {
                    break;
                }
                if (frame.getlocal(3).__getslice__(i$22.__neg__(), null, null)._ne(frame.getglobal("CRLF")).__nonzero__()) {
                    if (frame.getlocal(3).__getitem__(i$3.__neg__())._in(frame.getglobal("CRLF")).__nonzero__()) {
                        frame.setlocal(3, frame.getlocal(3).__getslice__(null, i$3.__neg__(), null));
                    }
                    frame.setlocal(3, frame.getlocal(3)._add(frame.getglobal("CRLF")));
                }
                frame.getlocal(4).invoke("send", frame.getlocal(3));
            }
            frame.getlocal(4).invoke("close");
            return frame.getlocal(0).invoke("voidresp");
        }
        
        private static PyObject acct$30(PyFrame frame) {
            /* Send new account name. */
            frame.setlocal(2, s$59._add(frame.getlocal(1)));
            return frame.getlocal(0).invoke("voidcmd", frame.getlocal(2));
        }
        
        private static PyObject nlst$31(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Return a list of files in a given directory (default the current). */
            frame.setlocal(4, s$70);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.setlocal(4, frame.getlocal(4)._add(s$71._add(frame.getlocal(2))));
            }
            frame.setlocal(3, new PyList(new PyObject[] {}));
            frame.getlocal(0).invoke("retrlines", frame.getlocal(4), frame.getlocal(3).__getattr__("append"));
            return frame.getlocal(3);
        }
        
        private static PyObject dir$32(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* List a directory in long form.
                    By default list current directory to stdout.
                    Optional last argument is callback function; all
                    non-empty arguments before it are concatenated to the
                    LIST command.  (This *should* only be used for a pathname.) */
            frame.setlocal(4, s$73);
            frame.setlocal(3, frame.getglobal("None"));
            if (((t$0$PyObject = frame.getlocal(1).__getslice__(i$3.__neg__(), null, null)).__nonzero__() ? frame.getglobal("type").__call__(frame.getlocal(1).__getitem__(i$3.__neg__()))._ne(frame.getglobal("type").__call__(s$8)) : t$0$PyObject).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(null, i$3.__neg__(), null), frame.getlocal(1).__getitem__(i$3.__neg__())}), 2);
                frame.setlocal(1, t$0$PyObject__[0]);
                frame.setlocal(3, t$0$PyObject__[1]);
            }
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2).__nonzero__()) {
                    frame.setlocal(4, frame.getlocal(4)._add(s$71._add(frame.getlocal(2))));
                }
            }
            frame.getlocal(0).invoke("retrlines", frame.getlocal(4), frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject rename$33(PyFrame frame) {
            /* Rename a file. */
            frame.setlocal(3, frame.getlocal(0).invoke("sendcmd", s$75._add(frame.getlocal(1))));
            if (frame.getlocal(3).__getitem__(i$7)._ne(s$58).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(3));
            }
            return frame.getlocal(0).invoke("voidcmd", s$76._add(frame.getlocal(2)));
        }
        
        private static PyObject delete$34(PyFrame frame) {
            /* Delete a file. */
            frame.setlocal(2, frame.getlocal(0).invoke("sendcmd", s$78._add(frame.getlocal(1))));
            if (frame.getlocal(2).__getslice__(null, i$23, null)._in(new PyTuple(new PyObject[] {s$79, s$80})).__nonzero__()) {
                return frame.getlocal(2);
            }
            else if (frame.getlocal(2).__getslice__(null, i$3, null)._eq(s$29).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_perm"), frame.getlocal(2));
            }
            else {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(2));
            }
        }
        
        private static PyObject cwd$35(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Change to a directory. */
            if (frame.getlocal(1)._eq(s$82).__nonzero__()) {
                try {
                    return frame.getlocal(0).invoke("voidcmd", s$83);
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("error_perm"))) {
                        frame.setlocal(3, t$0$PyException.value);
                        if (frame.getlocal(3).__getslice__(null, i$23, null)._ne(s$84).__nonzero__()) {
                            throw Py.makeException(frame.getglobal("error_perm"), frame.getlocal(3));
                        }
                    }
                    else throw t$0$PyException;
                }
            }
            else if (frame.getlocal(1)._eq(s$8).__nonzero__()) {
                frame.setlocal(1, s$41);
            }
            frame.setlocal(2, s$85._add(frame.getlocal(1)));
            return frame.getlocal(0).invoke("voidcmd", frame.getlocal(2));
        }
        
        private static PyObject size$36(PyFrame frame) {
            /* Retrieve the size of a file. */
            frame.setlocal(2, frame.getlocal(0).invoke("sendcmd", s$87._add(frame.getlocal(1))));
            if (frame.getlocal(2).__getslice__(null, i$23, null)._eq(s$88).__nonzero__()) {
                return frame.getglobal("int").__call__(frame.getlocal(2).__getslice__(i$23, null, null).invoke("strip"));
            }
            return Py.None;
        }
        
        private static PyObject mkd$37(PyFrame frame) {
            /* Make a directory, return its full pathname. */
            frame.setlocal(2, frame.getlocal(0).invoke("sendcmd", s$90._add(frame.getlocal(1))));
            return frame.getglobal("parse257").__call__(frame.getlocal(2));
        }
        
        private static PyObject rmd$38(PyFrame frame) {
            /* Remove a directory. */
            return frame.getlocal(0).invoke("voidcmd", s$92._add(frame.getlocal(1)));
        }
        
        private static PyObject pwd$39(PyFrame frame) {
            /* Return current working directory. */
            frame.setlocal(1, frame.getlocal(0).invoke("sendcmd", s$94));
            return frame.getglobal("parse257").__call__(frame.getlocal(1));
        }
        
        private static PyObject quit$40(PyFrame frame) {
            /* Quit, and close the connection. */
            frame.setlocal(1, frame.getlocal(0).invoke("voidcmd", s$96));
            frame.getlocal(0).invoke("close");
            return frame.getlocal(1);
        }
        
        private static PyObject close$41(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Close the connection without assuming anything about it. */
            if (frame.getlocal(0).__getattr__("file").__nonzero__()) {
                frame.getlocal(0).__getattr__("file").invoke("close");
                frame.getlocal(0).__getattr__("sock").invoke("close");
                t$0$PyObject = frame.getglobal("None");
                frame.getlocal(0).__setattr__("file", t$0$PyObject);
                frame.getlocal(0).__setattr__("sock", t$0$PyObject);
            }
            return Py.None;
        }
        
        private static PyObject FTP$42(PyFrame frame) {
            /* An FTP client class.
            
                To create a connection, call the class using these argument:
                        host, user, passwd, acct
                These are all strings, and have default value ''.
                Then use self.connect() with optional host and port argument.
            
                To download a file, use ftp.retrlines('RETR ' + filename),
                or ftp.retrbinary() with slightly different arguments.
                To upload a file, use ftp.storlines() or ftp.storbinary(),
                which have an open file as argument (see their definitions
                below for details).
                The download/upload functions first issue appropriate TYPE
                and PORT or PASV commands.
             */
            frame.setlocal("debugging", i$7);
            frame.setlocal("host", s$8);
            frame.setlocal("port", frame.getname("FTP_PORT"));
            frame.setlocal("sock", frame.getname("None"));
            frame.setlocal("file", frame.getname("None"));
            frame.setlocal("welcome", frame.getname("None"));
            frame.setlocal("passiveserver", i$3);
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$8, s$8, s$8, s$8}, c$5___init__));
            frame.setlocal("connect", new PyFunction(frame.f_globals, new PyObject[] {s$8, i$7}, c$6_connect));
            frame.setlocal("getwelcome", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_getwelcome));
            frame.setlocal("set_debuglevel", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_set_debuglevel));
            frame.setlocal("debug", frame.getname("set_debuglevel"));
            frame.setlocal("set_pasv", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_set_pasv));
            frame.setlocal("sanitize", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_sanitize));
            frame.setlocal("putline", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_putline));
            frame.setlocal("putcmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_putcmd));
            frame.setlocal("getline", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_getline));
            frame.setlocal("getmultiline", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_getmultiline));
            frame.setlocal("getresp", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_getresp));
            frame.setlocal("voidresp", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_voidresp));
            frame.setlocal("abort", new PyFunction(frame.f_globals, new PyObject[] {}, c$17_abort));
            frame.setlocal("sendcmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_sendcmd));
            frame.setlocal("voidcmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_voidcmd));
            frame.setlocal("sendport", new PyFunction(frame.f_globals, new PyObject[] {}, c$20_sendport));
            frame.setlocal("makeport", new PyFunction(frame.f_globals, new PyObject[] {}, c$21_makeport));
            frame.setlocal("ntransfercmd", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$22_ntransfercmd));
            frame.setlocal("transfercmd", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$23_transfercmd));
            frame.setlocal("login", new PyFunction(frame.f_globals, new PyObject[] {s$8, s$8, s$8}, c$24_login));
            frame.setlocal("retrbinary", new PyFunction(frame.f_globals, new PyObject[] {i$62, frame.getname("None")}, c$25_retrbinary));
            frame.setlocal("retrlines", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$26_retrlines));
            frame.setlocal("storbinary", new PyFunction(frame.f_globals, new PyObject[] {i$62}, c$27_storbinary));
            frame.setlocal("storlines", new PyFunction(frame.f_globals, new PyObject[] {}, c$28_storlines));
            frame.setlocal("acct", new PyFunction(frame.f_globals, new PyObject[] {}, c$29_acct));
            frame.setlocal("nlst", new PyFunction(frame.f_globals, new PyObject[] {}, c$30_nlst));
            frame.setlocal("dir", new PyFunction(frame.f_globals, new PyObject[] {}, c$31_dir));
            frame.setlocal("rename", new PyFunction(frame.f_globals, new PyObject[] {}, c$32_rename));
            frame.setlocal("delete", new PyFunction(frame.f_globals, new PyObject[] {}, c$33_delete));
            frame.setlocal("cwd", new PyFunction(frame.f_globals, new PyObject[] {}, c$34_cwd));
            frame.setlocal("size", new PyFunction(frame.f_globals, new PyObject[] {}, c$35_size));
            frame.setlocal("mkd", new PyFunction(frame.f_globals, new PyObject[] {}, c$36_mkd));
            frame.setlocal("rmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$37_rmd));
            frame.setlocal("pwd", new PyFunction(frame.f_globals, new PyObject[] {}, c$38_pwd));
            frame.setlocal("quit", new PyFunction(frame.f_globals, new PyObject[] {}, c$39_quit));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$40_close));
            return frame.getf_locals();
        }
        
        private static PyObject parse150$43(PyFrame frame) {
            /* Parse the '150' response for a RETR request.
                Returns the expected transfer size or None; size is not guaranteed to
                be present in the 150 message.
                 */
            if (frame.getlocal(0).__getslice__(null, i$23, null)._ne(s$50).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(0));
            }
            // global _150_re
            if (frame.getglobal("_150_re")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_150_re", frame.getlocal(2).__getattr__("compile").__call__(s$99, frame.getlocal(2).__getattr__("IGNORECASE")));
            }
            frame.setlocal(1, frame.getglobal("_150_re").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getglobal("int").__call__(frame.getlocal(1).invoke("group", i$3));
            }
            return frame.getglobal("None");
        }
        
        private static PyObject parse227$44(PyFrame frame) {
            /* Parse the '227' response for a PASV request.
                Raises error_proto if it does not contain '(h1,h2,h3,h4,p1,p2)'
                Return ('host.addr.as.numbers', port#) tuple. */
            if (frame.getlocal(0).__getslice__(null, i$23, null)._ne(s$101).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(0));
            }
            frame.setlocal(2, frame.getlocal(0).invoke("find", s$102));
            if (frame.getlocal(2)._lt(i$7).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"), frame.getlocal(0));
            }
            frame.setlocal(3, frame.getlocal(0).invoke("find", s$103, frame.getlocal(2)._add(i$3)));
            if (frame.getlocal(3)._lt(i$7).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"), frame.getlocal(0));
            }
            frame.setlocal(5, frame.getlocal(0).__getslice__(frame.getlocal(2)._add(i$3), frame.getlocal(3), null).invoke("split", s$44));
            if (frame.getglobal("len").__call__(frame.getlocal(5))._ne(i$104).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"), frame.getlocal(0));
            }
            frame.setlocal(4, s$41.invoke("join", frame.getlocal(5).__getslice__(null, i$24, null)));
            frame.setlocal(1, frame.getglobal("int").__call__(frame.getlocal(5).__getitem__(i$24))._lshift(i$105)._add(frame.getglobal("int").__call__(frame.getlocal(5).__getitem__(i$15))));
            return new PyTuple(new PyObject[] {frame.getlocal(4), frame.getlocal(1)});
        }
        
        private static PyObject parse257$45(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Parse the '257' response for a MKD or PWD request.
                This is a response to a MKD or PWD request: a directory name.
                Returns the directoryname in the 257 reply. */
            if (frame.getlocal(0).__getslice__(null, i$23, null)._ne(s$107).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_reply"), frame.getlocal(0));
            }
            if (frame.getlocal(0).__getslice__(i$23, i$15, null)._ne(s$108).__nonzero__()) {
                return s$8;
            }
            frame.setlocal(2, s$8);
            frame.setlocal(1, i$15);
            frame.setlocal(4, frame.getglobal("len").__call__(frame.getlocal(0)));
            while (frame.getlocal(1)._lt(frame.getlocal(4)).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(0).__getitem__(frame.getlocal(1)));
                frame.setlocal(1, frame.getlocal(1)._add(i$3));
                if (frame.getlocal(3)._eq(s$109).__nonzero__()) {
                    if (((t$0$PyObject = frame.getlocal(1)._ge(frame.getlocal(4))).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getitem__(frame.getlocal(1))._ne(s$109)).__nonzero__()) {
                        break;
                    }
                    frame.setlocal(1, frame.getlocal(1)._add(i$3));
                }
                frame.setlocal(2, frame.getlocal(2)._add(frame.getlocal(3)));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject print_line$46(PyFrame frame) {
            /* Default retrlines callback to print a line. */
            Py.println(frame.getlocal(0));
            return Py.None;
        }
        
        private static PyObject ftpcp$47(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Copy file from one FTP-instance to another. */
            if (frame.getlocal(3).__not__().__nonzero__()) {
                frame.setlocal(3, frame.getlocal(1));
            }
            frame.setlocal(4, s$112._add(frame.getlocal(4)));
            frame.getlocal(0).invoke("voidcmd", frame.getlocal(4));
            frame.getlocal(2).invoke("voidcmd", frame.getlocal(4));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("parse227").__call__(frame.getlocal(0).invoke("sendcmd", s$47)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(8, t$0$PyObject__[1]);
            frame.getlocal(2).invoke("sendport", frame.getlocal(6), frame.getlocal(8));
            frame.setlocal(7, frame.getlocal(2).invoke("sendcmd", s$113._add(frame.getlocal(3))));
            if (frame.getlocal(7).__getslice__(null, i$23, null)._notin(new PyTuple(new PyObject[] {s$114, s$50})).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"));
            }
            frame.setlocal(5, frame.getlocal(0).invoke("sendcmd", s$115._add(frame.getlocal(1))));
            if (frame.getlocal(5).__getslice__(null, i$23, null)._notin(new PyTuple(new PyObject[] {s$114, s$50})).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto"));
            }
            frame.getlocal(0).invoke("voidresp");
            frame.getlocal(2).invoke("voidresp");
            return Py.None;
        }
        
        private static PyObject __init__$48(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            if (frame.getlocal(1).__not__().__nonzero__()) {
                if (frame.getglobal("os").__getattr__("environ").__getattr__("has_key").__call__(s$118).__nonzero__()) {
                    frame.setlocal(1, frame.getglobal("os").__getattr__("path").__getattr__("join").__call__(frame.getglobal("os").__getattr__("environ").__getitem__(s$118), s$119));
                }
                else {
                    throw Py.makeException(frame.getglobal("IOError"), s$120);
                }
            }
            frame.getlocal(0).__setattr__("_Netrc__hosts", new PyDictionary(new PyObject[] {}));
            frame.getlocal(0).__setattr__("_Netrc__macros", new PyDictionary(new PyObject[] {}));
            frame.setlocal(3, frame.getglobal("open").__call__(frame.getlocal(1), s$121));
            frame.setlocal(4, i$7);
            while (i$3.__nonzero__()) {
                frame.setlocal(8, frame.getlocal(3).invoke("readline"));
                if (frame.getlocal(8).__not__().__nonzero__()) {
                    break;
                }
                if (((t$0$PyObject = frame.getlocal(4)).__nonzero__() ? frame.getlocal(8).invoke("strip") : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(2).invoke("append", frame.getlocal(8));
                    continue;
                }
                else if (frame.getlocal(4).__nonzero__()) {
                    frame.getlocal(0).__getattr__("_Netrc__macros").__setitem__(frame.getlocal(11), frame.getglobal("tuple").__call__(frame.getlocal(2)));
                    frame.setlocal(4, i$7);
                }
                frame.setlocal(13, frame.getlocal(8).invoke("split"));
                t$0$PyObject = frame.getglobal("None");
                frame.setlocal(12, t$0$PyObject);
                frame.setlocal(18, t$0$PyObject);
                frame.setlocal(14, t$0$PyObject);
                frame.setlocal(6, t$0$PyObject);
                frame.setlocal(16, i$7);
                frame.setlocal(15, i$7);
                while (frame.getlocal(15)._lt(frame.getglobal("len").__call__(frame.getlocal(13))).__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(13).__getitem__(frame.getlocal(15)));
                    if (frame.getlocal(15)._add(i$3)._lt(frame.getglobal("len").__call__(frame.getlocal(13))).__nonzero__()) {
                        frame.setlocal(5, frame.getlocal(13).__getitem__(frame.getlocal(15)._add(i$3)));
                    }
                    else {
                        frame.setlocal(5, frame.getglobal("None"));
                    }
                    if (frame.getlocal(7)._eq(s$122).__nonzero__()) {
                        frame.setlocal(16, i$3);
                    }
                    else if (((t$0$PyObject = frame.getlocal(7)._eq(s$123)).__nonzero__() ? frame.getlocal(5) : t$0$PyObject).__nonzero__()) {
                        frame.setlocal(12, frame.getlocal(5).invoke("lower"));
                        frame.setlocal(15, frame.getlocal(15)._add(i$3));
                    }
                    else if (((t$0$PyObject = frame.getlocal(7)._eq(s$124)).__nonzero__() ? frame.getlocal(5) : t$0$PyObject).__nonzero__()) {
                        frame.setlocal(18, frame.getlocal(5));
                        frame.setlocal(15, frame.getlocal(15)._add(i$3));
                    }
                    else if (((t$0$PyObject = frame.getlocal(7)._eq(s$125)).__nonzero__() ? frame.getlocal(5) : t$0$PyObject).__nonzero__()) {
                        frame.setlocal(14, frame.getlocal(5));
                        frame.setlocal(15, frame.getlocal(15)._add(i$3));
                    }
                    else if (((t$0$PyObject = frame.getlocal(7)._eq(s$126)).__nonzero__() ? frame.getlocal(5) : t$0$PyObject).__nonzero__()) {
                        frame.setlocal(6, frame.getlocal(5));
                        frame.setlocal(15, frame.getlocal(15)._add(i$3));
                    }
                    else if (((t$0$PyObject = frame.getlocal(7)._eq(s$127)).__nonzero__() ? frame.getlocal(5) : t$0$PyObject).__nonzero__()) {
                        frame.setlocal(11, frame.getlocal(5));
                        frame.setlocal(2, new PyList(new PyObject[] {}));
                        frame.setlocal(4, i$3);
                        break;
                    }
                    frame.setlocal(15, frame.getlocal(15)._add(i$3));
                }
                if (frame.getlocal(16).__nonzero__()) {
                    frame.getlocal(0).__setattr__("_Netrc__defuser", (t$0$PyObject = frame.getlocal(18)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_Netrc__defuser"));
                    frame.getlocal(0).__setattr__("_Netrc__defpasswd", (t$0$PyObject = frame.getlocal(14)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_Netrc__defpasswd"));
                    frame.getlocal(0).__setattr__("_Netrc__defacct", (t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_Netrc__defacct"));
                }
                if (frame.getlocal(12).__nonzero__()) {
                    if (frame.getlocal(0).__getattr__("_Netrc__hosts").invoke("has_key", frame.getlocal(12)).__nonzero__()) {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("_Netrc__hosts").__getitem__(frame.getlocal(12)), 3);
                        frame.setlocal(9, t$0$PyObject__[0]);
                        frame.setlocal(10, t$0$PyObject__[1]);
                        frame.setlocal(17, t$0$PyObject__[2]);
                        frame.setlocal(18, (t$0$PyObject = frame.getlocal(18)).__nonzero__() ? t$0$PyObject : frame.getlocal(9));
                        frame.setlocal(14, (t$0$PyObject = frame.getlocal(14)).__nonzero__() ? t$0$PyObject : frame.getlocal(10));
                        frame.setlocal(6, (t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject : frame.getlocal(17));
                    }
                    frame.getlocal(0).__getattr__("_Netrc__hosts").__setitem__(frame.getlocal(12), new PyTuple(new PyObject[] {frame.getlocal(18), frame.getlocal(14), frame.getlocal(6)}));
                }
            }
            frame.getlocal(3).invoke("close");
            return Py.None;
        }
        
        private static PyObject get_hosts$49(PyFrame frame) {
            /* Return a list of hosts mentioned in the .netrc file. */
            return frame.getlocal(0).__getattr__("_Netrc__hosts").invoke("keys");
        }
        
        private static PyObject get_account$50(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            /* Returns login information for the named host.
            
                    The return value is a triple containing userid,
                    password, and the accounting field.
            
                     */
            frame.setlocal(1, frame.getlocal(1).invoke("lower"));
            t$0$PyObject = frame.getglobal("None");
            frame.setlocal(3, t$0$PyObject);
            frame.setlocal(2, t$0$PyObject);
            frame.setlocal(4, t$0$PyObject);
            if (frame.getlocal(0).__getattr__("_Netrc__hosts").invoke("has_key", frame.getlocal(1)).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("_Netrc__hosts").__getitem__(frame.getlocal(1)), 3);
                frame.setlocal(3, t$0$PyObject__[0]);
                frame.setlocal(2, t$0$PyObject__[1]);
                frame.setlocal(4, t$0$PyObject__[2]);
            }
            frame.setlocal(3, (t$0$PyObject = frame.getlocal(3)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_Netrc__defuser"));
            frame.setlocal(2, (t$0$PyObject = frame.getlocal(2)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_Netrc__defpasswd"));
            frame.setlocal(4, (t$0$PyObject = frame.getlocal(4)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_Netrc__defacct"));
            return new PyTuple(new PyObject[] {frame.getlocal(3), frame.getlocal(2), frame.getlocal(4)});
        }
        
        private static PyObject get_macros$51(PyFrame frame) {
            /* Return a list of all defined macro names. */
            return frame.getlocal(0).__getattr__("_Netrc__macros").invoke("keys");
        }
        
        private static PyObject get_macro$52(PyFrame frame) {
            /* Return a sequence of lines which define a named macro. */
            return frame.getlocal(0).__getattr__("_Netrc__macros").__getitem__(frame.getlocal(1));
        }
        
        private static PyObject Netrc$53(PyFrame frame) {
            /* Class to parse & provide access to 'netrc' format files.
            
                See the netrc(4) man page for information on the file format.
            
                WARNING: This class is obsolete -- use module netrc instead.
            
                 */
            frame.setlocal("_Netrc__defuser", frame.getname("None"));
            frame.setlocal("_Netrc__defpasswd", frame.getname("None"));
            frame.setlocal("_Netrc__defacct", frame.getname("None"));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$47___init__));
            frame.setlocal("get_hosts", new PyFunction(frame.f_globals, new PyObject[] {}, c$48_get_hosts));
            frame.setlocal("get_account", new PyFunction(frame.f_globals, new PyObject[] {}, c$49_get_account));
            frame.setlocal("get_macros", new PyFunction(frame.f_globals, new PyObject[] {}, c$50_get_macros));
            frame.setlocal("get_macro", new PyFunction(frame.f_globals, new PyObject[] {}, c$51_get_macro));
            return frame.getf_locals();
        }
        
        private static PyObject test$54(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            boolean t$0$boolean;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Test program.
                Usage: ftp [-d] [-r[file]] host [-l[dir]] [-d[dir]] [-p] [file] ... */
            frame.setlocal(5, i$7);
            frame.setlocal(7, frame.getglobal("None"));
            while (frame.getglobal("sys").__getattr__("argv").__getitem__(i$3)._eq(s$133).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(5)._add(i$3));
                frame.getglobal("sys").__getattr__("argv").__delitem__(i$3);
            }
            if (frame.getglobal("sys").__getattr__("argv").__getitem__(i$3).__getslice__(null, i$22, null)._eq(s$134).__nonzero__()) {
                frame.setlocal(7, frame.getglobal("sys").__getattr__("argv").__getitem__(i$3).__getslice__(i$22, null, null));
                frame.getglobal("sys").__getattr__("argv").__delitem__(i$3);
            }
            frame.setlocal(10, frame.getglobal("sys").__getattr__("argv").__getitem__(i$3));
            frame.setlocal(9, frame.getglobal("FTP").__call__(frame.getlocal(10)));
            frame.getlocal(9).invoke("set_debuglevel", frame.getlocal(5));
            t$0$PyObject = s$8;
            frame.setlocal(6, t$0$PyObject);
            frame.setlocal(0, t$0$PyObject);
            frame.setlocal(8, t$0$PyObject);
            t$0$boolean = true;
            try {
                frame.setlocal(4, frame.getglobal("Netrc").__call__(frame.getlocal(7)));
            }
            catch (Throwable x$0) {
                t$0$boolean = false;
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                    if (frame.getlocal(7)._isnot(frame.getglobal("None")).__nonzero__()) {
                        frame.getglobal("sys").__getattr__("stderr").__getattr__("write").__call__(s$135);
                    }
                }
                else throw t$0$PyException;
            }
            if (t$0$boolean) {
                try {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(4).invoke("get_account", frame.getlocal(10)), 3);
                    frame.setlocal(6, t$0$PyObject__[0]);
                    frame.setlocal(0, t$0$PyObject__[1]);
                    frame.setlocal(8, t$0$PyObject__[2]);
                }
                catch (Throwable x$1) {
                    t$0$PyException = Py.setException(x$1, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("KeyError"))) {
                        frame.getglobal("sys").__getattr__("stderr").__getattr__("write").__call__(s$136);
                    }
                    else throw t$0$PyException;
                }
            }
            frame.getlocal(9).invoke("login", new PyObject[] {frame.getlocal(6), frame.getlocal(0), frame.getlocal(8)});
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("sys").__getattr__("argv").__getslice__(i$22, null, null);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2).__getslice__(null, i$22, null)._eq(s$137).__nonzero__()) {
                    frame.getlocal(9).invoke("dir", frame.getlocal(2).__getslice__(i$22, null, null));
                }
                else if (frame.getlocal(2).__getslice__(null, i$22, null)._eq(s$133).__nonzero__()) {
                    frame.setlocal(1, s$138);
                    if (frame.getlocal(2).__getslice__(i$22, null, null).__nonzero__()) {
                        frame.setlocal(1, frame.getlocal(1)._add(s$71)._add(frame.getlocal(2).__getslice__(i$22, null, null)));
                    }
                    frame.setlocal(3, frame.getlocal(9).invoke("sendcmd", frame.getlocal(1)));
                }
                else if (frame.getlocal(2)._eq(s$139).__nonzero__()) {
                    frame.getlocal(9).invoke("set_pasv", frame.getlocal(9).__getattr__("passiveserver").__not__());
                }
                else {
                    frame.getlocal(9).invoke("retrbinary", new PyObject[] {s$115._add(frame.getlocal(2)), frame.getglobal("sys").__getattr__("stdout").__getattr__("write"), i$140});
                }
            }
            frame.getlocal(9).invoke("quit");
            return Py.None;
        }
        
        private static PyObject main$55(PyFrame frame) {
            frame.setglobal("__file__", s$142);
            
            PyObject[] imp_accu;
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* An FTP client class and some helper functions.
            
            Based on RFC 959: File Transfer Protocol (FTP), by J. Postel and J. Reynolds
            
            Example:
            
            >>> from ftplib import FTP
            >>> ftp = FTP('ftp.python.org') # connect to host, default port
            >>> ftp.login() # default, i.e.: user anonymous, passwd user@hostname
            '230 Guest login ok, access restrictions apply.'
            >>> ftp.retrlines('LIST') # list directory contents
            total 9
            drwxr-xr-x   8 root     wheel        1024 Jan  3  1994 .
            drwxr-xr-x   8 root     wheel        1024 Jan  3  1994 ..
            drwxr-xr-x   2 root     wheel        1024 Jan  3  1994 bin
            drwxr-xr-x   2 root     wheel        1024 Jan  3  1994 etc
            d-wxrwxr-x   2 ftp      wheel        1024 Sep  5 13:43 incoming
            drwxr-xr-x   2 root     wheel        1024 Nov 17  1993 lib
            drwxr-xr-x   6 1094     wheel        1024 Sep 13 19:07 pub
            drwxr-xr-x   3 root     wheel        1024 Jan  3  1994 usr
            -rw-r--r--   1 root     root          312 Aug  1  1994 welcome.msg
            '226 Transfer complete.'
            >>> ftp.quit()
            '221 Goodbye.'
            >>>
            
            A nice test that reveals some of the network dialogue would be:
            python ftplib.py -d localhost -l -p -l
             */
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            try {
                frame.setlocal("SOCKS", org.python.core.imp.importOne("SOCKS", frame));
                frame.setlocal("socket", frame.getname("SOCKS"));
                frame.dellocal("SOCKS");
                imp_accu = org.python.core.imp.importFrom("socket", new String[] {"getfqdn"}, frame);
                frame.setlocal("getfqdn", imp_accu[0]);
                imp_accu = null;
                frame.getname("socket").__setattr__("getfqdn", frame.getname("getfqdn"));
                frame.dellocal("getfqdn");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getname("ImportError"))) {
                    frame.setlocal("socket", org.python.core.imp.importOne("socket", frame));
                }
                else throw t$0$PyException;
            }
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2}));
            frame.setlocal("MSG_OOB", i$3);
            frame.setlocal("FTP_PORT", i$4);
            frame.setlocal("Error", Py.makeClass("Error", new PyObject[] {frame.getname("Exception")}, c$0_Error, null));
            frame.setlocal("error_reply", Py.makeClass("error_reply", new PyObject[] {frame.getname("Error")}, c$1_error_reply, null));
            frame.setlocal("error_temp", Py.makeClass("error_temp", new PyObject[] {frame.getname("Error")}, c$2_error_temp, null));
            frame.setlocal("error_perm", Py.makeClass("error_perm", new PyObject[] {frame.getname("Error")}, c$3_error_perm, null));
            frame.setlocal("error_proto", Py.makeClass("error_proto", new PyObject[] {frame.getname("Error")}, c$4_error_proto, null));
            frame.setlocal("all_errors", new PyTuple(new PyObject[] {frame.getname("Error"), frame.getname("socket").__getattr__("error"), frame.getname("IOError"), frame.getname("EOFError")}));
            frame.setlocal("CRLF", s$5);
            frame.setlocal("FTP", Py.makeClass("FTP", new PyObject[] {}, c$41_FTP, null));
            frame.setlocal("_150_re", frame.getname("None"));
            frame.setlocal("parse150", new PyFunction(frame.f_globals, new PyObject[] {}, c$42_parse150));
            frame.setlocal("parse227", new PyFunction(frame.f_globals, new PyObject[] {}, c$43_parse227));
            frame.setlocal("parse257", new PyFunction(frame.f_globals, new PyObject[] {}, c$44_parse257));
            frame.setlocal("print_line", new PyFunction(frame.f_globals, new PyObject[] {}, c$45_print_line));
            frame.setlocal("ftpcp", new PyFunction(frame.f_globals, new PyObject[] {s$8, s$116}, c$46_ftpcp));
            frame.setlocal("Netrc", Py.makeClass("Netrc", new PyObject[] {}, c$52_Netrc, null));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {}, c$53_test));
            if (frame.getname("__name__")._eq(s$141).__nonzero__()) {
                frame.getname("test").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("ftplib"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "ftplib";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(ftplib._PyInner.class, newargs, ftplib.jpy$packages, ftplib.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
