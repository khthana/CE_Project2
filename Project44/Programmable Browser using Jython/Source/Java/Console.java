import org.python.core.*;

public class Console extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject i$2;
        private static PyObject i$3;
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
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyObject s$27;
        private static PyObject s$28;
        private static PyObject s$29;
        private static PyObject s$30;
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_flush;
        private static PyCode c$2_write;
        private static PyCode c$3_OutputBuffer;
        private static PyCode c$4___init__;
        private static PyCode c$5_write;
        private static PyCode c$6_beep;
        private static PyCode c$7_startUserInput;
        private static PyCode c$8_getinput;
        private static PyCode c$9_replaceinput;
        private static PyCode c$10_enter;
        private static PyCode c$11_gethistory;
        private static PyCode c$12_uphistory;
        private static PyCode c$13_downhistory;
        private static PyCode c$14_tab;
        private static PyCode c$15_escape;
        private static PyCode c$16_del;
        private static PyCode c$17_capturePythonOutput;
        private static PyCode c$18_handleLine;
        private static PyCode c$19_newInput;
        private static PyCode c$20_Console;
        private static PyCode c$21___init__;
        private static PyCode c$22_run;
        private static PyCode c$23_stopPython;
        private static PyCode c$24_PythonThread;
        private static PyCode c$25_main;
        private static void initConstants() {
            s$0 = Py.newString("This is a substantially improved version of the older Interpreter.py demo\012It creates a simple GUI JPython console window with simple history\012as well as the ability to interupt running code (with the ESC key).\012\012Like Interpreter.py, this is still just a demo, and needs substantial\012work before serious use.\012\012Thanks to Geza Groma (groma@everx.szbk.u-szeged.hu) for several valuable\012ideas for this tool -- his JPConsole is a more refined implementation\012of similar ideas.\012");
            s$1 = Py.newString("normal");
            i$2 = Py.newInteger(3);
            i$3 = Py.newInteger(12);
            s$4 = Py.newString("Courier");
            s$5 = Py.newString("error");
            s$6 = Py.newString("output");
            s$7 = Py.newString("input");
            s$8 = Py.newString("prompt");
            s$9 = Py.newString("header");
            s$10 = Py.newString("StyledEditorKit$ForegroundAction");
            s$11 = Py.newString("start input");
            s$12 = Py.newString("enter");
            s$13 = Py.newString("tab");
            s$14 = Py.newString("escape");
            s$15 = Py.newString("delete");
            s$16 = Py.newString("up");
            s$17 = Py.newString("down");
            i$18 = Py.newInteger(0);
            i$19 = Py.newInteger(1);
            s$20 = Py.newString("\012");
            s$21 = Py.newString("\011");
            s$22 = Py.newString("pythonThread");
            s$23 = Py.newString("");
            s$24 = Py.newString("JPython %(version)s on %(platform)s\012%(copyright)s\012");
            s$25 = Py.newString("version");
            s$26 = Py.newString("platform");
            s$27 = Py.newString("copyright");
            s$28 = Py.newString("__main__");
            s$29 = Py.newString("op");
            s$30 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\Console.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(3, new String[] {"self", "console", "stylename"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_flush = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "flush", false, false, funcTable, 1, null, null, 0, 1);
            c$2_write = Py.newCode(2, new String[] {"self", "text"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "write", false, false, funcTable, 2, null, null, 0, 1);
            c$3_OutputBuffer = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "OutputBuffer", false, false, funcTable, 3, null, null, 0, 0);
            c$4___init__ = Py.newCode(4, new String[] {"self", "styles", "keymap", "agent", "basic", "ForegroundAction"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "__init__", false, false, funcTable, 4, null, null, 0, 1);
            c$5_write = Py.newCode(3, new String[] {"self", "text", "stylename", "style"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "write", false, false, funcTable, 5, null, null, 0, 1);
            c$6_beep = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "beep", false, false, funcTable, 6, null, null, 0, 1);
            c$7_startUserInput = Py.newCode(2, new String[] {"self", "prompt", "ae"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "startUserInput", false, false, funcTable, 7, null, null, 0, 1);
            c$8_getinput = Py.newCode(1, new String[] {"self", "line", "offset"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "getinput", false, false, funcTable, 8, null, null, 0, 1);
            c$9_replaceinput = Py.newCode(2, new String[] {"self", "text", "offset"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "replaceinput", false, false, funcTable, 9, null, null, 0, 1);
            c$10_enter = Py.newCode(1, new String[] {"self", "line"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "enter", false, false, funcTable, 10, null, null, 0, 1);
            c$11_gethistory = Py.newCode(2, new String[] {"self", "direction", "historyLength", "pos"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "gethistory", false, false, funcTable, 11, null, null, 0, 1);
            c$12_uphistory = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "uphistory", false, false, funcTable, 12, null, null, 0, 1);
            c$13_downhistory = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "downhistory", false, false, funcTable, 13, null, null, 0, 1);
            c$14_tab = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "tab", false, false, funcTable, 14, null, null, 0, 1);
            c$15_escape = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "escape", false, false, funcTable, 15, null, null, 0, 1);
            c$16_del = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "del", false, false, funcTable, 16, null, null, 0, 1);
            c$17_capturePythonOutput = Py.newCode(3, new String[] {"self", "stdoutStyle", "stderrStyle", "sys"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "capturePythonOutput", false, false, funcTable, 17, null, null, 0, 1);
            c$18_handleLine = Py.newCode(2, new String[] {"self", "text", "code", "pt"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "handleLine", false, false, funcTable, 18, null, null, 0, 1);
            c$19_newInput = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "newInput", false, false, funcTable, 19, null, null, 0, 1);
            c$20_Console = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "Console", false, false, funcTable, 20, null, null, 0, 0);
            c$21___init__ = Py.newCode(4, new String[] {"self", "code", "console", "nameSpace"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "__init__", false, false, funcTable, 21, null, null, 0, 1);
            c$22_run = Py.newCode(1, new String[] {"self", "m", "l", "exc_traceback", "exc_type", "exc_value"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "run", false, false, funcTable, 22, null, null, 0, 0);
            c$23_stopPython = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "stopPython", false, false, funcTable, 23, null, null, 0, 1);
            c$24_PythonThread = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "PythonThread", false, false, funcTable, 24, null, null, 0, 0);
            c$25_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Console.py", "main", false, false, funcTable, 25, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$25_main == null) _PyInner.initConstants();
            return c$25_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.flush$2(frame);
                case 2:
                return _PyInner.write$3(frame);
                case 3:
                return _PyInner.OutputBuffer$4(frame);
                case 4:
                return _PyInner.__init__$5(frame);
                case 5:
                return _PyInner.write$6(frame);
                case 6:
                return _PyInner.beep$7(frame);
                case 7:
                return _PyInner.startUserInput$8(frame);
                case 8:
                return _PyInner.getinput$9(frame);
                case 9:
                return _PyInner.replaceinput$10(frame);
                case 10:
                return _PyInner.enter$11(frame);
                case 11:
                return _PyInner.gethistory$12(frame);
                case 12:
                return _PyInner.uphistory$13(frame);
                case 13:
                return _PyInner.downhistory$14(frame);
                case 14:
                return _PyInner.tab$15(frame);
                case 15:
                return _PyInner.escape$16(frame);
                case 16:
                return _PyInner.del$17(frame);
                case 17:
                return _PyInner.capturePythonOutput$18(frame);
                case 18:
                return _PyInner.handleLine$19(frame);
                case 19:
                return _PyInner.newInput$20(frame);
                case 20:
                return _PyInner.Console$21(frame);
                case 21:
                return _PyInner.__init__$22(frame);
                case 22:
                return _PyInner.run$23(frame);
                case 23:
                return _PyInner.stopPython$24(frame);
                case 24:
                return _PyInner.PythonThread$25(frame);
                case 25:
                return _PyInner.main$26(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("console", frame.getlocal(1));
            frame.getlocal(0).__setattr__("stylename", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject flush$2(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject write$3(PyFrame frame) {
            frame.getlocal(0).__getattr__("console").invoke("write", frame.getlocal(1), frame.getlocal(0).__getattr__("stylename"));
            return Py.None;
        }
        
        private static PyObject OutputBuffer$4(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$0___init__));
            frame.setlocal("flush", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_flush));
            frame.setlocal("write", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_write));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$5(PyFrame frame) {
            frame.getlocal(0).__setattr__("agent", frame.getlocal(3));
            if (frame.getlocal(1)._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(1, frame.getglobal("Styles").__call__());
                frame.setlocal(4, frame.getlocal(1).__getattr__("add").__call__(new PyObject[] {s$1, i$2, i$3, s$4}, new String[] {"tabsize", "fontSize", "fontFamily"}));
                frame.getlocal(1).__getattr__("add").__call__(new PyObject[] {s$5, frame.getlocal(4), frame.getglobal("colors").__getattr__("red")}, new String[] {"parent", "foreground"});
                frame.getlocal(1).__getattr__("add").__call__(new PyObject[] {s$6, frame.getlocal(4), frame.getglobal("colors").__getattr__("blue")}, new String[] {"parent", "foreground"});
                frame.getlocal(1).__getattr__("add").__call__(new PyObject[] {s$7, frame.getlocal(4), frame.getglobal("colors").__getattr__("black")}, new String[] {"parent", "foreground"});
                frame.getlocal(1).__getattr__("add").__call__(new PyObject[] {s$8, frame.getlocal(4), frame.getglobal("colors").__getattr__("purple")}, new String[] {"parent", "foreground"});
                frame.getlocal(1).__getattr__("add").__call__(new PyObject[] {s$9, frame.getlocal(4), frame.getglobal("colors").__getattr__("green")}, new String[] {"parent", "foreground"});
            }
            frame.getlocal(0).__setattr__("styles", frame.getlocal(1));
            frame.setlocal(5, frame.getglobal("getattr").__call__(frame.getglobal("swing").__getattr__("text"), s$10));
            frame.getlocal(0).__setattr__("inputAction", frame.getlocal(5).__call__(s$11, frame.getglobal("colors").__getattr__("black")));
            if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, frame.getglobal("Keymap").__call__());
            }
            frame.getlocal(2).invoke("bind", s$12, frame.getlocal(0).__getattr__("enter"));
            frame.getlocal(2).invoke("bind", s$13, frame.getlocal(0).__getattr__("tab"));
            frame.getlocal(2).invoke("bind", s$14, frame.getlocal(0).__getattr__("escape"));
            frame.getlocal(2).invoke("bind", s$15, frame.getlocal(0).__getattr__("del"));
            frame.getlocal(2).invoke("bind", s$16, frame.getlocal(0).__getattr__("uphistory"));
            frame.getlocal(2).invoke("bind", s$17, frame.getlocal(0).__getattr__("downhistory"));
            frame.getlocal(0).__setattr__("keymap", frame.getlocal(2));
            frame.getlocal(0).__setattr__("document", frame.getglobal("swing").__getattr__("text").__getattr__("DefaultStyledDocument").__call__(frame.getlocal(0).__getattr__("styles")));
            frame.getlocal(0).__getattr__("document").invoke("setLogicalStyle", i$18, frame.getlocal(0).__getattr__("styles").invoke("get", s$1));
            frame.getlocal(0).__setattr__("textpane", frame.getglobal("swing").__getattr__("JTextPane").__call__(frame.getlocal(0).__getattr__("document")));
            frame.getlocal(0).__getattr__("textpane").__setattr__("keymap", frame.getlocal(0).__getattr__("keymap"));
            frame.getlocal(0).__setattr__("history", new PyList(new PyObject[] {}));
            frame.getlocal(0).__setattr__("oldHistoryLength", i$18);
            frame.getlocal(0).__setattr__("historyPosition", i$18);
            frame.getlocal(0).__setattr__("command", new PyList(new PyObject[] {}));
            frame.getlocal(0).__setattr__("locals", new PyDictionary(new PyObject[] {}));
            return Py.None;
        }
        
        private static PyObject write$6(PyFrame frame) {
            frame.setlocal(3, frame.getlocal(0).__getattr__("styles").invoke("get", frame.getlocal(2)));
            frame.getlocal(0).__getattr__("document").invoke("insertString", new PyObject[] {frame.getlocal(0).__getattr__("document").__getattr__("length"), frame.getlocal(1), frame.getlocal(3)});
            return Py.None;
        }
        
        private static PyObject beep$7(PyFrame frame) {
            frame.getlocal(0).__getattr__("textpane").__getattr__("toolkit").invoke("beep");
            return Py.None;
        }
        
        private static PyObject startUserInput$8(PyFrame frame) {
            if (frame.getlocal(1)._isnot(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(0).invoke("write", frame.getlocal(1), s$8);
            }
            frame.getlocal(0).__setattr__("startInput", frame.getlocal(0).__getattr__("document").invoke("createPosition", frame.getlocal(0).__getattr__("document").__getattr__("length")._sub(i$19)));
            frame.getlocal(0).__getattr__("textpane").__setattr__("caretPosition", frame.getlocal(0).__getattr__("document").__getattr__("length"));
            frame.setlocal(2, frame.getglobal("ActionEvent").__call__(frame.getlocal(0).__getattr__("textpane"), frame.getglobal("ActionEvent").__getattr__("ACTION_PERFORMED"), s$11));
            frame.getlocal(0).__getattr__("inputAction").invoke("actionPerformed", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject getinput$9(PyFrame frame) {
            frame.setlocal(2, frame.getlocal(0).__getattr__("startInput").__getattr__("offset"));
            frame.setlocal(1, frame.getlocal(0).__getattr__("document").invoke("getText", frame.getlocal(2)._add(i$19), frame.getlocal(0).__getattr__("document").__getattr__("length")._sub(frame.getlocal(2))));
            return frame.getglobal("string").__getattr__("rstrip").__call__(frame.getlocal(1));
        }
        
        private static PyObject replaceinput$10(PyFrame frame) {
            frame.setlocal(2, frame.getlocal(0).__getattr__("startInput").__getattr__("offset")._add(i$19));
            frame.getlocal(0).__getattr__("document").invoke("remove", frame.getlocal(2), frame.getlocal(0).__getattr__("document").__getattr__("length")._sub(frame.getlocal(2)));
            frame.getlocal(0).invoke("write", frame.getlocal(1), s$7);
            return Py.None;
        }
        
        private static PyObject enter$11(PyFrame frame) {
            frame.setlocal(1, frame.getlocal(0).invoke("getinput"));
            frame.getlocal(0).invoke("write", s$20, s$7);
            frame.getlocal(0).__getattr__("history").invoke("append", frame.getlocal(1));
            frame.getlocal(0).invoke("handleLine", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject gethistory$12(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            frame.setlocal(2, frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("history")));
            if (frame.getlocal(0).__getattr__("oldHistoryLength")._lt(frame.getlocal(2)).__nonzero__()) {
                frame.getlocal(0).__setattr__("oldHistoryLength", frame.getlocal(2));
                if (frame.getlocal(0).__getattr__("history").__getitem__(frame.getlocal(0).__getattr__("historyPosition"))._ne(frame.getlocal(0).__getattr__("history").__getitem__(i$19.__neg__())).__nonzero__()) {
                    frame.getlocal(0).__setattr__("historyPosition", frame.getlocal(2));
                }
            }
            frame.setlocal(3, frame.getlocal(0).__getattr__("historyPosition")._add(frame.getlocal(1)));
            if ((i$18._le(t$0$PyObject = frame.getlocal(3)).__nonzero__() ? t$0$PyObject._lt(frame.getlocal(2)) : Py.Zero).__nonzero__()) {
                frame.getlocal(0).__setattr__("historyPosition", frame.getlocal(3));
                frame.getlocal(0).invoke("replaceinput", frame.getlocal(0).__getattr__("history").__getitem__(frame.getlocal(3)));
            }
            else {
                frame.getlocal(0).invoke("beep");
            }
            return Py.None;
        }
        
        private static PyObject uphistory$13(PyFrame frame) {
            frame.getlocal(0).invoke("gethistory", i$19.__neg__());
            return Py.None;
        }
        
        private static PyObject downhistory$14(PyFrame frame) {
            frame.getlocal(0).invoke("gethistory", i$19);
            return Py.None;
        }
        
        private static PyObject tab$15(PyFrame frame) {
            frame.getlocal(0).invoke("write", s$21, s$7);
            return Py.None;
        }
        
        private static PyObject escape$16(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            if (((t$0$PyObject = ((t$1$PyObject = frame.getglobal("hasattr").__call__(frame.getlocal(0), s$22).__not__()).__nonzero__() ? t$1$PyObject : frame.getlocal(0).__getattr__("pythonThread")._is(frame.getglobal("None")))).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("pythonThread").__getattr__("alive").__not__()).__nonzero__()) {
                frame.getlocal(0).invoke("beep");
                return Py.None;
            }
            frame.getlocal(0).__getattr__("pythonThread").invoke("stopPython");
            return Py.None;
        }
        
        private static PyObject del$17(PyFrame frame) {
            frame.getlocal(0).invoke("replaceinput", s$23);
            return Py.None;
        }
        
        private static PyObject capturePythonOutput$18(PyFrame frame) {
            frame.setlocal(3, org.python.core.imp.importOne("sys", frame));
            frame.getlocal(3).__setattr__("stdout", frame.getglobal("OutputBuffer").__call__(frame.getlocal(0), frame.getlocal(1)));
            frame.getlocal(3).__setattr__("stderr", frame.getglobal("OutputBuffer").__call__(frame.getlocal(0), frame.getlocal(2)));
            return Py.None;
        }
        
        private static PyObject handleLine$19(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.getlocal(0).__getattr__("command").invoke("append", frame.getlocal(1));
            try {
                frame.setlocal(2, frame.getglobal("compile_command").__call__(frame.getglobal("string").__getattr__("join").__call__(frame.getlocal(0).__getattr__("command"), s$20)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("SyntaxError"))) {
                    frame.getglobal("traceback").invoke("print_exc", i$18);
                    frame.getlocal(0).__setattr__("command", new PyList(new PyObject[] {}));
                    frame.getlocal(0).invoke("startUserInput", frame.getglobal("str").__call__(frame.getglobal("sys").__getattr__("ps1"))._add(s$21));
                    return Py.None;
                }
                else throw t$0$PyException;
            }
            if (frame.getlocal(2)._is(frame.getglobal("None")).__nonzero__()) {
                frame.getlocal(0).invoke("startUserInput", frame.getglobal("str").__call__(frame.getglobal("sys").__getattr__("ps2"))._add(s$21));
                return Py.None;
            }
            frame.getlocal(0).__setattr__("command", new PyList(new PyObject[] {}));
            if (((t$0$PyObject = frame.getlocal(0).__getattr__("agent")).__nonzero__() ? frame.getlocal(0).__getattr__("agent").__getattr__("isConsoleToNameSpace") : t$0$PyObject).__nonzero__()) {
                frame.setlocal(3, frame.getglobal("PythonThread").__call__(frame.getlocal(2), frame.getlocal(0), frame.getlocal(0).__getattr__("agent").__getattr__("agentNameSpace")));
            }
            else {
                frame.setlocal(3, frame.getglobal("PythonThread").__call__(frame.getlocal(2), frame.getlocal(0), frame.getlocal(0).__getattr__("locals")));
            }
            frame.getlocal(0).__setattr__("pythonThread", frame.getlocal(3));
            frame.getlocal(3).invoke("start");
            return Py.None;
        }
        
        private static PyObject newInput$20(PyFrame frame) {
            frame.getlocal(0).invoke("startUserInput", frame.getglobal("str").__call__(frame.getglobal("sys").__getattr__("ps1"))._add(s$21));
            return Py.None;
        }
        
        private static PyObject Console$21(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), frame.getname("None"), frame.getname("None")}, c$4___init__));
            frame.setlocal("write", new PyFunction(frame.f_globals, new PyObject[] {s$1}, c$5_write));
            frame.setlocal("beep", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_beep));
            frame.setlocal("startUserInput", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$7_startUserInput));
            frame.setlocal("getinput", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_getinput));
            frame.setlocal("replaceinput", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_replaceinput));
            frame.setlocal("enter", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_enter));
            frame.setlocal("gethistory", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_gethistory));
            frame.setlocal("uphistory", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_uphistory));
            frame.setlocal("downhistory", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_downhistory));
            frame.setlocal("tab", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_tab));
            frame.setlocal("escape", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_escape));
            frame.setlocal("del", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_del));
            frame.setlocal("capturePythonOutput", new PyFunction(frame.f_globals, new PyObject[] {s$6, s$5}, c$17_capturePythonOutput));
            frame.setlocal("handleLine", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_handleLine));
            frame.setlocal("newInput", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_newInput));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$22(PyFrame frame) {
            frame.getlocal(0).__setattr__("code", frame.getlocal(1));
            frame.getlocal(0).__setattr__("console", frame.getlocal(2));
            frame.getlocal(0).__setattr__("nameSpace", frame.getlocal(3));
            return Py.None;
        }
        
        private static PyObject run$23(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException, t$1$PyException;
            
            // Code
            try {
                Py.exec(frame.getlocal(0).__getattr__("code"), frame.getlocal(0).__getattr__("nameSpace"), null);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getname("sys").__getattr__("exc_info").__call__(), 3);
                frame.setlocal(4, t$0$PyObject__[0]);
                frame.setlocal(5, t$0$PyObject__[1]);
                frame.setlocal(3, t$0$PyObject__[2]);
                frame.setlocal(2, frame.getname("len").__call__(frame.getname("traceback").__getattr__("extract_tb").__call__(frame.getname("sys").__getattr__("exc_traceback"))));
                try {
                    i$19._div(i$18);
                }
                catch (Throwable x$1) {
                    t$1$PyException = Py.setException(x$1, frame);
                    frame.setlocal(1, frame.getname("len").__call__(frame.getname("traceback").__getattr__("extract_tb").__call__(frame.getname("sys").__getattr__("exc_traceback"))));
                }
                frame.getname("traceback").__getattr__("print_exception").__call__(new PyObject[] {frame.getlocal(4), frame.getlocal(5), frame.getlocal(3), frame.getlocal(2)._sub(frame.getlocal(1))});
            }
            frame.getlocal(0).__getattr__("console").invoke("newInput");
            return Py.None;
        }
        
        private static PyObject stopPython$24(PyFrame frame) {
            frame.getlocal(0).invoke("stop");
            return Py.None;
        }
        
        private static PyObject PythonThread$25(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$21___init__));
            frame.setlocal("run", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_run));
            frame.setlocal("stopPython", new PyFunction(frame.f_globals, new PyObject[] {}, c$23_stopPython));
            return frame.getf_locals();
        }
        
        private static PyObject main$26(PyFrame frame) {
            frame.setglobal("__file__", s$30);
            
            PyObject[] imp_accu;
            // Code
            /* This is a substantially improved version of the older Interpreter.py demo
            It creates a simple GUI JPython console window with simple history
            as well as the ability to interupt running code (with the ESC key).
            
            Like Interpreter.py, this is still just a demo, and needs substantial
            work before serious use.
            
            Thanks to Geza Groma (groma@everx.szbk.u-szeged.hu) for several valuable
            ideas for this tool -- his JPConsole is a more refined implementation
            of similar ideas.
             */
            imp_accu = org.python.core.imp.importFrom("Styles", new String[] {"Styles"}, frame);
            frame.setlocal("Styles", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("Keymap", new String[] {"Keymap"}, frame);
            frame.setlocal("Keymap", imp_accu[0]);
            imp_accu = null;
            org.python.core.imp.importAll("javax.swing", frame);
            org.python.core.imp.importAll("javax.swing.event", frame);
            imp_accu = org.python.core.imp.importFrom("pawt", new String[] {"swing", "colors"}, frame);
            frame.setlocal("swing", imp_accu[0]);
            frame.setlocal("colors", imp_accu[1]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.awt.event.KeyEvent", new String[] {"VK_UP", "VK_DOWN"}, frame);
            frame.setlocal("VK_UP", imp_accu[0]);
            frame.setlocal("VK_DOWN", imp_accu[1]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.awt.event", new String[] {"ActionEvent"}, frame);
            frame.setlocal("ActionEvent", imp_accu[0]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("java.lang", new String[] {"Thread", "System"}, frame);
            frame.setlocal("Thread", imp_accu[0]);
            frame.setlocal("System", imp_accu[1]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("code", new String[] {"compile_command"}, frame);
            frame.setlocal("compile_command", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            frame.setlocal("re", org.python.core.imp.importOne("re", frame));
            frame.setlocal("OutputBuffer", Py.makeClass("OutputBuffer", new PyObject[] {}, c$3_OutputBuffer, null));
            frame.setlocal("Console", Py.makeClass("Console", new PyObject[] {}, c$20_Console, null));
            frame.setlocal("traceback", org.python.core.imp.importOne("traceback", frame));
            frame.setlocal("PythonThread", Py.makeClass("PythonThread", new PyObject[] {frame.getname("Thread")}, c$24_PythonThread, null, PythonThread.class));
            frame.setlocal("header", s$24._mod(new PyDictionary(new PyObject[] {s$25, frame.getname("sys").__getattr__("version"), s$26, frame.getname("sys").__getattr__("platform"), s$27, frame.getname("sys").__getattr__("copyright")})));
            if (frame.getname("__name__")._eq(s$28).__nonzero__()) {
                frame.setlocal("c", frame.getname("Console").__call__());
                frame.setlocal("pane", frame.getname("swing").__getattr__("JScrollPane").__call__(frame.getname("c").__getattr__("textpane")));
                frame.setlocal("a", frame.getname("JFrame").__call__(s$29));
                frame.getname("a").__getattr__("contentPane").invoke("add", frame.getname("pane"));
                frame.getname("a").invoke("show");
                frame.getname("c").invoke("write", frame.getname("header"), s$6);
                frame.getname("c").invoke("capturePythonOutput");
                frame.getname("c").__getattr__("textpane").invoke("requestFocus");
                frame.getname("c").invoke("newInput");
            }
            return Py.None;
        }
        
    }
    public static class PythonThread extends java.lang.Thread implements org.python.core.PyProxy, org.python.core.ClassDictInit {
        public java.lang.Object clone() throws java.lang.CloneNotSupportedException {
            return super.clone();
        }
        
        public void finalize() throws java.lang.Throwable {
            super.finalize();
        }
        
        public void super__run() {
            super.run();
        }
        
        public void run() {
            PyObject inst = Py.jfindattr(this, "run");
            if (inst != null) inst._jcall(new Object[] {});
            else super.run();
        }
        
        public PythonThread(java.lang.Runnable arg0, java.lang.String arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public PythonThread(java.lang.ThreadGroup arg0, java.lang.Runnable arg1, java.lang.String arg2, long arg3) {
            super(arg0, arg1, arg2, arg3);
            __initProxy__(new Object[] {arg0, arg1, arg2, Py.newInteger(arg3)});
        }
        
        public PythonThread(java.lang.ThreadGroup arg0, java.lang.String arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public PythonThread(java.lang.String arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public PythonThread(java.lang.ThreadGroup arg0, java.lang.Runnable arg1, java.lang.String arg2) {
            super(arg0, arg1, arg2);
            __initProxy__(new Object[] {arg0, arg1, arg2});
        }
        
        public PythonThread() {
            super();
            __initProxy__(new Object[] {});
        }
        
        public PythonThread(java.lang.Runnable arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public PythonThread(java.lang.ThreadGroup arg0, java.lang.Runnable arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
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
            Py.initProxy(this, "Console", "PythonThread", args, Console.jpy$packages, Console.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"finalize", "super__run", "clone"}));
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("Console"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "Console";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(Console._PyInner.class, newargs, Console.jpy$packages, Console.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
