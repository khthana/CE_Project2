import org.python.core.*;

public class nturl2path extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject i$3;
        private static PyObject s$4;
        private static PyObject i$5;
        private static PyObject s$6;
        private static PyObject s$7;
        private static PyObject i$8;
        private static PyObject i$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject s$15;
        private static PyObject s$16;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_url2pathname;
        private static PyCode c$1_pathname2url;
        private static PyCode c$2_main;
        private static void initConstants() {
            s$0 = Py.newString("Convert a NT pathname to a file URL and vice versa.");
            s$1 = Py.newString("Convert a URL to a DOS path.\012\012            ///C|/foo/bar/spam.foo\012\012                    becomes\012\012            C:\\foo\\bar\\spam.foo\012    ");
            s$2 = Py.newString("|");
            i$3 = Py.newInteger(4);
            s$4 = Py.newString("////");
            i$5 = Py.newInteger(2);
            s$6 = Py.newString("/");
            s$7 = Py.newString("\\");
            i$8 = Py.newInteger(1);
            i$9 = Py.newInteger(0);
            s$10 = Py.newString("Bad URL: ");
            s$11 = Py.newString(":");
            s$12 = Py.newString("Convert a DOS path name to a file url.\012\012            C:\\foo\\bar\\spam.foo\012\012                    becomes\012\012            ///C|/foo/bar/spam.foo\012    ");
            s$13 = Py.newString("\\\\");
            s$14 = Py.newString("Bad path: ");
            s$15 = Py.newString("///");
            s$16 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\nturl2path.py");
            funcTable = new _PyInner();
            c$0_url2pathname = Py.newCode(1, new String[] {"url", "urllib", "components", "string", "comp", "error", "drive", "path"}, "C:\\jdk1.4\\jython2.1\\Lib\\nturl2path.py", "url2pathname", false, false, funcTable, 0, null, null, 0, 1);
            c$1_pathname2url = Py.newCode(1, new String[] {"p", "urllib", "components", "string", "comp", "error", "drive", "path"}, "C:\\jdk1.4\\jython2.1\\Lib\\nturl2path.py", "pathname2url", false, false, funcTable, 1, null, null, 0, 1);
            c$2_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\nturl2path.py", "main", false, false, funcTable, 2, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$2_main == null) _PyInner.initConstants();
            return c$2_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.url2pathname$1(frame);
                case 1:
                return _PyInner.pathname2url$2(frame);
                case 2:
                return _PyInner.main$3(frame);
                default:
                return null;
            }
        }
        
        private static PyObject url2pathname$1(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Convert a URL to a DOS path.
            
                        ///C|/foo/bar/spam.foo
            
                                becomes
            
                        C:\foo\bar\spam.foo
                 */
            frame.setlocal(3, org.python.core.imp.importOne("string", frame));
            frame.setlocal(1, org.python.core.imp.importOne("urllib", frame));
            if (s$2._in(frame.getlocal(0)).__not__().__nonzero__()) {
                if (frame.getlocal(0).__getslice__(null, i$3, null)._eq(s$4).__nonzero__()) {
                    frame.setlocal(0, frame.getlocal(0).__getslice__(i$5, null, null));
                }
                frame.setlocal(2, frame.getlocal(0).invoke("split", s$6));
                return frame.getlocal(1).__getattr__("unquote").__call__(s$7.invoke("join", frame.getlocal(2)));
            }
            frame.setlocal(4, frame.getlocal(0).invoke("split", s$2));
            if (((t$0$PyObject = frame.getglobal("len").__call__(frame.getlocal(4))._ne(i$5)).__nonzero__() ? t$0$PyObject : frame.getlocal(4).__getitem__(i$9).__getitem__(i$8.__neg__())._notin(frame.getlocal(3).__getattr__("letters"))).__nonzero__()) {
                frame.setlocal(5, s$10._add(frame.getlocal(0)));
                throw Py.makeException(frame.getglobal("IOError"), frame.getlocal(5));
            }
            frame.setlocal(6, frame.getlocal(4).__getitem__(i$9).__getitem__(i$8.__neg__()).invoke("upper"));
            frame.setlocal(2, frame.getlocal(4).__getitem__(i$8).invoke("split", s$6));
            frame.setlocal(7, frame.getlocal(6)._add(s$11));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(2);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                if (frame.getlocal(4).__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(7)._add(s$7)._add(frame.getlocal(1).__getattr__("unquote").__call__(frame.getlocal(4))));
                }
            }
            return frame.getlocal(7);
        }
        
        private static PyObject pathname2url$2(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Convert a DOS path name to a file url.
            
                        C:\foo\bar\spam.foo
            
                                becomes
            
                        ///C|/foo/bar/spam.foo
                 */
            frame.setlocal(3, org.python.core.imp.importOne("string", frame));
            frame.setlocal(1, org.python.core.imp.importOne("urllib", frame));
            if (s$11._in(frame.getlocal(0)).__not__().__nonzero__()) {
                if (frame.getlocal(0).__getslice__(null, i$5, null)._eq(s$13).__nonzero__()) {
                    frame.setlocal(0, s$13._add(frame.getlocal(0)));
                }
                frame.setlocal(2, frame.getlocal(0).invoke("split", s$7));
                return frame.getlocal(1).__getattr__("quote").__call__(s$6.invoke("join", frame.getlocal(2)));
            }
            frame.setlocal(4, frame.getlocal(0).invoke("split", s$11));
            if (((t$0$PyObject = frame.getglobal("len").__call__(frame.getlocal(4))._ne(i$5)).__nonzero__() ? t$0$PyObject : frame.getglobal("len").__call__(frame.getlocal(4).__getitem__(i$9))._gt(i$8)).__nonzero__()) {
                frame.setlocal(5, s$14._add(frame.getlocal(0)));
                throw Py.makeException(frame.getglobal("IOError"), frame.getlocal(5));
            }
            frame.setlocal(6, frame.getlocal(1).__getattr__("quote").__call__(frame.getlocal(4).__getitem__(i$9).invoke("upper")));
            frame.setlocal(2, frame.getlocal(4).__getitem__(i$8).invoke("split", s$7));
            frame.setlocal(7, s$15._add(frame.getlocal(6))._add(s$2));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(2);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                if (frame.getlocal(4).__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(7)._add(s$6)._add(frame.getlocal(1).__getattr__("quote").__call__(frame.getlocal(4))));
                }
            }
            return frame.getlocal(7);
        }
        
        private static PyObject main$3(PyFrame frame) {
            frame.setglobal("__file__", s$16);
            
            /* Convert a NT pathname to a file URL and vice versa. */
            frame.setlocal("url2pathname", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_url2pathname));
            frame.setlocal("pathname2url", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_pathname2url));
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("nturl2path"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "nturl2path";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(nturl2path._PyInner.class, newargs, nturl2path.jpy$packages, nturl2path.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
