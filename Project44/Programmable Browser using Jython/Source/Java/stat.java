import org.python.core.*;

public class stat extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject i$1;
        private static PyObject i$2;
        private static PyObject i$3;
        private static PyObject i$4;
        private static PyObject i$5;
        private static PyObject i$6;
        private static PyObject i$7;
        private static PyObject i$8;
        private static PyObject i$9;
        private static PyObject i$10;
        private static PyObject i$11;
        private static PyObject i$12;
        private static PyObject i$13;
        private static PyObject i$14;
        private static PyObject i$15;
        private static PyObject i$16;
        private static PyObject i$17;
        private static PyObject i$18;
        private static PyObject i$19;
        private static PyObject i$20;
        private static PyObject i$21;
        private static PyObject i$22;
        private static PyObject i$23;
        private static PyObject i$24;
        private static PyObject i$25;
        private static PyObject i$26;
        private static PyObject i$27;
        private static PyObject i$28;
        private static PyObject i$29;
        private static PyObject s$30;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_S_IMODE;
        private static PyCode c$1_S_IFMT;
        private static PyCode c$2_S_ISDIR;
        private static PyCode c$3_S_ISCHR;
        private static PyCode c$4_S_ISBLK;
        private static PyCode c$5_S_ISREG;
        private static PyCode c$6_S_ISFIFO;
        private static PyCode c$7_S_ISLNK;
        private static PyCode c$8_S_ISSOCK;
        private static PyCode c$9_main;
        private static void initConstants() {
            s$0 = Py.newString("Constants/functions for interpreting results of os.stat() and os.lstat().\012\012Suggested usage: from stat import *\012");
            i$1 = Py.newInteger(0);
            i$2 = Py.newInteger(1);
            i$3 = Py.newInteger(2);
            i$4 = Py.newInteger(3);
            i$5 = Py.newInteger(4);
            i$6 = Py.newInteger(5);
            i$7 = Py.newInteger(6);
            i$8 = Py.newInteger(7);
            i$9 = Py.newInteger(8);
            i$10 = Py.newInteger(9);
            i$11 = Py.newInteger(4095);
            i$12 = Py.newInteger(61440);
            i$13 = Py.newInteger(16384);
            i$14 = Py.newInteger(8192);
            i$15 = Py.newInteger(24576);
            i$16 = Py.newInteger(32768);
            i$17 = Py.newInteger(4096);
            i$18 = Py.newInteger(40960);
            i$19 = Py.newInteger(49152);
            i$20 = Py.newInteger(2048);
            i$21 = Py.newInteger(1024);
            i$22 = Py.newInteger(512);
            i$23 = Py.newInteger(256);
            i$24 = Py.newInteger(128);
            i$25 = Py.newInteger(64);
            i$26 = Py.newInteger(448);
            i$27 = Py.newInteger(56);
            i$28 = Py.newInteger(32);
            i$29 = Py.newInteger(16);
            s$30 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\stat.py");
            funcTable = new _PyInner();
            c$0_S_IMODE = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_IMODE", false, false, funcTable, 0, null, null, 0, 1);
            c$1_S_IFMT = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_IFMT", false, false, funcTable, 1, null, null, 0, 1);
            c$2_S_ISDIR = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISDIR", false, false, funcTable, 2, null, null, 0, 1);
            c$3_S_ISCHR = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISCHR", false, false, funcTable, 3, null, null, 0, 1);
            c$4_S_ISBLK = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISBLK", false, false, funcTable, 4, null, null, 0, 1);
            c$5_S_ISREG = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISREG", false, false, funcTable, 5, null, null, 0, 1);
            c$6_S_ISFIFO = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISFIFO", false, false, funcTable, 6, null, null, 0, 1);
            c$7_S_ISLNK = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISLNK", false, false, funcTable, 7, null, null, 0, 1);
            c$8_S_ISSOCK = Py.newCode(1, new String[] {"mode"}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "S_ISSOCK", false, false, funcTable, 8, null, null, 0, 1);
            c$9_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\stat.py", "main", false, false, funcTable, 9, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$9_main == null) _PyInner.initConstants();
            return c$9_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.S_IMODE$1(frame);
                case 1:
                return _PyInner.S_IFMT$2(frame);
                case 2:
                return _PyInner.S_ISDIR$3(frame);
                case 3:
                return _PyInner.S_ISCHR$4(frame);
                case 4:
                return _PyInner.S_ISBLK$5(frame);
                case 5:
                return _PyInner.S_ISREG$6(frame);
                case 6:
                return _PyInner.S_ISFIFO$7(frame);
                case 7:
                return _PyInner.S_ISLNK$8(frame);
                case 8:
                return _PyInner.S_ISSOCK$9(frame);
                case 9:
                return _PyInner.main$10(frame);
                default:
                return null;
            }
        }
        
        private static PyObject S_IMODE$1(PyFrame frame) {
            return frame.getlocal(0)._and(i$11);
        }
        
        private static PyObject S_IFMT$2(PyFrame frame) {
            return frame.getlocal(0)._and(i$12);
        }
        
        private static PyObject S_ISDIR$3(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFDIR"));
        }
        
        private static PyObject S_ISCHR$4(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFCHR"));
        }
        
        private static PyObject S_ISBLK$5(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFBLK"));
        }
        
        private static PyObject S_ISREG$6(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFREG"));
        }
        
        private static PyObject S_ISFIFO$7(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFIFO"));
        }
        
        private static PyObject S_ISLNK$8(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFLNK"));
        }
        
        private static PyObject S_ISSOCK$9(PyFrame frame) {
            return frame.getglobal("S_IFMT").__call__(frame.getlocal(0))._eq(frame.getglobal("S_IFSOCK"));
        }
        
        private static PyObject main$10(PyFrame frame) {
            frame.setglobal("__file__", s$30);
            
            /* Constants/functions for interpreting results of os.stat() and os.lstat().
            
            Suggested usage: from stat import *
             */
            frame.setlocal("ST_MODE", i$1);
            frame.setlocal("ST_INO", i$2);
            frame.setlocal("ST_DEV", i$3);
            frame.setlocal("ST_NLINK", i$4);
            frame.setlocal("ST_UID", i$5);
            frame.setlocal("ST_GID", i$6);
            frame.setlocal("ST_SIZE", i$7);
            frame.setlocal("ST_ATIME", i$8);
            frame.setlocal("ST_MTIME", i$9);
            frame.setlocal("ST_CTIME", i$10);
            frame.setlocal("S_IMODE", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_S_IMODE));
            frame.setlocal("S_IFMT", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_S_IFMT));
            frame.setlocal("S_IFDIR", i$13);
            frame.setlocal("S_IFCHR", i$14);
            frame.setlocal("S_IFBLK", i$15);
            frame.setlocal("S_IFREG", i$16);
            frame.setlocal("S_IFIFO", i$17);
            frame.setlocal("S_IFLNK", i$18);
            frame.setlocal("S_IFSOCK", i$19);
            frame.setlocal("S_ISDIR", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_S_ISDIR));
            frame.setlocal("S_ISCHR", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_S_ISCHR));
            frame.setlocal("S_ISBLK", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_S_ISBLK));
            frame.setlocal("S_ISREG", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_S_ISREG));
            frame.setlocal("S_ISFIFO", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_S_ISFIFO));
            frame.setlocal("S_ISLNK", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_S_ISLNK));
            frame.setlocal("S_ISSOCK", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_S_ISSOCK));
            frame.setlocal("S_ISUID", i$20);
            frame.setlocal("S_ISGID", i$21);
            frame.setlocal("S_ENFMT", frame.getname("S_ISGID"));
            frame.setlocal("S_ISVTX", i$22);
            frame.setlocal("S_IREAD", i$23);
            frame.setlocal("S_IWRITE", i$24);
            frame.setlocal("S_IEXEC", i$25);
            frame.setlocal("S_IRWXU", i$26);
            frame.setlocal("S_IRUSR", i$23);
            frame.setlocal("S_IWUSR", i$24);
            frame.setlocal("S_IXUSR", i$25);
            frame.setlocal("S_IRWXG", i$27);
            frame.setlocal("S_IRGRP", i$28);
            frame.setlocal("S_IWGRP", i$29);
            frame.setlocal("S_IXGRP", i$9);
            frame.setlocal("S_IRWXO", i$8);
            frame.setlocal("S_IROTH", i$5);
            frame.setlocal("S_IWOTH", i$3);
            frame.setlocal("S_IXOTH", i$2);
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("stat"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "stat";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(stat._PyInner.class, newargs, stat.jpy$packages, stat.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
