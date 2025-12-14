import org.python.core.*;

public class poplib extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject i$3;
        private static PyObject s$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject s$7;
        private static PyObject i$8;
        private static PyObject s$9;
        private static PyObject s$10;
        private static PyObject i$11;
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
        private static PyObject i$48;
        private static PyObject s$49;
        private static PyObject s$50;
        private static PyObject s$51;
        private static PyObject s$52;
        private static PyObject s$53;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_error_proto;
        private static PyCode c$1___init__;
        private static PyCode c$2__putline;
        private static PyCode c$3__putcmd;
        private static PyCode c$4__getline;
        private static PyCode c$5__getresp;
        private static PyCode c$6__getlongresp;
        private static PyCode c$7__shortcmd;
        private static PyCode c$8__longcmd;
        private static PyCode c$9_getwelcome;
        private static PyCode c$10_set_debuglevel;
        private static PyCode c$11_user;
        private static PyCode c$12_pass_;
        private static PyCode c$13_stat;
        private static PyCode c$14_list;
        private static PyCode c$15_retr;
        private static PyCode c$16_dele;
        private static PyCode c$17_noop;
        private static PyCode c$18_rset;
        private static PyCode c$19_quit;
        private static PyCode c$20_rpop;
        private static PyCode c$21_lambda;
        private static PyCode c$22_apop;
        private static PyCode c$23_top;
        private static PyCode c$24_uidl;
        private static PyCode c$25_POP3;
        private static PyCode c$26_main;
        private static void initConstants() {
            s$0 = Py.newString("A POP3 client class.\012\012Based on the J. Myers POP3 draft, Jan. 96\012");
            s$1 = Py.newString("POP3");
            s$2 = Py.newString("error_proto");
            i$3 = Py.newInteger(110);
            s$4 = Py.newString("\015");
            s$5 = Py.newString("\012");
            s$6 = Py.newString("This class supports both the minimal and optional command sets.\012    Arguments can be strings or integers (where appropriate)\012    (e.g.: retr(1) and retr('1') both work equally well.\012\012    Minimal Command Set:\012            USER name               user(name)\012            PASS string             pass_(string)\012            STAT                    stat()\012            LIST [msg]              list(msg = None)\012            RETR msg                retr(msg)\012            DELE msg                dele(msg)\012            NOOP                    noop()\012            RSET                    rset()\012            QUIT                    quit()\012\012    Optional Commands (some servers support these):\012            RPOP name               rpop(name)\012            APOP name digest        apop(name, digest)\012            TOP msg n               top(msg, n)\012            UIDL [msg]              uidl(msg = None)\012\012    Raises one exception: 'error_proto'.\012\012    Instantiate with:\012            POP3(hostname, port=110)\012\012    NB:     the POP protocol locks the mailbox from user\012            authorization until QUIT, so be sure to get in, suck\012            the messages, and quit, each time you access the\012            mailbox.\012\012            POP is a line-based protocol, which means large mail\012            messages consume lots of python cycles reading them\012            line-by-line.\012\012            If it's available on your mail server, use IMAP4\012            instead, it doesn't suffer from the two problems\012            above.\012    ");
            s$7 = Py.newString("rb");
            i$8 = Py.newInteger(0);
            s$9 = Py.newString("%s%s");
            s$10 = Py.newString("-ERR EOF");
            i$11 = Py.newInteger(2);
            i$12 = Py.newInteger(1);
            s$13 = Py.newString("+");
            s$14 = Py.newString(".");
            s$15 = Py.newString("..");
            s$16 = Py.newString("Send user name, return response\012\012        (should indicate password required).\012        ");
            s$17 = Py.newString("USER %s");
            s$18 = Py.newString("Send password, return response\012\012        (response includes message count, mailbox size).\012\012        NB: mailbox is locked by server from here to 'quit()'\012        ");
            s$19 = Py.newString("PASS %s");
            s$20 = Py.newString("Get mailbox status.\012\012        Result is tuple of 2 ints (message count, mailbox size)\012        ");
            s$21 = Py.newString("STAT");
            s$22 = Py.newString("Request listing, return result.\012\012        Result without a message number argument is in form\012        ['response', ['mesg_num octets', ...]].\012\012        Result when a message number argument is given is a\012        single response: the \"scan listing\" for that message.\012        ");
            s$23 = Py.newString("LIST %s");
            s$24 = Py.newString("LIST");
            s$25 = Py.newString("Retrieve whole message number 'which'.\012\012        Result is in form ['response', ['line', ...], octets].\012        ");
            s$26 = Py.newString("RETR %s");
            s$27 = Py.newString("Delete message number 'which'.\012\012        Result is 'response'.\012        ");
            s$28 = Py.newString("DELE %s");
            s$29 = Py.newString("Does nothing.\012\012        One supposes the response indicates the server is alive.\012        ");
            s$30 = Py.newString("NOOP");
            s$31 = Py.newString("Not sure what this does.");
            s$32 = Py.newString("RSET");
            s$33 = Py.newString("Signoff: commit changes on server, unlock mailbox, close connection.");
            s$34 = Py.newString("QUIT");
            s$35 = Py.newString("RPOP %s");
            s$36 = Py.newString("\\+OK.*(<[^>]+>)");
            s$37 = Py.newString("Authorisation\012\012        - only possible if server has supplied a timestamp in initial greeting.\012\012        Args:\012                user    - mailbox user;\012                secret  - secret shared between client and server.\012\012        NB: mailbox is locked by server from here to 'quit()'\012        ");
            s$38 = Py.newString("-ERR APOP not supported by server");
            s$39 = Py.newString("");
            s$40 = Py.newString("%02x");
            s$41 = Py.newString("APOP %s %s");
            s$42 = Py.newString("Retrieve message header of message number 'which'\012        and first 'howmuch' lines of message body.\012\012        Result is in form ['response', ['line', ...], octets].\012        ");
            s$43 = Py.newString("TOP %s %s");
            s$44 = Py.newString("Return message digest (unique id) list.\012\012        If 'which', result contains unique id for that message\012        in the form 'response mesgnum uid', otherwise result is\012        the list ['response', ['mesgnum uid', ...], octets]\012        ");
            s$45 = Py.newString("UIDL %s");
            s$46 = Py.newString("UIDL");
            s$47 = Py.newString("__main__");
            i$48 = Py.newInteger(3);
            s$49 = Py.newString("Message ");
            s$50 = Py.newString(":");
            s$51 = Py.newString("   ");
            s$52 = Py.newString("-----------------------");
            s$53 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\poplib.py");
            funcTable = new _PyInner();
            c$0_error_proto = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "error_proto", false, false, funcTable, 0, null, null, 0, 0);
            c$1___init__ = Py.newCode(3, new String[] {"self", "host", "port"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "__init__", false, false, funcTable, 1, null, null, 0, 1);
            c$2__putline = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_putline", false, false, funcTable, 2, null, null, 0, 1);
            c$3__putcmd = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_putcmd", false, false, funcTable, 3, null, null, 0, 1);
            c$4__getline = Py.newCode(1, new String[] {"self", "line", "octets"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_getline", false, false, funcTable, 4, null, null, 0, 1);
            c$5__getresp = Py.newCode(1, new String[] {"self", "o", "resp", "c"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_getresp", false, false, funcTable, 5, null, null, 0, 1);
            c$6__getlongresp = Py.newCode(1, new String[] {"self", "line", "octets", "list", "o", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_getlongresp", false, false, funcTable, 6, null, null, 0, 1);
            c$7__shortcmd = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_shortcmd", false, false, funcTable, 7, null, null, 0, 1);
            c$8__longcmd = Py.newCode(2, new String[] {"self", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "_longcmd", false, false, funcTable, 8, null, null, 0, 1);
            c$9_getwelcome = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "getwelcome", false, false, funcTable, 9, null, null, 0, 1);
            c$10_set_debuglevel = Py.newCode(2, new String[] {"self", "level"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "set_debuglevel", false, false, funcTable, 10, null, null, 0, 1);
            c$11_user = Py.newCode(2, new String[] {"self", "user"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "user", false, false, funcTable, 11, null, null, 0, 1);
            c$12_pass_ = Py.newCode(2, new String[] {"self", "pswd"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "pass_", false, false, funcTable, 12, null, null, 0, 1);
            c$13_stat = Py.newCode(1, new String[] {"self", "retval", "sizeMessages", "rets", "numMessages"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "stat", false, false, funcTable, 13, null, null, 0, 1);
            c$14_list = Py.newCode(2, new String[] {"self", "which"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "list", false, false, funcTable, 14, null, null, 0, 1);
            c$15_retr = Py.newCode(2, new String[] {"self", "which"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "retr", false, false, funcTable, 15, null, null, 0, 1);
            c$16_dele = Py.newCode(2, new String[] {"self", "which"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "dele", false, false, funcTable, 16, null, null, 0, 1);
            c$17_noop = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "noop", false, false, funcTable, 17, null, null, 0, 1);
            c$18_rset = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "rset", false, false, funcTable, 18, null, null, 0, 1);
            c$19_quit = Py.newCode(1, new String[] {"self", "val", "resp"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "quit", false, false, funcTable, 19, null, null, 0, 1);
            c$20_rpop = Py.newCode(2, new String[] {"self", "user"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "rpop", false, false, funcTable, 20, null, null, 0, 1);
            c$21_lambda = Py.newCode(1, new String[] {"x"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "<lambda>", false, false, funcTable, 21, null, null, 0, 1);
            c$22_apop = Py.newCode(3, new String[] {"self", "user", "secret", "m", "digest", "md5"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "apop", false, false, funcTable, 22, null, null, 0, 1);
            c$23_top = Py.newCode(3, new String[] {"self", "which", "howmuch"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "top", false, false, funcTable, 23, null, null, 0, 1);
            c$24_uidl = Py.newCode(2, new String[] {"self", "which"}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "uidl", false, false, funcTable, 24, null, null, 0, 1);
            c$25_POP3 = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "POP3", false, false, funcTable, 25, null, null, 0, 0);
            c$26_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\poplib.py", "main", false, false, funcTable, 26, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$26_main == null) _PyInner.initConstants();
            return c$26_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.error_proto$1(frame);
                case 1:
                return _PyInner.__init__$2(frame);
                case 2:
                return _PyInner._putline$3(frame);
                case 3:
                return _PyInner._putcmd$4(frame);
                case 4:
                return _PyInner._getline$5(frame);
                case 5:
                return _PyInner._getresp$6(frame);
                case 6:
                return _PyInner._getlongresp$7(frame);
                case 7:
                return _PyInner._shortcmd$8(frame);
                case 8:
                return _PyInner._longcmd$9(frame);
                case 9:
                return _PyInner.getwelcome$10(frame);
                case 10:
                return _PyInner.set_debuglevel$11(frame);
                case 11:
                return _PyInner.user$12(frame);
                case 12:
                return _PyInner.pass_$13(frame);
                case 13:
                return _PyInner.stat$14(frame);
                case 14:
                return _PyInner.list$15(frame);
                case 15:
                return _PyInner.retr$16(frame);
                case 16:
                return _PyInner.dele$17(frame);
                case 17:
                return _PyInner.noop$18(frame);
                case 18:
                return _PyInner.rset$19(frame);
                case 19:
                return _PyInner.quit$20(frame);
                case 20:
                return _PyInner.rpop$21(frame);
                case 21:
                return _PyInner.lambda$22(frame);
                case 22:
                return _PyInner.apop$23(frame);
                case 23:
                return _PyInner.top$24(frame);
                case 24:
                return _PyInner.uidl$25(frame);
                case 25:
                return _PyInner.POP3$26(frame);
                case 26:
                return _PyInner.main$27(frame);
                default:
                return null;
            }
        }
        
        private static PyObject error_proto$1(PyFrame frame) {
            // pass
            return frame.getf_locals();
        }
        
        private static PyObject __init__$2(PyFrame frame) {
            frame.getlocal(0).__setattr__("host", frame.getlocal(1));
            frame.getlocal(0).__setattr__("port", frame.getlocal(2));
            frame.getlocal(0).__setattr__("sock", frame.getglobal("socket").__getattr__("socket").__call__(frame.getglobal("socket").__getattr__("AF_INET"), frame.getglobal("socket").__getattr__("SOCK_STREAM")));
            frame.getlocal(0).__getattr__("sock").invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("host"), frame.getlocal(0).__getattr__("port")}));
            frame.getlocal(0).__setattr__("file", frame.getlocal(0).__getattr__("sock").invoke("makefile", s$7));
            frame.getlocal(0).__setattr__("_debugging", i$8);
            frame.getlocal(0).__setattr__("welcome", frame.getlocal(0).invoke("_getresp"));
            return Py.None;
        }
        
        private static PyObject _putline$3(PyFrame frame) {
            frame.getlocal(0).__getattr__("sock").invoke("send", s$9._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getglobal("CRLF")})));
            return Py.None;
        }
        
        private static PyObject _putcmd$4(PyFrame frame) {
            frame.getlocal(0).invoke("_putline", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject _getline$5(PyFrame frame) {
            frame.setlocal(1, frame.getlocal(0).__getattr__("file").invoke("readline"));
            if (frame.getlocal(1).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto").__call__(s$10));
            }
            frame.setlocal(2, frame.getglobal("len").__call__(frame.getlocal(1)));
            if (frame.getlocal(1).__getslice__(i$11.__neg__(), null, null)._eq(frame.getglobal("CRLF")).__nonzero__()) {
                return new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(null, i$11.__neg__(), null), frame.getlocal(2)});
            }
            if (frame.getlocal(1).__getitem__(i$8)._eq(frame.getglobal("CR")).__nonzero__()) {
                return new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(i$12, i$12.__neg__(), null), frame.getlocal(2)});
            }
            return new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(null, i$12.__neg__(), null), frame.getlocal(2)});
        }
        
        private static PyObject _getresp$6(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("_getline"), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            frame.setlocal(3, frame.getlocal(2).__getslice__(null, i$12, null));
            if (frame.getlocal(3)._ne(s$13).__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto").__call__(frame.getlocal(2)));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject _getlongresp$7(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            frame.setlocal(5, frame.getlocal(0).invoke("_getresp"));
            frame.setlocal(3, new PyList(new PyObject[] {}));
            frame.setlocal(2, i$8);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("_getline"), 2);
            frame.setlocal(1, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            while (frame.getlocal(1)._ne(s$14).__nonzero__()) {
                if (frame.getlocal(1).__getslice__(null, i$11, null)._eq(s$15).__nonzero__()) {
                    frame.setlocal(4, frame.getlocal(4)._sub(i$12));
                    frame.setlocal(1, frame.getlocal(1).__getslice__(i$12, null, null));
                }
                frame.setlocal(2, frame.getlocal(2)._add(frame.getlocal(4)));
                frame.getlocal(3).invoke("append", frame.getlocal(1));
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("_getline"), 2);
                frame.setlocal(1, t$0$PyObject__[0]);
                frame.setlocal(4, t$0$PyObject__[1]);
            }
            return new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(3), frame.getlocal(2)});
        }
        
        private static PyObject _shortcmd$8(PyFrame frame) {
            frame.getlocal(0).invoke("_putcmd", frame.getlocal(1));
            return frame.getlocal(0).invoke("_getresp");
        }
        
        private static PyObject _longcmd$9(PyFrame frame) {
            frame.getlocal(0).invoke("_putcmd", frame.getlocal(1));
            return frame.getlocal(0).invoke("_getlongresp");
        }
        
        private static PyObject getwelcome$10(PyFrame frame) {
            return frame.getlocal(0).__getattr__("welcome");
        }
        
        private static PyObject set_debuglevel$11(PyFrame frame) {
            frame.getlocal(0).__setattr__("_debugging", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject user$12(PyFrame frame) {
            /* Send user name, return response
            
                    (should indicate password required).
                     */
            return frame.getlocal(0).invoke("_shortcmd", s$17._mod(frame.getlocal(1)));
        }
        
        private static PyObject pass_$13(PyFrame frame) {
            /* Send password, return response
            
                    (response includes message count, mailbox size).
            
                    NB: mailbox is locked by server from here to 'quit()'
                     */
            return frame.getlocal(0).invoke("_shortcmd", s$19._mod(frame.getlocal(1)));
        }
        
        private static PyObject stat$14(PyFrame frame) {
            /* Get mailbox status.
            
                    Result is tuple of 2 ints (message count, mailbox size)
                     */
            frame.setlocal(1, frame.getlocal(0).invoke("_shortcmd", s$21));
            frame.setlocal(3, frame.getlocal(1).invoke("split"));
            frame.setlocal(4, frame.getglobal("int").__call__(frame.getlocal(3).__getitem__(i$12)));
            frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(3).__getitem__(i$11)));
            return new PyTuple(new PyObject[] {frame.getlocal(4), frame.getlocal(2)});
        }
        
        private static PyObject list$15(PyFrame frame) {
            /* Request listing, return result.
            
                    Result without a message number argument is in form
                    ['response', ['mesg_num octets', ...]].
            
                    Result when a message number argument is given is a
                    single response: the "scan listing" for that message.
                     */
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(0).invoke("_shortcmd", s$23._mod(frame.getlocal(1)));
            }
            return frame.getlocal(0).invoke("_longcmd", s$24);
        }
        
        private static PyObject retr$16(PyFrame frame) {
            /* Retrieve whole message number 'which'.
            
                    Result is in form ['response', ['line', ...], octets].
                     */
            return frame.getlocal(0).invoke("_longcmd", s$26._mod(frame.getlocal(1)));
        }
        
        private static PyObject dele$17(PyFrame frame) {
            /* Delete message number 'which'.
            
                    Result is 'response'.
                     */
            return frame.getlocal(0).invoke("_shortcmd", s$28._mod(frame.getlocal(1)));
        }
        
        private static PyObject noop$18(PyFrame frame) {
            /* Does nothing.
            
                    One supposes the response indicates the server is alive.
                     */
            return frame.getlocal(0).invoke("_shortcmd", s$30);
        }
        
        private static PyObject rset$19(PyFrame frame) {
            /* Not sure what this does. */
            return frame.getlocal(0).invoke("_shortcmd", s$32);
        }
        
        private static PyObject quit$20(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Signoff: commit changes on server, unlock mailbox, close connection. */
            try {
                frame.setlocal(2, frame.getlocal(0).invoke("_shortcmd", s$34));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("error_proto"))) {
                    frame.setlocal(1, t$0$PyException.value);
                    frame.setlocal(2, frame.getlocal(1));
                }
                else throw t$0$PyException;
            }
            frame.getlocal(0).__getattr__("file").invoke("close");
            frame.getlocal(0).__getattr__("sock").invoke("close");
            frame.getlocal(0).__delattr__("file");
            frame.getlocal(0).__delattr__("sock");
            return frame.getlocal(2);
        }
        
        private static PyObject rpop$21(PyFrame frame) {
            /* Not sure what this does. */
            return frame.getlocal(0).invoke("_shortcmd", s$35._mod(frame.getlocal(1)));
        }
        
        private static PyObject lambda$22(PyFrame frame) {
            return s$40._mod(frame.getglobal("ord").__call__(frame.getlocal(0)));
        }
        
        private static PyObject apop$23(PyFrame frame) {
            /* Authorisation
            
                    - only possible if server has supplied a timestamp in initial greeting.
            
                    Args:
                            user    - mailbox user;
                            secret  - secret shared between client and server.
            
                    NB: mailbox is locked by server from here to 'quit()'
                     */
            frame.setlocal(3, frame.getlocal(0).__getattr__("timestamp").invoke("match", frame.getlocal(0).__getattr__("welcome")));
            if (frame.getlocal(3).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("error_proto").__call__(s$38));
            }
            frame.setlocal(5, org.python.core.imp.importOne("md5", frame));
            frame.setlocal(4, frame.getlocal(5).__getattr__("new").__call__(frame.getlocal(3).invoke("group", i$12)._add(frame.getlocal(2))).invoke("digest"));
            frame.setlocal(4, s$39.invoke("join", frame.getglobal("map").__call__(new PyFunction(frame.f_globals, new PyObject[] {}, c$21_lambda), frame.getlocal(4))));
            return frame.getlocal(0).invoke("_shortcmd", s$41._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(4)})));
        }
        
        private static PyObject top$24(PyFrame frame) {
            /* Retrieve message header of message number 'which'
                    and first 'howmuch' lines of message body.
            
                    Result is in form ['response', ['line', ...], octets].
                     */
            return frame.getlocal(0).invoke("_longcmd", s$43._mod(new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)})));
        }
        
        private static PyObject uidl$25(PyFrame frame) {
            /* Return message digest (unique id) list.
            
                    If 'which', result contains unique id for that message
                    in the form 'response mesgnum uid', otherwise result is
                    the list ['response', ['mesgnum uid', ...], octets]
                     */
            if (frame.getlocal(1).__nonzero__()) {
                return frame.getlocal(0).invoke("_shortcmd", s$45._mod(frame.getlocal(1)));
            }
            return frame.getlocal(0).invoke("_longcmd", s$46);
        }
        
        private static PyObject POP3$26(PyFrame frame) {
            /* This class supports both the minimal and optional command sets.
                Arguments can be strings or integers (where appropriate)
                (e.g.: retr(1) and retr('1') both work equally well.
            
                Minimal Command Set:
                        USER name               user(name)
                        PASS string             pass_(string)
                        STAT                    stat()
                        LIST [msg]              list(msg = None)
                        RETR msg                retr(msg)
                        DELE msg                dele(msg)
                        NOOP                    noop()
                        RSET                    rset()
                        QUIT                    quit()
            
                Optional Commands (some servers support these):
                        RPOP name               rpop(name)
                        APOP name digest        apop(name, digest)
                        TOP msg n               top(msg, n)
                        UIDL [msg]              uidl(msg = None)
            
                Raises one exception: 'error_proto'.
            
                Instantiate with:
                        POP3(hostname, port=110)
            
                NB:     the POP protocol locks the mailbox from user
                        authorization until QUIT, so be sure to get in, suck
                        the messages, and quit, each time you access the
                        mailbox.
            
                        POP is a line-based protocol, which means large mail
                        messages consume lots of python cycles reading them
                        line-by-line.
            
                        If it's available on your mail server, use IMAP4
                        instead, it doesn't suffer from the two problems
                        above.
                 */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("POP3_PORT")}, c$1___init__));
            frame.setlocal("_putline", new PyFunction(frame.f_globals, new PyObject[] {}, c$2__putline));
            frame.setlocal("_putcmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$3__putcmd));
            frame.setlocal("_getline", new PyFunction(frame.f_globals, new PyObject[] {}, c$4__getline));
            frame.setlocal("_getresp", new PyFunction(frame.f_globals, new PyObject[] {}, c$5__getresp));
            frame.setlocal("_getlongresp", new PyFunction(frame.f_globals, new PyObject[] {}, c$6__getlongresp));
            frame.setlocal("_shortcmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$7__shortcmd));
            frame.setlocal("_longcmd", new PyFunction(frame.f_globals, new PyObject[] {}, c$8__longcmd));
            frame.setlocal("getwelcome", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_getwelcome));
            frame.setlocal("set_debuglevel", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_set_debuglevel));
            frame.setlocal("user", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_user));
            frame.setlocal("pass_", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_pass_));
            frame.setlocal("stat", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_stat));
            frame.setlocal("list", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$14_list));
            frame.setlocal("retr", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_retr));
            frame.setlocal("dele", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_dele));
            frame.setlocal("noop", new PyFunction(frame.f_globals, new PyObject[] {}, c$17_noop));
            frame.setlocal("rset", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_rset));
            frame.setlocal("quit", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_quit));
            frame.setlocal("rpop", new PyFunction(frame.f_globals, new PyObject[] {}, c$20_rpop));
            frame.setlocal("timestamp", frame.getname("re").__getattr__("compile").__call__(s$36));
            frame.setlocal("apop", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_apop));
            frame.setlocal("top", new PyFunction(frame.f_globals, new PyObject[] {}, c$23_top));
            frame.setlocal("uidl", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$24_uidl));
            return frame.getf_locals();
        }
        
        private static PyObject main$27(PyFrame frame) {
            frame.setglobal("__file__", s$53);
            
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            /* A POP3 client class.
            
            Based on the J. Myers POP3 draft, Jan. 96
             */
            frame.setlocal("re", org.python.core.imp.importOne("re", frame));
            frame.setlocal("socket", org.python.core.imp.importOne("socket", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2}));
            frame.setlocal("error_proto", Py.makeClass("error_proto", new PyObject[] {frame.getname("Exception")}, c$0_error_proto, null));
            frame.setlocal("POP3_PORT", i$3);
            frame.setlocal("CR", s$4);
            frame.setlocal("LF", s$5);
            frame.setlocal("CRLF", frame.getname("CR")._add(frame.getname("LF")));
            frame.setlocal("POP3", Py.makeClass("POP3", new PyObject[] {}, c$25_POP3, null));
            if (frame.getname("__name__")._eq(s$47).__nonzero__()) {
                frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
                frame.setlocal("a", frame.getname("POP3").__call__(frame.getname("sys").__getattr__("argv").__getitem__(i$12)));
                Py.println(frame.getname("a").invoke("getwelcome"));
                frame.getname("a").invoke("user", frame.getname("sys").__getattr__("argv").__getitem__(i$11));
                frame.getname("a").invoke("pass_", frame.getname("sys").__getattr__("argv").__getitem__(i$48));
                frame.getname("a").invoke("list");
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getname("a").invoke("stat"), 2);
                frame.setlocal("numMsgs", t$0$PyObject__[0]);
                frame.setlocal("totalSize", t$0$PyObject__[1]);
                t$0$int = 0;
                t$1$PyObject = frame.getname("range").__call__(i$12, frame.getname("numMsgs")._add(i$12));
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal("i", t$0$PyObject);
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getname("a").invoke("retr", frame.getname("i")), 3);
                    frame.setlocal("header", t$0$PyObject__[0]);
                    frame.setlocal("msg", t$0$PyObject__[1]);
                    frame.setlocal("octets", t$0$PyObject__[2]);
                    Py.printComma(s$49);
                    Py.printComma(frame.getname("i").__repr__());
                    Py.println(s$50);
                    t$1$int = 0;
                    t$3$PyObject = frame.getname("msg");
                    while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                        frame.setlocal("line", t$2$PyObject);
                        Py.println(s$51._add(frame.getname("line")));
                    }
                    Py.println(s$52);
                }
                frame.getname("a").invoke("quit");
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("poplib"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "poplib";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(poplib._PyInner.class, newargs, poplib.jpy$packages, poplib.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
