import org.python.core.*;

public class getopt extends java.lang.Object {
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
        private static PyObject i$6;
        private static PyObject s$7;
        private static PyObject s$8;
        private static PyObject i$9;
        private static PyObject i$10;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1___str__;
        private static PyCode c$2_GetoptError;
        private static PyCode c$3_getopt;
        private static PyCode c$4_do_longs;
        private static PyCode c$5_long_has_args;
        private static PyCode c$6_do_shorts;
        private static PyCode c$7_short_has_arg;
        private static PyCode c$8_main;
        private static void initConstants() {
            s$0 = Py.newString("Parser for command line options.\012\012This module helps scripts to parse the command line arguments in\012sys.argv.  It supports the same conventions as the Unix getopt()\012function (including the special meanings of arguments of the form `-'\012and `--').  Long options similar to those supported by GNU software\012may be used as well via an optional third argument.  This module\012provides a single function and an exception:\012\012getopt() -- Parse command line options\012GetoptError -- exception (class) raised with 'opt' attribute, which is the\012option involved with the exception.\012");
            s$1 = Py.newString("GetoptError");
            s$2 = Py.newString("error");
            s$3 = Py.newString("getopt");
            s$4 = Py.newString("");
            s$5 = Py.newString("getopt(args, options[, long_options]) -> opts, args\012\012    Parses command line options and parameter list.  args is the\012    argument list to be parsed, without the leading reference to the\012    running program.  Typically, this means \"sys.argv[1:]\".  shortopts\012    is the string of option letters that the script wants to\012    recognize, with options that require an argument followed by a\012    colon (i.e., the same format that Unix getopt() uses).  If\012    specified, longopts is a list of strings with the names of the\012    long options which should be supported.  The leading '--'\012    characters should not be included in the option name.  Options\012    which require an argument should be followed by an equal sign\012    ('=').\012\012    The return value consists of two elements: the first is a list of\012    (option, value) pairs; the second is the list of program arguments\012    left after the option list was stripped (this is a trailing slice\012    of the first argument).  Each option-and-value pair returned has\012    the option as its first element, prefixed with a hyphen (e.g.,\012    '-x'), and the option argument as its second element, or an empty\012    string if the option has no argument.  The options occur in the\012    list in the same order in which they were found, thus allowing\012    multiple occurrences.  Long and short options may be mixed.\012\012    ");
            i$6 = Py.newInteger(0);
            s$7 = Py.newString("-");
            s$8 = Py.newString("--");
            i$9 = Py.newInteger(1);
            i$10 = Py.newInteger(2);
            s$11 = Py.newString("=");
            s$12 = Py.newString("option --%s requires argument");
            s$13 = Py.newString("option --%s must not have an argument");
            s$14 = Py.newString("option --%s not recognized");
            s$15 = Py.newString("option --%s not a unique prefix");
            s$16 = Py.newString("option -%s requires argument");
            s$17 = Py.newString(":");
            s$18 = Py.newString("option -%s not recognized");
            s$19 = Py.newString("__main__");
            s$20 = Py.newString("a:b");
            s$21 = Py.newString("alpha=");
            s$22 = Py.newString("beta");
            s$23 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\getopt.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(3, new String[] {"self", "msg", "opt"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "__init__", false, false, funcTable, 1, null, null, 0, 1);
            c$1___str__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "__str__", false, false, funcTable, 2, null, null, 0, 1);
            c$2_GetoptError = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "GetoptError", false, false, funcTable, 3, null, null, 0, 0);
            c$3_getopt = Py.newCode(3, new String[] {"args", "shortopts", "longopts", "opts"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "getopt", false, false, funcTable, 4, null, null, 0, 1);
            c$4_do_longs = Py.newCode(4, new String[] {"opts", "opt", "longopts", "args", "has_arg", "i", "optarg"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "do_longs", false, false, funcTable, 5, null, null, 0, 1);
            c$5_long_has_args = Py.newCode(2, new String[] {"opt", "longopts", "possibilities", "unique_match", "o", "has_arg"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "long_has_args", false, false, funcTable, 6, null, null, 0, 1);
            c$6_do_shorts = Py.newCode(4, new String[] {"opts", "optstring", "shortopts", "args", "opt", "optarg"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "do_shorts", false, false, funcTable, 7, null, null, 0, 1);
            c$7_short_has_arg = Py.newCode(2, new String[] {"opt", "shortopts", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "short_has_arg", false, false, funcTable, 8, null, null, 0, 1);
            c$8_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\getopt.py", "main", false, false, funcTable, 9, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$8_main == null) _PyInner.initConstants();
            return c$8_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__listcomprehension$1(frame);
                case 1:
                return _PyInner.__init__$2(frame);
                case 2:
                return _PyInner.__str__$3(frame);
                case 3:
                return _PyInner.GetoptError$4(frame);
                case 4:
                return _PyInner.getopt$5(frame);
                case 5:
                return _PyInner.do_longs$6(frame);
                case 6:
                return _PyInner.long_has_args$7(frame);
                case 7:
                return _PyInner.do_shorts$8(frame);
                case 8:
                return _PyInner.short_has_arg$9(frame);
                case 9:
                return _PyInner.main$10(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __listcomprehension$1(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            t$0$PyObject = new PyList(new PyObject[] {});
            t$1$PyObject = t$0$PyObject.__getattr__("append");
            t$0$int = 0;
            t$3$PyObject = frame.getlocal(1);
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$2$PyObject);
                if (frame.getlocal(4).invoke("startswith", frame.getlocal(0)).__nonzero__()) {
                    t$1$PyObject.__call__(frame.getlocal(4));
                }
            }
            return t$0$PyObject;
        }
        
        private static PyObject __init__$2(PyFrame frame) {
            frame.getlocal(0).__setattr__("msg", frame.getlocal(1));
            frame.getlocal(0).__setattr__("opt", frame.getlocal(2));
            frame.getglobal("Exception").invoke("__init__", new PyObject[] {frame.getlocal(0), frame.getlocal(1), frame.getlocal(2)});
            return Py.None;
        }
        
        private static PyObject __str__$3(PyFrame frame) {
            return frame.getlocal(0).__getattr__("msg");
        }
        
        private static PyObject GetoptError$4(PyFrame frame) {
            frame.setlocal("opt", s$4);
            frame.setlocal("msg", s$4);
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$0___init__));
            frame.setlocal("__str__", new PyFunction(frame.f_globals, new PyObject[] {}, c$1___str__));
            return frame.getf_locals();
        }
        
        private static PyObject getopt$5(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* getopt(args, options[, long_options]) -> opts, args
            
                Parses command line options and parameter list.  args is the
                argument list to be parsed, without the leading reference to the
                running program.  Typically, this means "sys.argv[1:]".  shortopts
                is the string of option letters that the script wants to
                recognize, with options that require an argument followed by a
                colon (i.e., the same format that Unix getopt() uses).  If
                specified, longopts is a list of strings with the names of the
                long options which should be supported.  The leading '--'
                characters should not be included in the option name.  Options
                which require an argument should be followed by an equal sign
                ('=').
            
                The return value consists of two elements: the first is a list of
                (option, value) pairs; the second is the list of program arguments
                left after the option list was stripped (this is a trailing slice
                of the first argument).  Each option-and-value pair returned has
                the option as its first element, prefixed with a hyphen (e.g.,
                '-x'), and the option argument as its second element, or an empty
                string if the option has no argument.  The options occur in the
                list in the same order in which they were found, thus allowing
                multiple occurrences.  Long and short options may be mixed.
            
                 */
            frame.setlocal(3, new PyList(new PyObject[] {}));
            if (frame.getglobal("type").__call__(frame.getlocal(2))._eq(frame.getglobal("type").__call__(s$4)).__nonzero__()) {
                frame.setlocal(2, new PyList(new PyObject[] {frame.getlocal(2)}));
            }
            else {
                frame.setlocal(2, frame.getglobal("list").__call__(frame.getlocal(2)));
            }
            while (((t$0$PyObject = ((t$1$PyObject = frame.getlocal(0)).__nonzero__() ? frame.getlocal(0).__getitem__(i$6).invoke("startswith", s$7) : t$1$PyObject)).__nonzero__() ? frame.getlocal(0).__getitem__(i$6)._ne(s$7) : t$0$PyObject).__nonzero__()) {
                if (frame.getlocal(0).__getitem__(i$6)._eq(s$8).__nonzero__()) {
                    frame.setlocal(0, frame.getlocal(0).__getslice__(i$9, null, null));
                    break;
                }
                if (frame.getlocal(0).__getitem__(i$6).__getslice__(null, i$10, null)._eq(s$8).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("do_longs").__call__(new PyObject[] {frame.getlocal(3), frame.getlocal(0).__getitem__(i$6).__getslice__(i$10, null, null), frame.getlocal(2), frame.getlocal(0).__getslice__(i$9, null, null)}), 2);
                    frame.setlocal(3, t$0$PyObject__[0]);
                    frame.setlocal(0, t$0$PyObject__[1]);
                }
                else {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("do_shorts").__call__(new PyObject[] {frame.getlocal(3), frame.getlocal(0).__getitem__(i$6).__getslice__(i$9, null, null), frame.getlocal(1), frame.getlocal(0).__getslice__(i$9, null, null)}), 2);
                    frame.setlocal(3, t$0$PyObject__[0]);
                    frame.setlocal(0, t$0$PyObject__[1]);
                }
            }
            return new PyTuple(new PyObject[] {frame.getlocal(3), frame.getlocal(0)});
        }
        
        private static PyObject do_longs$6(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            boolean t$0$boolean;
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            t$0$boolean = true;
            try {
                frame.setlocal(5, frame.getlocal(1).invoke("index", s$11));
            }
            catch (Throwable x$0) {
                t$0$boolean = false;
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("ValueError"))) {
                    frame.setlocal(6, frame.getglobal("None"));
                }
                else throw t$0$PyException;
            }
            if (t$0$boolean) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(null, frame.getlocal(5), null), frame.getlocal(1).__getslice__(frame.getlocal(5)._add(i$9), null, null)}), 2);
                frame.setlocal(1, t$0$PyObject__[0]);
                frame.setlocal(6, t$0$PyObject__[1]);
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("long_has_args").__call__(frame.getlocal(1), frame.getlocal(2)), 2);
            frame.setlocal(4, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            if (frame.getlocal(4).__nonzero__()) {
                if (frame.getlocal(6)._is(frame.getglobal("None")).__nonzero__()) {
                    if (frame.getlocal(3).__not__().__nonzero__()) {
                        throw Py.makeException(frame.getglobal("GetoptError").__call__(s$12._mod(frame.getlocal(1)), frame.getlocal(1)));
                    }
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(3).__getitem__(i$6), frame.getlocal(3).__getslice__(i$9, null, null)}), 2);
                    frame.setlocal(6, t$0$PyObject__[0]);
                    frame.setlocal(3, t$0$PyObject__[1]);
                }
            }
            else if (frame.getlocal(6).__nonzero__()) {
                throw Py.makeException(frame.getglobal("GetoptError").__call__(s$13._mod(frame.getlocal(1)), frame.getlocal(1)));
            }
            frame.getlocal(0).invoke("append", new PyTuple(new PyObject[] {s$8._add(frame.getlocal(1)), (t$0$PyObject = frame.getlocal(6)).__nonzero__() ? t$0$PyObject : s$4}));
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getlocal(3)});
        }
        
        private static PyObject long_has_args$7(PyFrame frame) {
            frame.setlocal(2, __listcomprehension$1(frame));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                throw Py.makeException(frame.getglobal("GetoptError").__call__(s$14._mod(frame.getlocal(0)), frame.getlocal(0)));
            }
            if (frame.getlocal(0)._in(frame.getlocal(2)).__nonzero__()) {
                return new PyTuple(new PyObject[] {i$6, frame.getlocal(0)});
            }
            else if (frame.getlocal(0)._add(s$11)._in(frame.getlocal(2)).__nonzero__()) {
                return new PyTuple(new PyObject[] {i$9, frame.getlocal(0)});
            }
            if (frame.getglobal("len").__call__(frame.getlocal(2))._gt(i$9).__nonzero__()) {
                throw Py.makeException(frame.getglobal("GetoptError").__call__(s$15._mod(frame.getlocal(0)), frame.getlocal(0)));
            }
            if (frame.getglobal("__debug__").__nonzero__()) Py.assert(frame.getglobal("len").__call__(frame.getlocal(2))._eq(i$9));
            frame.setlocal(3, frame.getlocal(2).__getitem__(i$6));
            frame.setlocal(5, frame.getlocal(3).invoke("endswith", s$11));
            if (frame.getlocal(5).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(3).__getslice__(null, i$9.__neg__(), null));
            }
            return new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(3)});
        }
        
        private static PyObject do_shorts$8(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            while (frame.getlocal(1)._ne(s$4).__nonzero__()) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1).__getitem__(i$6), frame.getlocal(1).__getslice__(i$9, null, null)}), 2);
                frame.setlocal(4, t$0$PyObject__[0]);
                frame.setlocal(1, t$0$PyObject__[1]);
                if (frame.getglobal("short_has_arg").__call__(frame.getlocal(4), frame.getlocal(2)).__nonzero__()) {
                    if (frame.getlocal(1)._eq(s$4).__nonzero__()) {
                        if (frame.getlocal(3).__not__().__nonzero__()) {
                            throw Py.makeException(frame.getglobal("GetoptError").__call__(s$16._mod(frame.getlocal(4)), frame.getlocal(4)));
                        }
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(3).__getitem__(i$6), frame.getlocal(3).__getslice__(i$9, null, null)}), 2);
                        frame.setlocal(1, t$0$PyObject__[0]);
                        frame.setlocal(3, t$0$PyObject__[1]);
                    }
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1), s$4}), 2);
                    frame.setlocal(5, t$0$PyObject__[0]);
                    frame.setlocal(1, t$0$PyObject__[1]);
                }
                else {
                    frame.setlocal(5, s$4);
                }
                frame.getlocal(0).invoke("append", new PyTuple(new PyObject[] {s$7._add(frame.getlocal(4)), frame.getlocal(5)}));
            }
            return new PyTuple(new PyObject[] {frame.getlocal(0), frame.getlocal(3)});
        }
        
        private static PyObject short_has_arg$9(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject;
            
            // Code
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(1)));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if ((frame.getlocal(0)._eq(t$2$PyObject = frame.getlocal(1).__getitem__(frame.getlocal(2))).__nonzero__() ? t$2$PyObject._ne(s$17) : Py.Zero).__nonzero__()) {
                    return frame.getlocal(1).__getslice__(frame.getlocal(2)._add(i$9), frame.getlocal(2)._add(i$10), null)._eq(s$17);
                }
            }
            throw Py.makeException(frame.getglobal("GetoptError").__call__(s$18._mod(frame.getlocal(0)), frame.getlocal(0)));
        }
        
        private static PyObject main$10(PyFrame frame) {
            frame.setglobal("__file__", s$23);
            
            /* Parser for command line options.
            
            This module helps scripts to parse the command line arguments in
            sys.argv.  It supports the same conventions as the Unix getopt()
            function (including the special meanings of arguments of the form `-'
            and `--').  Long options similar to those supported by GNU software
            may be used as well via an optional third argument.  This module
            provides a single function and an exception:
            
            getopt() -- Parse command line options
            GetoptError -- exception (class) raised with 'opt' attribute, which is the
            option involved with the exception.
             */
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3}));
            frame.setlocal("GetoptError", Py.makeClass("GetoptError", new PyObject[] {frame.getname("Exception")}, c$2_GetoptError, null));
            frame.setlocal("error", frame.getname("GetoptError"));
            frame.setlocal("getopt", new PyFunction(frame.f_globals, new PyObject[] {new PyList(new PyObject[] {})}, c$3_getopt));
            frame.setlocal("do_longs", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_do_longs));
            frame.setlocal("long_has_args", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_long_has_args));
            frame.setlocal("do_shorts", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_do_shorts));
            frame.setlocal("short_has_arg", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_short_has_arg));
            if (frame.getname("__name__")._eq(s$19).__nonzero__()) {
                frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
                Py.println(frame.getname("getopt").__call__(frame.getname("sys").__getattr__("argv").__getslice__(i$9, null, null), s$20, new PyList(new PyObject[] {s$21, s$22})));
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("getopt"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "getopt";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(getopt._PyInner.class, newargs, getopt.jpy$packages, getopt.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
