import org.python.core.*;

public class Browser extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject s$3;
        private static PyObject i$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject s$7;
        private static PyObject i$8;
        private static PyObject s$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject i$15;
        private static PyObject i$16;
        private static PyObject i$17;
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
        private static PyObject s$62;
        private static PyObject s$63;
        private static PyObject i$64;
        private static PyObject i$65;
        private static PyObject s$66;
        private static PyObject i$67;
        private static PyObject s$68;
        private static PyObject s$69;
        private static PyObject i$70;
        private static PyObject i$71;
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
        private static PyObject i$82;
        private static PyObject s$83;
        private static PyObject i$84;
        private static PyObject s$85;
        private static PyObject i$86;
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
        private static PyObject i$114;
        private static PyObject s$115;
        private static PyObject i$116;
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
        private static PyObject i$137;
        private static PyObject i$138;
        private static PyObject i$139;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_actionPerformed;
        private static PyCode c$2_MyActionListener_cbLocation;
        private static PyCode c$3___init__;
        private static PyCode c$4_itemStateChanged;
        private static PyCode c$5_MyItemListener_cbLocation;
        private static PyCode c$6___init__;
        private static PyCode c$7_mouseClicked;
        private static PyCode c$8_mouseEntered;
        private static PyCode c$9_mouseExited;
        private static PyCode c$10_mousePressed;
        private static PyCode c$11_mouseReleased;
        private static PyCode c$12_MyMouseListener_btGo;
        private static PyCode c$13___init__;
        private static PyCode c$14_mouseClicked;
        private static PyCode c$15_mouseEntered;
        private static PyCode c$16_mouseExited;
        private static PyCode c$17_mousePressed;
        private static PyCode c$18_mouseReleased;
        private static PyCode c$19_MyMouseListener_btToolbar;
        private static PyCode c$20___init__;
        private static PyCode c$21_mouseClicked;
        private static PyCode c$22_mouseEntered;
        private static PyCode c$23_mouseExited;
        private static PyCode c$24_mousePressed;
        private static PyCode c$25_mouseReleased;
        private static PyCode c$26_MyMouseListener_idPad;
        private static PyCode c$27___init__;
        private static PyCode c$28_hyperlinkUpdate;
        private static PyCode c$29_MyHyperlinkListener_editor;
        private static PyCode c$30___init__;
        private static PyCode c$31_windowClosing;
        private static PyCode c$32_MyWindowAdapter;
        private static PyCode c$33___init__;
        private static PyCode c$34_buildGUI;
        private static PyCode c$35_buildMenuBar;
        private static PyCode c$36_buildToolBar;
        private static PyCode c$37_buildAddressBar;
        private static PyCode c$38_buildStatusBar;
        private static PyCode c$39_initialize;
        private static PyCode c$40_lambda;
        private static PyCode c$41_finalize;
        private static PyCode c$42_validateAll;
        private static PyCode c$43_validateFavorite;
        private static PyCode c$44_validateCache;
        private static PyCode c$45_createURL;
        private static PyCode c$46_go;
        private static PyCode c$47_retrievingPage;
        private static PyCode c$48_goToURL;
        private static PyCode c$49_onGo;
        private static PyCode c$50_onGoToFavorite;
        private static PyCode c$51_onBack;
        private static PyCode c$52_onForward;
        private static PyCode c$53_onStop;
        private static PyCode c$54_onReload;
        private static PyCode c$55_onHome;
        private static PyCode c$56_onNewWindow;
        private static PyCode c$57_onSavePageAs;
        private static PyCode c$58_onClose;
        private static PyCode c$59_onTextSizeChanged;
        private static PyCode c$60_onViewSource;
        private static PyCode c$61_onAddFavorite;
        private static PyCode c$62_onShowFavorite;
        private static PyCode c$63_onHelp;
        private static PyCode c$64_onAbout;
        private static PyCode c$65_BrowserFrame;
        private static PyCode c$66___init__;
        private static PyCode c$67_onApply;
        private static PyCode c$68_onDelete;
        private static PyCode c$69_onClose;
        private static PyCode c$70_FavoriteDialog;
        private static PyCode c$71_main;
        private static void initConstants() {
            s$0 = Py.newString("\012Programmable Web Browser v 2.0\012Module : Web Browser\012Last Updated : 28 January 2002\012Programmer : Thanawat Keawka\012                        Boontawee Suntisrivaraporn\012Professor : Dr. Visit Hirankitti                        \012===========================================\012System Requirement\012- Java 1.4\012- Jython 2.1\012\012");
            s$1 = Py.newString("cache.txt");
            s$2 = Py.newString("favorites.txt");
            s$3 = Py.newString("BrowserFrame([urlHome, frameID, isChild, idGetPage]) -> BrowserFrame Object");
            i$4 = Py.newInteger(0);
            s$5 = Py.newString("Go to \"");
            s$6 = Py.newString("\"");
            s$7 = Py.newString("Fill URL first");
            i$8 = Py.newInteger(1);
            s$9 = Py.newString("Browser ID : ");
            s$10 = Py.newString(" Active : ");
            s$11 = Py.newString("Hyperlink to : ");
            s$12 = Py.newString("<<Browser>> New Browser ID=");
            s$13 = Py.newString(" ; Active browser=");
            s$14 = Py.newString("Tahoma");
            i$15 = Py.newInteger(13);
            i$16 = Py.newInteger(800);
            i$17 = Py.newInteger(570);
            s$18 = Py.newString("PWB - Browser");
            s$19 = Py.newString("images/gear.gif");
            s$20 = Py.newString("HTML Document");
            s$21 = Py.newString("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            s$22 = Py.newString("Metal");
            s$23 = Py.newString("javax.swing.plaf.metal.MetalLookAndFeel");
            s$24 = Py.newString("Motif");
            s$25 = Py.newString("com.sun.java.swing.plaf.motif.MotifLookAndFeel");
            s$26 = Py.newString("Windows");
            s$27 = Py.newString("File");
            s$28 = Py.newString("New window");
            s$29 = Py.newString("Save page as");
            s$30 = Py.newString("Close Browser");
            s$31 = Py.newString("View");
            s$32 = Py.newString("Previous page");
            s$33 = Py.newString("Next page");
            s$34 = Py.newString("Stop");
            s$35 = Py.newString("Reload");
            s$36 = Py.newString("Home page");
            s$37 = Py.newString("Text size");
            s$38 = Py.newString("10");
            s$39 = Py.newString("11");
            s$40 = Py.newString("12");
            s$41 = Py.newString("13");
            s$42 = Py.newString("14");
            s$43 = Py.newString("15");
            s$44 = Py.newString("View source");
            s$45 = Py.newString("Favorites");
            s$46 = Py.newString("Add this page to Favorites");
            s$47 = Py.newString("Show Favorites");
            s$48 = Py.newString("Help");
            s$49 = Py.newString("How to Web Browser");
            s$50 = Py.newString("About agent program");
            s$51 = Py.newString("images/back.gif");
            i$52 = Py.newInteger(35);
            s$53 = Py.newString("Back");
            s$54 = Py.newString("images/forward.gif");
            s$55 = Py.newString("Forward");
            s$56 = Py.newString("images/stop.gif");
            s$57 = Py.newString("images/reload.gif");
            s$58 = Py.newString("images/home.gif");
            s$59 = Py.newString("Home");
            s$60 = Py.newString("images/favorite.gif");
            s$61 = Py.newString("Favorite");
            s$62 = Py.newString("images/help.gif");
            s$63 = Py.newString(" Location :");
            i$64 = Py.newInteger(60);
            i$65 = Py.newInteger(20);
            s$66 = Py.newString("Put URL here!");
            i$67 = Py.newInteger(150);
            s$68 = Py.newString("images/go_small.gif");
            s$69 = Py.newString("Go");
            i$70 = Py.newInteger(55);
            i$71 = Py.newInteger(25);
            s$72 = Py.newString("Welcome to PWB jython version");
            s$73 = Py.newString("Status Bar");
            s$74 = Py.newString("profiles/");
            s$75 = Py.newString("r");
            s$76 = Py.newString("::");
            s$77 = Py.newString("<<Browser>> Favorite-file not found!");
            s$78 = Py.newString("<<Browser>> Cache-file not found");
            s$79 = Py.newString("\012");
            s$80 = Py.newString("w");
            s$81 = Py.newString(" :: ");
            i$82 = Py.newInteger(7);
            s$83 = Py.newString("http://");
            i$84 = Py.newInteger(8);
            s$85 = Py.newString("file:///");
            i$86 = Py.newInteger(3);
            s$87 = Py.newString("www");
            s$88 = Py.newString(":\\");
            s$89 = Py.newString("<<Browser>> Bad URL!");
            s$90 = Py.newString("Bad URL");
            s$91 = Py.newString("Bad URL\012Or not support protocol");
            s$92 = Py.newString("<<Browser>> Add URL to history table");
            s$93 = Py.newString("<<Browser>> Empty page");
            s$94 = Py.newString("Empty page");
            s$95 = Py.newString("");
            s$96 = Py.newString("<<Browser>> Retrieving page");
            s$97 = Py.newString("Retrieving page");
            s$98 = Py.newString("<<Browser>> Fail in retrieving page!");
            s$99 = Py.newString("Fail to open page!");
            s$100 = Py.newString("Can not follow link!\012");
            s$101 = Py.newString("PWB -Browser");
            s$102 = Py.newString("goToURL(newURL) -> success [retrieve page and display]");
            s$103 = Py.newString("<<Browser>> Favorite :");
            s$104 = Py.newString(" = ");
            s$105 = Py.newString("   :   ");
            s$106 = Py.newString("<<Browser>> Go back");
            s$107 = Py.newString("<<Browser>> Go forward");
            s$108 = Py.newString("<<Browser>> Stop");
            s$109 = Py.newString("<<Browser>> Reload");
            s$110 = Py.newString("<<Browser>> Home");
            s$111 = Py.newString("Please type the Intenet location :");
            s$112 = Py.newString("<<Browser>> Open new page with empty url");
            s$113 = Py.newString(".");
            i$114 = Py.newInteger(4);
            s$115 = Py.newString(".htm");
            i$116 = Py.newInteger(5);
            s$117 = Py.newString(".html");
            s$118 = Py.newString("<<Browser>> File save error!! : ");
            s$119 = Py.newString("An error occur when trying to save script.");
            s$120 = Py.newString("Save as error");
            s$121 = Py.newString("source.tmp");
            s$122 = Py.newString("notepad source.tmp");
            s$123 = Py.newString("<<Browser>> Current source can be viewed by Notepad");
            s$124 = Py.newString("<<Browser>> Cannot view source");
            s$125 = Py.newString("Cannot view source");
            s$126 = Py.newString("PWB - Browser will add this page to favorite list\012Please enter name : ");
            s$127 = Py.newString("<<Browser>> Add current page to favorite list");
            s$128 = Py.newString("Help is underconstruct");
            s$129 = Py.newString("Browser");
            s$130 = Py.newString("<html><center><h3><font color=\"red\">Web Browser for PWB</font></h3></center>");
            s$131 = Py.newString("<p><b>Program by</b> <i><br>Thanawat Keawka<br>Boontawee Suntisrivaraporn</i>");
            s$132 = Py.newString("<br>Copyright &copy; 2001");
            s$133 = Py.newString("<p><b>email :</b> <a href=\"mailto:meng234@hotmail.com\"<i>meng234@hotmail.com<i></a>");
            s$134 = Py.newString("</html>");
            s$135 = Py.newString("Browser Help");
            s$136 = Py.newString("Organize Favorites");
            i$137 = Py.newInteger(330);
            i$138 = Py.newInteger(300);
            i$139 = Py.newInteger(10);
            s$140 = Py.newString("Favorite name");
            s$141 = Py.newString("Location");
            s$142 = Py.newString("Apply");
            s$143 = Py.newString("Delete");
            s$144 = Py.newString("Close");
            s$145 = Py.newString("<<Browser>> Favorites have been updated");
            s$146 = Py.newString("Favorites have been updated");
            s$147 = Py.newString("__main__");
            s$148 = Py.newString("http://www.ce.kmitl.ac.th");
            s$149 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\Browser.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_actionPerformed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "actionPerformed", false, false, funcTable, 1, null, null, 0, 1);
            c$2_MyActionListener_cbLocation = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyActionListener_cbLocation", false, false, funcTable, 2, null, null, 0, 0);
            c$3___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 3, null, null, 0, 1);
            c$4_itemStateChanged = Py.newCode(2, new String[] {"self", "event", "urlPath"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "itemStateChanged", false, false, funcTable, 4, null, null, 0, 1);
            c$5_MyItemListener_cbLocation = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyItemListener_cbLocation", false, false, funcTable, 5, null, null, 0, 0);
            c$6___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 6, null, null, 0, 1);
            c$7_mouseClicked = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseClicked", false, false, funcTable, 7, null, null, 0, 1);
            c$8_mouseEntered = Py.newCode(2, new String[] {"self", "event", "urlPath", "tip"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseEntered", false, false, funcTable, 8, null, null, 0, 1);
            c$9_mouseExited = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseExited", false, false, funcTable, 9, null, null, 0, 1);
            c$10_mousePressed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mousePressed", false, false, funcTable, 10, null, null, 0, 1);
            c$11_mouseReleased = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseReleased", false, false, funcTable, 11, null, null, 0, 1);
            c$12_MyMouseListener_btGo = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyMouseListener_btGo", false, false, funcTable, 12, null, null, 0, 0);
            c$13___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 13, null, null, 0, 1);
            c$14_mouseClicked = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseClicked", false, false, funcTable, 14, null, null, 0, 1);
            c$15_mouseEntered = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseEntered", false, false, funcTable, 15, null, null, 0, 1);
            c$16_mouseExited = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseExited", false, false, funcTable, 16, null, null, 0, 1);
            c$17_mousePressed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mousePressed", false, false, funcTable, 17, null, null, 0, 1);
            c$18_mouseReleased = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseReleased", false, false, funcTable, 18, null, null, 0, 1);
            c$19_MyMouseListener_btToolbar = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyMouseListener_btToolbar", false, false, funcTable, 19, null, null, 0, 0);
            c$20___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 20, null, null, 0, 1);
            c$21_mouseClicked = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseClicked", false, false, funcTable, 21, null, null, 0, 1);
            c$22_mouseEntered = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseEntered", false, false, funcTable, 22, null, null, 0, 1);
            c$23_mouseExited = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseExited", false, false, funcTable, 23, null, null, 0, 1);
            c$24_mousePressed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mousePressed", false, false, funcTable, 24, null, null, 0, 1);
            c$25_mouseReleased = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "mouseReleased", false, false, funcTable, 25, null, null, 0, 1);
            c$26_MyMouseListener_idPad = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyMouseListener_idPad", false, false, funcTable, 26, null, null, 0, 0);
            c$27___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 27, null, null, 0, 1);
            c$28_hyperlinkUpdate = Py.newCode(2, new String[] {"self", "event", "pane", "doc", "et", "evt"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "hyperlinkUpdate", false, false, funcTable, 28, null, null, 0, 1);
            c$29_MyHyperlinkListener_editor = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyHyperlinkListener_editor", false, false, funcTable, 29, null, null, 0, 0);
            c$30___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 30, null, null, 0, 1);
            c$31_windowClosing = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "windowClosing", false, false, funcTable, 31, null, null, 0, 1);
            c$32_MyWindowAdapter = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "MyWindowAdapter", false, false, funcTable, 32, null, null, 0, 0);
            c$33___init__ = Py.newCode(6, new String[] {"self", "urlHome", "id", "child", "getpage", "agent"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 33, null, null, 0, 1);
            c$34_buildGUI = Py.newCode(1, new String[] {"self", "app_style"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "buildGUI", false, false, funcTable, 34, null, null, 0, 1);
            c$35_buildMenuBar = Py.newCode(1, new String[] {"self", "view_textsize_menu", "fav_menu_item", "favName"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "buildMenuBar", false, false, funcTable, 35, null, null, 0, 1);
            c$36_buildToolBar = Py.newCode(1, new String[] {"self", "freespace"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "buildToolBar", false, false, funcTable, 36, null, null, 0, 1);
            c$37_buildAddressBar = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "buildAddressBar", false, false, funcTable, 37, null, null, 0, 1);
            c$38_buildStatusBar = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "buildStatusBar", false, false, funcTable, 38, null, null, 0, 1);
            c$39_initialize = Py.newCode(1, new String[] {"self", "cache", "url", "name", "favorite", "f", "favorites", "path"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "initialize", false, false, funcTable, 39, null, null, 0, 1);
            c$40_lambda = Py.newCode(1, new String[] {"x"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "<lambda>", false, false, funcTable, 40, null, null, 0, 1);
            c$41_finalize = Py.newCode(1, new String[] {"self", "cache", "favorite", "favName", "f", "favNames", "path"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "finalize", false, false, funcTable, 41, null, null, 0, 1);
            c$42_validateAll = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "validateAll", false, false, funcTable, 42, null, null, 0, 1);
            c$43_validateFavorite = Py.newCode(1, new String[] {"self", "fav_menu_item", "favName"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "validateFavorite", false, false, funcTable, 43, null, null, 0, 1);
            c$44_validateCache = Py.newCode(1, new String[] {"self", "item"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "validateCache", false, false, funcTable, 44, null, null, 0, 1);
            c$45_createURL = Py.newCode(3, new String[] {"self", "urlPath", "alert"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "createURL", false, false, funcTable, 45, null, null, 0, 1);
            c$46_go = Py.newCode(4, new String[] {"self", "urlPath", "hist", "alert"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "go", false, false, funcTable, 46, null, null, 0, 1);
            c$47_retrievingPage = Py.newCode(2, new String[] {"self", "alert"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "retrievingPage", false, false, funcTable, 47, null, null, 0, 1);
            c$48_goToURL = Py.newCode(2, new String[] {"self", "newURL"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "goToURL", false, false, funcTable, 48, null, null, 0, 1);
            c$49_onGo = Py.newCode(3, new String[] {"self", "event", "alert", "urlPath0", "urlPath", "each"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onGo", false, false, funcTable, 49, null, null, 0, 1);
            c$50_onGoToFavorite = Py.newCode(2, new String[] {"self", "event", "favURL", "favName"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onGoToFavorite", false, false, funcTable, 50, null, null, 0, 1);
            c$51_onBack = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onBack", false, false, funcTable, 51, null, null, 0, 1);
            c$52_onForward = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onForward", false, false, funcTable, 52, null, null, 0, 1);
            c$53_onStop = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onStop", false, false, funcTable, 53, null, null, 0, 1);
            c$54_onReload = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onReload", false, false, funcTable, 54, null, null, 0, 1);
            c$55_onHome = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onHome", false, false, funcTable, 55, null, null, 0, 1);
            c$56_onNewWindow = Py.newCode(2, new String[] {"self", "event", "location", "newFrame"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onNewWindow", false, false, funcTable, 56, null, null, 0, 1);
            c$57_onSavePageAs = Py.newCode(2, new String[] {"self", "event", "saveFile", "fc", "fileName", "f", "result"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onSavePageAs", false, false, funcTable, 57, null, null, 0, 1);
            c$58_onClose = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onClose", false, false, funcTable, 58, null, null, 0, 1);
            c$59_onTextSizeChanged = Py.newCode(2, new String[] {"self", "event", "newSize"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onTextSizeChanged", false, false, funcTable, 59, null, null, 0, 1);
            c$60_onViewSource = Py.newCode(2, new String[] {"self", "event", "f", "source"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onViewSource", false, false, funcTable, 60, null, null, 0, 1);
            c$61_onAddFavorite = Py.newCode(2, new String[] {"self", "event", "fav_menu_item", "favURL", "favName"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onAddFavorite", false, false, funcTable, 61, null, null, 0, 1);
            c$62_onShowFavorite = Py.newCode(2, new String[] {"self", "event", "favDialog"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onShowFavorite", false, false, funcTable, 62, null, null, 0, 1);
            c$63_onHelp = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onHelp", false, false, funcTable, 63, null, null, 0, 1);
            c$64_onAbout = Py.newCode(2, new String[] {"self", "event", "msg"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onAbout", false, false, funcTable, 64, null, null, 0, 1);
            c$65_BrowserFrame = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "BrowserFrame", false, false, funcTable, 65, null, null, 0, 0);
            c$66___init__ = Py.newCode(2, new String[] {"self", "parent", "bottom", "favName", "btDelete", "btApply", "btClose", "table", "row"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "__init__", false, false, funcTable, 66, null, null, 0, 1);
            c$67_onApply = Py.newCode(2, new String[] {"self", "event", "favName", "favURL", "table", "row"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onApply", false, false, funcTable, 67, null, null, 0, 1);
            c$68_onDelete = Py.newCode(2, new String[] {"self", "event", "delRow", "delRows"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onDelete", false, false, funcTable, 68, null, null, 0, 1);
            c$69_onClose = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "onClose", false, false, funcTable, 69, null, null, 0, 1);
            c$70_FavoriteDialog = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "FavoriteDialog", false, false, funcTable, 70, null, null, 0, 0);
            c$71_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Browser.py", "main", false, false, funcTable, 71, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$71_main == null) _PyInner.initConstants();
            return c$71_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.actionPerformed$2(frame);
                case 2:
                return _PyInner.MyActionListener_cbLocation$3(frame);
                case 3:
                return _PyInner.__init__$4(frame);
                case 4:
                return _PyInner.itemStateChanged$5(frame);
                case 5:
                return _PyInner.MyItemListener_cbLocation$6(frame);
                case 6:
                return _PyInner.__init__$7(frame);
                case 7:
                return _PyInner.mouseClicked$8(frame);
                case 8:
                return _PyInner.mouseEntered$9(frame);
                case 9:
                return _PyInner.mouseExited$10(frame);
                case 10:
                return _PyInner.mousePressed$11(frame);
                case 11:
                return _PyInner.mouseReleased$12(frame);
                case 12:
                return _PyInner.MyMouseListener_btGo$13(frame);
                case 13:
                return _PyInner.__init__$14(frame);
                case 14:
                return _PyInner.mouseClicked$15(frame);
                case 15:
                return _PyInner.mouseEntered$16(frame);
                case 16:
                return _PyInner.mouseExited$17(frame);
                case 17:
                return _PyInner.mousePressed$18(frame);
                case 18:
                return _PyInner.mouseReleased$19(frame);
                case 19:
                return _PyInner.MyMouseListener_btToolbar$20(frame);
                case 20:
                return _PyInner.__init__$21(frame);
                case 21:
                return _PyInner.mouseClicked$22(frame);
                case 22:
                return _PyInner.mouseEntered$23(frame);
                case 23:
                return _PyInner.mouseExited$24(frame);
                case 24:
                return _PyInner.mousePressed$25(frame);
                case 25:
                return _PyInner.mouseReleased$26(frame);
                case 26:
                return _PyInner.MyMouseListener_idPad$27(frame);
                case 27:
                return _PyInner.__init__$28(frame);
                case 28:
                return _PyInner.hyperlinkUpdate$29(frame);
                case 29:
                return _PyInner.MyHyperlinkListener_editor$30(frame);
                case 30:
                return _PyInner.__init__$31(frame);
                case 31:
                return _PyInner.windowClosing$32(frame);
                case 32:
                return _PyInner.MyWindowAdapter$33(frame);
                case 33:
                return _PyInner.__init__$34(frame);
                case 34:
                return _PyInner.buildGUI$35(frame);
                case 35:
                return _PyInner.buildMenuBar$36(frame);
                case 36:
                return _PyInner.buildToolBar$37(frame);
                case 37:
                return _PyInner.buildAddressBar$38(frame);
                case 38:
                return _PyInner.buildStatusBar$39(frame);
                case 39:
                return _PyInner.initialize$40(frame);
                case 40:
                return _PyInner.lambda$41(frame);
                case 41:
                return _PyInner.finalize$42(frame);
                case 42:
                return _PyInner.validateAll$43(frame);
                case 43:
                return _PyInner.validateFavorite$44(frame);
                case 44:
                return _PyInner.validateCache$45(frame);
                case 45:
                return _PyInner.createURL$46(frame);
                case 46:
                return _PyInner.go$47(frame);
                case 47:
                return _PyInner.retrievingPage$48(frame);
                case 48:
                return _PyInner.goToURL$49(frame);
                case 49:
                return _PyInner.onGo$50(frame);
                case 50:
                return _PyInner.onGoToFavorite$51(frame);
                case 51:
                return _PyInner.onBack$52(frame);
                case 52:
                return _PyInner.onForward$53(frame);
                case 53:
                return _PyInner.onStop$54(frame);
                case 54:
                return _PyInner.onReload$55(frame);
                case 55:
                return _PyInner.onHome$56(frame);
                case 56:
                return _PyInner.onNewWindow$57(frame);
                case 57:
                return _PyInner.onSavePageAs$58(frame);
                case 58:
                return _PyInner.onClose$59(frame);
                case 59:
                return _PyInner.onTextSizeChanged$60(frame);
                case 60:
                return _PyInner.onViewSource$61(frame);
                case 61:
                return _PyInner.onAddFavorite$62(frame);
                case 62:
                return _PyInner.onShowFavorite$63(frame);
                case 63:
                return _PyInner.onHelp$64(frame);
                case 64:
                return _PyInner.onAbout$65(frame);
                case 65:
                return _PyInner.BrowserFrame$66(frame);
                case 66:
                return _PyInner.__init__$67(frame);
                case 67:
                return _PyInner.onApply$68(frame);
                case 68:
                return _PyInner.onDelete$69(frame);
                case 69:
                return _PyInner.onClose$70(frame);
                case 70:
                return _PyInner.FavoriteDialog$71(frame);
                case 71:
                return _PyInner.main$72(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            frame.getlocal(0).__setattr__("current", i$4);
            frame.getlocal(0).__setattr__("last", i$4);
            return Py.None;
        }
        
        private static PyObject actionPerformed$2(PyFrame frame) {
            frame.getlocal(0).__setattr__("current", frame.getlocal(1).invoke("getWhen"));
            if (frame.getlocal(0).__getattr__("current")._eq(frame.getlocal(0).__getattr__("last")).__nonzero__()) {
                return Py.None;
            }
            frame.getlocal(0).__setattr__("last", frame.getlocal(0).__getattr__("current"));
            frame.getlocal(0).__getattr__("parent").invoke("onGo", frame.getglobal("None"));
            return Py.None;
        }
        
        private static PyObject MyActionListener_cbLocation$3(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$0___init__));
            frame.setlocal("actionPerformed", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_actionPerformed));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$4(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject itemStateChanged$5(PyFrame frame) {
            Py.println(frame.getlocal(1).invoke("getWhen"));
            frame.setlocal(2, frame.getlocal(0).__getattr__("parent").__getattr__("cbLocation").invoke("getSelectedItem"));
            frame.getlocal(0).__getattr__("parent").invoke("go", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject MyItemListener_cbLocation$6(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$3___init__));
            frame.setlocal("itemStateChanged", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_itemStateChanged));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$7(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject mouseClicked$8(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mouseEntered$9(PyFrame frame) {
            frame.setlocal(2, frame.getlocal(0).__getattr__("parent").__getattr__("cbLocation").invoke("getEditor").invoke("getItem"));
            if (frame.getlocal(2).__nonzero__()) {
                frame.setlocal(3, s$5._add(frame.getlocal(2))._add(s$6));
            }
            else {
                frame.setlocal(3, s$7);
            }
            frame.getlocal(0).__getattr__("parent").__getattr__("btGo").invoke("setToolTipText", frame.getlocal(3));
            frame.getlocal(1).invoke("getComponent").invoke("setBorderPainted", i$8);
            return Py.None;
        }
        
        private static PyObject mouseExited$10(PyFrame frame) {
            frame.getlocal(1).invoke("getComponent").invoke("setBorderPainted", i$4);
            return Py.None;
        }
        
        private static PyObject mousePressed$11(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mouseReleased$12(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject MyMouseListener_btGo$13(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$6___init__));
            frame.setlocal("mouseClicked", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_mouseClicked));
            frame.setlocal("mouseEntered", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_mouseEntered));
            frame.setlocal("mouseExited", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_mouseExited));
            frame.setlocal("mousePressed", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_mousePressed));
            frame.setlocal("mouseReleased", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_mouseReleased));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$14(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject mouseClicked$15(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mouseEntered$16(PyFrame frame) {
            frame.getlocal(1).invoke("getComponent").invoke("setBorderPainted", i$8);
            return Py.None;
        }
        
        private static PyObject mouseExited$17(PyFrame frame) {
            frame.getlocal(1).invoke("getComponent").invoke("setBorderPainted", i$4);
            return Py.None;
        }
        
        private static PyObject mousePressed$18(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mouseReleased$19(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject MyMouseListener_btToolbar$20(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$13___init__));
            frame.setlocal("mouseClicked", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_mouseClicked));
            frame.setlocal("mouseEntered", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_mouseEntered));
            frame.setlocal("mouseExited", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_mouseExited));
            frame.setlocal("mousePressed", new PyFunction(frame.f_globals, new PyObject[] {}, c$17_mousePressed));
            frame.setlocal("mouseReleased", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_mouseReleased));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$21(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject mouseClicked$22(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mouseEntered$23(PyFrame frame) {
            frame.getlocal(0).__getattr__("parent").__getattr__("idPad").invoke("setToolTipText", s$9._add(frame.getglobal("str").__call__(frame.getlocal(0).__getattr__("parent").__getattr__("id")))._add(s$10)._add(frame.getglobal("str").__call__(frame.getglobal("BrowserFrame").__getattr__("activeCount"))));
            return Py.None;
        }
        
        private static PyObject mouseExited$24(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mousePressed$25(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject mouseReleased$26(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject MyMouseListener_idPad$27(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$20___init__));
            frame.setlocal("mouseClicked", new PyFunction(frame.f_globals, new PyObject[] {}, c$21_mouseClicked));
            frame.setlocal("mouseEntered", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_mouseEntered));
            frame.setlocal("mouseExited", new PyFunction(frame.f_globals, new PyObject[] {}, c$23_mouseExited));
            frame.setlocal("mousePressed", new PyFunction(frame.f_globals, new PyObject[] {}, c$24_mousePressed));
            frame.setlocal("mouseReleased", new PyFunction(frame.f_globals, new PyObject[] {}, c$25_mouseReleased));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$28(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject hyperlinkUpdate$29(PyFrame frame) {
            frame.setlocal(4, frame.getlocal(1).invoke("getEventType"));
            frame.getlocal(0).__setattr__("url", frame.getlocal(1).invoke("getURL"));
            frame.getlocal(0).__getattr__("parent").__getattr__("status").invoke("setText", s$11._add(frame.getlocal(0).__getattr__("url").invoke("toString")));
            if (frame.getlocal(4)._eq(frame.getglobal("HyperlinkEvent").__getattr__("EventType").__getattr__("ACTIVATED")).__nonzero__()) {
                frame.setlocal(2, frame.getlocal(1).invoke("getSource"));
                if (frame.getglobal("isinstance").__call__(frame.getlocal(1), frame.getglobal("HTMLFrameHyperlinkEvent")).__nonzero__()) {
                    frame.setlocal(5, frame.getlocal(1));
                    frame.setlocal(3, frame.getlocal(2).invoke("getDocument"));
                    frame.getlocal(3).invoke("processHTMLFrameHyperlinkEvent", frame.getlocal(5));
                }
                else {
                    frame.getlocal(0).__getattr__("parent").invoke("go", frame.getlocal(0).__getattr__("url").invoke("toString"));
                    frame.getlocal(0).__getattr__("parent").__getattr__("cbLocation").invoke("getEditor").invoke("setItem", frame.getlocal(0).__getattr__("url").invoke("toString"));
                }
            }
            return Py.None;
        }
        
        private static PyObject MyHyperlinkListener_editor$30(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$27___init__));
            frame.setlocal("hyperlinkUpdate", new PyFunction(frame.f_globals, new PyObject[] {}, c$28_hyperlinkUpdate));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$31(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject windowClosing$32(PyFrame frame) {
            frame.getlocal(0).__getattr__("parent").invoke("onClose", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject MyWindowAdapter$33(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$30___init__));
            frame.setlocal("windowClosing", new PyFunction(frame.f_globals, new PyObject[] {}, c$31_windowClosing));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$34(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            try {
                t$0$PyObject = i$8;
                t$1$PyObject = frame.getglobal("BrowserFrame");
                t$1$PyObject.__setattr__("activeCount", t$1$PyObject.__getattr__("activeCount").__iadd__(t$0$PyObject));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                frame.getglobal("BrowserFrame").__setattr__("activeCount", i$8);
            }
            Py.printComma(s$12);
            Py.printComma(frame.getlocal(2));
            Py.printComma(s$13);
            Py.println(frame.getglobal("BrowserFrame").__getattr__("activeCount"));
            frame.getlocal(0).__setattr__("agent", frame.getlocal(5));
            frame.getlocal(0).__setattr__("urlHome", frame.getlocal(1));
            frame.getlocal(0).__setattr__("id", frame.getlocal(2));
            frame.getlocal(0).__setattr__("exit_when_term", frame.getlocal(3).__not__());
            frame.getlocal(0).__setattr__("fontName", s$14);
            frame.getlocal(0).__setattr__("fontSize", i$15);
            frame.getlocal(0).invoke("addWindowListener", frame.getlocal(0).invoke("MyWindowAdapter", frame.getlocal(0)));
            frame.getlocal(0).invoke("initialize");
            frame.getlocal(0).invoke("buildGUI");
            if (frame.getlocal(4).__nonzero__()) {
                frame.getlocal(0).invoke("onGo", frame.getglobal("None"));
            }
            return Py.None;
        }
        
        private static PyObject buildGUI$35(PyFrame frame) {
            frame.getlocal(0).invoke("setSize", i$16, i$17);
            frame.getlocal(0).invoke("setTitle", s$18);
            frame.getlocal(0).invoke("setIconImage", frame.getglobal("ImageIcon").__call__(s$19).invoke("getImage"));
            frame.getlocal(0).invoke("buildMenuBar");
            frame.getlocal(0).invoke("buildToolBar");
            frame.getlocal(0).invoke("buildAddressBar");
            frame.getlocal(0).invoke("buildStatusBar");
            frame.getlocal(0).__setattr__("top", frame.getglobal("JPanel").__call__());
            frame.getlocal(0).__getattr__("top").invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.getlocal(0).__getattr__("top").invoke("add", frame.getlocal(0).__getattr__("toolbar"), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(0).__getattr__("top").invoke("add", frame.getlocal(0).__getattr__("addbar"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(0).invoke("setJMenuBar", frame.getlocal(0).__getattr__("mainMenu"));
            frame.getlocal(0).__setattr__("editor", frame.getglobal("JEditorPane").__call__());
            frame.getlocal(0).__getattr__("editor").invoke("setEditable", i$4);
            frame.getlocal(0).__getattr__("editor").invoke("setToolTipText", s$20);
            frame.getlocal(0).__getattr__("editor").invoke("addHyperlinkListener", frame.getlocal(0).invoke("MyHyperlinkListener_editor", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("editor").invoke("setFont", frame.getglobal("Font").__call__(frame.getlocal(0).__getattr__("fontName"), frame.getglobal("Font").__getattr__("PLAIN"), frame.getlocal(0).__getattr__("fontSize")));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("top"), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("statusbar"), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("editor")), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            if (frame.getlocal(0).__getattr__("agent").__not__().__nonzero__()) {
                frame.setlocal(1, s$21);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$22).__nonzero__()) {
                frame.setlocal(1, s$23);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$24).__nonzero__()) {
                frame.setlocal(1, s$25);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$26).__nonzero__()) {
                frame.setlocal(1, s$21);
            }
            else {
                frame.setlocal(1, frame.getglobal("UIManager").__getattr__("getSystemLookAndFeelClassName").__call__());
            }
            frame.getglobal("UIManager").__getattr__("setLookAndFeel").__call__(frame.getlocal(1));
            frame.getglobal("SwingUtilities").__getattr__("updateComponentTreeUI").__call__(frame.getlocal(0));
            return Py.None;
        }
        
        private static PyObject buildMenuBar$36(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getlocal(0).__setattr__("mainMenu", frame.getglobal("JMenuBar").__call__());
            frame.getlocal(0).__setattr__("file_menu", frame.getglobal("JMenu").__call__(s$27));
            frame.getlocal(0).__getattr__("file_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$28, frame.getlocal(0).__getattr__("onNewWindow")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("file_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$29, frame.getlocal(0).__getattr__("onSavePageAs")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("file_menu").invoke("addSeparator");
            frame.getlocal(0).__getattr__("file_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$30, frame.getlocal(0).__getattr__("onClose")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("mainMenu").invoke("add", frame.getlocal(0).__getattr__("file_menu"));
            frame.getlocal(0).__setattr__("view_menu", frame.getglobal("JMenu").__call__(s$31));
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$32, frame.getlocal(0).__getattr__("onBack")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$33, frame.getlocal(0).__getattr__("onForward")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$34, frame.getlocal(0).__getattr__("onStop")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$35, frame.getlocal(0).__getattr__("onReload")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$36, frame.getlocal(0).__getattr__("onHome")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("view_menu").invoke("addSeparator");
            frame.setlocal(1, frame.getglobal("JMenu").__call__(s$37));
            frame.getlocal(1).invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$38, frame.getlocal(0).__getattr__("onTextSizeChanged")}, new String[] {"actionPerformed"}));
            frame.getlocal(1).invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$39, frame.getlocal(0).__getattr__("onTextSizeChanged")}, new String[] {"actionPerformed"}));
            frame.getlocal(1).invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$40, frame.getlocal(0).__getattr__("onTextSizeChanged")}, new String[] {"actionPerformed"}));
            frame.getlocal(1).invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$41, frame.getlocal(0).__getattr__("onTextSizeChanged")}, new String[] {"actionPerformed"}));
            frame.getlocal(1).invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$42, frame.getlocal(0).__getattr__("onTextSizeChanged")}, new String[] {"actionPerformed"}));
            frame.getlocal(1).invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$43, frame.getlocal(0).__getattr__("onTextSizeChanged")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getlocal(1));
            frame.getlocal(0).__getattr__("view_menu").invoke("addSeparator");
            frame.getlocal(0).__getattr__("view_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$44, frame.getlocal(0).__getattr__("onViewSource")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("mainMenu").invoke("add", frame.getlocal(0).__getattr__("view_menu"));
            frame.getlocal(0).__setattr__("favorite_menu", frame.getglobal("JMenu").__call__(s$45));
            frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$46, frame.getlocal(0).__getattr__("onAddFavorite")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$47, frame.getlocal(0).__getattr__("onShowFavorite")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("favorite_menu").invoke("addSeparator");
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("favorites").invoke("keys");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.setlocal(2, frame.getglobal("JMenuItem").__call__(new PyObject[] {frame.getlocal(3), frame.getlocal(0).__getattr__("onGoToFavorite")}, new String[] {"actionPerformed"}));
                frame.getlocal(2).invoke("setToolTipText", frame.getlocal(0).__getattr__("favorites").__getitem__(frame.getlocal(3)));
                frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getlocal(2));
            }
            frame.getlocal(0).__getattr__("mainMenu").invoke("add", frame.getlocal(0).__getattr__("favorite_menu"));
            frame.getlocal(0).__setattr__("help_menu", frame.getglobal("JMenu").__call__(s$48));
            frame.getlocal(0).__getattr__("help_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$49, frame.getlocal(0).__getattr__("onHelp")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("help_menu").invoke("addSeparator");
            frame.getlocal(0).__getattr__("help_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$50, frame.getlocal(0).__getattr__("onAbout")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("mainMenu").invoke("add", frame.getlocal(0).__getattr__("help_menu"));
            return Py.None;
        }
        
        private static PyObject buildToolBar$37(PyFrame frame) {
            frame.getlocal(0).__setattr__("toolbar", frame.getglobal("JToolBar").__call__());
            frame.getlocal(0).__getattr__("toolbar").invoke("setBorderPainted", i$8);
            frame.getlocal(0).__getattr__("toolbar").invoke("setFloatable", i$4);
            frame.getlocal(0).__setattr__("btBack", frame.getglobal("JButton").__call__(new PyObject[] {frame.getglobal("ImageIcon").__call__(s$51), frame.getlocal(0).__getattr__("onBack")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btBack").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btBack").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btBack").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btBack").invoke("setToolTipText", s$53);
            frame.getlocal(0).__setattr__("btForward", frame.getglobal("JButton").__call__(new PyObject[] {frame.getglobal("ImageIcon").__call__(s$54), frame.getlocal(0).__getattr__("onForward")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btForward").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btForward").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btForward").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btForward").invoke("setToolTipText", s$55);
            frame.getlocal(0).__setattr__("btStop", frame.getglobal("JButton").__call__(new PyObject[] {frame.getglobal("ImageIcon").__call__(s$56), frame.getlocal(0).__getattr__("onStop")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btStop").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btStop").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btStop").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btStop").invoke("setToolTipText", s$34);
            frame.getlocal(0).__setattr__("btReload", frame.getglobal("JButton").__call__(new PyObject[] {frame.getglobal("ImageIcon").__call__(s$57), frame.getlocal(0).__getattr__("onReload")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btReload").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btReload").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btReload").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btReload").invoke("setToolTipText", s$35);
            frame.getlocal(0).__setattr__("btHome", frame.getglobal("JButton").__call__(new PyObject[] {frame.getglobal("ImageIcon").__call__(s$58), frame.getlocal(0).__getattr__("onHome")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btHome").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btHome").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btHome").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btHome").invoke("setToolTipText", s$59);
            frame.getlocal(0).__setattr__("iconFavorite", frame.getglobal("ImageIcon").__call__(s$60));
            frame.getlocal(0).__setattr__("btFavorite", frame.getglobal("JButton").__call__(new PyObject[] {frame.getlocal(0).__getattr__("iconFavorite"), frame.getlocal(0).__getattr__("onShowFavorite")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btFavorite").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btFavorite").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btFavorite").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btFavorite").invoke("setToolTipText", s$61);
            frame.setlocal(1, frame.getglobal("JPanel").__call__());
            frame.getlocal(1).invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.getlocal(0).__setattr__("iconHelp", frame.getglobal("ImageIcon").__call__(s$62));
            frame.getlocal(0).__setattr__("btHelp", frame.getglobal("JButton").__call__(new PyObject[] {frame.getlocal(0).__getattr__("iconHelp"), frame.getlocal(0).__getattr__("onHelp")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btHelp").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$52, i$52));
            frame.getlocal(0).__getattr__("btHelp").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btToolbar", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btHelp").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btHelp").invoke("setToolTipText", s$48);
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btBack"));
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btForward"));
            frame.getlocal(0).__getattr__("toolbar").invoke("addSeparator");
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btStop"));
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btReload"));
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btHome"));
            frame.getlocal(0).__getattr__("toolbar").invoke("addSeparator");
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btFavorite"));
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(1));
            frame.getlocal(0).__getattr__("toolbar").invoke("add", frame.getlocal(0).__getattr__("btHelp"));
            return Py.None;
        }
        
        private static PyObject buildAddressBar$38(PyFrame frame) {
            frame.getlocal(0).__setattr__("addbar", frame.getglobal("JToolBar").__call__());
            frame.getlocal(0).__getattr__("addbar").invoke("setFloatable", i$4);
            frame.getlocal(0).__setattr__("lbLocation", frame.getglobal("JLabel").__call__(s$63));
            frame.getlocal(0).__getattr__("lbLocation").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$64, i$65));
            frame.getlocal(0).__setattr__("cbLocation", frame.getglobal("JComboBox").__call__(frame.getlocal(0).__getattr__("cache")));
            frame.getlocal(0).__getattr__("cbLocation").invoke("setEditable", i$8);
            frame.getlocal(0).__getattr__("cbLocation").invoke("setSelectedItem", frame.getlocal(0).__getattr__("urlHome"));
            frame.getlocal(0).__getattr__("cbLocation").invoke("addActionListener", frame.getlocal(0).invoke("MyActionListener_cbLocation", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("cbLocation").invoke("setToolTipText", s$66);
            frame.getlocal(0).__getattr__("cbLocation").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$67, i$65));
            frame.getlocal(0).__setattr__("iconGo", frame.getglobal("ImageIcon").__call__(s$68));
            frame.getlocal(0).__setattr__("btGo", frame.getglobal("JButton").__call__(new PyObject[] {s$69, frame.getlocal(0).__getattr__("iconGo"), frame.getlocal(0).__getattr__("onGo")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("btGo").invoke("setBorder", frame.getglobal("BorderFactory").__getattr__("createRaisedBevelBorder").__call__());
            frame.getlocal(0).__getattr__("btGo").invoke("setBorderPainted", i$4);
            frame.getlocal(0).__getattr__("btGo").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$70, i$71));
            frame.getlocal(0).__getattr__("btGo").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_btGo", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("btGo").invoke("setToolTipText", frame.getlocal(0).__getattr__("cbLocation").invoke("getSelectedItem"));
            frame.getlocal(0).__getattr__("addbar").invoke("add", frame.getlocal(0).__getattr__("lbLocation"));
            frame.getlocal(0).__getattr__("addbar").invoke("add", frame.getlocal(0).__getattr__("cbLocation"));
            frame.getlocal(0).__getattr__("addbar").invoke("add", frame.getlocal(0).__getattr__("btGo"));
            return Py.None;
        }
        
        private static PyObject buildStatusBar$39(PyFrame frame) {
            frame.getlocal(0).__setattr__("statusbar", frame.getglobal("JPanel").__call__());
            frame.getlocal(0).__getattr__("statusbar").invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.getlocal(0).__setattr__("status", frame.getglobal("JLabel").__call__());
            frame.getlocal(0).__getattr__("status").invoke("setText", s$72);
            frame.getlocal(0).__getattr__("status").invoke("setToolTipText", s$73);
            frame.getlocal(0).__setattr__("idPad", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("idPad").invoke("setText", frame.getglobal("str").__call__(frame.getlocal(0).__getattr__("id")));
            frame.getlocal(0).__getattr__("idPad").invoke("setEditable", i$4);
            frame.getlocal(0).__getattr__("idPad").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$71, i$65));
            frame.getlocal(0).__getattr__("idPad").invoke("setToolTipText", s$9._add(frame.getglobal("str").__call__(frame.getlocal(0).__getattr__("id")))._add(s$10)._add(frame.getglobal("str").__call__(frame.getglobal("BrowserFrame").__getattr__("activeCount"))));
            frame.getlocal(0).__getattr__("idPad").invoke("addMouseListener", frame.getlocal(0).invoke("MyMouseListener_idPad", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("statusbar").invoke("add", frame.getlocal(0).__getattr__("idPad"), frame.getglobal("BorderLayout").__getattr__("EAST"));
            frame.getlocal(0).__getattr__("statusbar").invoke("add", frame.getlocal(0).__getattr__("status"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            return Py.None;
        }
        
        private static PyObject initialize$40(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getlocal(0).__setattr__("hist", new PyDictionary(new PyObject[] {}));
            frame.getlocal(0).__setattr__("curHist", i$4);
            frame.getlocal(0).__setattr__("favorites", new PyDictionary(new PyObject[] {}));
            try {
                if (frame.getlocal(0).__getattr__("agent").__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(0).__getattr__("agent").__getattr__("user_path")._add(frame.getglobal("BROWSER_FAV_FILE")));
                }
                else {
                    frame.setlocal(7, s$74._add(frame.getglobal("BROWSER_FAV_FILE")));
                }
                frame.setlocal(5, frame.getglobal("open").__call__(frame.getlocal(7), s$75));
                frame.setlocal(6, frame.getlocal(5).invoke("readlines"));
                frame.getlocal(5).invoke("close");
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(6);
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(4, t$0$PyObject);
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("map").__call__(frame.getglobal("string").__getattr__("strip"), frame.getlocal(4).invoke("split", s$76)), 2);
                    frame.setlocal(3, t$0$PyObject__[0]);
                    frame.setlocal(2, t$0$PyObject__[1]);
                    frame.getlocal(0).__getattr__("favorites").__setitem__(frame.getlocal(3), frame.getlocal(2));
                }
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$77);
                frame.getlocal(0).__setattr__("favorites", new PyDictionary(new PyObject[] {}));
            }
            try {
                if (frame.getlocal(0).__getattr__("agent").__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(0).__getattr__("agent").__getattr__("user_path")._add(frame.getglobal("BROWSER_CACHE_FILE")));
                }
                else {
                    frame.setlocal(7, s$74._add(frame.getglobal("BROWSER_CACHE_FILE")));
                }
                frame.setlocal(5, frame.getglobal("open").__call__(frame.getlocal(7), s$75));
                frame.setlocal(1, frame.getlocal(5).invoke("readlines"));
                frame.getlocal(5).invoke("close");
                frame.getlocal(0).__setattr__("cache", frame.getglobal("map").__call__(frame.getglobal("string").__getattr__("strip"), frame.getlocal(1)));
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                Py.println(s$78);
                frame.getlocal(0).__setattr__("cache", new PyList(new PyObject[] {}));
            }
            return Py.None;
        }
        
        private static PyObject lambda$41(PyFrame frame) {
            return frame.getlocal(0)._add(s$79);
        }
        
        private static PyObject finalize$42(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            if (frame.getlocal(0).__getattr__("agent").__nonzero__()) {
                frame.setlocal(6, frame.getlocal(0).__getattr__("agent").__getattr__("user_path")._add(frame.getglobal("BROWSER_CACHE_FILE")));
            }
            else {
                frame.setlocal(6, s$74._add(frame.getglobal("BROWSER_CACHE_FILE")));
            }
            frame.setlocal(1, frame.getglobal("map").__call__(new PyFunction(frame.f_globals, new PyObject[] {}, c$40_lambda), frame.getlocal(0).__getattr__("cache")));
            frame.setlocal(4, frame.getglobal("open").__call__(frame.getlocal(6), s$80));
            frame.getlocal(4).invoke("writelines", frame.getlocal(1));
            frame.getlocal(4).invoke("close");
            if (frame.getlocal(0).__getattr__("agent").__nonzero__()) {
                frame.setlocal(6, frame.getlocal(0).__getattr__("agent").__getattr__("user_path")._add(frame.getglobal("BROWSER_FAV_FILE")));
            }
            else {
                frame.setlocal(6, s$74._add(frame.getglobal("BROWSER_FAV_FILE")));
            }
            frame.setlocal(4, frame.getglobal("open").__call__(frame.getlocal(6), s$80));
            frame.setlocal(5, frame.getlocal(0).__getattr__("favorites").invoke("keys"));
            frame.getlocal(5).invoke("sort");
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(5);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.setlocal(2, frame.getlocal(3)._add(s$81)._add(frame.getlocal(0).__getattr__("favorites").__getitem__(frame.getlocal(3)))._add(s$79));
                frame.getlocal(4).invoke("write", frame.getlocal(2));
            }
            frame.getlocal(4).invoke("close");
            return Py.None;
        }
        
        private static PyObject validateAll$43(PyFrame frame) {
            frame.getlocal(0).invoke("initialize");
            frame.getlocal(0).invoke("validateFavorite");
            frame.getlocal(0).invoke("validateCache");
            return Py.None;
        }
        
        private static PyObject validateFavorite$44(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getlocal(0).__getattr__("favorite_menu").invoke("removeAll");
            frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$46, frame.getlocal(0).__getattr__("onAddFavorite")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getglobal("JMenuItem").__call__(new PyObject[] {s$47, frame.getlocal(0).__getattr__("onShowFavorite")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("favorite_menu").invoke("addSeparator");
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("favorites").invoke("keys");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.setlocal(1, frame.getglobal("JMenuItem").__call__(new PyObject[] {frame.getlocal(2), frame.getlocal(0).__getattr__("onGoToFavorite")}, new String[] {"actionPerformed"}));
                frame.getlocal(1).invoke("setToolTipText", frame.getlocal(0).__getattr__("favorites").__getitem__(frame.getlocal(2)));
                frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getlocal(1));
            }
            return Py.None;
        }
        
        private static PyObject validateCache$45(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getlocal(0).__getattr__("cbLocation").invoke("removeAllItems");
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("cache");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(1, t$0$PyObject);
                frame.getlocal(0).__getattr__("cbLocation").invoke("addItem", frame.getlocal(1));
            }
            return Py.None;
        }
        
        private static PyObject createURL$46(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            if (frame.getlocal(1).__not__().__nonzero__()) {
                frame.getlocal(0).__setattr__("url", frame.getglobal("None"));
                return i$8;
            }
            else if (((t$0$PyObject = frame.getlocal(1).__getslice__(i$4, i$82, null)._eq(s$83)).__nonzero__() ? t$0$PyObject : frame.getlocal(1).__getslice__(i$4, i$84, null)._eq(s$85)).__nonzero__()) {
                // pass
            }
            else if (frame.getlocal(1).__getslice__(i$4, i$86, null)._eq(s$87).__nonzero__()) {
                frame.setlocal(1, s$83._add(frame.getlocal(1)));
            }
            else if (frame.getlocal(1).__getslice__(i$8, i$86, null)._eq(s$88).__nonzero__()) {
                frame.setlocal(1, s$85._add(frame.getlocal(1)));
            }
            else {
                // pass
            }
            try {
                frame.getlocal(0).__setattr__("url", frame.getglobal("URL").__call__(frame.getlocal(1)));
                return i$8;
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                return i$4;
            }
        }
        
        private static PyObject go$47(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            if (frame.getlocal(0).invoke("createURL", frame.getlocal(1), frame.getlocal(3)).__not__().__nonzero__()) {
                Py.println(s$89);
                frame.getlocal(0).__getattr__("status").invoke("setText", s$90);
                if (frame.getlocal(3).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(frame.getlocal(0), s$91);
                }
                return Py.None;
            }
            frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("retrievingPage"), new PyTuple(new PyObject[] {frame.getlocal(3)}));
            if (frame.getlocal(2).__nonzero__()) {
                Py.println(s$92);
                t$0$PyObject = i$8;
                t$1$PyObject = frame.getlocal(0);
                t$1$PyObject.__setattr__("curHist", t$1$PyObject.__getattr__("curHist").__iadd__(t$0$PyObject));
                frame.getlocal(0).__getattr__("hist").__setitem__(frame.getlocal(0).__getattr__("curHist"), frame.getlocal(1));
            }
            return Py.None;
        }
        
        private static PyObject retrievingPage$48(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            if (frame.getlocal(0).__getattr__("url").__not__().__nonzero__()) {
                Py.println(s$93);
                frame.getlocal(0).__getattr__("status").invoke("setText", s$94);
                frame.getlocal(0).__getattr__("editor").invoke("setText", s$95);
                return Py.None;
            }
            frame.getlocal(0).invoke("setCursor", frame.getglobal("Cursor").__getattr__("getPredefinedCursor").__call__(frame.getglobal("Cursor").__getattr__("WAIT_CURSOR")));
            try {
                Py.println(s$96);
                frame.getlocal(0).__getattr__("status").invoke("setText", s$97);
                frame.getlocal(0).__getattr__("editor").invoke("setPage", frame.getlocal(0).__getattr__("url"));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                frame.getlocal(0).invoke("setCursor", frame.getglobal("Cursor").__getattr__("getPredefinedCursor").__call__(frame.getglobal("Cursor").__getattr__("DEFAULT_CURSOR")));
                Py.println(s$98);
                frame.getlocal(0).__getattr__("status").invoke("setText", s$99);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$100._add(frame.getlocal(0).__getattr__("url").invoke("toString")), s$101, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
            }
            frame.getlocal(0).invoke("setCursor", frame.getglobal("Cursor").__getattr__("getPredefinedCursor").__call__(frame.getglobal("Cursor").__getattr__("DEFAULT_CURSOR")));
            return Py.None;
        }
        
        private static PyObject goToURL$49(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* goToURL(newURL) -> success [retrieve page and display] */
            if (frame.getlocal(0).invoke("createURL", frame.getlocal(1), i$4).__not__().__nonzero__()) {
                return i$4;
            }
            try {
                frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("setItem", frame.getlocal(1));
                frame.getlocal(0).__getattr__("status").invoke("setText", s$97);
                frame.getlocal(0).__getattr__("editor").invoke("setPage", frame.getlocal(0).__getattr__("url"));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                return i$4;
            }
            return i$8;
        }
        
        private static PyObject onGo$50(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(3, frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("getItem").invoke("strip"));
            try {
                frame.setlocal(4, frame.getglobal("eval").__call__(frame.getlocal(3), frame.getlocal(0).__getattr__("agent").__getattr__("agentNameSpace")));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                frame.setlocal(4, frame.getlocal(3));
            }
            frame.getlocal(0).invoke("go", new PyObject[] {frame.getlocal(4), i$8, frame.getlocal(2)});
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("cache");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(5, t$0$PyObject);
                if (frame.getlocal(4)._eq(frame.getlocal(5)).__nonzero__()) {
                    return Py.None;
                }
            }
            frame.getlocal(0).__getattr__("cbLocation").invoke("addItem", frame.getlocal(4));
            frame.getlocal(0).__getattr__("cache").invoke("append", frame.getlocal(4));
            return Py.None;
        }
        
        private static PyObject onGoToFavorite$51(PyFrame frame) {
            frame.setlocal(3, frame.getlocal(1).invoke("getActionCommand"));
            frame.setlocal(2, frame.getlocal(0).__getattr__("favorites").__getitem__(frame.getlocal(3)));
            Py.printComma(s$103);
            Py.printComma(frame.getlocal(3));
            Py.printComma(s$104);
            Py.println(frame.getlocal(2));
            frame.getlocal(0).invoke("go", frame.getlocal(2));
            frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("setItem", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject onBack$52(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            Py.printComma(frame.getlocal(0).__getattr__("curHist"));
            Py.printComma(s$105);
            Py.println(frame.getlocal(0).__getattr__("hist"));
            t$0$PyObject = i$8;
            t$1$PyObject = frame.getlocal(0);
            t$1$PyObject.__setattr__("curHist", t$1$PyObject.__getattr__("curHist").__isub__(t$0$PyObject));
            Py.println(frame.getlocal(0).__getattr__("curHist"));
            try {
                Py.println(s$106);
                frame.getlocal(0).invoke("go", frame.getlocal(0).__getattr__("hist").__getitem__(frame.getlocal(0).__getattr__("curHist")), i$4);
                frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("setItem", frame.getlocal(0).__getattr__("hist").__getitem__(frame.getlocal(0).__getattr__("curHist")));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                t$0$PyObject = i$8;
                t$1$PyObject = frame.getlocal(0);
                t$1$PyObject.__setattr__("curHist", t$1$PyObject.__getattr__("curHist").__iadd__(t$0$PyObject));
            }
            return Py.None;
        }
        
        private static PyObject onForward$53(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            t$0$PyObject = i$8;
            t$1$PyObject = frame.getlocal(0);
            t$1$PyObject.__setattr__("curHist", t$1$PyObject.__getattr__("curHist").__iadd__(t$0$PyObject));
            try {
                Py.println(s$107);
                frame.getlocal(0).invoke("go", frame.getlocal(0).__getattr__("hist").__getitem__(frame.getlocal(0).__getattr__("curHist")), i$4);
                frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("setItem", frame.getlocal(0).__getattr__("hist").__getitem__(frame.getlocal(0).__getattr__("curHist")));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                t$0$PyObject = i$8;
                t$1$PyObject = frame.getlocal(0);
                t$1$PyObject.__setattr__("curHist", t$1$PyObject.__getattr__("curHist").__isub__(t$0$PyObject));
            }
            return Py.None;
        }
        
        private static PyObject onStop$54(PyFrame frame) {
            Py.println(s$108);
            return Py.None;
        }
        
        private static PyObject onReload$55(PyFrame frame) {
            Py.println(s$109);
            frame.getlocal(0).invoke("go", frame.getlocal(0).__getattr__("url").invoke("toString"), i$4);
            return Py.None;
        }
        
        private static PyObject onHome$56(PyFrame frame) {
            Py.println(s$110);
            frame.getlocal(0).invoke("go", frame.getlocal(0).__getattr__("urlHome"));
            frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("setItem", frame.getlocal(0).__getattr__("urlHome"));
            return Py.None;
        }
        
        private static PyObject onNewWindow$57(PyFrame frame) {
            frame.setlocal(2, frame.getglobal("JOptionPane").__getattr__("showInputDialog").__call__(frame.getlocal(0), s$111));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                Py.println(s$112);
                frame.setlocal(2, frame.getglobal("None"));
            }
            frame.setlocal(3, frame.getglobal("BrowserFrame").__call__(frame.getlocal(2), frame.getglobal("BrowserFrame").__getattr__("activeCount"), frame.getlocal(0).__getattr__("exit_when_term").__not__()));
            frame.getlocal(3).invoke("show");
            return Py.None;
        }
        
        private static PyObject onSavePageAs$58(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            frame.setlocal(3, frame.getglobal("JFileChooser").__call__(s$113));
            frame.setlocal(6, frame.getlocal(3).invoke("showSaveDialog", frame.getglobal("frame")));
            if (frame.getlocal(6)._eq(frame.getglobal("JFileChooser").__getattr__("APPROVE_OPTION")).__nonzero__()) {
                frame.setlocal(2, frame.getlocal(3).invoke("getSelectedFile"));
                try {
                    frame.setlocal(4, frame.getglobal("str").__call__(frame.getlocal(2)));
                    if (((t$0$PyObject = frame.getlocal(4).__getslice__(i$114.__neg__(), null, null)._eq(s$115)).__nonzero__() ? t$0$PyObject : frame.getlocal(4).__getslice__(i$116.__neg__(), null, null)._eq(s$117)).__not__().__nonzero__()) {
                        t$0$PyObject = s$117;
                        frame.setlocal(4, frame.getlocal(4).__iadd__(t$0$PyObject));
                    }
                    frame.setlocal(5, frame.getglobal("open").__call__(frame.getglobal("str").__call__(frame.getglobal("file")), s$80));
                    frame.getlocal(5).invoke("write", frame.getlocal(0).__getattr__("editor").invoke("getText"));
                    frame.getlocal(5).invoke("close");
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    Py.printComma(s$118);
                    Py.println(frame.getglobal("sys").__getattr__("exc_info").__call__());
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$119, s$120, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
            }
            return Py.None;
        }
        
        private static PyObject onClose$59(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getlocal(0).invoke("finalize");
            frame.getlocal(0).invoke("dispose");
            t$0$PyObject = i$8;
            t$1$PyObject = frame.getglobal("BrowserFrame");
            t$1$PyObject.__setattr__("activeCount", t$1$PyObject.__getattr__("activeCount").__isub__(t$0$PyObject));
            if (frame.getglobal("BrowserFrame").__getattr__("activeCount")._lt(i$4).__nonzero__()) {
                frame.getglobal("BrowserFrame").__setattr__("activeCount", i$4);
            }
            if (frame.getglobal("BrowserFrame").__getattr__("activeCount")._eq(i$4).__nonzero__()) {
                if (frame.getlocal(0).__getattr__("exit_when_term").__nonzero__()) {
                    frame.getglobal("sys").__getattr__("exit").__call__(i$4);
                }
            }
            return Py.None;
        }
        
        private static PyObject onTextSizeChanged$60(PyFrame frame) {
            frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(1).invoke("getActionCommand")));
            frame.getlocal(0).__getattr__("editor").invoke("setFont", frame.getglobal("Font").__call__(frame.getlocal(0).__getattr__("fontName"), frame.getglobal("Font").__getattr__("PLAIN"), frame.getlocal(2)));
            return Py.None;
        }
        
        private static PyObject onViewSource$61(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                frame.setlocal(3, frame.getlocal(0).__getattr__("editor").invoke("getText"));
                frame.setlocal(2, frame.getglobal("open").__call__(s$121, s$80));
                frame.getlocal(2).invoke("write", frame.getlocal(3));
                frame.getlocal(2).invoke("close");
                frame.getglobal("start_new_thread").__call__(frame.getglobal("system"), new PyTuple(new PyObject[] {s$122}));
                Py.println(s$123);
                frame.getlocal(0).__getattr__("status").invoke("setText", s$44);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$124);
                frame.getlocal(0).__getattr__("status").invoke("setText", s$125);
            }
            return Py.None;
        }
        
        private static PyObject onAddFavorite$62(PyFrame frame) {
            frame.setlocal(4, frame.getglobal("JOptionPane").__getattr__("showInputDialog").__call__(frame.getlocal(0), s$126));
            frame.setlocal(3, frame.getlocal(0).__getattr__("cbLocation").invoke("getEditor").invoke("getItem"));
            frame.getlocal(0).__getattr__("favorites").__setitem__(frame.getlocal(4), frame.getlocal(3));
            frame.setlocal(2, frame.getglobal("JMenuItem").__call__(new PyObject[] {frame.getlocal(4), frame.getlocal(0).__getattr__("onGoToFavorite")}, new String[] {"actionPerformed"}));
            frame.getlocal(2).invoke("setToolTipText", frame.getlocal(3));
            frame.getlocal(0).__getattr__("favorite_menu").invoke("add", frame.getlocal(2));
            Py.println(s$127);
            return Py.None;
        }
        
        private static PyObject onShowFavorite$63(PyFrame frame) {
            frame.setlocal(2, frame.getglobal("FavoriteDialog").__call__(frame.getlocal(0)));
            frame.getlocal(2).invoke("show");
            return Py.None;
        }
        
        private static PyObject onHelp$64(PyFrame frame) {
            frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$128, s$129, i$4, frame.getlocal(0).__getattr__("iconHelp")});
            return Py.None;
        }
        
        private static PyObject onAbout$65(PyFrame frame) {
            frame.setlocal(2, s$130._add(s$131)._add(s$132)._add(s$133)._add(s$134));
            frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), frame.getlocal(2), s$135, i$4, frame.getlocal(0).__getattr__("iconHelp")});
            return Py.None;
        }
        
        private static PyObject BrowserFrame$66(PyFrame frame) {
            /* BrowserFrame([urlHome, frameID, isChild, idGetPage]) -> BrowserFrame Object */
            frame.setlocal("MyActionListener_cbLocation", Py.makeClass("MyActionListener_cbLocation", new PyObject[] {frame.getname("ActionListener")}, c$2_MyActionListener_cbLocation, null, MyActionListener_cbLocation.class));
            frame.setlocal("MyItemListener_cbLocation", Py.makeClass("MyItemListener_cbLocation", new PyObject[] {frame.getname("ItemListener")}, c$5_MyItemListener_cbLocation, null, MyItemListener_cbLocation.class));
            frame.setlocal("MyMouseListener_btGo", Py.makeClass("MyMouseListener_btGo", new PyObject[] {frame.getname("MouseListener")}, c$12_MyMouseListener_btGo, null, MyMouseListener_btGo.class));
            frame.setlocal("MyMouseListener_btToolbar", Py.makeClass("MyMouseListener_btToolbar", new PyObject[] {frame.getname("MouseListener")}, c$19_MyMouseListener_btToolbar, null, MyMouseListener_btToolbar.class));
            frame.setlocal("MyMouseListener_idPad", Py.makeClass("MyMouseListener_idPad", new PyObject[] {frame.getname("MouseListener")}, c$26_MyMouseListener_idPad, null, MyMouseListener_idPad.class));
            frame.setlocal("MyHyperlinkListener_editor", Py.makeClass("MyHyperlinkListener_editor", new PyObject[] {frame.getname("HyperlinkListener")}, c$29_MyHyperlinkListener_editor, null, MyHyperlinkListener_editor.class));
            frame.setlocal("MyWindowAdapter", Py.makeClass("MyWindowAdapter", new PyObject[] {frame.getname("WindowAdapter")}, c$32_MyWindowAdapter, null, MyWindowAdapter.class));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), i$4, i$8, i$8, frame.getname("None")}, c$33___init__));
            frame.setlocal("buildGUI", new PyFunction(frame.f_globals, new PyObject[] {}, c$34_buildGUI));
            frame.setlocal("buildMenuBar", new PyFunction(frame.f_globals, new PyObject[] {}, c$35_buildMenuBar));
            frame.setlocal("buildToolBar", new PyFunction(frame.f_globals, new PyObject[] {}, c$36_buildToolBar));
            frame.setlocal("buildAddressBar", new PyFunction(frame.f_globals, new PyObject[] {}, c$37_buildAddressBar));
            frame.setlocal("buildStatusBar", new PyFunction(frame.f_globals, new PyObject[] {}, c$38_buildStatusBar));
            frame.setlocal("initialize", new PyFunction(frame.f_globals, new PyObject[] {}, c$39_initialize));
            frame.setlocal("finalize", new PyFunction(frame.f_globals, new PyObject[] {}, c$41_finalize));
            frame.setlocal("validateAll", new PyFunction(frame.f_globals, new PyObject[] {}, c$42_validateAll));
            frame.setlocal("validateFavorite", new PyFunction(frame.f_globals, new PyObject[] {}, c$43_validateFavorite));
            frame.setlocal("validateCache", new PyFunction(frame.f_globals, new PyObject[] {}, c$44_validateCache));
            frame.setlocal("createURL", new PyFunction(frame.f_globals, new PyObject[] {i$8}, c$45_createURL));
            frame.setlocal("go", new PyFunction(frame.f_globals, new PyObject[] {i$8, i$8}, c$46_go));
            frame.setlocal("retrievingPage", new PyFunction(frame.f_globals, new PyObject[] {i$8}, c$47_retrievingPage));
            frame.setlocal("goToURL", new PyFunction(frame.f_globals, new PyObject[] {}, c$48_goToURL));
            frame.setlocal("onGo", new PyFunction(frame.f_globals, new PyObject[] {i$8}, c$49_onGo));
            frame.setlocal("onGoToFavorite", new PyFunction(frame.f_globals, new PyObject[] {}, c$50_onGoToFavorite));
            frame.setlocal("onBack", new PyFunction(frame.f_globals, new PyObject[] {}, c$51_onBack));
            frame.setlocal("onForward", new PyFunction(frame.f_globals, new PyObject[] {}, c$52_onForward));
            frame.setlocal("onStop", new PyFunction(frame.f_globals, new PyObject[] {}, c$53_onStop));
            frame.setlocal("onReload", new PyFunction(frame.f_globals, new PyObject[] {}, c$54_onReload));
            frame.setlocal("onHome", new PyFunction(frame.f_globals, new PyObject[] {}, c$55_onHome));
            frame.setlocal("onNewWindow", new PyFunction(frame.f_globals, new PyObject[] {}, c$56_onNewWindow));
            frame.setlocal("onSavePageAs", new PyFunction(frame.f_globals, new PyObject[] {}, c$57_onSavePageAs));
            frame.setlocal("onClose", new PyFunction(frame.f_globals, new PyObject[] {}, c$58_onClose));
            frame.setlocal("onTextSizeChanged", new PyFunction(frame.f_globals, new PyObject[] {}, c$59_onTextSizeChanged));
            frame.setlocal("onViewSource", new PyFunction(frame.f_globals, new PyObject[] {}, c$60_onViewSource));
            frame.setlocal("onAddFavorite", new PyFunction(frame.f_globals, new PyObject[] {}, c$61_onAddFavorite));
            frame.setlocal("onShowFavorite", new PyFunction(frame.f_globals, new PyObject[] {}, c$62_onShowFavorite));
            frame.setlocal("onHelp", new PyFunction(frame.f_globals, new PyObject[] {}, c$63_onHelp));
            frame.setlocal("onAbout", new PyFunction(frame.f_globals, new PyObject[] {}, c$64_onAbout));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$67(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.getglobal("JDialog").__getattr__("__init__").__call__(new PyObject[] {frame.getlocal(0), frame.getlocal(1), s$136, i$8});
            frame.getlocal(0).__setattr__("main", frame.getlocal(1));
            frame.getlocal(0).invoke("setSize", i$137, i$138);
            frame.getlocal(0).__getattr__("contentPane").invoke("setLayout", frame.getglobal("BorderLayout").__call__(i$139, i$139));
            frame.getlocal(0).invoke("addWindowListener", frame.getlocal(0).__getattr__("main").invoke("MyWindowAdapter", frame.getlocal(0)));
            frame.setlocal(7, new PyList(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("main").__getattr__("favorites").invoke("keys");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.setlocal(8, new PyTuple(new PyObject[] {frame.getlocal(3), frame.getlocal(0).__getattr__("main").__getattr__("favorites").__getitem__(frame.getlocal(3))}));
                frame.getlocal(7).invoke("append", frame.getlocal(8));
            }
            frame.getlocal(7).invoke("sort");
            frame.getlocal(0).__setattr__("jtable", frame.getglobal("JTable").__call__(frame.getlocal(7), new PyTuple(new PyObject[] {s$140, s$141})));
            frame.setlocal(2, frame.getglobal("JPanel").__call__(frame.getglobal("FlowLayout").__call__()));
            frame.setlocal(5, frame.getglobal("JButton").__call__(new PyObject[] {s$142, frame.getlocal(0).__getattr__("onApply")}, new String[] {"actionPerformed"}));
            frame.setlocal(4, frame.getglobal("JButton").__call__(new PyObject[] {s$143, frame.getlocal(0).__getattr__("onDelete")}, new String[] {"actionPerformed"}));
            frame.setlocal(6, frame.getglobal("JButton").__call__(new PyObject[] {s$144, frame.getlocal(0).__getattr__("onClose")}, new String[] {"actionPerformed"}));
            frame.getlocal(2).invoke("add", frame.getlocal(5));
            frame.getlocal(2).invoke("add", frame.getlocal(4));
            frame.getlocal(2).invoke("add", frame.getlocal(6));
            frame.getlocal(0).__setattr__("scroller", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("jtable")));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("scroller"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(2), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            return Py.None;
        }
        
        private static PyObject onApply$68(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            frame.getlocal(0).__getattr__("main").__getattr__("favorites").invoke("clear");
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getlocal(0).__getattr__("jtable").invoke("getRowCount"));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(5, t$0$PyObject);
                frame.setlocal(2, frame.getlocal(0).__getattr__("jtable").invoke("getValueAt", frame.getlocal(5), i$4));
                frame.setlocal(3, frame.getlocal(0).__getattr__("jtable").invoke("getValueAt", frame.getlocal(5), i$8));
                if (((t$2$PyObject = frame.getlocal(2)._eq(s$95)).__nonzero__() ? frame.getlocal(3)._eq(s$95) : t$2$PyObject).__nonzero__()) {
                    continue;
                }
                frame.getlocal(0).__getattr__("main").__getattr__("favorites").__setitem__(frame.getlocal(2), frame.getlocal(3));
            }
            frame.getlocal(0).__getattr__("contentPane").invoke("remove", frame.getlocal(0).__getattr__("scroller"));
            frame.setlocal(4, new PyList(new PyObject[] {}));
            t$1$int = 0;
            t$3$PyObject = frame.getlocal(0).__getattr__("main").__getattr__("favorites").invoke("keys");
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                frame.setlocal(2, t$2$PyObject);
                frame.setlocal(5, new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(0).__getattr__("main").__getattr__("favorites").__getitem__(frame.getlocal(2))}));
                frame.getlocal(4).invoke("append", frame.getlocal(5));
            }
            frame.getlocal(4).invoke("sort");
            frame.getlocal(0).__setattr__("jtable", frame.getglobal("JTable").__call__(frame.getlocal(4), new PyTuple(new PyObject[] {s$140, s$141})));
            frame.getlocal(0).__setattr__("scroller", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("jtable")));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("scroller"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(0).invoke("validate");
            Py.println(s$145);
            frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(frame.getlocal(0), s$146);
            return Py.None;
        }
        
        private static PyObject onDelete$69(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(3, frame.getlocal(0).__getattr__("jtable").invoke("getSelectedRows"));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(3);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.getlocal(0).__getattr__("jtable").invoke("setValueAt", new PyObject[] {s$95, frame.getlocal(2), i$4});
                frame.getlocal(0).__getattr__("jtable").invoke("setValueAt", new PyObject[] {s$95, frame.getlocal(2), i$8});
            }
            return Py.None;
        }
        
        private static PyObject onClose$70(PyFrame frame) {
            frame.getlocal(0).__getattr__("main").invoke("validateFavorite");
            frame.getlocal(0).invoke("dispose");
            return Py.None;
        }
        
        private static PyObject FavoriteDialog$71(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$66___init__));
            frame.setlocal("onApply", new PyFunction(frame.f_globals, new PyObject[] {}, c$67_onApply));
            frame.setlocal("onDelete", new PyFunction(frame.f_globals, new PyObject[] {}, c$68_onDelete));
            frame.setlocal("onClose", new PyFunction(frame.f_globals, new PyObject[] {}, c$69_onClose));
            return frame.getf_locals();
        }
        
        private static PyObject main$72(PyFrame frame) {
            frame.setglobal("__file__", s$149);
            
            PyObject[] imp_accu;
            // Code
            /* 
            Programmable Web Browser v 2.0
            Module : Web Browser
            Last Updated : 28 January 2002
            Programmer : Thanawat Keawka
                                    Boontawee Suntisrivaraporn
            Professor : Dr. Visit Hirankitti                        
            ===========================================
            System Requirement
            - Java 1.4
            - Jython 2.1
            
             */
            org.python.core.imp.importAll("java.awt", frame);
            org.python.core.imp.importAll("java.awt.event", frame);
            org.python.core.imp.importAll("javax.swing", frame);
            org.python.core.imp.importAll("javax.swing.event", frame);
            imp_accu = org.python.core.imp.importFrom("java.net", new String[] {"URL"}, frame);
            frame.setlocal("URL", imp_accu[0]);
            imp_accu = null;
            org.python.core.imp.importAll("javax.swing.text", frame);
            org.python.core.imp.importAll("javax.swing.text.html", frame);
            org.python.core.imp.importAll("java.lang", frame);
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            imp_accu = org.python.core.imp.importFrom("thread", new String[] {"start_new_thread"}, frame);
            frame.setlocal("start_new_thread", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("os", new String[] {"system"}, frame);
            frame.setlocal("system", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            frame.setlocal("BROWSER_CACHE_FILE", s$1);
            frame.setlocal("BROWSER_FAV_FILE", s$2);
            frame.setlocal("BrowserFrame", Py.makeClass("BrowserFrame", new PyObject[] {frame.getname("JFrame")}, c$65_BrowserFrame, null, BrowserFrame.class));
            frame.setlocal("FavoriteDialog", Py.makeClass("FavoriteDialog", new PyObject[] {frame.getname("JDialog")}, c$70_FavoriteDialog, null, FavoriteDialog.class));
            if (frame.getname("__name__")._eq(s$147).__nonzero__()) {
                frame.setlocal("frame", frame.getname("BrowserFrame").__call__(s$148, i$4, i$4));
                frame.getname("frame").invoke("show");
            }
            return Py.None;
        }
        
    }
    public static class MyHyperlinkListener_editor extends java.lang.Object implements javax.swing.event.HyperlinkListener, org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void hyperlinkUpdate(javax.swing.event.HyperlinkEvent arg0) {
            PyObject inst = Py.jgetattr(this, "hyperlinkUpdate");
            inst._jcall(new Object[] {arg0});
        }
        
        public MyHyperlinkListener_editor() {
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
            Py.initProxy(this, "Browser", "MyHyperlinkListener_editor", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {}));
        }
        
    }
    public static class MyMouseListener_idPad extends java.lang.Object implements java.awt.event.MouseListener, org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void mouseClicked(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseClicked");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseEntered(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseEntered");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseExited(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseExited");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mousePressed(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mousePressed");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseReleased(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseReleased");
            inst._jcall(new Object[] {arg0});
        }
        
        public MyMouseListener_idPad() {
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
            Py.initProxy(this, "Browser", "MyMouseListener_idPad", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {}));
        }
        
    }
    public static class MyMouseListener_btToolbar extends java.lang.Object implements java.awt.event.MouseListener, org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void mouseClicked(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseClicked");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseEntered(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseEntered");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseExited(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseExited");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mousePressed(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mousePressed");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseReleased(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseReleased");
            inst._jcall(new Object[] {arg0});
        }
        
        public MyMouseListener_btToolbar() {
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
            Py.initProxy(this, "Browser", "MyMouseListener_btToolbar", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {}));
        }
        
    }
    public static class MyItemListener_cbLocation extends java.lang.Object implements java.awt.event.ItemListener, org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void itemStateChanged(java.awt.event.ItemEvent arg0) {
            PyObject inst = Py.jgetattr(this, "itemStateChanged");
            inst._jcall(new Object[] {arg0});
        }
        
        public MyItemListener_cbLocation() {
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
            Py.initProxy(this, "Browser", "MyItemListener_cbLocation", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {}));
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
            Py.initProxy(this, "Browser", "MyWindowAdapter", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"super__windowClosing", "finalize", "clone"}));
        }
        
    }
    public static class MyMouseListener_btGo extends java.lang.Object implements java.awt.event.MouseListener, org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void mouseClicked(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseClicked");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseEntered(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseEntered");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseExited(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseExited");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mousePressed(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mousePressed");
            inst._jcall(new Object[] {arg0});
        }
        
        public void mouseReleased(java.awt.event.MouseEvent arg0) {
            PyObject inst = Py.jgetattr(this, "mouseReleased");
            inst._jcall(new Object[] {arg0});
        }
        
        public MyMouseListener_btGo() {
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
            Py.initProxy(this, "Browser", "MyMouseListener_btGo", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {}));
        }
        
    }
    public static class BrowserFrame extends javax.swing.JFrame implements org.python.core.PyProxy, org.python.core.ClassDictInit {
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
        
        public void super__finalize() throws java.lang.Throwable {
            super.finalize();
        }
        
        public void finalize() throws java.lang.Throwable {
            PyObject inst = Py.jfindattr(this, "finalize");
            if (inst != null) try {
                inst._jcallexc(new Object[] {});
            }
            catch (java.lang.Throwable exc0) {
                throw exc0;
            }
            else super.finalize();
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
        
        public BrowserFrame(java.awt.GraphicsConfiguration arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public BrowserFrame(java.lang.String arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public BrowserFrame(java.lang.String arg0, java.awt.GraphicsConfiguration arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public BrowserFrame() throws java.awt.HeadlessException {
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
            Py.initProxy(this, "Browser", "BrowserFrame", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"processInputMethodEvent", "requestFocus", "firePropertyChange", "setRootPaneCheckingEnabled", "processMouseWheelEvent", "processWindowEvent", "processEvent", "processComponentEvent", "processWindowStateEvent", "paramString", "coalesceEvents", "requestFocusInWindow", "super__disableEvents", "super__enableEvents", "processMouseEvent", "super__finalize", "processKeyEvent", "addImpl", "validateTree", "processWindowFocusEvent", "processHierarchyBoundsEvent", "processMouseMotionEvent", "clone", "processContainerEvent", "processFocusEvent", "createRootPane", "frameInit", "processHierarchyEvent", "setRootPane", "isRootPaneCheckingEnabled"}));
        }
        
    }
    public static class MyActionListener_cbLocation extends java.lang.Object implements java.awt.event.ActionListener, org.python.core.PyProxy, org.python.core.ClassDictInit {
        public void actionPerformed(java.awt.event.ActionEvent arg0) {
            PyObject inst = Py.jgetattr(this, "actionPerformed");
            inst._jcall(new Object[] {arg0});
        }
        
        public MyActionListener_cbLocation() {
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
            Py.initProxy(this, "Browser", "MyActionListener_cbLocation", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {}));
        }
        
    }
    public static class FavoriteDialog extends javax.swing.JDialog implements org.python.core.PyProxy, org.python.core.ClassDictInit {
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
        
        public void dialogInit() {
            super.dialogInit();
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
        
        public FavoriteDialog() throws java.awt.HeadlessException {
            super();
            __initProxy__(new Object[] {});
        }
        
        public FavoriteDialog(java.awt.Frame arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public FavoriteDialog(java.awt.Frame arg0, boolean arg1) throws java.awt.HeadlessException {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, Py.newBoolean(arg1)});
        }
        
        public FavoriteDialog(java.awt.Frame arg0, java.lang.String arg1) throws java.awt.HeadlessException {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public FavoriteDialog(java.awt.Frame arg0, java.lang.String arg1, boolean arg2) throws java.awt.HeadlessException {
            super(arg0, arg1, arg2);
            __initProxy__(new Object[] {arg0, arg1, Py.newBoolean(arg2)});
        }
        
        public FavoriteDialog(java.awt.Frame arg0, java.lang.String arg1, boolean arg2, java.awt.GraphicsConfiguration arg3) {
            super(arg0, arg1, arg2, arg3);
            __initProxy__(new Object[] {arg0, arg1, Py.newBoolean(arg2), arg3});
        }
        
        public FavoriteDialog(java.awt.Dialog arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public FavoriteDialog(java.awt.Dialog arg0, boolean arg1) throws java.awt.HeadlessException {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, Py.newBoolean(arg1)});
        }
        
        public FavoriteDialog(java.awt.Dialog arg0, java.lang.String arg1) throws java.awt.HeadlessException {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public FavoriteDialog(java.awt.Dialog arg0, java.lang.String arg1, boolean arg2) throws java.awt.HeadlessException {
            super(arg0, arg1, arg2);
            __initProxy__(new Object[] {arg0, arg1, Py.newBoolean(arg2)});
        }
        
        public FavoriteDialog(java.awt.Dialog arg0, java.lang.String arg1, boolean arg2, java.awt.GraphicsConfiguration arg3) throws java.awt.HeadlessException {
            super(arg0, arg1, arg2, arg3);
            __initProxy__(new Object[] {arg0, arg1, Py.newBoolean(arg2), arg3});
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
            Py.initProxy(this, "Browser", "FavoriteDialog", args, Browser.jpy$packages, Browser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"processInputMethodEvent", "dialogInit", "finalize", "requestFocus", "firePropertyChange", "setRootPaneCheckingEnabled", "processMouseWheelEvent", "processWindowEvent", "processEvent", "processComponentEvent", "processWindowStateEvent", "paramString", "coalesceEvents", "requestFocusInWindow", "super__disableEvents", "super__enableEvents", "processMouseEvent", "processKeyEvent", "addImpl", "validateTree", "processWindowFocusEvent", "processHierarchyBoundsEvent", "processMouseMotionEvent", "clone", "processContainerEvent", "processFocusEvent", "createRootPane", "processHierarchyEvent", "setRootPane", "isRootPaneCheckingEnabled"}));
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("Browser"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "Browser";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(Browser._PyInner.class, newargs, Browser.jpy$packages, Browser.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
