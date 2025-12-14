import org.python.core.*;

public class repr extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject i$3;
        private static PyObject i$4;
        private static PyObject i$5;
        private static PyObject i$6;
        private static PyObject i$7;
        private static PyObject i$8;
        private static PyObject i$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject i$13;
        private static PyObject i$14;
        private static PyObject s$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject i$20;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_repr;
        private static PyCode c$2_repr1;
        private static PyCode c$3_repr_tuple;
        private static PyCode c$4_repr_list;
        private static PyCode c$5_repr_dictionary;
        private static PyCode c$6_repr_string;
        private static PyCode c$7_repr_long_int;
        private static PyCode c$8_repr_instance;
        private static PyCode c$9_Repr;
        private static PyCode c$10_main;
        private static void initConstants() {
            s$0 = Py.newString("Redo the `...` (representation) but with limits on most sizes.");
            s$1 = Py.newString("Repr");
            s$2 = Py.newString("repr");
            i$3 = Py.newInteger(6);
            i$4 = Py.newInteger(4);
            i$5 = Py.newInteger(30);
            i$6 = Py.newInteger(40);
            i$7 = Py.newInteger(20);
            i$8 = Py.newInteger(7);
            i$9 = Py.newInteger(2);
            s$10 = Py.newString(" ");
            s$11 = Py.newString("_");
            s$12 = Py.newString("repr_");
            i$13 = Py.newInteger(0);
            i$14 = Py.newInteger(3);
            s$15 = Py.newString("...");
            s$16 = Py.newString("()");
            s$17 = Py.newString("(...)");
            s$18 = Py.newString("");
            s$19 = Py.newString(", ");
            i$20 = Py.newInteger(1);
            s$21 = Py.newString(", ...");
            s$22 = Py.newString(",");
            s$23 = Py.newString("(");
            s$24 = Py.newString(")");
            s$25 = Py.newString("[]");
            s$26 = Py.newString("[...]");
            s$27 = Py.newString("[");
            s$28 = Py.newString("]");
            s$29 = Py.newString("{}");
            s$30 = Py.newString("{...}");
            s$31 = Py.newString(": ");
            s$32 = Py.newString("{");
            s$33 = Py.newString("}");
            s$34 = Py.newString("<");
            s$35 = Py.newString(" instance at ");
            s$36 = Py.newString(">");
            s$37 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\repr.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_repr = Py.newCode(2, new String[] {"self", "x"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr", false, false, funcTable, 1, null, null, 0, 1);
            c$2_repr1 = Py.newCode(3, new String[] {"self", "x", "level", "j", "parts", "i", "typename", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr1", false, false, funcTable, 2, null, null, 0, 1);
            c$3_repr_tuple = Py.newCode(3, new String[] {"self", "x", "level", "n", "i", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr_tuple", false, false, funcTable, 3, null, null, 0, 1);
            c$4_repr_list = Py.newCode(3, new String[] {"self", "x", "level", "n", "i", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr_list", false, false, funcTable, 4, null, null, 0, 1);
            c$5_repr_dictionary = Py.newCode(3, new String[] {"self", "x", "level", "n", "i", "key", "keys", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr_dictionary", false, false, funcTable, 5, null, null, 0, 1);
            c$6_repr_string = Py.newCode(3, new String[] {"self", "x", "level", "j", "i", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr_string", false, false, funcTable, 6, null, null, 0, 1);
            c$7_repr_long_int = Py.newCode(3, new String[] {"self", "x", "level", "j", "i", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr_long_int", false, false, funcTable, 7, null, null, 0, 1);
            c$8_repr_instance = Py.newCode(3, new String[] {"self", "x", "level", "j", "i", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "repr_instance", false, false, funcTable, 8, null, null, 0, 1);
            c$9_Repr = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "Repr", false, false, funcTable, 9, null, null, 0, 0);
            c$10_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\repr.py", "main", false, false, funcTable, 10, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$10_main == null) _PyInner.initConstants();
            return c$10_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.__init__$1(frame);
                case 1:
                return _PyInner.repr$2(frame);
                case 2:
                return _PyInner.repr1$3(frame);
                case 3:
                return _PyInner.repr_tuple$4(frame);
                case 4:
                return _PyInner.repr_list$5(frame);
                case 5:
                return _PyInner.repr_dictionary$6(frame);
                case 6:
                return _PyInner.repr_string$7(frame);
                case 7:
                return _PyInner.repr_long_int$8(frame);
                case 8:
                return _PyInner.repr_instance$9(frame);
                case 9:
                return _PyInner.Repr$10(frame);
                case 10:
                return _PyInner.main$11(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("maxlevel", i$3);
            frame.getlocal(0).__setattr__("maxtuple", i$3);
            frame.getlocal(0).__setattr__("maxlist", i$3);
            frame.getlocal(0).__setattr__("maxdict", i$4);
            frame.getlocal(0).__setattr__("maxstring", i$5);
            frame.getlocal(0).__setattr__("maxlong", i$6);
            frame.getlocal(0).__setattr__("maxother", i$7);
            return Py.None;
        }
        
        private static PyObject repr$2(PyFrame frame) {
            return frame.getlocal(0).invoke("repr1", frame.getlocal(1), frame.getlocal(0).__getattr__("maxlevel"));
        }
        
        private static PyObject repr1$3(PyFrame frame) {
            frame.setlocal(6, frame.getglobal("type").__call__(frame.getlocal(1)).__repr__().__getslice__(i$8, i$9.__neg__(), null));
            if (s$10._in(frame.getlocal(6)).__nonzero__()) {
                frame.setlocal(4, frame.getlocal(6).invoke("split"));
                frame.setlocal(6, s$11.invoke("join", frame.getlocal(4)));
            }
            if (frame.getglobal("hasattr").__call__(frame.getlocal(0), s$12._add(frame.getlocal(6))).__nonzero__()) {
                return frame.getglobal("getattr").__call__(frame.getlocal(0), s$12._add(frame.getlocal(6))).__call__(frame.getlocal(1), frame.getlocal(2));
            }
            else {
                frame.setlocal(7, frame.getlocal(1).__repr__());
                if (frame.getglobal("len").__call__(frame.getlocal(7))._gt(frame.getlocal(0).__getattr__("maxother")).__nonzero__()) {
                    frame.setlocal(5, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxother")._sub(i$14)._div(i$9)));
                    frame.setlocal(3, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxother")._sub(i$14)._sub(frame.getlocal(5))));
                    frame.setlocal(7, frame.getlocal(7).__getslice__(null, frame.getlocal(5), null)._add(s$15)._add(frame.getlocal(7).__getslice__(frame.getglobal("len").__call__(frame.getlocal(7))._sub(frame.getlocal(3)), null, null)));
                }
                return frame.getlocal(7);
            }
        }
        
        private static PyObject repr_tuple$4(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(3, frame.getglobal("len").__call__(frame.getlocal(1)));
            if (frame.getlocal(3)._eq(i$13).__nonzero__()) {
                return s$16;
            }
            if (frame.getlocal(2)._le(i$13).__nonzero__()) {
                return s$17;
            }
            frame.setlocal(5, s$18);
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("min").__call__(frame.getlocal(3), frame.getlocal(0).__getattr__("maxtuple")));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                if (frame.getlocal(5).__nonzero__()) {
                    frame.setlocal(5, frame.getlocal(5)._add(s$19));
                }
                frame.setlocal(5, frame.getlocal(5)._add(frame.getlocal(0).invoke("repr1", frame.getlocal(1).__getitem__(frame.getlocal(4)), frame.getlocal(2)._sub(i$20))));
            }
            if (frame.getlocal(3)._gt(frame.getlocal(0).__getattr__("maxtuple")).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(5)._add(s$21));
            }
            else if (frame.getlocal(3)._eq(i$20).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(5)._add(s$22));
            }
            return s$23._add(frame.getlocal(5))._add(s$24);
        }
        
        private static PyObject repr_list$5(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(3, frame.getglobal("len").__call__(frame.getlocal(1)));
            if (frame.getlocal(3)._eq(i$13).__nonzero__()) {
                return s$25;
            }
            if (frame.getlocal(2)._le(i$13).__nonzero__()) {
                return s$26;
            }
            frame.setlocal(5, s$18);
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("min").__call__(frame.getlocal(3), frame.getlocal(0).__getattr__("maxlist")));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                if (frame.getlocal(5).__nonzero__()) {
                    frame.setlocal(5, frame.getlocal(5)._add(s$19));
                }
                frame.setlocal(5, frame.getlocal(5)._add(frame.getlocal(0).invoke("repr1", frame.getlocal(1).__getitem__(frame.getlocal(4)), frame.getlocal(2)._sub(i$20))));
            }
            if (frame.getlocal(3)._gt(frame.getlocal(0).__getattr__("maxlist")).__nonzero__()) {
                frame.setlocal(5, frame.getlocal(5)._add(s$21));
            }
            return s$27._add(frame.getlocal(5))._add(s$28);
        }
        
        private static PyObject repr_dictionary$6(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(3, frame.getglobal("len").__call__(frame.getlocal(1)));
            if (frame.getlocal(3)._eq(i$13).__nonzero__()) {
                return s$29;
            }
            if (frame.getlocal(2)._le(i$13).__nonzero__()) {
                return s$30;
            }
            frame.setlocal(7, s$18);
            frame.setlocal(6, frame.getlocal(1).invoke("keys"));
            frame.getlocal(6).invoke("sort");
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("min").__call__(frame.getlocal(3), frame.getlocal(0).__getattr__("maxdict")));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(4, t$0$PyObject);
                if (frame.getlocal(7).__nonzero__()) {
                    frame.setlocal(7, frame.getlocal(7)._add(s$19));
                }
                frame.setlocal(5, frame.getlocal(6).__getitem__(frame.getlocal(4)));
                frame.setlocal(7, frame.getlocal(7)._add(frame.getlocal(0).invoke("repr1", frame.getlocal(5), frame.getlocal(2)._sub(i$20))));
                frame.setlocal(7, frame.getlocal(7)._add(s$31)._add(frame.getlocal(0).invoke("repr1", frame.getlocal(1).__getitem__(frame.getlocal(5)), frame.getlocal(2)._sub(i$20))));
            }
            if (frame.getlocal(3)._gt(frame.getlocal(0).__getattr__("maxdict")).__nonzero__()) {
                frame.setlocal(7, frame.getlocal(7)._add(s$21));
            }
            return s$32._add(frame.getlocal(7))._add(s$33);
        }
        
        private static PyObject repr_string$7(PyFrame frame) {
            frame.setlocal(5, frame.getlocal(1).__getslice__(null, frame.getlocal(0).__getattr__("maxstring"), null).__repr__());
            if (frame.getglobal("len").__call__(frame.getlocal(5))._gt(frame.getlocal(0).__getattr__("maxstring")).__nonzero__()) {
                frame.setlocal(4, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxstring")._sub(i$14)._div(i$9)));
                frame.setlocal(3, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxstring")._sub(i$14)._sub(frame.getlocal(4))));
                frame.setlocal(5, frame.getlocal(1).__getslice__(null, frame.getlocal(4), null)._add(frame.getlocal(1).__getslice__(frame.getglobal("len").__call__(frame.getlocal(1))._sub(frame.getlocal(3)), null, null)).__repr__());
                frame.setlocal(5, frame.getlocal(5).__getslice__(null, frame.getlocal(4), null)._add(s$15)._add(frame.getlocal(5).__getslice__(frame.getglobal("len").__call__(frame.getlocal(5))._sub(frame.getlocal(3)), null, null)));
            }
            return frame.getlocal(5);
        }
        
        private static PyObject repr_long_int$8(PyFrame frame) {
            frame.setlocal(5, frame.getlocal(1).__repr__());
            if (frame.getglobal("len").__call__(frame.getlocal(5))._gt(frame.getlocal(0).__getattr__("maxlong")).__nonzero__()) {
                frame.setlocal(4, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxlong")._sub(i$14)._div(i$9)));
                frame.setlocal(3, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxlong")._sub(i$14)._sub(frame.getlocal(4))));
                frame.setlocal(5, frame.getlocal(5).__getslice__(null, frame.getlocal(4), null)._add(s$15)._add(frame.getlocal(5).__getslice__(frame.getglobal("len").__call__(frame.getlocal(5))._sub(frame.getlocal(3)), null, null)));
            }
            return frame.getlocal(5);
        }
        
        private static PyObject repr_instance$9(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                frame.setlocal(5, frame.getlocal(1).__repr__());
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                return s$34._add(frame.getlocal(1).__getattr__("__class__").__getattr__("__name__"))._add(s$35)._add(frame.getglobal("hex").__call__(frame.getglobal("id").__call__(frame.getlocal(1))).__getslice__(i$9, null, null))._add(s$36);
            }
            if (frame.getglobal("len").__call__(frame.getlocal(5))._gt(frame.getlocal(0).__getattr__("maxstring")).__nonzero__()) {
                frame.setlocal(4, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxstring")._sub(i$14)._div(i$9)));
                frame.setlocal(3, frame.getglobal("max").__call__(i$13, frame.getlocal(0).__getattr__("maxstring")._sub(i$14)._sub(frame.getlocal(4))));
                frame.setlocal(5, frame.getlocal(5).__getslice__(null, frame.getlocal(4), null)._add(s$15)._add(frame.getlocal(5).__getslice__(frame.getglobal("len").__call__(frame.getlocal(5))._sub(frame.getlocal(3)), null, null)));
            }
            return frame.getlocal(5);
        }
        
        private static PyObject Repr$10(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$0___init__));
            frame.setlocal("repr", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_repr));
            frame.setlocal("repr1", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_repr1));
            frame.setlocal("repr_tuple", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_repr_tuple));
            frame.setlocal("repr_list", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_repr_list));
            frame.setlocal("repr_dictionary", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_repr_dictionary));
            frame.setlocal("repr_string", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_repr_string));
            frame.setlocal("repr_long_int", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_repr_long_int));
            frame.setlocal("repr_instance", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_repr_instance));
            return frame.getf_locals();
        }
        
        private static PyObject main$11(PyFrame frame) {
            frame.setglobal("__file__", s$37);
            
            /* Redo the `...` (representation) but with limits on most sizes. */
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2}));
            frame.setlocal("Repr", Py.makeClass("Repr", new PyObject[] {}, c$9_Repr, null));
            frame.setlocal("aRepr", frame.getname("Repr").__call__());
            frame.setlocal("repr", frame.getname("aRepr").__getattr__("repr"));
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("repr"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "repr";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(repr._PyInner.class, newargs, repr.jpy$packages, repr.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
