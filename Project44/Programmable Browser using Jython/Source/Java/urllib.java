import org.python.core.*;

public class urllib extends java.lang.Object {
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
        private static PyObject i$31;
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
        private static PyObject i$51;
        private static PyObject s$52;
        private static PyObject s$53;
        private static PyObject s$54;
        private static PyObject s$55;
        private static PyObject s$56;
        private static PyObject i$57;
        private static PyObject s$58;
        private static PyObject s$59;
        private static PyObject i$60;
        private static PyObject i$61;
        private static PyObject s$62;
        private static PyObject s$63;
        private static PyObject i$64;
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
        private static PyObject i$79;
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
        private static PyObject s$126;
        private static PyObject s$127;
        private static PyObject s$128;
        private static PyObject s$129;
        private static PyObject i$130;
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
        private static PyObject s$141;
        private static PyObject s$142;
        private static PyObject s$143;
        private static PyObject s$144;
        private static PyObject s$145;
        private static PyObject s$146;
        private static PyObject s$147;
        private static PyObject s$148;
        private static PyObject s$149;
        private static PyObject s$150;
        private static PyObject s$151;
        private static PyObject s$152;
        private static PyObject s$153;
        private static PyObject s$154;
        private static PyObject s$155;
        private static PyObject s$156;
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
        private static PyObject s$176;
        private static PyObject i$177;
        private static PyObject s$178;
        private static PyObject s$179;
        private static PyObject s$180;
        private static PyObject s$181;
        private static PyObject s$182;
        private static PyObject s$183;
        private static PyObject s$184;
        private static PyObject s$185;
        private static PyObject s$186;
        private static PyObject s$187;
        private static PyObject s$188;
        private static PyObject s$189;
        private static PyObject s$190;
        private static PyObject s$191;
        private static PyObject s$192;
        private static PyObject s$193;
        private static PyObject s$194;
        private static PyObject s$195;
        private static PyObject s$196;
        private static PyObject s$197;
        private static PyObject s$198;
        private static PyObject s$199;
        private static PyObject s$200;
        private static PyObject s$201;
        private static PyObject i$202;
        private static PyObject s$203;
        private static PyObject s$204;
        private static PyObject s$205;
        private static PyObject s$206;
        private static PyObject s$207;
        private static PyObject s$208;
        private static PyObject s$209;
        private static PyObject s$210;
        private static PyObject s$211;
        private static PyObject s$212;
        private static PyObject s$213;
        private static PyObject s$214;
        private static PyObject s$215;
        private static PyObject i$216;
        private static PyObject s$217;
        private static PyObject s$218;
        private static PyObject s$219;
        private static PyObject s$220;
        private static PyObject s$221;
        private static PyObject s$222;
        private static PyObject s$223;
        private static PyObject s$224;
        private static PyObject s$225;
        private static PyObject s$226;
        private static PyObject i$227;
        private static PyObject s$228;
        private static PyObject s$229;
        private static PyObject s$230;
        private static PyObject i$231;
        private static PyObject s$232;
        private static PyObject s$233;
        private static PyObject s$234;
        private static PyObject s$235;
        private static PyObject s$236;
        private static PyObject s$237;
        private static PyObject s$238;
        private static PyObject s$239;
        private static PyObject s$240;
        private static PyObject s$241;
        private static PyObject s$242;
        private static PyObject s$243;
        private static PyObject i$244;
        private static PyObject s$245;
        private static PyObject s$246;
        private static PyObject s$247;
        private static PyObject s$248;
        private static PyObject s$249;
        private static PyObject s$250;
        private static PyObject s$251;
        private static PyObject s$252;
        private static PyObject s$253;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_url2pathname;
        private static PyCode c$1_pathname2url;
        private static PyCode c$2_urlopen;
        private static PyCode c$3_urlretrieve;
        private static PyCode c$4_urlcleanup;
        private static PyCode c$5___init__;
        private static PyCode c$6___del__;
        private static PyCode c$7_close;
        private static PyCode c$8_cleanup;
        private static PyCode c$9_addheader;
        private static PyCode c$10_open;
        private static PyCode c$11_open_unknown;
        private static PyCode c$12_open_unknown_proxy;
        private static PyCode c$13_retrieve;
        private static PyCode c$14_open_http;
        private static PyCode c$15_http_error;
        private static PyCode c$16_http_error_default;
        private static PyCode c$17_open_https;
        private static PyCode c$18_open_gopher;
        private static PyCode c$19_open_file;
        private static PyCode c$20_open_local_file;
        private static PyCode c$21_open_ftp;
        private static PyCode c$22_open_data;
        private static PyCode c$23_URLopener;
        private static PyCode c$24___init__;
        private static PyCode c$25_http_error_default;
        private static PyCode c$26_http_error_302;
        private static PyCode c$27_redirect_internal;
        private static PyCode c$28_http_error_301;
        private static PyCode c$29_http_error_401;
        private static PyCode c$30_retry_http_basic_auth;
        private static PyCode c$31_retry_https_basic_auth;
        private static PyCode c$32_get_user_passwd;
        private static PyCode c$33_prompt_user_passwd;
        private static PyCode c$34_FancyURLopener;
        private static PyCode c$35_localhost;
        private static PyCode c$36_thishost;
        private static PyCode c$37_ftperrors;
        private static PyCode c$38_noheaders;
        private static PyCode c$39___init__;
        private static PyCode c$40_init;
        private static PyCode c$41_retrfile;
        private static PyCode c$42_endtransfer;
        private static PyCode c$43_close;
        private static PyCode c$44_ftpwrapper;
        private static PyCode c$45___init__;
        private static PyCode c$46___repr__;
        private static PyCode c$47_close;
        private static PyCode c$48_addbase;
        private static PyCode c$49___init__;
        private static PyCode c$50_close;
        private static PyCode c$51_addclosehook;
        private static PyCode c$52___init__;
        private static PyCode c$53_info;
        private static PyCode c$54_addinfo;
        private static PyCode c$55___init__;
        private static PyCode c$56_info;
        private static PyCode c$57_geturl;
        private static PyCode c$58_addinfourl;
        private static PyCode c$59_basejoin;
        private static PyCode c$60_toBytes;
        private static PyCode c$61_unwrap;
        private static PyCode c$62_splittype;
        private static PyCode c$63_splithost;
        private static PyCode c$64_splituser;
        private static PyCode c$65_splitpasswd;
        private static PyCode c$66_splitport;
        private static PyCode c$67_splitnport;
        private static PyCode c$68_splitquery;
        private static PyCode c$69_splittag;
        private static PyCode c$70_splitattr;
        private static PyCode c$71_splitvalue;
        private static PyCode c$72_splitgophertype;
        private static PyCode c$73_unquote;
        private static PyCode c$74_unquote_plus;
        private static PyCode c$75__fast_quote;
        private static PyCode c$76_quote;
        private static PyCode c$77_quote_plus;
        private static PyCode c$78_urlencode;
        private static PyCode c$79_getproxies_environment;
        private static PyCode c$80_getproxies;
        private static PyCode c$81_getproxies_registry;
        private static PyCode c$82_getproxies;
        private static PyCode c$83_test1;
        private static PyCode c$84_reporthook;
        private static PyCode c$85_test;
        private static PyCode c$86_main;
        private static PyCode c$87_main;
        private static void initConstants() {
            s$0 = Py.newString("Open an arbitrary URL.\012\012See the following document for more info on URLs:\012\"Names and Addresses, URIs, URLs, URNs, URCs\", at\012http://www.w3.org/pub/WWW/Addressing/Overview.html\012\012See also the HTTP spec (from which the error codes are derived):\012\"HTTP - Hypertext Transfer Protocol\", at\012http://www.w3.org/pub/WWW/Protocols/\012\012Related standards and specs:\012- RFC1808: the \"relative URL\" spec. (authoritative status)\012- RFC1738 - the \"URL standard\". (authoritative status)\012- RFC1630 - the \"URI spec\". (informational status)\012\012The object returned by URLopener().open(file) will differ per\012protocol.  All you know is that is has methods read(), readline(),\012readlines(), fileno(), close() and info().  The read*(), fileno()\012and close() methods work like those of open files.\012The info() method returns a mimetools.Message object which can be\012used to query various info about the object, if available.\012(mimetools.Message objects are queried with the getheader() method.)\012");
            s$1 = Py.newString("urlopen");
            s$2 = Py.newString("URLopener");
            s$3 = Py.newString("FancyURLopener");
            s$4 = Py.newString("urlretrieve");
            s$5 = Py.newString("urlcleanup");
            s$6 = Py.newString("quote");
            s$7 = Py.newString("quote_plus");
            s$8 = Py.newString("unquote");
            s$9 = Py.newString("unquote_plus");
            s$10 = Py.newString("urlencode");
            s$11 = Py.newString("url2pathname");
            s$12 = Py.newString("pathname2url");
            s$13 = Py.newString("splittag");
            s$14 = Py.newString("localhost");
            s$15 = Py.newString("thishost");
            s$16 = Py.newString("ftperrors");
            s$17 = Py.newString("basejoin");
            s$18 = Py.newString("unwrap");
            s$19 = Py.newString("splittype");
            s$20 = Py.newString("splithost");
            s$21 = Py.newString("splituser");
            s$22 = Py.newString("splitpasswd");
            s$23 = Py.newString("splitport");
            s$24 = Py.newString("splitnport");
            s$25 = Py.newString("splitquery");
            s$26 = Py.newString("splitattr");
            s$27 = Py.newString("splitvalue");
            s$28 = Py.newString("splitgophertype");
            s$29 = Py.newString("getproxies");
            s$30 = Py.newString("1.15");
            i$31 = Py.newInteger(10);
            s$32 = Py.newString("mac");
            s$33 = Py.newString("nt");
            s$34 = Py.newString("riscos");
            s$35 = Py.newString("urlopen(url [, data]) -> open file-like object");
            s$36 = Py.newString("Class to open URLs.\012    This is a class rather than just a subroutine because we may need\012    more than one set of global protocol-specific options.\012    Note -- this is a base class for those who don't want the\012    automatic handling of errors type 302 (relocated) and 401\012    (authorization needed).");
            s$37 = Py.newString("Python-urllib/%s");
            s$38 = Py.newString("has_key");
            s$39 = Py.newString("proxies must be a mapping");
            s$40 = Py.newString("key_file");
            s$41 = Py.newString("cert_file");
            s$42 = Py.newString("User-agent");
            s$43 = Py.newString("Add a header to be used by the HTTP interface only\012        e.g. u.addheader('Accept', 'sound/basic')");
            s$44 = Py.newString("Use URLopener().open(file) instead of open(file, 'r').");
            s$45 = Py.newString("rb");
            s$46 = Py.newString("file");
            s$47 = Py.newString("open_");
            s$48 = Py.newString("-");
            s$49 = Py.newString("_");
            s$50 = Py.newString("socket error");
            i$51 = Py.newInteger(2);
            s$52 = Py.newString("Overridable interface to open unknown URL type.");
            s$53 = Py.newString("url error");
            s$54 = Py.newString("unknown url type");
            s$55 = Py.newString("invalid proxy for %s");
            s$56 = Py.newString("retrieve(url) returns (filename, None) for a local object\012        or (tempfilename, headers) for a remote object.");
            i$57 = Py.newInteger(1);
            s$58 = Py.newString("");
            s$59 = Py.newString("wb");
            i$60 = Py.newInteger(1024);
            i$61 = Py.newInteger(8);
            s$62 = Py.newString("content-length");
            s$63 = Py.newString("Content-Length");
            i$64 = Py.newInteger(0);
            s$65 = Py.newString("Use HTTP protocol.");
            s$66 = Py.newString("http");
            s$67 = Py.newString("%s://%s%s");
            s$68 = Py.newString("http error");
            s$69 = Py.newString("no host given");
            s$70 = Py.newString("POST");
            s$71 = Py.newString("Content-type");
            s$72 = Py.newString("application/x-www-form-urlencoded");
            s$73 = Py.newString("Content-length");
            s$74 = Py.newString("%d");
            s$75 = Py.newString("GET");
            s$76 = Py.newString("Authorization");
            s$77 = Py.newString("Basic %s");
            s$78 = Py.newString("Host");
            i$79 = Py.newInteger(200);
            s$80 = Py.newString("http:");
            s$81 = Py.newString("Handle http errors.\012        Derived class can override this, or provide specific handlers\012        named http_error_DDD where DDD is the 3-digit error code.");
            s$82 = Py.newString("http_error_%d");
            s$83 = Py.newString("Default error handler: close the connection and raise IOError.");
            s$84 = Py.newString("ssl");
            s$85 = Py.newString("Use HTTPS protocol.");
            s$86 = Py.newString("https");
            s$87 = Py.newString("https error");
            s$88 = Py.newString("Authorization: Basic %s");
            s$89 = Py.newString("Use Gopher protocol.");
            s$90 = Py.newString("gopher error");
            s$91 = Py.newString("gopher:");
            s$92 = Py.newString("Use local file or FTP depending on form of URL.");
            s$93 = Py.newString("//");
            i$94 = Py.newInteger(3);
            s$95 = Py.newString("/");
            s$96 = Py.newString("Use local file.");
            s$97 = Py.newString("Content-Type: %s\012");
            s$98 = Py.newString("text/plain");
            s$99 = Py.newString("file://");
            s$100 = Py.newString("local file error");
            s$101 = Py.newString("not on local host");
            s$102 = Py.newString("Use FTP protocol.");
            s$103 = Py.newString("ftp error");
            s$104 = Py.newString("D");
            s$105 = Py.newString("I");
            s$106 = Py.newString("type");
            s$107 = Py.newString("a");
            s$108 = Py.newString("A");
            s$109 = Py.newString("i");
            s$110 = Py.newString("d");
            s$111 = Py.newString("Content-Length: %d\012");
            s$112 = Py.newString("ftp:");
            s$113 = Py.newString("Use \"data\" URL.");
            s$114 = Py.newString(",");
            s$115 = Py.newString("data error");
            s$116 = Py.newString("bad data URL");
            s$117 = Py.newString("text/plain;charset=US-ASCII");
            s$118 = Py.newString(";");
            s$119 = Py.newString("=");
            s$120 = Py.newString("Date: %s");
            s$121 = Py.newString("%a, %d %b %Y %T GMT");
            s$122 = Py.newString("Content-type: %s");
            s$123 = Py.newString("base64");
            s$124 = Py.newString("Content-length: %d");
            s$125 = Py.newString("\012");
            s$126 = Py.newString("Derived class with handlers for errors we can handle (perhaps).");
            s$127 = Py.newString("Default error handling -- don't raise an exception.");
            s$128 = Py.newString("Error 302 -- relocated (temporarily).");
            s$129 = Py.newString("http_error_500");
            i$130 = Py.newInteger(500);
            s$131 = Py.newString("Internal Server Error: Redirect Recursion");
            s$132 = Py.newString("location");
            s$133 = Py.newString("uri");
            s$134 = Py.newString(":");
            s$135 = Py.newString("Error 301 -- also relocated (permanently).");
            s$136 = Py.newString("Error 401 -- authentication required.\012        See this URL for a description of the basic authentication scheme:\012        http://www.ics.uci.edu/pub/ietf/http/draft-ietf-http-v10-spec-00.txt");
            s$137 = Py.newString("www-authenticate");
            s$138 = Py.newString("[ \011]*([^ \011]+)[ \011]+realm=\"([^\"]*)\"");
            s$139 = Py.newString("basic");
            s$140 = Py.newString("retry_");
            s$141 = Py.newString("_basic_auth");
            s$142 = Py.newString("@");
            s$143 = Py.newString("http://");
            s$144 = Py.newString("Override this in a GUI environment!");
            s$145 = Py.newString("Enter username for %s at %s: ");
            s$146 = Py.newString("Enter password for %s in %s at %s: ");
            s$147 = Py.newString("Return the IP address of the magic hostname 'localhost'.");
            s$148 = Py.newString("Return the IP address of the current host.");
            s$149 = Py.newString("Return the set of errors raised by the FTP class.");
            s$150 = Py.newString("Return an empty mimetools.Message object.");
            s$151 = Py.newString("Class used by open_ftp() for cache of open FTP connections.");
            s$152 = Py.newString("TYPE A");
            s$153 = Py.newString("TYPE ");
            s$154 = Py.newString("RETR ");
            s$155 = Py.newString("550");
            s$156 = Py.newString("LIST ");
            s$157 = Py.newString("LIST");
            s$158 = Py.newString("Base class for addinfo and addclosehook.");
            s$159 = Py.newString("readlines");
            s$160 = Py.newString("fileno");
            s$161 = Py.newString("<%s at %s whose fp = %s>");
            s$162 = Py.newString("Class to add a close hook to an open file.");
            s$163 = Py.newString("class to add an info() method to an open file.");
            s$164 = Py.newString("class to add info() and geturl() methods to an open file.");
            s$165 = Py.newString("Utility to combine a URL with a base URL to form a new URL.");
            s$166 = Py.newString("://");
            s$167 = Py.newString("#");
            s$168 = Py.newString("?");
            s$169 = Py.newString("../");
            s$170 = Py.newString("toBytes(u\"URL\") --> 'URL'.");
            s$171 = Py.newString("ASCII");
            s$172 = Py.newString("URL ");
            s$173 = Py.newString(" contains non-ASCII characters");
            s$174 = Py.newString("unwrap('<URL:type://host/path>') --> 'type://host/path'.");
            s$175 = Py.newString("<");
            s$176 = Py.newString(">");
            i$177 = Py.newInteger(4);
            s$178 = Py.newString("URL:");
            s$179 = Py.newString("splittype('type:opaquestring') --> 'type', 'opaquestring'.");
            s$180 = Py.newString("^([^/:]+):");
            s$181 = Py.newString("splithost('//host[:port]/path') --> 'host[:port]', '/path'.");
            s$182 = Py.newString("^//([^/]*)(.*)$");
            s$183 = Py.newString("splituser('user[:passwd]@host[:port]') --> 'user[:passwd]', 'host[:port]'.");
            s$184 = Py.newString("^([^@]*)@(.*)$");
            s$185 = Py.newString("splitpasswd('user:passwd') -> 'user', 'passwd'.");
            s$186 = Py.newString("^([^:]*):(.*)$");
            s$187 = Py.newString("splitport('host:port') --> 'host', 'port'.");
            s$188 = Py.newString("^(.*):([0-9]+)$");
            s$189 = Py.newString("Split host and port, returning numeric port.\012    Return given default port if no ':' found; defaults to -1.\012    Return numerical port if a valid number are found after ':'.\012    Return None if ':' but not a valid number.");
            s$190 = Py.newString("^(.*):(.*)$");
            s$191 = Py.newString("no digits");
            s$192 = Py.newString("splitquery('/path?query') --> '/path', 'query'.");
            s$193 = Py.newString("^(.*)\\?([^?]*)$");
            s$194 = Py.newString("splittag('/path#tag') --> '/path', 'tag'.");
            s$195 = Py.newString("^(.*)#([^#]*)$");
            s$196 = Py.newString("splitattr('/path;attr1=value1;attr2=value2;...') ->\012        '/path', ['attr1=value1', 'attr2=value2', ...].");
            s$197 = Py.newString("splitvalue('attr=value') --> 'attr', 'value'.");
            s$198 = Py.newString("^([^=]*)=(.*)$");
            s$199 = Py.newString("splitgophertype('/Xselector') --> 'X', 'selector'.");
            s$200 = Py.newString("unquote('abc%20def') -> 'abc def'.");
            s$201 = Py.newString("%");
            i$202 = Py.newInteger(16);
            s$203 = Py.newString("unquote('%7e/abc+def') -> '~/abc def'");
            s$204 = Py.newString("+");
            s$205 = Py.newString(" ");
            s$206 = Py.newString("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.-");
            s$207 = Py.newString("%%%02X");
            s$208 = Py.newString("quote('abc def') -> 'abc%20def'\012\012    Each part of a URL, e.g. the path info, the query, etc., has a\012    different set of reserved characters that must be quoted.\012\012    RFC 2396 Uniform Resource Identifiers (URI): Generic Syntax lists\012    the following reserved characters.\012\012    reserved    = \";\" | \"/\" | \"?\" | \":\" | \"@\" | \"&\" | \"=\" | \"+\" |\012                  \"$\" | \",\"\012\012    Each of these characters is reserved in some component of a URL,\012    but not necessarily in all of them.\012\012    By default, the quote function is intended for quoting the path\012    section of a URL.  Thus, it will not encode '/'.  This character\012    is reserved, but in typical usage the quote function is being\012    called on a path where the existing slash characters are used as\012    reserved characters.\012    ");
            s$209 = Py.newString("Quote the query fragment of a URL; replacing ' ' with '+'");
            s$210 = Py.newString("Encode a sequence of two-element tuples or dictionary into a URL query string.\012\012    If any values in the query arg are sequences and doseq is true, each\012    sequence element is converted to a separate parameter.\012\012    If the query arg is a sequence of two-element tuples, the order of the\012    parameters in the output will match the order of parameters in the\012    input.\012    ");
            s$211 = Py.newString("items");
            s$212 = Py.newString("not a valid non-string sequence or mapping object");
            s$213 = Py.newString("replace");
            s$214 = Py.newString("&");
            s$215 = Py.newString("Return a dictionary of scheme -> proxy server URL mappings.\012\012    Scan the environment for variables named <scheme>_proxy;\012    this seems to be the standard convention.  If you need a\012    different way, you can pass a proxies dictionary to the\012    [Fancy]URLopener constructor.\012\012    ");
            i$216 = Py.newInteger(6);
            s$217 = Py.newString("_proxy");
            s$218 = Py.newString("Return a dictionary of scheme -> proxy server URL mappings.\012\012        By convention the mac uses Internet Config to store\012        proxies.  An HTTP proxy, for instance, is stored under\012        the HttpProxy key.\012\012        ");
            s$219 = Py.newString("UseHTTPProxy");
            s$220 = Py.newString("HTTPProxyHost");
            s$221 = Py.newString("http://%s");
            s$222 = Py.newString("Return a dictionary of scheme -> proxy server URL mappings.\012\012        Win32 uses the registry to store proxies.\012\012        ");
            s$223 = Py.newString("Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings");
            s$224 = Py.newString("ProxyEnable");
            s$225 = Py.newString("ProxyServer");
            s$226 = Py.newString("%s://%s");
            i$227 = Py.newInteger(5);
            s$228 = Py.newString("ftp://%s");
            s$229 = Py.newString("ftp");
            s$230 = Py.newString("Return a dictionary of scheme -> proxy server URL mappings.\012\012        Returns settings gathered from the environment, if specified,\012        or the registry.\012\012        ");
            i$231 = Py.newInteger(256);
            s$232 = Py.newString("Wrong!");
            s$233 = Py.newString("sec");
            s$234 = Py.newString("Block number: %d, Block size: %d, Total size: %d");
            s$235 = Py.newString("/etc/passwd");
            s$236 = Py.newString("file:/etc/passwd");
            s$237 = Py.newString("file://localhost/etc/passwd");
            s$238 = Py.newString("ftp://ftp.python.org/etc/passwd");
            s$239 = Py.newString("http://www.python.org/index.html");
            s$240 = Py.newString("open_https");
            s$241 = Py.newString("https://synergy.as.cmu.edu/~geek/");
            s$242 = Py.newString("======");
            s$243 = Py.newString("\015");
            i$244 = Py.newInteger(40);
            s$245 = Py.newString("th");
            s$246 = Py.newString("Use -h for help");
            s$247 = Py.newString("-t");
            s$248 = Py.newString("-h");
            s$249 = Py.newString("Usage: python urllib.py [-t] [url ...]");
            s$250 = Py.newString("-t runs self-test;");
            s$251 = Py.newString("otherwise, contents of urls are printed");
            s$252 = Py.newString("__main__");
            s$253 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\urllib.py");
            funcTable = new _PyInner();
            c$0_url2pathname = Py.newCode(1, new String[] {"pathname"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "url2pathname", false, false, funcTable, 0, null, null, 0, 1);
            c$1_pathname2url = Py.newCode(1, new String[] {"pathname"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "pathname2url", false, false, funcTable, 1, null, null, 0, 1);
            c$2_urlopen = Py.newCode(2, new String[] {"url", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "urlopen", false, false, funcTable, 2, null, null, 0, 1);
            c$3_urlretrieve = Py.newCode(4, new String[] {"url", "filename", "reporthook", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "urlretrieve", false, false, funcTable, 3, null, null, 0, 1);
            c$4_urlcleanup = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "urlcleanup", false, false, funcTable, 4, null, null, 0, 1);
            c$5___init__ = Py.newCode(3, new String[] {"self", "proxies", "x509"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", false, true, funcTable, 5, null, null, 0, 1);
            c$6___del__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__del__", false, false, funcTable, 6, null, null, 0, 1);
            c$7_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "close", false, false, funcTable, 7, null, null, 0, 1);
            c$8_cleanup = Py.newCode(1, new String[] {"self", "file"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "cleanup", false, false, funcTable, 8, null, null, 0, 1);
            c$9_addheader = Py.newCode(2, new String[] {"self", "args"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "addheader", true, false, funcTable, 9, null, null, 0, 1);
            c$10_open = Py.newCode(3, new String[] {"self", "fullurl", "data", "headers", "url", "msg", "urltype", "fp", "host", "proxyhost", "filename", "selector", "proxy", "name"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open", false, false, funcTable, 10, null, null, 0, 1);
            c$11_open_unknown = Py.newCode(3, new String[] {"self", "fullurl", "data", "url", "type"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_unknown", false, false, funcTable, 11, null, null, 0, 1);
            c$12_open_unknown_proxy = Py.newCode(4, new String[] {"self", "proxy", "fullurl", "data", "url", "type"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_unknown_proxy", false, false, funcTable, 12, null, null, 0, 1);
            c$13_retrieve = Py.newCode(5, new String[] {"self", "url", "filename", "reporthook", "data", "headers", "suffix", "hdrs", "type", "url1", "msg", "fp", "block", "result", "tfp", "size", "path", "garbage", "tempfile", "bs", "blocknum"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "retrieve", false, false, funcTable, 13, null, null, 0, 1);
            c$14_open_http = Py.newCode(3, new String[] {"self", "url", "data", "base64", "headers", "args", "urltype", "fp", "auth", "realhost", "rest", "user_passwd", "host", "httplib", "selector", "h", "errcode", "errmsg"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_http", false, false, funcTable, 14, null, null, 0, 1);
            c$15_http_error = Py.newCode(7, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers", "data", "method", "name", "result"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "http_error", false, false, funcTable, 15, null, null, 0, 1);
            c$16_http_error_default = Py.newCode(6, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers", "void"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "http_error_default", false, false, funcTable, 16, null, null, 0, 1);
            c$17_open_https = Py.newCode(3, new String[] {"self", "url", "data", "base64", "headers", "args", "urltype", "fp", "auth", "realhost", "rest", "user_passwd", "host", "httplib", "selector", "h", "errcode", "errmsg"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_https", false, false, funcTable, 17, null, null, 0, 1);
            c$18_open_gopher = Py.newCode(2, new String[] {"self", "url", "selector", "gopherlib", "fp", "query", "type", "host"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_gopher", false, false, funcTable, 18, null, null, 0, 1);
            c$19_open_file = Py.newCode(2, new String[] {"self", "url"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_file", false, false, funcTable, 19, null, null, 0, 1);
            c$20_open_local_file = Py.newCode(2, new String[] {"self", "url", "mimetools", "headers", "StringIO", "port", "mtype", "host", "mimetypes", "file", "urlfile"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_local_file", false, false, funcTable, 20, null, null, 0, 1);
            c$21_open_ftp = Py.newCode(2, new String[] {"self", "url", "ftplib", "host", "attrs", "passwd", "attr", "key", "file", "StringIO", "dirs", "fp", "user", "mimetools", "port", "v", "msg", "value", "headers", "path", "retrlen", "k", "type"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_ftp", false, false, funcTable, 21, null, null, 0, 1);
            c$22_open_data = Py.newCode(3, new String[] {"self", "url", "data", "mimetools", "base64", "headers", "encoding", "type", "msg", "StringIO", "time", "f", "semi"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "open_data", false, false, funcTable, 22, null, null, 0, 1);
            c$23_URLopener = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "URLopener", false, false, funcTable, 23, null, null, 0, 0);
            c$24___init__ = Py.newCode(2, new String[] {"self", "args"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", true, false, funcTable, 24, null, null, 0, 1);
            c$25_http_error_default = Py.newCode(6, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "http_error_default", false, false, funcTable, 25, null, null, 0, 1);
            c$26_http_error_302 = Py.newCode(7, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers", "data", "meth", "result"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "http_error_302", false, false, funcTable, 26, null, null, 0, 1);
            c$27_redirect_internal = Py.newCode(7, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers", "data", "void", "newurl"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "redirect_internal", false, false, funcTable, 27, null, null, 0, 1);
            c$28_http_error_301 = Py.newCode(7, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "http_error_301", false, false, funcTable, 28, null, null, 0, 1);
            c$29_http_error_401 = Py.newCode(7, new String[] {"self", "url", "fp", "errcode", "errmsg", "headers", "data", "name", "scheme", "stuff", "match", "realm", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "http_error_401", false, false, funcTable, 29, null, null, 0, 1);
            c$30_retry_http_basic_auth = Py.newCode(4, new String[] {"self", "url", "realm", "data", "passwd", "selector", "user", "i", "host", "newurl"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "retry_http_basic_auth", false, false, funcTable, 30, null, null, 0, 1);
            c$31_retry_https_basic_auth = Py.newCode(4, new String[] {"self", "url", "realm", "data", "passwd", "selector", "user", "i", "host", "newurl"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "retry_https_basic_auth", false, false, funcTable, 31, null, null, 0, 1);
            c$32_get_user_passwd = Py.newCode(4, new String[] {"self", "host", "realm", "clear_cache", "passwd", "user", "key"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "get_user_passwd", false, false, funcTable, 32, null, null, 0, 1);
            c$33_prompt_user_passwd = Py.newCode(3, new String[] {"self", "host", "realm", "passwd", "user", "getpass"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "prompt_user_passwd", false, false, funcTable, 33, null, null, 0, 1);
            c$34_FancyURLopener = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "FancyURLopener", false, false, funcTable, 34, null, null, 0, 0);
            c$35_localhost = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "localhost", false, false, funcTable, 35, null, null, 0, 1);
            c$36_thishost = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "thishost", false, false, funcTable, 36, null, null, 0, 1);
            c$37_ftperrors = Py.newCode(0, new String[] {"ftplib"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "ftperrors", false, false, funcTable, 37, null, null, 0, 1);
            c$38_noheaders = Py.newCode(0, new String[] {"mimetools", "StringIO"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "noheaders", false, false, funcTable, 38, null, null, 0, 1);
            c$39___init__ = Py.newCode(6, new String[] {"self", "user", "passwd", "host", "port", "dirs"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", false, false, funcTable, 39, null, null, 0, 1);
            c$40_init = Py.newCode(1, new String[] {"self", "dir", "ftplib"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "init", false, false, funcTable, 40, null, null, 0, 1);
            c$41_retrfile = Py.newCode(3, new String[] {"self", "file", "type", "isdir", "cmd", "conn", "reason", "ftplib"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "retrfile", false, false, funcTable, 41, null, null, 0, 1);
            c$42_endtransfer = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "endtransfer", false, false, funcTable, 42, null, null, 0, 1);
            c$43_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "close", false, false, funcTable, 43, null, null, 0, 1);
            c$44_ftpwrapper = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "ftpwrapper", false, false, funcTable, 44, null, null, 0, 0);
            c$45___init__ = Py.newCode(2, new String[] {"self", "fp"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", false, false, funcTable, 45, null, null, 0, 1);
            c$46___repr__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__repr__", false, false, funcTable, 46, null, null, 0, 1);
            c$47_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "close", false, false, funcTable, 47, null, null, 0, 1);
            c$48_addbase = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "addbase", false, false, funcTable, 48, null, null, 0, 0);
            c$49___init__ = Py.newCode(4, new String[] {"self", "fp", "closehook", "hookargs"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", true, false, funcTable, 49, null, null, 0, 1);
            c$50_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "close", false, false, funcTable, 50, null, null, 0, 1);
            c$51_addclosehook = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "addclosehook", false, false, funcTable, 51, null, null, 0, 0);
            c$52___init__ = Py.newCode(3, new String[] {"self", "fp", "headers"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", false, false, funcTable, 52, null, null, 0, 1);
            c$53_info = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "info", false, false, funcTable, 53, null, null, 0, 1);
            c$54_addinfo = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "addinfo", false, false, funcTable, 54, null, null, 0, 0);
            c$55___init__ = Py.newCode(4, new String[] {"self", "fp", "headers", "url"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "__init__", false, false, funcTable, 55, null, null, 0, 1);
            c$56_info = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "info", false, false, funcTable, 56, null, null, 0, 1);
            c$57_geturl = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "geturl", false, false, funcTable, 57, null, null, 0, 1);
            c$58_addinfourl = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "addinfourl", false, false, funcTable, 58, null, null, 0, 0);
            c$59_basejoin = Py.newCode(2, new String[] {"base", "url", "basequery", "i", "basetag", "basepath", "type", "host", "path"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "basejoin", false, false, funcTable, 59, null, null, 0, 1);
            c$60_toBytes = Py.newCode(1, new String[] {"url"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "toBytes", false, false, funcTable, 60, null, null, 0, 1);
            c$61_unwrap = Py.newCode(1, new String[] {"url"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "unwrap", false, false, funcTable, 61, null, null, 0, 1);
            c$62_splittype = Py.newCode(1, new String[] {"url", "scheme", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splittype", false, false, funcTable, 62, null, null, 0, 1);
            c$63_splithost = Py.newCode(1, new String[] {"url", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splithost", false, false, funcTable, 63, null, null, 0, 1);
            c$64_splituser = Py.newCode(1, new String[] {"host", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splituser", false, false, funcTable, 64, null, null, 0, 1);
            c$65_splitpasswd = Py.newCode(1, new String[] {"user", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitpasswd", false, false, funcTable, 65, null, null, 0, 1);
            c$66_splitport = Py.newCode(1, new String[] {"host", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitport", false, false, funcTable, 66, null, null, 0, 1);
            c$67_splitnport = Py.newCode(2, new String[] {"host", "defport", "port", "match", "nport", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitnport", false, false, funcTable, 67, null, null, 0, 1);
            c$68_splitquery = Py.newCode(1, new String[] {"url", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitquery", false, false, funcTable, 68, null, null, 0, 1);
            c$69_splittag = Py.newCode(1, new String[] {"url", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splittag", false, false, funcTable, 69, null, null, 0, 1);
            c$70_splitattr = Py.newCode(1, new String[] {"url", "words"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitattr", false, false, funcTable, 70, null, null, 0, 1);
            c$71_splitvalue = Py.newCode(1, new String[] {"attr", "match", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitvalue", false, false, funcTable, 71, null, null, 0, 1);
            c$72_splitgophertype = Py.newCode(1, new String[] {"selector"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "splitgophertype", false, false, funcTable, 72, null, null, 0, 1);
            c$73_unquote = Py.newCode(1, new String[] {"s", "myappend", "mychr", "list", "res", "myatoi", "item"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "unquote", false, false, funcTable, 73, null, null, 0, 1);
            c$74_unquote_plus = Py.newCode(1, new String[] {"s"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "unquote_plus", false, false, funcTable, 74, null, null, 0, 1);
            c$75__fast_quote = Py.newCode(1, new String[] {"s", "i", "res", "c"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "_fast_quote", false, false, funcTable, 75, null, null, 0, 1);
            c$76_quote = Py.newCode(2, new String[] {"s", "safe", "i", "res", "c"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "quote", false, false, funcTable, 76, null, null, 0, 1);
            c$77_quote_plus = Py.newCode(2, new String[] {"s", "safe", "l", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "quote_plus", false, false, funcTable, 77, null, null, 0, 1);
            c$78_urlencode = Py.newCode(2, new String[] {"query", "doseq", "va", "elt", "tb", "x", "v", "l", "k", "ty"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "urlencode", false, false, funcTable, 78, null, null, 0, 1);
            c$79_getproxies_environment = Py.newCode(0, new String[] {"proxies", "name", "value"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "getproxies_environment", false, false, funcTable, 79, null, null, 0, 1);
            c$80_getproxies = Py.newCode(0, new String[] {"proxies", "ic", "config", "value"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "getproxies", false, false, funcTable, 80, null, null, 0, 1);
            c$81_getproxies_registry = Py.newCode(0, new String[] {"p", "proxyEnable", "_winreg", "proxies", "internetSettings", "address", "protocol", "proxyServer"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "getproxies_registry", false, false, funcTable, 81, null, null, 0, 1);
            c$82_getproxies = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "getproxies", false, false, funcTable, 82, null, null, 0, 1);
            c$83_test1 = Py.newCode(0, new String[] {"uqs", "time", "i", "t1", "t0", "qs", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "test1", false, false, funcTable, 83, null, null, 0, 1);
            c$84_reporthook = Py.newCode(3, new String[] {"blocknum", "blocksize", "totalsize"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "reporthook", false, false, funcTable, 84, null, null, 0, 1);
            c$85_test = Py.newCode(1, new String[] {"args", "url", "k", "data", "h", "fp", "fn", "table"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "test", false, false, funcTable, 85, null, null, 0, 1);
            c$86_main = Py.newCode(0, new String[] {"opts", "url", "o", "msg", "args", "getopt", "a", "sys", "t"}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "main", false, false, funcTable, 86, null, null, 0, 1);
            c$87_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\urllib.py", "main", false, false, funcTable, 87, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$87_main == null) _PyInner.initConstants();
            return c$87_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.url2pathname$1(frame);
                case 1:
                return _PyInner.pathname2url$2(frame);
                case 2:
                return _PyInner.urlopen$3(frame);
                case 3:
                return _PyInner.urlretrieve$4(frame);
                case 4:
                return _PyInner.urlcleanup$5(frame);
                case 5:
                return _PyInner.__init__$6(frame);
                case 6:
                return _PyInner.__del__$7(frame);
                case 7:
                return _PyInner.close$8(frame);
                case 8:
                return _PyInner.cleanup$9(frame);
                case 9:
                return _PyInner.addheader$10(frame);
                case 10:
                return _PyInner.open$11(frame);
                case 11:
                return _PyInner.open_unknown$12(frame);
                case 12:
                return _PyInner.open_unknown_proxy$13(frame);
                case 13:
                return _PyInner.retrieve$14(frame);
                case 14:
                return _PyInner.open_http$15(frame);
                case 15:
                return _PyInner.http_error$16(frame);
                case 16:
                return _PyInner.http_error_default$17(frame);
                case 17:
                return _PyInner.open_https$18(frame);
                case 18:
                return _PyInner.open_gopher$19(frame);
                case 19:
                return _PyInner.open_file$20(frame);
                case 20:
                return _PyInner.open_local_file$21(frame);
                case 21:
                return _PyInner.open_ftp$22(frame);
                case 22:
                return _PyInner.open_data$23(frame);
                case 23:
                return _PyInner.URLopener$24(frame);
                case 24:
                return _PyInner.__init__$25(frame);
                case 25:
                return _PyInner.http_error_default$26(frame);
                case 26:
                return _PyInner.http_error_302$27(frame);
                case 27:
                return _PyInner.redirect_internal$28(frame);
                case 28:
                return _PyInner.http_error_301$29(frame);
                case 29:
                return _PyInner.http_error_401$30(frame);
                case 30:
                return _PyInner.retry_http_basic_auth$31(frame);
                case 31:
                return _PyInner.retry_https_basic_auth$32(frame);
                case 32:
                return _PyInner.get_user_passwd$33(frame);
                case 33:
                return _PyInner.prompt_user_passwd$34(frame);
                case 34:
                return _PyInner.FancyURLopener$35(frame);
                case 35:
                return _PyInner.localhost$36(frame);
                case 36:
                return _PyInner.thishost$37(frame);
                case 37:
                return _PyInner.ftperrors$38(frame);
                case 38:
                return _PyInner.noheaders$39(frame);
                case 39:
                return _PyInner.__init__$40(frame);
                case 40:
                return _PyInner.init$41(frame);
                case 41:
                return _PyInner.retrfile$42(frame);
                case 42:
                return _PyInner.endtransfer$43(frame);
                case 43:
                return _PyInner.close$44(frame);
                case 44:
                return _PyInner.ftpwrapper$45(frame);
                case 45:
                return _PyInner.__init__$46(frame);
                case 46:
                return _PyInner.__repr__$47(frame);
                case 47:
                return _PyInner.close$48(frame);
                case 48:
                return _PyInner.addbase$49(frame);
                case 49:
                return _PyInner.__init__$50(frame);
                case 50:
                return _PyInner.close$51(frame);
                case 51:
                return _PyInner.addclosehook$52(frame);
                case 52:
                return _PyInner.__init__$53(frame);
                case 53:
                return _PyInner.info$54(frame);
                case 54:
                return _PyInner.addinfo$55(frame);
                case 55:
                return _PyInner.__init__$56(frame);
                case 56:
                return _PyInner.info$57(frame);
                case 57:
                return _PyInner.geturl$58(frame);
                case 58:
                return _PyInner.addinfourl$59(frame);
                case 59:
                return _PyInner.basejoin$60(frame);
                case 60:
                return _PyInner.toBytes$61(frame);
                case 61:
                return _PyInner.unwrap$62(frame);
                case 62:
                return _PyInner.splittype$63(frame);
                case 63:
                return _PyInner.splithost$64(frame);
                case 64:
                return _PyInner.splituser$65(frame);
                case 65:
                return _PyInner.splitpasswd$66(frame);
                case 66:
                return _PyInner.splitport$67(frame);
                case 67:
                return _PyInner.splitnport$68(frame);
                case 68:
                return _PyInner.splitquery$69(frame);
                case 69:
                return _PyInner.splittag$70(frame);
                case 70:
                return _PyInner.splitattr$71(frame);
                case 71:
                return _PyInner.splitvalue$72(frame);
                case 72:
                return _PyInner.splitgophertype$73(frame);
                case 73:
                return _PyInner.unquote$74(frame);
                case 74:
                return _PyInner.unquote_plus$75(frame);
                case 75:
                return _PyInner._fast_quote$76(frame);
                case 76:
                return _PyInner.quote$77(frame);
                case 77:
                return _PyInner.quote_plus$78(frame);
                case 78:
                return _PyInner.urlencode$79(frame);
                case 79:
                return _PyInner.getproxies_environment$80(frame);
                case 80:
                return _PyInner.getproxies$81(frame);
                case 81:
                return _PyInner.getproxies_registry$82(frame);
                case 82:
                return _PyInner.getproxies$83(frame);
                case 83:
                return _PyInner.test1$84(frame);
                case 84:
                return _PyInner.reporthook$85(frame);
                case 85:
                return _PyInner.test$86(frame);
                case 86:
                return _PyInner.main$87(frame);
                case 87:
                return _PyInner.main$88(frame);
                default:
                return null;
            }
        }
        
        private static PyObject url2pathname$1(PyFrame frame) {
            return frame.getglobal("unquote").__call__(frame.getlocal(0));
        }
        
        private static PyObject pathname2url$2(PyFrame frame) {
            return frame.getglobal("quote").__call__(frame.getlocal(0));
        }
        
        private static PyObject urlopen$3(PyFrame frame) {
            /* urlopen(url [, data]) -> open file-like object */
            // global _urlopener
            if (frame.getglobal("_urlopener").__not__().__nonzero__()) {
                frame.setglobal("_urlopener", frame.getglobal("FancyURLopener").__call__());
            }
            if (frame.getlocal(1)._is(frame.getglobal("None")).__nonzero__()) {
                return frame.getglobal("_urlopener").invoke("open", frame.getlocal(0));
            }
            else {
                return frame.getglobal("_urlopener").invoke("open", frame.getlocal(0), frame.getlocal(1));
            }
        }
        
        private static PyObject urlretrieve$4(PyFrame frame) {
            // global _urlopener
            if (frame.getglobal("_urlopener").__not__().__nonzero__()) {
                frame.setglobal("_urlopener", frame.getglobal("FancyURLopener").__call__());
            }
            return frame.getglobal("_urlopener").invoke("retrieve", new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2), frame.getlocal(3)});
        }
        
        private static PyObject urlcleanup$5(PyFrame frame) {
            if (frame.getglobal("_urlopener").__nonzero__()) {
                frame.getglobal("_urlopener").invoke("cleanup");
            }
            return Py.None;
        }
        
        private static PyObject __init__$6(PyFrame frame) {
            if (frame.getlocal(1)._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(1, frame.getglobal("getproxies").__call__());
            }
            if (frame.getglobal("__debug__").__nonzero__()) Py.assert(frame.getglobal("hasattr").__call__(frame.getlocal(1), s$38), s$39);
            frame.getlocal(0).__setattr__("proxies", frame.getlocal(1));
            frame.getlocal(0).__setattr__("key_file", frame.getlocal(2).invoke("get", s$40));
            frame.getlocal(0).__setattr__("cert_file", frame.getlocal(2).invoke("get", s$41));
            frame.getlocal(0).__setattr__("addheaders", new PyList(new PyObject[] {new PyTuple(new PyObject[] {s$42, frame.getlocal(0).__getattr__("version")})}));
            frame.getlocal(0).__setattr__("_URLopener__tempfiles", new PyList(new PyObject[] {}));
            frame.getlocal(0).__setattr__("_URLopener__unlink", frame.getglobal("os").__getattr__("unlink"));
            frame.getlocal(0).__setattr__("tempcache", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("ftpcache", frame.getglobal("ftpcache"));
            return Py.None;
        }
        
        private static PyObject __del__$7(PyFrame frame) {
            frame.getlocal(0).invoke("close");
            return Py.None;
        }
        
        private static PyObject close$8(PyFrame frame) {
            frame.getlocal(0).invoke("cleanup");
            return Py.None;
        }
        
        private static PyObject cleanup$9(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            if (frame.getlocal(0).__getattr__("_URLopener__tempfiles").__nonzero__()) {
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(0).__getattr__("_URLopener__tempfiles");
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(1, t$0$PyObject);
                    try {
                        frame.getlocal(0).invoke("_URLopener__unlink", frame.getlocal(1));
                    }
                    catch (Throwable x$0) {
                        t$0$PyException = Py.setException(x$0, frame);
                        // pass
                    }
                }
                frame.getlocal(0).__getattr__("_URLopener__tempfiles").__delslice__(null, null, null);
            }
            if (frame.getlocal(0).__getattr__("tempcache").__nonzero__()) {
                frame.getlocal(0).__getattr__("tempcache").invoke("clear");
            }
            return Py.None;
        }
        
        private static PyObject addheader$10(PyFrame frame) {
            /* Add a header to be used by the HTTP interface only
                    e.g. u.addheader('Accept', 'sound/basic') */
            frame.getlocal(0).__getattr__("addheaders").invoke("append", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject open$11(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Use URLopener().open(file) instead of open(file, 'r'). */
            frame.setlocal(1, frame.getglobal("unwrap").__call__(frame.getglobal("toBytes").__call__(frame.getlocal(1))));
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("tempcache")).__nonzero__() ? frame.getlocal(0).__getattr__("tempcache").invoke("has_key", frame.getlocal(1)) : t$0$PyObject).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("tempcache").__getitem__(frame.getlocal(1)), 2);
                frame.setlocal(10, t$0$PyObject__[0]);
                frame.setlocal(3, t$0$PyObject__[1]);
                frame.setlocal(7, frame.getglobal("open").__call__(frame.getlocal(10), s$45));
                return frame.getglobal("addinfourl").__call__(frame.getlocal(7), frame.getlocal(3), frame.getlocal(1));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(1)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            if (frame.getlocal(6).__not__().__nonzero__()) {
                frame.setlocal(6, s$46);
            }
            if (frame.getlocal(0).__getattr__("proxies").invoke("has_key", frame.getlocal(6)).__nonzero__()) {
                frame.setlocal(12, frame.getlocal(0).__getattr__("proxies").__getitem__(frame.getlocal(6)));
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(12)), 2);
                frame.setlocal(6, t$0$PyObject__[0]);
                frame.setlocal(9, t$0$PyObject__[1]);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(9)), 2);
                frame.setlocal(8, t$0$PyObject__[0]);
                frame.setlocal(11, t$0$PyObject__[1]);
                frame.setlocal(4, new PyTuple(new PyObject[] {frame.getlocal(8), frame.getlocal(1)}));
            }
            else {
                frame.setlocal(12, frame.getglobal("None"));
            }
            frame.setlocal(13, s$47._add(frame.getlocal(6)));
            frame.getlocal(0).__setattr__("type", frame.getlocal(6));
            if (s$48._in(frame.getlocal(13)).__nonzero__()) {
                frame.setlocal(13, s$49.invoke("join", frame.getlocal(13).invoke("split", s$48)));
            }
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0), frame.getlocal(13)).__not__().__nonzero__()) {
                if (frame.getlocal(12).__nonzero__()) {
                    return frame.getlocal(0).invoke("open_unknown_proxy", new PyObject[] {frame.getlocal(12), frame.getlocal(1), frame.getlocal(2)});
                }
                else {
                    return frame.getlocal(0).invoke("open_unknown", frame.getlocal(1), frame.getlocal(2));
                }
            }
            try {
                if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                    return frame.getglobal("getattr").__call__(frame.getlocal(0), frame.getlocal(13)).__call__(frame.getlocal(4));
                }
                else {
                    return frame.getglobal("getattr").__call__(frame.getlocal(0), frame.getlocal(13)).__call__(frame.getlocal(4), frame.getlocal(2));
                }
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("socket").__getattr__("error"))) {
                    frame.setlocal(5, t$0$PyException.value);
                    throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$50, frame.getlocal(5)}), frame.getglobal("sys").__getattr__("exc_info").__call__().__getitem__(i$51));
                }
                else throw t$0$PyException;
            }
        }
        
        private static PyObject open_unknown$12(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Overridable interface to open unknown URL type. */
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(1)), 2);
            frame.setlocal(4, t$0$PyObject__[0]);
            frame.setlocal(3, t$0$PyObject__[1]);
            throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$53, s$54, frame.getlocal(4)}));
        }
        
        private static PyObject open_unknown_proxy$13(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Overridable interface to open unknown URL type. */
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(2)), 2);
            frame.setlocal(5, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$53, s$55._mod(frame.getlocal(5)), frame.getlocal(1)}));
        }
        
        private static PyObject retrieve$14(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* retrieve(url) returns (filename, None) for a local object
                    or (tempfilename, headers) for a remote object. */
            frame.setlocal(1, frame.getglobal("unwrap").__call__(frame.getglobal("toBytes").__call__(frame.getlocal(1))));
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("tempcache")).__nonzero__() ? frame.getlocal(0).__getattr__("tempcache").invoke("has_key", frame.getlocal(1)) : t$0$PyObject).__nonzero__()) {
                return frame.getlocal(0).__getattr__("tempcache").__getitem__(frame.getlocal(1));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(1)), 2);
            frame.setlocal(8, t$0$PyObject__[0]);
            frame.setlocal(9, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(2).__not__()).__nonzero__() ? ((t$1$PyObject = frame.getlocal(8).__not__()).__nonzero__() ? t$1$PyObject : frame.getlocal(8)._eq(s$46)) : t$0$PyObject).__nonzero__()) {
                try {
                    frame.setlocal(11, frame.getlocal(0).invoke("open_local_file", frame.getlocal(9)));
                    frame.setlocal(7, frame.getlocal(11).invoke("info"));
                    frame.dellocal(11);
                    return new PyTuple(new PyObject[] {frame.getglobal("url2pathname").__call__(frame.getglobal("splithost").__call__(frame.getlocal(9)).__getitem__(i$57)), frame.getlocal(7)});
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                        frame.setlocal(10, t$0$PyException.value);
                        // pass
                    }
                    else throw t$0$PyException;
                }
            }
            frame.setlocal(11, frame.getlocal(0).invoke("open", frame.getlocal(1), frame.getlocal(4)));
            frame.setlocal(5, frame.getlocal(11).invoke("info"));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(18, org.python.core.imp.importOne("tempfile", frame));
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(1)), 2);
                frame.setlocal(17, t$0$PyObject__[0]);
                frame.setlocal(16, t$0$PyObject__[1]);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__((t$0$PyObject = frame.getlocal(16)).__nonzero__() ? t$0$PyObject : s$58), 2);
                frame.setlocal(17, t$0$PyObject__[0]);
                frame.setlocal(16, t$0$PyObject__[1]);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitquery").__call__((t$0$PyObject = frame.getlocal(16)).__nonzero__() ? t$0$PyObject : s$58), 2);
                frame.setlocal(16, t$0$PyObject__[0]);
                frame.setlocal(17, t$0$PyObject__[1]);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitattr").__call__((t$0$PyObject = frame.getlocal(16)).__nonzero__() ? t$0$PyObject : s$58), 2);
                frame.setlocal(16, t$0$PyObject__[0]);
                frame.setlocal(17, t$0$PyObject__[1]);
                frame.setlocal(6, frame.getglobal("os").__getattr__("path").__getattr__("splitext").__call__(frame.getlocal(16)).__getitem__(i$57));
                frame.setlocal(2, frame.getlocal(18).__getattr__("mktemp").__call__(frame.getlocal(6)));
                frame.getlocal(0).__getattr__("_URLopener__tempfiles").invoke("append", frame.getlocal(2));
            }
            frame.setlocal(13, new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(5)}));
            if (frame.getlocal(0).__getattr__("tempcache")._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(0).__getattr__("tempcache").__setitem__(frame.getlocal(1), frame.getlocal(13));
            }
            frame.setlocal(14, frame.getglobal("open").__call__(frame.getlocal(2), s$59));
            frame.setlocal(19, i$60._mul(i$61));
            frame.setlocal(15, i$57.__neg__());
            frame.setlocal(20, i$57);
            if (frame.getlocal(3).__nonzero__()) {
                if (frame.getlocal(5).invoke("has_key", s$62).__nonzero__()) {
                    frame.setlocal(15, frame.getglobal("int").__call__(frame.getlocal(5).__getitem__(s$63)));
                }
                frame.getlocal(3).__call__(i$64, frame.getlocal(19), frame.getlocal(15));
            }
            frame.setlocal(12, frame.getlocal(11).invoke("read", frame.getlocal(19)));
            if (frame.getlocal(3).__nonzero__()) {
                frame.getlocal(3).__call__(i$57, frame.getlocal(19), frame.getlocal(15));
            }
            while (frame.getlocal(12).__nonzero__()) {
                frame.getlocal(14).invoke("write", frame.getlocal(12));
                frame.setlocal(12, frame.getlocal(11).invoke("read", frame.getlocal(19)));
                frame.setlocal(20, frame.getlocal(20)._add(i$57));
                if (frame.getlocal(3).__nonzero__()) {
                    frame.getlocal(3).__call__(frame.getlocal(20), frame.getlocal(19), frame.getlocal(15));
                }
            }
            frame.getlocal(11).invoke("close");
            frame.getlocal(14).invoke("close");
            frame.dellocal(11);
            frame.dellocal(14);
            return frame.getlocal(13);
        }
        
        private static PyObject open_http$15(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Use HTTP protocol. */
            frame.setlocal(13, org.python.core.imp.importOne("httplib", frame));
            frame.setlocal(11, frame.getglobal("None"));
            if (frame.getglobal("type").__call__(frame.getlocal(1))._is(frame.getglobal("types").__getattr__("StringType")).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
                frame.setlocal(12, t$0$PyObject__[0]);
                frame.setlocal(14, t$0$PyObject__[1]);
                if (frame.getlocal(12).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splituser").__call__(frame.getlocal(12)), 2);
                    frame.setlocal(11, t$0$PyObject__[0]);
                    frame.setlocal(12, t$0$PyObject__[1]);
                    frame.setlocal(12, frame.getglobal("unquote").__call__(frame.getlocal(12)));
                }
                frame.setlocal(9, frame.getlocal(12));
            }
            else {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1), 2);
                frame.setlocal(12, t$0$PyObject__[0]);
                frame.setlocal(14, t$0$PyObject__[1]);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(14)), 2);
                frame.setlocal(6, t$0$PyObject__[0]);
                frame.setlocal(10, t$0$PyObject__[1]);
                frame.setlocal(1, frame.getlocal(10));
                frame.setlocal(11, frame.getglobal("None"));
                if (frame.getlocal(6).invoke("lower")._ne(s$66).__nonzero__()) {
                    frame.setlocal(9, frame.getglobal("None"));
                }
                else {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(10)), 2);
                    frame.setlocal(9, t$0$PyObject__[0]);
                    frame.setlocal(10, t$0$PyObject__[1]);
                    if (frame.getlocal(9).__nonzero__()) {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splituser").__call__(frame.getlocal(9)), 2);
                        frame.setlocal(11, t$0$PyObject__[0]);
                        frame.setlocal(9, t$0$PyObject__[1]);
                    }
                    if (frame.getlocal(11).__nonzero__()) {
                        frame.setlocal(14, s$67._mod(new PyTuple(new PyObject[] {frame.getlocal(6), frame.getlocal(9), frame.getlocal(10)})));
                    }
                }
            }
            if (frame.getlocal(12).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$68, s$69}));
            }
            if (frame.getlocal(11).__nonzero__()) {
                frame.setlocal(3, org.python.core.imp.importOne("base64", frame));
                frame.setlocal(8, frame.getlocal(3).__getattr__("encodestring").__call__(frame.getlocal(11)).invoke("strip"));
            }
            else {
                frame.setlocal(8, frame.getglobal("None"));
            }
            frame.setlocal(15, frame.getlocal(13).__getattr__("HTTP").__call__(frame.getlocal(12)));
            if (frame.getlocal(2)._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(15).invoke("putrequest", s$70, frame.getlocal(14));
                frame.getlocal(15).invoke("putheader", s$71, s$72);
                frame.getlocal(15).invoke("putheader", s$73, s$74._mod(frame.getglobal("len").__call__(frame.getlocal(2))));
            }
            else {
                frame.getlocal(15).invoke("putrequest", s$75, frame.getlocal(14));
            }
            if (frame.getlocal(8).__nonzero__()) {
                frame.getlocal(15).invoke("putheader", s$76, s$77._mod(frame.getlocal(8)));
            }
            if (frame.getlocal(9).__nonzero__()) {
                frame.getlocal(15).invoke("putheader", s$78, frame.getlocal(9));
            }
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("addheaders");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(5, t$0$PyObject);
                frame.getglobal("apply").__call__(frame.getlocal(15).__getattr__("putheader"), frame.getlocal(5));
            }
            frame.getlocal(15).invoke("endheaders");
            if (frame.getlocal(2)._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(15).invoke("send", frame.getlocal(2));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(15).invoke("getreply"), 3);
            frame.setlocal(16, t$0$PyObject__[0]);
            frame.setlocal(17, t$0$PyObject__[1]);
            frame.setlocal(4, t$0$PyObject__[2]);
            frame.setlocal(7, frame.getlocal(15).invoke("getfile"));
            if (frame.getlocal(16)._eq(i$79).__nonzero__()) {
                return frame.getglobal("addinfourl").__call__(frame.getlocal(7), frame.getlocal(4), s$80._add(frame.getlocal(1)));
            }
            else {
                if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                    return frame.getlocal(0).invoke("http_error", new PyObject[] {frame.getlocal(1), frame.getlocal(7), frame.getlocal(16), frame.getlocal(17), frame.getlocal(4)});
                }
                else {
                    return frame.getlocal(0).invoke("http_error", new PyObject[] {frame.getlocal(1), frame.getlocal(7), frame.getlocal(16), frame.getlocal(17), frame.getlocal(4), frame.getlocal(2)});
                }
            }
        }
        
        private static PyObject http_error$16(PyFrame frame) {
            /* Handle http errors.
                    Derived class can override this, or provide specific handlers
                    named http_error_DDD where DDD is the 3-digit error code. */
            frame.setlocal(8, s$82._mod(frame.getlocal(3)));
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0), frame.getlocal(8)).__nonzero__()) {
                frame.setlocal(7, frame.getglobal("getattr").__call__(frame.getlocal(0), frame.getlocal(8)));
                if (frame.getlocal(6)._is(frame.getglobal("None")).__nonzero__()) {
                    frame.setlocal(9, frame.getlocal(7).__call__(new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5)}));
                }
                else {
                    frame.setlocal(9, frame.getlocal(7).__call__(new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5), frame.getlocal(6)}));
                }
                if (frame.getlocal(9).__nonzero__()) {
                    return frame.getlocal(9);
                }
            }
            return frame.getlocal(0).invoke("http_error_default", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5)});
        }
        
        private static PyObject http_error_default$17(PyFrame frame) {
            /* Default error handler: close the connection and raise IOError. */
            frame.setlocal(6, frame.getlocal(2).invoke("read"));
            frame.getlocal(2).invoke("close");
            throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$68, frame.getlocal(3), frame.getlocal(4), frame.getlocal(5)}));
        }
        
        private static PyObject open_https$18(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Use HTTPS protocol. */
            frame.setlocal(13, org.python.core.imp.importOne("httplib", frame));
            frame.setlocal(11, frame.getglobal("None"));
            if (frame.getglobal("type").__call__(frame.getlocal(1))._is(frame.getglobal("types").__getattr__("StringType")).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
                frame.setlocal(12, t$0$PyObject__[0]);
                frame.setlocal(14, t$0$PyObject__[1]);
                if (frame.getlocal(12).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splituser").__call__(frame.getlocal(12)), 2);
                    frame.setlocal(11, t$0$PyObject__[0]);
                    frame.setlocal(12, t$0$PyObject__[1]);
                    frame.setlocal(12, frame.getglobal("unquote").__call__(frame.getlocal(12)));
                }
                frame.setlocal(9, frame.getlocal(12));
            }
            else {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1), 2);
                frame.setlocal(12, t$0$PyObject__[0]);
                frame.setlocal(14, t$0$PyObject__[1]);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(14)), 2);
                frame.setlocal(6, t$0$PyObject__[0]);
                frame.setlocal(10, t$0$PyObject__[1]);
                frame.setlocal(1, frame.getlocal(10));
                frame.setlocal(11, frame.getglobal("None"));
                if (frame.getlocal(6).invoke("lower")._ne(s$86).__nonzero__()) {
                    frame.setlocal(9, frame.getglobal("None"));
                }
                else {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(10)), 2);
                    frame.setlocal(9, t$0$PyObject__[0]);
                    frame.setlocal(10, t$0$PyObject__[1]);
                    if (frame.getlocal(9).__nonzero__()) {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splituser").__call__(frame.getlocal(9)), 2);
                        frame.setlocal(11, t$0$PyObject__[0]);
                        frame.setlocal(9, t$0$PyObject__[1]);
                    }
                    if (frame.getlocal(11).__nonzero__()) {
                        frame.setlocal(14, s$67._mod(new PyTuple(new PyObject[] {frame.getlocal(6), frame.getlocal(9), frame.getlocal(10)})));
                    }
                }
            }
            if (frame.getlocal(12).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$87, s$69}));
            }
            if (frame.getlocal(11).__nonzero__()) {
                frame.setlocal(3, org.python.core.imp.importOne("base64", frame));
                frame.setlocal(8, frame.getlocal(3).__getattr__("encodestring").__call__(frame.getlocal(11)).invoke("strip"));
            }
            else {
                frame.setlocal(8, frame.getglobal("None"));
            }
            frame.setlocal(15, frame.getlocal(13).__getattr__("HTTPS").__call__(new PyObject[] {frame.getlocal(12), i$64, frame.getlocal(0).__getattr__("key_file"), frame.getlocal(0).__getattr__("cert_file")}, new String[] {"key_file", "cert_file"}));
            if (frame.getlocal(2)._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(15).invoke("putrequest", s$70, frame.getlocal(14));
                frame.getlocal(15).invoke("putheader", s$71, s$72);
                frame.getlocal(15).invoke("putheader", s$73, s$74._mod(frame.getglobal("len").__call__(frame.getlocal(2))));
            }
            else {
                frame.getlocal(15).invoke("putrequest", s$75, frame.getlocal(14));
            }
            if (frame.getlocal(8).__nonzero__()) {
                frame.getlocal(15).invoke("putheader", s$88._mod(frame.getlocal(8)));
            }
            if (frame.getlocal(9).__nonzero__()) {
                frame.getlocal(15).invoke("putheader", s$78, frame.getlocal(9));
            }
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("addheaders");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(5, t$0$PyObject);
                frame.getglobal("apply").__call__(frame.getlocal(15).__getattr__("putheader"), frame.getlocal(5));
            }
            frame.getlocal(15).invoke("endheaders");
            if (frame.getlocal(2)._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(15).invoke("send", frame.getlocal(2));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(15).invoke("getreply"), 3);
            frame.setlocal(16, t$0$PyObject__[0]);
            frame.setlocal(17, t$0$PyObject__[1]);
            frame.setlocal(4, t$0$PyObject__[2]);
            frame.setlocal(7, frame.getlocal(15).invoke("getfile"));
            if (frame.getlocal(16)._eq(i$79).__nonzero__()) {
                return frame.getglobal("addinfourl").__call__(frame.getlocal(7), frame.getlocal(4), frame.getlocal(1));
            }
            else {
                if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                    return frame.getlocal(0).invoke("http_error", new PyObject[] {frame.getlocal(1), frame.getlocal(7), frame.getlocal(16), frame.getlocal(17), frame.getlocal(4)});
                }
                else {
                    return frame.getlocal(0).invoke("http_error", new PyObject[] {frame.getlocal(1), frame.getlocal(7), frame.getlocal(16), frame.getlocal(17), frame.getlocal(4), frame.getlocal(2)});
                }
            }
        }
        
        private static PyObject open_gopher$19(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Use Gopher protocol. */
            frame.setlocal(3, org.python.core.imp.importOne("gopherlib", frame));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(2, t$0$PyObject__[1]);
            if (frame.getlocal(7).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$90, s$69}));
            }
            frame.setlocal(7, frame.getglobal("unquote").__call__(frame.getlocal(7)));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitgophertype").__call__(frame.getlocal(2)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(2, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitquery").__call__(frame.getlocal(2)), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            frame.setlocal(2, frame.getglobal("unquote").__call__(frame.getlocal(2)));
            if (frame.getlocal(5).__nonzero__()) {
                frame.setlocal(5, frame.getglobal("unquote").__call__(frame.getlocal(5)));
                frame.setlocal(4, frame.getlocal(3).__getattr__("send_query").__call__(frame.getlocal(2), frame.getlocal(5), frame.getlocal(7)));
            }
            else {
                frame.setlocal(4, frame.getlocal(3).__getattr__("send_selector").__call__(frame.getlocal(2), frame.getlocal(7)));
            }
            return frame.getglobal("addinfourl").__call__(frame.getlocal(4), frame.getglobal("noheaders").__call__(), s$91._add(frame.getlocal(1)));
        }
        
        private static PyObject open_file$20(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Use local file or FTP depending on form of URL. */
            if (((t$0$PyObject = frame.getlocal(1).__getslice__(null, i$51, null)._eq(s$93)).__nonzero__() ? frame.getlocal(1).__getslice__(i$51, i$94, null)._ne(s$95) : t$0$PyObject).__nonzero__()) {
                return frame.getlocal(0).invoke("open_ftp", frame.getlocal(1));
            }
            else {
                return frame.getlocal(0).invoke("open_local_file", frame.getlocal(1));
            }
        }
        
        private static PyObject open_local_file$21(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            /* Use local file. */
            frame.setlocal(8, org.python.core.imp.importOne("mimetypes", frame));
            frame.setlocal(2, org.python.core.imp.importOne("mimetools", frame));
            frame.setlocal(4, org.python.core.imp.importOne("StringIO", frame));
            frame.setlocal(6, frame.getlocal(8).__getattr__("guess_type").__call__(frame.getlocal(1)).__getitem__(i$64));
            frame.setlocal(3, frame.getlocal(2).__getattr__("Message").__call__(frame.getlocal(4).__getattr__("StringIO").__call__(s$97._mod((t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject : s$98))));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(9, t$0$PyObject__[1]);
            if (frame.getlocal(7).__not__().__nonzero__()) {
                frame.setlocal(10, frame.getlocal(9));
                if (frame.getlocal(9).__getslice__(null, i$57, null)._eq(s$95).__nonzero__()) {
                    frame.setlocal(10, s$99._add(frame.getlocal(9)));
                }
                return frame.getglobal("addinfourl").__call__(frame.getglobal("open").__call__(frame.getglobal("url2pathname").__call__(frame.getlocal(9)), s$45), frame.getlocal(3), frame.getlocal(10));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitport").__call__(frame.getlocal(7)), 2);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(5).__not__()).__nonzero__() ? frame.getglobal("socket").__getattr__("gethostbyname").__call__(frame.getlocal(7))._in(new PyTuple(new PyObject[] {frame.getglobal("localhost").__call__(), frame.getglobal("thishost").__call__()})) : t$0$PyObject).__nonzero__()) {
                frame.setlocal(10, frame.getlocal(9));
                if (frame.getlocal(9).__getslice__(null, i$57, null)._eq(s$95).__nonzero__()) {
                    frame.setlocal(10, s$99._add(frame.getlocal(9)));
                }
                return frame.getglobal("addinfourl").__call__(frame.getglobal("open").__call__(frame.getglobal("url2pathname").__call__(frame.getlocal(9)), s$45), frame.getlocal(3), frame.getlocal(10));
            }
            throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$100, s$101}));
        }
        
        private static PyObject open_ftp$22(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject;
            
            // Code
            /* Use FTP protocol. */
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
            frame.setlocal(3, t$0$PyObject__[0]);
            frame.setlocal(19, t$0$PyObject__[1]);
            if (frame.getlocal(3).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$103, s$69}));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitport").__call__(frame.getlocal(3)), 2);
            frame.setlocal(3, t$0$PyObject__[0]);
            frame.setlocal(14, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splituser").__call__(frame.getlocal(3)), 2);
            frame.setlocal(12, t$0$PyObject__[0]);
            frame.setlocal(3, t$0$PyObject__[1]);
            if (frame.getlocal(12).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitpasswd").__call__(frame.getlocal(12)), 2);
                frame.setlocal(12, t$0$PyObject__[0]);
                frame.setlocal(5, t$0$PyObject__[1]);
            }
            else {
                frame.setlocal(5, frame.getglobal("None"));
            }
            frame.setlocal(3, frame.getglobal("unquote").__call__(frame.getlocal(3)));
            frame.setlocal(12, frame.getglobal("unquote").__call__((t$0$PyObject = frame.getlocal(12)).__nonzero__() ? t$0$PyObject : s$58));
            frame.setlocal(5, frame.getglobal("unquote").__call__((t$0$PyObject = frame.getlocal(5)).__nonzero__() ? t$0$PyObject : s$58));
            frame.setlocal(3, frame.getglobal("socket").__getattr__("gethostbyname").__call__(frame.getlocal(3)));
            if (frame.getlocal(14).__not__().__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("ftplib", frame));
                frame.setlocal(14, frame.getlocal(2).__getattr__("FTP_PORT"));
            }
            else {
                frame.setlocal(14, frame.getglobal("int").__call__(frame.getlocal(14)));
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitattr").__call__(frame.getlocal(19)), 2);
            frame.setlocal(19, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            frame.setlocal(19, frame.getglobal("unquote").__call__(frame.getlocal(19)));
            frame.setlocal(10, frame.getlocal(19).invoke("split", s$95));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(10).__getslice__(null, i$57.__neg__(), null), frame.getlocal(10).__getitem__(i$57.__neg__())}), 2);
            frame.setlocal(10, t$0$PyObject__[0]);
            frame.setlocal(8, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(10)).__nonzero__() ? frame.getlocal(10).__getitem__(i$64).__not__() : t$0$PyObject).__nonzero__()) {
                frame.setlocal(10, frame.getlocal(10).__getslice__(i$57, null, null));
            }
            if (((t$0$PyObject = frame.getlocal(10)).__nonzero__() ? frame.getlocal(10).__getitem__(i$64).__not__() : t$0$PyObject).__nonzero__()) {
                frame.getlocal(10).__setitem__(i$64, s$95);
            }
            frame.setlocal(7, new PyTuple(new PyObject[] {frame.getlocal(12), frame.getlocal(3), frame.getlocal(14), s$95.invoke("join", frame.getlocal(10))}));
            if (frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("ftpcache"))._gt(frame.getglobal("MAXFTPCACHE")).__nonzero__()) {
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(0).__getattr__("ftpcache").invoke("keys");
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(21, t$0$PyObject);
                    if (frame.getlocal(21)._ne(frame.getlocal(7)).__nonzero__()) {
                        frame.setlocal(15, frame.getlocal(0).__getattr__("ftpcache").__getitem__(frame.getlocal(21)));
                        frame.getlocal(0).__getattr__("ftpcache").__delitem__(frame.getlocal(21));
                        frame.getlocal(15).invoke("close");
                    }
                }
            }
            try {
                if (frame.getlocal(0).__getattr__("ftpcache").invoke("has_key", frame.getlocal(7)).__not__().__nonzero__()) {
                    frame.getlocal(0).__getattr__("ftpcache").__setitem__(frame.getlocal(7), frame.getglobal("ftpwrapper").__call__(new PyObject[] {frame.getlocal(12), frame.getlocal(5), frame.getlocal(3), frame.getlocal(14), frame.getlocal(10)}));
                }
                if (frame.getlocal(8).__not__().__nonzero__()) {
                    frame.setlocal(22, s$104);
                }
                else {
                    frame.setlocal(22, s$105);
                }
                t$1$int = 0;
                t$3$PyObject = frame.getlocal(4);
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    frame.setlocal(6, t$2$PyObject);
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitvalue").__call__(frame.getlocal(6)), 2);
                    frame.setlocal(6, t$0$PyObject__[0]);
                    frame.setlocal(17, t$0$PyObject__[1]);
                    if (((t$4$PyObject = frame.getlocal(6).invoke("lower")._eq(s$106)).__nonzero__() ? frame.getlocal(17)._in(new PyTuple(new PyObject[] {s$107, s$108, s$109, s$105, s$110, s$104})) : t$4$PyObject).__nonzero__()) {
                        frame.setlocal(22, frame.getlocal(17).invoke("upper"));
                    }
                }
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).__getattr__("ftpcache").__getitem__(frame.getlocal(7)).invoke("retrfile", frame.getlocal(8), frame.getlocal(22)), 2);
                frame.setlocal(11, t$0$PyObject__[0]);
                frame.setlocal(20, t$0$PyObject__[1]);
                if (((t$4$PyObject = frame.getlocal(20)._isnot(frame.getglobal("None"))).__nonzero__() ? frame.getlocal(20)._ge(i$64) : t$4$PyObject).__nonzero__()) {
                    frame.setlocal(13, org.python.core.imp.importOne("mimetools", frame));
                    frame.setlocal(9, org.python.core.imp.importOne("StringIO", frame));
                    frame.setlocal(18, frame.getlocal(13).__getattr__("Message").__call__(frame.getlocal(9).__getattr__("StringIO").__call__(s$111._mod(frame.getlocal(20)))));
                }
                else {
                    frame.setlocal(18, frame.getglobal("noheaders").__call__());
                }
                return frame.getglobal("addinfourl").__call__(frame.getlocal(11), frame.getlocal(18), s$112._add(frame.getlocal(1)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ftperrors").__call__())) {
                    frame.setlocal(16, t$0$PyException.value);
                    throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$103, frame.getlocal(16)}), frame.getglobal("sys").__getattr__("exc_info").__call__().__getitem__(i$51));
                }
                else throw t$0$PyException;
            }
        }
        
        private static PyObject open_data$23(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* Use "data" URL. */
            frame.setlocal(9, org.python.core.imp.importOne("StringIO", frame));
            frame.setlocal(3, org.python.core.imp.importOne("mimetools", frame));
            frame.setlocal(10, org.python.core.imp.importOne("time", frame));
            try {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1).invoke("split", s$114, i$57), 2);
                frame.setlocal(7, t$0$PyObject__[0]);
                frame.setlocal(2, t$0$PyObject__[1]);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$115, s$116}));
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(7).__not__().__nonzero__()) {
                frame.setlocal(7, s$117);
            }
            frame.setlocal(12, frame.getlocal(7).invoke("rfind", s$118));
            if (((t$0$PyObject = frame.getlocal(12)._ge(i$64)).__nonzero__() ? s$119._notin(frame.getlocal(7).__getslice__(frame.getlocal(12), null, null)) : t$0$PyObject).__nonzero__()) {
                frame.setlocal(6, frame.getlocal(7).__getslice__(frame.getlocal(12)._add(i$57), null, null));
                frame.setlocal(7, frame.getlocal(7).__getslice__(null, frame.getlocal(12), null));
            }
            else {
                frame.setlocal(6, s$58);
            }
            frame.setlocal(8, new PyList(new PyObject[] {}));
            frame.getlocal(8).invoke("append", s$120._mod(frame.getlocal(10).__getattr__("strftime").__call__(s$121, frame.getlocal(10).__getattr__("gmtime").__call__(frame.getlocal(10).__getattr__("time").__call__()))));
            frame.getlocal(8).invoke("append", s$122._mod(frame.getlocal(7)));
            if (frame.getlocal(6)._eq(s$123).__nonzero__()) {
                frame.setlocal(4, org.python.core.imp.importOne("base64", frame));
                frame.setlocal(2, frame.getlocal(4).__getattr__("decodestring").__call__(frame.getlocal(2)));
            }
            else {
                frame.setlocal(2, frame.getglobal("unquote").__call__(frame.getlocal(2)));
            }
            frame.getlocal(8).invoke("append", s$124._mod(frame.getglobal("len").__call__(frame.getlocal(2))));
            frame.getlocal(8).invoke("append", s$58);
            frame.getlocal(8).invoke("append", frame.getlocal(2));
            frame.setlocal(8, s$125.invoke("join", frame.getlocal(8)));
            frame.setlocal(11, frame.getlocal(9).__getattr__("StringIO").__call__(frame.getlocal(8)));
            frame.setlocal(5, frame.getlocal(3).__getattr__("Message").__call__(frame.getlocal(11), i$64));
            frame.getlocal(11).__setattr__("fileno", frame.getglobal("None"));
            return frame.getglobal("addinfourl").__call__(frame.getlocal(11), frame.getlocal(5), frame.getlocal(1));
        }
        
        private static PyObject URLopener$24(PyFrame frame) {
            /* Class to open URLs.
                This is a class rather than just a subroutine because we may need
                more than one set of global protocol-specific options.
                Note -- this is a base class for those who don't want the
                automatic handling of errors type 302 (relocated) and 401
                (authorization needed). */
            frame.setlocal("_URLopener__tempfiles", frame.getname("None"));
            frame.setlocal("version", s$37._mod(frame.getname("__version__")));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$5___init__));
            frame.setlocal("__del__", new PyFunction(frame.f_globals, new PyObject[] {}, c$6___del__));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_close));
            frame.setlocal("cleanup", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_cleanup));
            frame.setlocal("addheader", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_addheader));
            frame.setlocal("open", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$10_open));
            frame.setlocal("open_unknown", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$11_open_unknown));
            frame.setlocal("open_unknown_proxy", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$12_open_unknown_proxy));
            frame.setlocal("retrieve", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), frame.getname("None"), frame.getname("None")}, c$13_retrieve));
            frame.setlocal("open_http", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$14_open_http));
            frame.setlocal("http_error", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$15_http_error));
            frame.setlocal("http_error_default", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_http_error_default));
            if (frame.getname("hasattr").__call__(frame.getname("socket"), s$84).__nonzero__()) {
                frame.setlocal("open_https", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$17_open_https));
            }
            frame.setlocal("open_gopher", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_open_gopher));
            frame.setlocal("open_file", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_open_file));
            frame.setlocal("open_local_file", new PyFunction(frame.f_globals, new PyObject[] {}, c$20_open_local_file));
            frame.setlocal("open_ftp", new PyFunction(frame.f_globals, new PyObject[] {}, c$21_open_ftp));
            frame.setlocal("open_data", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$22_open_data));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$25(PyFrame frame) {
            frame.getglobal("apply").__call__(frame.getglobal("URLopener").__getattr__("__init__"), new PyTuple(new PyObject[] {frame.getlocal(0)})._add(frame.getlocal(1)));
            frame.getlocal(0).__setattr__("auth_cache", new PyDictionary(new PyObject[] {}));
            frame.getlocal(0).__setattr__("tries", i$64);
            frame.getlocal(0).__setattr__("maxtries", i$31);
            return Py.None;
        }
        
        private static PyObject http_error_default$26(PyFrame frame) {
            /* Default error handling -- don't raise an exception. */
            return frame.getglobal("addinfourl").__call__(frame.getlocal(2), frame.getlocal(5), s$80._add(frame.getlocal(1)));
        }
        
        private static PyObject http_error_302$27(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Error 302 -- relocated (temporarily). */
            t$0$PyObject = i$57;
            t$1$PyObject = frame.getlocal(0);
            t$1$PyObject.__setattr__("tries", t$1$PyObject.__getattr__("tries").__iadd__(t$0$PyObject));
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("maxtries")).__nonzero__() ? frame.getlocal(0).__getattr__("tries")._ge(frame.getlocal(0).__getattr__("maxtries")) : t$0$PyObject).__nonzero__()) {
                if (frame.getglobal("hasattr").__call__(frame.getlocal(0), s$129).__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(0).__getattr__("http_error_500"));
                }
                else {
                    frame.setlocal(7, frame.getlocal(0).__getattr__("http_error_default"));
                }
                frame.getlocal(0).__setattr__("tries", i$64);
                return frame.getlocal(7).__call__(new PyObject[] {frame.getlocal(1), frame.getlocal(2), i$130, s$131, frame.getlocal(5)});
            }
            frame.setlocal(8, frame.getlocal(0).invoke("redirect_internal", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5), frame.getlocal(6)}));
            frame.getlocal(0).__setattr__("tries", i$64);
            return frame.getlocal(8);
        }
        
        private static PyObject redirect_internal$28(PyFrame frame) {
            if (frame.getlocal(5).invoke("has_key", s$132).__nonzero__()) {
                frame.setlocal(8, frame.getlocal(5).__getitem__(s$132));
            }
            else if (frame.getlocal(5).invoke("has_key", s$133).__nonzero__()) {
                frame.setlocal(8, frame.getlocal(5).__getitem__(s$133));
            }
            else {
                return Py.None;
            }
            frame.setlocal(7, frame.getlocal(2).invoke("read"));
            frame.getlocal(2).invoke("close");
            frame.setlocal(8, frame.getglobal("basejoin").__call__(frame.getlocal(0).__getattr__("type")._add(s$134)._add(frame.getlocal(1)), frame.getlocal(8)));
            if (frame.getlocal(6)._is(frame.getglobal("None")).__nonzero__()) {
                return frame.getlocal(0).invoke("open", frame.getlocal(8));
            }
            else {
                return frame.getlocal(0).invoke("open", frame.getlocal(8), frame.getlocal(6));
            }
        }
        
        private static PyObject http_error_301$29(PyFrame frame) {
            /* Error 301 -- also relocated (permanently). */
            return frame.getlocal(0).invoke("http_error_302", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5), frame.getlocal(6)});
        }
        
        private static PyObject http_error_401$30(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Error 401 -- authentication required.
                    See this URL for a description of the basic authentication scheme:
                    http://www.ics.uci.edu/pub/ietf/http/draft-ietf-http-v10-spec-00.txt */
            if (frame.getlocal(5).invoke("has_key", s$137).__not__().__nonzero__()) {
                frame.getglobal("URLopener").invoke("http_error_default", new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2), frame.getlocal(4), frame.getlocal(5)});
            }
            frame.setlocal(9, frame.getlocal(5).__getitem__(s$137));
            frame.setlocal(12, org.python.core.imp.importOne("re", frame));
            frame.setlocal(10, frame.getlocal(12).__getattr__("match").__call__(s$138, frame.getlocal(9)));
            if (frame.getlocal(10).__not__().__nonzero__()) {
                frame.getglobal("URLopener").invoke("http_error_default", new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5)});
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(10).invoke("groups"), 2);
            frame.setlocal(8, t$0$PyObject__[0]);
            frame.setlocal(11, t$0$PyObject__[1]);
            if (frame.getlocal(8).invoke("lower")._ne(s$139).__nonzero__()) {
                frame.getglobal("URLopener").invoke("http_error_default", new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2), frame.getlocal(3), frame.getlocal(4), frame.getlocal(5)});
            }
            frame.setlocal(7, s$140._add(frame.getlocal(0).__getattr__("type"))._add(s$141));
            if (frame.getlocal(6)._is(frame.getglobal("None")).__nonzero__()) {
                return frame.getglobal("getattr").__call__(frame.getlocal(0), frame.getlocal(7)).__call__(frame.getlocal(1), frame.getlocal(11));
            }
            else {
                return frame.getglobal("getattr").__call__(frame.getlocal(0), frame.getlocal(7)).__call__(frame.getlocal(1), frame.getlocal(11), frame.getlocal(6));
            }
        }
        
        private static PyObject retry_http_basic_auth$31(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
            frame.setlocal(8, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            frame.setlocal(7, frame.getlocal(8).invoke("find", s$142)._add(i$57));
            frame.setlocal(8, frame.getlocal(8).__getslice__(frame.getlocal(7), null, null));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("get_user_passwd", new PyObject[] {frame.getlocal(8), frame.getlocal(2), frame.getlocal(7)}), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject : frame.getlocal(4)).__not__().__nonzero__()) {
                return frame.getglobal("None");
            }
            frame.setlocal(8, frame.getglobal("quote").__call__(new PyObject[] {frame.getlocal(6), s$58}, new String[] {"safe"})._add(s$134)._add(frame.getglobal("quote").__call__(new PyObject[] {frame.getlocal(4), s$58}, new String[] {"safe"}))._add(s$142)._add(frame.getlocal(8)));
            frame.setlocal(9, s$143._add(frame.getlocal(8))._add(frame.getlocal(5)));
            if (frame.getlocal(3)._is(frame.getglobal("None")).__nonzero__()) {
                return frame.getlocal(0).invoke("open", frame.getlocal(9));
            }
            else {
                return frame.getlocal(0).invoke("open", frame.getlocal(9), frame.getlocal(3));
            }
        }
        
        private static PyObject retry_https_basic_auth$32(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(1)), 2);
            frame.setlocal(8, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            frame.setlocal(7, frame.getlocal(8).invoke("find", s$142)._add(i$57));
            frame.setlocal(8, frame.getlocal(8).__getslice__(frame.getlocal(7), null, null));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("get_user_passwd", new PyObject[] {frame.getlocal(8), frame.getlocal(2), frame.getlocal(7)}), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject : frame.getlocal(4)).__not__().__nonzero__()) {
                return frame.getglobal("None");
            }
            frame.setlocal(8, frame.getglobal("quote").__call__(new PyObject[] {frame.getlocal(6), s$58}, new String[] {"safe"})._add(s$134)._add(frame.getglobal("quote").__call__(new PyObject[] {frame.getlocal(4), s$58}, new String[] {"safe"}))._add(s$142)._add(frame.getlocal(8)));
            frame.setlocal(9, s$93._add(frame.getlocal(8))._add(frame.getlocal(5)));
            return frame.getlocal(0).invoke("open_https", frame.getlocal(9), frame.getlocal(3));
        }
        
        private static PyObject get_user_passwd$33(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            frame.setlocal(6, frame.getlocal(2)._add(s$142)._add(frame.getlocal(1).invoke("lower")));
            if (frame.getlocal(0).__getattr__("auth_cache").invoke("has_key", frame.getlocal(6)).__nonzero__()) {
                if (frame.getlocal(3).__nonzero__()) {
                    frame.getlocal(0).__getattr__("auth_cache").__delitem__(frame.getlocal(6));
                }
                else {
                    return frame.getlocal(0).__getattr__("auth_cache").__getitem__(frame.getlocal(6));
                }
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("prompt_user_passwd", frame.getlocal(1), frame.getlocal(2)), 2);
            frame.setlocal(5, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(5)).__nonzero__() ? t$0$PyObject : frame.getlocal(4)).__nonzero__()) {
                frame.getlocal(0).__getattr__("auth_cache").__setitem__(frame.getlocal(6), new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(4)}));
            }
            return new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(4)});
        }
        
        private static PyObject prompt_user_passwd$34(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Override this in a GUI environment! */
            frame.setlocal(5, org.python.core.imp.importOne("getpass", frame));
            try {
                frame.setlocal(4, frame.getglobal("raw_input").__call__(s$145._mod(new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(1)}))));
                frame.setlocal(3, frame.getlocal(5).__getattr__("getpass").__call__(s$146._mod(new PyTuple(new PyObject[] {frame.getlocal(4), frame.getlocal(2), frame.getlocal(1)}))));
                return new PyTuple(new PyObject[] {frame.getlocal(4), frame.getlocal(3)});
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("KeyboardInterrupt"))) {
                    Py.println();
                    return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getglobal("None")});
                }
                else throw t$0$PyException;
            }
        }
        
        private static PyObject FancyURLopener$35(PyFrame frame) {
            /* Derived class with handlers for errors we can handle (perhaps). */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$24___init__));
            frame.setlocal("http_error_default", new PyFunction(frame.f_globals, new PyObject[] {}, c$25_http_error_default));
            frame.setlocal("http_error_302", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$26_http_error_302));
            frame.setlocal("redirect_internal", new PyFunction(frame.f_globals, new PyObject[] {}, c$27_redirect_internal));
            frame.setlocal("http_error_301", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$28_http_error_301));
            frame.setlocal("http_error_401", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$29_http_error_401));
            frame.setlocal("retry_http_basic_auth", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$30_retry_http_basic_auth));
            frame.setlocal("retry_https_basic_auth", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$31_retry_https_basic_auth));
            frame.setlocal("get_user_passwd", new PyFunction(frame.f_globals, new PyObject[] {i$64}, c$32_get_user_passwd));
            frame.setlocal("prompt_user_passwd", new PyFunction(frame.f_globals, new PyObject[] {}, c$33_prompt_user_passwd));
            return frame.getf_locals();
        }
        
        private static PyObject localhost$36(PyFrame frame) {
            /* Return the IP address of the magic hostname 'localhost'. */
            // global _localhost
            if (frame.getglobal("_localhost").__not__().__nonzero__()) {
                frame.setglobal("_localhost", frame.getglobal("socket").__getattr__("gethostbyname").__call__(s$14));
            }
            return frame.getglobal("_localhost");
        }
        
        private static PyObject thishost$37(PyFrame frame) {
            /* Return the IP address of the current host. */
            // global _thishost
            if (frame.getglobal("_thishost").__not__().__nonzero__()) {
                frame.setglobal("_thishost", frame.getglobal("socket").__getattr__("gethostbyname").__call__(frame.getglobal("socket").__getattr__("gethostname").__call__()));
            }
            return frame.getglobal("_thishost");
        }
        
        private static PyObject ftperrors$38(PyFrame frame) {
            /* Return the set of errors raised by the FTP class. */
            // global _ftperrors
            if (frame.getglobal("_ftperrors").__not__().__nonzero__()) {
                frame.setlocal(0, org.python.core.imp.importOne("ftplib", frame));
                frame.setglobal("_ftperrors", frame.getlocal(0).__getattr__("all_errors"));
            }
            return frame.getglobal("_ftperrors");
        }
        
        private static PyObject noheaders$39(PyFrame frame) {
            /* Return an empty mimetools.Message object. */
            // global _noheaders
            if (frame.getglobal("_noheaders").__not__().__nonzero__()) {
                frame.setlocal(0, org.python.core.imp.importOne("mimetools", frame));
                frame.setlocal(1, org.python.core.imp.importOne("StringIO", frame));
                frame.setglobal("_noheaders", frame.getlocal(0).__getattr__("Message").__call__(frame.getlocal(1).__getattr__("StringIO").__call__(), i$64));
                frame.getglobal("_noheaders").__getattr__("fp").invoke("close");
            }
            return frame.getglobal("_noheaders");
        }
        
        private static PyObject __init__$40(PyFrame frame) {
            frame.getlocal(0).__setattr__("user", frame.getlocal(1));
            frame.getlocal(0).__setattr__("passwd", frame.getlocal(2));
            frame.getlocal(0).__setattr__("host", frame.getlocal(3));
            frame.getlocal(0).__setattr__("port", frame.getlocal(4));
            frame.getlocal(0).__setattr__("dirs", frame.getlocal(5));
            frame.getlocal(0).invoke("init");
            return Py.None;
        }
        
        private static PyObject init$41(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(2, org.python.core.imp.importOne("ftplib", frame));
            frame.getlocal(0).__setattr__("busy", i$64);
            frame.getlocal(0).__setattr__("ftp", frame.getlocal(2).__getattr__("FTP").__call__());
            frame.getlocal(0).__getattr__("ftp").invoke("connect", frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port"));
            frame.getlocal(0).__getattr__("ftp").invoke("login", frame.getlocal(0).__getattr__("user"), frame.getlocal(0).__getattr__("passwd"));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("dirs");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(1, t$0$PyObject);
                frame.getlocal(0).__getattr__("ftp").invoke("cwd", frame.getlocal(1));
            }
            return Py.None;
        }
        
        private static PyObject retrfile$42(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(7, org.python.core.imp.importOne("ftplib", frame));
            frame.getlocal(0).invoke("endtransfer");
            if (frame.getlocal(2)._in(new PyTuple(new PyObject[] {s$110, s$104})).__nonzero__()) {
                frame.setlocal(4, s$152);
                frame.setlocal(3, i$57);
            }
            else {
                frame.setlocal(4, s$153._add(frame.getlocal(2)));
                frame.setlocal(3, i$64);
            }
            try {
                frame.getlocal(0).__getattr__("ftp").invoke("voidcmd", frame.getlocal(4));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getlocal(7).__getattr__("all_errors"))) {
                    frame.getlocal(0).invoke("init");
                    frame.getlocal(0).__getattr__("ftp").invoke("voidcmd", frame.getlocal(4));
                }
                else throw t$0$PyException;
            }
            frame.setlocal(5, frame.getglobal("None"));
            if (((t$0$PyObject = frame.getlocal(1)).__nonzero__() ? frame.getlocal(3).__not__() : t$0$PyObject).__nonzero__()) {
                try {
                    frame.getlocal(0).__getattr__("ftp").invoke("nlst", frame.getlocal(1));
                }
                catch (Throwable x$1) {
                    t$0$PyException = Py.setException(x$1, frame);
                    if (Py.matchException(t$0$PyException, frame.getlocal(7).__getattr__("error_perm"))) {
                        frame.setlocal(6, t$0$PyException.value);
                        throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$103, frame.getlocal(6)}), frame.getglobal("sys").__getattr__("exc_info").__call__().__getitem__(i$51));
                    }
                    else throw t$0$PyException;
                }
                frame.getlocal(0).__getattr__("ftp").invoke("voidcmd", frame.getlocal(4));
                try {
                    frame.setlocal(4, s$154._add(frame.getlocal(1)));
                    frame.setlocal(5, frame.getlocal(0).__getattr__("ftp").invoke("ntransfercmd", frame.getlocal(4)));
                }
                catch (Throwable x$2) {
                    t$0$PyException = Py.setException(x$2, frame);
                    if (Py.matchException(t$0$PyException, frame.getlocal(7).__getattr__("error_perm"))) {
                        frame.setlocal(6, t$0$PyException.value);
                        if (frame.getglobal("str").__call__(frame.getlocal(6)).__getslice__(null, i$94, null)._ne(s$155).__nonzero__()) {
                            throw Py.makeException(frame.getglobal("IOError"), new PyTuple(new PyObject[] {s$103, frame.getlocal(6)}), frame.getglobal("sys").__getattr__("exc_info").__call__().__getitem__(i$51));
                        }
                    }
                    else throw t$0$PyException;
                }
            }
            if (frame.getlocal(5).__not__().__nonzero__()) {
                frame.getlocal(0).__getattr__("ftp").invoke("voidcmd", s$152);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.setlocal(4, s$156._add(frame.getlocal(1)));
                }
                else {
                    frame.setlocal(4, s$157);
                }
                frame.setlocal(5, frame.getlocal(0).__getattr__("ftp").invoke("ntransfercmd", frame.getlocal(4)));
            }
            frame.getlocal(0).__setattr__("busy", i$57);
            return new PyTuple(new PyObject[] {frame.getglobal("addclosehook").__call__(frame.getlocal(5).__getitem__(i$64).invoke("makefile", s$45), frame.getlocal(0).__getattr__("endtransfer")), frame.getlocal(5).__getitem__(i$57)});
        }
        
        private static PyObject endtransfer$43(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            if (frame.getlocal(0).__getattr__("busy").__not__().__nonzero__()) {
                return Py.None;
            }
            frame.getlocal(0).__setattr__("busy", i$64);
            try {
                frame.getlocal(0).__getattr__("ftp").invoke("voidresp");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ftperrors").__call__())) {
                    // pass
                }
                else throw t$0$PyException;
            }
            return Py.None;
        }
        
        private static PyObject close$44(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.getlocal(0).invoke("endtransfer");
            try {
                frame.getlocal(0).__getattr__("ftp").invoke("close");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ftperrors").__call__())) {
                    // pass
                }
                else throw t$0$PyException;
            }
            return Py.None;
        }
        
        private static PyObject ftpwrapper$45(PyFrame frame) {
            /* Class used by open_ftp() for cache of open FTP connections. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$39___init__));
            frame.setlocal("init", new PyFunction(frame.f_globals, new PyObject[] {}, c$40_init));
            frame.setlocal("retrfile", new PyFunction(frame.f_globals, new PyObject[] {}, c$41_retrfile));
            frame.setlocal("endtransfer", new PyFunction(frame.f_globals, new PyObject[] {}, c$42_endtransfer));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$43_close));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$46(PyFrame frame) {
            frame.getlocal(0).__setattr__("fp", frame.getlocal(1));
            frame.getlocal(0).__setattr__("read", frame.getlocal(0).__getattr__("fp").__getattr__("read"));
            frame.getlocal(0).__setattr__("readline", frame.getlocal(0).__getattr__("fp").__getattr__("readline"));
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0).__getattr__("fp"), s$159).__nonzero__()) {
                frame.getlocal(0).__setattr__("readlines", frame.getlocal(0).__getattr__("fp").__getattr__("readlines"));
            }
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0).__getattr__("fp"), s$160).__nonzero__()) {
                frame.getlocal(0).__setattr__("fileno", frame.getlocal(0).__getattr__("fp").__getattr__("fileno"));
            }
            return Py.None;
        }
        
        private static PyObject __repr__$47(PyFrame frame) {
            return s$161._mod(new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("__class__").__getattr__("__name__"), frame.getglobal("id").__call__(frame.getlocal(0)).__repr__(), frame.getlocal(0).__getattr__("fp").__repr__()}));
        }
        
        private static PyObject close$48(PyFrame frame) {
            frame.getlocal(0).__setattr__("read", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("readline", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("readlines", frame.getglobal("None"));
            frame.getlocal(0).__setattr__("fileno", frame.getglobal("None"));
            if (frame.getlocal(0).__getattr__("fp").__nonzero__()) {
                frame.getlocal(0).__getattr__("fp").invoke("close");
            }
            frame.getlocal(0).__setattr__("fp", frame.getglobal("None"));
            return Py.None;
        }
        
        private static PyObject addbase$49(PyFrame frame) {
            /* Base class for addinfo and addclosehook. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$45___init__));
            frame.setlocal("__repr__", new PyFunction(frame.f_globals, new PyObject[] {}, c$46___repr__));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$47_close));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$50(PyFrame frame) {
            frame.getglobal("addbase").invoke("__init__", frame.getlocal(0), frame.getlocal(1));
            frame.getlocal(0).__setattr__("closehook", frame.getlocal(2));
            frame.getlocal(0).__setattr__("hookargs", frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject close$51(PyFrame frame) {
            frame.getglobal("addbase").invoke("close", frame.getlocal(0));
            if (frame.getlocal(0).__getattr__("closehook").__nonzero__()) {
                frame.getglobal("apply").__call__(frame.getlocal(0).__getattr__("closehook"), frame.getlocal(0).__getattr__("hookargs"));
                frame.getlocal(0).__setattr__("closehook", frame.getglobal("None"));
                frame.getlocal(0).__setattr__("hookargs", frame.getglobal("None"));
            }
            return Py.None;
        }
        
        private static PyObject addclosehook$52(PyFrame frame) {
            /* Class to add a close hook to an open file. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$49___init__));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$50_close));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$53(PyFrame frame) {
            frame.getglobal("addbase").invoke("__init__", frame.getlocal(0), frame.getlocal(1));
            frame.getlocal(0).__setattr__("headers", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject info$54(PyFrame frame) {
            return frame.getlocal(0).__getattr__("headers");
        }
        
        private static PyObject addinfo$55(PyFrame frame) {
            /* class to add an info() method to an open file. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$52___init__));
            frame.setlocal("info", new PyFunction(frame.f_globals, new PyObject[] {}, c$53_info));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$56(PyFrame frame) {
            frame.getglobal("addbase").invoke("__init__", frame.getlocal(0), frame.getlocal(1));
            frame.getlocal(0).__setattr__("headers", frame.getlocal(2));
            frame.getlocal(0).__setattr__("url", frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject info$57(PyFrame frame) {
            return frame.getlocal(0).__getattr__("headers");
        }
        
        private static PyObject geturl$58(PyFrame frame) {
            return frame.getlocal(0).__getattr__("url");
        }
        
        private static PyObject addinfourl$59(PyFrame frame) {
            /* class to add info() and geturl() methods to an open file. */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$55___init__));
            frame.setlocal("info", new PyFunction(frame.f_globals, new PyObject[] {}, c$56_info));
            frame.setlocal("geturl", new PyFunction(frame.f_globals, new PyObject[] {}, c$57_geturl));
            return frame.getf_locals();
        }
        
        private static PyObject basejoin$60(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Utility to combine a URL with a base URL to form a new URL. */
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(1)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(8, t$0$PyObject__[1]);
            if (frame.getlocal(6).__nonzero__()) {
                return frame.getlocal(1);
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(8)), 2);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(8, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittype").__call__(frame.getlocal(0)), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            if (frame.getlocal(7).__nonzero__()) {
                if (frame.getlocal(6).__nonzero__()) {
                    return frame.getlocal(6)._add(s$166)._add(frame.getlocal(7))._add(frame.getlocal(8));
                }
                else {
                    return frame.getlocal(1);
                }
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splithost").__call__(frame.getlocal(5)), 2);
            frame.setlocal(7, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splittag").__call__(frame.getlocal(5)), 2);
            frame.setlocal(5, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("splitquery").__call__(frame.getlocal(5)), 2);
            frame.setlocal(5, t$0$PyObject__[0]);
            frame.setlocal(2, t$0$PyObject__[1]);
            if (frame.getlocal(8).__getslice__(null, i$57, null)._ne(s$95).__nonzero__()) {
                if (frame.getlocal(8).__getslice__(null, i$57, null)._in(new PyTuple(new PyObject[] {s$167, s$168})).__nonzero__()) {
                    frame.setlocal(3, frame.getglobal("len").__call__(frame.getlocal(5)));
                }
                else {
                    frame.setlocal(3, frame.getlocal(5).invoke("rfind", s$95));
                }
                if (frame.getlocal(3)._lt(i$64).__nonzero__()) {
                    if (frame.getlocal(7).__nonzero__()) {
                        frame.setlocal(5, s$95);
                    }
                    else {
                        frame.setlocal(5, s$58);
                    }
                }
                else {
                    frame.setlocal(5, frame.getlocal(5).__getslice__(null, frame.getlocal(3)._add(i$57), null));
                }
                while (((t$0$PyObject = frame.getlocal(5)).__nonzero__() ? frame.getlocal(8).__getslice__(null, i$94, null)._eq(s$169) : t$0$PyObject).__nonzero__()) {
                    frame.setlocal(8, frame.getlocal(8).__getslice__(i$94, null, null));
                    frame.setlocal(3, frame.getlocal(5).__getslice__(null, i$57.__neg__(), null).invoke("rfind", s$95));
                    if (frame.getlocal(3)._gt(i$64).__nonzero__()) {
                        frame.setlocal(5, frame.getlocal(5).__getslice__(null, frame.getlocal(3)._add(i$57), null));
                    }
                    else if (frame.getlocal(3)._eq(i$64).__nonzero__()) {
                        frame.setlocal(5, s$95);
                        break;
                    }
                    else {
                        frame.setlocal(5, s$58);
                    }
                }
                frame.setlocal(8, frame.getlocal(5)._add(frame.getlocal(8)));
            }
            if (((t$0$PyObject = ((t$1$PyObject = frame.getlocal(7)).__nonzero__() ? frame.getlocal(8) : t$1$PyObject)).__nonzero__() ? frame.getlocal(8).__getitem__(i$64)._ne(s$95) : t$0$PyObject).__nonzero__()) {
                frame.setlocal(8, s$95._add(frame.getlocal(8)));
            }
            if (((t$0$PyObject = frame.getlocal(6)).__nonzero__() ? frame.getlocal(7) : t$0$PyObject).__nonzero__()) {
                return frame.getlocal(6)._add(s$166)._add(frame.getlocal(7))._add(frame.getlocal(8));
            }
            else if (frame.getlocal(6).__nonzero__()) {
                return frame.getlocal(6)._add(s$134)._add(frame.getlocal(8));
            }
            else if (frame.getlocal(7).__nonzero__()) {
                return s$93._add(frame.getlocal(7))._add(frame.getlocal(8));
            }
            else {
                return frame.getlocal(8);
            }
        }
        
        private static PyObject toBytes$61(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* toBytes(u"URL") --> 'URL'. */
            if (frame.getglobal("type").__call__(frame.getlocal(0))._is(frame.getglobal("types").__getattr__("UnicodeType")).__nonzero__()) {
                try {
                    frame.setlocal(0, frame.getlocal(0).invoke("encode", s$171));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("UnicodeError"))) {
                        throw Py.makeException(frame.getglobal("UnicodeError").__call__(s$172._add(frame.getglobal("repr").__call__(frame.getlocal(0)))._add(s$173)));
                    }
                    else throw t$0$PyException;
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject unwrap$62(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* unwrap('<URL:type://host/path>') --> 'type://host/path'. */
            frame.setlocal(0, frame.getlocal(0).invoke("strip"));
            if (((t$0$PyObject = frame.getlocal(0).__getslice__(null, i$57, null)._eq(s$175)).__nonzero__() ? frame.getlocal(0).__getslice__(i$57.__neg__(), null, null)._eq(s$176) : t$0$PyObject).__nonzero__()) {
                frame.setlocal(0, frame.getlocal(0).__getslice__(i$57, i$57.__neg__(), null).invoke("strip"));
            }
            if (frame.getlocal(0).__getslice__(null, i$177, null)._eq(s$178).__nonzero__()) {
                frame.setlocal(0, frame.getlocal(0).__getslice__(i$177, null, null).invoke("strip"));
            }
            return frame.getlocal(0);
        }
        
        private static PyObject splittype$63(PyFrame frame) {
            /* splittype('type:opaquestring') --> 'type', 'opaquestring'. */
            // global _typeprog
            if (frame.getglobal("_typeprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(3, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_typeprog", frame.getlocal(3).__getattr__("compile").__call__(s$180));
            }
            frame.setlocal(2, frame.getglobal("_typeprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(2).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(2).invoke("group", i$57));
                return new PyTuple(new PyObject[] {frame.getlocal(1).invoke("lower"), frame.getlocal(0).__getslice__(frame.getglobal("len").__call__(frame.getlocal(1))._add(i$57), null, null)});
            }
            return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getlocal(0)});
        }
        
        private static PyObject splithost$64(PyFrame frame) {
            /* splithost('//host[:port]/path') --> 'host[:port]', '/path'. */
            // global _hostprog
            if (frame.getglobal("_hostprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_hostprog", frame.getlocal(2).__getattr__("compile").__call__(s$182));
            }
            frame.setlocal(1, frame.getglobal("_hostprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1).invoke("group", i$57, i$51);
            }
            return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getlocal(0)});
        }
        
        private static PyObject splituser$65(PyFrame frame) {
            /* splituser('user[:passwd]@host[:port]') --> 'user[:passwd]', 'host[:port]'. */
            // global _userprog
            if (frame.getglobal("_userprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_userprog", frame.getlocal(2).__getattr__("compile").__call__(s$184));
            }
            frame.setlocal(1, frame.getglobal("_userprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getglobal("map").__call__(frame.getglobal("unquote"), frame.getlocal(1).invoke("group", i$57, i$51));
            }
            return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getlocal(0)});
        }
        
        private static PyObject splitpasswd$66(PyFrame frame) {
            /* splitpasswd('user:passwd') -> 'user', 'passwd'. */
            // global _passwdprog
            if (frame.getglobal("_passwdprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_passwdprog", frame.getlocal(2).__getattr__("compile").__call__(s$186));
            }
            frame.setlocal(1, frame.getglobal("_passwdprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1).invoke("group", i$57, i$51);
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getglobal("None")});
        }
        
        private static PyObject splitport$67(PyFrame frame) {
            /* splitport('host:port') --> 'host', 'port'. */
            // global _portprog
            if (frame.getglobal("_portprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_portprog", frame.getlocal(2).__getattr__("compile").__call__(s$188));
            }
            frame.setlocal(1, frame.getglobal("_portprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1).invoke("group", i$57, i$51);
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getglobal("None")});
        }
        
        private static PyObject splitnport$68(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            
            // Code
            /* Split host and port, returning numeric port.
                Return given default port if no ':' found; defaults to -1.
                Return numerical port if a valid number are found after ':'.
                Return None if ':' but not a valid number. */
            // global _nportprog
            if (frame.getglobal("_nportprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(5, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_nportprog", frame.getlocal(5).__getattr__("compile").__call__(s$190));
            }
            frame.setlocal(3, frame.getglobal("_nportprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(3).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(3).invoke("group", i$57, i$51), 2);
                frame.setlocal(0, t$0$PyObject__[0]);
                frame.setlocal(2, t$0$PyObject__[1]);
                try {
                    if (frame.getlocal(2).__not__().__nonzero__()) {
                        throw Py.makeException(frame.getglobal("ValueError"), s$191);
                    }
                    frame.setlocal(4, frame.getglobal("int").__call__(frame.getlocal(2)));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                        frame.setlocal(4, frame.getglobal("None"));
                    }
                    else throw t$0$PyException;
                }
                return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getlocal(4)});
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getlocal(1)});
        }
        
        private static PyObject splitquery$69(PyFrame frame) {
            /* splitquery('/path?query') --> '/path', 'query'. */
            // global _queryprog
            if (frame.getglobal("_queryprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_queryprog", frame.getlocal(2).__getattr__("compile").__call__(s$193));
            }
            frame.setlocal(1, frame.getglobal("_queryprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1).invoke("group", i$57, i$51);
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getglobal("None")});
        }
        
        private static PyObject splittag$70(PyFrame frame) {
            /* splittag('/path#tag') --> '/path', 'tag'. */
            // global _tagprog
            if (frame.getglobal("_tagprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_tagprog", frame.getlocal(2).__getattr__("compile").__call__(s$195));
            }
            frame.setlocal(1, frame.getglobal("_tagprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1).invoke("group", i$57, i$51);
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getglobal("None")});
        }
        
        private static PyObject splitattr$71(PyFrame frame) {
            /* splitattr('/path;attr1=value1;attr2=value2;...') ->
                    '/path', ['attr1=value1', 'attr2=value2', ...]. */
            frame.setlocal(1, frame.getlocal(0).invoke("split", s$118));
            return new PyTuple(new PyObject[] {frame.getlocal(1).__getitem__(i$64), frame.getlocal(1).__getslice__(i$57, null, null)});
        }
        
        private static PyObject splitvalue$72(PyFrame frame) {
            /* splitvalue('attr=value') --> 'attr', 'value'. */
            // global _valueprog
            if (frame.getglobal("_valueprog")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_valueprog", frame.getlocal(2).__getattr__("compile").__call__(s$198));
            }
            frame.setlocal(1, frame.getglobal("_valueprog").invoke("match", frame.getlocal(0)));
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(1).invoke("group", i$57, i$51);
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getglobal("None")});
        }
        
        private static PyObject splitgophertype$73(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* splitgophertype('/Xselector') --> 'X', 'selector'. */
            if (((t$0$PyObject = frame.getlocal(0).__getslice__(null, i$57, null)._eq(s$95)).__nonzero__() ? frame.getlocal(0).__getslice__(i$57, i$51, null) : t$0$PyObject).__nonzero__()) {
                return new PyTuple(new PyObject[] {frame.getlocal(0).__getitem__(i$57), frame.getlocal(0).__getslice__(i$51, null, null)});
            }
            return new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getlocal(0)});
        }
        
        private static PyObject unquote$74(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* unquote('abc%20def') -> 'abc def'. */
            frame.setlocal(2, frame.getglobal("chr"));
            frame.setlocal(5, frame.getglobal("int"));
            frame.setlocal(3, frame.getlocal(0).invoke("split", s$201));
            frame.setlocal(4, new PyList(new PyObject[] {frame.getlocal(3).__getitem__(i$64)}));
            frame.setlocal(1, frame.getlocal(4).__getattr__("append"));
            frame.getlocal(3).__delitem__(i$64);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(3);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(6, t$0$PyObject);
                if (frame.getlocal(6).__getslice__(i$57, i$51, null).__nonzero__()) {
                    try {
                        frame.getlocal(1).__call__(frame.getlocal(2).__call__(frame.getlocal(5).__call__(frame.getlocal(6).__getslice__(null, i$51, null), i$202))._add(frame.getlocal(6).__getslice__(i$51, null, null)));
                    }
                    catch (Throwable x$0) {
                        t$0$PyException = Py.setException(x$0, frame);
                        frame.getlocal(1).__call__(s$201._add(frame.getlocal(6)));
                    }
                }
                else {
                    frame.getlocal(1).__call__(s$201._add(frame.getlocal(6)));
                }
            }
            return s$58.invoke("join", frame.getlocal(4));
        }
        
        private static PyObject unquote_plus$75(PyFrame frame) {
            /* unquote('%7e/abc+def') -> '~/abc def' */
            if (s$204._in(frame.getlocal(0)).__nonzero__()) {
                frame.setlocal(0, s$205.invoke("join", frame.getlocal(0).invoke("split", s$204)));
            }
            return frame.getglobal("unquote").__call__(frame.getlocal(0));
        }
        
        private static PyObject _fast_quote$76(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            // global _fast_safe
            if (frame.getglobal("_fast_safe")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setglobal("_fast_safe", new PyDictionary(new PyObject[] {}));
                t$0$int = 0;
                t$1$PyObject = frame.getglobal("_fast_safe_test");
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(3, t$0$PyObject);
                    frame.getglobal("_fast_safe").__setitem__(frame.getlocal(3), frame.getlocal(3));
                }
            }
            frame.setlocal(2, frame.getglobal("list").__call__(frame.getlocal(0)));
            t$1$int = 0;
            t$3$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(2)));
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                frame.setlocal(1, t$2$PyObject);
                frame.setlocal(3, frame.getlocal(2).__getitem__(frame.getlocal(1)));
                if (frame.getglobal("_fast_safe").invoke("has_key", frame.getlocal(3)).__not__().__nonzero__()) {
                    frame.getlocal(2).__setitem__(frame.getlocal(1), s$207._mod(frame.getglobal("ord").__call__(frame.getlocal(3))));
                }
            }
            return s$58.invoke("join", frame.getlocal(2));
        }
        
        private static PyObject quote$77(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* quote('abc def') -> 'abc%20def'
            
                Each part of a URL, e.g. the path info, the query, etc., has a
                different set of reserved characters that must be quoted.
            
                RFC 2396 Uniform Resource Identifiers (URI): Generic Syntax lists
                the following reserved characters.
            
                reserved    = ";" | "/" | "?" | ":" | "@" | "&" | "=" | "+" |
                              "$" | ","
            
                Each of these characters is reserved in some component of a URL,
                but not necessarily in all of them.
            
                By default, the quote function is intended for quoting the path
                section of a URL.  Thus, it will not encode '/'.  This character
                is reserved, but in typical usage the quote function is being
                called on a path where the existing slash characters are used as
                reserved characters.
                 */
            frame.setlocal(1, frame.getglobal("always_safe")._add(frame.getlocal(1)));
            if (frame.getglobal("_fast_safe_test")._eq(frame.getlocal(1)).__nonzero__()) {
                return frame.getglobal("_fast_quote").__call__(frame.getlocal(0));
            }
            frame.setlocal(3, frame.getglobal("list").__call__(frame.getlocal(0)));
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(3)));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.setlocal(4, frame.getlocal(3).__getitem__(frame.getlocal(2)));
                if (frame.getlocal(4)._notin(frame.getlocal(1)).__nonzero__()) {
                    frame.getlocal(3).__setitem__(frame.getlocal(2), s$207._mod(frame.getglobal("ord").__call__(frame.getlocal(4))));
                }
            }
            return s$58.invoke("join", frame.getlocal(3));
        }
        
        private static PyObject quote_plus$78(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Quote the query fragment of a URL; replacing ' ' with '+' */
            if (s$205._in(frame.getlocal(0)).__nonzero__()) {
                frame.setlocal(2, frame.getlocal(0).invoke("split", s$205));
                t$0$int = 0;
                t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(2)));
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(3, t$0$PyObject);
                    frame.getlocal(2).__setitem__(frame.getlocal(3), frame.getglobal("quote").__call__(frame.getlocal(2).__getitem__(frame.getlocal(3)), frame.getlocal(1)));
                }
                return s$204.invoke("join", frame.getlocal(2));
            }
            else {
                return frame.getglobal("quote").__call__(frame.getlocal(0), frame.getlocal(1));
            }
        }
        
        private static PyObject urlencode$79(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int, t$2$int;
            boolean t$0$boolean;
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject, t$5$PyObject;
            
            // Code
            /* Encode a sequence of two-element tuples or dictionary into a URL query string.
            
                If any values in the query arg are sequences and doseq is true, each
                sequence element is converted to a separate parameter.
            
                If the query arg is a sequence of two-element tuples, the order of the
                parameters in the output will match the order of parameters in the
                input.
                 */
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0), s$211).__nonzero__()) {
                frame.setlocal(0, frame.getlocal(0).invoke("items"));
            }
            else {
                try {
                    frame.setlocal(5, frame.getglobal("len").__call__(frame.getlocal(0)));
                    if (((t$0$PyObject = frame.getglobal("len").__call__(frame.getlocal(0))).__nonzero__() ? frame.getglobal("type").__call__(frame.getlocal(0).__getitem__(i$64))._ne(frame.getglobal("types").__getattr__("TupleType")) : t$0$PyObject).__nonzero__()) {
                        throw Py.makeException(frame.getglobal("TypeError"));
                    }
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("TypeError"))) {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("sys").__getattr__("exc_info").__call__(), 3);
                        frame.setlocal(9, t$0$PyObject__[0]);
                        frame.setlocal(2, t$0$PyObject__[1]);
                        frame.setlocal(4, t$0$PyObject__[2]);
                        throw Py.makeException(frame.getglobal("TypeError"), s$212, frame.getlocal(4));
                    }
                    else throw t$0$PyException;
                }
            }
            frame.setlocal(7, new PyList(new PyObject[] {}));
            if (frame.getlocal(1).__not__().__nonzero__()) {
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(0);
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(t$0$PyObject, 2);
                    frame.setlocal(8, t$0$PyObject__[0]);
                    frame.setlocal(6, t$0$PyObject__[1]);
                    frame.setlocal(8, frame.getglobal("quote_plus").__call__(frame.getglobal("str").__call__(frame.getlocal(8))));
                    frame.setlocal(6, frame.getglobal("quote_plus").__call__(frame.getglobal("str").__call__(frame.getlocal(6))));
                    frame.getlocal(7).invoke("append", frame.getlocal(8)._add(s$119)._add(frame.getlocal(6)));
                }
            }
            else {
                t$1$int = 0;
                t$3$PyObject = frame.getlocal(0);
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(t$2$PyObject, 2);
                    frame.setlocal(8, t$0$PyObject__[0]);
                    frame.setlocal(6, t$0$PyObject__[1]);
                    frame.setlocal(8, frame.getglobal("quote_plus").__call__(frame.getglobal("str").__call__(frame.getlocal(8))));
                    if (frame.getglobal("type").__call__(frame.getlocal(6))._eq(frame.getglobal("types").__getattr__("StringType")).__nonzero__()) {
                        frame.setlocal(6, frame.getglobal("quote_plus").__call__(frame.getlocal(6)));
                        frame.getlocal(7).invoke("append", frame.getlocal(8)._add(s$119)._add(frame.getlocal(6)));
                    }
                    else if (frame.getglobal("type").__call__(frame.getlocal(6))._eq(frame.getglobal("types").__getattr__("UnicodeType")).__nonzero__()) {
                        frame.setlocal(6, frame.getglobal("quote_plus").__call__(frame.getlocal(6).invoke("encode", s$171, s$213)));
                        frame.getlocal(7).invoke("append", frame.getlocal(8)._add(s$119)._add(frame.getlocal(6)));
                    }
                    else {
                        t$0$boolean = true;
                        try {
                            frame.setlocal(5, frame.getglobal("len").__call__(frame.getlocal(6)));
                        }
                        catch (Throwable x$1) {
                            t$0$boolean = false;
                            t$0$PyException = Py.setException(x$1, frame);
                            if (Py.matchException(t$0$PyException, frame.getglobal("TypeError"))) {
                                frame.setlocal(6, frame.getglobal("quote_plus").__call__(frame.getglobal("str").__call__(frame.getlocal(6))));
                                frame.getlocal(7).invoke("append", frame.getlocal(8)._add(s$119)._add(frame.getlocal(6)));
                            }
                            else throw t$0$PyException;
                        }
                        if (t$0$boolean) {
                            t$2$int = 0;
                            t$5$PyObject = frame.getlocal(6);
                            while ((t$4$PyObject = t$5$PyObject.__finditem__(t$2$int++)) != null) {
                                frame.setlocal(3, t$4$PyObject);
                                frame.getlocal(7).invoke("append", frame.getlocal(8)._add(s$119)._add(frame.getglobal("quote_plus").__call__(frame.getglobal("str").__call__(frame.getlocal(3)))));
                            }
                        }
                    }
                }
            }
            return s$214.invoke("join", frame.getlocal(7));
        }
        
        private static PyObject getproxies_environment$80(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject;
            
            // Code
            /* Return a dictionary of scheme -> proxy server URL mappings.
            
                Scan the environment for variables named <scheme>_proxy;
                this seems to be the standard convention.  If you need a
                different way, you can pass a proxies dictionary to the
                [Fancy]URLopener constructor.
            
                 */
            frame.setlocal(0, new PyDictionary(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("os").__getattr__("environ").__getattr__("items").__call__();
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(t$0$PyObject, 2);
                frame.setlocal(1, t$0$PyObject__[0]);
                frame.setlocal(2, t$0$PyObject__[1]);
                frame.setlocal(1, frame.getlocal(1).invoke("lower"));
                if (((t$2$PyObject = frame.getlocal(2)).__nonzero__() ? frame.getlocal(1).__getslice__(i$216.__neg__(), null, null)._eq(s$217) : t$2$PyObject).__nonzero__()) {
                    frame.getlocal(0).__setitem__(frame.getlocal(1).__getslice__(null, i$216.__neg__(), null), frame.getlocal(2));
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject getproxies$81(PyFrame frame) {
            // Temporary Variables
            boolean t$0$boolean;
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* Return a dictionary of scheme -> proxy server URL mappings.
            
                    By convention the mac uses Internet Config to store
                    proxies.  An HTTP proxy, for instance, is stored under
                    the HttpProxy key.
            
                     */
            try {
                frame.setlocal(1, org.python.core.imp.importOne("ic", frame));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ImportError"))) {
                    return new PyDictionary(new PyObject[] {});
                }
                else throw t$0$PyException;
            }
            try {
                frame.setlocal(2, frame.getlocal(1).__getattr__("IC").__call__());
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                if (Py.matchException(t$0$PyException, frame.getlocal(1).__getattr__("error"))) {
                    return new PyDictionary(new PyObject[] {});
                }
                else throw t$0$PyException;
            }
            frame.setlocal(0, new PyDictionary(new PyObject[] {}));
            if (((t$0$PyObject = frame.getlocal(2).invoke("has_key", s$219)).__nonzero__() ? frame.getlocal(2).__getitem__(s$219) : t$0$PyObject).__nonzero__()) {
                t$0$boolean = true;
                try {
                    frame.setlocal(3, frame.getlocal(2).__getitem__(s$220));
                }
                catch (Throwable x$2) {
                    t$0$boolean = false;
                    t$0$PyException = Py.setException(x$2, frame);
                    if (Py.matchException(t$0$PyException, frame.getlocal(1).__getattr__("error"))) {
                        // pass
                    }
                    else throw t$0$PyException;
                }
                if (t$0$boolean) {
                    frame.getlocal(0).__setitem__(s$66, s$221._mod(frame.getlocal(3)));
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject getproxies_registry$82(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* Return a dictionary of scheme -> proxy server URL mappings.
            
                    Win32 uses the registry to store proxies.
            
                     */
            frame.setlocal(3, new PyDictionary(new PyObject[] {}));
            try {
                frame.setlocal(2, org.python.core.imp.importOne("_winreg", frame));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ImportError"))) {
                    return frame.getlocal(3);
                }
                else throw t$0$PyException;
            }
            try {
                frame.setlocal(4, frame.getlocal(2).__getattr__("OpenKey").__call__(frame.getlocal(2).__getattr__("HKEY_CURRENT_USER"), s$223));
                frame.setlocal(1, frame.getlocal(2).__getattr__("QueryValueEx").__call__(frame.getlocal(4), s$224).__getitem__(i$64));
                if (frame.getlocal(1).__nonzero__()) {
                    frame.setlocal(7, frame.getglobal("str").__call__(frame.getlocal(2).__getattr__("QueryValueEx").__call__(frame.getlocal(4), s$225).__getitem__(i$64)));
                    if (s$119._in(frame.getlocal(7)).__nonzero__()) {
                        t$0$int = 0;
                        t$1$PyObject = frame.getlocal(7).invoke("split", s$118);
                        while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                            frame.setlocal(0, t$0$PyObject);
                            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("split", s$119, i$57), 2);
                            frame.setlocal(6, t$0$PyObject__[0]);
                            frame.setlocal(5, t$0$PyObject__[1]);
                            frame.getlocal(3).__setitem__(frame.getlocal(6), s$226._mod(new PyTuple(new PyObject[] {frame.getlocal(6), frame.getlocal(5)})));
                        }
                    }
                    else {
                        if (frame.getlocal(7).__getslice__(null, i$227, null)._eq(s$80).__nonzero__()) {
                            frame.getlocal(3).__setitem__(s$66, frame.getlocal(7));
                        }
                        else {
                            frame.getlocal(3).__setitem__(s$66, s$221._mod(frame.getlocal(7)));
                            frame.getlocal(3).__setitem__(s$229, s$228._mod(frame.getlocal(7)));
                        }
                    }
                }
                frame.getlocal(4).invoke("Close");
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                if (Py.matchException(t$0$PyException, new PyTuple(new PyObject[] {frame.getglobal("WindowsError"), frame.getglobal("ValueError"), frame.getglobal("TypeError")}))) {
                    // pass
                }
                else throw t$0$PyException;
            }
            return frame.getlocal(3);
        }
        
        private static PyObject getproxies$83(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Return a dictionary of scheme -> proxy server URL mappings.
            
                    Returns settings gathered from the environment, if specified,
                    or the registry.
            
                     */
            return (t$0$PyObject = frame.getglobal("getproxies_environment").__call__()).__nonzero__() ? t$0$PyObject : frame.getglobal("getproxies_registry").__call__();
        }
        
        private static PyObject test1$84(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(1, org.python.core.imp.importOne("time", frame));
            frame.setlocal(6, s$58);
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(i$231);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.setlocal(6, frame.getlocal(6)._add(frame.getglobal("chr").__call__(frame.getlocal(2))));
            }
            frame.setlocal(6, frame.getlocal(6)._mul(i$177));
            frame.setlocal(4, frame.getlocal(1).__getattr__("time").__call__());
            frame.setlocal(5, frame.getglobal("quote").__call__(frame.getlocal(6)));
            frame.setlocal(0, frame.getglobal("unquote").__call__(frame.getlocal(5)));
            frame.setlocal(3, frame.getlocal(1).__getattr__("time").__call__());
            if (frame.getlocal(0)._ne(frame.getlocal(6)).__nonzero__()) {
                Py.println(s$232);
            }
            Py.println(frame.getlocal(6).__repr__());
            Py.println(frame.getlocal(5).__repr__());
            Py.println(frame.getlocal(0).__repr__());
            Py.printComma(frame.getglobal("round").__call__(frame.getlocal(3)._sub(frame.getlocal(4)), i$94));
            Py.println(s$233);
            return Py.None;
        }
        
        private static PyObject reporthook$85(PyFrame frame) {
            Py.println(s$234._mod(new PyTuple(new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2)})));
            return Py.None;
        }
        
        private static PyObject test$86(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            if (frame.getlocal(0).__not__().__nonzero__()) {
                frame.setlocal(0, new PyList(new PyObject[] {s$235, s$236, s$237, s$238, s$239}));
                if (frame.getglobal("hasattr").__call__(frame.getglobal("URLopener"), s$240).__nonzero__()) {
                    frame.getlocal(0).invoke("append", s$241);
                }
            }
            try {
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(0);
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(1, t$0$PyObject);
                    Py.printComma(s$48._mul(i$31));
                    Py.printComma(frame.getlocal(1));
                    Py.println(s$48._mul(i$31));
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("urlretrieve").__call__(frame.getlocal(1), frame.getglobal("None"), frame.getglobal("reporthook")), 2);
                    frame.setlocal(6, t$0$PyObject__[0]);
                    frame.setlocal(4, t$0$PyObject__[1]);
                    Py.println(frame.getlocal(6));
                    if (frame.getlocal(4).__nonzero__()) {
                        Py.println(s$242);
                        t$1$int = 0;
                        t$3$PyObject = frame.getlocal(4).invoke("keys");
                        while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                            frame.setlocal(2, t$2$PyObject);
                            Py.printComma(frame.getlocal(2)._add(s$134));
                            Py.println(frame.getlocal(4).__getitem__(frame.getlocal(2)));
                        }
                        Py.println(s$242);
                    }
                    frame.setlocal(5, frame.getglobal("open").__call__(frame.getlocal(6), s$45));
                    frame.setlocal(3, frame.getlocal(5).invoke("read"));
                    frame.dellocal(5);
                    if (s$243._in(frame.getlocal(3)).__nonzero__()) {
                        frame.setlocal(7, frame.getglobal("string").__getattr__("maketrans").__call__(s$58, s$58));
                        frame.setlocal(3, frame.getlocal(3).invoke("translate", frame.getlocal(7), s$243));
                    }
                    Py.println(frame.getlocal(3));
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getglobal("None"), frame.getglobal("None")}), 2);
                    frame.setlocal(6, t$0$PyObject__[0]);
                    frame.setlocal(4, t$0$PyObject__[1]);
                }
                Py.println(s$48._mul(i$244));
            }
            finally {
                frame.getglobal("urlcleanup").__call__();
            }
            return Py.None;
        }
        
        private static PyObject main$87(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(5, org.python.core.imp.importOne("getopt", frame));
            frame.setlocal(7, org.python.core.imp.importOne("sys", frame));
            try {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5).__getattr__("getopt").__call__(frame.getlocal(7).__getattr__("argv").__getslice__(i$57, null, null), s$245), 2);
                frame.setlocal(0, t$0$PyObject__[0]);
                frame.setlocal(4, t$0$PyObject__[1]);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getlocal(5).__getattr__("error"))) {
                    frame.setlocal(3, t$0$PyException.value);
                    Py.println(frame.getlocal(3));
                    Py.println(s$246);
                    return Py.None;
                }
                else throw t$0$PyException;
            }
            frame.setlocal(8, i$64);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(t$0$PyObject, 2);
                frame.setlocal(2, t$0$PyObject__[0]);
                frame.setlocal(6, t$0$PyObject__[1]);
                if (frame.getlocal(2)._eq(s$247).__nonzero__()) {
                    frame.setlocal(8, frame.getlocal(8)._add(i$57));
                }
                if (frame.getlocal(2)._eq(s$248).__nonzero__()) {
                    Py.println(s$249);
                    Py.printComma(s$250);
                    Py.println(s$251);
                    return Py.None;
                }
            }
            if (frame.getlocal(8).__nonzero__()) {
                if (frame.getlocal(8)._gt(i$57).__nonzero__()) {
                    frame.getglobal("test1").__call__();
                }
                frame.getglobal("test").__call__(frame.getlocal(4));
            }
            else {
                if (frame.getlocal(4).__not__().__nonzero__()) {
                    Py.println(s$246);
                }
                t$1$int = 0;
                t$3$PyObject = frame.getlocal(4);
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    frame.setlocal(1, t$2$PyObject);
                    Py.printComma(frame.getglobal("urlopen").__call__(frame.getlocal(1)).invoke("read"));
                }
            }
            return Py.None;
        }
        
        private static PyObject main$88(PyFrame frame) {
            frame.setglobal("__file__", s$253);
            
            PyObject[] imp_accu;
            // Code
            /* Open an arbitrary URL.
            
            See the following document for more info on URLs:
            "Names and Addresses, URIs, URLs, URNs, URCs", at
            http://www.w3.org/pub/WWW/Addressing/Overview.html
            
            See also the HTTP spec (from which the error codes are derived):
            "HTTP - Hypertext Transfer Protocol", at
            http://www.w3.org/pub/WWW/Protocols/
            
            Related standards and specs:
            - RFC1808: the "relative URL" spec. (authoritative status)
            - RFC1738 - the "URL standard". (authoritative status)
            - RFC1630 - the "URI spec". (informational status)
            
            The object returned by URLopener().open(file) will differ per
            protocol.  All you know is that is has methods read(), readline(),
            readlines(), fileno(), close() and info().  The read*(), fileno()
            and close() methods work like those of open files.
            The info() method returns a mimetools.Message object which can be
            used to query various info about the object, if available.
            (mimetools.Message objects are queried with the getheader() method.)
             */
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            frame.setlocal("socket", org.python.core.imp.importOne("socket", frame));
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            frame.setlocal("types", org.python.core.imp.importOne("types", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4, s$5, s$6, s$7, s$8, s$9, s$10, s$11, s$12, s$13, s$14, s$15, s$16, s$17, s$18, s$19, s$20, s$21, s$22, s$23, s$24, s$25, s$26, s$27, s$28, s$29}));
            frame.setlocal("__version__", s$30);
            frame.setlocal("MAXFTPCACHE", i$31);
            if (frame.getname("os").__getattr__("name")._eq(s$32).__nonzero__()) {
                imp_accu = org.python.core.imp.importFrom("macurl2path", new String[] {"url2pathname", "pathname2url"}, frame);
                frame.setlocal("url2pathname", imp_accu[0]);
                frame.setlocal("pathname2url", imp_accu[1]);
                imp_accu = null;
            }
            else if (frame.getname("os").__getattr__("name")._eq(s$33).__nonzero__()) {
                imp_accu = org.python.core.imp.importFrom("nturl2path", new String[] {"url2pathname", "pathname2url"}, frame);
                frame.setlocal("url2pathname", imp_accu[0]);
                frame.setlocal("pathname2url", imp_accu[1]);
                imp_accu = null;
            }
            else if (frame.getname("os").__getattr__("name")._eq(s$34).__nonzero__()) {
                imp_accu = org.python.core.imp.importFrom("rourl2path", new String[] {"url2pathname", "pathname2url"}, frame);
                frame.setlocal("url2pathname", imp_accu[0]);
                frame.setlocal("pathname2url", imp_accu[1]);
                imp_accu = null;
            }
            else {
                frame.setlocal("url2pathname", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_url2pathname));
                frame.setlocal("pathname2url", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_pathname2url));
            }
            frame.setlocal("_urlopener", frame.getname("None"));
            frame.setlocal("urlopen", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$2_urlopen));
            frame.setlocal("urlretrieve", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), frame.getname("None"), frame.getname("None")}, c$3_urlretrieve));
            frame.setlocal("urlcleanup", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_urlcleanup));
            frame.setlocal("ftpcache", new PyDictionary(new PyObject[] {}));
            frame.setlocal("URLopener", Py.makeClass("URLopener", new PyObject[] {}, c$23_URLopener, null));
            frame.setlocal("FancyURLopener", Py.makeClass("FancyURLopener", new PyObject[] {frame.getname("URLopener")}, c$34_FancyURLopener, null));
            frame.setlocal("_localhost", frame.getname("None"));
            frame.setlocal("localhost", new PyFunction(frame.f_globals, new PyObject[] {}, c$35_localhost));
            frame.setlocal("_thishost", frame.getname("None"));
            frame.setlocal("thishost", new PyFunction(frame.f_globals, new PyObject[] {}, c$36_thishost));
            frame.setlocal("_ftperrors", frame.getname("None"));
            frame.setlocal("ftperrors", new PyFunction(frame.f_globals, new PyObject[] {}, c$37_ftperrors));
            frame.setlocal("_noheaders", frame.getname("None"));
            frame.setlocal("noheaders", new PyFunction(frame.f_globals, new PyObject[] {}, c$38_noheaders));
            frame.setlocal("ftpwrapper", Py.makeClass("ftpwrapper", new PyObject[] {}, c$44_ftpwrapper, null));
            frame.setlocal("addbase", Py.makeClass("addbase", new PyObject[] {}, c$48_addbase, null));
            frame.setlocal("addclosehook", Py.makeClass("addclosehook", new PyObject[] {frame.getname("addbase")}, c$51_addclosehook, null));
            frame.setlocal("addinfo", Py.makeClass("addinfo", new PyObject[] {frame.getname("addbase")}, c$54_addinfo, null));
            frame.setlocal("addinfourl", Py.makeClass("addinfourl", new PyObject[] {frame.getname("addbase")}, c$58_addinfourl, null));
            frame.setlocal("basejoin", new PyFunction(frame.f_globals, new PyObject[] {}, c$59_basejoin));
            frame.setlocal("toBytes", new PyFunction(frame.f_globals, new PyObject[] {}, c$60_toBytes));
            frame.setlocal("unwrap", new PyFunction(frame.f_globals, new PyObject[] {}, c$61_unwrap));
            frame.setlocal("_typeprog", frame.getname("None"));
            frame.setlocal("splittype", new PyFunction(frame.f_globals, new PyObject[] {}, c$62_splittype));
            frame.setlocal("_hostprog", frame.getname("None"));
            frame.setlocal("splithost", new PyFunction(frame.f_globals, new PyObject[] {}, c$63_splithost));
            frame.setlocal("_userprog", frame.getname("None"));
            frame.setlocal("splituser", new PyFunction(frame.f_globals, new PyObject[] {}, c$64_splituser));
            frame.setlocal("_passwdprog", frame.getname("None"));
            frame.setlocal("splitpasswd", new PyFunction(frame.f_globals, new PyObject[] {}, c$65_splitpasswd));
            frame.setlocal("_portprog", frame.getname("None"));
            frame.setlocal("splitport", new PyFunction(frame.f_globals, new PyObject[] {}, c$66_splitport));
            frame.setlocal("_nportprog", frame.getname("None"));
            frame.setlocal("splitnport", new PyFunction(frame.f_globals, new PyObject[] {i$57.__neg__()}, c$67_splitnport));
            frame.setlocal("_queryprog", frame.getname("None"));
            frame.setlocal("splitquery", new PyFunction(frame.f_globals, new PyObject[] {}, c$68_splitquery));
            frame.setlocal("_tagprog", frame.getname("None"));
            frame.setlocal("splittag", new PyFunction(frame.f_globals, new PyObject[] {}, c$69_splittag));
            frame.setlocal("splitattr", new PyFunction(frame.f_globals, new PyObject[] {}, c$70_splitattr));
            frame.setlocal("_valueprog", frame.getname("None"));
            frame.setlocal("splitvalue", new PyFunction(frame.f_globals, new PyObject[] {}, c$71_splitvalue));
            frame.setlocal("splitgophertype", new PyFunction(frame.f_globals, new PyObject[] {}, c$72_splitgophertype));
            frame.setlocal("unquote", new PyFunction(frame.f_globals, new PyObject[] {}, c$73_unquote));
            frame.setlocal("unquote_plus", new PyFunction(frame.f_globals, new PyObject[] {}, c$74_unquote_plus));
            frame.setlocal("always_safe", s$206);
            frame.setlocal("_fast_safe_test", frame.getname("always_safe")._add(s$95));
            frame.setlocal("_fast_safe", frame.getname("None"));
            frame.setlocal("_fast_quote", new PyFunction(frame.f_globals, new PyObject[] {}, c$75__fast_quote));
            frame.setlocal("quote", new PyFunction(frame.f_globals, new PyObject[] {s$95}, c$76_quote));
            frame.setlocal("quote_plus", new PyFunction(frame.f_globals, new PyObject[] {s$58}, c$77_quote_plus));
            frame.setlocal("urlencode", new PyFunction(frame.f_globals, new PyObject[] {i$64}, c$78_urlencode));
            frame.setlocal("getproxies_environment", new PyFunction(frame.f_globals, new PyObject[] {}, c$79_getproxies_environment));
            if (frame.getname("os").__getattr__("name")._eq(s$32).__nonzero__()) {
                frame.setlocal("getproxies", new PyFunction(frame.f_globals, new PyObject[] {}, c$80_getproxies));
            }
            else if (frame.getname("os").__getattr__("name")._eq(s$33).__nonzero__()) {
                frame.setlocal("getproxies_registry", new PyFunction(frame.f_globals, new PyObject[] {}, c$81_getproxies_registry));
                frame.setlocal("getproxies", new PyFunction(frame.f_globals, new PyObject[] {}, c$82_getproxies));
            }
            else {
                frame.setlocal("getproxies", frame.getname("getproxies_environment"));
            }
            frame.setlocal("test1", new PyFunction(frame.f_globals, new PyObject[] {}, c$83_test1));
            frame.setlocal("reporthook", new PyFunction(frame.f_globals, new PyObject[] {}, c$84_reporthook));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {new PyList(new PyObject[] {})}, c$85_test));
            frame.setlocal("main", new PyFunction(frame.f_globals, new PyObject[] {}, c$86_main));
            if (frame.getname("__name__")._eq(s$252).__nonzero__()) {
                frame.getname("main").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("urllib"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "urllib";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(urllib._PyInner.class, newargs, urllib.jpy$packages, urllib.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
