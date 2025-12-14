import org.python.core.*;

public class rfc822 extends java.lang.Object {
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
        private static PyObject i$10;
        private static PyObject i$11;
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
        private static PyObject s$104;
        private static PyObject s$105;
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
        private static PyObject i$126;
        private static PyObject s$127;
        private static PyObject i$128;
        private static PyObject s$129;
        private static PyObject i$130;
        private static PyObject s$131;
        private static PyObject s$132;
        private static PyObject i$133;
        private static PyObject s$134;
        private static PyObject s$135;
        private static PyObject i$136;
        private static PyObject s$137;
        private static PyObject s$138;
        private static PyObject i$139;
        private static PyObject s$140;
        private static PyObject s$141;
        private static PyObject i$142;
        private static PyObject s$143;
        private static PyObject i$144;
        private static PyObject s$145;
        private static PyObject i$146;
        private static PyObject i$147;
        private static PyObject i$148;
        private static PyObject s$149;
        private static PyObject i$150;
        private static PyObject i$151;
        private static PyObject i$152;
        private static PyObject s$153;
        private static PyObject i$154;
        private static PyObject s$155;
        private static PyObject i$156;
        private static PyObject s$157;
        private static PyObject s$158;
        private static PyObject s$159;
        private static PyObject s$160;
        private static PyObject s$161;
        private static PyObject s$162;
        private static PyObject s$163;
        private static PyObject s$164;
        private static PyObject s$165;
        private static PyObject s$166;
        private static PyObject s$167;
        private static PyObject s$168;
        private static PyObject s$169;
        private static PyObject s$170;
        private static PyObject s$171;
        private static PyObject s$172;
        private static PyObject s$173;
        private static PyObject s$174;
        private static PyObject s$175;
        private static PyObject i$176;
        private static PyObject s$177;
        private static PyObject s$178;
        private static PyObject s$179;
        private static PyObject s$180;
        private static PyObject s$181;
        private static PyObject s$182;
        private static PyObject s$183;
        private static PyObject s$184;
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_rewindbody;
        private static PyCode c$2_readheaders;
        private static PyCode c$3_isheader;
        private static PyCode c$4_islast;
        private static PyCode c$5_iscomment;
        private static PyCode c$6_getallmatchingheaders;
        private static PyCode c$7_getfirstmatchingheader;
        private static PyCode c$8_getrawheader;
        private static PyCode c$9_getheader;
        private static PyCode c$10_getheaders;
        private static PyCode c$11_getaddr;
        private static PyCode c$12_getaddrlist;
        private static PyCode c$13_getdate;
        private static PyCode c$14_getdate_tz;
        private static PyCode c$15___len__;
        private static PyCode c$16___getitem__;
        private static PyCode c$17___setitem__;
        private static PyCode c$18___delitem__;
        private static PyCode c$19_has_key;
        private static PyCode c$20_keys;
        private static PyCode c$21_values;
        private static PyCode c$22_items;
        private static PyCode c$23___str__;
        private static PyCode c$24_Message;
        private static PyCode c$25_unquote;
        private static PyCode c$26_quote;
        private static PyCode c$27_parseaddr;
        private static PyCode c$28___init__;
        private static PyCode c$29_gotonext;
        private static PyCode c$30_getaddrlist;
        private static PyCode c$31_getaddress;
        private static PyCode c$32_getrouteaddr;
        private static PyCode c$33_getaddrspec;
        private static PyCode c$34_getdomain;
        private static PyCode c$35_getdelimited;
        private static PyCode c$36_getquote;
        private static PyCode c$37_getcomment;
        private static PyCode c$38_getdomainliteral;
        private static PyCode c$39_getatom;
        private static PyCode c$40_getphraselist;
        private static PyCode c$41_AddrlistClass;
        private static PyCode c$42___init__;
        private static PyCode c$43___len__;
        private static PyCode c$44___str__;
        private static PyCode c$45___add__;
        private static PyCode c$46___iadd__;
        private static PyCode c$47___sub__;
        private static PyCode c$48___isub__;
        private static PyCode c$49___getitem__;
        private static PyCode c$50_AddressList;
        private static PyCode c$51_dump_address_pair;
        private static PyCode c$52_parsedate_tz;
        private static PyCode c$53_parsedate;
        private static PyCode c$54_mktime_tz;
        private static PyCode c$55_formatdate;
        private static PyCode c$56_main;
        private static void initConstants() {
            s$0 = Py.newString("RFC-822 message manipulation class.\012\012XXX This is only a very rough sketch of a full RFC-822 parser;\012in particular the tokenizing of addresses does not adhere to all the\012quoting rules.\012\012Directions for use:\012\012To create a Message object: first open a file, e.g.:\012  fp = open(file, 'r')\012You can use any other legal way of getting an open file object, e.g. use\012sys.stdin or call os.popen().\012Then pass the open file object to the Message() constructor:\012  m = Message(fp)\012\012This class can work with any input object that supports a readline\012method.  If the input object has seek and tell capability, the\012rewindbody method will work; also illegal lines will be pushed back\012onto the input stream.  If the input object lacks seek but has an\012`unread' method that can push back a line of input, Message will use\012that to push back illegal lines.  Thus this class can be used to parse\012messages coming from a buffered stream.\012\012The optional `seekable' argument is provided as a workaround for\012certain stdio libraries in which tell() discards buffered data before\012discovering that the lseek() system call doesn't work.  For maximum\012portability, you should set the seekable argument to zero to prevent\012that initial \\code{tell} when passing in an unseekable object such as\012a a file object created from a socket object.  If it is 1 on entry --\012which it is by default -- the tell() method of the open file object is\012called once; if this raises an exception, seekable is reset to 0.  For\012other nonzero values of seekable, this test is not made.\012\012To get the text of a particular header there are several methods:\012  str = m.getheader(name)\012  str = m.getrawheader(name)\012where name is the name of the header, e.g. 'Subject'.\012The difference is that getheader() strips the leading and trailing\012whitespace, while getrawheader() doesn't.  Both functions retain\012embedded whitespace (including newlines) exactly as they are\012specified in the header, and leave the case of the text unchanged.\012\012For addresses and address lists there are functions\012  realname, mailaddress = m.getaddr(name) and\012  list = m.getaddrlist(name)\012where the latter returns a list of (realname, mailaddr) tuples.\012\012There is also a method\012  time = m.getdate(name)\012which parses a Date-like field and returns a time-compatible tuple,\012i.e. a tuple such as returned by time.localtime() or accepted by\012time.mktime().\012\012See the class definition for lower level access methods.\012\012There are also some utility functions here.\012");
            s$1 = Py.newString("Message");
            s$2 = Py.newString("AddressList");
            s$3 = Py.newString("parsedate");
            s$4 = Py.newString("parsedate_tz");
            s$5 = Py.newString("mktime_tz");
            s$6 = Py.newString("\015\012");
            s$7 = Py.newString("\012");
            s$8 = Py.newString("Represents a single RFC-822-compliant message.");
            s$9 = Py.newString("Initialize the class instance and read the headers.");
            i$10 = Py.newInteger(1);
            i$11 = Py.newInteger(0);
            s$12 = Py.newString("Rewind the file to the start of the body (if seekable).");
            s$13 = Py.newString("unseekable file");
            s$14 = Py.newString("Read header lines.\012\012        Read header lines up to the entirely blank line that\012        terminates them.  The (normally blank) line that ends the\012        headers is skipped, but not included in the returned list.\012        If a non-header line ends the headers, (which is an error),\012        an attempt is made to backspace over it; it is never\012        included in the returned list.\012\012        The variable self.status is set to the empty string if all\012        went well, otherwise it is an error message.\012        The variable self.headers is a completely uninterpreted list\012        of lines contained in the header (so printing them will\012        reproduce the header exactly as it appears in the file).\012        ");
            s$15 = Py.newString("");
            s$16 = Py.newString("unread");
            s$17 = Py.newString("EOF in headers");
            s$18 = Py.newString("From ");
            s$19 = Py.newString(" \011");
            s$20 = Py.newString("\012 ");
            s$21 = Py.newString("No headers");
            s$22 = Py.newString("Non-header line where header expected");
            s$23 = Py.newString("; bad seek");
            s$24 = Py.newString("Determine whether a given line is a legal header.\012\012        This method should return the header name, suitably canonicalized.\012        You may override this method in order to use Message parsing\012        on tagged data in RFC822-like formats with special header formats.\012        ");
            s$25 = Py.newString(":");
            s$26 = Py.newString("Determine whether a line is a legal end of RFC-822 headers.\012\012        You may override this method if your application wants\012        to bend the rules, e.g. to strip trailing whitespace,\012        or to recognize MH template separators ('--------').\012        For convenience (e.g. for code reading from sockets) a\012        line consisting of \015\012 also matches.\012        ");
            s$27 = Py.newString("Determine whether a line should be skipped entirely.\012\012        You may override this method in order to use Message parsing\012        on tagged data in RFC822-like formats that support embedded\012        comments or free-text data.\012        ");
            s$28 = Py.newString("Find all header lines matching a given header name.\012\012        Look through the list of headers and find all lines\012        matching a given header name (and their continuation\012        lines).  A list of the lines is returned, without\012        interpretation.  If the header does not occur, an\012        empty list is returned.  If the header occurs multiple\012        times, all occurrences are returned.  Case is not\012        important in the header name.\012        ");
            s$29 = Py.newString("Get the first header line matching name.\012\012        This is similar to getallmatchingheaders, but it returns\012        only the first matching header (and its continuation\012        lines).\012        ");
            s$30 = Py.newString("A higher-level interface to getfirstmatchingheader().\012\012        Return a string containing the literal text of the\012        header but with the keyword stripped.  All leading,\012        trailing and embedded whitespace is kept in the\012        string, however.\012        Return None if the header does not occur.\012        ");
            s$31 = Py.newString("Get the header value for a name.\012\012        This is the normal interface: it returns a stripped\012        version of the header value for a given header name,\012        or None if it doesn't exist.  This uses the dictionary\012        version which finds the *last* such header.\012        ");
            s$32 = Py.newString("Get all values for a header.\012\012        This returns a list of values for headers given more than once;\012        each value in the result list is stripped in the same way as the\012        result of getheader().  If the header is not given, return an\012        empty list.\012        ");
            s$33 = Py.newString("%s\012 %s");
            s$34 = Py.newString("Get a single address from a header, as a tuple.\012\012        An example return value:\012        ('Guido van Rossum', 'guido@cwi.nl')\012        ");
            s$35 = Py.newString("Get a list of addresses from a header.\012\012        Retrieves a list of addresses from a header, where each address is a\012        tuple as returned by getaddr().  Scans all named headers, so it works\012        properly with multiple To: or Cc: headers for example.\012\012        ");
            s$36 = Py.newString(", ");
            s$37 = Py.newString("Retrieve a date field from a header.\012\012        Retrieves a date field from the named header, returning\012        a tuple compatible with time.mktime().\012        ");
            s$38 = Py.newString("Retrieve a date field from a header as a 10-tuple.\012\012        The first 9 elements make up a tuple compatible with\012        time.mktime(), and the 10th is the offset of the poster's\012        time zone from GMT/UTC.\012        ");
            s$39 = Py.newString("Get the number of headers in a message.");
            s$40 = Py.newString("Get a specific header, as from a dictionary.");
            s$41 = Py.newString("Set the value of a header.\012\012        Note: This is not a perfect inversion of __getitem__, because\012        any changed headers get stuck at the end of the raw-headers list\012        rather than where the altered header was.\012        ");
            s$42 = Py.newString(": ");
            s$43 = Py.newString("Delete all occurrences of a specific header, if it is present.");
            s$44 = Py.newString("Determine whether a message contains the named header.");
            s$45 = Py.newString("Get all of a message's header field names.");
            s$46 = Py.newString("Get all of a message's header field values.");
            s$47 = Py.newString("Get all of a message's headers.\012\012        Returns a list of name, value tuples.\012        ");
            s$48 = Py.newString("Remove quotes from a string.");
            s$49 = Py.newString("\"");
            s$50 = Py.newString("<");
            s$51 = Py.newString(">");
            s$52 = Py.newString("Add quotes around a string.");
            s$53 = Py.newString("\\");
            s$54 = Py.newString("\\\\");
            s$55 = Py.newString("\\\"");
            s$56 = Py.newString("Parse an address into a (realname, mailaddr) tuple.");
            s$57 = Py.newString("Address parser class by Ben Escoto.\012\012    To understand what this class does, it helps to have a copy of\012    RFC-822 in front of you.\012\012    Note: this class interface is deprecated and may be removed in the future.\012    Use rfc822.AddressList instead.\012    ");
            s$58 = Py.newString("Initialize a new instance.\012\012        `field' is an unparsed address header field, containing\012        one or more addresses.\012        ");
            s$59 = Py.newString("()<>@,:;.\"[]");
            s$60 = Py.newString("Parse up to the start of the next address.");
            s$61 = Py.newString("\012\015");
            s$62 = Py.newString("(");
            s$63 = Py.newString("Parse all addresses.\012\012        Returns a list containing all of the addresses.\012        ");
            s$64 = Py.newString("Parse the next address.");
            s$65 = Py.newString(" ");
            s$66 = Py.newString(".@");
            s$67 = Py.newString(";");
            s$68 = Py.newString(" (");
            s$69 = Py.newString(")");
            s$70 = Py.newString(",");
            s$71 = Py.newString("Parse a route address (Return-path value).\012\012        This method just skips all the route stuff and returns the addrspec.\012        ");
            s$72 = Py.newString("@");
            s$73 = Py.newString("Parse an RFC-822 addr-spec.");
            s$74 = Py.newString(".");
            s$75 = Py.newString("\"%s\"");
            s$76 = Py.newString("Get the complete domain name from an address.");
            s$77 = Py.newString("[");
            s$78 = Py.newString("Parse a header fragment delimited by special characters.\012\012        `beginchar' is the start character for the fragment.\012        If self is not looking at an instance of `beginchar' then\012        getdelimited returns the empty string.\012\012        `endchars' is a sequence of allowable end-delimiting characters.\012        Parsing stops when one of these is encountered.\012\012        If `allowcomments' is non-zero, embedded RFC-822 comments\012        are allowed within the parsed fragment.\012        ");
            s$79 = Py.newString("Get a quote-delimited fragment from self's field.");
            s$80 = Py.newString("\"\015");
            s$81 = Py.newString("Get a parenthesis-delimited fragment from self's field.");
            s$82 = Py.newString(")\015");
            s$83 = Py.newString("Parse an RFC-822 domain-literal.");
            s$84 = Py.newString("[%s]");
            s$85 = Py.newString("]\015");
            s$86 = Py.newString("Parse an RFC-822 atom.");
            s$87 = Py.newString("Parse a sequence of RFC-822 phrases.\012\012        A phrase is a sequence of words, which are in turn either\012        RFC-822 atoms or quoted-strings.  Phrases are canonicalized\012        by squeezing all runs of continuous whitespace into one space.\012        ");
            s$88 = Py.newString("An AddressList encapsulates a list of parsed RFC822 addresses.");
            s$89 = Py.newString("Dump a (name, address) pair in a canonicalized form.");
            s$90 = Py.newString("\" <");
            s$91 = Py.newString("jan");
            s$92 = Py.newString("feb");
            s$93 = Py.newString("mar");
            s$94 = Py.newString("apr");
            s$95 = Py.newString("may");
            s$96 = Py.newString("jun");
            s$97 = Py.newString("jul");
            s$98 = Py.newString("aug");
            s$99 = Py.newString("sep");
            s$100 = Py.newString("oct");
            s$101 = Py.newString("nov");
            s$102 = Py.newString("dec");
            s$103 = Py.newString("january");
            s$104 = Py.newString("february");
            s$105 = Py.newString("march");
            s$106 = Py.newString("april");
            s$107 = Py.newString("june");
            s$108 = Py.newString("july");
            s$109 = Py.newString("august");
            s$110 = Py.newString("september");
            s$111 = Py.newString("october");
            s$112 = Py.newString("november");
            s$113 = Py.newString("december");
            s$114 = Py.newString("mon");
            s$115 = Py.newString("tue");
            s$116 = Py.newString("wed");
            s$117 = Py.newString("thu");
            s$118 = Py.newString("fri");
            s$119 = Py.newString("sat");
            s$120 = Py.newString("sun");
            s$121 = Py.newString("UT");
            s$122 = Py.newString("UTC");
            s$123 = Py.newString("GMT");
            s$124 = Py.newString("Z");
            s$125 = Py.newString("AST");
            i$126 = Py.newInteger(400);
            s$127 = Py.newString("ADT");
            i$128 = Py.newInteger(300);
            s$129 = Py.newString("EST");
            i$130 = Py.newInteger(500);
            s$131 = Py.newString("EDT");
            s$132 = Py.newString("CST");
            i$133 = Py.newInteger(600);
            s$134 = Py.newString("CDT");
            s$135 = Py.newString("MST");
            i$136 = Py.newInteger(700);
            s$137 = Py.newString("MDT");
            s$138 = Py.newString("PST");
            i$139 = Py.newInteger(800);
            s$140 = Py.newString("PDT");
            s$141 = Py.newString("Convert a date string to a time tuple.\012\012    Accounts for military timezones.\012    ");
            i$142 = Py.newInteger(3);
            s$143 = Py.newString("-");
            i$144 = Py.newInteger(4);
            s$145 = Py.newString("+");
            i$146 = Py.newInteger(5);
            i$147 = Py.newInteger(12);
            i$148 = Py.newInteger(2);
            s$149 = Py.newString("0");
            i$150 = Py.newInteger(100);
            i$151 = Py.newInteger(3600);
            i$152 = Py.newInteger(60);
            s$153 = Py.newString("Convert a time string to a time tuple.");
            i$154 = Py.newInteger(9);
            s$155 = Py.newString("Turn a 10-tuple as returned by parsedate_tz() into a UTC timestamp.");
            i$156 = Py.newInteger(8);
            s$157 = Py.newString("Returns time format preferred for Internet standards.\012\012    Sun, 06 Nov 1994 08:49:37 GMT  ; RFC 822, updated by RFC 1123\012    ");
            s$158 = Py.newString("%s");
            s$159 = Py.newString("%a, %d %b %Y %H:%M:%S GMT");
            s$160 = Py.newString("__main__");
            s$161 = Py.newString("HOME");
            s$162 = Py.newString("Mail/inbox/1");
            s$163 = Py.newString("r");
            s$164 = Py.newString("From:");
            s$165 = Py.newString("from");
            s$166 = Py.newString("To:");
            s$167 = Py.newString("to");
            s$168 = Py.newString("Subject:");
            s$169 = Py.newString("subject");
            s$170 = Py.newString("Date:");
            s$171 = Py.newString("date");
            s$172 = Py.newString("ParsedDate:");
            s$173 = Py.newString("%+03d%02d");
            s$174 = Py.newString(".%02d");
            s$175 = Py.newString("Lines:");
            i$176 = Py.newInteger(70);
            s$177 = Py.newString("len =");
            s$178 = Py.newString("Date");
            s$179 = Py.newString("Date =");
            s$180 = Py.newString("X-Nonsense");
            s$181 = Py.newString("keys =");
            s$182 = Py.newString("values =");
            s$183 = Py.newString("items =");
            s$184 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(3, new String[] {"self", "fp", "seekable"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_rewindbody = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "rewindbody", false, false, funcTable, 1, null, null, 0, 1);
            c$2_readheaders = Py.newCode(1, new String[] {"self", "startofline", "headerseen", "firstline", "tell", "unread", "list", "x", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "readheaders", false, false, funcTable, 2, null, null, 0, 1);
            c$3_isheader = Py.newCode(2, new String[] {"self", "line", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "isheader", false, false, funcTable, 3, null, null, 0, 1);
            c$4_islast = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "islast", false, false, funcTable, 4, null, null, 0, 1);
            c$5_iscomment = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "iscomment", false, false, funcTable, 5, null, null, 0, 1);
            c$6_getallmatchingheaders = Py.newCode(2, new String[] {"self", "name", "line", "hit", "list", "n"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getallmatchingheaders", false, false, funcTable, 6, null, null, 0, 1);
            c$7_getfirstmatchingheader = Py.newCode(2, new String[] {"self", "name", "line", "hit", "list", "n"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getfirstmatchingheader", false, false, funcTable, 7, null, null, 0, 1);
            c$8_getrawheader = Py.newCode(2, new String[] {"self", "name", "list"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getrawheader", false, false, funcTable, 8, null, null, 0, 1);
            c$9_getheader = Py.newCode(3, new String[] {"self", "name", "default"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getheader", false, false, funcTable, 9, null, null, 0, 1);
            c$10_getheaders = Py.newCode(2, new String[] {"self", "name", "result", "have_header", "s", "current"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getheaders", false, false, funcTable, 10, null, null, 0, 1);
            c$11_getaddr = Py.newCode(2, new String[] {"self", "name", "alist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getaddr", false, false, funcTable, 11, null, null, 0, 1);
            c$12_getaddrlist = Py.newCode(2, new String[] {"self", "name", "i", "h", "addr", "a", "alladdrs", "raw"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getaddrlist", false, false, funcTable, 12, null, null, 0, 1);
            c$13_getdate = Py.newCode(2, new String[] {"self", "name", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getdate", false, false, funcTable, 13, null, null, 0, 1);
            c$14_getdate_tz = Py.newCode(2, new String[] {"self", "name", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getdate_tz", false, false, funcTable, 14, null, null, 0, 1);
            c$15___len__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__len__", false, false, funcTable, 15, null, null, 0, 1);
            c$16___getitem__ = Py.newCode(2, new String[] {"self", "name"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__getitem__", false, false, funcTable, 16, null, null, 0, 1);
            c$17___setitem__ = Py.newCode(3, new String[] {"self", "name", "value", "line", "lines", "text"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__setitem__", false, false, funcTable, 17, null, null, 0, 1);
            c$18___delitem__ = Py.newCode(2, new String[] {"self", "name", "hit", "n", "i", "list", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__delitem__", false, false, funcTable, 18, null, null, 0, 1);
            c$19_has_key = Py.newCode(2, new String[] {"self", "name"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "has_key", false, false, funcTable, 19, null, null, 0, 1);
            c$20_keys = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "keys", false, false, funcTable, 20, null, null, 0, 1);
            c$21_values = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "values", false, false, funcTable, 21, null, null, 0, 1);
            c$22_items = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "items", false, false, funcTable, 22, null, null, 0, 1);
            c$23___str__ = Py.newCode(1, new String[] {"self", "str", "hdr"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__str__", false, false, funcTable, 23, null, null, 0, 1);
            c$24_Message = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "Message", false, false, funcTable, 24, null, null, 0, 0);
            c$25_unquote = Py.newCode(1, new String[] {"str"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "unquote", false, false, funcTable, 25, null, null, 0, 1);
            c$26_quote = Py.newCode(1, new String[] {"str"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "quote", false, false, funcTable, 26, null, null, 0, 1);
            c$27_parseaddr = Py.newCode(1, new String[] {"address", "a", "list"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "parseaddr", false, false, funcTable, 27, null, null, 0, 1);
            c$28___init__ = Py.newCode(2, new String[] {"self", "field"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__init__", false, false, funcTable, 28, null, null, 0, 1);
            c$29_gotonext = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "gotonext", false, false, funcTable, 29, null, null, 0, 1);
            c$30_getaddrlist = Py.newCode(1, new String[] {"self", "ad"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getaddrlist", false, false, funcTable, 30, null, null, 0, 1);
            c$31_getaddress = Py.newCode(1, new String[] {"self", "returnlist", "oldpos", "routeaddr", "addrspec", "fieldlen", "oldcl", "plist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getaddress", false, false, funcTable, 31, null, null, 0, 1);
            c$32_getrouteaddr = Py.newCode(1, new String[] {"self", "expectroute", "expectaddrspec", "adlist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getrouteaddr", false, false, funcTable, 32, null, null, 0, 1);
            c$33_getaddrspec = Py.newCode(1, new String[] {"self", "aslist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getaddrspec", false, false, funcTable, 33, null, null, 0, 1);
            c$34_getdomain = Py.newCode(1, new String[] {"self", "sdlist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getdomain", false, false, funcTable, 34, null, null, 0, 1);
            c$35_getdelimited = Py.newCode(4, new String[] {"self", "beginchar", "endchars", "allowcomments", "quote", "slist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getdelimited", false, false, funcTable, 35, null, null, 0, 1);
            c$36_getquote = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getquote", false, false, funcTable, 36, null, null, 0, 1);
            c$37_getcomment = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getcomment", false, false, funcTable, 37, null, null, 0, 1);
            c$38_getdomainliteral = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getdomainliteral", false, false, funcTable, 38, null, null, 0, 1);
            c$39_getatom = Py.newCode(1, new String[] {"self", "atomlist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getatom", false, false, funcTable, 39, null, null, 0, 1);
            c$40_getphraselist = Py.newCode(1, new String[] {"self", "plist"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "getphraselist", false, false, funcTable, 40, null, null, 0, 1);
            c$41_AddrlistClass = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "AddrlistClass", false, false, funcTable, 41, null, null, 0, 0);
            c$42___init__ = Py.newCode(2, new String[] {"self", "field"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__init__", false, false, funcTable, 42, null, null, 0, 1);
            c$43___len__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__len__", false, false, funcTable, 43, null, null, 0, 1);
            c$44___str__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__str__", false, false, funcTable, 44, null, null, 0, 1);
            c$45___add__ = Py.newCode(2, new String[] {"self", "other", "x", "newaddr"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__add__", false, false, funcTable, 45, null, null, 0, 1);
            c$46___iadd__ = Py.newCode(2, new String[] {"self", "other", "x"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__iadd__", false, false, funcTable, 46, null, null, 0, 1);
            c$47___sub__ = Py.newCode(2, new String[] {"self", "other", "x", "newaddr"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__sub__", false, false, funcTable, 47, null, null, 0, 1);
            c$48___isub__ = Py.newCode(2, new String[] {"self", "other", "x"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__isub__", false, false, funcTable, 48, null, null, 0, 1);
            c$49___getitem__ = Py.newCode(2, new String[] {"self", "index"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "__getitem__", false, false, funcTable, 49, null, null, 0, 1);
            c$50_AddressList = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "AddressList", false, false, funcTable, 50, null, null, 0, 0);
            c$51_dump_address_pair = Py.newCode(1, new String[] {"pair"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "dump_address_pair", false, false, funcTable, 51, null, null, 0, 1);
            c$52_parsedate_tz = Py.newCode(1, new String[] {"data", "tm", "thh", "tzsign", "stuff", "s", "tuple", "yy", "i", "mm", "tzoffset", "tss", "tz", "dd", "tmm"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "parsedate_tz", false, false, funcTable, 52, null, null, 0, 1);
            c$53_parsedate = Py.newCode(1, new String[] {"data", "t"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "parsedate", false, false, funcTable, 53, null, null, 0, 1);
            c$54_mktime_tz = Py.newCode(1, new String[] {"data", "t"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "mktime_tz", false, false, funcTable, 54, null, null, 0, 1);
            c$55_formatdate = Py.newCode(1, new String[] {"timeval"}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "formatdate", false, false, funcTable, 55, null, null, 0, 1);
            c$56_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\rfc822.py", "main", false, false, funcTable, 56, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$56_main == null) _PyInner.initConstants();
            return c$56_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.rewindbody$2(frame);
                case 2:
                return _PyInner.readheaders$3(frame);
                case 3:
                return _PyInner.isheader$4(frame);
                case 4:
                return _PyInner.islast$5(frame);
                case 5:
                return _PyInner.iscomment$6(frame);
                case 6:
                return _PyInner.getallmatchingheaders$7(frame);
                case 7:
                return _PyInner.getfirstmatchingheader$8(frame);
                case 8:
                return _PyInner.getrawheader$9(frame);
                case 9:
                return _PyInner.getheader$10(frame);
                case 10:
                return _PyInner.getheaders$11(frame);
                case 11:
                return _PyInner.getaddr$12(frame);
                case 12:
                return _PyInner.getaddrlist$13(frame);
                case 13:
                return _PyInner.getdate$14(frame);
                case 14:
                return _PyInner.getdate_tz$15(frame);
                case 15:
                return _PyInner.__len__$16(frame);
                case 16:
                return _PyInner.__getitem__$17(frame);
                case 17:
                return _PyInner.__setitem__$18(frame);
                case 18:
                return _PyInner.__delitem__$19(frame);
                case 19:
                return _PyInner.has_key$20(frame);
                case 20:
                return _PyInner.keys$21(frame);
                case 21:
                return _PyInner.values$22(frame);
                case 22:
                return _PyInner.items$23(frame);
                case 23:
                return _PyInner.__str__$24(frame);
                case 24:
                return _PyInner.Message$25(frame);
                case 25:
                return _PyInner.unquote$26(frame);
                case 26:
                return _PyInner.quote$27(frame);
                case 27:
                return _PyInner.parseaddr$28(frame);
                case 28:
                return _PyInner.__init__$29(frame);
                case 29:
                return _PyInner.gotonext$30(frame);
                case 30:
                return _PyInner.getaddrlist$31(frame);
                case 31:
                return _PyInner.getaddress$32(frame);
                case 32:
                return _PyInner.getrouteaddr$33(frame);
                case 33:
                return _PyInner.getaddrspec$34(frame);
                case 34:
                return _PyInner.getdomain$35(frame);
                case 35:
                return _PyInner.getdelimited$36(frame);
                case 36:
                return _PyInner.getquote$37(frame);
                case 37:
                return _PyInner.getcomment$38(frame);
                case 38:
                return _PyInner.getdomainliteral$39(frame);
                case 39:
                return _PyInner.getatom$40(frame);
                case 40:
                return _PyInner.getphraselist$41(frame);
                case 41:
                return _PyInner.AddrlistClass$42(frame);
                case 42:
                return _PyInner.__init__$43(frame);
                case 43:
                return _PyInner.__len__$44(frame);
                case 44:
                return _PyInner.__str__$45(frame);
                case 45:
                return _PyInner.__add__$46(frame);
                case 46:
                return _PyInner.__iadd__$47(frame);
                case 47:
                return _PyInner.__sub__$48(frame);
                case 48:
                return _PyInner.__isub__$49(frame);
                case 49:
                return _PyInner.__getitem__$50(frame);
                case 50:
                return _PyInner.AddressList$51(frame);
                case 51:
                return _PyInner.dump_address_pair$52(frame);
                case 52:
                return _PyInner.parsedate_tz$53(frame);
                case 53:
                return _PyInner.parsedate$54(frame);
                case 54:
                return _PyInner.mktime_tz$55(frame);
                case 55:
                return _PyInner.formatdate$56(frame);
                case 56:
                return _PyInner.main$57(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            // Temporary Variables
            boolean t$0$boolean;
            PyException t$0$PyException;
            
            // Code
            /* Initialize the class instance and read the headers. */
            if (frame.getlocal(2)._eq(i$10).__nonzero__()) {
                t$0$boolean = true;
                try {
                    frame.getlocal(1).invoke("tell");
                }
                catch (Throwable x$0) {
                    t$0$boolean = false;
                    t$0$PyException = Py.setException(x$0, frame);
                    frame.setlocal(2, i$11);
                }
                if (t$0$boolean) {
                    frame.setlocal(2, i$10);
                }
            }
            frame.getlocal(0).__setattr__("fp", frame.getlocal(1));
            frame.getlocal(0).__setattr__("seekable", frame.getlocal(2));
            frame.getlocal(0).__setattr__("startofheaders", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("startofbody", frame.getglobal("None"));
            if (frame.getlocal(0).__getattr__("seekable").__nonzero__()) {
                try {
                    frame.getlocal(0).__setattr__("startofheaders", frame.getlocal(0).__getattr__("fp").invoke("tell"));
                }
                catch (Throwable x$1) {
                    t$0$PyException = Py.setException(x$1, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                        frame.getlocal(0).__setattr__("seekable", i$11);
                    }
                    else throw t$0$PyException;
                }
            }
            frame.getlocal(0).invoke("readheaders");
            if (frame.getlocal(0).__getattr__("seekable").__nonzero__()) {
                try {
                    frame.getlocal(0).__setattr__("startofbody", frame.getlocal(0).__getattr__("fp").invoke("tell"));
                }
                catch (Throwable x$2) {
                    t$0$PyException = Py.setException(x$2, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                        frame.getlocal(0).__setattr__("seekable", i$11);
                    }
                    else throw t$0$PyException;
                }
            }
            return Py.None;
        }
        
        private static PyObject rewindbody$2(PyFrame frame) {
            /* Rewind the file to the start of the body (if seekable). */
            if (frame.getlocal(0).__getattr__("seekable").__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("IOError"), s$13);
            }
            frame.getlocal(0).__getattr__("fp").invoke("seek", frame.getlocal(0).__getattr__("startofbody"));
            return Py.None;
        }
        
        private static PyObject readheaders$3(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Read header lines.
            
                    Read header lines up to the entirely blank line that
                    terminates them.  The (normally blank) line that ends the
                    headers is skipped, but not included in the returned list.
                    If a non-header line ends the headers, (which is an error),
                    an attempt is made to backspace over it; it is never
                    included in the returned list.
            
                    The variable self.status is set to the empty string if all
                    went well, otherwise it is an error message.
                    The variable self.headers is a completely uninterpreted list
                    of lines contained in the header (so printing them will
                    reproduce the header exactly as it appears in the file).
                     */
            frame.getlocal(0).__setattr__("dict", new PyDictionary(new PyObject[] {}));
            frame.getlocal(0).__setattr__("unixfrom", s$15);
            t$0$PyObject = new PyList(new PyObject[] {});
            frame.getlocal(0).__setattr__("headers", t$0$PyObject);
            frame.setlocal(6, t$0$PyObject);
            frame.getlocal(0).__setattr__("status", s$15);
            frame.setlocal(2, s$15);
            frame.setlocal(3, i$10);
            t$0$PyObject = frame.getglobal("None");
            frame.setlocal(1, t$0$PyObject);
            frame.setlocal(5, t$0$PyObject);
            frame.setlocal(4, t$0$PyObject);
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0).__getattr__("fp"), s$16).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(0).__getattr__("fp").__getattr__("unread"));
            }
            else if (frame.getlocal(0).__getattr__("seekable").__nonzero__()) {
                frame.setlocal(4, frame.getlocal(0).__getattr__("fp").__getattr__("tell"));
            }
            while (i$10.__nonzero__()) {
                if (frame.getlocal(4).__nonzero__()) {
                    try {
                        frame.setlocal(1, frame.getlocal(4).__call__());
                    }
                    catch (Throwable x$0) {
                        t$0$PyException = Py.setException(x$0, frame);
                        if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                            t$0$PyObject = frame.getglobal("None");
                            frame.setlocal(1, t$0$PyObject);
                            frame.setlocal(4, t$0$PyObject);
                            frame.getlocal(0).__setattr__("seekable", i$11);
                        }
                        else throw t$0$PyException;
                    }
                }
                frame.setlocal(8, frame.getlocal(0).__getattr__("fp").invoke("readline"));
                if (frame.getlocal(8).__not__().__nonzero__()) {
                    frame.getlocal(0).__setattr__("status", s$17);
                    break;
                }
                if (((t$0$PyObject = frame.getlocal(3)).__nonzero__() ? frame.getlocal(8).invoke("startswith", s$18) : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(0).__setattr__("unixfrom", frame.getlocal(0).__getattr__("unixfrom")._add(frame.getlocal(8)));
                    continue;
                }
                frame.setlocal(3, i$11);
                if (((t$0$PyObject = frame.getlocal(2)).__nonzero__() ? frame.getlocal(8).__getitem__(i$11)._in(s$19) : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(6).invoke("append", frame.getlocal(8));
                    frame.setlocal(7, frame.getlocal(0).__getattr__("dict").__getitem__(frame.getlocal(2))._add(s$20)._add(frame.getlocal(8).invoke("strip")));
                    frame.getlocal(0).__getattr__("dict").__setitem__(frame.getlocal(2), frame.getlocal(7).invoke("strip"));
                    continue;
                }
                else if (frame.getlocal(0).invoke("iscomment", frame.getlocal(8)).__nonzero__()) {
                    continue;
                }
                else if (frame.getlocal(0).invoke("islast", frame.getlocal(8)).__nonzero__()) {
                    break;
                }
                frame.setlocal(2, frame.getlocal(0).invoke("isheader", frame.getlocal(8)));
                if (frame.getlocal(2).__nonzero__()) {
                    frame.getlocal(6).invoke("append", frame.getlocal(8));
                    frame.getlocal(0).__getattr__("dict").__setitem__(frame.getlocal(2), frame.getlocal(8).__getslice__(frame.getglobal("len").__call__(frame.getlocal(2))._add(i$10), null, null).invoke("strip"));
                    continue;
                }
                else {
                    if (frame.getlocal(0).__getattr__("dict").__not__().__nonzero__()) {
                        frame.getlocal(0).__setattr__("status", s$21);
                    }
                    else {
                        frame.getlocal(0).__setattr__("status", s$22);
                    }
                    if (frame.getlocal(5).__nonzero__()) {
                        frame.getlocal(5).__call__(frame.getlocal(8));
                    }
                    else if (frame.getlocal(4).__nonzero__()) {
                        frame.getlocal(0).__getattr__("fp").invoke("seek", frame.getlocal(1));
                    }
                    else {
                        frame.getlocal(0).__setattr__("status", frame.getlocal(0).__getattr__("status")._add(s$23));
                    }
                    break;
                }
            }
            return Py.None;
        }
        
        private static PyObject isheader$4(PyFrame frame) {
            /* Determine whether a given line is a legal header.
            
                    This method should return the header name, suitably canonicalized.
                    You may override this method in order to use Message parsing
                    on tagged data in RFC822-like formats with special header formats.
                     */
            frame.setlocal(2, frame.getlocal(1).invoke("find", s$25));
            if (frame.getlocal(2)._gt(i$11).__nonzero__()) {
                return frame.getlocal(1).__getslice__(null, frame.getlocal(2), null).invoke("lower");
            }
            else {
                return frame.getglobal("None");
            }
        }
        
        private static PyObject islast$5(PyFrame frame) {
            /* Determine whether a line is a legal end of RFC-822 headers.
            
                    You may override this method if your application wants
                    to bend the rules, e.g. to strip trailing whitespace,
                    or to recognize MH template separators ('--------').
                    For convenience (e.g. for code reading from sockets) a
                    line consisting of 
             also matches.
                     */
            return frame.getlocal(1)._in(frame.getglobal("_blanklines"));
        }
        
        private static PyObject iscomment$6(PyFrame frame) {
            /* Determine whether a line should be skipped entirely.
            
                    You may override this method in order to use Message parsing
                    on tagged data in RFC822-like formats that support embedded
                    comments or free-text data.
                     */
            return frame.getglobal("None");
        }
        
        private static PyObject getallmatchingheaders$7(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Find all header lines matching a given header name.
            
                    Look through the list of headers and find all lines
                    matching a given header name (and their continuation
                    lines).  A list of the lines is returned, without
                    interpretation.  If the header does not occur, an
                    empty list is returned.  If the header occurs multiple
                    times, all occurrences are returned.  Case is not
                    important in the header name.
                     */
            frame.setlocal(1, frame.getlocal(1).invoke("lower")._add(s$25));
            frame.setlocal(5, frame.getglobal("len").__call__(frame.getlocal(1)));
            frame.setlocal(4, new PyList(new PyObject[] {}));
            frame.setlocal(3, i$11);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("headers");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2).__getslice__(null, frame.getlocal(5), null).invoke("lower")._eq(frame.getlocal(1)).__nonzero__()) {
                    frame.setlocal(3, i$10);
                }
                else if (frame.getlocal(2).__getslice__(null, i$10, null).invoke("isspace").__not__().__nonzero__()) {
                    frame.setlocal(3, i$11);
                }
                if (frame.getlocal(3).__nonzero__()) {
                    frame.getlocal(4).invoke("append", frame.getlocal(2));
                }
            }
            return frame.getlocal(4);
        }
        
        private static PyObject getfirstmatchingheader$8(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Get the first header line matching name.
            
                    This is similar to getallmatchingheaders, but it returns
                    only the first matching header (and its continuation
                    lines).
                     */
            frame.setlocal(1, frame.getlocal(1).invoke("lower")._add(s$25));
            frame.setlocal(5, frame.getglobal("len").__call__(frame.getlocal(1)));
            frame.setlocal(4, new PyList(new PyObject[] {}));
            frame.setlocal(3, i$11);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("headers");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(3).__nonzero__()) {
                    if (frame.getlocal(2).__getslice__(null, i$10, null).invoke("isspace").__not__().__nonzero__()) {
                        break;
                    }
                }
                else if (frame.getlocal(2).__getslice__(null, frame.getlocal(5), null).invoke("lower")._eq(frame.getlocal(1)).__nonzero__()) {
                    frame.setlocal(3, i$10);
                }
                if (frame.getlocal(3).__nonzero__()) {
                    frame.getlocal(4).invoke("append", frame.getlocal(2));
                }
            }
            return frame.getlocal(4);
        }
        
        private static PyObject getrawheader$9(PyFrame frame) {
            /* A higher-level interface to getfirstmatchingheader().
            
                    Return a string containing the literal text of the
                    header but with the keyword stripped.  All leading,
                    trailing and embedded whitespace is kept in the
                    string, however.
                    Return None if the header does not occur.
                     */
            frame.setlocal(2, frame.getlocal(0).invoke("getfirstmatchingheader", frame.getlocal(1)));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                return frame.getglobal("None");
            }
            frame.getlocal(2).__setitem__(i$11, frame.getlocal(2).__getitem__(i$11).__getslice__(frame.getglobal("len").__call__(frame.getlocal(1))._add(i$10), null, null));
            return s$15.invoke("join", frame.getlocal(2));
        }
        
        private static PyObject getheader$10(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Get the header value for a name.
            
                    This is the normal interface: it returns a stripped
                    version of the header value for a given header name,
                    or None if it doesn't exist.  This uses the dictionary
                    version which finds the *last* such header.
                     */
            try {
                return frame.getlocal(0).__getattr__("dict").__getitem__(frame.getlocal(1).invoke("lower"));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("KeyError"))) {
                    return frame.getlocal(2);
                }
                else throw t$0$PyException;
            }
        }
        
        private static PyObject getheaders$11(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Get all values for a header.
            
                    This returns a list of values for headers given more than once;
                    each value in the result list is stripped in the same way as the
                    result of getheader().  If the header is not given, return an
                    empty list.
                     */
            frame.setlocal(2, new PyList(new PyObject[] {}));
            frame.setlocal(5, s$15);
            frame.setlocal(3, i$11);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).invoke("getallmatchingheaders", frame.getlocal(1));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                if (frame.getlocal(4).__getitem__(i$11).invoke("isspace").__nonzero__()) {
                    if (frame.getlocal(5).__nonzero__()) {
                        frame.setlocal(5, s$33._mod(new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(4).invoke("strip")})));
                    }
                    else {
                        frame.setlocal(5, frame.getlocal(4).invoke("strip"));
                    }
                }
                else {
                    if (frame.getlocal(3).__nonzero__()) {
                        frame.getlocal(2).invoke("append", frame.getlocal(5));
                    }
                    frame.setlocal(5, frame.getlocal(4).__getslice__(frame.getlocal(4).invoke("find", s$25)._add(i$10), null, null).invoke("strip"));
                    frame.setlocal(3, i$10);
                }
            }
            if (frame.getlocal(3).__nonzero__()) {
                frame.getlocal(2).invoke("append", frame.getlocal(5));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject getaddr$12(PyFrame frame) {
            /* Get a single address from a header, as a tuple.
            
                    An example return value:
                    ('Guido van Rossum', 'guido@cwi.nl')
                     */
            frame.setlocal(2, frame.getlocal(0).invoke("getaddrlist", frame.getlocal(1)));
            if (frame.getlocal(2).__nonzero__()) {
                return frame.getlocal(2).__getitem__(i$11);
            }
            else {
                return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getglobal("None")});
            }
        }
        
        private static PyObject getaddrlist$13(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Get a list of addresses from a header.
            
                    Retrieves a list of addresses from a header, where each address is a
                    tuple as returned by getaddr().  Scans all named headers, so it works
                    properly with multiple To: or Cc: headers for example.
            
                     */
            frame.setlocal(7, new PyList(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).invoke("getallmatchingheaders", frame.getlocal(1));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                if (frame.getlocal(3).__getitem__(i$11)._in(s$19).__nonzero__()) {
                    frame.getlocal(7).invoke("append", frame.getlocal(3));
                }
                else {
                    if (frame.getlocal(7).__nonzero__()) {
                        frame.getlocal(7).invoke("append", s$36);
                    }
                    frame.setlocal(2, frame.getlocal(3).invoke("find", s$25));
                    if (frame.getlocal(2)._gt(i$11).__nonzero__()) {
                        frame.setlocal(4, frame.getlocal(3).__getslice__(frame.getlocal(2)._add(i$10), null, null));
                    }
                    frame.getlocal(7).invoke("append", frame.getlocal(4));
                }
            }
            frame.setlocal(6, s$15.invoke("join", frame.getlocal(7)));
            frame.setlocal(5, frame.getglobal("AddrlistClass").__call__(frame.getlocal(6)));
            return frame.getlocal(5).invoke("getaddrlist");
        }
        
        private static PyObject getdate$14(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Retrieve a date field from a header.
            
                    Retrieves a date field from the named header, returning
                    a tuple compatible with time.mktime().
                     */
            try {
                frame.setlocal(2, frame.getlocal(0).__getitem__(frame.getlocal(1)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("KeyError"))) {
                    return frame.getglobal("None");
                }
                else throw t$0$PyException;
            }
            return frame.getglobal("parsedate").__call__(frame.getlocal(2));
        }
        
        private static PyObject getdate_tz$15(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Retrieve a date field from a header as a 10-tuple.
            
                    The first 9 elements make up a tuple compatible with
                    time.mktime(), and the 10th is the offset of the poster's
                    time zone from GMT/UTC.
                     */
            try {
                frame.setlocal(2, frame.getlocal(0).__getitem__(frame.getlocal(1)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("KeyError"))) {
                    return frame.getglobal("None");
                }
                else throw t$0$PyException;
            }
            return frame.getglobal("parsedate_tz").__call__(frame.getlocal(2));
        }
        
        private static PyObject __len__$16(PyFrame frame) {
            /* Get the number of headers in a message. */
            return frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("dict"));
        }
        
        private static PyObject __getitem__$17(PyFrame frame) {
            /* Get a specific header, as from a dictionary. */
            return frame.getlocal(0).__getattr__("dict").__getitem__(frame.getlocal(1).invoke("lower"));
        }
        
        private static PyObject __setitem__$18(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Set the value of a header.
            
                    Note: This is not a perfect inversion of __getitem__, because
                    any changed headers get stuck at the end of the raw-headers list
                    rather than where the altered header was.
                     */
            frame.getlocal(0).__delitem__(frame.getlocal(1));
            frame.getlocal(0).__getattr__("dict").__setitem__(frame.getlocal(1).invoke("lower"), frame.getlocal(2));
            frame.setlocal(5, frame.getlocal(1)._add(s$42)._add(frame.getlocal(2)));
            frame.setlocal(4, frame.getlocal(5).invoke("split", s$7));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(4);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.getlocal(0).__getattr__("headers").invoke("append", frame.getlocal(3)._add(s$7));
            }
            return Py.None;
        }
        
        private static PyObject __delitem__$19(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            /* Delete all occurrences of a specific header, if it is present. */
            frame.setlocal(1, frame.getlocal(1).invoke("lower"));
            if (frame.getlocal(0).__getattr__("dict").invoke("has_key", frame.getlocal(1)).__not__().__nonzero__()) {
                return Py.None;
            }
            frame.getlocal(0).__getattr__("dict").__delitem__(frame.getlocal(1));
            frame.setlocal(1, frame.getlocal(1)._add(s$25));
            frame.setlocal(3, frame.getglobal("len").__call__(frame.getlocal(1)));
            frame.setlocal(5, new PyList(new PyObject[] {}));
            frame.setlocal(2, i$11);
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("headers")));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                frame.setlocal(6, frame.getlocal(0).__getattr__("headers").__getitem__(frame.getlocal(4)));
                if (frame.getlocal(6).__getslice__(null, frame.getlocal(3), null).invoke("lower")._eq(frame.getlocal(1)).__nonzero__()) {
                    frame.setlocal(2, i$10);
                }
                else if (frame.getlocal(6).__getslice__(null, i$10, null).invoke("isspace").__not__().__nonzero__()) {
                    frame.setlocal(2, i$11);
                }
                if (frame.getlocal(2).__nonzero__()) {
                    frame.getlocal(5).invoke("append", frame.getlocal(4));
                }
            }
            frame.getlocal(5).invoke("reverse");
            t$1$int = 0;
            t$3$PyObject = frame.getlocal(5);
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                frame.setlocal(4, t$2$PyObject);
                frame.getlocal(0).__getattr__("headers").__delitem__(frame.getlocal(4));
            }
            return Py.None;
        }
        
        private static PyObject has_key$20(PyFrame frame) {
            /* Determine whether a message contains the named header. */
            return frame.getlocal(0).__getattr__("dict").invoke("has_key", frame.getlocal(1).invoke("lower"));
        }
        
        private static PyObject keys$21(PyFrame frame) {
            /* Get all of a message's header field names. */
            return frame.getlocal(0).__getattr__("dict").invoke("keys");
        }
        
        private static PyObject values$22(PyFrame frame) {
            /* Get all of a message's header field values. */
            return frame.getlocal(0).__getattr__("dict").invoke("values");
        }
        
        private static PyObject items$23(PyFrame frame) {
            /* Get all of a message's headers.
            
                    Returns a list of name, value tuples.
                     */
            return frame.getlocal(0).__getattr__("dict").invoke("items");
        }
        
        private static PyObject __str__$24(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(1, s$15);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("headers");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.setlocal(1, frame.getlocal(1)._add(frame.getlocal(2)));
            }
            return frame.getlocal(1);
        }
        
        private static PyObject Message$25(PyFrame frame) {
            /* Represents a single RFC-822-compliant message. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {i$10}, c$0___init__));
            frame.setlocal("rewindbody", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_rewindbody));
            frame.setlocal("readheaders", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_readheaders));
            frame.setlocal("isheader", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_isheader));
            frame.setlocal("islast", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_islast));
            frame.setlocal("iscomment", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_iscomment));
            frame.setlocal("getallmatchingheaders", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_getallmatchingheaders));
            frame.setlocal("getfirstmatchingheader", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_getfirstmatchingheader));
            frame.setlocal("getrawheader", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_getrawheader));
            frame.setlocal("getheader", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$9_getheader));
            frame.setlocal("get", frame.getname("getheader"));
            frame.setlocal("getheaders", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_getheaders));
            frame.setlocal("getaddr", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_getaddr));
            frame.setlocal("getaddrlist", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_getaddrlist));
            frame.setlocal("getdate", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_getdate));
            frame.setlocal("getdate_tz", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_getdate_tz));
            frame.setlocal("__len__", new PyFunction(frame.f_globals, new PyObject[] {}, c$15___len__));
            frame.setlocal("__getitem__", new PyFunction(frame.f_globals, new PyObject[] {}, c$16___getitem__));
            frame.setlocal("__setitem__", new PyFunction(frame.f_globals, new PyObject[] {}, c$17___setitem__));
            frame.setlocal("__delitem__", new PyFunction(frame.f_globals, new PyObject[] {}, c$18___delitem__));
            frame.setlocal("has_key", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_has_key));
            frame.setlocal("keys", new PyFunction(frame.f_globals, new PyObject[] {}, c$20_keys));
            frame.setlocal("values", new PyFunction(frame.f_globals, new PyObject[] {}, c$21_values));
            frame.setlocal("items", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_items));
            frame.setlocal("__str__", new PyFunction(frame.f_globals, new PyObject[] {}, c$23___str__));
            return frame.getf_locals();
        }
        
        private static PyObject unquote$26(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Remove quotes from a string. */
            if (frame.getglobal("len").__call__(frame.getlocal(0))._gt(i$10).__nonzero__()) {
                if (((t$0$PyObject = frame.getlocal(0).__getitem__(i$11)._eq(s$49)).__nonzero__() ? frame.getlocal(0).__getslice__(i$10.__neg__(), null, null)._eq(s$49) : t$0$PyObject).__nonzero__()) {
                    return frame.getlocal(0).__getslice__(i$10, i$10.__neg__(), null);
                }
                if (((t$0$PyObject = frame.getlocal(0).__getitem__(i$11)._eq(s$50)).__nonzero__() ? frame.getlocal(0).__getslice__(i$10.__neg__(), null, null)._eq(s$51) : t$0$PyObject).__nonzero__()) {
                    return frame.getlocal(0).__getslice__(i$10, i$10.__neg__(), null);
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject quote$27(PyFrame frame) {
            /* Add quotes around a string. */
            return frame.getlocal(0).invoke("replace", s$53, s$54).invoke("replace", s$49, s$55);
        }
        
        private static PyObject parseaddr$28(PyFrame frame) {
            /* Parse an address into a (realname, mailaddr) tuple. */
            frame.setlocal(1, frame.getglobal("AddrlistClass").__call__(frame.getlocal(0)));
            frame.setlocal(2, frame.getlocal(1).invoke("getaddrlist"));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getglobal("None")});
            }
            else {
                return frame.getlocal(2).__getitem__(i$11);
            }
        }
        
        private static PyObject __init__$29(PyFrame frame) {
            /* Initialize a new instance.
            
                    `field' is an unparsed address header field, containing
                    one or more addresses.
                     */
            frame.getlocal(0).__setattr__("specials", s$59);
            frame.getlocal(0).__setattr__("pos", i$11);
            frame.getlocal(0).__setattr__("LWS", s$19);
            frame.getlocal(0).__setattr__("CR", s$6);
            frame.getlocal(0).__setattr__("atomends", frame.getlocal(0).__getattr__("specials")._add(frame.getlocal(0).__getattr__("LWS"))._add(frame.getlocal(0).__getattr__("CR")));
            frame.getlocal(0).__setattr__("field", frame.getlocal(1));
            frame.getlocal(0).__setattr__("commentlist", new PyList(new PyObject[] {}));
            return Py.None;
        }
        
        private static PyObject gotonext$30(PyFrame frame) {
            /* Parse up to the start of the next address. */
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("LWS")._add(s$61)).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$62).__nonzero__()) {
                    frame.getlocal(0).__getattr__("commentlist").invoke("append", frame.getlocal(0).invoke("getcomment"));
                }
                else {
                    break;
                }
            }
            return Py.None;
        }
        
        private static PyObject getaddrlist$31(PyFrame frame) {
            /* Parse all addresses.
            
                    Returns a list containing all of the addresses.
                     */
            frame.setlocal(1, frame.getlocal(0).invoke("getaddress"));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1)._add(frame.getlocal(0).invoke("getaddrlist"));
            }
            else {
                return new PyList(new PyObject[] {});
            }
        }
        
        private static PyObject getaddress$32(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Parse the next address. */
            frame.getlocal(0).__setattr__("commentlist", new PyList(new PyObject[] {}));
            frame.getlocal(0).invoke("gotonext");
            frame.setlocal(2, frame.getlocal(0).__getattr__("pos"));
            frame.setlocal(6, frame.getlocal(0).__getattr__("commentlist"));
            frame.setlocal(7, frame.getlocal(0).invoke("getphraselist"));
            frame.getlocal(0).invoke("gotonext");
            frame.setlocal(1, new PyList(new PyObject[] {}));
            if (frame.getlocal(0).__getattr__("pos")._ge(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(7).__nonzero__()) {
                    frame.setlocal(1, new PyList(new PyObject[] {new PyTuple(new PyObject[] {s$65.invoke("join", frame.getlocal(0).__getattr__("commentlist")), frame.getlocal(7).__getitem__(i$11)})}));
                }
            }
            else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(s$66).__nonzero__()) {
                frame.getlocal(0).__setattr__("pos", frame.getlocal(2));
                frame.getlocal(0).__setattr__("commentlist", frame.getlocal(6));
                frame.setlocal(4, frame.getlocal(0).invoke("getaddrspec"));
                frame.setlocal(1, new PyList(new PyObject[] {new PyTuple(new PyObject[] {s$65.invoke("join", frame.getlocal(0).__getattr__("commentlist")), frame.getlocal(4)})}));
            }
            else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$25).__nonzero__()) {
                frame.setlocal(1, new PyList(new PyObject[] {}));
                frame.setlocal(5, frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field")));
                frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                    frame.getlocal(0).invoke("gotonext");
                    if (((t$0$PyObject = frame.getlocal(0).__getattr__("pos")._lt(frame.getlocal(5))).__nonzero__() ? frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$67) : t$0$PyObject).__nonzero__()) {
                        frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                        break;
                    }
                    frame.setlocal(1, frame.getlocal(1)._add(frame.getlocal(0).invoke("getaddress")));
                }
            }
            else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$50).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(0).invoke("getrouteaddr"));
                if (frame.getlocal(0).__getattr__("commentlist").__nonzero__()) {
                    frame.setlocal(1, new PyList(new PyObject[] {new PyTuple(new PyObject[] {s$65.invoke("join", frame.getlocal(7))._add(s$68)._add(s$65.invoke("join", frame.getlocal(0).__getattr__("commentlist")))._add(s$69), frame.getlocal(3)})}));
                }
                else {
                    frame.setlocal(1, new PyList(new PyObject[] {new PyTuple(new PyObject[] {s$65.invoke("join", frame.getlocal(7)), frame.getlocal(3)})}));
                }
            }
            else {
                if (frame.getlocal(7).__nonzero__()) {
                    frame.setlocal(1, new PyList(new PyObject[] {new PyTuple(new PyObject[] {s$65.invoke("join", frame.getlocal(0).__getattr__("commentlist")), frame.getlocal(7).__getitem__(i$11)})}));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("specials")).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                }
            }
            frame.getlocal(0).invoke("gotonext");
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field")))).__nonzero__() ? frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$70) : t$0$PyObject).__nonzero__()) {
                frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
            }
            return frame.getlocal(1);
        }
        
        private static PyObject getrouteaddr$33(PyFrame frame) {
            /* Parse a route address (Return-path value).
            
                    This method just skips all the route stuff and returns the addrspec.
                     */
            if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._ne(s$50).__nonzero__()) {
                return Py.None;
            }
            frame.setlocal(1, i$11);
            frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
            frame.getlocal(0).invoke("gotonext");
            frame.setlocal(3, frame.getglobal("None"));
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getlocal(0).invoke("getdomain");
                    frame.setlocal(1, i$11);
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$51).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                    break;
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$72).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                    frame.setlocal(1, i$10);
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$25).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                    frame.setlocal(2, i$10);
                }
                else {
                    frame.setlocal(3, frame.getlocal(0).invoke("getaddrspec"));
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                    break;
                }
                frame.getlocal(0).invoke("gotonext");
            }
            return frame.getlocal(3);
        }
        
        private static PyObject getaddrspec$34(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Parse an RFC-822 addr-spec. */
            frame.setlocal(1, new PyList(new PyObject[] {}));
            frame.getlocal(0).invoke("gotonext");
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$74).__nonzero__()) {
                    frame.getlocal(1).invoke("append", s$74);
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$49).__nonzero__()) {
                    frame.getlocal(1).invoke("append", s$75._mod(frame.getlocal(0).invoke("getquote")));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("atomends")).__nonzero__()) {
                    break;
                }
                else {
                    frame.getlocal(1).invoke("append", frame.getlocal(0).invoke("getatom"));
                }
                frame.getlocal(0).invoke("gotonext");
            }
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("pos")._ge(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field")))).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._ne(s$72)).__nonzero__()) {
                return s$15.invoke("join", frame.getlocal(1));
            }
            frame.getlocal(1).invoke("append", s$72);
            frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
            frame.getlocal(0).invoke("gotonext");
            return s$15.invoke("join", frame.getlocal(1))._add(frame.getlocal(0).invoke("getdomain"));
        }
        
        private static PyObject getdomain$35(PyFrame frame) {
            /* Get the complete domain name from an address. */
            frame.setlocal(1, new PyList(new PyObject[] {}));
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("LWS")).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$62).__nonzero__()) {
                    frame.getlocal(0).__getattr__("commentlist").invoke("append", frame.getlocal(0).invoke("getcomment"));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$77).__nonzero__()) {
                    frame.getlocal(1).invoke("append", frame.getlocal(0).invoke("getdomainliteral"));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$74).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                    frame.getlocal(1).invoke("append", s$74);
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("atomends")).__nonzero__()) {
                    break;
                }
                else {
                    frame.getlocal(1).invoke("append", frame.getlocal(0).invoke("getatom"));
                }
            }
            return s$15.invoke("join", frame.getlocal(1));
        }
        
        private static PyObject getdelimited$36(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Parse a header fragment delimited by special characters.
            
                    `beginchar' is the start character for the fragment.
                    If self is not looking at an instance of `beginchar' then
                    getdelimited returns the empty string.
            
                    `endchars' is a sequence of allowable end-delimiting characters.
                    Parsing stops when one of these is encountered.
            
                    If `allowcomments' is non-zero, embedded RFC-822 comments
                    are allowed within the parsed fragment.
                     */
            if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._ne(frame.getlocal(1)).__nonzero__()) {
                return s$15;
            }
            frame.setlocal(5, new PyList(new PyObject[] {s$15}));
            frame.setlocal(4, i$11);
            frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(4)._eq(i$10).__nonzero__()) {
                    frame.getlocal(5).invoke("append", frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos")));
                    frame.setlocal(4, i$11);
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(2)).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                    break;
                }
                else if (((t$0$PyObject = frame.getlocal(3)).__nonzero__() ? frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$62) : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(5).invoke("append", frame.getlocal(0).invoke("getcomment"));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$53).__nonzero__()) {
                    frame.setlocal(4, i$10);
                }
                else {
                    frame.getlocal(5).invoke("append", frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos")));
                }
                frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
            }
            return s$15.invoke("join", frame.getlocal(5));
        }
        
        private static PyObject getquote$37(PyFrame frame) {
            /* Get a quote-delimited fragment from self's field. */
            return frame.getlocal(0).invoke("getdelimited", new PyObject[] {s$49, s$80, i$11});
        }
        
        private static PyObject getcomment$38(PyFrame frame) {
            /* Get a parenthesis-delimited fragment from self's field. */
            return frame.getlocal(0).invoke("getdelimited", new PyObject[] {s$62, s$82, i$10});
        }
        
        private static PyObject getdomainliteral$39(PyFrame frame) {
            /* Parse an RFC-822 domain-literal. */
            return s$84._mod(frame.getlocal(0).invoke("getdelimited", new PyObject[] {s$77, s$85, i$11}));
        }
        
        private static PyObject getatom$40(PyFrame frame) {
            /* Parse an RFC-822 atom. */
            frame.setlocal(1, new PyList(new PyObject[] {s$15}));
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("atomends")).__nonzero__()) {
                    break;
                }
                else {
                    frame.getlocal(1).invoke("append", frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos")));
                }
                frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
            }
            return s$15.invoke("join", frame.getlocal(1));
        }
        
        private static PyObject getphraselist$41(PyFrame frame) {
            /* Parse a sequence of RFC-822 phrases.
            
                    A phrase is a sequence of words, which are in turn either
                    RFC-822 atoms or quoted-strings.  Phrases are canonicalized
                    by squeezing all runs of continuous whitespace into one space.
                     */
            frame.setlocal(1, new PyList(new PyObject[] {}));
            while (frame.getlocal(0).__getattr__("pos")._lt(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("field"))).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("LWS")).__nonzero__()) {
                    frame.getlocal(0).__setattr__("pos", frame.getlocal(0).__getattr__("pos")._add(i$10));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$49).__nonzero__()) {
                    frame.getlocal(1).invoke("append", frame.getlocal(0).invoke("getquote"));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._eq(s$62).__nonzero__()) {
                    frame.getlocal(0).__getattr__("commentlist").invoke("append", frame.getlocal(0).invoke("getcomment"));
                }
                else if (frame.getlocal(0).__getattr__("field").__getitem__(frame.getlocal(0).__getattr__("pos"))._in(frame.getlocal(0).__getattr__("atomends")).__nonzero__()) {
                    break;
                }
                else {
                    frame.getlocal(1).invoke("append", frame.getlocal(0).invoke("getatom"));
                }
            }
            return frame.getlocal(1);
        }
        
        private static PyObject AddrlistClass$42(PyFrame frame) {
            /* Address parser class by Ben Escoto.
            
                To understand what this class does, it helps to have a copy of
                RFC-822 in front of you.
            
                Note: this class interface is deprecated and may be removed in the future.
                Use rfc822.AddressList instead.
                 */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$28___init__));
            frame.setlocal("gotonext", new PyFunction(frame.f_globals, new PyObject[] {}, c$29_gotonext));
            frame.setlocal("getaddrlist", new PyFunction(frame.f_globals, new PyObject[] {}, c$30_getaddrlist));
            frame.setlocal("getaddress", new PyFunction(frame.f_globals, new PyObject[] {}, c$31_getaddress));
            frame.setlocal("getrouteaddr", new PyFunction(frame.f_globals, new PyObject[] {}, c$32_getrouteaddr));
            frame.setlocal("getaddrspec", new PyFunction(frame.f_globals, new PyObject[] {}, c$33_getaddrspec));
            frame.setlocal("getdomain", new PyFunction(frame.f_globals, new PyObject[] {}, c$34_getdomain));
            frame.setlocal("getdelimited", new PyFunction(frame.f_globals, new PyObject[] {i$10}, c$35_getdelimited));
            frame.setlocal("getquote", new PyFunction(frame.f_globals, new PyObject[] {}, c$36_getquote));
            frame.setlocal("getcomment", new PyFunction(frame.f_globals, new PyObject[] {}, c$37_getcomment));
            frame.setlocal("getdomainliteral", new PyFunction(frame.f_globals, new PyObject[] {}, c$38_getdomainliteral));
            frame.setlocal("getatom", new PyFunction(frame.f_globals, new PyObject[] {}, c$39_getatom));
            frame.setlocal("getphraselist", new PyFunction(frame.f_globals, new PyObject[] {}, c$40_getphraselist));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$43(PyFrame frame) {
            frame.getglobal("AddrlistClass").invoke("__init__", frame.getlocal(0), frame.getlocal(1));
            if (frame.getlocal(1).__nonzero__()) {
                frame.getlocal(0).__setattr__("addresslist", frame.getlocal(0).invoke("getaddrlist"));
            }
            else {
                frame.getlocal(0).__setattr__("addresslist", new PyList(new PyObject[] {}));
            }
            return Py.None;
        }
        
        private static PyObject __len__$44(PyFrame frame) {
            return frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("addresslist"));
        }
        
        private static PyObject __str__$45(PyFrame frame) {
            return s$36.invoke("join", frame.getglobal("map").__call__(frame.getglobal("dump_address_pair"), frame.getlocal(0).__getattr__("addresslist")));
        }
        
        private static PyObject __add__$46(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(3, frame.getglobal("AddressList").__call__(frame.getglobal("None")));
            frame.getlocal(3).__setattr__("addresslist", frame.getlocal(0).__getattr__("addresslist").__getslice__(null, null, null));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1).__getattr__("addresslist");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2)._in(frame.getlocal(0).__getattr__("addresslist")).__not__().__nonzero__()) {
                    frame.getlocal(3).__getattr__("addresslist").invoke("append", frame.getlocal(2));
                }
            }
            return frame.getlocal(3);
        }
        
        private static PyObject __iadd__$47(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1).__getattr__("addresslist");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2)._in(frame.getlocal(0).__getattr__("addresslist")).__not__().__nonzero__()) {
                    frame.getlocal(0).__getattr__("addresslist").invoke("append", frame.getlocal(2));
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject __sub__$48(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(3, frame.getglobal("AddressList").__call__(frame.getglobal("None")));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("addresslist");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2)._in(frame.getlocal(1).__getattr__("addresslist")).__not__().__nonzero__()) {
                    frame.getlocal(3).__getattr__("addresslist").invoke("append", frame.getlocal(2));
                }
            }
            return frame.getlocal(3);
        }
        
        private static PyObject __isub__$49(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1).__getattr__("addresslist");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2)._in(frame.getlocal(0).__getattr__("addresslist")).__nonzero__()) {
                    frame.getlocal(0).__getattr__("addresslist").invoke("remove", frame.getlocal(2));
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject __getitem__$50(PyFrame frame) {
            return frame.getlocal(0).__getattr__("addresslist").__getitem__(frame.getlocal(1));
        }
        
        private static PyObject AddressList$51(PyFrame frame) {
            /* An AddressList encapsulates a list of parsed RFC822 addresses. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$42___init__));
            frame.setlocal("__len__", new PyFunction(frame.f_globals, new PyObject[] {}, c$43___len__));
            frame.setlocal("__str__", new PyFunction(frame.f_globals, new PyObject[] {}, c$44___str__));
            frame.setlocal("__add__", new PyFunction(frame.f_globals, new PyObject[] {}, c$45___add__));
            frame.setlocal("__iadd__", new PyFunction(frame.f_globals, new PyObject[] {}, c$46___iadd__));
            frame.setlocal("__sub__", new PyFunction(frame.f_globals, new PyObject[] {}, c$47___sub__));
            frame.setlocal("__isub__", new PyFunction(frame.f_globals, new PyObject[] {}, c$48___isub__));
            frame.setlocal("__getitem__", new PyFunction(frame.f_globals, new PyObject[] {}, c$49___getitem__));
            return frame.getf_locals();
        }
        
        private static PyObject dump_address_pair$52(PyFrame frame) {
            /* Dump a (name, address) pair in a canonicalized form. */
            if (frame.getlocal(0).__getitem__(i$11).__nonzero__()) {
                return s$49._add(frame.getlocal(0).__getitem__(i$11))._add(s$90)._add(frame.getlocal(0).__getitem__(i$10))._add(s$51);
            }
            else {
                return frame.getlocal(0).__getitem__(i$10);
            }
        }
        
        private static PyObject parsedate_tz$53(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Convert a date string to a time tuple.
            
                Accounts for military timezones.
                 */
            frame.setlocal(0, frame.getlocal(0).invoke("split"));
            if (((t$0$PyObject = frame.getlocal(0).__getitem__(i$11).__getitem__(i$10.__neg__())._in(new PyTuple(new PyObject[] {s$70, s$74}))).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getitem__(i$11).invoke("lower")._in(frame.getglobal("_daynames"))).__nonzero__()) {
                frame.getlocal(0).__delitem__(i$11);
            }
            if (frame.getglobal("len").__call__(frame.getlocal(0))._eq(i$142).__nonzero__()) {
                frame.setlocal(4, frame.getlocal(0).__getitem__(i$11).invoke("split", s$143));
                if (frame.getglobal("len").__call__(frame.getlocal(4))._eq(i$142).__nonzero__()) {
                    frame.setlocal(0, frame.getlocal(4)._add(frame.getlocal(0).__getslice__(i$10, null, null)));
                }
            }
            if (frame.getglobal("len").__call__(frame.getlocal(0))._eq(i$144).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(0).__getitem__(i$142));
                frame.setlocal(8, frame.getlocal(5).invoke("find", s$145));
                if (frame.getlocal(8)._gt(i$11).__nonzero__()) {
                    frame.getlocal(0).__setslice__(i$142, null, null, new PyList(new PyObject[] {frame.getlocal(5).__getslice__(null, frame.getlocal(8), null), frame.getlocal(5).__getslice__(frame.getlocal(8)._add(i$10), null, null)}));
                }
                else {
                    frame.getlocal(0).invoke("append", s$15);
                }
            }
            if (frame.getglobal("len").__call__(frame.getlocal(0))._lt(i$146).__nonzero__()) {
                return frame.getglobal("None");
            }
            frame.setlocal(0, frame.getlocal(0).__getslice__(null, i$146, null));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0), 5);
            frame.setlocal(13, t$0$PyObject__[0]);
            frame.setlocal(9, t$0$PyObject__[1]);
            frame.setlocal(7, t$0$PyObject__[2]);
            frame.setlocal(1, t$0$PyObject__[3]);
            frame.setlocal(12, t$0$PyObject__[4]);
            frame.setlocal(9, frame.getlocal(9).invoke("lower"));
            if (frame.getlocal(9)._in(frame.getglobal("_monthnames")).__not__().__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(9), frame.getlocal(13).invoke("lower")}), 2);
                frame.setlocal(13, t$0$PyObject__[0]);
                frame.setlocal(9, t$0$PyObject__[1]);
                if (frame.getlocal(9)._in(frame.getglobal("_monthnames")).__not__().__nonzero__()) {
                    return frame.getglobal("None");
                }
            }
            frame.setlocal(9, frame.getglobal("_monthnames").invoke("index", frame.getlocal(9))._add(i$10));
            if (frame.getlocal(9)._gt(i$147).__nonzero__()) {
                frame.setlocal(9, frame.getlocal(9)._sub(i$147));
            }
            if (frame.getlocal(13).__getitem__(i$10.__neg__())._eq(s$70).__nonzero__()) {
                frame.setlocal(13, frame.getlocal(13).__getslice__(null, i$10.__neg__(), null));
            }
            frame.setlocal(8, frame.getlocal(7).invoke("find", s$25));
            if (frame.getlocal(8)._gt(i$11).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(7)}), 2);
                frame.setlocal(7, t$0$PyObject__[0]);
                frame.setlocal(1, t$0$PyObject__[1]);
            }
            if (frame.getlocal(7).__getitem__(i$10.__neg__())._eq(s$70).__nonzero__()) {
                frame.setlocal(7, frame.getlocal(7).__getslice__(null, i$10.__neg__(), null));
            }
            if (frame.getlocal(7).__getitem__(i$11).invoke("isdigit").__not__().__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(12), frame.getlocal(7)}), 2);
                frame.setlocal(7, t$0$PyObject__[0]);
                frame.setlocal(12, t$0$PyObject__[1]);
            }
            if (frame.getlocal(1).__getitem__(i$10.__neg__())._eq(s$70).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$10.__neg__(), null));
            }
            frame.setlocal(1, frame.getlocal(1).invoke("split", s$25));
            if (frame.getglobal("len").__call__(frame.getlocal(1))._eq(i$148).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1), 2);
                frame.setlocal(2, t$0$PyObject__[0]);
                frame.setlocal(14, t$0$PyObject__[1]);
                frame.setlocal(11, s$149);
            }
            else if (frame.getglobal("len").__call__(frame.getlocal(1))._eq(i$142).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1), 3);
                frame.setlocal(2, t$0$PyObject__[0]);
                frame.setlocal(14, t$0$PyObject__[1]);
                frame.setlocal(11, t$0$PyObject__[2]);
            }
            else {
                return frame.getglobal("None");
            }
            try {
                frame.setlocal(7, frame.getglobal("int").__call__(frame.getlocal(7)));
                frame.setlocal(13, frame.getglobal("int").__call__(frame.getlocal(13)));
                frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(2)));
                frame.setlocal(14, frame.getglobal("int").__call__(frame.getlocal(14)));
                frame.setlocal(11, frame.getglobal("int").__call__(frame.getlocal(11)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    return frame.getglobal("None");
                }
                else throw t$0$PyException;
            }
            frame.setlocal(10, frame.getglobal("None"));
            frame.setlocal(12, frame.getlocal(12).invoke("upper"));
            if (frame.getglobal("_timezones").invoke("has_key", frame.getlocal(12)).__nonzero__()) {
                frame.setlocal(10, frame.getglobal("_timezones").__getitem__(frame.getlocal(12)));
            }
            else {
                try {
                    frame.setlocal(10, frame.getglobal("int").__call__(frame.getlocal(12)));
                }
                catch (Throwable x$1) {
                    t$0$PyException = Py.setException(x$1, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                        // pass
                    }
                    else throw t$0$PyException;
                }
            }
            if (frame.getlocal(10).__nonzero__()) {
                if (frame.getlocal(10)._lt(i$11).__nonzero__()) {
                    frame.setlocal(3, i$10.__neg__());
                    frame.setlocal(10, frame.getlocal(10).__neg__());
                }
                else {
                    frame.setlocal(3, i$10);
                }
                frame.setlocal(10, frame.getlocal(3)._mul(frame.getlocal(10)._div(i$150)._mul(i$151)._add(frame.getlocal(10)._mod(i$150)._mul(i$152))));
            }
            frame.setlocal(6, new PyTuple(new PyObject[] {frame.getlocal(7), frame.getlocal(9), frame.getlocal(13), frame.getlocal(2), frame.getlocal(14), frame.getlocal(11), i$11, i$11, i$11, frame.getlocal(10)}));
            return frame.getlocal(6);
        }
        
        private static PyObject parsedate$54(PyFrame frame) {
            /* Convert a time string to a time tuple. */
            frame.setlocal(1, frame.getglobal("parsedate_tz").__call__(frame.getlocal(0)));
            if (frame.getglobal("type").__call__(frame.getlocal(1))._eq(frame.getglobal("type").__call__(new PyTuple(new PyObject[] {}))).__nonzero__()) {
                return frame.getlocal(1).__getslice__(null, i$154, null);
            }
            else {
                return frame.getlocal(1);
            }
        }
        
        private static PyObject mktime_tz$55(PyFrame frame) {
            /* Turn a 10-tuple as returned by parsedate_tz() into a UTC timestamp. */
            if (frame.getlocal(0).__getitem__(i$154)._is(frame.getglobal("None")).__nonzero__()) {
                return frame.getglobal("time").__getattr__("mktime").__call__(frame.getlocal(0).__getslice__(null, i$156, null)._add(new PyTuple(new PyObject[] {i$10.__neg__()})));
            }
            else {
                frame.setlocal(1, frame.getglobal("time").__getattr__("mktime").__call__(frame.getlocal(0).__getslice__(null, i$156, null)._add(new PyTuple(new PyObject[] {i$11}))));
                return frame.getlocal(1)._sub(frame.getlocal(0).__getitem__(i$154))._sub(frame.getglobal("time").__getattr__("timezone"));
            }
        }
        
        private static PyObject formatdate$56(PyFrame frame) {
            /* Returns time format preferred for Internet standards.
            
                Sun, 06 Nov 1994 08:49:37 GMT  ; RFC 822, updated by RFC 1123
                 */
            if (frame.getlocal(0)._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(0, frame.getglobal("time").__getattr__("time").__call__());
            }
            return s$158._mod(frame.getglobal("time").__getattr__("strftime").__call__(s$159, frame.getglobal("time").__getattr__("gmtime").__call__(frame.getlocal(0))));
        }
        
        private static PyObject main$57(PyFrame frame) {
            frame.setglobal("__file__", s$184);
            
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* RFC-822 message manipulation class.
            
            XXX This is only a very rough sketch of a full RFC-822 parser;
            in particular the tokenizing of addresses does not adhere to all the
            quoting rules.
            
            Directions for use:
            
            To create a Message object: first open a file, e.g.:
              fp = open(file, 'r')
            You can use any other legal way of getting an open file object, e.g. use
            sys.stdin or call os.popen().
            Then pass the open file object to the Message() constructor:
              m = Message(fp)
            
            This class can work with any input object that supports a readline
            method.  If the input object has seek and tell capability, the
            rewindbody method will work; also illegal lines will be pushed back
            onto the input stream.  If the input object lacks seek but has an
            `unread' method that can push back a line of input, Message will use
            that to push back illegal lines.  Thus this class can be used to parse
            messages coming from a buffered stream.
            
            The optional `seekable' argument is provided as a workaround for
            certain stdio libraries in which tell() discards buffered data before
            discovering that the lseek() system call doesn't work.  For maximum
            portability, you should set the seekable argument to zero to prevent
            that initial \code{tell} when passing in an unseekable object such as
            a a file object created from a socket object.  If it is 1 on entry --
            which it is by default -- the tell() method of the open file object is
            called once; if this raises an exception, seekable is reset to 0.  For
            other nonzero values of seekable, this test is not made.
            
            To get the text of a particular header there are several methods:
              str = m.getheader(name)
              str = m.getrawheader(name)
            where name is the name of the header, e.g. 'Subject'.
            The difference is that getheader() strips the leading and trailing
            whitespace, while getrawheader() doesn't.  Both functions retain
            embedded whitespace (including newlines) exactly as they are
            specified in the header, and leave the case of the text unchanged.
            
            For addresses and address lists there are functions
              realname, mailaddress = m.getaddr(name) and
              list = m.getaddrlist(name)
            where the latter returns a list of (realname, mailaddr) tuples.
            
            There is also a method
              time = m.getdate(name)
            which parses a Date-like field and returns a time-compatible tuple,
            i.e. a tuple such as returned by time.localtime() or accepted by
            time.mktime().
            
            See the class definition for lower level access methods.
            
            There are also some utility functions here.
             */
            frame.setlocal("time", org.python.core.imp.importOne("time", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4, s$5}));
            frame.setlocal("_blanklines", new PyTuple(new PyObject[] {s$6, s$7}));
            frame.setlocal("Message", Py.makeClass("Message", new PyObject[] {}, c$24_Message, null));
            frame.setlocal("unquote", new PyFunction(frame.f_globals, new PyObject[] {}, c$25_unquote));
            frame.setlocal("quote", new PyFunction(frame.f_globals, new PyObject[] {}, c$26_quote));
            frame.setlocal("parseaddr", new PyFunction(frame.f_globals, new PyObject[] {}, c$27_parseaddr));
            frame.setlocal("AddrlistClass", Py.makeClass("AddrlistClass", new PyObject[] {}, c$41_AddrlistClass, null));
            frame.setlocal("AddressList", Py.makeClass("AddressList", new PyObject[] {frame.getname("AddrlistClass")}, c$50_AddressList, null));
            frame.setlocal("dump_address_pair", new PyFunction(frame.f_globals, new PyObject[] {}, c$51_dump_address_pair));
            frame.setlocal("_monthnames", new PyList(new PyObject[] {s$91, s$92, s$93, s$94, s$95, s$96, s$97, s$98, s$99, s$100, s$101, s$102, s$103, s$104, s$105, s$106, s$95, s$107, s$108, s$109, s$110, s$111, s$112, s$113}));
            frame.setlocal("_daynames", new PyList(new PyObject[] {s$114, s$115, s$116, s$117, s$118, s$119, s$120}));
            frame.setlocal("_timezones", new PyDictionary(new PyObject[] {s$121, i$11, s$122, i$11, s$123, i$11, s$124, i$11, s$125, i$126.__neg__(), s$127, i$128.__neg__(), s$129, i$130.__neg__(), s$131, i$126.__neg__(), s$132, i$133.__neg__(), s$134, i$130.__neg__(), s$135, i$136.__neg__(), s$137, i$133.__neg__(), s$138, i$139.__neg__(), s$140, i$136.__neg__()}));
            frame.setlocal("parsedate_tz", new PyFunction(frame.f_globals, new PyObject[] {}, c$52_parsedate_tz));
            frame.setlocal("parsedate", new PyFunction(frame.f_globals, new PyObject[] {}, c$53_parsedate));
            frame.setlocal("mktime_tz", new PyFunction(frame.f_globals, new PyObject[] {}, c$54_mktime_tz));
            frame.setlocal("formatdate", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$55_formatdate));
            if (frame.getname("__name__")._eq(s$160).__nonzero__()) {
                frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
                frame.setlocal("os", org.python.core.imp.importOne("os", frame));
                frame.setlocal("file", frame.getname("os").__getattr__("path").__getattr__("join").__call__(frame.getname("os").__getattr__("environ").__getitem__(s$161), s$162));
                if (frame.getname("sys").__getattr__("argv").__getslice__(i$10, null, null).__nonzero__()) {
                    frame.setlocal("file", frame.getname("sys").__getattr__("argv").__getitem__(i$10));
                }
                frame.setlocal("f", frame.getname("open").__call__(frame.getname("file"), s$163));
                frame.setlocal("m", frame.getname("Message").__call__(frame.getname("f")));
                Py.printComma(s$164);
                Py.println(frame.getname("m").invoke("getaddr", s$165));
                Py.printComma(s$166);
                Py.println(frame.getname("m").invoke("getaddrlist", s$167));
                Py.printComma(s$168);
                Py.println(frame.getname("m").invoke("getheader", s$169));
                Py.printComma(s$170);
                Py.println(frame.getname("m").invoke("getheader", s$171));
                frame.setlocal("date", frame.getname("m").invoke("getdate_tz", s$171));
                frame.setlocal("tz", frame.getname("date").__getitem__(i$10.__neg__()));
                frame.setlocal("date", frame.getname("time").__getattr__("localtime").__call__(frame.getname("mktime_tz").__call__(frame.getname("date"))));
                if (frame.getname("date").__nonzero__()) {
                    Py.printComma(s$172);
                    Py.printComma(frame.getname("time").__getattr__("asctime").__call__(frame.getname("date")));
                    frame.setlocal("hhmmss", frame.getname("tz"));
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getname("divmod").__call__(frame.getname("hhmmss"), i$152), 2);
                    frame.setlocal("hhmm", t$0$PyObject__[0]);
                    frame.setlocal("ss", t$0$PyObject__[1]);
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getname("divmod").__call__(frame.getname("hhmm"), i$152), 2);
                    frame.setlocal("hh", t$0$PyObject__[0]);
                    frame.setlocal("mm", t$0$PyObject__[1]);
                    Py.printComma(s$173._mod(new PyTuple(new PyObject[] {frame.getname("hh"), frame.getname("mm")})));
                    if (frame.getname("ss").__nonzero__()) {
                        Py.printComma(s$174._mod(frame.getname("ss")));
                    }
                    Py.println();
                }
                else {
                    Py.printComma(s$172);
                    Py.println(frame.getname("None"));
                }
                frame.getname("m").invoke("rewindbody");
                frame.setlocal("n", i$11);
                while (frame.getname("f").invoke("readline").__nonzero__()) {
                    frame.setlocal("n", frame.getname("n")._add(i$10));
                }
                Py.printComma(s$175);
                Py.println(frame.getname("n"));
                Py.println(s$143._mul(i$176));
                Py.printComma(s$177);
                Py.println(frame.getname("len").__call__(frame.getname("m")));
                if (frame.getname("m").invoke("has_key", s$178).__nonzero__()) {
                    Py.printComma(s$179);
                    Py.println(frame.getname("m").__getitem__(s$178));
                }
                if (frame.getname("m").invoke("has_key", s$180).__nonzero__()) {
                    // pass
                }
                Py.printComma(s$181);
                Py.println(frame.getname("m").invoke("keys"));
                Py.printComma(s$182);
                Py.println(frame.getname("m").invoke("values"));
                Py.printComma(s$183);
                Py.println(frame.getname("m").invoke("items"));
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("rfc822"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "rfc822";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(rfc822._PyInner.class, newargs, rfc822.jpy$packages, rfc822.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
