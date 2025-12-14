import org.python.core.*;

public class httplib extends java.lang.Object {
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
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject s$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject i$18;
        private static PyObject i$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject s$22;
        private static PyObject s$23;
        private static PyObject s$24;
        private static PyObject i$25;
        private static PyObject s$26;
        private static PyObject i$27;
        private static PyObject i$28;
        private static PyObject s$29;
        private static PyObject s$30;
        private static PyObject s$31;
        private static PyObject i$32;
        private static PyObject s$33;
        private static PyObject i$34;
        private static PyObject i$35;
        private static PyObject s$36;
        private static PyObject i$37;
        private static PyObject s$38;
        private static PyObject i$39;
        private static PyObject i$40;
        private static PyObject s$41;
        private static PyObject s$42;
        private static PyObject s$43;
        private static PyObject s$44;
        private static PyObject s$45;
        private static PyObject s$46;
        private static PyObject s$47;
        private static PyObject i$48;
        private static PyObject i$49;
        private static PyObject i$50;
        private static PyObject s$51;
        private static PyObject i$52;
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
        private static PyObject i$78;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_begin;
        private static PyCode c$2_close;
        private static PyCode c$3_isclosed;
        private static PyCode c$4_read;
        private static PyCode c$5__safe_read;
        private static PyCode c$6_getheader;
        private static PyCode c$7_HTTPResponse;
        private static PyCode c$8___init__;
        private static PyCode c$9__set_hostport;
        private static PyCode c$10_set_debuglevel;
        private static PyCode c$11_connect;
        private static PyCode c$12_close;
        private static PyCode c$13_send;
        private static PyCode c$14_putrequest;
        private static PyCode c$15_putheader;
        private static PyCode c$16_endheaders;
        private static PyCode c$17_request;
        private static PyCode c$18__send_request;
        private static PyCode c$19_getresponse;
        private static PyCode c$20_HTTPConnection;
        private static PyCode c$21___init__;
        private static PyCode c$22_makefile;
        private static PyCode c$23_send;
        private static PyCode c$24_recv;
        private static PyCode c$25___getattr__;
        private static PyCode c$26_FakeSocket;
        private static PyCode c$27___init__;
        private static PyCode c$28_connect;
        private static PyCode c$29_HTTPSConnection;
        private static PyCode c$30___init__;
        private static PyCode c$31_connect;
        private static PyCode c$32_set_debuglevel;
        private static PyCode c$33_getfile;
        private static PyCode c$34_putheader;
        private static PyCode c$35_getreply;
        private static PyCode c$36_close;
        private static PyCode c$37_HTTP;
        private static PyCode c$38_HTTPS;
        private static PyCode c$39_HTTPException;
        private static PyCode c$40_NotConnected;
        private static PyCode c$41___init__;
        private static PyCode c$42_UnknownProtocol;
        private static PyCode c$43_UnknownTransferEncoding;
        private static PyCode c$44_IllegalKeywordArgument;
        private static PyCode c$45_UnimplementedFileMode;
        private static PyCode c$46___init__;
        private static PyCode c$47_IncompleteRead;
        private static PyCode c$48_ImproperConnectionState;
        private static PyCode c$49_CannotSendRequest;
        private static PyCode c$50_CannotSendHeader;
        private static PyCode c$51_ResponseNotReady;
        private static PyCode c$52___init__;
        private static PyCode c$53_BadStatusLine;
        private static PyCode c$54_test;
        private static PyCode c$55_main;
        private static void initConstants() {
            s$0 = Py.newString("HTTP/1.1 client library\012\012<intro stuff goes here>\012<other stuff, too>\012\012HTTPConnection go through a number of \"states\", which defines when a client\012may legally make another request or fetch the response for a particular\012request. This diagram details these state transitions:\012\012    (null)\012      |\012      | HTTPConnection()\012      v\012    Idle\012      |\012      | putrequest()\012      v\012    Request-started\012      |\012      | ( putheader() )*  endheaders()\012      v\012    Request-sent\012      |\012      | response = getresponse()\012      v\012    Unread-response   [Response-headers-read]\012      |\\____________________\012      |                     |\012      | response.read()     | putrequest()\012      v                     v\012    Idle                  Req-started-unread-response\012                     ______/|\012                   /        |\012   response.read() |        | ( putheader() )*  endheaders()\012                   v        v\012       Request-started    Req-sent-unread-response\012                            |\012                            | response.read()\012                            v\012                          Request-sent\012\012This diagram presents the following rules:\012  -- a second request may not be started until {response-headers-read}\012  -- a response [object] cannot be retrieved until {request-sent}\012  -- there is no differentiation between an unread response body and a\012     partially read response body\012\012Note: this enforcement is applied by the HTTPConnection class. The\012      HTTPResponse class does not enforce this state machine, which\012      implies sophisticated clients may accelerate the request/response\012      pipeline. Caution should be taken, though: accelerating the states\012      beyond the above pattern may imply knowledge of the server's\012      connection-close behavior for certain requests. For example, it\012      is impossible to tell whether the server will close the connection\012      UNTIL the response headers have been read; this means that further\012      requests cannot be placed into the pipeline until it is known that\012      the server will NOT be closing the connection.\012\012Logical State                  __state            __response\012-------------                  -------            ----------\012Idle                           _CS_IDLE           None\012Request-started                _CS_REQ_STARTED    None\012Request-sent                   _CS_REQ_SENT       None\012Unread-response                _CS_IDLE           <response_class>\012Req-started-unread-response    _CS_REQ_STARTED    <response_class>\012Req-sent-unread-response       _CS_REQ_SENT       <response_class>\012");
            s$1 = Py.newString("HTTP");
            s$2 = Py.newString("HTTPResponse");
            s$3 = Py.newString("HTTPConnection");
            s$4 = Py.newString("HTTPSConnection");
            s$5 = Py.newString("HTTPException");
            s$6 = Py.newString("NotConnected");
            s$7 = Py.newString("UnknownProtocol");
            s$8 = Py.newString("UnknownTransferEncoding");
            s$9 = Py.newString("IllegalKeywordArgument");
            s$10 = Py.newString("UnimplementedFileMode");
            s$11 = Py.newString("IncompleteRead");
            s$12 = Py.newString("ImproperConnectionState");
            s$13 = Py.newString("CannotSendRequest");
            s$14 = Py.newString("CannotSendHeader");
            s$15 = Py.newString("ResponseNotReady");
            s$16 = Py.newString("BadStatusLine");
            s$17 = Py.newString("error");
            i$18 = Py.newInteger(80);
            i$19 = Py.newInteger(443);
            s$20 = Py.newString("UNKNOWN");
            s$21 = Py.newString("Idle");
            s$22 = Py.newString("Request-started");
            s$23 = Py.newString("Request-sent");
            s$24 = Py.newString("rb");
            i$25 = Py.newInteger(0);
            s$26 = Py.newString("reply:");
            i$27 = Py.newInteger(2);
            i$28 = Py.newInteger(1);
            s$29 = Py.newString("");
            s$30 = Py.newString("HTTP/0.9");
            s$31 = Py.newString("200");
            i$32 = Py.newInteger(5);
            s$33 = Py.newString("HTTP/");
            i$34 = Py.newInteger(100);
            i$35 = Py.newInteger(999);
            s$36 = Py.newString("HTTP/1.0");
            i$37 = Py.newInteger(10);
            s$38 = Py.newString("HTTP/1.");
            i$39 = Py.newInteger(11);
            i$40 = Py.newInteger(9);
            s$41 = Py.newString("header:");
            s$42 = Py.newString("transfer-encoding");
            s$43 = Py.newString("chunked");
            s$44 = Py.newString("connection");
            s$45 = Py.newString("close");
            s$46 = Py.newString("keep-alive");
            s$47 = Py.newString("content-length");
            i$48 = Py.newInteger(204);
            i$49 = Py.newInteger(304);
            i$50 = Py.newInteger(200);
            s$51 = Py.newString(";");
            i$52 = Py.newInteger(16);
            s$53 = Py.newString("\015\012");
            s$54 = Py.newString("Read the number of bytes requested, compensating for partial reads.\012\012        Normally, we have a blocking socket, but a read() can be interrupted\012        by a signal (resulting in a partial read).\012\012        Note that we cannot distinguish between EOF and an interrupt when zero\012        bytes have been read. IncompleteRead() will be raised in this\012        situation.\012\012        This function should be used when <amt> bytes \"should\" be present for\012        reading. If the bytes are truly not available (due to EOF), then the\012        IncompleteRead exception can be used to detect the problem.\012        ");
            s$55 = Py.newString("HTTP/1.1");
            s$56 = Py.newString(":");
            s$57 = Py.newString("Connect to the host and port specified in __init__.");
            s$58 = Py.newString("connect: (%s, %s)");
            s$59 = Py.newString("Close the connection to the HTTP server.");
            s$60 = Py.newString("Send `str' to the server.");
            s$61 = Py.newString("send:");
            i$62 = Py.newInteger(32);
            s$63 = Py.newString("Send a request to the server.\012\012        `method' specifies an HTTP request method, e.g. 'GET'.\012        `url' specifies the object being requested, e.g. '/index.html'.\012        ");
            s$64 = Py.newString("/");
            s$65 = Py.newString("%s %s %s\015\012");
            s$66 = Py.newString("Host");
            s$67 = Py.newString("%s:%s");
            s$68 = Py.newString("Accept-Encoding");
            s$69 = Py.newString("identity");
            s$70 = Py.newString("Send a request header line to the server.\012\012        For example: h.putheader('Accept', 'text/html')\012        ");
            s$71 = Py.newString("%s: %s\015\012");
            s$72 = Py.newString("Indicate that the last header line has been sent to the server.");
            s$73 = Py.newString("Send a complete request to the server.");
            s$74 = Py.newString("Content-Length");
            s$75 = Py.newString("Get the response from the server.");
            s$76 = Py.newString("Return a readable file-like object with data from socket.\012\012        This method offers only partial support for the makefile\012        interface of a real socket.  It only supports modes 'r' and\012        'rb' and the bufsize argument is ignored.\012\012        The returned object contains *all* of the file data\012        ");
            s$77 = Py.newString("r");
            i$78 = Py.newInteger(1024);
            s$79 = Py.newString("This class allows communication via SSL.");
            s$80 = Py.newString("key_file");
            s$81 = Py.newString("cert_file");
            s$82 = Py.newString("Connect to a host on a given (SSL) port.");
            s$83 = Py.newString("_sock");
            s$84 = Py.newString("Compatibility class with httplib.py from 1.5.");
            s$85 = Py.newString("Provide a default host, since the superclass requires one.");
            s$86 = Py.newString("Accept arguments to set the host/port, since the superclass doesn't.");
            s$87 = Py.newString("Provide a getfile, since the superclass' does not use this concept.");
            s$88 = Py.newString("The superclass allows only one value argument.");
            s$89 = Py.newString("\015\012\011");
            s$90 = Py.newString("Compat definition since superclass does not define it.\012\012        Returns a tuple consisting of:\012        - server status code (e.g. '200' if all goes well)\012        - server \"reason\" corresponding to status code\012        - any RFC822 headers in the response from the server\012        ");
            s$91 = Py.newString("ssl");
            s$92 = Py.newString("Compatibility with 1.5 httplib interface\012\012        Python 1.5.2 did not have an HTTPS class, but it defined an\012        interface for sending http requests that is also useful for\012        https.\012        ");
            s$93 = Py.newString("Test this module.\012\012    The test consists of retrieving and displaying the Python\012    home page, along with the error code and error string returned\012    by the www.python.org server.\012    ");
            s$94 = Py.newString("d");
            s$95 = Py.newString("-d");
            s$96 = Py.newString("www.python.org");
            s$97 = Py.newString("GET");
            s$98 = Py.newString("status =");
            s$99 = Py.newString("reason =");
            s$100 = Py.newString("sourceforge.net");
            s$101 = Py.newString("/projects/python");
            s$102 = Py.newString("__main__");
            s$103 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\httplib.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(3, new String[] {"self", "sock", "debuglevel"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_begin = Py.newCode(1, new String[] {"self", "hdr", "length", "version", "conn", "line", "status", "reason", "tr_enc"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "begin", false, false, funcTable, 1, null, null, 0, 1);
            c$2_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "close", false, false, funcTable, 2, null, null, 0, 1);
            c$3_isclosed = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "isclosed", false, false, funcTable, 3, null, null, 0, 1);
            c$4_read = Py.newCode(2, new String[] {"self", "amt", "chunk_left", "i", "value", "s", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "read", false, false, funcTable, 4, null, null, 0, 1);
            c$5__safe_read = Py.newCode(2, new String[] {"self", "amt", "chunk", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "_safe_read", false, false, funcTable, 5, null, null, 0, 1);
            c$6_getheader = Py.newCode(3, new String[] {"self", "name", "default"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "getheader", false, false, funcTable, 6, null, null, 0, 1);
            c$7_HTTPResponse = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "HTTPResponse", false, false, funcTable, 7, null, null, 0, 0);
            c$8___init__ = Py.newCode(3, new String[] {"self", "host", "port"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, false, funcTable, 8, null, null, 0, 1);
            c$9__set_hostport = Py.newCode(3, new String[] {"self", "host", "port", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "_set_hostport", false, false, funcTable, 9, null, null, 0, 1);
            c$10_set_debuglevel = Py.newCode(2, new String[] {"self", "level"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "set_debuglevel", false, false, funcTable, 10, null, null, 0, 1);
            c$11_connect = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "connect", false, false, funcTable, 11, null, null, 0, 1);
            c$12_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "close", false, false, funcTable, 12, null, null, 0, 1);
            c$13_send = Py.newCode(2, new String[] {"self", "str", "v"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "send", false, false, funcTable, 13, null, null, 0, 1);
            c$14_putrequest = Py.newCode(3, new String[] {"self", "method", "url", "str", "v"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "putrequest", false, false, funcTable, 14, null, null, 0, 1);
            c$15_putheader = Py.newCode(3, new String[] {"self", "header", "value", "str"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "putheader", false, false, funcTable, 15, null, null, 0, 1);
            c$16_endheaders = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "endheaders", false, false, funcTable, 16, null, null, 0, 1);
            c$17_request = Py.newCode(5, new String[] {"self", "method", "url", "body", "headers", "v"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "request", false, false, funcTable, 17, null, null, 0, 1);
            c$18__send_request = Py.newCode(5, new String[] {"self", "method", "url", "body", "headers", "value", "hdr"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "_send_request", false, false, funcTable, 18, null, null, 0, 1);
            c$19_getresponse = Py.newCode(1, new String[] {"self", "response"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "getresponse", false, false, funcTable, 19, null, null, 0, 1);
            c$20_HTTPConnection = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "HTTPConnection", false, false, funcTable, 20, null, null, 0, 0);
            c$21___init__ = Py.newCode(3, new String[] {"self", "sock", "ssl"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, false, funcTable, 21, null, null, 0, 1);
            c$22_makefile = Py.newCode(3, new String[] {"self", "mode", "bufsize", "buf", "msg", "msgbuf"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "makefile", false, false, funcTable, 22, null, null, 0, 1);
            c$23_send = Py.newCode(3, new String[] {"self", "stuff", "flags"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "send", false, false, funcTable, 23, null, null, 0, 1);
            c$24_recv = Py.newCode(3, new String[] {"self", "len", "flags"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "recv", false, false, funcTable, 24, null, null, 0, 1);
            c$25___getattr__ = Py.newCode(2, new String[] {"self", "attr"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__getattr__", false, false, funcTable, 25, null, null, 0, 1);
            c$26_FakeSocket = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "FakeSocket", false, false, funcTable, 26, null, null, 0, 0);
            c$27___init__ = Py.newCode(4, new String[] {"self", "host", "port", "x509", "keys"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, true, funcTable, 27, null, null, 0, 1);
            c$28_connect = Py.newCode(1, new String[] {"self", "ssl", "sock", "realsock"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "connect", false, false, funcTable, 28, null, null, 0, 1);
            c$29_HTTPSConnection = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "HTTPSConnection", false, false, funcTable, 29, null, null, 0, 0);
            c$30___init__ = Py.newCode(4, new String[] {"self", "host", "port", "x509"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, true, funcTable, 30, null, null, 0, 1);
            c$31_connect = Py.newCode(3, new String[] {"self", "host", "port"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "connect", false, false, funcTable, 31, null, null, 0, 1);
            c$32_set_debuglevel = Py.newCode(2, new String[] {"self", "debuglevel"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "set_debuglevel", false, false, funcTable, 32, null, null, 0, 1);
            c$33_getfile = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "getfile", false, false, funcTable, 33, null, null, 0, 1);
            c$34_putheader = Py.newCode(3, new String[] {"self", "header", "values"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "putheader", true, false, funcTable, 34, null, null, 0, 1);
            c$35_getreply = Py.newCode(1, new String[] {"self", "response", "e"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "getreply", false, false, funcTable, 35, null, null, 0, 1);
            c$36_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "close", false, false, funcTable, 36, null, null, 0, 1);
            c$37_HTTP = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "HTTP", false, false, funcTable, 37, null, null, 0, 0);
            c$38_HTTPS = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "HTTPS", false, false, funcTable, 38, null, null, 0, 0);
            c$39_HTTPException = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "HTTPException", false, false, funcTable, 39, null, null, 0, 0);
            c$40_NotConnected = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "NotConnected", false, false, funcTable, 40, null, null, 0, 0);
            c$41___init__ = Py.newCode(2, new String[] {"self", "version"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, false, funcTable, 41, null, null, 0, 1);
            c$42_UnknownProtocol = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "UnknownProtocol", false, false, funcTable, 42, null, null, 0, 0);
            c$43_UnknownTransferEncoding = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "UnknownTransferEncoding", false, false, funcTable, 43, null, null, 0, 0);
            c$44_IllegalKeywordArgument = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "IllegalKeywordArgument", false, false, funcTable, 44, null, null, 0, 0);
            c$45_UnimplementedFileMode = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "UnimplementedFileMode", false, false, funcTable, 45, null, null, 0, 0);
            c$46___init__ = Py.newCode(2, new String[] {"self", "partial"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, false, funcTable, 46, null, null, 0, 1);
            c$47_IncompleteRead = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "IncompleteRead", false, false, funcTable, 47, null, null, 0, 0);
            c$48_ImproperConnectionState = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "ImproperConnectionState", false, false, funcTable, 48, null, null, 0, 0);
            c$49_CannotSendRequest = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "CannotSendRequest", false, false, funcTable, 49, null, null, 0, 0);
            c$50_CannotSendHeader = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "CannotSendHeader", false, false, funcTable, 50, null, null, 0, 0);
            c$51_ResponseNotReady = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "ResponseNotReady", false, false, funcTable, 51, null, null, 0, 0);
            c$52___init__ = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "__init__", false, false, funcTable, 52, null, null, 0, 1);
            c$53_BadStatusLine = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "BadStatusLine", false, false, funcTable, 53, null, null, 0, 0);
            c$54_test = Py.newCode(0, new String[] {"headers", "args", "getopt", "sys", "opts", "host", "o", "status", "dl", "selector", "header", "h", "reason", "a", "hs"}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "test", false, false, funcTable, 54, null, null, 0, 1);
            c$55_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\httplib.py", "main", false, false, funcTable, 55, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$55_main == null) _PyInner.initConstants();
            return c$55_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.begin$2(frame);
                case 2:
                return _PyInner.close$3(frame);
                case 3:
                return _PyInner.isclosed$4(frame);
                case 4:
                return _PyInner.read$5(frame);
                case 5:
                return _PyInner._safe_read$6(frame);
                case 6:
                return _PyInner.getheader$7(frame);
                case 7:
                return _PyInner.HTTPResponse$8(frame);
                case 8:
                return _PyInner.__init__$9(frame);
                case 9:
                return _PyInner._set_hostport$10(frame);
                case 10:
                return _PyInner.set_debuglevel$11(frame);
                case 11:
                return _PyInner.connect$12(frame);
                case 12:
                return _PyInner.close$13(frame);
                case 13:
                return _PyInner.send$14(frame);
                case 14:
                return _PyInner.putrequest$15(frame);
                case 15:
                return _PyInner.putheader$16(frame);
                case 16:
                return _PyInner.endheaders$17(frame);
                case 17:
                return _PyInner.request$18(frame);
                case 18:
                return _PyInner._send_request$19(frame);
                case 19:
                return _PyInner.getresponse$20(frame);
                case 20:
                return _PyInner.HTTPConnection$21(frame);
                case 21:
                return _PyInner.__init__$22(frame);
                case 22:
                return _PyInner.makefile$23(frame);
                case 23:
                return _PyInner.send$24(frame);
                case 24:
                return _PyInner.recv$25(frame);
                case 25:
                return _PyInner.__getattr__$26(frame);
                case 26:
                return _PyInner.FakeSocket$27(frame);
                case 27:
                return _PyInner.__init__$28(frame);
                case 28:
                return _PyInner.connect$29(frame);
                case 29:
                return _PyInner.HTTPSConnection$30(frame);
                case 30:
                return _PyInner.__init__$31(frame);
                case 31:
                return _PyInner.connect$32(frame);
                case 32:
                return _PyInner.set_debuglevel$33(frame);
                case 33:
                return _PyInner.getfile$34(frame);
                case 34:
                return _PyInner.putheader$35(frame);
                case 35:
                return _PyInner.getreply$36(frame);
                case 36:
                return _PyInner.close$37(frame);
                case 37:
                return _PyInner.HTTP$38(frame);
                case 38:
                return _PyInner.HTTPS$39(frame);
                case 39:
                return _PyInner.HTTPException$40(frame);
                case 40:
                return _PyInner.NotConnected$41(frame);
                case 41:
                return _PyInner.__init__$42(frame);
                case 42:
                return _PyInner.UnknownProtocol$43(frame);
                case 43:
                return _PyInner.UnknownTransferEncoding$44(frame);
                case 44:
                return _PyInner.IllegalKeywordArgument$45(frame);
                case 45:
                return _PyInner.UnimplementedFileMode$46(frame);
                case 46:
                return _PyInner.__init__$47(frame);
                case 47:
                return _PyInner.IncompleteRead$48(frame);
                case 48:
                return _PyInner.ImproperConnectionState$49(frame);
                case 49:
                return _PyInner.CannotSendRequest$50(frame);
                case 50:
                return _PyInner.CannotSendHeader$51(frame);
                case 51:
                return _PyInner.ResponseNotReady$52(frame);
                case 52:
                return _PyInner.__init__$53(frame);
                case 53:
                return _PyInner.BadStatusLine$54(frame);
                case 54:
                return _PyInner.test$55(frame);
                case 55:
                return _PyInner.main$56(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("fp", frame.getlocal(1).invoke("makefile", s$24, i$25));
            frame.getlocal(0).__setattr__("debuglevel", frame.getlocal(2));
            frame.getlocal(0).__setattr__("msg", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("version", frame.getglobal("_UNKNOWN"));
            frame.getlocal(0).__setattr__("status", frame.getglobal("_UNKNOWN"));
            frame.getlocal(0).__setattr__("reason", frame.getglobal("_UNKNOWN"));
            frame.getlocal(0).__setattr__("chunked", frame.getglobal("_UNKNOWN"));
            frame.getlocal(0).__setattr__("chunk_left", frame.getglobal("_UNKNOWN"));
            frame.getlocal(0).__setattr__("length", frame.getglobal("_UNKNOWN"));
            frame.getlocal(0).__setattr__("will_close", frame.getglobal("_UNKNOWN"));
            return Py.None;
        }
        
        private static PyObject begin$2(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            PyException t$0$PyException, t$1$PyException;
            
            // Code
            if (frame.getlocal(0).__getattr__("msg")._isnot(frame.getglobal("None")).__nonzero__()) {
                return Py.None;
            }
            frame.setlocal(5, frame.getlocal(0).__getattr__("fp").invoke("readline"));
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$25).__nonzero__()) {
                Py.printComma(s$26);
                Py.println(frame.getglobal("repr").__call__(frame.getlocal(5)));
            }
            try {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5).invoke("split", frame.getglobal("None"), i$27), 3);
                frame.setlocal(3, t$0$PyObject__[0]);
                frame.setlocal(6, t$0$PyObject__[1]);
                frame.setlocal(7, t$0$PyObject__[2]);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    try {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5).invoke("split", frame.getglobal("None"), i$28), 2);
                        frame.setlocal(3, t$0$PyObject__[0]);
                        frame.setlocal(6, t$0$PyObject__[1]);
                        frame.setlocal(7, s$29);
                    }
                    catch (Throwable x$1) {
                        t$1$PyException = Py.setException(x$1, frame);
                        if (Py.matchException(t$1$PyException, frame.getglobal("ValueError"))) {
                            frame.setlocal(3, s$30);
                            frame.setlocal(6, s$31);
                            frame.setlocal(7, s$29);
                        }
                        else throw t$1$PyException;
                    }
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(3).__getslice__(null, i$32, null)._ne(s$33).__nonzero__()) {
                frame.getlocal(0).invoke("close");
                throw Py.makeException(frame.getglobal("BadStatusLine").__call__(frame.getlocal(5)));
            }
            try {
                t$0$PyObject = frame.getglobal("int").__call__(frame.getlocal(6));
                frame.getlocal(0).__setattr__("status", t$0$PyObject);
                frame.setlocal(6, t$0$PyObject);
                if (((t$0$PyObject = frame.getlocal(6)._lt(i$34)).__nonzero__() ? t$0$PyObject : frame.getlocal(6)._gt(i$35)).__nonzero__()) {
                    throw Py.makeException(frame.getglobal("BadStatusLine").__call__(frame.getlocal(5)));
                }
            }
            catch (Throwable x$2) {
                t$0$PyException = Py.setException(x$2, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    throw Py.makeException(frame.getglobal("BadStatusLine").__call__(frame.getlocal(5)));
                }
                else throw t$0$PyException;
            }
            frame.getlocal(0).__setattr__("reason", frame.getlocal(7).invoke("strip"));
            if (frame.getlocal(3)._eq(s$36).__nonzero__()) {
                frame.getlocal(0).__setattr__("version", i$37);
            }
            else if (frame.getlocal(3).invoke("startswith", s$38).__nonzero__()) {
                frame.getlocal(0).__setattr__("version", i$39);
            }
            else if (frame.getlocal(3)._eq(s$30).__nonzero__()) {
                frame.getlocal(0).__setattr__("version", i$40);
            }
            else {
                throw Py.makeException(frame.getglobal("UnknownProtocol").__call__(frame.getlocal(3)));
            }
            if (frame.getlocal(0).__getattr__("version")._eq(i$40).__nonzero__()) {
                frame.getlocal(0).__setattr__("msg", frame.getglobal("mimetools").__getattr__("Message").__call__(frame.getglobal("StringIO").__call__()));
                return Py.None;
            }
            frame.getlocal(0).__setattr__("msg", frame.getglobal("mimetools").__getattr__("Message").__call__(frame.getlocal(0).__getattr__("fp"), i$25));
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$25).__nonzero__()) {
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(0).__getattr__("msg").__getattr__("headers");
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(1, t$0$PyObject);
                    Py.printComma(s$41);
                    Py.printComma(frame.getlocal(1));
                }
            }
            frame.getlocal(0).__getattr__("msg").__setattr__("fp", frame.getglobal("None"));
            frame.setlocal(8, frame.getlocal(0).__getattr__("msg").invoke("getheader", s$42));
            if (frame.getlocal(8).__nonzero__()) {
                if (frame.getlocal(8).invoke("lower")._ne(s$43).__nonzero__()) {
                    throw Py.makeException(frame.getglobal("UnknownTransferEncoding").__call__());
                }
                frame.getlocal(0).__setattr__("chunked", i$28);
                frame.getlocal(0).__setattr__("chunk_left", frame.getglobal("None"));
            }
            else {
                frame.getlocal(0).__setattr__("chunked", i$25);
            }
            frame.setlocal(4, frame.getlocal(0).__getattr__("msg").invoke("getheader", s$44));
            if (frame.getlocal(4).__nonzero__()) {
                frame.setlocal(4, frame.getlocal(4).invoke("lower"));
                frame.getlocal(0).__setattr__("will_close", (t$2$PyObject = frame.getlocal(4).invoke("find", s$45)._ne(i$28.__neg__())).__nonzero__() ? t$2$PyObject : ((t$3$PyObject = frame.getlocal(0).__getattr__("version")._ne(i$39)).__nonzero__() ? frame.getlocal(0).__getattr__("msg").invoke("getheader", s$46).__not__() : t$3$PyObject));
            }
            else {
                frame.getlocal(0).__setattr__("will_close", (t$2$PyObject = frame.getlocal(0).__getattr__("version")._ne(i$39)).__nonzero__() ? frame.getlocal(0).__getattr__("msg").invoke("getheader", s$46).__not__() : t$2$PyObject);
            }
            frame.setlocal(2, frame.getlocal(0).__getattr__("msg").invoke("getheader", s$47));
            if (((t$2$PyObject = frame.getlocal(2)).__nonzero__() ? frame.getlocal(0).__getattr__("chunked").__not__() : t$2$PyObject).__nonzero__()) {
                try {
                    frame.getlocal(0).__setattr__("length", frame.getglobal("int").__call__(frame.getlocal(2)));
                }
                catch (Throwable x$3) {
                    t$0$PyException = Py.setException(x$3, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                        frame.getlocal(0).__setattr__("length", frame.getglobal("None"));
                    }
                    else throw t$0$PyException;
                }
            }
            else {
                frame.getlocal(0).__setattr__("length", frame.getglobal("None"));
            }
            if (((t$2$PyObject = ((t$3$PyObject = frame.getlocal(6)._eq(i$48)).__nonzero__() ? t$3$PyObject : frame.getlocal(6)._eq(i$49))).__nonzero__() ? t$2$PyObject : (i$34._le(t$3$PyObject = frame.getlocal(6)).__nonzero__() ? t$3$PyObject._lt(i$50) : Py.Zero)).__nonzero__()) {
                frame.getlocal(0).__setattr__("length", i$25);
            }
            if (((t$2$PyObject = ((t$3$PyObject = frame.getlocal(0).__getattr__("will_close").__not__()).__nonzero__() ? frame.getlocal(0).__getattr__("chunked").__not__() : t$3$PyObject)).__nonzero__() ? frame.getlocal(0).__getattr__("length")._is(frame.getglobal("None")) : t$2$PyObject).__nonzero__()) {
                frame.getlocal(0).__setattr__("will_close", i$28);
            }
            return Py.None;
        }
        
        private static PyObject close$3(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("fp").__nonzero__()) {
                frame.getlocal(0).__getattr__("fp").invoke("close");
                frame.getlocal(0).__setattr__("fp", frame.getglobal("None"));
            }
            return Py.None;
        }
        
        private static PyObject isclosed$4(PyFrame frame) {
            return frame.getlocal(0).__getattr__("fp")._is(frame.getglobal("None"));
        }
        
        private static PyObject read$5(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("fp")._is(frame.getglobal("None")).__nonzero__()) {
                return s$29;
            }
            if (frame.getlocal(0).__getattr__("chunked").__nonzero__()) {
                frame.setlocal(2, frame.getlocal(0).__getattr__("chunk_left"));
                frame.setlocal(4, s$29);
                while (i$28.__nonzero__()) {
                    if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                        frame.setlocal(6, frame.getlocal(0).__getattr__("fp").invoke("readline"));
                        frame.setlocal(3, frame.getlocal(6).invoke("find", s$51));
                        if (frame.getlocal(3)._ge(i$25).__nonzero__()) {
                            frame.setlocal(6, frame.getlocal(6).__getslice__(null, frame.getlocal(3), null));
                        }
                        frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(6), i$52));
                        if (frame.getlocal(2)._eq(i$25).__nonzero__()) {
                            break;
                        }
                    }
                    if (frame.getlocal(1)._is(frame.getglobal("None")).__nonzero__()) {
                        frame.setlocal(4, frame.getlocal(4)._add(frame.getlocal(0).invoke("_safe_read", frame.getlocal(2))));
                    }
                    else if (frame.getlocal(1)._lt(frame.getlocal(2)).__nonzero__()) {
                        frame.setlocal(4, frame.getlocal(4)._add(frame.getlocal(0).invoke("_safe_read", frame.getlocal(1))));
                        frame.getlocal(0).__setattr__("chunk_left", frame.getlocal(2)._sub(frame.getlocal(1)));
                        return frame.getlocal(4);
                    }
                    else if (frame.getlocal(1)._eq(frame.getlocal(2)).__nonzero__()) {
                        frame.setlocal(4, frame.getlocal(4)._add(frame.getlocal(0).invoke("_safe_read", frame.getlocal(1))));
                        frame.getlocal(0).invoke("_safe_read", i$27);
                        frame.getlocal(0).__setattr__("chunk_left", frame.getglobal("None"));
                        return frame.getlocal(4);
                    }
                    else {
                        frame.setlocal(4, frame.getlocal(4)._add(frame.getlocal(0).invoke("_safe_read", frame.getlocal(2))));
                        frame.setlocal(1, frame.getlocal(1)._sub(frame.getlocal(2)));
                    }
                    frame.getlocal(0).invoke("_safe_read", i$27);
                    frame.setlocal(2, frame.getglobal("None"));
                }
                while (i$28.__nonzero__()) {
                    frame.setlocal(6, frame.getlocal(0).__getattr__("fp").invoke("readline"));
                    if (frame.getlocal(6)._eq(s$53).__nonzero__()) {
                        break;
                    }
                }
                frame.getlocal(0).invoke("close");
                return frame.getlocal(4);
            }
            else if (frame.getlocal(1)._is(frame.getglobal("None")).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("will_close").__nonzero__()) {
                    frame.setlocal(5, frame.getlocal(0).__getattr__("fp").invoke("read"));
                }
                else {
                    frame.setlocal(5, frame.getlocal(0).invoke("_safe_read", frame.getlocal(0).__getattr__("length")));
                }
                frame.getlocal(0).invoke("close");
                return frame.getlocal(5);
            }
            if (frame.getlocal(0).__getattr__("length")._isnot(frame.getglobal("None")).__nonzero__()) {
                if (frame.getlocal(1)._gt(frame.getlocal(0).__getattr__("length")).__nonzero__()) {
                    frame.setlocal(1, frame.getlocal(0).__getattr__("length"));
                }
                frame.getlocal(0).__setattr__("length", frame.getlocal(0).__getattr__("length")._sub(frame.getlocal(1)));
            }
            frame.setlocal(5, frame.getlocal(0).__getattr__("fp").invoke("read", frame.getlocal(1)));
            return frame.getlocal(5);
        }
        
        private static PyObject _safe_read$6(PyFrame frame) {
            /* Read the number of bytes requested, compensating for partial reads.
            
                    Normally, we have a blocking socket, but a read() can be interrupted
                    by a signal (resulting in a partial read).
            
                    Note that we cannot distinguish between EOF and an interrupt when zero
                    bytes have been read. IncompleteRead() will be raised in this
                    situation.
            
                    This function should be used when <amt> bytes "should" be present for
                    reading. If the bytes are truly not available (due to EOF), then the
                    IncompleteRead exception can be used to detect the problem.
                     */
            frame.setlocal(3, s$29);
            while (frame.getlocal(1)._gt(i$25).__nonzero__()) {
                frame.setlocal(2, frame.getlocal(0).__getattr__("fp").invoke("read", frame.getlocal(1)));
                if (frame.getlocal(2).__not__().__nonzero__()) {
                    throw Py.makeException(frame.getglobal("IncompleteRead").__call__(frame.getlocal(3)));
                }
                frame.setlocal(3, frame.getlocal(3)._add(frame.getlocal(2)));
                frame.setlocal(1, frame.getlocal(1)._sub(frame.getglobal("len").__call__(frame.getlocal(2))));
            }
            return frame.getlocal(3);
        }
        
        private static PyObject getheader$7(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("msg")._is(frame.getglobal("None")).__nonzero__()) {
                throw Py.makeException(frame.getglobal("ResponseNotReady").__call__());
            }
            return frame.getlocal(0).__getattr__("msg").invoke("getheader", frame.getlocal(1), frame.getlocal(2));
        }
        
        private static PyObject HTTPResponse$8(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {i$25}, c$0___init__));
            frame.setlocal("begin", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_begin));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_close));
            frame.setlocal("isclosed", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_isclosed));
            frame.setlocal("read", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$4_read));
            frame.setlocal("_safe_read", new PyFunction(frame.f_globals, new PyObject[] {}, c$5__safe_read));
            frame.setlocal("getheader", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$6_getheader));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$9(PyFrame frame) {
            frame.getlocal(0).__setattr__("sock", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("_HTTPConnection__response", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("_HTTPConnection__state", frame.getglobal("_CS_IDLE"));
            frame.getlocal(0).invoke("_set_hostport", frame.getlocal(1), frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject _set_hostport$10(PyFrame frame) {
            if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(1).invoke("find", s$56));
                if (frame.getlocal(3)._ge(i$25).__nonzero__()) {
                    frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(1).__getslice__(frame.getlocal(3)._add(i$28), null, null)));
                    frame.setlocal(1, frame.getlocal(1).__getslice__(null, frame.getlocal(3), null));
                }
                else {
                    frame.setlocal(2, frame.getlocal(0).__getattr__("default_port"));
                }
            }
            frame.getlocal(0).__setattr__("host", frame.getlocal(1));
            frame.getlocal(0).__setattr__("port", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject set_debuglevel$11(PyFrame frame) {
            frame.getlocal(0).__setattr__("debuglevel", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject connect$12(PyFrame frame) {
            /* Connect to the host and port specified in __init__. */
            frame.getlocal(0).__setattr__("sock", frame.getglobal("socket").__getattr__("socket").__call__(frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$25).__nonzero__()) {
                Py.println(s$58._mod(new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port")})));
            }
            frame.getlocal(0).__getattr__("sock").invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port")}));
            return Py.None;
        }
        
        private static PyObject close$13(PyFrame frame) {
            /* Close the connection to the HTTP server. */
            if (frame.getlocal(0).__getattr__("sock").__nonzero__()) {
                frame.getlocal(0).__getattr__("sock").invoke("close");
                frame.getlocal(0).__setattr__("sock", frame.getglobal("None"));
            }
            if (frame.getlocal(0).__getattr__("_HTTPConnection__response").__nonzero__()) {
                frame.getlocal(0).__getattr__("_HTTPConnection__response").invoke("close");
                frame.getlocal(0).__setattr__("_HTTPConnection__response", frame.getglobal("None"));
            }
            frame.getlocal(0).__setattr__("_HTTPConnection__state", frame.getglobal("_CS_IDLE"));
            return Py.None;
        }
        
        private static PyObject send$14(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Send `str' to the server. */
            if (frame.getlocal(0).__getattr__("sock")._is(frame.getglobal("None")).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("auto_open").__nonzero__()) {
                    frame.getlocal(0).invoke("connect");
                }
                else {
                    throw Py.makeException(frame.getglobal("NotConnected").__call__());
                }
            }
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$25).__nonzero__()) {
                Py.printComma(s$61);
                Py.println(frame.getglobal("repr").__call__(frame.getlocal(1)));
            }
            try {
                frame.getlocal(0).__getattr__("sock").invoke("send", frame.getlocal(1));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("error"))) {
                    frame.setlocal(2, t$0$PyException.value);
                    if (frame.getlocal(2).__getitem__(i$25)._eq(i$62).__nonzero__()) {
                        frame.getlocal(0).invoke("close");
                    }
                    throw Py.makeException();
                }
                else throw t$0$PyException;
            }
            return Py.None;
        }
        
        private static PyObject putrequest$15(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Send a request to the server.
            
                    `method' specifies an HTTP request method, e.g. 'GET'.
                    `url' specifies the object being requested, e.g. '/index.html'.
                     */
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("_HTTPConnection__response")).__nonzero__() ? frame.getlocal(0).__getattr__("_HTTPConnection__response").invoke("isclosed") : t$0$PyObject).__nonzero__()) {
                frame.getlocal(0).__setattr__("_HTTPConnection__response", frame.getglobal("None"));
            }
            if (frame.getlocal(0).__getattr__("_HTTPConnection__state")._eq(frame.getglobal("_CS_IDLE")).__nonzero__()) {
                frame.getlocal(0).__setattr__("_HTTPConnection__state", frame.getglobal("_CS_REQ_STARTED"));
            }
            else {
                throw Py.makeException(frame.getglobal("CannotSendRequest").__call__());
            }
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(2, s$64);
            }
            frame.setlocal(3, s$65._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(0).__getattr__("_http_vsn_str")})));
            try {
                frame.getlocal(0).invoke("send", frame.getlocal(3));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("error"))) {
                    frame.setlocal(4, t$0$PyException.value);
                    if (((t$0$PyObject = frame.getlocal(4).__getitem__(i$25)._ne(i$62)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("auto_open").__not__()).__nonzero__()) {
                        throw Py.makeException();
                    }
                    frame.getlocal(0).invoke("send", frame.getlocal(3));
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(0).__getattr__("_http_vsn")._eq(i$39).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("port")._eq(frame.getglobal("HTTP_PORT")).__nonzero__()) {
                    frame.getlocal(0).invoke("putheader", s$66, frame.getlocal(0).__getattr__("host"));
                }
                else {
                    frame.getlocal(0).invoke("putheader", s$66, s$67._mod(new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port")})));
                }
                frame.getlocal(0).invoke("putheader", s$68, s$69);
            }
            else {
                // pass
            }
            return Py.None;
        }
        
        private static PyObject putheader$16(PyFrame frame) {
            /* Send a request header line to the server.
            
                    For example: h.putheader('Accept', 'text/html')
                     */
            if (frame.getlocal(0).__getattr__("_HTTPConnection__state")._ne(frame.getglobal("_CS_REQ_STARTED")).__nonzero__()) {
                throw Py.makeException(frame.getglobal("CannotSendHeader").__call__());
            }
            frame.setlocal(3, s$71._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)})));
            frame.getlocal(0).invoke("send", frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject endheaders$17(PyFrame frame) {
            /* Indicate that the last header line has been sent to the server. */
            if (frame.getlocal(0).__getattr__("_HTTPConnection__state")._eq(frame.getglobal("_CS_REQ_STARTED")).__nonzero__()) {
                frame.getlocal(0).__setattr__("_HTTPConnection__state", frame.getglobal("_CS_REQ_SENT"));
            }
            else {
                throw Py.makeException(frame.getglobal("CannotSendHeader").__call__());
            }
            frame.getlocal(0).invoke("send", s$53);
            return Py.None;
        }
        
        private static PyObject request$18(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* Send a complete request to the server. */
            try {
                frame.getlocal(0).invoke("_send_request", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4)});
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("error"))) {
                    frame.setlocal(5, t$0$PyException.value);
                    if (((t$0$PyObject = frame.getlocal(5).__getitem__(i$25)._ne(i$62)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("auto_open").__not__()).__nonzero__()) {
                        throw Py.makeException();
                    }
                    frame.getlocal(0).invoke("_send_request", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4)});
                }
                else throw t$0$PyException;
            }
            return Py.None;
        }
        
        private static PyObject _send_request$19(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getlocal(0).invoke("putrequest", frame.getlocal(1), frame.getlocal(2));
            if (frame.getlocal(3).__nonzero__()) {
                frame.getlocal(0).invoke("putheader", s$74, frame.getglobal("str").__call__(frame.getglobal("len").__call__(frame.getlocal(3))));
            }
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(4).invoke("items");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(t$0$PyObject, 2);
                frame.setlocal(6, t$0$PyObject__[0]);
                frame.setlocal(5, t$0$PyObject__[1]);
                frame.getlocal(0).invoke("putheader", frame.getlocal(6), frame.getlocal(5));
            }
            frame.getlocal(0).invoke("endheaders");
            if (frame.getlocal(3).__nonzero__()) {
                frame.getlocal(0).invoke("send", frame.getlocal(3));
            }
            return Py.None;
        }
        
        private static PyObject getresponse$20(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Get the response from the server. */
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("_HTTPConnection__response")).__nonzero__() ? frame.getlocal(0).__getattr__("_HTTPConnection__response").invoke("isclosed") : t$0$PyObject).__nonzero__()) {
                frame.getlocal(0).__setattr__("_HTTPConnection__response", frame.getglobal("None"));
            }
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("_HTTPConnection__state")._ne(frame.getglobal("_CS_REQ_SENT"))).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("_HTTPConnection__response")).__nonzero__()) {
                throw Py.makeException(frame.getglobal("ResponseNotReady").__call__());
            }
            if (frame.getlocal(0).__getattr__("debuglevel")._gt(i$25).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(0).invoke("response_class", frame.getlocal(0).__getattr__("sock"), frame.getlocal(0).__getattr__("debuglevel")));
            }
            else {
                frame.setlocal(1, frame.getlocal(0).invoke("response_class", frame.getlocal(0).__getattr__("sock")));
            }
            frame.getlocal(1).invoke("begin");
            frame.getlocal(0).__setattr__("_HTTPConnection__state", frame.getglobal("_CS_IDLE"));
            if (frame.getlocal(1).__getattr__("will_close").__nonzero__()) {
                frame.getlocal(0).invoke("close");
            }
            else {
                frame.getlocal(0).__setattr__("_HTTPConnection__response", frame.getlocal(1));
            }
            return frame.getlocal(1);
        }
        
        private static PyObject HTTPConnection$21(PyFrame frame) {
            frame.setlocal("_http_vsn", i$39);
            frame.setlocal("_http_vsn_str", s$55);
            frame.setlocal("response_class", frame.getname("HTTPResponse"));
            frame.setlocal("default_port", frame.getname("HTTP_PORT"));
            frame.setlocal("auto_open", i$28);
            frame.setlocal("debuglevel", i$25);
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$8___init__));
            frame.setlocal("_set_hostport", new PyFunction(frame.f_globals, new PyObject[] {}, c$9__set_hostport));
            frame.setlocal("set_debuglevel", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_set_debuglevel));
            frame.setlocal("connect", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_connect));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_close));
            frame.setlocal("send", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_send));
            frame.setlocal("putrequest", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_putrequest));
            frame.setlocal("putheader", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_putheader));
            frame.setlocal("endheaders", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_endheaders));
            frame.setlocal("request", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), new PyDictionary(new PyObject[] {})}, c$17_request));
            frame.setlocal("_send_request", new PyFunction(frame.f_globals, new PyObject[] {}, c$18__send_request));
            frame.setlocal("getresponse", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_getresponse));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$22(PyFrame frame) {
            frame.getlocal(0).__setattr__("_FakeSocket__sock", frame.getlocal(1));
            frame.getlocal(0).__setattr__("_FakeSocket__ssl", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject makefile$23(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Return a readable file-like object with data from socket.
            
                    This method offers only partial support for the makefile
                    interface of a real socket.  It only supports modes 'r' and
                    'rb' and the bufsize argument is ignored.
            
                    The returned object contains *all* of the file data
                     */
            if (((t$0$PyObject = frame.getlocal(1)._ne(s$77)).__nonzero__() ? frame.getlocal(1)._ne(s$24) : t$0$PyObject).__nonzero__()) {
                throw Py.makeException(frame.getglobal("UnimplementedFileMode").__call__());
            }
            frame.setlocal(5, new PyList(new PyObject[] {}));
            while (i$28.__nonzero__()) {
                try {
                    frame.setlocal(3, frame.getlocal(0).__getattr__("_FakeSocket__ssl").invoke("read"));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("sslerror"))) {
                        frame.setlocal(4, t$0$PyException.value);
                        break;
                    }
                    else throw t$0$PyException;
                }
                if (frame.getlocal(3)._eq(s$29).__nonzero__()) {
                    break;
                }
                frame.getlocal(5).invoke("append", frame.getlocal(3));
            }
            return frame.getglobal("StringIO").__call__(s$29.invoke("join", frame.getlocal(5)));
        }
        
        private static PyObject send$24(PyFrame frame) {
            return frame.getlocal(0).__getattr__("_FakeSocket__ssl").invoke("write", frame.getlocal(1));
        }
        
        private static PyObject recv$25(PyFrame frame) {
            return frame.getlocal(0).__getattr__("_FakeSocket__ssl").invoke("read", frame.getlocal(1));
        }
        
        private static PyObject __getattr__$26(PyFrame frame) {
            return frame.getglobal("getattr").__call__(frame.getlocal(0).__getattr__("_FakeSocket__sock"), frame.getlocal(1));
        }
        
        private static PyObject FakeSocket$27(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$21___init__));
            frame.setlocal("makefile", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$22_makefile));
            frame.setlocal("send", new PyFunction(frame.f_globals, new PyObject[] {i$25}, c$23_send));
            frame.setlocal("recv", new PyFunction(frame.f_globals, new PyObject[] {i$78, i$25}, c$24_recv));
            frame.setlocal("__getattr__", new PyFunction(frame.f_globals, new PyObject[] {}, c$25___getattr__));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$28(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(4, frame.getlocal(3).invoke("keys"));
            try {
                frame.getlocal(4).invoke("remove", s$80);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    // pass
                }
                else throw t$0$PyException;
            }
            try {
                frame.getlocal(4).invoke("remove", s$81);
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    // pass
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(4).__nonzero__()) {
                throw Py.makeException(frame.getglobal("IllegalKeywordArgument").__call__());
            }
            frame.getglobal("HTTPConnection").invoke("__init__", new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2)});
            frame.getlocal(0).__setattr__("key_file", frame.getlocal(3).invoke("get", s$80));
            frame.getlocal(0).__setattr__("cert_file", frame.getlocal(3).invoke("get", s$81));
            return Py.None;
        }
        
        private static PyObject connect$29(PyFrame frame) {
            /* Connect to a host on a given (SSL) port. */
            frame.setlocal(2, frame.getglobal("socket").__getattr__("socket").__call__(frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
            frame.getlocal(2).invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port")}));
            frame.setlocal(3, frame.getlocal(2));
            if (frame.getglobal("hasattr").__call__(frame.getlocal(2), s$83).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(2).__getattr__("_sock"));
            }
            frame.setlocal(1, frame.getglobal("socket").__getattr__("ssl").__call__(frame.getlocal(3), frame.getlocal(0).__getattr__("key_file"), frame.getlocal(0).__getattr__("cert_file")));
            frame.getlocal(0).__setattr__("sock", frame.getglobal("FakeSocket").__call__(frame.getlocal(2), frame.getlocal(1)));
            return Py.None;
        }
        
        private static PyObject HTTPSConnection$30(PyFrame frame) {
            /* This class allows communication via SSL. */
            frame.setlocal("default_port", frame.getname("HTTPS_PORT"));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$27___init__));
            frame.setlocal("connect", new PyFunction(frame.f_globals, new PyObject[] {}, c$28_connect));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$31(PyFrame frame) {
            /* Provide a default host, since the superclass requires one. */
            if (frame.getlocal(2)._eq(i$25).__nonzero__()) {
                frame.setlocal(2, frame.getglobal("None"));
            }
            frame.getlocal(0).__setattr__("_conn", frame.getlocal(0).invoke("_connection_class", frame.getlocal(1), frame.getlocal(2)));
            frame.getlocal(0).__setattr__("send", frame.getlocal(0).__getattr__("_conn").__getattr__("send"));
            frame.getlocal(0).__setattr__("putrequest", frame.getlocal(0).__getattr__("_conn").__getattr__("putrequest"));
            frame.getlocal(0).__setattr__("endheaders", frame.getlocal(0).__getattr__("_conn").__getattr__("endheaders"));
            frame.getlocal(0).__getattr__("_conn").__setattr__("_http_vsn", frame.getlocal(0).__getattr__("_http_vsn"));
            frame.getlocal(0).__getattr__("_conn").__setattr__("_http_vsn_str", frame.getlocal(0).__getattr__("_http_vsn_str"));
            frame.getlocal(0).__setattr__("key_file", frame.getlocal(3).invoke("get", s$80));
            frame.getlocal(0).__setattr__("cert_file", frame.getlocal(3).invoke("get", s$81));
            frame.getlocal(0).__setattr__("file", frame.getglobal("None"));
            return Py.None;
        }
        
        private static PyObject connect$32(PyFrame frame) {
            /* Accept arguments to set the host/port, since the superclass doesn't. */
            if (frame.getlocal(1)._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(0).__getattr__("_conn").invoke("_set_hostport", frame.getlocal(1), frame.getlocal(2));
            }
            frame.getlocal(0).__getattr__("_conn").invoke("connect");
            return Py.None;
        }
        
        private static PyObject set_debuglevel$33(PyFrame frame) {
            frame.getlocal(0).__getattr__("_conn").invoke("set_debuglevel", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject getfile$34(PyFrame frame) {
            /* Provide a getfile, since the superclass' does not use this concept. */
            return frame.getlocal(0).__getattr__("file");
        }
        
        private static PyObject putheader$35(PyFrame frame) {
            /* The superclass allows only one value argument. */
            frame.getlocal(0).__getattr__("_conn").invoke("putheader", frame.getlocal(1), s$89.invoke("join", frame.getlocal(2)));
            return Py.None;
        }
        
        private static PyObject getreply$36(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Compat definition since superclass does not define it.
            
                    Returns a tuple consisting of:
                    - server status code (e.g. '200' if all goes well)
                    - server "reason" corresponding to status code
                    - any RFC822 headers in the response from the server
                     */
            try {
                frame.setlocal(1, frame.getlocal(0).__getattr__("_conn").invoke("getresponse"));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("BadStatusLine"))) {
                    frame.setlocal(2, t$0$PyException.value);
                    frame.getlocal(0).__setattr__("file", frame.getlocal(0).__getattr__("_conn").__getattr__("sock").invoke("makefile", s$24, i$25));
                    frame.getlocal(0).invoke("close");
                    frame.getlocal(0).__setattr__("headers", frame.getglobal("None"));
                    return new PyTuple(new PyObject[] {i$28.__neg__(), frame.getlocal(2).__getattr__("line"), frame.getglobal("None")});
                }
                else throw t$0$PyException;
            }
            frame.getlocal(0).__setattr__("headers", frame.getlocal(1).__getattr__("msg"));
            frame.getlocal(0).__setattr__("file", frame.getlocal(1).__getattr__("fp"));
            return new PyTuple(new PyObject[] {frame.getlocal(1).__getattr__("status"), frame.getlocal(1).__getattr__("reason"), frame.getlocal(1).__getattr__("msg")});
        }
        
        private static PyObject close$37(PyFrame frame) {
            frame.getlocal(0).__getattr__("_conn").invoke("close");
            frame.getlocal(0).__setattr__("file", frame.getglobal("None"));
            return Py.None;
        }
        
        private static PyObject HTTP$38(PyFrame frame) {
            /* Compatibility class with httplib.py from 1.5. */
            frame.setlocal("_http_vsn", i$37);
            frame.setlocal("_http_vsn_str", s$36);
            frame.setlocal("debuglevel", i$25);
            frame.setlocal("_connection_class", frame.getname("HTTPConnection"));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$29, frame.getname("None")}, c$30___init__));
            frame.setlocal("connect", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), frame.getname("None")}, c$31_connect));
            frame.setlocal("set_debuglevel", new PyFunction(frame.f_globals, new PyObject[] {}, c$32_set_debuglevel));
            frame.setlocal("getfile", new PyFunction(frame.f_globals, new PyObject[] {}, c$33_getfile));
            frame.setlocal("putheader", new PyFunction(frame.f_globals, new PyObject[] {}, c$34_putheader));
            frame.setlocal("getreply", new PyFunction(frame.f_globals, new PyObject[] {}, c$35_getreply));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$36_close));
            return frame.getf_locals();
        }
        
        private static PyObject HTTPS$39(PyFrame frame) {
            /* Compatibility with 1.5 httplib interface
            
                    Python 1.5.2 did not have an HTTPS class, but it defined an
                    interface for sending http requests that is also useful for
                    https.
                     */
            frame.setlocal("_connection_class", frame.getname("HTTPSConnection"));
            return frame.getf_locals();
        }
        
        private static PyObject HTTPException$40(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject NotConnected$41(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject __init__$42(PyFrame frame) {
            frame.getlocal(0).__setattr__("version", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject UnknownProtocol$43(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$41___init__));
            return frame.getf_locals();
        }
        
        private static PyObject UnknownTransferEncoding$44(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject IllegalKeywordArgument$45(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject UnimplementedFileMode$46(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject __init__$47(PyFrame frame) {
            frame.getlocal(0).__setattr__("partial", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject IncompleteRead$48(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$46___init__));
            return frame.getf_locals();
        }
        
        private static PyObject ImproperConnectionState$49(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject CannotSendRequest$50(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject CannotSendHeader$51(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject ResponseNotReady$52(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject __init__$53(PyFrame frame) {
            frame.getlocal(0).__setattr__("line", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject BadStatusLine$54(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$52___init__));
            return frame.getf_locals();
        }
        
        private static PyObject test$55(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int, t$2$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject, t$5$PyObject;
            
            // Code
            /* Test this module.
            
                The test consists of retrieving and displaying the Python
                home page, along with the error code and error string returned
                by the www.python.org server.
                 */
            frame.setlocal(3, org.python.core.imp.importOne("sys", frame));
            frame.setlocal(2, org.python.core.imp.importOne("getopt", frame));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(2).__getattr__("getopt").__call__(frame.getlocal(3).__getattr__("argv").__getslice__(i$28, null, null), s$94), 2);
            frame.setlocal(4, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            frame.setlocal(8, i$25);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(4);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(t$0$PyObject, 2);
                frame.setlocal(6, t$0$PyObject__[0]);
                frame.setlocal(13, t$0$PyObject__[1]);
                if (frame.getlocal(6)._eq(s$95).__nonzero__()) {
                    frame.setlocal(8, frame.getlocal(8)._add(i$28));
                }
            }
            frame.setlocal(5, s$96);
            frame.setlocal(9, s$64);
            if (frame.getlocal(1).__getslice__(i$25, null, null).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(1).__getitem__(i$25));
            }
            if (frame.getlocal(1).__getslice__(i$28, null, null).__nonzero__()) {
                frame.setlocal(9, frame.getlocal(1).__getitem__(i$28));
            }
            frame.setlocal(11, frame.getglobal("HTTP").__call__());
            frame.getlocal(11).invoke("set_debuglevel", frame.getlocal(8));
            frame.getlocal(11).invoke("connect", frame.getlocal(5));
            frame.getlocal(11).invoke("putrequest", s$97, frame.getlocal(9));
            frame.getlocal(11).invoke("endheaders");
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(11).invoke("getreply"), 3);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(12, t$0$PyObject__[1]);
            frame.setlocal(0, t$0$PyObject__[2]);
            Py.printComma(s$98);
            Py.println(frame.getlocal(7));
            Py.printComma(s$99);
            Py.println(frame.getlocal(12));
            Py.println();
            if (frame.getlocal(0).__nonzero__()) {
                t$1$int = 0;
                t$3$PyObject = frame.getlocal(0).__getattr__("headers");
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    frame.setlocal(10, t$2$PyObject);
                    Py.println(frame.getlocal(10).invoke("strip"));
                }
            }
            Py.println();
            Py.println(frame.getlocal(11).invoke("getfile").invoke("read"));
            if (frame.getglobal("hasattr").__call__(frame.getglobal("socket"), s$91).__nonzero__()) {
                frame.setlocal(5, s$100);
                frame.setlocal(9, s$101);
                frame.setlocal(14, frame.getglobal("HTTPS").__call__());
                frame.getlocal(14).invoke("connect", frame.getlocal(5));
                frame.getlocal(14).invoke("putrequest", s$97, frame.getlocal(9));
                frame.getlocal(14).invoke("endheaders");
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(14).invoke("getreply"), 3);
                frame.setlocal(7, t$0$PyObject__[0]);
                frame.setlocal(12, t$0$PyObject__[1]);
                frame.setlocal(0, t$0$PyObject__[2]);
                Py.printComma(s$98);
                Py.println(frame.getlocal(7));
                Py.printComma(s$99);
                Py.println(frame.getlocal(12));
                Py.println();
                if (frame.getlocal(0).__nonzero__()) {
                    t$2$int = 0;
                    t$5$PyObject = frame.getlocal(0).__getattr__("headers");
                    while ((t$4$PyObject = t$5$PyObject.__finditem__(t$2$int++)) != null) {
                        frame.setlocal(10, t$4$PyObject);
                        Py.println(frame.getlocal(10).invoke("strip"));
                    }
                }
                Py.println();
                Py.println(frame.getlocal(14).invoke("getfile").invoke("read"));
            }
            return Py.None;
        }
        
        private static PyObject main$56(PyFrame frame) {
            frame.setglobal("__file__", s$103);
            
            PyObject[] imp_accu;
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* HTTP/1.1 client library
            
            <intro stuff goes here>
            <other stuff, too>
            
            HTTPConnection go through a number of "states", which defines when a client
            may legally make another request or fetch the response for a particular
            request. This diagram details these state transitions:
            
                (null)
                  |
                  | HTTPConnection()
                  v
                Idle
                  |
                  | putrequest()
                  v
                Request-started
                  |
                  | ( putheader() )*  endheaders()
                  v
                Request-sent
                  |
                  | response = getresponse()
                  v
                Unread-response   [Response-headers-read]
                  |\____________________
                  |                     |
                  | response.read()     | putrequest()
                  v                     v
                Idle                  Req-started-unread-response
                                 ______/|
                               /        |
               response.read() |        | ( putheader() )*  endheaders()
                               v        v
                   Request-started    Req-sent-unread-response
                                        |
                                        | response.read()
                                        v
                                      Request-sent
            
            This diagram presents the following rules:
              -- a second request may not be started until {response-headers-read}
              -- a response [object] cannot be retrieved until {request-sent}
              -- there is no differentiation between an unread response body and a
                 partially read response body
            
            Note: this enforcement is applied by the HTTPConnection class. The
                  HTTPResponse class does not enforce this state machine, which
                  implies sophisticated clients may accelerate the request/response
                  pipeline. Caution should be taken, though: accelerating the states
                  beyond the above pattern may imply knowledge of the server's
                  connection-close behavior for certain requests. For example, it
                  is impossible to tell whether the server will close the connection
                  UNTIL the response headers have been read; this means that further
                  requests cannot be placed into the pipeline until it is known that
                  the server will NOT be closing the connection.
            
            Logical State                  __state            __response
            -------------                  -------            ----------
            Idle                           _CS_IDLE           None
            Request-started                _CS_REQ_STARTED    None
            Request-sent                   _CS_REQ_SENT       None
            Unread-response                _CS_IDLE           <response_class>
            Req-started-unread-response    _CS_REQ_STARTED    <response_class>
            Req-sent-unread-response       _CS_REQ_SENT       <response_class>
             */
            frame.setlocal("socket", org.python.core.imp.importOne("socket", frame));
            frame.setlocal("mimetools", org.python.core.imp.importOne("mimetools", frame));
            try {
                imp_accu = org.python.core.imp.importFrom("cStringIO", new String[] {"StringIO"}, frame);
                frame.setlocal("StringIO", imp_accu[0]);
                imp_accu = null;
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getname("ImportError"))) {
                    imp_accu = org.python.core.imp.importFrom("StringIO", new String[] {"StringIO"}, frame);
                    frame.setlocal("StringIO", imp_accu[0]);
                    imp_accu = null;
                }
                else throw t$0$PyException;
            }
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4, s$5, s$6, s$7, s$8, s$9, s$10, s$11, s$12, s$13, s$14, s$15, s$16, s$17}));
            frame.setlocal("HTTP_PORT", i$18);
            frame.setlocal("HTTPS_PORT", i$19);
            frame.setlocal("_UNKNOWN", s$20);
            frame.setlocal("_CS_IDLE", s$21);
            frame.setlocal("_CS_REQ_STARTED", s$22);
            frame.setlocal("_CS_REQ_SENT", s$23);
            frame.setlocal("HTTPResponse", Py.makeClass("HTTPResponse", new PyObject[] {}, c$7_HTTPResponse, null));
            frame.setlocal("HTTPConnection", Py.makeClass("HTTPConnection", new PyObject[] {}, c$20_HTTPConnection, null));
            frame.setlocal("FakeSocket", Py.makeClass("FakeSocket", new PyObject[] {}, c$26_FakeSocket, null));
            frame.setlocal("HTTPSConnection", Py.makeClass("HTTPSConnection", new PyObject[] {frame.getname("HTTPConnection")}, c$29_HTTPSConnection, null));
            frame.setlocal("HTTP", Py.makeClass("HTTP", new PyObject[] {}, c$37_HTTP, null));
            if (frame.getname("hasattr").__call__(frame.getname("socket"), s$91).__nonzero__()) {
                frame.setlocal("HTTPS", Py.makeClass("HTTPS", new PyObject[] {frame.getname("HTTP")}, c$38_HTTPS, null));
            }
            frame.setlocal("HTTPException", Py.makeClass("HTTPException", new PyObject[] {frame.getname("Exception")}, c$39_HTTPException, null));
            frame.setlocal("NotConnected", Py.makeClass("NotConnected", new PyObject[] {frame.getname("HTTPException")}, c$40_NotConnected, null));
            frame.setlocal("UnknownProtocol", Py.makeClass("UnknownProtocol", new PyObject[] {frame.getname("HTTPException")}, c$42_UnknownProtocol, null));
            frame.setlocal("UnknownTransferEncoding", Py.makeClass("UnknownTransferEncoding", new PyObject[] {frame.getname("HTTPException")}, c$43_UnknownTransferEncoding, null));
            frame.setlocal("IllegalKeywordArgument", Py.makeClass("IllegalKeywordArgument", new PyObject[] {frame.getname("HTTPException")}, c$44_IllegalKeywordArgument, null));
            frame.setlocal("UnimplementedFileMode", Py.makeClass("UnimplementedFileMode", new PyObject[] {frame.getname("HTTPException")}, c$45_UnimplementedFileMode, null));
            frame.setlocal("IncompleteRead", Py.makeClass("IncompleteRead", new PyObject[] {frame.getname("HTTPException")}, c$47_IncompleteRead, null));
            frame.setlocal("ImproperConnectionState", Py.makeClass("ImproperConnectionState", new PyObject[] {frame.getname("HTTPException")}, c$48_ImproperConnectionState, null));
            frame.setlocal("CannotSendRequest", Py.makeClass("CannotSendRequest", new PyObject[] {frame.getname("ImproperConnectionState")}, c$49_CannotSendRequest, null));
            frame.setlocal("CannotSendHeader", Py.makeClass("CannotSendHeader", new PyObject[] {frame.getname("ImproperConnectionState")}, c$50_CannotSendHeader, null));
            frame.setlocal("ResponseNotReady", Py.makeClass("ResponseNotReady", new PyObject[] {frame.getname("ImproperConnectionState")}, c$51_ResponseNotReady, null));
            frame.setlocal("BadStatusLine", Py.makeClass("BadStatusLine", new PyObject[] {frame.getname("HTTPException")}, c$53_BadStatusLine, null));
            frame.setlocal("error", frame.getname("HTTPException"));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {}, c$54_test));
            if (frame.getname("__name__")._eq(s$102).__nonzero__()) {
                frame.getname("test").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("httplib"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "httplib";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(httplib._PyInner.class, newargs, httplib.jpy$packages, httplib.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
