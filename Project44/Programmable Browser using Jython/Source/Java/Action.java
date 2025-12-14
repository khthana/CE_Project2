import org.python.core.*;

public class Action extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject i$0;
        private static PyObject i$1;
        private static PyObject s$2;
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_actionPerformed;
        private static PyCode c$2_createMenuItem;
        private static PyCode c$3_Action;
        private static PyCode c$4_actionPerformed;
        private static PyCode c$5_TargetAction;
        private static PyCode c$6_main;
        private static void initConstants() {
            i$0 = Py.newInteger(1);
            i$1 = Py.newInteger(0);
            s$2 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\Action.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(6, new String[] {"self", "name", "action", "icon", "description", "needEvent"}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_actionPerformed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "actionPerformed", false, false, funcTable, 1, null, null, 0, 1);
            c$2_createMenuItem = Py.newCode(1, new String[] {"self", "mi"}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "createMenuItem", false, false, funcTable, 2, null, null, 0, 1);
            c$3_Action = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "Action", false, false, funcTable, 3, null, null, 0, 0);
            c$4_actionPerformed = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "actionPerformed", false, false, funcTable, 4, null, null, 0, 1);
            c$5_TargetAction = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "TargetAction", false, false, funcTable, 5, null, null, 0, 0);
            c$6_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Action.py", "main", false, false, funcTable, 6, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$6_main == null) _PyInner.initConstants();
            return c$6_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.actionPerformed$2(frame);
                case 2:
                return _PyInner.createMenuItem$3(frame);
                case 3:
                return _PyInner.Action$4(frame);
                case 4:
                return _PyInner.actionPerformed$5(frame);
                case 5:
                return _PyInner.TargetAction$6(frame);
                case 6:
                return _PyInner.main$7(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, frame.getlocal(1));
                frame.setlocal(1, frame.getlocal(2).__getattr__("__name__"));
            }
            frame.getlocal(0).__setattr__("name", frame.getlocal(1));
            frame.getlocal(0).__setattr__("icon", frame.getlocal(3));
            if (frame.getlocal(3).__nonzero__()) {
                frame.getlocal(0).invoke("setIcon", frame.getglobal("swing").__getattr__("Action").__getattr__("SMALL_ICON"), frame.getlocal(3));
            }
            if (frame.getlocal(4).__nonzero__()) {
                frame.getlocal(0).invoke("setText", frame.getglobal("swing").__getattr__("Action").__getattr__("SHORT_DESCRIPTION"), frame.getlocal(4));
                frame.getlocal(0).__setattr__("description", frame.getlocal(4));
            }
            else {
                frame.getlocal(0).__setattr__("description", frame.getlocal(1));
            }
            frame.getlocal(0).__setattr__("action", frame.getlocal(2));
            frame.getlocal(0).__setattr__("enabled", i$0);
            frame.getlocal(0).__setattr__("needEvent", frame.getlocal(5));
            return Py.None;
        }
        
        private static PyObject actionPerformed$2(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("needEvent").__nonzero__()) {
                frame.getlocal(0).invoke("action", frame.getlocal(1));
            }
            else {
                frame.getlocal(0).invoke("action");
            }
            return Py.None;
        }
        
        private static PyObject createMenuItem$3(PyFrame frame) {
            frame.setlocal(1, frame.getglobal("swing").__getattr__("JMenuItem").__call__(new PyObject[] {frame.getlocal(0).__getattr__("name"), frame.getlocal(0), frame.getlocal(0).__getattr__("enabled")}, new String[] {"actionListener", "enabled"}));
            return frame.getlocal(1);
        }
        
        private static PyObject Action$4(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), frame.getname("None"), frame.getname("None"), i$1}, c$0___init__));
            frame.setlocal("actionPerformed", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_actionPerformed));
            frame.setlocal("createMenuItem", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_createMenuItem));
            return frame.getf_locals();
        }
        
        private static PyObject actionPerformed$5(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("needEvent").__nonzero__()) {
                frame.getlocal(0).invoke("action", frame.getlocal(0).invoke("getTarget"), frame.getlocal(1));
            }
            else {
                frame.getlocal(0).invoke("action", frame.getlocal(0).invoke("getTarget"));
            }
            return Py.None;
        }
        
        private static PyObject TargetAction$6(PyFrame frame) {
            frame.setlocal("actionPerformed", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_actionPerformed));
            return frame.getf_locals();
        }
        
        private static PyObject main$7(PyFrame frame) {
            frame.setglobal("__file__", s$2);
            
            PyObject[] imp_accu;
            // Code
            imp_accu = org.python.core.imp.importFrom("pawt", new String[] {"swing"}, frame);
            frame.setlocal("swing", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("Action", Py.makeClass("Action", new PyObject[] {frame.getname("swing").__getattr__("AbstractAction")}, c$3_Action, null));
            frame.setlocal("TargetAction", Py.makeClass("TargetAction", new PyObject[] {frame.getname("Action")}, c$5_TargetAction, null));
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("Action"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "Action";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(Action._PyInner.class, newargs, Action.jpy$packages, Action.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
