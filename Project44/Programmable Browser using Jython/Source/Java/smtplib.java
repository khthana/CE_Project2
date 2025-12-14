import org.python.core.*;

public class smtplib extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject s$3;
        private static PyObject s$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject s$7;
        private static PyObject s$8;
        private static PyObject s$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject i$12;
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
        private static PyObject i$23;
        private static PyObject s$24;
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyObject s$27;
        private static PyObject s$28;
        private static PyObject s$29;
        private static PyObject i$30;
        private static PyObject s$31;
        private static PyObject i$32;
        private static PyObject s$33;
        private static PyObject s$34;
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
        private static PyObject i$51;
        private static PyObject i$52;
        private static PyObject s$53;
        private static PyObject s$54;
        private static PyObject s$55;
        private static PyObject s$56;
        private static PyObject s$57;
        private static PyObject s$58;
        private static PyObject s$59;
        private static PyObject s$60;
        private static PyObject i$61;
        private static PyObject s$62;
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
        private static PyObject i$81;
        private static PyObject i$82;
        private static PyObject s$83;
        private static PyObject s$84;
        private static PyObject s$85;
        private static PyObject s$86;
        private static PyObject s$87;
        private static PyObject i$88;
        private static PyObject i$89;
        private static PyObject s$90;
        private static PyObject s$91;
        private static PyObject i$92;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0_SMTPException;
        private static PyCode c$1_SMTPServerDisconnected;
        private static PyCode c$2___init__;
        private static PyCode c$3_SMTPResponseException;
        private static PyCode c$4___init__;
        private static PyCode c$5_SMTPSenderRefused;
        private static PyCode c$6___init__;
        private static PyCode c$7_SMTPRecipientsRefused;
        private static PyCode c$8_SMTPDataError;
        private static PyCode c$9_SMTPConnectError;
        private static PyCode c$10_SMTPHeloError;
        private static PyCode c$11_quoteaddr;
        private static PyCode c$12_quotedata;
        private static PyCode c$13___init__;
        private static PyCode c$14_set_debuglevel;
        private static PyCode c$15_connect;
        private static PyCode c$16_send;
        private static PyCode c$17_putcmd;
        private static PyCode c$18_getreply;
        private static PyCode c$19_docmd;
        private static PyCode c$20_helo;
        private static PyCode c$21_ehlo;
        private static PyCode c$22_has_extn;
        private static PyCode c$23_help;
        private static PyCode c$24_rset;
        private static PyCode c$25_noop;
        private static PyCode c$26_mail;
        private static PyCode c$27_rcpt;
        private static PyCode c$28_data;
        private static PyCode c$29_verify;
        private static PyCode c$30_expn;
        private static PyCode c$31_sendmail;
        private static PyCode c$32_close;
        private static PyCode c$33_quit;
        private static PyCode c$34_SMTP;
        private static PyCode c$35_prompt;
        private static PyCode c$36_main;
        private static void initConstants() {
            s$0 = Py.newString("SMTP/ESMTP client class.\012\012This should follow RFC 821 (SMTP) and RFC 1869 (ESMTP).\012\012Notes:\012\012Please remember, when doing ESMTP, that the names of the SMTP service\012extensions are NOT the same thing as the option keywords for the RCPT\012and MAIL commands!\012\012Example:\012\012  >>> import smtplib\012  >>> s=smtplib.SMTP(\"localhost\")\012  >>> print s.help()\012  This is Sendmail version 8.8.4\012  Topics:\012      HELO    EHLO    MAIL    RCPT    DATA\012      RSET    NOOP    QUIT    HELP    VRFY\012      EXPN    VERB    ETRN    DSN\012  For more info use \"HELP <topic>\".\012  To report bugs in the implementation send email to\012      sendmail-bugs@sendmail.org.\012  For local information send email to Postmaster at your site.\012  End of HELP info\012  >>> s.putcmd(\"vrfy\",\"someone@here\")\012  >>> s.getreply()\012  (250, \"Somebody OverHere <somebody@here.my.org>\")\012  >>> s.quit()\012");
            s$1 = Py.newString("SMTPException");
            s$2 = Py.newString("SMTPServerDisconnected");
            s$3 = Py.newString("SMTPResponseException");
            s$4 = Py.newString("SMTPSenderRefused");
            s$5 = Py.newString("SMTPRecipientsRefused");
            s$6 = Py.newString("SMTPDataError");
            s$7 = Py.newString("SMTPConnectError");
            s$8 = Py.newString("SMTPHeloError");
            s$9 = Py.newString("quoteaddr");
            s$10 = Py.newString("quotedata");
            s$11 = Py.newString("SMTP");
            i$12 = Py.newInteger(25);
            s$13 = Py.newString("\015\012");
            s$14 = Py.newString("Base class for all exceptions raised by this module.");
            s$15 = Py.newString("Not connected to any SMTP server.\012\012    This exception is raised when the server unexpectedly disconnects,\012    or when an attempt is made to use the SMTP instance before\012    connecting it to a server.\012    ");
            s$16 = Py.newString("Base class for all exceptions that include an SMTP error code.\012\012    These exceptions are generated in some instances when the SMTP\012    server returns an error code.  The error code is stored in the\012    `smtp_code' attribute of the error, and the `smtp_error' attribute\012    is set to the error message.\012    ");
            s$17 = Py.newString("Sender address refused.\012    In addition to the attributes set by on all SMTPResponseException\012    exceptions, this sets `sender' to the string that the SMTP refused.\012    ");
            s$18 = Py.newString("All recipient addresses refused.\012    The errors for each recipient are accessible through the attribute\012    'recipients', which is a dictionary of exactly the same sort as\012    SMTP.sendmail() returns.\012    ");
            s$19 = Py.newString("The SMTP server didn't accept the data.");
            s$20 = Py.newString("Error during connection establishment.");
            s$21 = Py.newString("The server refused our HELO reply.");
            s$22 = Py.newString("Quote a subset of the email addresses defined by RFC 821.\012\012    Should be able to handle anything rfc822.parseaddr can handle.\012    ");
            i$23 = Py.newInteger(1);
            s$24 = Py.newString("<%s>");
            s$25 = Py.newString("Quote data for email.\012\012    Double leading '.', and change Unix newline '\\n', or Mac '\\r' into\012    Internet CRLF end-of-line.\012    ");
            s$26 = Py.newString("(?m)^\\.");
            s$27 = Py.newString("..");
            s$28 = Py.newString("(?:\\r\\n|\\n|\\r(?!\\n))");
            s$29 = Py.newString("This class manages a connection to an SMTP or ESMTP server.\012    SMTP Objects:\012        SMTP objects have the following attributes:\012            helo_resp\012                This is the message given by the server in response to the\012                most recent HELO command.\012\012            ehlo_resp\012                This is the message given by the server in response to the\012                most recent EHLO command. This is usually multiline.\012\012            does_esmtp\012                This is a True value _after you do an EHLO command_, if the\012                server supports ESMTP.\012\012            esmtp_features\012                This is a dictionary, which, if the server supports ESMTP,\012                will _after you do an EHLO command_, contain the names of the\012                SMTP service extensions this server supports, and their\012                parameters (if any).\012\012                Note, all extension names are mapped to lower case in the\012                dictionary.\012\012        See each method's docstrings for details.  In general, there is a\012        method of the same name to perform each SMTP command.  There is also a\012        method called 'sendmail' that will do an entire mail transaction.\012        ");
            i$30 = Py.newInteger(0);
            s$31 = Py.newString("Initialize a new instance.\012\012        If specified, `host' is the name of the remote host to which to\012        connect.  If specified, `port' specifies the port to which to connect.\012        By default, smtplib.SMTP_PORT is used.  An SMTPConnectError is raised\012        if the specified `host' doesn't respond correctly.\012\012        ");
            i$32 = Py.newInteger(220);
            s$33 = Py.newString("");
            s$34 = Py.newString("Set the debug output level.\012\012        A non-false value results in debug messages for connection and for all\012        messages sent to and received from the server.\012\012        ");
            s$35 = Py.newString("Connect to a host on a given port.\012\012        If the hostname ends with a colon (`:') followed by a number, and\012        there is no port specified, that suffix will be stripped off and the\012        number interpreted as the port number to use.\012\012        Note: This method is automatically invoked by __init__, if a host is\012        specified during instantiation.\012\012        ");
            s$36 = Py.newString(":");
            s$37 = Py.newString("nonnumeric port");
            s$38 = Py.newString("connect:");
            s$39 = Py.newString("localhost");
            s$40 = Py.newString("Send `str' to the server.");
            s$41 = Py.newString("send:");
            s$42 = Py.newString("Server not connected");
            s$43 = Py.newString("please run connect() first");
            s$44 = Py.newString("Send a command to the server.");
            s$45 = Py.newString("%s%s");
            s$46 = Py.newString("%s %s%s");
            s$47 = Py.newString("Get a reply from the server.\012\012        Returns a tuple consisting of:\012\012          - server response code (e.g. '250', or such, if all goes well)\012            Note: returns -1 if it can't read response code.\012\012          - server response string corresponding to response code (multiline\012            responses are converted to a single, multiline string).\012\012        Raises SMTPServerDisconnected if end-of-file is reached.\012        ");
            s$48 = Py.newString("rb");
            s$49 = Py.newString("Connection unexpectedly closed");
            s$50 = Py.newString("reply:");
            i$51 = Py.newInteger(4);
            i$52 = Py.newInteger(3);
            s$53 = Py.newString("-");
            s$54 = Py.newString("\012");
            s$55 = Py.newString("reply: retcode (%s); Msg: %s");
            s$56 = Py.newString("Send a command, and return its response code.");
            s$57 = Py.newString("SMTP 'helo' command.\012        Hostname to send for this command defaults to the FQDN of the local\012        host.\012        ");
            s$58 = Py.newString("helo");
            s$59 = Py.newString(" SMTP 'ehlo' command.\012        Hostname to send for this command defaults to the FQDN of the local\012        host.\012        ");
            s$60 = Py.newString("ehlo");
            i$61 = Py.newInteger(250);
            s$62 = Py.newString("(?P<feature>[A-Za-z0-9][A-Za-z0-9\\-]*)");
            s$63 = Py.newString("feature");
            s$64 = Py.newString("Does the server support a given SMTP service extension?");
            s$65 = Py.newString("SMTP 'help' command.\012        Returns help text from server.");
            s$66 = Py.newString("help");
            s$67 = Py.newString("SMTP 'rset' command -- resets session.");
            s$68 = Py.newString("rset");
            s$69 = Py.newString("SMTP 'noop' command -- doesn't do anything :>");
            s$70 = Py.newString("noop");
            s$71 = Py.newString("SMTP 'mail' command -- begins mail xfer session.");
            s$72 = Py.newString(" ");
            s$73 = Py.newString("mail");
            s$74 = Py.newString("FROM:%s%s");
            s$75 = Py.newString("SMTP 'rcpt' command -- indicates 1 recipient for this mail.");
            s$76 = Py.newString("rcpt");
            s$77 = Py.newString("TO:%s%s");
            s$78 = Py.newString("SMTP 'DATA' command -- sends message data to server.\012\012        Automatically quotes lines beginning with a period per rfc821.\012        Raises SMTPDataError if there is an unexpected reply to the\012        DATA command; the return value from this method is the final\012        response code received when the all data is sent.\012        ");
            s$79 = Py.newString("data");
            s$80 = Py.newString("data:");
            i$81 = Py.newInteger(354);
            i$82 = Py.newInteger(2);
            s$83 = Py.newString(".");
            s$84 = Py.newString("SMTP 'verify' command -- checks for address validity.");
            s$85 = Py.newString("vrfy");
            s$86 = Py.newString("expn");
            s$87 = Py.newString("This command performs an entire mail transaction.\012\012        The arguments are:\012            - from_addr    : The address sending this mail.\012            - to_addrs     : A list of addresses to send this mail to.  A bare\012                             string will be treated as a list with 1 address.\012            - msg          : The message to send.\012            - mail_options : List of ESMTP options (such as 8bitmime) for the\012                             mail command.\012            - rcpt_options : List of ESMTP options (such as DSN commands) for\012                             all the rcpt commands.\012\012        If there has been no previous EHLO or HELO command this session, this\012        method tries ESMTP EHLO first.  If the server does ESMTP, message size\012        and each of the specified options will be passed to it.  If EHLO\012        fails, HELO will be tried and ESMTP options suppressed.\012\012        This method will return normally if the mail is accepted for at least\012        one recipient.  It returns a dictionary, with one entry for each\012        recipient that was refused.  Each entry contains a tuple of the SMTP\012        error code and the accompanying error message sent by the server.\012\012        This method may raise the following exceptions:\012\012         SMTPHeloError          The server didn't reply properly to\012                                the helo greeting.\012         SMTPRecipientsRefused  The server rejected ALL recipients\012                                (no mail was sent).\012         SMTPSenderRefused      The server didn't accept the from_addr.\012         SMTPDataError          The server replied with an unexpected\012                                error code (other than a refusal of\012                                a recipient).\012\012        Note: the connection will be open even after an exception is raised.\012\012        Example:\012\012         >>> import smtplib\012         >>> s=smtplib.SMTP(\"localhost\")\012         >>> tolist=[\"one@one.org\",\"two@two.org\",\"three@three.org\",\"four@four.org\"]\012         >>> msg = '''\012         ... From: Me@my.org\012         ... Subject: testin'...\012         ...\012         ... This is a test '''\012         >>> s.sendmail(\"me@my.org\",tolist,msg)\012         { \"three@three.org\" : ( 550 ,\"User unknown\" ) }\012         >>> s.quit()\012\012        In the above example, the message was accepted for delivery to three\012        of the four addresses, and one was rejected, with the error code\012        550.  If all addresses are accepted, then the method will return an\012        empty dictionary.\012\012        ");
            i$88 = Py.newInteger(200);
            i$89 = Py.newInteger(299);
            s$90 = Py.newString("size");
            s$91 = Py.newString("size=");
            i$92 = Py.newInteger(251);
            s$93 = Py.newString("Close the connection to the SMTP server.");
            s$94 = Py.newString("Terminate the SMTP session.");
            s$95 = Py.newString("quit");
            s$96 = Py.newString("__main__");
            s$97 = Py.newString(": ");
            s$98 = Py.newString("From");
            s$99 = Py.newString("To");
            s$100 = Py.newString(",");
            s$101 = Py.newString("Enter message, end with ^D:");
            s$102 = Py.newString("Message length is ");
            s$103 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py");
            funcTable = new _PyInner();
            c$0_SMTPException = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPException", false, false, funcTable, 0, null, null, 0, 0);
            c$1_SMTPServerDisconnected = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPServerDisconnected", false, false, funcTable, 1, null, null, 0, 0);
            c$2___init__ = Py.newCode(3, new String[] {"self", "code", "msg"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "__init__", false, false, funcTable, 2, null, null, 0, 1);
            c$3_SMTPResponseException = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPResponseException", false, false, funcTable, 3, null, null, 0, 0);
            c$4___init__ = Py.newCode(4, new String[] {"self", "code", "msg", "sender"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "__init__", false, false, funcTable, 4, null, null, 0, 1);
            c$5_SMTPSenderRefused = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPSenderRefused", false, false, funcTable, 5, null, null, 0, 0);
            c$6___init__ = Py.newCode(2, new String[] {"self", "recipients"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "__init__", false, false, funcTable, 6, null, null, 0, 1);
            c$7_SMTPRecipientsRefused = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPRecipientsRefused", false, false, funcTable, 7, null, null, 0, 0);
            c$8_SMTPDataError = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPDataError", false, false, funcTable, 8, null, null, 0, 0);
            c$9_SMTPConnectError = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPConnectError", false, false, funcTable, 9, null, null, 0, 0);
            c$10_SMTPHeloError = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTPHeloError", false, false, funcTable, 10, null, null, 0, 0);
            c$11_quoteaddr = Py.newCode(1, new String[] {"addr", "m"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "quoteaddr", false, false, funcTable, 11, null, null, 0, 1);
            c$12_quotedata = Py.newCode(1, new String[] {"data"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "quotedata", false, false, funcTable, 12, null, null, 0, 1);
            c$13___init__ = Py.newCode(3, new String[] {"self", "host", "port", "code", "msg"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "__init__", false, false, funcTable, 13, null, null, 0, 1);
            c$14_set_debuglevel = Py.newCode(2, new String[] {"self", "debuglevel"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "set_debuglevel", false, false, funcTable, 14, null, null, 0, 1);
            c$15_connect = Py.newCode(3, new String[] {"self", "host", "port", "code", "msg", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "connect", false, false, funcTable, 15, null, null, 0, 1);
            c$16_send = Py.newCode(2, new String[] {"self", "str", "sendptr"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "send", false, false, funcTable, 16, null, null, 0, 1);
            c$17_putcmd = Py.newCode(3, new String[] {"self", "cmd", "args", "str"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "putcmd", false, false, funcTable, 17, null, null, 0, 1);
            c$18_getreply = Py.newCode(1, new String[] {"self", "errcode", "code", "resp", "errmsg", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "getreply", false, false, funcTable, 18, null, null, 0, 1);
            c$19_docmd = Py.newCode(3, new String[] {"self", "cmd", "args"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "docmd", false, false, funcTable, 19, null, null, 0, 1);
            c$20_helo = Py.newCode(2, new String[] {"self", "name", "code", "msg"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "helo", false, false, funcTable, 20, null, null, 0, 1);
            c$21_ehlo = Py.newCode(2, new String[] {"self", "name", "code", "msg", "m", "params", "resp", "each", "feature"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "ehlo", false, false, funcTable, 21, null, null, 0, 1);
            c$22_has_extn = Py.newCode(2, new String[] {"self", "opt"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "has_extn", false, false, funcTable, 22, null, null, 0, 1);
            c$23_help = Py.newCode(2, new String[] {"self", "args"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "help", false, false, funcTable, 23, null, null, 0, 1);
            c$24_rset = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "rset", false, false, funcTable, 24, null, null, 0, 1);
            c$25_noop = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "noop", false, false, funcTable, 25, null, null, 0, 1);
            c$26_mail = Py.newCode(3, new String[] {"self", "sender", "options", "optionlist"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "mail", false, false, funcTable, 26, null, null, 0, 1);
            c$27_rcpt = Py.newCode(3, new String[] {"self", "recip", "options", "optionlist"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "rcpt", false, false, funcTable, 27, null, null, 0, 1);
            c$28_data = Py.newCode(2, new String[] {"self", "msg", "code", "q", "repl"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "data", false, false, funcTable, 28, null, null, 0, 1);
            c$29_verify = Py.newCode(2, new String[] {"self", "address"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "verify", false, false, funcTable, 29, null, null, 0, 1);
            c$30_expn = Py.newCode(2, new String[] {"self", "address"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "expn", false, false, funcTable, 30, null, null, 0, 1);
            c$31_sendmail = Py.newCode(6, new String[] {"self", "from_addr", "to_addrs", "msg", "mail_options", "rcpt_options", "code", "each", "esmtp_opts", "option", "senderrs", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "sendmail", false, false, funcTable, 31, null, null, 0, 1);
            c$32_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "close", false, false, funcTable, 32, null, null, 0, 1);
            c$33_quit = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "quit", false, false, funcTable, 33, null, null, 0, 1);
            c$34_SMTP = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "SMTP", false, false, funcTable, 34, null, null, 0, 0);
            c$35_prompt = Py.newCode(1, new String[] {"prompt"}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "prompt", false, false, funcTable, 35, null, null, 0, 1);
            c$36_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\smtplib.py", "main", false, false, funcTable, 36, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$36_main == null) _PyInner.initConstants();
            return c$36_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.SMTPException$1(frame);
                case 1:
                return _PyInner.SMTPServerDisconnected$2(frame);
                case 2:
                return _PyInner.__init__$3(frame);
                case 3:
                return _PyInner.SMTPResponseException$4(frame);
                case 4:
                return _PyInner.__init__$5(frame);
                case 5:
                return _PyInner.SMTPSenderRefused$6(frame);
                case 6:
                return _PyInner.__init__$7(frame);
                case 7:
                return _PyInner.SMTPRecipientsRefused$8(frame);
                case 8:
                return _PyInner.SMTPDataError$9(frame);
                case 9:
                return _PyInner.SMTPConnectError$10(frame);
                case 10:
                return _PyInner.SMTPHeloError$11(frame);
                case 11:
                return _PyInner.quoteaddr$12(frame);
                case 12:
                return _PyInner.quotedata$13(frame);
                case 13:
                return _PyInner.__init__$14(frame);
                case 14:
                return _PyInner.set_debuglevel$15(frame);
                case 15:
                return _PyInner.connect$16(frame);
                case 16:
                return _PyInner.send$17(frame);
                case 17:
                return _PyInner.putcmd$18(frame);
                case 18:
                return _PyInner.getreply$19(frame);
                case 19:
                return _PyInner.docmd$20(frame);
                case 20:
                return _PyInner.helo$21(frame);
                case 21:
                return _PyInner.ehlo$22(frame);
                case 22:
                return _PyInner.has_extn$23(frame);
                case 23:
                return _PyInner.help$24(frame);
                case 24:
                return _PyInner.rset$25(frame);
                case 25:
                return _PyInner.noop$26(frame);
                case 26:
                return _PyInner.mail$27(frame);
                case 27:
                return _PyInner.rcpt$28(frame);
                case 28:
                return _PyInner.data$29(frame);
                case 29:
                return _PyInner.verify$30(frame);
                case 30:
                return _PyInner.expn$31(frame);
                case 31:
                return _PyInner.sendmail$32(frame);
                case 32:
                return _PyInner.close$33(frame);
                case 33:
                return _PyInner.quit$34(frame);
                case 34:
                return _PyInner.SMTP$35(frame);
                case 35:
                return _PyInner.prompt$36(frame);
                case 36:
                return _PyInner.main$37(frame);
                default:
                return null;
            }
        }
        
        private static PyObject SMTPException$1(PyFrame frame) {
            /* Base class for all exceptions raised by this module. */
            return frame.getf_locals();
        }
        
        private static PyObject SMTPServerDisconnected$2(PyFrame frame) {
            /* Not connected to any SMTP server.
            
                This exception is raised when the server unexpectedly disconnects,
                or when an attempt is made to use the SMTP instance before
                connecting it to a server.
                 */
            return frame.getf_locals();
        }
        
        private static PyObject __init__$3(PyFrame frame) {
            frame.getlocal(0).__setattr__("smtp_code", frame.getlocal(1));
            frame.getlocal(0).__setattr__("smtp_error", frame.getlocal(2));
            frame.getlocal(0).__setattr__("args", new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)}));
            return Py.None;
        }
        
        private static PyObject SMTPResponseException$4(PyFrame frame) {
            /* Base class for all exceptions that include an SMTP error code.
            
                These exceptions are generated in some instances when the SMTP
                server returns an error code.  The error code is stored in the
                `smtp_code' attribute of the error, and the `smtp_error' attribute
                is set to the error message.
                 */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$2___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$5(PyFrame frame) {
            frame.getlocal(0).__setattr__("smtp_code", frame.getlocal(1));
            frame.getlocal(0).__setattr__("smtp_error", frame.getlocal(2));
            frame.getlocal(0).__setattr__("sender", frame.getlocal(3));
            frame.getlocal(0).__setattr__("args", new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3)}));
            return Py.None;
        }
        
        private static PyObject SMTPSenderRefused$6(PyFrame frame) {
            /* Sender address refused.
                In addition to the attributes set by on all SMTPResponseException
                exceptions, this sets `sender' to the string that the SMTP refused.
                 */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$4___init__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$7(PyFrame frame) {
            frame.getlocal(0).__setattr__("recipients", frame.getlocal(1));
            frame.getlocal(0).__setattr__("args", new PyTuple(new PyObject[] {frame.getlocal(1)}));
            return Py.None;
        }
        
        private static PyObject SMTPRecipientsRefused$8(PyFrame frame) {
            /* All recipient addresses refused.
                The errors for each recipient are accessible through the attribute
                'recipients', which is a dictionary of exactly the same sort as
                SMTP.sendmail() returns.
                 */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$6___init__));
            return frame.getf_locals();
        }
        
        private static PyObject SMTPDataError$9(PyFrame frame) {
            /* The SMTP server didn't accept the data. */
            return frame.getf_locals();
        }
        
        private static PyObject SMTPConnectError$10(PyFrame frame) {
            /* Error during connection establishment. */
            return frame.getf_locals();
        }
        
        private static PyObject SMTPHeloError$11(PyFrame frame) {
            /* The server refused our HELO reply. */
            return frame.getf_locals();
        }
        
        private static PyObject quoteaddr$12(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Quote a subset of the email addresses defined by RFC 821.
            
                Should be able to handle anything rfc822.parseaddr can handle.
                 */
            frame.setlocal(1, frame.getglobal("None"));
            try {
                frame.setlocal(1, frame.getglobal("rfc822").__getattr__("parseaddr").__call__(frame.getlocal(0)).__getitem__(i$23));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("AttributeError"))) {
                    // pass
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(1).__not__().__nonzero__()) {
                return frame.getlocal(0);
            }
            else {
                return s$24._mod(frame.getlocal(1));
            }
        }
        
        private static PyObject quotedata$13(PyFrame frame) {
            /* Quote data for email.
            
                Double leading '.', and change Unix newline '\n', or Mac '\r' into
                Internet CRLF end-of-line.
                 */
            return frame.getglobal("re").__getattr__("sub").__call__(s$26, s$27, frame.getglobal("re").__getattr__("sub").__call__(s$28, frame.getglobal("CRLF"), frame.getlocal(0)));
        }
        
        private static PyObject __init__$14(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Initialize a new instance.
            
                    If specified, `host' is the name of the remote host to which to
                    connect.  If specified, `port' specifies the port to which to connect.
                    By default, smtplib.SMTP_PORT is used.  An SMTPConnectError is raised
                    if the specified `host' doesn't respond correctly.
            
                     */
            frame.getlocal(0).__setattr__("esmtp_features", new PyDictionary(new PyObject[] {}));
            if (frame.getlocal(1).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("connect", frame.getlocal(1), frame.getlocal(2)), 2);
                frame.setlocal(3, t$0$PyObject__[0]);
                frame.setlocal(4, t$0$PyObject__[1]);
                if (frame.getlocal(3)._ne(i$32).__nonzero__()) {
                    throw Py.makeException(frame.getglobal("SMTPConnectError").__call__(frame.getlocal(3), frame.getlocal(4)));
                }
            }
            return Py.None;
        }
        
        private static PyObject set_debuglevel$15(PyFrame frame) {
            /* Set the debug output level.
            
                    A non-false value results in debug messages for connection and for all
                    messages sent to and received from the server.
            
                     */
            frame.getlocal(0).__setattr__("debuglevel", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject connect$16(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            
            // Code
            /* Connect to a host on a given port.
            
                    If the hostname ends with a colon (`:') followed by a number, and
                    there is no port specified, that suffix will be stripped off and the
                    number interpreted as the port number to use.
            
                    Note: This method is automatically invoked by __init__, if a host is
                    specified during instantiation.
            
                     */
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(5, frame.getlocal(1).invoke("find", s$36));
                if (frame.getlocal(5)._ge(i$30).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(null, frame.getlocal(5), null), frame.getlocal(1).__getslice__(frame.getlocal(5)._add(i$23), null, null)}), 2);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(2, t$0$PyObject__[1]);
                    try {
                        frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(2)));
                    }
                    catch (Throwable x$0) {
                        t$0$PyException = Py.setException(x$0, frame);
                        if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                            throw Py.makeException(frame.getglobal("socket").__getattr__("error"), s$37);
                        }
                        else throw t$0$PyException;
                    }
                }
            }
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(2, frame.getglobal("SMTP_PORT"));
            }
            frame.getlocal(0).__setattr__("sock", frame.getglobal("socket").__getattr__("socket").__call__(frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                Py.printComma(s$38);
                Py.println(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)}));
            }
            try {
                frame.getlocal(0).__getattr__("sock").invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)}));
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("error"))) {
                    frame.getlocal(0).invoke("close");
                    throw Py.makeException();
                }
                else throw t$0$PyException;
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("getreply"), 2);
            frame.setlocal(3, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                Py.printComma(s$38);
                Py.println(frame.getlocal(4));
            }
            return new PyTuple(new PyObject[] {frame.getlocal(3), frame.getlocal(4)});
        }
        
        private static PyObject send$17(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Send `str' to the server. */
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                Py.printComma(s$41);
                Py.println(frame.getlocal(1).__repr__());
            }
            if (frame.getlocal(0).__getattr__("sock").__nonzero__()) {
                try {
                    frame.setlocal(2, i$30);
                    while (frame.getlocal(2)._lt(frame.getglobal("len").__call__(frame.getlocal(1))).__nonzero__()) {
                        frame.setlocal(2, frame.getlocal(2)._add(frame.getlocal(0).__getattr__("sock").invoke("send", frame.getlocal(1).__getslice__(frame.getlocal(2), null, null))));
                    }
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("error"))) {
                        throw Py.makeException(frame.getglobal("SMTPServerDisconnected").__call__(s$42));
                    }
                    else throw t$0$PyException;
                }
            }
            else {
                throw Py.makeException(frame.getglobal("SMTPServerDisconnected").__call__(s$43));
            }
            return Py.None;
        }
        
        private static PyObject putcmd$18(PyFrame frame) {
            /* Send a command to the server. */
            if (frame.getlocal(2)._eq(s$33).__nonzero__()) {
                frame.setlocal(3, s$45._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getglobal("CRLF")})));
            }
            else {
                frame.setlocal(3, s$46._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getglobal("CRLF")})));
            }
            frame.getlocal(0).invoke("send", frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject getreply$19(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Get a reply from the server.
            
                    Returns a tuple consisting of:
            
                      - server response code (e.g. '250', or such, if all goes well)
                        Note: returns -1 if it can't read response code.
            
                      - server response string corresponding to response code (multiline
                        responses are converted to a single, multiline string).
            
                    Raises SMTPServerDisconnected if end-of-file is reached.
                     */
            frame.setlocal(3, new PyList(new PyObject[] {}));
            if (frame.getlocal(0).__getattr__("file")._is(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(0).__setattr__("file", frame.getlocal(0).__getattr__("sock").invoke("makefile", s$48));
            }
            while (i$23.__nonzero__()) {
                frame.setlocal(5, frame.getlocal(0).__getattr__("file").invoke("readline"));
                if (frame.getlocal(5)._eq(s$33).__nonzero__()) {
                    frame.getlocal(0).invoke("close");
                    throw Py.makeException(frame.getglobal("SMTPServerDisconnected").__call__(s$49));
                }
                if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                    Py.printComma(s$50);
                    Py.println(frame.getlocal(5).__repr__());
                }
                frame.getlocal(3).invoke("append", frame.getlocal(5).__getslice__(i$51, null, null).invoke("strip"));
                frame.setlocal(2, frame.getlocal(5).__getslice__(null, i$52, null));
                try {
                    frame.setlocal(1, frame.getglobal("int").__call__(frame.getlocal(2)));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                        frame.setlocal(1, i$23.__neg__());
                        break;
                    }
                    else throw t$0$PyException;
                }
                if (frame.getlocal(5).__getslice__(i$52, i$51, null)._ne(s$53).__nonzero__()) {
                    break;
                }
            }
            frame.setlocal(4, s$54.invoke("join", frame.getlocal(3)));
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                Py.println(s$55._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(4)})));
            }
            return new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(4)});
        }
        
        private static PyObject docmd$20(PyFrame frame) {
            /* Send a command, and return its response code. */
            frame.getlocal(0).invoke("putcmd", frame.getlocal(1), frame.getlocal(2));
            return frame.getlocal(0).invoke("getreply");
        }
        
        private static PyObject helo$21(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* SMTP 'helo' command.
                    Hostname to send for this command defaults to the FQDN of the local
                    host.
                     */
            if (frame.getlocal(1).__nonzero__()) {
                frame.getlocal(0).invoke("putcmd", s$58, frame.getlocal(1));
            }
            else {
                frame.getlocal(0).invoke("putcmd", s$58, frame.getglobal("socket").__getattr__("getfqdn").__call__());
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("getreply"), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(3, t$0$PyObject__[1]);
            frame.getlocal(0).__setattr__("helo_resp", frame.getlocal(3));
            return new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(3)});
        }
        
        private static PyObject ehlo$22(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /*  SMTP 'ehlo' command.
                    Hostname to send for this command defaults to the FQDN of the local
                    host.
                     */
            if (frame.getlocal(1).__nonzero__()) {
                frame.getlocal(0).invoke("putcmd", s$60, frame.getlocal(1));
            }
            else {
                frame.getlocal(0).invoke("putcmd", s$60, frame.getglobal("socket").__getattr__("getfqdn").__call__());
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("getreply"), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(3, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(2)._eq(i$23.__neg__())).__nonzero__() ? frame.getglobal("len").__call__(frame.getlocal(3))._eq(i$30) : t$0$PyObject).__nonzero__()) {
                throw Py.makeException(frame.getglobal("SMTPServerDisconnected").__call__(s$42));
            }
            frame.getlocal(0).__setattr__("ehlo_resp", frame.getlocal(3));
            if (frame.getlocal(2)._ne(i$61).__nonzero__()) {
                return new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(3)});
            }
            frame.getlocal(0).__setattr__("does_esmtp", i$23);
            frame.setlocal(6, frame.getlocal(0).__getattr__("ehlo_resp").invoke("split", s$54));
            frame.getlocal(6).__delitem__(i$30);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(6);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(7, t$0$PyObject);
                frame.setlocal(4, frame.getglobal("re").__getattr__("match").__call__(s$62, frame.getlocal(7)));
                if (frame.getlocal(4).__nonzero__()) {
                    frame.setlocal(8, frame.getlocal(4).invoke("group", s$63).invoke("lower"));
                    frame.setlocal(5, frame.getlocal(4).__getattr__("string").__getslice__(frame.getlocal(4).invoke("end", s$63), null, null).invoke("strip"));
                    frame.getlocal(0).__getattr__("esmtp_features").__setitem__(frame.getlocal(8), frame.getlocal(5));
                }
            }
            return new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(3)});
        }
        
        private static PyObject has_extn$23(PyFrame frame) {
            /* Does the server support a given SMTP service extension? */
            return frame.getlocal(0).__getattr__("esmtp_features").invoke("has_key", frame.getlocal(1).invoke("lower"));
        }
        
        private static PyObject help$24(PyFrame frame) {
            /* SMTP 'help' command.
                    Returns help text from server. */
            frame.getlocal(0).invoke("putcmd", s$66, frame.getlocal(1));
            return frame.getlocal(0).invoke("getreply");
        }
        
        private static PyObject rset$25(PyFrame frame) {
            /* SMTP 'rset' command -- resets session. */
            return frame.getlocal(0).invoke("docmd", s$68);
        }
        
        private static PyObject noop$26(PyFrame frame) {
            /* SMTP 'noop' command -- doesn't do anything :> */
            return frame.getlocal(0).invoke("docmd", s$70);
        }
        
        private static PyObject mail$27(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* SMTP 'mail' command -- begins mail xfer session. */
            frame.setlocal(3, s$33);
            if (((t$0$PyObject = frame.getlocal(2)).__nonzero__() ? frame.getlocal(0).__getattr__("does_esmtp") : t$0$PyObject).__nonzero__()) {
                frame.setlocal(3, s$72._add(s$72.invoke("join", frame.getlocal(2))));
            }
            frame.getlocal(0).invoke("putcmd", s$73, s$74._mod(new PyTuple(new PyObject[] {frame.getglobal("quoteaddr").__call__(frame.getlocal(1)), frame.getlocal(3)})));
            return frame.getlocal(0).invoke("getreply");
        }
        
        private static PyObject rcpt$28(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* SMTP 'rcpt' command -- indicates 1 recipient for this mail. */
            frame.setlocal(3, s$33);
            if (((t$0$PyObject = frame.getlocal(2)).__nonzero__() ? frame.getlocal(0).__getattr__("does_esmtp") : t$0$PyObject).__nonzero__()) {
                frame.setlocal(3, s$72._add(s$72.invoke("join", frame.getlocal(2))));
            }
            frame.getlocal(0).invoke("putcmd", s$76, s$77._mod(new PyTuple(new PyObject[] {frame.getglobal("quoteaddr").__call__(frame.getlocal(1)), frame.getlocal(3)})));
            return frame.getlocal(0).invoke("getreply");
        }
        
        private static PyObject data$29(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* SMTP 'DATA' command -- sends message data to server.
            
                    Automatically quotes lines beginning with a period per rfc821.
                    Raises SMTPDataError if there is an unexpected reply to the
                    DATA command; the return value from this method is the final
                    response code received when the all data is sent.
                     */
            frame.getlocal(0).invoke("putcmd", s$79);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("getreply"), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                Py.printComma(s$80);
                Py.println(new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(4)}));
            }
            if (frame.getlocal(2)._ne(i$81).__nonzero__()) {
                throw Py.makeException(frame.getglobal("SMTPDataError").__call__(frame.getlocal(2), frame.getlocal(4)));
            }
            else {
                frame.setlocal(3, frame.getglobal("quotedata").__call__(frame.getlocal(1)));
                if (frame.getlocal(3).__getslice__(i$82.__neg__(), null, null)._ne(frame.getglobal("CRLF")).__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(3)._add(frame.getglobal("CRLF")));
                }
                frame.setlocal(3, frame.getlocal(3)._add(s$83)._add(frame.getglobal("CRLF")));
                frame.getlocal(0).invoke("send", frame.getlocal(3));
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("getreply"), 2);
                frame.setlocal(2, t$0$PyObject__[0]);
                frame.setlocal(1, t$0$PyObject__[1]);
                if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$30).__nonzero__()) {
                    Py.printComma(s$80);
                    Py.println(new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(1)}));
                }
                return new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(1)});
            }
        }
        
        private static PyObject verify$30(PyFrame frame) {
            /* SMTP 'verify' command -- checks for address validity. */
            frame.getlocal(0).invoke("putcmd", s$85, frame.getglobal("quoteaddr").__call__(frame.getlocal(1)));
            return frame.getlocal(0).invoke("getreply");
        }
        
        private static PyObject expn$31(PyFrame frame) {
            /* SMTP 'verify' command -- checks for address validity. */
            frame.getlocal(0).invoke("putcmd", s$86, frame.getglobal("quoteaddr").__call__(frame.getlocal(1)));
            return frame.getlocal(0).invoke("getreply");
        }
        
        private static PyObject sendmail$32(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject;
            
            // Code
            /* This command performs an entire mail transaction.
            
                    The arguments are:
                        - from_addr    : The address sending this mail.
                        - to_addrs     : A list of addresses to send this mail to.  A bare
                                         string will be treated as a list with 1 address.
                        - msg          : The message to send.
                        - mail_options : List of ESMTP options (such as 8bitmime) for the
                                         mail command.
                        - rcpt_options : List of ESMTP options (such as DSN commands) for
                                         all the rcpt commands.
            
                    If there has been no previous EHLO or HELO command this session, this
                    method tries ESMTP EHLO first.  If the server does ESMTP, message size
                    and each of the specified options will be passed to it.  If EHLO
                    fails, HELO will be tried and ESMTP options suppressed.
            
                    This method will return normally if the mail is accepted for at least
                    one recipient.  It returns a dictionary, with one entry for each
                    recipient that was refused.  Each entry contains a tuple of the SMTP
                    error code and the accompanying error message sent by the server.
            
                    This method may raise the following exceptions:
            
                     SMTPHeloError          The server didn't reply properly to
                                            the helo greeting.
                     SMTPRecipientsRefused  The server rejected ALL recipients
                                            (no mail was sent).
                     SMTPSenderRefused      The server didn't accept the from_addr.
                     SMTPDataError          The server replied with an unexpected
                                            error code (other than a refusal of
                                            a recipient).
            
                    Note: the connection will be open even after an exception is raised.
            
                    Example:
            
                     >>> import smtplib
                     >>> s=smtplib.SMTP("localhost")
                     >>> tolist=["one@one.org","two@two.org","three@three.org","four@four.org"]
                     >>> msg = '''
                     ... From: Me@my.org
                     ... Subject: testin'...
                     ...
                     ... This is a test '''
                     >>> s.sendmail("me@my.org",tolist,msg)
                     { "three@three.org" : ( 550 ,"User unknown" ) }
                     >>> s.quit()
            
                    In the above example, the message was accepted for delivery to three
                    of the four addresses, and one was rejected, with the error code
                    550.  If all addresses are accepted, then the method will return an
                    empty dictionary.
            
                     */
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("helo_resp")._is(frame.getglobal("None"))).__nonzero__() ? frame.getlocal(0).__getattr__("ehlo_resp")._is(frame.getglobal("None")) : t$0$PyObject).__nonzero__()) {
                if ((i$88._le(t$0$PyObject = frame.getlocal(0).invoke("ehlo").__getitem__(i$30)).__nonzero__() ? t$0$PyObject._le(i$89) : Py.Zero).__not__().__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("helo"), 2);
                    frame.setlocal(6, t$0$PyObject__[0]);
                    frame.setlocal(11, t$0$PyObject__[1]);
                    if ((i$88._le(t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject._le(i$89) : Py.Zero).__not__().__nonzero__()) {
                        throw Py.makeException(frame.getglobal("SMTPHeloError").__call__(frame.getlocal(6), frame.getlocal(11)));
                    }
                }
            }
            frame.setlocal(8, new PyList(new PyObject[] {}));
            if (frame.getlocal(0).__getattr__("does_esmtp").__nonzero__()) {
                if (frame.getlocal(0).invoke("has_extn", s$90).__nonzero__()) {
                    frame.getlocal(8).invoke("append", s$91._add(frame.getglobal("len").__call__(frame.getlocal(3)).__repr__()));
                }
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(4);
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(9, t$0$PyObject);
                    frame.getlocal(8).invoke("append", frame.getlocal(9));
                }
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("mail", frame.getlocal(1), frame.getlocal(8)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(11, t$0$PyObject__[1]);
            if (frame.getlocal(6)._ne(i$61).__nonzero__()) {
                frame.getlocal(0).invoke("rset");
                throw Py.makeException(frame.getglobal("SMTPSenderRefused").__call__(frame.getlocal(6), frame.getlocal(11), frame.getlocal(1)));
            }
            frame.setlocal(10, new PyDictionary(new PyObject[] {}));
            if (frame.getglobal("type").__call__(frame.getlocal(2))._eq(frame.getglobal("types").__getattr__("StringType")).__nonzero__()) {
                frame.setlocal(2, new PyList(new PyObject[] {frame.getlocal(2)}));
            }
            t$1$int = 0;
            t$3$PyObject = frame.getlocal(2);
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                frame.setlocal(7, t$2$PyObject);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("rcpt", frame.getlocal(7), frame.getlocal(5)), 2);
                frame.setlocal(6, t$0$PyObject__[0]);
                frame.setlocal(11, t$0$PyObject__[1]);
                if (((t$4$PyObject = frame.getlocal(6)._ne(i$61)).__nonzero__() ? frame.getlocal(6)._ne(i$92) : t$4$PyObject).__nonzero__()) {
                    frame.getlocal(10).__setitem__(frame.getlocal(7), new PyTuple(new PyObject[] {frame.getlocal(6), frame.getlocal(11)}));
                }
            }
            if (frame.getglobal("len").__call__(frame.getlocal(10))._eq(frame.getglobal("len").__call__(frame.getlocal(2))).__nonzero__()) {
                frame.getlocal(0).invoke("rset");
                throw Py.makeException(frame.getglobal("SMTPRecipientsRefused").__call__(frame.getlocal(10)));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("data", frame.getlocal(3)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(11, t$0$PyObject__[1]);
            if (frame.getlocal(6)._ne(i$61).__nonzero__()) {
                frame.getlocal(0).invoke("rset");
                throw Py.makeException(frame.getglobal("SMTPDataError").__call__(frame.getlocal(6), frame.getlocal(11)));
            }
            return frame.getlocal(10);
        }
        
        private static PyObject close$33(PyFrame frame) {
            /* Close the connection to the SMTP server. */
            if (frame.getlocal(0).__getattr__("file").__nonzero__()) {
                frame.getlocal(0).__getattr__("file").invoke("close");
            }
            frame.getlocal(0).__setattr__("file", frame.getglobal("None"));
            if (frame.getlocal(0).__getattr__("sock").__nonzero__()) {
                frame.getlocal(0).__getattr__("sock").invoke("close");
            }
            frame.getlocal(0).__setattr__("sock", frame.getglobal("None"));
            return Py.None;
        }
        
        private static PyObject quit$34(PyFrame frame) {
            /* Terminate the SMTP session. */
            frame.getlocal(0).invoke("docmd", s$95);
            frame.getlocal(0).invoke("close");
            return Py.None;
        }
        
        private static PyObject SMTP$35(PyFrame frame) {
            /* This class manages a connection to an SMTP or ESMTP server.
                SMTP Objects:
                    SMTP objects have the following attributes:
                        helo_resp
                            This is the message given by the server in response to the
                            most recent HELO command.
            
                        ehlo_resp
                            This is the message given by the server in response to the
                            most recent EHLO command. This is usually multiline.
            
                        does_esmtp
                            This is a True value _after you do an EHLO command_, if the
                            server supports ESMTP.
            
                        esmtp_features
                            This is a dictionary, which, if the server supports ESMTP,
                            will _after you do an EHLO command_, contain the names of the
                            SMTP service extensions this server supports, and their
                            parameters (if any).
            
                            Note, all extension names are mapped to lower case in the
                            dictionary.
            
                    See each method's docstrings for details.  In general, there is a
                    method of the same name to perform each SMTP command.  There is also a
                    method called 'sendmail' that will do an entire mail transaction.
                     */
            frame.setlocal("debuglevel", i$30);
            frame.setlocal("file", frame.getname("None"));
            frame.setlocal("helo_resp", frame.getname("None"));
            frame.setlocal("ehlo_resp", frame.getname("None"));
            frame.setlocal("does_esmtp", i$30);
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$33, i$30}, c$13___init__));
            frame.setlocal("set_debuglevel", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_set_debuglevel));
            frame.setlocal("connect", new PyFunction(frame.f_globals, new PyObject[] {s$39, i$30}, c$15_connect));
            frame.setlocal("send", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_send));
            frame.setlocal("putcmd", new PyFunction(frame.f_globals, new PyObject[] {s$33}, c$17_putcmd));
            frame.setlocal("getreply", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_getreply));
            frame.setlocal("docmd", new PyFunction(frame.f_globals, new PyObject[] {s$33}, c$19_docmd));
            frame.setlocal("helo", new PyFunction(frame.f_globals, new PyObject[] {s$33}, c$20_helo));
            frame.setlocal("ehlo", new PyFunction(frame.f_globals, new PyObject[] {s$33}, c$21_ehlo));
            frame.setlocal("has_extn", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_has_extn));
            frame.setlocal("help", new PyFunction(frame.f_globals, new PyObject[] {s$33}, c$23_help));
            frame.setlocal("rset", new PyFunction(frame.f_globals, new PyObject[] {}, c$24_rset));
            frame.setlocal("noop", new PyFunction(frame.f_globals, new PyObject[] {}, c$25_noop));
            frame.setlocal("mail", new PyFunction(frame.f_globals, new PyObject[] {new PyList(new PyObject[] {})}, c$26_mail));
            frame.setlocal("rcpt", new PyFunction(frame.f_globals, new PyObject[] {new PyList(new PyObject[] {})}, c$27_rcpt));
            frame.setlocal("data", new PyFunction(frame.f_globals, new PyObject[] {}, c$28_data));
            frame.setlocal("verify", new PyFunction(frame.f_globals, new PyObject[] {}, c$29_verify));
            frame.setlocal("vrfy", frame.getname("verify"));
            frame.setlocal("expn", new PyFunction(frame.f_globals, new PyObject[] {}, c$30_expn));
            frame.setlocal("sendmail", new PyFunction(frame.f_globals, new PyObject[] {new PyList(new PyObject[] {}), new PyList(new PyObject[] {})}, c$31_sendmail));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$32_close));
            frame.setlocal("quit", new PyFunction(frame.f_globals, new PyObject[] {}, c$33_quit));
            return frame.getf_locals();
        }
        
        private static PyObject prompt$36(PyFrame frame) {
            frame.getglobal("sys").__getattr__("stdout").__getattr__("write").__call__(frame.getlocal(0)._add(s$97));
            return frame.getglobal("sys").__getattr__("stdin").__getattr__("readline").__call__().invoke("strip");
        }
        
        private static PyObject main$37(PyFrame frame) {
            frame.setglobal("__file__", s$103);
            
            /* SMTP/ESMTP client class.
            
            This should follow RFC 821 (SMTP) and RFC 1869 (ESMTP).
            
            Notes:
            
            Please remember, when doing ESMTP, that the names of the SMTP service
            extensions are NOT the same thing as the option keywords for the RCPT
            and MAIL commands!
            
            Example:
            
              >>> import smtplib
              >>> s=smtplib.SMTP("localhost")
              >>> print s.help()
              This is Sendmail version 8.8.4
              Topics:
                  HELO    EHLO    MAIL    RCPT    DATA
                  RSET    NOOP    QUIT    HELP    VRFY
                  EXPN    VERB    ETRN    DSN
              For more info use "HELP <topic>".
              To report bugs in the implementation send email to
                  sendmail-bugs@sendmail.org.
              For local information send email to Postmaster at your site.
              End of HELP info
              >>> s.putcmd("vrfy","someone@here")
              >>> s.getreply()
              (250, "Somebody OverHere <somebody@here.my.org>")
              >>> s.quit()
             */
            frame.setlocal("socket", org.python.core.imp.importOne("socket", frame));
            frame.setlocal("re", org.python.core.imp.importOne("re", frame));
            frame.setlocal("rfc822", org.python.core.imp.importOne("rfc822", frame));
            frame.setlocal("types", org.python.core.imp.importOne("types", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4, s$5, s$6, s$7, s$8, s$9, s$10, s$11}));
            frame.setlocal("SMTP_PORT", i$12);
            frame.setlocal("CRLF", s$13);
            frame.setlocal("SMTPException", Py.makeClass("SMTPException", new PyObject[] {frame.getname("Exception")}, c$0_SMTPException, null));
            frame.setlocal("SMTPServerDisconnected", Py.makeClass("SMTPServerDisconnected", new PyObject[] {frame.getname("SMTPException")}, c$1_SMTPServerDisconnected, null));
            frame.setlocal("SMTPResponseException", Py.makeClass("SMTPResponseException", new PyObject[] {frame.getname("SMTPException")}, c$3_SMTPResponseException, null));
            frame.setlocal("SMTPSenderRefused", Py.makeClass("SMTPSenderRefused", new PyObject[] {frame.getname("SMTPResponseException")}, c$5_SMTPSenderRefused, null));
            frame.setlocal("SMTPRecipientsRefused", Py.makeClass("SMTPRecipientsRefused", new PyObject[] {frame.getname("SMTPException")}, c$7_SMTPRecipientsRefused, null));
            frame.setlocal("SMTPDataError", Py.makeClass("SMTPDataError", new PyObject[] {frame.getname("SMTPResponseException")}, c$8_SMTPDataError, null));
            frame.setlocal("SMTPConnectError", Py.makeClass("SMTPConnectError", new PyObject[] {frame.getname("SMTPResponseException")}, c$9_SMTPConnectError, null));
            frame.setlocal("SMTPHeloError", Py.makeClass("SMTPHeloError", new PyObject[] {frame.getname("SMTPResponseException")}, c$10_SMTPHeloError, null));
            frame.setlocal("quoteaddr", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_quoteaddr));
            frame.setlocal("quotedata", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_quotedata));
            frame.setlocal("SMTP", Py.makeClass("SMTP", new PyObject[] {}, c$34_SMTP, null));
            if (frame.getname("__name__")._eq(s$96).__nonzero__()) {
                frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
                frame.setlocal("rfc822", org.python.core.imp.importOne("rfc822", frame));
                frame.setlocal("prompt", new PyFunction(frame.f_globals, new PyObject[] {}, c$35_prompt));
                frame.setlocal("fromaddr", frame.getname("prompt").__call__(s$98));
                frame.setlocal("toaddrs", frame.getname("prompt").__call__(s$99).invoke("split", s$100));
                Py.println(s$101);
                frame.setlocal("msg", s$33);
                while (i$23.__nonzero__()) {
                    frame.setlocal("line", frame.getname("sys").__getattr__("stdin").__getattr__("readline").__call__());
                    if (frame.getname("line").__not__().__nonzero__()) {
                        break;
                    }
                    frame.setlocal("msg", frame.getname("msg")._add(frame.getname("line")));
                }
                Py.println(s$102._add(frame.getname("len").__call__(frame.getname("msg")).__repr__()));
                frame.setlocal("server", frame.getname("SMTP").__call__(s$39));
                frame.getname("server").invoke("set_debuglevel", i$23);
                frame.getname("server").invoke("sendmail", new PyObject[] {frame.getname("fromaddr"), frame.getname("toaddrs"), frame.getname("msg")});
                frame.getname("server").invoke("quit");
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("smtplib"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "smtplib";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(smtplib._PyInner.class, newargs, smtplib.jpy$packages, smtplib.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
