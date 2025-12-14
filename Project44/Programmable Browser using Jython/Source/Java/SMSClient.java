import org.python.core.*;

public class SMSClient extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject i$2;
        private static PyObject i$3;
        private static PyObject i$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject i$7;
        private static PyObject s$8;
        private static PyObject i$9;
        private static PyObject i$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject i$13;
        private static PyObject i$14;
        private static PyObject s$15;
        private static PyObject i$16;
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
        private static PyObject i$28;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_windowClosing;
        private static PyCode c$2_MyWindowAdapter;
        private static PyCode c$3___init__;
        private static PyCode c$4_initialize;
        private static PyCode c$5_finalize;
        private static PyCode c$6_validateAll;
        private static PyCode c$7_onSend;
        private static PyCode c$8__onSend;
        private static PyCode c$9_onClear;
        private static PyCode c$10_sendToAIS900;
        private static PyCode c$11_sendToGec;
        private static PyCode c$12_onServerChange;
        private static PyCode c$13_SMSFrame;
        private static PyCode c$14_main;
        private static void initConstants() {
            s$0 = Py.newString("sms.profile");
            s$1 = Py.newString("SMSFrame([child]) -> SMSFrame Object");
            i$2 = Py.newInteger(0);
            i$3 = Py.newInteger(225);
            i$4 = Py.newInteger(230);
            s$5 = Py.newString("PWB - SMS Sender");
            s$6 = Py.newString("images/gear.gif");
            i$7 = Py.newInteger(1);
            s$8 = Py.newString("SMS Server :");
            i$9 = Py.newInteger(70);
            i$10 = Py.newInteger(20);
            s$11 = Py.newString("www.geccorp.com");
            s$12 = Py.newString("www.ais900.com");
            i$13 = Py.newInteger(135);
            i$14 = Py.newInteger(23);
            s$15 = Py.newString("Tel. Number :");
            i$16 = Py.newInteger(100);
            s$17 = Py.newString("Password :");
            s$18 = Py.newString("Send");
            s$19 = Py.newString("Clear");
            s$20 = Py.newString("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            s$21 = Py.newString("Metal");
            s$22 = Py.newString("javax.swing.plaf.metal.MetalLookAndFeel");
            s$23 = Py.newString("Motif");
            s$24 = Py.newString("com.sun.java.swing.plaf.motif.MotifLookAndFeel");
            s$25 = Py.newString("Windows");
            s$26 = Py.newString("Telephone number must be digit.");
            s$27 = Py.newString("Error");
            i$28 = Py.newInteger(8);
            s$29 = Py.newString("19");
            s$30 = Py.newString("Telephone number must be\012 01 or 09 and follow by 7 digits.");
            s$31 = Py.newString("An error occur when trying to send data to SMS server.");
            s$32 = Py.newString("");
            s$33 = Py.newString("szGsmNo");
            s$34 = Py.newString("szGsmPwd");
            s$35 = Py.newString("szMesg");
            s$36 = Py.newString("http://www.gsm.ais900.com/gsmweb/web2sms.php");
            s$37 = Py.newString("Sending to www.gsm.ais900.com complete");
            s$38 = Py.newString("+66");
            s$39 = Py.newString("gsmno");
            s$40 = Py.newString("gsmmsg");
            s$41 = Py.newString("http://www.geccorp.com/sms/sendsms.cgi");
            s$42 = Py.newString("Sending to www.geccorp.com complete");
            s$43 = Py.newString("__main__");
            s$44 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_windowClosing = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "windowClosing", false, false, funcTable, 1, null, null, 0, 1);
            c$2_MyWindowAdapter = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "MyWindowAdapter", false, false, funcTable, 2, null, null, 0, 0);
            c$3___init__ = Py.newCode(3, new String[] {"self", "child", "agent", "btPanel", "mainPanel", "passwordPanel", "l", "la", "app_style", "telNoPanel", "serverPanel"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "__init__", false, false, funcTable, 3, null, null, 0, 1);
            c$4_initialize = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "initialize", false, false, funcTable, 4, null, null, 0, 1);
            c$5_finalize = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "finalize", false, false, funcTable, 5, null, null, 0, 1);
            c$6_validateAll = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "validateAll", false, false, funcTable, 6, null, null, 0, 1);
            c$7_onSend = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "onSend", false, false, funcTable, 7, null, null, 0, 1);
            c$8__onSend = Py.newCode(2, new String[] {"self", "showDialog", "telNo", "password", "message"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "_onSend", false, false, funcTable, 8, null, null, 0, 1);
            c$9_onClear = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "onClear", false, false, funcTable, 9, null, null, 0, 1);
            c$10_sendToAIS900 = Py.newCode(4, new String[] {"self", "telNo", "password", "message", "res", "postDataDict", "encodedData"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "sendToAIS900", false, false, funcTable, 10, null, null, 0, 1);
            c$11_sendToGec = Py.newCode(3, new String[] {"self", "telNo", "message", "encodedData", "res", "postDataDict"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "sendToGec", false, false, funcTable, 11, null, null, 0, 1);
            c$12_onServerChange = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "onServerChange", false, false, funcTable, 12, null, null, 0, 1);
            c$13_SMSFrame = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "SMSFrame", false, false, funcTable, 13, null, null, 0, 0);
            c$14_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\SMSClient.py", "main", false, false, funcTable, 14, null, null, 0, 0);
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
                return _PyInner.windowClosing$2(frame);
                case 2:
                return _PyInner.MyWindowAdapter$3(frame);
                case 3:
                return _PyInner.__init__$4(frame);
                case 4:
                return _PyInner.initialize$5(frame);
                case 5:
                return _PyInner.finalize$6(frame);
                case 6:
                return _PyInner.validateAll$7(frame);
                case 7:
                return _PyInner.onSend$8(frame);
                case 8:
                return _PyInner._onSend$9(frame);
                case 9:
                return _PyInner.onClear$10(frame);
                case 10:
                return _PyInner.sendToAIS900$11(frame);
                case 11:
                return _PyInner.sendToGec$12(frame);
                case 12:
                return _PyInner.onServerChange$13(frame);
                case 13:
                return _PyInner.SMSFrame$14(frame);
                case 14:
                return _PyInner.main$15(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject windowClosing$2(PyFrame frame) {
            frame.getlocal(0).__getattr__("parent").invoke("dispose");
            if (frame.getlocal(0).__getattr__("parent").__getattr__("exit_when_term").__nonzero__()) {
                frame.getglobal("sys").__getattr__("exit").__call__(i$2);
            }
            return Py.None;
        }
        
        private static PyObject MyWindowAdapter$3(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$0___init__));
            frame.setlocal("windowClosing", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_windowClosing));
            return frame.getf_locals();
        }
        
        private static PyObject __init__$4(PyFrame frame) {
            frame.getlocal(0).__setattr__("agent", frame.getlocal(2));
            frame.getlocal(0).__setattr__("exit_when_term", frame.getlocal(1).__not__());
            frame.getlocal(0).invoke("setSize", i$3, i$4);
            frame.getlocal(0).invoke("setResizable", i$2);
            frame.getlocal(0).invoke("setTitle", s$5);
            frame.getlocal(0).invoke("setIconImage", frame.getglobal("ImageIcon").__call__(s$6).invoke("getImage"));
            frame.getlocal(0).invoke("addWindowListener", frame.getlocal(0).invoke("MyWindowAdapter", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("contentPane").invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.setlocal(4, frame.getglobal("JPanel").__call__());
            frame.getlocal(4).invoke("setLayout", frame.getglobal("GridLayout").__call__(i$2, i$7));
            frame.setlocal(10, frame.getglobal("JPanel").__call__());
            frame.setlocal(7, frame.getglobal("FlowLayout").__call__());
            frame.getlocal(7).invoke("setAlignment", frame.getglobal("FlowLayout").__getattr__("LEFT"));
            frame.getlocal(10).invoke("setLayout", frame.getlocal(7));
            frame.setlocal(6, frame.getglobal("JLabel").__call__(s$8));
            frame.getlocal(6).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$9, i$10));
            frame.getlocal(10).invoke("add", frame.getlocal(6));
            frame.getlocal(0).__setattr__("serverCb", frame.getglobal("JComboBox").__call__(new PyObject[] {new PyList(new PyObject[] {s$11, s$12}), frame.getlocal(0).__getattr__("onServerChange")}, new String[] {"itemStateChanged"}));
            frame.getlocal(0).__getattr__("serverCb").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$13, i$14));
            frame.getlocal(10).invoke("add", frame.getlocal(0).__getattr__("serverCb"));
            frame.getlocal(4).invoke("add", frame.getlocal(10));
            frame.setlocal(9, frame.getglobal("JPanel").__call__());
            frame.setlocal(7, frame.getglobal("FlowLayout").__call__());
            frame.getlocal(7).invoke("setAlignment", frame.getglobal("FlowLayout").__getattr__("LEFT"));
            frame.getlocal(9).invoke("setLayout", frame.getlocal(7));
            frame.setlocal(6, frame.getglobal("JLabel").__call__(s$15));
            frame.getlocal(6).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$9, i$10));
            frame.getlocal(9).invoke("add", frame.getlocal(6));
            frame.getlocal(0).__setattr__("telNoTx", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("telNoTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$16, i$10));
            frame.getlocal(9).invoke("add", frame.getlocal(0).__getattr__("telNoTx"));
            frame.getlocal(4).invoke("add", frame.getlocal(9));
            frame.setlocal(5, frame.getglobal("JPanel").__call__());
            frame.getlocal(5).invoke("setLayout", frame.getlocal(7));
            frame.setlocal(6, frame.getglobal("JLabel").__call__(s$17));
            frame.getlocal(6).invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$9, i$10));
            frame.getlocal(5).invoke("add", frame.getlocal(6));
            frame.getlocal(0).__setattr__("passwordTx", frame.getglobal("JPasswordField").__call__());
            frame.getlocal(0).__getattr__("passwordTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$16, i$10));
            frame.getlocal(0).__getattr__("passwordTx").invoke("setEditable", i$2);
            frame.getlocal(5).invoke("add", frame.getlocal(0).__getattr__("passwordTx"));
            frame.getlocal(4).invoke("add", frame.getlocal(5));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(4), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(0).__setattr__("messageTxArea", frame.getglobal("JTextArea").__call__());
            frame.getlocal(0).__getattr__("messageTxArea").invoke("setLineWrap", i$7);
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("messageTxArea")), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.setlocal(3, frame.getglobal("JPanel").__call__());
            frame.getlocal(3).invoke("add", frame.getglobal("JButton").__call__(new PyObject[] {s$18, frame.getlocal(0).__getattr__("onSend")}, new String[] {"actionPerformed"}));
            frame.getlocal(3).invoke("add", frame.getglobal("JButton").__call__(new PyObject[] {s$19, frame.getlocal(0).__getattr__("onClear")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(3), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            frame.getlocal(0).invoke("initialize");
            if (frame.getlocal(0).__getattr__("agent").__not__().__nonzero__()) {
                frame.setlocal(8, s$20);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$21).__nonzero__()) {
                frame.setlocal(8, s$22);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$23).__nonzero__()) {
                frame.setlocal(8, s$24);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$25).__nonzero__()) {
                frame.setlocal(8, s$20);
            }
            else {
                frame.setlocal(8, frame.getglobal("UIManager").__getattr__("getSystemLookAndFeelClassName").__call__());
            }
            frame.getglobal("UIManager").__getattr__("setLookAndFeel").__call__(frame.getlocal(8));
            frame.getglobal("SwingUtilities").__getattr__("updateComponentTreeUI").__call__(frame.getlocal(0));
            return Py.None;
        }
        
        private static PyObject initialize$5(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject finalize$6(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject validateAll$7(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject onSend$8(PyFrame frame) {
            frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("_onSend"), new PyTuple(new PyObject[] {}));
            return Py.None;
        }
        
        private static PyObject _onSend$9(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(2, frame.getlocal(0).__getattr__("telNoTx").invoke("getText"));
            try {
                frame.setlocal(2, frame.getglobal("str").__call__(frame.getglobal("int").__call__(frame.getlocal(2))));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$26, s$27, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            if (((t$0$PyObject = frame.getglobal("len").__call__(frame.getlocal(2))._ne(i$28)).__nonzero__() ? t$0$PyObject : frame.getlocal(2).__getitem__(i$2)._notin(s$29)).__nonzero__()) {
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$30, s$27, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            frame.setlocal(3, frame.getlocal(0).__getattr__("passwordTx").invoke("getText"));
            frame.setlocal(4, frame.getlocal(0).__getattr__("messageTxArea").invoke("getText"));
            try {
                if (frame.getlocal(0).__getattr__("serverCb").invoke("getSelectedIndex")._eq(i$2).__nonzero__()) {
                    frame.getlocal(0).invoke("sendToGec", frame.getlocal(2), frame.getlocal(4));
                }
                else {
                    frame.getlocal(0).invoke("sendToAIS900", new PyObject[] {frame.getlocal(2), frame.getlocal(3), frame.getlocal(4)});
                }
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$31, s$27, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            return i$7;
        }
        
        private static PyObject onClear$10(PyFrame frame) {
            frame.getlocal(0).__getattr__("messageTxArea").invoke("setText", s$32);
            return Py.None;
        }
        
        private static PyObject sendToAIS900$11(PyFrame frame) {
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$33, frame.getlocal(1), s$34, frame.getlocal(2), s$35, frame.getlocal(3)}));
            frame.setlocal(6, frame.getglobal("urlencode").__call__(frame.getlocal(5)));
            frame.setlocal(4, frame.getglobal("urlopen").__call__(s$36, frame.getlocal(6)));
            Py.println(s$37);
            return Py.None;
        }
        
        private static PyObject sendToGec$12(PyFrame frame) {
            frame.setlocal(1, s$38._add(frame.getlocal(1)));
            frame.setlocal(5, new PyDictionary(new PyObject[] {s$39, frame.getlocal(1), s$40, frame.getlocal(2)}));
            frame.setlocal(3, frame.getglobal("urlencode").__call__(frame.getlocal(5)));
            frame.setlocal(4, frame.getglobal("urlopen").__call__(s$41, frame.getlocal(3)));
            Py.println(s$42);
            return Py.None;
        }
        
        private static PyObject onServerChange$13(PyFrame frame) {
            if (frame.getlocal(0).__getattr__("serverCb").invoke("getSelectedIndex")._eq(i$2).__nonzero__()) {
                frame.getlocal(0).__getattr__("passwordTx").invoke("setEditable", i$2);
            }
            else {
                frame.getlocal(0).__getattr__("passwordTx").invoke("setEditable", i$7);
            }
            return Py.None;
        }
        
        private static PyObject SMSFrame$14(PyFrame frame) {
            /* SMSFrame([child]) -> SMSFrame Object */
            frame.setlocal("MyWindowAdapter", Py.makeClass("MyWindowAdapter", new PyObject[] {frame.getname("WindowAdapter")}, c$2_MyWindowAdapter, null, MyWindowAdapter.class));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {i$7, frame.getname("None")}, c$3___init__));
            frame.setlocal("initialize", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_initialize));
            frame.setlocal("finalize", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_finalize));
            frame.setlocal("validateAll", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_validateAll));
            frame.setlocal("onSend", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$7_onSend));
            frame.setlocal("_onSend", new PyFunction(frame.f_globals, new PyObject[] {i$7}, c$8__onSend));
            frame.setlocal("onClear", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_onClear));
            frame.setlocal("sendToAIS900", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_sendToAIS900));
            frame.setlocal("sendToGec", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_sendToGec));
            frame.setlocal("onServerChange", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_onServerChange));
            return frame.getf_locals();
        }
        
        private static PyObject main$15(PyFrame frame) {
            frame.setglobal("__file__", s$44);
            
            PyObject[] imp_accu;
            // Code
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
            org.python.core.imp.importAll("java.io", frame);
            frame.setlocal("sys", org.python.core.imp.importOne("sys", frame));
            org.python.core.imp.importAll("thread", frame);
            org.python.core.imp.importAll("urllib", frame);
            frame.setlocal("SMS_PROFILE", s$0);
            frame.setlocal("SMSFrame", Py.makeClass("SMSFrame", new PyObject[] {frame.getname("JFrame")}, c$13_SMSFrame, null, SMSFrame.class));
            if (frame.getname("__name__")._eq(s$43).__nonzero__()) {
                frame.setlocal("frame", frame.getname("SMSFrame").__call__(i$2));
                frame.getname("frame").invoke("show");
            }
            return Py.None;
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
            Py.initProxy(this, "SMSClient", "MyWindowAdapter", args, SMSClient.jpy$packages, SMSClient.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"super__windowClosing", "finalize", "clone"}));
        }
        
    }
    public static class SMSFrame extends javax.swing.JFrame implements org.python.core.PyProxy, org.python.core.ClassDictInit {
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
        
        public SMSFrame(java.awt.GraphicsConfiguration arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public SMSFrame(java.lang.String arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public SMSFrame(java.lang.String arg0, java.awt.GraphicsConfiguration arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public SMSFrame() throws java.awt.HeadlessException {
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
            Py.initProxy(this, "SMSClient", "SMSFrame", args, SMSClient.jpy$packages, SMSClient.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"processInputMethodEvent", "requestFocus", "firePropertyChange", "setRootPaneCheckingEnabled", "processMouseWheelEvent", "processWindowEvent", "processEvent", "processComponentEvent", "processWindowStateEvent", "paramString", "coalesceEvents", "requestFocusInWindow", "super__disableEvents", "super__enableEvents", "processMouseEvent", "super__finalize", "processKeyEvent", "addImpl", "validateTree", "processWindowFocusEvent", "processHierarchyBoundsEvent", "processMouseMotionEvent", "clone", "processContainerEvent", "processFocusEvent", "createRootPane", "frameInit", "processHierarchyEvent", "setRootPane", "isRootPaneCheckingEnabled"}));
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("SMSClient"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "SMSClient";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(SMSClient._PyInner.class, newargs, SMSClient.jpy$packages, SMSClient.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
