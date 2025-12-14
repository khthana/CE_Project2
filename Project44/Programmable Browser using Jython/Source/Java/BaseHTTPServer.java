import org.python.core.*;

public class BaseHTTPServer extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject s$3;
        private static PyObject s$4;
        private static PyObject i$5;
        private static PyObject s$6;
        private static PyObject s$7;
        private static PyObject s$8;
        private static PyObject i$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject i$13;
        private static PyObject s$14;
        private static PyObject s$15;
        private static PyObject i$16;
        private static PyObject i$17;
        private static PyObject s$18;
        private static PyObject i$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject s$22;
        private static PyObject s$23;
        private static PyObject s$24;
        private static PyObject s$25;
        private static PyObject i$26;
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
        private static PyObject s$56;
        private static PyObject s$57;
        private static PyObject s$58;
        private static PyObject s$59;
        private static PyObject s$60;
        private static PyObject s$61;
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
        private static PyObject i$75;
        private static PyObject s$76;
        private static PyObject s$77;
        private static PyObject i$78;
        private static PyObject s$79;
        private static PyObject s$80;
        private static PyObject i$81;
        private static PyObject s$82;
        private static PyObject s$83;
        private static PyObject i$84;
        private static PyObject s$85;
        private static PyObject s$86;
        private static PyObject i$87;
        private static PyObject s$88;
        private static PyObject s$89;
        private static PyObject i$90;
        private static PyObject s$91;
        private static PyObject s$92;
        private static PyObject i$93;
        private static PyObject s$94;
        private static PyObject s$95;
        private static PyObject i$96;
        private static PyObject s$97;
        private static PyObject s$98;
        private static PyObject i$99;
        private static PyObject s$100;
        private static PyObject s$101;
        private static PyObject s$102;
        private static PyObject s$103;
        private static PyObject i$104;
        private static PyObject s$105;
        private static PyObject s$106;
        private static PyObject i$107;
        private static PyObject s$108;
        private static PyObject s$109;
        private static PyObject i$110;
        private static PyObject s$111;
        private static PyObject s$112;
        private static PyObject i$113;
        private static PyObject s$114;
        private static PyObject s$115;
        private static PyObject i$116;
        private static PyObject s$117;
        private static PyObject s$118;
        private static PyObject s$119;
        private static PyObject s$120;
        private static PyObject i$121;
        private static PyObject s$122;
        private static PyObject s$123;
        private static PyObject i$124;
        private static PyObject s$125;
        private static PyObject s$126;
        private static PyObject s$127;
        private static PyObject i$128;
        private static PyObject s$129;
        private static PyObject s$130;
        private static PyObject s$131;
        private static PyObject s$132;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_server_bind;
        private static PyCode c$1_HTTPServer;
        private static PyCode c$2_parse_request;
        private static PyCode c$3_handle;
        private static PyCode c$4_send_error;
        private static PyCode c$5_send_response;
        private static PyCode c$6_send_header;
        private static PyCode c$7_end_headers;
        private static PyCode c$8_log_request;
        private static PyCode c$9_log_error;
        private static PyCode c$10_log_message;
        private static PyCode c$11_version_string;
        private static PyCode c$12_date_time_string;
        private static PyCode c$13_log_date_time_string;
        private static PyCode c$14_address_string;
        private static PyCode c$15_BaseHTTPRequestHandler;
        private static PyCode c$16_test;
        private static PyCode c$17_main;
        private static void initConstants() {
            s$0 = Py.newString("HTTP server base class.\012\012Note: the class in this module doesn't implement any HTTP request; see\012SimpleHTTPServer for simple implementations of GET, HEAD and POST\012(including CGI scripts).\012\012Contents:\012\012- BaseHTTPRequestHandler: HTTP request handler base class\012- test: test function\012\012XXX To do:\012\012- send server version\012- log requests even later (to capture byte count)\012- log user-agent header and other interesting goodies\012- send error log to separate file\012- are request names really case sensitive?\012\012");
            s$1 = Py.newString("0.2");
            s$2 = Py.newString("HTTPServer");
            s$3 = Py.newString("BaseHTTPRequestHandler");
            s$4 = Py.newString("<head>\012<title>Error response</title>\012</head>\012<body>\012<h1>Error response</h1>\012<p>Error code %(code)d.\012<p>Message: %(message)s.\012<p>Error code explanation: %(code)s = %(explain)s.\012</body>\012");
            i$5 = Py.newInteger(1);
            s$6 = Py.newString("Override server_bind to store the server name.");
            s$7 = Py.newString("HTTP request handler base class.\012\012    The following explanation of HTTP serves to guide you through the\012    code as well as to expose any misunderstandings I may have about\012    HTTP (so you don't need to read the code to figure out I'm wrong\012    :-).\012\012    HTTP (HyperText Transfer Protocol) is an extensible protocol on\012    top of a reliable stream transport (e.g. TCP/IP).  The protocol\012    recognizes three parts to a request:\012\012    1. One line identifying the request type and path\012    2. An optional set of RFC-822-style headers\012    3. An optional data part\012\012    The headers and data are separated by a blank line.\012\012    The first line of the request has the form\012\012    <command> <path> <version>\012\012    where <command> is a (case-sensitive) keyword such as GET or POST,\012    <path> is a string containing path information for the request,\012    and <version> should be the string \"HTTP/1.0\".  <path> is encoded\012    using the URL encoding scheme (using %xx to signify the ASCII\012    character with hex code xx).\012\012    The protocol is vague about whether lines are separated by LF\012    characters or by CRLF pairs -- for compatibility with the widest\012    range of clients, both should be accepted.  Similarly, whitespace\012    in the request line should be treated sensibly (allowing multiple\012    spaces between components and allowing trailing whitespace).\012\012    Similarly, for output, lines ought to be separated by CRLF pairs\012    but most clients grok LF characters just fine.\012\012    If the first line of the request has the form\012\012    <command> <path>\012\012    (i.e. <version> is left out) then this is assumed to be an HTTP\012    0.9 request; this form has no optional headers and data part and\012    the reply consists of just the data.\012\012    The reply form of the HTTP 1.0 protocol again has three parts:\012\012    1. One line giving the response code\012    2. An optional set of RFC-822-style headers\012    3. The data\012\012    Again, the headers and data are separated by a blank line.\012\012    The response code line has the form\012\012    <version> <responsecode> <responsestring>\012\012    where <version> is the protocol version (always \"HTTP/1.0\"),\012    <responsecode> is a 3-digit response code indicating success or\012    failure of the request, and <responsestring> is an optional\012    human-readable string explaining what the response code means.\012\012    This server parses the request and the headers, and then calls a\012    function specific to the request type (<command>).  Specifically,\012    a request SPAM will be handled by a method do_SPAM().  If no\012    such method exists the server sends an error response to the\012    client.  If it exists, it is called with no arguments:\012\012    do_SPAM()\012\012    Note that the request name is case sensitive (i.e. SPAM and spam\012    are different requests).\012\012    The various request details are stored in instance variables:\012\012    - client_address is the client IP address in the form (host,\012    port);\012\012    - command, path and version are the broken-down request line;\012\012    - headers is an instance of mimetools.Message (or a derived\012    class) containing the header information;\012\012    - rfile is a file object open for reading positioned at the\012    start of the optional input data part;\012\012    - wfile is a file object open for writing.\012\012    IT IS IMPORTANT TO ADHERE TO THE PROTOCOL FOR WRITING!\012\012    The first thing to be written must be the response line.  Then\012    follow 0 or more header lines, then a blank line, and then the\012    actual data (if any).  The meaning of the header lines depends on\012    the command executed by the server; in most cases, when data is\012    returned, there should be at least one header line of the form\012\012    Content-type: <type>/<subtype>\012\012    where <type> and <subtype> should be registered MIME types,\012    e.g. \"text/html\" or \"text/plain\".\012\012    ");
            s$8 = Py.newString("Python/");
            i$9 = Py.newInteger(0);
            s$10 = Py.newString("BaseHTTP/");
            s$11 = Py.newString("Parse a request (internal).\012\012        The request should be stored in self.raw_request; the results\012        are in self.command, self.path, self.request_version and\012        self.headers.\012\012        Return value is 1 for success, 0 for failure; on failure, an\012        error is sent back.\012\012        ");
            s$12 = Py.newString("HTTP/0.9");
            i$13 = Py.newInteger(2);
            s$14 = Py.newString("\015\012");
            s$15 = Py.newString("\012");
            i$16 = Py.newInteger(3);
            i$17 = Py.newInteger(5);
            s$18 = Py.newString("HTTP/");
            i$19 = Py.newInteger(400);
            s$20 = Py.newString("Bad request version (%s)");
            s$21 = Py.newString("GET");
            s$22 = Py.newString("Bad HTTP/0.9 request type (%s)");
            s$23 = Py.newString("Bad request syntax (%s)");
            s$24 = Py.newString("Handle a single HTTP request.\012\012        You normally don't need to override this method; see the class\012        __doc__ string for information on how to handle specific HTTP\012        commands such as GET and POST.\012\012        ");
            s$25 = Py.newString("do_");
            i$26 = Py.newInteger(501);
            s$27 = Py.newString("Unsupported method (%s)");
            s$28 = Py.newString("Send and log an error reply.\012\012        Arguments are the error code, and a detailed message.\012        The detailed message defaults to the short entry matching the\012        response code.\012\012        This sends an error response (so it must be called before any\012        output has been generated), logs the error, and finally sends\012        a piece of HTML explaining the error to the user.\012\012        ");
            s$29 = Py.newString("???");
            s$30 = Py.newString("code %d, message %s");
            s$31 = Py.newString("code");
            s$32 = Py.newString("message");
            s$33 = Py.newString("explain");
            s$34 = Py.newString("Send the response header and log the response code.\012\012        Also send two standard headers with the server software\012        version and the current date.\012\012        ");
            s$35 = Py.newString("");
            s$36 = Py.newString("%s %s %s\015\012");
            s$37 = Py.newString("Server");
            s$38 = Py.newString("Date");
            s$39 = Py.newString("Send a MIME header.");
            s$40 = Py.newString("%s: %s\015\012");
            s$41 = Py.newString("Send the blank line ending the MIME headers.");
            s$42 = Py.newString("Log an accepted request.\012\012        This is called by send_reponse().\012\012        ");
            s$43 = Py.newString("\"%s\" %s %s");
            s$44 = Py.newString("-");
            s$45 = Py.newString("Log an error.\012\012        This is called when a request cannot be fulfilled.  By\012        default it passes the message on to log_message().\012\012        Arguments are the same as for log_message().\012\012        XXX This should go to the separate error log.\012\012        ");
            s$46 = Py.newString("Log an arbitrary message.\012\012        This is used by all other logging functions.  Override\012        it if you have specific logging wishes.\012\012        The first argument, FORMAT, is a format string for the\012        message to be logged.  If the format string contains\012        any % escapes requiring parameters, they should be\012        specified as subsequent arguments (it's just like\012        printf!).\012\012        The client host and current date/time are prefixed to\012        every message.\012\012        ");
            s$47 = Py.newString("%s - - [%s] %s\012");
            s$48 = Py.newString("Return the server software version string.");
            s$49 = Py.newString(" ");
            s$50 = Py.newString("Return the current date and time formatted for a message header.");
            s$51 = Py.newString("%s, %02d %3s %4d %02d:%02d:%02d GMT");
            s$52 = Py.newString("Return the current time formatted for logging.");
            s$53 = Py.newString("%02d/%3s/%04d %02d:%02d:%02d");
            s$54 = Py.newString("Mon");
            s$55 = Py.newString("Tue");
            s$56 = Py.newString("Wed");
            s$57 = Py.newString("Thu");
            s$58 = Py.newString("Fri");
            s$59 = Py.newString("Sat");
            s$60 = Py.newString("Sun");
            s$61 = Py.newString("Jan");
            s$62 = Py.newString("Feb");
            s$63 = Py.newString("Mar");
            s$64 = Py.newString("Apr");
            s$65 = Py.newString("May");
            s$66 = Py.newString("Jun");
            s$67 = Py.newString("Jul");
            s$68 = Py.newString("Aug");
            s$69 = Py.newString("Sep");
            s$70 = Py.newString("Oct");
            s$71 = Py.newString("Nov");
            s$72 = Py.newString("Dec");
            s$73 = Py.newString("Return the client address formatted for logging.\012\012        This version looks up the full hostname using gethostbyaddr(),\012        and tries to find a name that contains at least one dot.\012\012        ");
            s$74 = Py.newString("HTTP/1.0");
            i$75 = Py.newInteger(200);
            s$76 = Py.newString("OK");
            s$77 = Py.newString("Request fulfilled, document follows");
            i$78 = Py.newInteger(201);
            s$79 = Py.newString("Created");
            s$80 = Py.newString("Document created, URL follows");
            i$81 = Py.newInteger(202);
            s$82 = Py.newString("Accepted");
            s$83 = Py.newString("Request accepted, processing continues off-line");
            i$84 = Py.newInteger(203);
            s$85 = Py.newString("Partial information");
            s$86 = Py.newString("Request fulfilled from cache");
            i$87 = Py.newInteger(204);
            s$88 = Py.newString("No response");
            s$89 = Py.newString("Request fulfilled, nothing follows");
            i$90 = Py.newInteger(301);
            s$91 = Py.newString("Moved");
            s$92 = Py.newString("Object moved permanently -- see URI list");
            i$93 = Py.newInteger(302);
            s$94 = Py.newString("Found");
            s$95 = Py.newString("Object moved temporarily -- see URI list");
            i$96 = Py.newInteger(303);
            s$97 = Py.newString("Method");
            s$98 = Py.newString("Object moved -- see Method and URL list");
            i$99 = Py.newInteger(304);
            s$100 = Py.newString("Not modified");
            s$101 = Py.newString("Document has not changed singe given time");
            s$102 = Py.newString("Bad request");
            s$103 = Py.newString("Bad request syntax or unsupported method");
            i$104 = Py.newInteger(401);
            s$105 = Py.newString("Unauthorized");
            s$106 = Py.newString("No permission -- see authorization schemes");
            i$107 = Py.newInteger(402);
            s$108 = Py.newString("Payment required");
            s$109 = Py.newString("No payment -- see charging schemes");
            i$110 = Py.newInteger(403);
            s$111 = Py.newString("Forbidden");
            s$112 = Py.newString("Request forbidden -- authorization will not help");
            i$113 = Py.newInteger(404);
            s$114 = Py.newString("Not found");
            s$115 = Py.newString("Nothing matches the given URI");
            i$116 = Py.newInteger(500);
            s$117 = Py.newString("Internal error");
            s$118 = Py.newString("Server got itself in trouble");
            s$119 = Py.newString("Not implemented");
            s$120 = Py.newString("Server does not support this operation");
            i$121 = Py.newInteger(502);
            s$122 = Py.newString("Service temporarily overloaded");
            s$123 = Py.newString("The server cannot process the request due to a high load");
            i$124 = Py.newInteger(503);
            s$125 = Py.newString("Gateway timeout");
            s$126 = Py.newString("The gateway server did not receive a timely response");
            s$127 = Py.newString("Test the HTTP request handler class.\012\012    This runs an HTTP server on port 8000 (or the first command line\012    argument).\012\012    ");
            i$128 = Py.newInteger(8000);
            s$129 = Py.newString("Serving HTTP on port");
            s$130 = Py.newString("...");
            s$131 = Py.newString("__main__");
            s$132 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py");
            funcTable = new _PyInner();
            c$0_server_bind = Py.newCode(1, new String[] {"self", "port", "host"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "server_bind", false, false, funcTable, 0, null, null, 0, 1);
            c$1_HTTPServer = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "HTTPServer", false, false, funcTable, 1, null, null, 0, 0);
            c$2_parse_request = Py.newCode(1, new String[] {"self", "requestline", "version", "path", "command", "words"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "parse_request", false, false, funcTable, 2, null, null, 0, 1);
            c$3_handle = Py.newCode(1, new String[] {"self", "mname", "method"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "handle", false, false, funcTable, 3, null, null, 0, 1);
            c$4_send_error = Py.newCode(3, new String[] {"self", "code", "message", "short", "explain", "long"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "send_error", false, false, funcTable, 4, null, null, 0, 1);
            c$5_send_response = Py.newCode(3, new String[] {"self", "code", "message"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "send_response", false, false, funcTable, 5, null, null, 0, 1);
            c$6_send_header = Py.newCode(3, new String[] {"self", "keyword", "value"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "send_header", false, false, funcTable, 6, null, null, 0, 1);
            c$7_end_headers = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "end_headers", false, false, funcTable, 7, null, null, 0, 1);
            c$8_log_request = Py.newCode(3, new String[] {"self", "code", "size"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "log_request", false, false, funcTable, 8, null, null, 0, 1);
            c$9_log_error = Py.newCode(2, new String[] {"self", "args"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "log_error", true, false, funcTable, 9, null, null, 0, 1);
            c$10_log_message = Py.newCode(3, new String[] {"self", "format", "args"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "log_message", true, false, funcTable, 10, null, null, 0, 1);
            c$11_version_string = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "version_string", false, false, funcTable, 11, null, null, 0, 1);
            c$12_date_time_string = Py.newCode(1, new String[] {"self", "now", "wd", "hh", "mm", "month", "z", "year", "y", "day", "s", "ss"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "date_time_string", false, false, funcTable, 12, null, null, 0, 1);
            c$13_log_date_time_string = Py.newCode(1, new String[] {"self", "now", "hh", "mm", "month", "z", "year", "y", "day", "x", "s", "ss"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "log_date_time_string", false, false, funcTable, 13, null, null, 0, 1);
            c$14_address_string = Py.newCode(1, new String[] {"self", "port", "host"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "address_string", false, false, funcTable, 14, null, null, 0, 1);
            c$15_BaseHTTPRequestHandler = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "BaseHTTPRequestHandler", false, false, funcTable, 15, null, null, 0, 0);
            c$16_test = Py.newCode(2, new String[] {"HandlerClass", "ServerClass", "httpd", "port", "server_address"}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "test", false, false, funcTable, 16, null, null, 0, 1);
            c$17_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\BaseHTTPServer.py", "main", false, false, funcTable, 17, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$17_main == null) _PyInner.initConstants();
            return c$17_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.server_bind$1(frame);
                case 1:
                return _PyInner.HTTPServer$2(frame);
                case 2:
                return _PyInner.parse_request$3(frame);
                case 3:
                return _PyInner.handle$4(frame);
                case 4:
                return _PyInner.send_error$5(frame);
                case 5:
                return _PyInner.send_response$6(frame);
                case 6:
                return _PyInner.send_header$7(frame);
                case 7:
                return _PyInner.end_headers$8(frame);
                case 8:
                return _PyInner.log_request$9(frame);
                case 9:
                return _PyInner.log_error$10(frame);
                case 10:
                return _PyInner.log_message$11(frame);
                case 11:
                return _PyInner.version_string$12(frame);
                case 12:
                return _PyInner.date_time_string$13(frame);
                case 13:
                return _PyInner.log_date_time_string$14(frame);
                case 14:
                return _PyInner.address_string$15(frame);
                case 15:
                return _PyInner.BaseHTTPRequestHandler$16(frame);
                case 16:
                return _PyInner.test$17(frame);
                case 17:
                return _PyInner.main$18(frame);
                default:
                return null;
            }
        }
        
        private static PyObject server_bind$1(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Override server_bind to store the server name. */
            frame.getglobal("SocketServer").__getattr__("TCPServer").__getattr__("server_bind").__call__(frame.getlocal(0));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("socket").invoke("getsockname"), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            frame.getlocal(0).__setattr__("server_name", frame.getglobal("socket").__getattr__("getfqdn").__call__(frame.getlocal(2)));
            frame.getlocal(0).__setattr__("server_port", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject HTTPServer$2(PyFrame frame) {
            frame.setlocal("allow_reuse_address", i$5);
            frame.setlocal("server_bind", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_server_bind));
            return frame.getf_locals();
        }
        
        private static PyObject parse_request$3(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            /* Parse a request (internal).
            
                    The request should be stored in self.raw_request; the results
                    are in self.command, self.path, self.request_version and
                    self.headers.
            
                    Return value is 1 for success, 0 for failure; on failure, an
                    error is sent back.
            
                     */
            t$0$PyObject = s$12;
            frame.getlocal(0).__setattr__("request_version", t$0$PyObject);
            frame.setlocal(2, t$0$PyObject);
            frame.setlocal(1, frame.getlocal(0).__getattr__("raw_requestline"));
            if (frame.getlocal(1).__getslice__(i$13.__neg__(), null, null)._eq(s$14).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$13.__neg__(), null));
            }
            else if (frame.getlocal(1).__getslice__(i$5.__neg__(), null, null)._eq(s$15).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$5.__neg__(), null));
            }
            frame.getlocal(0).__setattr__("requestline", frame.getlocal(1));
            frame.setlocal(5, frame.getlocal(1).invoke("split"));
            if (frame.getglobal("len").__call__(frame.getlocal(5))._eq(i$16).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5), 3);
                frame.setlocal(4, t$0$PyObject__[0]);
                frame.setlocal(3, t$0$PyObject__[1]);
                frame.setlocal(2, t$0$PyObject__[2]);
                if (frame.getlocal(2).__getslice__(null, i$17, null)._ne(s$18).__nonzero__()) {
                    frame.getlocal(0).invoke("send_error", i$19, s$20._mod(frame.getlocal(2).__repr__()));
                    return i$9;
                }
            }
            else if (frame.getglobal("len").__call__(frame.getlocal(5))._eq(i$13).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5), 2);
                frame.setlocal(4, t$0$PyObject__[0]);
                frame.setlocal(3, t$0$PyObject__[1]);
                if (frame.getlocal(4)._ne(s$21).__nonzero__()) {
                    frame.getlocal(0).invoke("send_error", i$19, s$22._mod(frame.getlocal(4).__repr__()));
                    return i$9;
                }
            }
            else {
                frame.getlocal(0).invoke("send_error", i$19, s$23._mod(frame.getlocal(1).__repr__()));
                return i$9;
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(4), frame.getlocal(3), frame.getlocal(2)}), 3);
            frame.getlocal(0).__setattr__("command", t$0$PyObject__[0]);
            frame.getlocal(0).__setattr__("path", t$0$PyObject__[1]);
            frame.getlocal(0).__setattr__("request_version", t$0$PyObject__[2]);
            frame.getlocal(0).__setattr__("headers", frame.getlocal(0).invoke("MessageClass", frame.getlocal(0).__getattr__("rfile"), i$9));
            return i$5;
        }
        
        private static PyObject handle$4(PyFrame frame) {
            /* Handle a single HTTP request.
            
                    You normally don't need to override this method; see the class
                    __doc__ string for information on how to handle specific HTTP
                    commands such as GET and POST.
            
                     */
            frame.getlocal(0).__setattr__("raw_requestline", frame.getlocal(0).__getattr__("rfile").invoke("readline"));
            if (frame.getlocal(0).invoke("parse_request").__not__().__nonzero__()) {
                return Py.None;
            }
            frame.setlocal(1, s$25._add(frame.getlocal(0).__getattr__("command")));
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0), frame.getlocal(1)).__not__().__nonzero__()) {
                frame.getlocal(0).invoke("send_error", i$26, s$27._mod(frame.getlocal(0).__getattr__("command").__repr__()));
                return Py.None;
            }
            frame.setlocal(2, frame.getglobal("getattr").__call__(frame.getlocal(0), frame.getlocal(1)));
            frame.getlocal(2).__call__();
            return Py.None;
        }
        
        private static PyObject send_error$5(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            
            // Code
            /* Send and log an error reply.
            
                    Arguments are the error code, and a detailed message.
                    The detailed message defaults to the short entry matching the
                    response code.
            
                    This sends an error response (so it must be called before any
                    output has been generated), logs the error, and finally sends
                    a piece of HTML explaining the error to the user.
            
                     */
            try {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("responses").__getitem__(frame.getlocal(1)), 2);
                frame.setlocal(3, t$0$PyObject__[0]);
                frame.setlocal(5, t$0$PyObject__[1]);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("KeyError"))) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {s$29, s$29}), 2);
                    frame.setlocal(3, t$0$PyObject__[0]);
                    frame.setlocal(5, t$0$PyObject__[1]);
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(2, frame.getlocal(3));
            }
            frame.setlocal(4, frame.getlocal(5));
            frame.getlocal(0).invoke("log_error", new PyObject[] {s$30, frame.getlocal(1), frame.getlocal(2)});
            frame.getlocal(0).invoke("send_response", frame.getlocal(1), frame.getlocal(2));
            frame.getlocal(0).invoke("end_headers");
            frame.getlocal(0).__getattr__("wfile").invoke("write", frame.getlocal(0).__getattr__("error_message_format")._mod(new PyDictionary(new PyObject[] {s$31, frame.getlocal(1), s$32, frame.getlocal(2), s$33, frame.getlocal(4)})));
            return Py.None;
        }
        
        private static PyObject send_response$6(PyFrame frame) {
            /* Send the response header and log the response code.
            
                    Also send two standard headers with the server software
                    version and the current date.
            
                     */
            frame.getlocal(0).invoke("log_request", frame.getlocal(1));
            if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("responses").invoke("has_key", frame.getlocal(1)).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(0).__getattr__("responses").__getitem__(frame.getlocal(1)).__getitem__(i$9));
                }
                else {
                    frame.setlocal(2, s$35);
                }
            }
            if (frame.getlocal(0).__getattr__("request_version")._ne(s$12).__nonzero__()) {
                frame.getlocal(0).__getattr__("wfile").invoke("write", s$36._mod(new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("protocol_version"), frame.getglobal("str").__call__(frame.getlocal(1)), frame.getlocal(2)})));
            }
            frame.getlocal(0).invoke("send_header", s$37, frame.getlocal(0).invoke("version_string"));
            frame.getlocal(0).invoke("send_header", s$38, frame.getlocal(0).invoke("date_time_string"));
            return Py.None;
        }
        
        private static PyObject send_header$7(PyFrame frame) {
            /* Send a MIME header. */
            if (frame.getlocal(0).__getattr__("request_version")._ne(s$12).__nonzero__()) {
                frame.getlocal(0).__getattr__("wfile").invoke("write", s$40._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)})));
            }
            return Py.None;
        }
        
        private static PyObject end_headers$8(PyFrame frame) {
            /* Send the blank line ending the MIME headers. */
            if (frame.getlocal(0).__getattr__("request_version")._ne(s$12).__nonzero__()) {
                frame.getlocal(0).__getattr__("wfile").invoke("write", s$14);
            }
            return Py.None;
        }
        
        private static PyObject log_request$9(PyFrame frame) {
            /* Log an accepted request.
            
                    This is called by send_reponse().
            
                     */
            frame.getlocal(0).invoke("log_message", new PyObject[] {s$43, frame.getlocal(0).__getattr__("requestline"), frame.getglobal("str").__call__(frame.getlocal(1)), frame.getglobal("str").__call__(frame.getlocal(2))});
            return Py.None;
        }
        
        private static PyObject log_error$10(PyFrame frame) {
            /* Log an error.
            
                    This is called when a request cannot be fulfilled.  By
                    default it passes the message on to log_message().
            
                    Arguments are the same as for log_message().
            
                    XXX This should go to the separate error log.
            
                     */
            frame.getglobal("apply").__call__(frame.getlocal(0).__getattr__("log_message"), frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject log_message$11(PyFrame frame) {
            /* Log an arbitrary message.
            
                    This is used by all other logging functions.  Override
                    it if you have specific logging wishes.
            
                    The first argument, FORMAT, is a format string for the
                    message to be logged.  If the format string contains
                    any % escapes requiring parameters, they should be
                    specified as subsequent arguments (it's just like
                    printf!).
            
                    The client host and current date/time are prefixed to
                    every message.
            
                     */
            frame.getglobal("sys").__getattr__("stderr").__getattr__("write").__call__(s$47._mod(new PyTuple(new PyObject[] {frame.getlocal(0).invoke("address_string"), frame.getlocal(0).invoke("log_date_time_string"), frame.getlocal(1)._mod(frame.getlocal(2))})));
            return Py.None;
        }
        
        private static PyObject version_string$12(PyFrame frame) {
            /* Return the server software version string. */
            return frame.getlocal(0).__getattr__("server_version")._add(s$49)._add(frame.getlocal(0).__getattr__("sys_version"));
        }
        
        private static PyObject date_time_string$13(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Return the current date and time formatted for a message header. */
            frame.setlocal(1, frame.getglobal("time").__getattr__("time").__call__());
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("time").__getattr__("gmtime").__call__(frame.getlocal(1)), 9);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            frame.setlocal(9, t$0$PyObject__[2]);
            frame.setlocal(3, t$0$PyObject__[3]);
            frame.setlocal(4, t$0$PyObject__[4]);
            frame.setlocal(11, t$0$PyObject__[5]);
            frame.setlocal(2, t$0$PyObject__[6]);
            frame.setlocal(8, t$0$PyObject__[7]);
            frame.setlocal(6, t$0$PyObject__[8]);
            frame.setlocal(10, s$51._mod(new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("weekdayname").__getitem__(frame.getlocal(2)), frame.getlocal(9), frame.getlocal(0).__getattr__("monthname").__getitem__(frame.getlocal(5)), frame.getlocal(7), frame.getlocal(3), frame.getlocal(4), frame.getlocal(11)})));
            return frame.getlocal(10);
        }
        
        private static PyObject log_date_time_string$14(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Return the current time formatted for logging. */
            frame.setlocal(1, frame.getglobal("time").__getattr__("time").__call__());
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("time").__getattr__("localtime").__call__(frame.getlocal(1)), 9);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            frame.setlocal(8, t$0$PyObject__[2]);
            frame.setlocal(2, t$0$PyObject__[3]);
            frame.setlocal(3, t$0$PyObject__[4]);
            frame.setlocal(11, t$0$PyObject__[5]);
            frame.setlocal(9, t$0$PyObject__[6]);
            frame.setlocal(7, t$0$PyObject__[7]);
            frame.setlocal(5, t$0$PyObject__[8]);
            frame.setlocal(10, s$53._mod(new PyTuple(new PyObject[] {frame.getlocal(8), frame.getlocal(0).__getattr__("monthname").__getitem__(frame.getlocal(4)), frame.getlocal(6), frame.getlocal(2), frame.getlocal(3), frame.getlocal(11)})));
            return frame.getlocal(10);
        }
        
        private static PyObject address_string$15(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Return the client address formatted for logging.
            
                    This version looks up the full hostname using gethostbyaddr(),
                    and tries to find a name that contains at least one dot.
            
                     */
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("client_address"), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            return frame.getglobal("socket").__getattr__("getfqdn").__call__(frame.getlocal(2));
        }
        
        private static PyObject BaseHTTPRequestHandler$16(PyFrame frame) {
            /* HTTP request handler base class.
            
                The following explanation of HTTP serves to guide you through the
                code as well as to expose any misunderstandings I may have about
                HTTP (so you don't need to read the code to figure out I'm wrong
                :-).
            
                HTTP (HyperText Transfer Protocol) is an extensible protocol on
                top of a reliable stream transport (e.g. TCP/IP).  The protocol
                recognizes three parts to a request:
            
                1. One line identifying the request type and path
                2. An optional set of RFC-822-style headers
                3. An optional data part
            
                The headers and data are separated by a blank line.
            
                The first line of the request has the form
            
                <command> <path> <version>
            
                where <command> is a (case-sensitive) keyword such as GET or POST,
                <path> is a string containing path information for the request,
                and <version> should be the string "HTTP/1.0".  <path> is encoded
                using the URL encoding scheme (using %xx to signify the ASCII
                character with hex code xx).
            
                The protocol is vague about whether lines are separated by LF
                characters or by CRLF pairs -- for compatibility with the widest
                range of clients, both should be accepted.  Similarly, whitespace
                in the request line should be treated sensibly (allowing multiple
                spaces between components and allowing trailing whitespace).
            
                Similarly, for output, lines ought to be separated by CRLF pairs
                but most clients grok LF characters just fine.
            
                If the first line of the request has the form
            
                <command> <path>
            
                (i.e. <version> is left out) then this is assumed to be an HTTP
                0.9 request; this form has no optional headers and data part and
                the reply consists of just the data.
            
                The reply form of the HTTP 1.0 protocol again has three parts:
            
                1. One line giving the response code
                2. An optional set of RFC-822-style headers
                3. The data
            
                Again, the headers and data are separated by a blank line.
            
                The response code line has the form
            
                <version> <responsecode> <responsestring>
            
                where <version> is the protocol version (always "HTTP/1.0"),
                <responsecode> is a 3-digit response code indicating success or
                failure of the request, and <responsestring> is an optional
                human-readable string explaining what the response code means.
            
                This server parses the request and the headers, and then calls a
                function specific to the request type (<command>).  Specifically,
                a request SPAM will be handled by a method do_SPAM().  If no
                such method exists the server sends an error response to the
                client.  If it exists, it is called with no arguments:
            
                do_SPAM()
            
                Note that the request name is case sensitive (i.e. SPAM and spam
                are different requests).
            
                The various request details are stored in instance variables:
            
                - client_address is the client IP address in the form (host,
                port);
            
                - command, path and version are the broken-down request line;
            
                - headers is an instance of mimetools.Message (or a derived
                class) containing the header information;
            
                - rfile is a file object open for reading positioned at the
                start of the optional input data part;
            
                - wfile is a file object open for writing.
            
                IT IS IMPORTANT TO ADHERE TO THE PROTOCOL FOR WRITING!
            
                The first thing to be written must be the response line.  Then
                follow 0 or more header lines, then a blank line, and then the
                actual data (if any).  The meaning of the header lines depends on
                the command executed by the server; in most cases, when data is
                returned, there should be at least one header line of the form
            
                Content-type: <type>/<subtype>
            
                where <type> and <subtype> should be registered MIME types,
                e.g. "text/html" or "text/plain".
            
                 */
            frame.setlocal("sys_version", s$8._add(frame.getname("sys").__getattr__("version").__getattr__("split").__call__().__getitem__(i$9)));
            frame.setlocal("server_version", s$10._add(frame.getname("__version__")));
            frame.setlocal("parse_request", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_parse_request));
            frame.setlocal("handle", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_handle));
            frame.setlocal("send_error", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$4_send_error));
            frame.setlocal("error_message_format", frame.getname("DEFAULT_ERROR_MESSAGE"));
            frame.setlocal("send_response", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$5_send_response));
            frame.setlocal("send_header", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_send_header));
            frame.setlocal("end_headers", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_end_headers));
            frame.setlocal("log_request", new PyFunction(frame.f_globals, new PyObject[] {s$44, s$44}, c$8_log_request));
            frame.setlocal("log_error", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_log_error));
            frame.setlocal("log_message", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_log_message));
            frame.setlocal("version_string", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_version_string));
            frame.setlocal("date_time_string", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_date_time_string));
            frame.setlocal("log_date_time_string", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_log_date_time_string));
            frame.setlocal("weekdayname", new PyList(new PyObject[] {s$54, s$55, s$56, s$57, s$58, s$59, s$60}));
            frame.setlocal("monthname", new PyList(new PyObject[] {frame.getname("None"), s$61, s$62, s$63, s$64, s$65, s$66, s$67, s$68, s$69, s$70, s$71, s$72}));
            frame.setlocal("address_string", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_address_string));
            frame.setlocal("protocol_version", s$74);
            frame.setlocal("MessageClass", frame.getname("mimetools").__getattr__("Message"));
            frame.setlocal("responses", new PyDictionary(new PyObject[] {i$75, new PyTuple(new PyObject[] {s$76, s$77}), i$78, new PyTuple(new PyObject[] {s$79, s$80}), i$81, new PyTuple(new PyObject[] {s$82, s$83}), i$84, new PyTuple(new PyObject[] {s$85, s$86}), i$87, new PyTuple(new PyObject[] {s$88, s$89}), i$90, new PyTuple(new PyObject[] {s$91, s$92}), i$93, new PyTuple(new PyObject[] {s$94, s$95}), i$96, new PyTuple(new PyObject[] {s$97, s$98}), i$99, new PyTuple(new PyObject[] {s$100, s$101}), i$19, new PyTuple(new PyObject[] {s$102, s$103}), i$104, new PyTuple(new PyObject[] {s$105, s$106}), i$107, new PyTuple(new PyObject[] {s$108, s$109}), i$110, new PyTuple(new PyObject[] {s$111, s$112}), i$113, new PyTuple(new PyObject[] {s$114, s$115}), i$116, new PyTuple(new PyObject[] {s$117, s$118}), i$26, new PyTuple(new PyObject[] {s$119, s$120}), i$121, new PyTuple(new PyObject[] {s$122, s$123}), i$124, new PyTuple(new PyObject[] {s$125, s$126})}));
            return frame.getf_locals();
        }
        
        private static PyObject test$17(PyFrame frame) {
            /* Test the HTTP request handler class.
            
                This runs an HTTP server on port 8000 (or the first command line
                argument).
            
                 */
            if (frame.getglobal("sys").__getattr__("argv").__getslice__(i$5, null, null).__nonzero__()) {
                frame.setlocal(3, frame.getglobal("int").__call__(frame.getglobal("sys").__getattr__("argv").__getitem__(i$5)));
            }
            else {
                frame.setlocal(3, i$128);
            }
            frame.setlocal(4, new PyTuple(new PyObject[] {s$35, frame.getlocal(3)}));
            frame.setlocal(2, frame.getlocal(1).__call__(frame.getlocal(4), frame.getlocal(0)));
            Py.printComma(s$129);
            Py.printComma(frame.getlocal(3));
            Py.println(s$130);
            frame.getlocal(2).invoke("serve_forever");
            return Py.None;
        }
        
        private static PyObject main$18(PyFrame frame) {
            frame.setglobal("__file__", s$132);
            
            /* HTTP server base class.
            
            Note: the class in this module doesn't implement any HTTP request; see
            SimpleHTTPServer for simple implementations of GET, HEAD and POST
            (including CGI scripts).
            
            Contents:
            
            - BaseHTTPRequestHandler: HTTP request handler base class
            - test: test function
            
            XXX To do:
            
            - send server version
            - log requests even later (to capture byte count)
            - log user-agent header and other interesting goodies
            - send error log to separate file
            - are request names really case sensitive?
            
             */
            frame.setlocal("__version__", s$1);
            frame.setlocal("__all__", new PyList(new PyObject[] {s$2, s$3}));
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            frame.setlocal("time", org.python.core.imp.importOne("time", frame));
            frame.setlocal("socket", org.python.core.imp.importOne("socket", frame));
            frame.setlocal("mimetools", org.python.core.imp.importOne("mimetools", frame));
            frame.setlocal("SocketServer", org.python.core.imp.importOne("SocketServer", frame));
            frame.setlocal("DEFAULT_ERROR_MESSAGE", s$4);
            frame.setlocal("HTTPServer", Py.makeClass("HTTPServer", new PyObject[] {frame.getname("SocketServer").__getattr__("TCPServer")}, c$1_HTTPServer, null));
            frame.setlocal("BaseHTTPRequestHandler", Py.makeClass("BaseHTTPRequestHandler", new PyObject[] {frame.getname("SocketServer").__getattr__("StreamRequestHandler")}, c$15_BaseHTTPRequestHandler, null));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("BaseHTTPRequestHandler"), frame.getname("HTTPServer")}, c$16_test));
            if (frame.getname("__name__")._eq(s$131).__nonzero__()) {
                frame.getname("test").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("BaseHTTPServer"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "BaseHTTPServer";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(BaseHTTPServer._PyInner.class, newargs, BaseHTTPServer.jpy$packages, BaseHTTPServer.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
