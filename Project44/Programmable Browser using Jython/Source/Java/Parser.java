import org.python.core.*;

public class Parser extends java.lang.Object {
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
        private static PyObject i$13;
        private static PyObject s$14;
        private static PyObject i$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject s$22;
        private static PyObject s$23;
        private static PyObject i$24;
        private static PyObject i$25;
        private static PyObject i$26;
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
        private static PyObject i$39;
        private static PyObject s$40;
        private static PyObject s$41;
        private static PyObject i$42;
        private static PyObject i$43;
        private static PyObject i$44;
        private static PyObject i$45;
        private static PyObject s$46;
        private static PyObject s$47;
        private static PyObject s$48;
        private static PyObject i$49;
        private static PyObject s$50;
        private static PyObject s$51;
        private static PyObject s$52;
        private static PyObject s$53;
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_loadScript;
        private static PyCode c$2_addEventAction;
        private static PyCode c$3_execSeqScript;
        private static PyCode c$4_startParScript;
        private static PyCode c$5_showResult;
        private static PyCode c$6_getEventActionTable;
        private static PyCode c$7_Parser;
        private static PyCode c$8___init__;
        private static PyCode c$9_doCommand;
        private static PyCode c$10_doRunScript;
        private static PyCode c$11_Tester;
        private static PyCode c$12_windowClosing;
        private static PyCode c$13_MyWindowAdapter;
        private static PyCode c$14_main;
        private static void initConstants() {
            s$0 = Py.newString("\012Programmable Web Browser v 2.0\012Module : Parser Module\012Description : Contain parser of script language, definition of language datatype, and event function\012Last Updated : 31 January 2002\012Programmer :    Thanawat Keawka\012                        Boontawee Suntisrivaraporn\012Professor : Dr. Visit Hirankitti                        \012===========================================\012System Requirement\012- Java 1.3\012- Jython 2.1\012- Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2\012\012");
            s$1 = Py.newString("dld_cmplt");
            s$2 = Py.newString("dld_err");
            s$3 = Py.newString("cgi_cmplt");
            s$4 = Py.newString("<event>");
            s$5 = Py.newString("</event>");
            s$6 = Py.newString("<sequential>");
            s$7 = Py.newString("</sequential>");
            s$8 = Py.newString("<parallel>");
            s$9 = Py.newString("</parallel>");
            s$10 = Py.newString("yyyy/mm/dd hh:mm");
            s$11 = Py.newString("username@host:password");
            s$12 = Py.newString("");
            i$13 = Py.newInteger(1);
            s$14 = Py.newString("<<Parser>> Script syntax error!!");
            i$15 = Py.newInteger(0);
            s$16 = Py.newString("\012");
            s$17 = Py.newString("#");
            s$18 = Py.newString("->");
            s$19 = Py.newString("<<Parser>> Event syntax error : -> expected");
            s$20 = Py.newString("/");
            s$21 = Py.newString(":");
            s$22 = Py.newString("@");
            s$23 = Py.newString("mail");
            i$24 = Py.newInteger(4);
            i$25 = Py.newInteger(7);
            i$26 = Py.newInteger(13);
            s$27 = Py.newString("time");
            s$28 = Py.newString("%Y/%m/%d");
            s$29 = Py.newString(" ");
            s$30 = Py.newString("others");
            s$31 = Py.newString("%s@%s:%s");
            s$32 = Py.newString("active");
            s$33 = Py.newString("filename = \"ScriptBuffer.\" + str(counter)\012        try :\012            f = open(filename, 'w')\012            f.write(script)\012            f.close()\012        except :\012            print \"<<Parser>> Cannot open ScriptBuffer.tmp\"\012        ");
            s$34 = Py.newString("try :\012            exec script in self.parent.agentNameSpace\012        except :\012            print \"<<Script>> Execute error!!!  Details :\"\012            traceback.print_last()\012        ");
            s$35 = Py.newString("# this counter must begin with 1 because 0 is used by default sequential thread\012        counter = 1\012        ");
            s$36 = Py.newString("<<Parser>> Start new thread for parallel script : ");
            s$37 = Py.newString("Sequential script");
            s$38 = Py.newString("Tahoma");
            i$39 = Py.newInteger(11);
            s$40 = Py.newString("Parallel script");
            s$41 = Py.newString("Event-Action");
            i$42 = Py.newInteger(293);
            i$43 = Py.newInteger(180);
            i$44 = Py.newInteger(100);
            i$45 = Py.newInteger(93);
            s$46 = Py.newString("Add event and execute script");
            s$47 = Py.newString("Event");
            s$48 = Py.newString("Action");
            i$49 = Py.newInteger(300);
            s$50 = Py.newString("Run Script");
            s$51 = Py.newString("__main__");
            s$52 = Py.newString("script.txt");
            s$53 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\Parser.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(4, new String[] {"self", "parent", "full_script", "alert"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_loadScript = Py.newCode(2, new String[] {"self", "alert", "p6", "p5", "p4", "p3", "p2", "p1"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "loadScript", false, false, funcTable, 1, null, null, 0, 1);
            c$2_addEventAction = Py.newCode(3, new String[] {"self", "event_script", "isTest", "server0", "p4", "p3", "password", "lines", "p2", "p1", "displayList", "event_item", "address", "line", "event_type", "password0", "server", "action", "event", "address0", "date"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "addEventAction", false, false, funcTable, 2, null, null, 0, 1);
            c$3_execSeqScript = Py.newCode(2, new String[] {"self", "script"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "execSeqScript", false, false, funcTable, 3, null, null, 0, 0);
            c$4_startParScript = Py.newCode(1, new String[] {"self", "stmts", "stmt"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "startParScript", false, false, funcTable, 4, null, null, 0, 1);
            c$5_showResult = Py.newCode(1, new String[] {"self", "pane", "jseq", "jtable", "s3", "s2", "s1", "jpar"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "showResult", false, false, funcTable, 5, null, null, 0, 1);
            c$6_getEventActionTable = Py.newCode(1, new String[] {"self", "jtable", "table", "row"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "getEventActionTable", false, false, funcTable, 6, null, null, 0, 1);
            c$7_Parser = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "Parser", false, false, funcTable, 7, null, null, 0, 0);
            c$8___init__ = Py.newCode(2, new String[] {"self", "scripter"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "__init__", false, false, funcTable, 8, null, null, 0, 1);
            c$9_doCommand = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "doCommand", false, false, funcTable, 9, null, null, 0, 1);
            c$10_doRunScript = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "doRunScript", false, false, funcTable, 10, null, null, 0, 1);
            c$11_Tester = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "Tester", false, false, funcTable, 11, null, null, 0, 0);
            c$12_windowClosing = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "windowClosing", false, false, funcTable, 12, null, null, 0, 1);
            c$13_MyWindowAdapter = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "MyWindowAdapter", false, false, funcTable, 13, null, null, 0, 0);
            c$14_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\Parser.py", "main", false, false, funcTable, 14, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$14_main == null) _PyInner.initConstants();
            return c$14_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.loadScript$2(frame);
                case 2:
                return _PyInner.addEventAction$3(frame);
                case 3:
                return _PyInner.execSeqScript$4(frame);
                case 4:
                return _PyInner.startParScript$5(frame);
                case 5:
                return _PyInner.showResult$6(frame);
                case 6:
                return _PyInner.getEventActionTable$7(frame);
                case 7:
                return _PyInner.Parser$8(frame);
                case 8:
                return _PyInner.__init__$9(frame);
                case 9:
                return _PyInner.doCommand$10(frame);
                case 10:
                return _PyInner.doRunScript$11(frame);
                case 11:
                return _PyInner.Tester$12(frame);
                case 12:
                return _PyInner.windowClosing$13(frame);
                case 13:
                return _PyInner.MyWindowAdapter$14(frame);
                case 14:
                return _PyInner.main$15(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            frame.getlocal(0).__setattr__("event_actions", new PyDictionary(new PyObject[] {}));
            frame.getlocal(0).__setattr__("event_script", s$12);
            frame.getlocal(0).__setattr__("seq_script", s$12);
            frame.getlocal(0).__setattr__("par_script", s$12);
            frame.getlocal(0).__setattr__("input_script", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject loadScript$2(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject, t$5$PyObject, t$6$PyObject, t$7$PyObject, t$8$PyObject;
            
            // Code
            frame.setlocal(7, frame.getlocal(0).__getattr__("input_script").invoke("find", frame.getglobal("BEGIN_EVENT_TAG")));
            frame.setlocal(6, frame.getlocal(0).__getattr__("input_script").invoke("find", frame.getglobal("END_EVENT_TAG")));
            frame.setlocal(5, frame.getlocal(0).__getattr__("input_script").invoke("find", frame.getglobal("BEGIN_SEQ_TAG")));
            frame.setlocal(4, frame.getlocal(0).__getattr__("input_script").invoke("find", frame.getglobal("END_SEQ_TAG")));
            frame.setlocal(3, frame.getlocal(0).__getattr__("input_script").invoke("find", frame.getglobal("BEGIN_PAR_TAG")));
            frame.setlocal(2, frame.getlocal(0).__getattr__("input_script").invoke("find", frame.getglobal("END_PAR_TAG")));
            if (((t$0$PyObject = ((t$1$PyObject = ((t$2$PyObject = ((t$3$PyObject = ((t$4$PyObject = ((t$5$PyObject = ((t$6$PyObject = ((t$7$PyObject = ((t$8$PyObject = frame.getlocal(7)._eq(i$13.__neg__())).__nonzero__() ? frame.getlocal(6)._ne(i$13.__neg__()) : t$8$PyObject)).__nonzero__() ? t$7$PyObject : ((t$8$PyObject = frame.getlocal(7)._ne(i$13.__neg__())).__nonzero__() ? frame.getlocal(6)._eq(i$13.__neg__()) : t$8$PyObject))).__nonzero__() ? t$6$PyObject : frame.getlocal(7)._gt(frame.getlocal(6)))).__nonzero__() ? t$5$PyObject : ((t$6$PyObject = frame.getlocal(5)._eq(i$13.__neg__())).__nonzero__() ? frame.getlocal(4)._ne(i$13.__neg__()) : t$6$PyObject))).__nonzero__() ? t$4$PyObject : ((t$5$PyObject = frame.getlocal(5)._ne(i$13.__neg__())).__nonzero__() ? frame.getlocal(4)._eq(i$13.__neg__()) : t$5$PyObject))).__nonzero__() ? t$3$PyObject : frame.getlocal(5)._gt(frame.getlocal(4)))).__nonzero__() ? t$2$PyObject : ((t$3$PyObject = frame.getlocal(3)._eq(i$13.__neg__())).__nonzero__() ? frame.getlocal(2)._ne(i$13.__neg__()) : t$3$PyObject))).__nonzero__() ? t$1$PyObject : ((t$2$PyObject = frame.getlocal(3)._ne(i$13.__neg__())).__nonzero__() ? frame.getlocal(2)._eq(i$13.__neg__()) : t$2$PyObject))).__nonzero__() ? t$0$PyObject : frame.getlocal(3)._gt(frame.getlocal(2))).__nonzero__()) {
                Py.println(s$14);
                return i$15;
            }
            if (new PyTuple(new PyObject[] {frame.getlocal(7), frame.getlocal(6)})._ne(new PyTuple(new PyObject[] {i$13.__neg__(), i$13.__neg__()})).__nonzero__()) {
                frame.getlocal(0).__setattr__("event_script", frame.getlocal(0).__getattr__("input_script").__getslice__(frame.getlocal(7)._add(frame.getglobal("len").__call__(frame.getglobal("BEGIN_EVENT_TAG"))), frame.getlocal(6), null));
            }
            if (new PyTuple(new PyObject[] {frame.getlocal(3), frame.getlocal(2)})._ne(new PyTuple(new PyObject[] {i$13.__neg__(), i$13.__neg__()})).__nonzero__()) {
                frame.getlocal(0).__setattr__("par_script", frame.getlocal(0).__getattr__("input_script").__getslice__(frame.getlocal(3)._add(frame.getglobal("len").__call__(frame.getglobal("BEGIN_PAR_TAG"))), frame.getlocal(2), null).invoke("strip"));
            }
            if (new PyTuple(new PyObject[] {frame.getlocal(5), frame.getlocal(4)})._ne(new PyTuple(new PyObject[] {i$13.__neg__(), i$13.__neg__()})).__nonzero__()) {
                frame.getlocal(0).__setattr__("seq_script", frame.getlocal(0).__getattr__("input_script").__getslice__(frame.getlocal(5)._add(frame.getglobal("len").__call__(frame.getglobal("BEGIN_SEQ_TAG"))), frame.getlocal(4), null));
            }
            else if (new PyTuple(new PyObject[] {frame.getlocal(7), frame.getlocal(6), frame.getlocal(5), frame.getlocal(4), frame.getlocal(3), frame.getlocal(2)})._eq(new PyTuple(new PyObject[] {i$13.__neg__(), i$13.__neg__(), i$13.__neg__(), i$13.__neg__(), i$13.__neg__(), i$13.__neg__()})).__nonzero__()) {
                frame.getlocal(0).__setattr__("seq_script", frame.getlocal(0).__getattr__("input_script"));
            }
            return i$13;
        }
        
        private static PyObject addEventAction$3(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject, t$5$PyObject;
            
            // Code
            if (frame.getlocal(1)._eq(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(0).__getattr__("event_script"));
            }
            frame.setlocal(1, frame.getlocal(1).invoke("strip"));
            frame.setlocal(7, frame.getlocal(1).invoke("split", s$16));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(7);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(13, t$0$PyObject);
                frame.setlocal(13, frame.getlocal(13).invoke("strip"));
                if (((t$2$PyObject = frame.getlocal(13)._eq(s$12)).__nonzero__() ? t$2$PyObject : frame.getlocal(13).__getitem__(i$15)._eq(s$17)).__nonzero__()) {
                    continue;
                }
                try {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(13).invoke("split", s$18), 2);
                    frame.setlocal(18, t$0$PyObject__[0]);
                    frame.setlocal(17, t$0$PyObject__[1]);
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    Py.println(s$19);
                    return i$15;
                }
                frame.setlocal(9, frame.getlocal(18).invoke("find", s$20));
                frame.setlocal(8, frame.getlocal(18).invoke("find", s$20, frame.getlocal(9)._add(i$13)));
                frame.setlocal(5, frame.getlocal(18).invoke("find", s$21));
                frame.setlocal(4, frame.getlocal(18).invoke("find", s$22));
                if (frame.getlocal(4)._ne(i$13.__neg__()).__nonzero__()) {
                    frame.setlocal(14, s$23);
                }
                else if (((t$2$PyObject = ((t$3$PyObject = ((t$4$PyObject = frame.getlocal(9)._eq(i$24)).__nonzero__() ? frame.getlocal(8)._eq(i$25) : t$4$PyObject)).__nonzero__() ? frame.getlocal(5)._eq(i$26) : t$3$PyObject)).__nonzero__() ? t$2$PyObject : ((t$3$PyObject = ((t$4$PyObject = ((t$5$PyObject = frame.getlocal(9)._eq(i$13.__neg__())).__nonzero__() ? frame.getlocal(8)._eq(i$13.__neg__()) : t$5$PyObject)).__nonzero__() ? frame.getlocal(5)._ne(i$13.__neg__()) : t$4$PyObject)).__nonzero__() ? frame.getlocal(4)._eq(i$13.__neg__()) : t$3$PyObject)).__nonzero__()) {
                    frame.setlocal(14, s$27);
                    if (frame.getlocal(9)._eq(i$13.__neg__()).__nonzero__()) {
                        frame.setlocal(20, frame.getglobal("time").__getattr__("strftime").__call__(s$28));
                        frame.setlocal(18, frame.getlocal(20)._add(s$29)._add(frame.getlocal(18)));
                    }
                }
                else {
                    frame.setlocal(14, s$30);
                }
                frame.getlocal(0).__getattr__("event_actions").__setitem__(frame.getlocal(18), frame.getlocal(17));
                if (frame.getlocal(2).__not__().__nonzero__()) {
                    if (frame.getlocal(14)._eq(s$23).__nonzero__()) {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("map").__call__(frame.getglobal("string").__getattr__("strip"), new PyTuple(new PyObject[] {frame.getlocal(18).__getslice__(null, frame.getlocal(4), null), frame.getlocal(18).__getslice__(frame.getlocal(4)._add(i$13), frame.getlocal(5), null), frame.getlocal(18).__getslice__(frame.getlocal(5)._add(i$13), null, null)})), 3);
                        frame.setlocal(19, t$0$PyObject__[0]);
                        frame.setlocal(3, t$0$PyObject__[1]);
                        frame.setlocal(15, t$0$PyObject__[2]);
                        try {
                            frame.setlocal(12, frame.getglobal("eval").__call__(frame.getlocal(19), frame.getlocal(0).__getattr__("parent").__getattr__("agentNameSpace")));
                        }
                        catch (Throwable x$1) {
                            t$0$PyException = Py.setException(x$1, frame);
                            frame.setlocal(12, frame.getlocal(19));
                        }
                        try {
                            frame.setlocal(16, frame.getglobal("eval").__call__(frame.getlocal(3), frame.getlocal(0).__getattr__("parent").__getattr__("agentNameSpace")));
                        }
                        catch (Throwable x$2) {
                            t$0$PyException = Py.setException(x$2, frame);
                            frame.setlocal(16, frame.getlocal(3));
                        }
                        try {
                            frame.setlocal(6, frame.getglobal("eval").__call__(frame.getlocal(15), frame.getlocal(0).__getattr__("parent").__getattr__("agentNameSpace")));
                        }
                        catch (Throwable x$3) {
                            t$0$PyException = Py.setException(x$3, frame);
                            frame.setlocal(6, frame.getlocal(15));
                        }
                        frame.setlocal(18, s$31._mod(new PyTuple(new PyObject[] {frame.getlocal(12), frame.getlocal(16), frame.getlocal(6)})));
                    }
                    frame.setlocal(11, new PyList(new PyObject[] {frame.getlocal(14), s$32, frame.getlocal(18), frame.getlocal(17)}));
                    frame.getlocal(0).__getattr__("parent").__getattr__("current_event_list").invoke("append", frame.getlocal(11));
                }
            }
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(10, frame.getlocal(0).__getattr__("parent").invoke("convertToDisplay", frame.getlocal(0).__getattr__("parent").__getattr__("current_event_list")));
                frame.getlocal(0).__getattr__("parent").__getattr__("event_list").invoke("setListData", frame.getlocal(10));
            }
            return i$13;
        }
        
        private static PyObject execSeqScript$4(PyFrame frame) {
            if (frame.getlocal(1)._eq(frame.getname("None")).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(0).__getattr__("seq_script"));
            }
            /* filename = "ScriptBuffer." + str(counter)
                    try :
                        f = open(filename, 'w')
                        f.write(script)
                        f.close()
                    except :
                        print "<<Parser>> Cannot open ScriptBuffer.tmp"
                     */
            Py.exec(frame.getlocal(1), frame.getlocal(0).__getattr__("parent").__getattr__("agentNameSpace"), null);
            /* try :
                        exec script in self.parent.agentNameSpace
                    except :
                        print "<<Script>> Execute error!!!  Details :"
                        traceback.print_last()
                     */
            return Py.None;
        }
        
        private static PyObject startParScript$5(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* # this counter must begin with 1 because 0 is used by default sequential thread
                    counter = 1
                     */
            frame.setlocal(1, frame.getglobal("map").__call__(frame.getglobal("string").__getattr__("strip"), frame.getlocal(0).__getattr__("par_script").invoke("split", s$16)));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2)._eq(s$12).__nonzero__()) {
                    continue;
                }
                Py.printComma(s$36);
                Py.println(frame.getlocal(2));
                frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("execSeqScript"), new PyTuple(new PyObject[] {frame.getlocal(2)}));
            }
            return Py.None;
        }
        
        private static PyObject showResult$6(PyFrame frame) {
            frame.setlocal(2, frame.getglobal("JTextArea").__call__(frame.getlocal(0).__getattr__("seq_script")));
            frame.getlocal(2).invoke("setEditable", i$15);
            frame.getlocal(2).invoke("setToolTipText", s$37);
            frame.getlocal(2).invoke("setFont", frame.getglobal("Font").__call__(s$38, frame.getglobal("Font").__getattr__("PLAIN"), i$39));
            frame.setlocal(7, frame.getglobal("JTextArea").__call__(frame.getlocal(0).__getattr__("par_script")));
            frame.getlocal(7).invoke("setEditable", i$15);
            frame.getlocal(7).invoke("setToolTipText", s$40);
            frame.getlocal(2).invoke("setFont", frame.getglobal("Font").__call__(s$38, frame.getglobal("Font").__getattr__("PLAIN"), i$39));
            frame.setlocal(3, frame.getlocal(0).invoke("getEventActionTable"));
            frame.getlocal(3).invoke("setEnabled", i$15);
            frame.getlocal(3).invoke("setShowHorizontalLines", i$15);
            frame.getlocal(3).invoke("setToolTipText", s$41);
            frame.setlocal(1, frame.getglobal("JPanel").__call__(frame.getglobal("BorderLayout").__call__()));
            frame.getlocal(1).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$42, i$42));
            frame.setlocal(6, frame.getglobal("JScrollPane").__call__(frame.getlocal(2)));
            frame.getlocal(6).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$43, i$44));
            frame.setlocal(5, frame.getglobal("JScrollPane").__call__(frame.getlocal(7)));
            frame.getlocal(5).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$43, i$44));
            frame.setlocal(4, frame.getglobal("JScrollPane").__call__(frame.getlocal(3)));
            frame.getlocal(4).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$43, i$45));
            frame.getlocal(1).invoke("add", frame.getlocal(6), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(1).invoke("add", frame.getlocal(5), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(1).invoke("add", frame.getlocal(4), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0).__getattr__("parent"), frame.getlocal(1), s$46, i$13.__neg__(), frame.getglobal("None")});
            return Py.None;
        }
        
        private static PyObject getEventActionTable$7(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0).__getattr__("event_actions").invoke("items");
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.getlocal(2).invoke("append", frame.getlocal(3));
            }
            frame.getlocal(2).invoke("sort");
            frame.setlocal(1, frame.getglobal("JTable").__call__(frame.getlocal(2), new PyTuple(new PyObject[] {s$47, s$48})));
            frame.getlocal(1).invoke("setEnabled", i$15);
            return frame.getlocal(1);
        }
        
        private static PyObject Parser$8(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {s$12, i$13}, c$0___init__));
            frame.setlocal("loadScript", new PyFunction(frame.f_globals, new PyObject[] {i$13}, c$1_loadScript));
            frame.setlocal("addEventAction", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None"), i$15}, c$2_addEventAction));
            frame.setlocal("execSeqScript", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$3_execSeqScript));
            frame.setlocal("startParScript", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_startParScript));
            frame.setlocal("showResult", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_showResult));
            frame.setlocal("getEventActionTable", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_getEventActionTable));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$9(PyFrame frame) {
            frame.getlocal(0).__setattr__("scripter", frame.getlocal(1));
            frame.getlocal(0).invoke("setSize", i$49, i$49);
            frame.getlocal(0).invoke("setResizable", i$15);
            frame.getlocal(0).invoke("addWindowListener", frame.getglobal("MyWindowAdapter").__call__());
            frame.getlocal(0).__setattr__("jPanel", frame.getglobal("JPanel").__call__(frame.getglobal("BorderLayout").__call__()));
            frame.getlocal(0).__setattr__("jBottomPanel", frame.getglobal("JPanel").__call__(frame.getglobal("BorderLayout").__call__()));
            frame.getlocal(0).__setattr__("jTextArea", frame.getglobal("JTextArea").__call__());
            frame.getlocal(0).__setattr__("jTextField", frame.getglobal("JTextField").__call__(new PyObject[] {frame.getlocal(0).__getattr__("doCommand")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__setattr__("jButton", frame.getglobal("JButton").__call__(new PyObject[] {s$50, frame.getlocal(0).__getattr__("doRunScript")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("jPanel"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("jBottomPanel"), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            frame.getlocal(0).__getattr__("jBottomPanel").invoke("add", frame.getlocal(0).__getattr__("jButton"), frame.getglobal("BorderLayout").__getattr__("EAST"));
            frame.getlocal(0).__getattr__("jBottomPanel").invoke("add", frame.getlocal(0).__getattr__("jTextField"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            return Py.None;
        }
        
        private static PyObject doCommand$10(PyFrame frame) {
            frame.getlocal(0).__getattr__("scripter").invoke("execSeqScript", frame.getglobal("str").__call__(frame.getlocal(0).__getattr__("jTextField").invoke("getText")));
            return Py.None;
        }
        
        private static PyObject doRunScript$11(PyFrame frame) {
            frame.getlocal(0).__getattr__("scripter").invoke("showResult");
            frame.getlocal(0).__getattr__("scripter").invoke("execSeqScript");
            frame.getlocal(0).__getattr__("jPanel").invoke("add", frame.getlocal(0).__getattr__("scripter").invoke("getEventActionTable"));
            frame.getlocal(0).__getattr__("jPanel").invoke("updateUI");
            return Py.None;
        }
        
        private static PyObject Tester$12(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$8___init__));
            frame.setlocal("doCommand", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_doCommand));
            frame.setlocal("doRunScript", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_doRunScript));
            return frame.getf_locals();
        }
        
        private static PyObject windowClosing$13(PyFrame frame) {
            frame.getglobal("sys").__getattr__("exit").__call__(i$15);
            return Py.None;
        }
        
        private static PyObject MyWindowAdapter$14(PyFrame frame) {
            frame.setlocal("windowClosing", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_windowClosing));
            return frame.getf_locals();
        }
        
        private static PyObject main$15(PyFrame frame) {
            frame.setglobal("__file__", s$53);
            
            PyObject[] imp_accu;
            // Code
            /* 
            Programmable Web Browser v 2.0
            Module : Parser Module
            Description : Contain parser of script language, definition of language datatype, and event function
            Last Updated : 31 January 2002
            Programmer :    Thanawat Keawka
                                    Boontawee Suntisrivaraporn
            Professor : Dr. Visit Hirankitti                        
            ===========================================
            System Requirement
            - Java 1.3
            - Jython 2.1
            - Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2
            
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
            frame.setlocal("urllib", org.python.core.imp.importOne("urllib", frame));
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("traceback", org.python.core.imp.importOne("traceback", frame));
            frame.setlocal("time", org.python.core.imp.importOne("time", frame));
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            imp_accu = org.python.core.imp.importFrom("thread", new String[] {"start_new_thread"}, frame);
            frame.setlocal("start_new_thread", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("DLD_COMPLETE", s$1);
            frame.setlocal("DLD_ERROR", s$2);
            frame.setlocal("CGI_COMPLETE", s$3);
            frame.setlocal("BEGIN_EVENT_TAG", s$4);
            frame.setlocal("END_EVENT_TAG", s$5);
            frame.setlocal("BEGIN_SEQ_TAG", s$6);
            frame.setlocal("END_SEQ_TAG", s$7);
            frame.setlocal("BEGIN_PAR_TAG", s$8);
            frame.setlocal("END_PAR_TAG", s$9);
            frame.setlocal("TIME_EVENT", s$10);
            frame.setlocal("EMAIL_EVENT", s$11);
            frame.setlocal("event_driven", new PyDictionary(new PyObject[] {}));
            frame.setlocal("Parser", Py.makeClass("Parser", new PyObject[] {}, c$7_Parser, null));
            frame.setlocal("Tester", Py.makeClass("Tester", new PyObject[] {frame.getname("JFrame")}, c$11_Tester, null, Tester.class));
            frame.setlocal("MyWindowAdapter", Py.makeClass("MyWindowAdapter", new PyObject[] {frame.getname("WindowAdapter")}, c$13_MyWindowAdapter, null, MyWindowAdapter.class));
            if (frame.getname("__name__")._eq(s$51).__nonzero__()) {
                frame.setlocal("f", frame.getname("open").__call__(s$52));
                frame.setlocal("input_script", frame.getname("f").invoke("read"));
                frame.getname("f").invoke("close");
                frame.setlocal("scripter", frame.getname("Parser").__call__(frame.getname("input_script")));
                frame.setlocal("tester", frame.getname("Tester").__call__(frame.getname("scripter")));
                frame.getname("tester").invoke("show");
            }
            return Py.None;
        }
        
    }
    public static class Tester extends javax.swing.JFrame implements org.python.core.PyProxy, org.python.core.ClassDictInit {
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
        
        public Tester(java.awt.GraphicsConfiguration arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public Tester(java.lang.String arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public Tester(java.lang.String arg0, java.awt.GraphicsConfiguration arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public Tester() throws java.awt.HeadlessException {
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
            Py.initProxy(this, "Parser", "Tester", args, Parser.jpy$packages, Parser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"processInputMethodEvent", "finalize", "requestFocus", "firePropertyChange", "setRootPaneCheckingEnabled", "processMouseWheelEvent", "processWindowEvent", "processEvent", "processComponentEvent", "processWindowStateEvent", "paramString", "coalesceEvents", "requestFocusInWindow", "super__disableEvents", "super__enableEvents", "processMouseEvent", "processKeyEvent", "addImpl", "validateTree", "processWindowFocusEvent", "processHierarchyBoundsEvent", "processMouseMotionEvent", "clone", "processContainerEvent", "processFocusEvent", "createRootPane", "frameInit", "processHierarchyEvent", "setRootPane", "isRootPaneCheckingEnabled"}));
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
            Py.initProxy(this, "Parser", "MyWindowAdapter", args, Parser.jpy$packages, Parser.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"super__windowClosing", "finalize", "clone"}));
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("Parser"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "Parser";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(Parser._PyInner.class, newargs, Parser.jpy$packages, Parser.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
