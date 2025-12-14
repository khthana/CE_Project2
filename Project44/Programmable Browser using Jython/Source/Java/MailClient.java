import org.python.core.*;

public class MailClient extends java.lang.Object {
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
        private static PyObject s$7;
        private static PyObject i$8;
        private static PyObject s$9;
        private static PyObject i$10;
        private static PyObject i$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject s$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject s$18;
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
        private static PyObject s$52;
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
        private static PyObject s$64;
        private static PyObject s$65;
        private static PyObject s$66;
        private static PyObject s$67;
        private static PyObject s$68;
        private static PyObject s$69;
        private static PyObject s$70;
        private static PyObject s$71;
        private static PyObject s$72;
        private static PyObject s$73;
        private static PyObject s$74;
        private static PyObject s$75;
        private static PyObject s$76;
        private static PyObject s$77;
        private static PyObject s$78;
        private static PyObject s$79;
        private static PyFunctionTable funcTable;
        private static PyCode c$0___init__;
        private static PyCode c$1_windowClosing;
        private static PyCode c$2_MyWindowAdapter;
        private static PyCode c$3___init__;
        private static PyCode c$4_initialize;
        private static PyCode c$5_finalize;
        private static PyCode c$6_validateAll;
        private static PyCode c$7_onRetrieveMail;
        private static PyCode c$8__onRetrieveMail;
        private static PyCode c$9_onSaveMail;
        private static PyCode c$10_onDeleteMail;
        private static PyCode c$11__onDeleteMail;
        private static PyCode c$12_onReplyMail;
        private static PyCode c$13_onForwardMail;
        private static PyCode c$14_onSend;
        private static PyCode c$15__onSend;
        private static PyCode c$16_setmailContent;
        private static PyCode c$17_onClear;
        private static PyCode c$18_onChangeMode;
        private static PyCode c$19_connect;
        private static PyCode c$20_loadMessages;
        private static PyCode c$21_createIndexList;
        private static PyCode c$22_createFromList;
        private static PyCode c$23_createSubjList;
        private static PyCode c$24_deletemessages;
        private static PyCode c$25_EMailFrame;
        private static PyCode c$26_main;
        private static void initConstants() {
            s$0 = Py.newString("mail.profile");
            s$1 = Py.newString("EMailFrame([child]) -> EMailFrame Object");
            i$2 = Py.newInteger(0);
            i$3 = Py.newInteger(600);
            i$4 = Py.newInteger(500);
            s$5 = Py.newString("PWB - e-Mail");
            s$6 = Py.newString("images/gear.gif");
            s$7 = Py.newString("e-Mail Account");
            i$8 = Py.newInteger(1);
            s$9 = Py.newString("Server :       ");
            i$10 = Py.newInteger(300);
            i$11 = Py.newInteger(20);
            s$12 = Py.newString("User name :");
            s$13 = Py.newString("Password :  ");
            s$14 = Py.newString("Retrieve mail");
            s$15 = Py.newString("Delete mail");
            s$16 = Py.newString("Save mail");
            s$17 = Py.newString("Reply mail");
            s$18 = Py.newString("Forward mail");
            i$19 = Py.newInteger(10);
            s$20 = Py.newString("To :           ");
            s$21 = Py.newString("From :      ");
            s$22 = Py.newString("Subject :  ");
            s$23 = Py.newString("Send");
            s$24 = Py.newString("Clear");
            s$25 = Py.newString("Mail box");
            s$26 = Py.newString("Compose message");
            s$27 = Py.newString("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            s$28 = Py.newString("Metal");
            s$29 = Py.newString("javax.swing.plaf.metal.MetalLookAndFeel");
            s$30 = Py.newString("Motif");
            s$31 = Py.newString("com.sun.java.swing.plaf.motif.MotifLookAndFeel");
            s$32 = Py.newString("Windows");
            s$33 = Py.newString("");
            s$34 = Py.newString("profiles/");
            s$35 = Py.newString("<<Mail>> Profile not found");
            s$36 = Py.newString("::");
            s$37 = Py.newString("server");
            s$38 = Py.newString("address");
            s$39 = Py.newString("password");
            s$40 = Py.newString("<<Mail>> MAIL-Profile file corrupt");
            s$41 = Py.newString("w");
            s$42 = Py.newString("server :: %s\012address :: %s\012password :: %s");
            s$43 = Py.newString("<<Mail>> Error writing profile");
            s$44 = Py.newString("<<Mail>> Fail on retrieving mail");
            s$45 = Py.newString("An error occur when trying to connect to mail server.");
            s$46 = Py.newString("Error");
            s$47 = Py.newString(".");
            s$48 = Py.newString("An error occur when trying to save mail.");
            s$49 = Py.newString("@");
            s$50 = Py.newString("Re :");
            s$51 = Py.newString(">\012");
            s$52 = Py.newString("\012");
            s$53 = Py.newString("\012>");
            s$54 = Py.newString(";");
            s$55 = Py.newString("From: %s\012To: %s\012Date: %s\012Subject: %s\012");
            s$56 = Py.newString("<<Mail>> Connecting...");
            s$57 = Py.newString("An error occur when trying to send mail.");
            s$58 = Py.newString("<<Mail>> Failed sending to recipients:");
            s$59 = Py.newString("<<Mail>> Sending complete");
            s$60 = Py.newString("<<Mail>>");
            s$61 = Py.newString("<<Mail>> There are");
            s$62 = Py.newString("mail messages in");
            s$63 = Py.newString("bytes");
            s$64 = Py.newString("<<Mail>> Retrieving:");
            s$65 = Py.newString(": ");
            s$66 = Py.newString(" bytes");
            s$67 = Py.newString("From");
            s$68 = Py.newString("Date");
            s$69 = Py.newString("Subject");
            s$70 = Py.newString(" ");
            s$71 = Py.newString("=>");
            s$72 = Py.newString("=>(unknown)");
            s$73 = Py.newString("unknown");
            s$74 = Py.newString("<<Mail>> Delete mail :");
            s$75 = Py.newString("Are you really want to delete?");
            s$76 = Py.newString("Confirm");
            s$77 = Py.newString("<<Mail>> Deleting messages from server");
            s$78 = Py.newString("__main__");
            s$79 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\MailClient.py");
            funcTable = new _PyInner();
            c$0___init__ = Py.newCode(2, new String[] {"self", "parent"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "__init__", false, false, funcTable, 0, null, null, 0, 1);
            c$1_windowClosing = Py.newCode(2, new String[] {"self", "event"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "windowClosing", false, false, funcTable, 1, null, null, 0, 1);
            c$2_MyWindowAdapter = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "MyWindowAdapter", false, false, funcTable, 2, null, null, 0, 0);
            c$3___init__ = Py.newCode(3, new String[] {"self", "child", "agent", "mbtPanel", "pwPanel", "fromPanel", "composeBtPanel", "subjPanel", "unPanel", "la", "app_style", "svPanel", "toPanel", "composeHeadPanel"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "__init__", false, false, funcTable, 3, null, null, 0, 1);
            c$4_initialize = Py.newCode(1, new String[] {"self", "f", "value", "key", "line", "path", "lines"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "initialize", false, false, funcTable, 4, null, null, 0, 1);
            c$5_finalize = Py.newCode(1, new String[] {"self", "lines", "f", "path"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "finalize", false, false, funcTable, 5, null, null, 0, 1);
            c$6_validateAll = Py.newCode(1, new String[] {"self"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "validateAll", false, false, funcTable, 6, null, null, 0, 1);
            c$7_onRetrieveMail = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onRetrieveMail", false, false, funcTable, 7, null, null, 0, 1);
            c$8__onRetrieveMail = Py.newCode(2, new String[] {"self", "showDialog", "indexList"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "_onRetrieveMail", false, false, funcTable, 8, null, null, 0, 1);
            c$9_onSaveMail = Py.newCode(2, new String[] {"self", "e", "result", "file", "fc"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onSaveMail", false, false, funcTable, 9, null, null, 0, 1);
            c$10_onDeleteMail = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onDeleteMail", false, false, funcTable, 10, null, null, 0, 1);
            c$11__onDeleteMail = Py.newCode(1, new String[] {"self", "toDelete", "passwd", "user", "servername", "verify"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "_onDeleteMail", false, false, funcTable, 11, null, null, 0, 1);
            c$12_onReplyMail = Py.newCode(2, new String[] {"self", "e", "m", "si"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onReplyMail", false, false, funcTable, 12, null, null, 0, 1);
            c$13_onForwardMail = Py.newCode(2, new String[] {"self", "e", "m", "si"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onForwardMail", false, false, funcTable, 13, null, null, 0, 1);
            c$14_onSend = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onSend", false, false, funcTable, 14, null, null, 0, 1);
            c$15__onSend = Py.newCode(2, new String[] {"self", "showDialog", "Subj", "From", "date", "server", "failed", "text", "To"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "_onSend", false, false, funcTable, 15, null, null, 0, 1);
            c$16_setmailContent = Py.newCode(2, new String[] {"self", "e", "index", "content"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "setmailContent", false, false, funcTable, 16, null, null, 0, 1);
            c$17_onClear = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onClear", false, false, funcTable, 17, null, null, 0, 1);
            c$18_onChangeMode = Py.newCode(2, new String[] {"self", "e"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "onChangeMode", false, false, funcTable, 18, null, null, 0, 1);
            c$19_connect = Py.newCode(4, new String[] {"self", "servername", "user", "passwd", "server"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "connect", false, false, funcTable, 19, null, null, 0, 1);
            c$20_loadMessages = Py.newCode(5, new String[] {"self", "servername", "user", "passwd", "loadfrom", "msgBytes", "server", "indexList", "i", "octets", "msgCount", "hdr", "message"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "loadMessages", false, false, funcTable, 20, null, null, 0, 1);
            c$21_createIndexList = Py.newCode(2, new String[] {"self", "msgList", "msg", "msghdrs", "indexList", "strfile", "count", "head", "hdr"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "createIndexList", false, false, funcTable, 21, null, null, 0, 1);
            c$22_createFromList = Py.newCode(2, new String[] {"self", "msgList", "fromList", "msg", "msghdrs", "fromItem", "strfile"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "createFromList", false, false, funcTable, 22, null, null, 0, 1);
            c$23_createSubjList = Py.newCode(2, new String[] {"self", "msgList", "subjItem", "msg", "msghdrs", "strfile", "subjList"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "createSubjList", false, false, funcTable, 23, null, null, 0, 1);
            c$24_deletemessages = Py.newCode(6, new String[] {"self", "servername", "user", "passwd", "toDelete", "verify", "msgnum", "server"}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "deletemessages", false, false, funcTable, 24, null, null, 0, 1);
            c$25_EMailFrame = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "EMailFrame", false, false, funcTable, 25, null, null, 0, 0);
            c$26_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\MailClient.py", "main", false, false, funcTable, 26, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$26_main == null) _PyInner.initConstants();
            return c$26_main;
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
                return _PyInner.onRetrieveMail$8(frame);
                case 8:
                return _PyInner._onRetrieveMail$9(frame);
                case 9:
                return _PyInner.onSaveMail$10(frame);
                case 10:
                return _PyInner.onDeleteMail$11(frame);
                case 11:
                return _PyInner._onDeleteMail$12(frame);
                case 12:
                return _PyInner.onReplyMail$13(frame);
                case 13:
                return _PyInner.onForwardMail$14(frame);
                case 14:
                return _PyInner.onSend$15(frame);
                case 15:
                return _PyInner._onSend$16(frame);
                case 16:
                return _PyInner.setmailContent$17(frame);
                case 17:
                return _PyInner.onClear$18(frame);
                case 18:
                return _PyInner.onChangeMode$19(frame);
                case 19:
                return _PyInner.connect$20(frame);
                case 20:
                return _PyInner.loadMessages$21(frame);
                case 21:
                return _PyInner.createIndexList$22(frame);
                case 22:
                return _PyInner.createFromList$23(frame);
                case 23:
                return _PyInner.createSubjList$24(frame);
                case 24:
                return _PyInner.deletemessages$25(frame);
                case 25:
                return _PyInner.EMailFrame$26(frame);
                case 26:
                return _PyInner.main$27(frame);
                default:
                return null;
            }
        }
        
        private static PyObject __init__$1(PyFrame frame) {
            frame.getlocal(0).__setattr__("parent", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject windowClosing$2(PyFrame frame) {
            frame.getlocal(0).__getattr__("parent").invoke("finalize");
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
            frame.getlocal(0).invoke("setTitle", s$5);
            frame.getlocal(0).invoke("setIconImage", frame.getglobal("ImageIcon").__call__(s$6).invoke("getImage"));
            frame.getlocal(0).invoke("addWindowListener", frame.getlocal(0).invoke("MyWindowAdapter", frame.getlocal(0)));
            frame.getlocal(0).__getattr__("contentPane").invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.getlocal(0).__setattr__("loginPanel", frame.getglobal("JPanel").__call__());
            frame.getlocal(0).__getattr__("loginPanel").invoke("setBorder", frame.getglobal("BorderFactory").__getattr__("createTitledBorder").__call__(frame.getglobal("BorderFactory").__getattr__("createEtchedBorder").__call__(), s$7));
            frame.getlocal(0).__getattr__("loginPanel").invoke("setLayout", frame.getglobal("GridLayout").__call__(i$2, i$8));
            frame.setlocal(11, frame.getglobal("JPanel").__call__());
            frame.setlocal(9, frame.getglobal("FlowLayout").__call__());
            frame.getlocal(9).invoke("setAlignment", frame.getglobal("FlowLayout").__getattr__("LEFT"));
            frame.getlocal(11).invoke("setLayout", frame.getlocal(9));
            frame.getlocal(11).invoke("add", frame.getglobal("JLabel").__call__(s$9));
            frame.getlocal(0).__setattr__("serverTx", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("serverTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$10, i$11));
            frame.getlocal(11).invoke("add", frame.getlocal(0).__getattr__("serverTx"));
            frame.getlocal(0).__getattr__("loginPanel").invoke("add", frame.getlocal(11));
            frame.setlocal(8, frame.getglobal("JPanel").__call__());
            frame.getlocal(8).invoke("setLayout", frame.getlocal(9));
            frame.getlocal(8).invoke("add", frame.getglobal("JLabel").__call__(s$12));
            frame.getlocal(0).__setattr__("userTx", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("userTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$10, i$11));
            frame.getlocal(8).invoke("add", frame.getlocal(0).__getattr__("userTx"));
            frame.getlocal(0).__getattr__("loginPanel").invoke("add", frame.getlocal(8));
            frame.setlocal(4, frame.getglobal("JPanel").__call__());
            frame.getlocal(4).invoke("setLayout", frame.getlocal(9));
            frame.getlocal(4).invoke("add", frame.getglobal("JLabel").__call__(s$13));
            frame.getlocal(0).__setattr__("password", frame.getglobal("JPasswordField").__call__());
            frame.getlocal(0).__getattr__("password").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$10, i$11));
            frame.getlocal(4).invoke("add", frame.getlocal(0).__getattr__("password"));
            frame.getlocal(0).__getattr__("loginPanel").invoke("add", frame.getlocal(4));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("loginPanel"), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(0).__setattr__("mailBoxPanel", frame.getglobal("JPanel").__call__());
            frame.getlocal(0).__getattr__("mailBoxPanel").invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.setlocal(3, frame.getglobal("JPanel").__call__());
            frame.getlocal(0).__setattr__("retrBt", frame.getglobal("JButton").__call__(new PyObject[] {s$14, frame.getlocal(0).__getattr__("onRetrieveMail")}, new String[] {"actionPerformed"}));
            frame.getlocal(3).invoke("add", frame.getlocal(0).__getattr__("retrBt"));
            frame.getlocal(0).__setattr__("deleteBt", frame.getglobal("JButton").__call__(new PyObject[] {s$15, frame.getlocal(0).__getattr__("onDeleteMail")}, new String[] {"actionPerformed"}));
            frame.getlocal(3).invoke("add", frame.getlocal(0).__getattr__("deleteBt"));
            frame.getlocal(0).__getattr__("deleteBt").invoke("setEnabled", i$2);
            frame.getlocal(0).__setattr__("saveBt", frame.getglobal("JButton").__call__(new PyObject[] {s$16, frame.getlocal(0).__getattr__("onSaveMail")}, new String[] {"actionPerformed"}));
            frame.getlocal(3).invoke("add", frame.getlocal(0).__getattr__("saveBt"));
            frame.getlocal(0).__getattr__("saveBt").invoke("setEnabled", i$2);
            frame.getlocal(0).__setattr__("replyBt", frame.getglobal("JButton").__call__(new PyObject[] {s$17, frame.getlocal(0).__getattr__("onReplyMail")}, new String[] {"actionPerformed"}));
            frame.getlocal(3).invoke("add", frame.getlocal(0).__getattr__("replyBt"));
            frame.getlocal(0).__getattr__("replyBt").invoke("setEnabled", i$2);
            frame.getlocal(0).__setattr__("forwardBt", frame.getglobal("JButton").__call__(new PyObject[] {s$18, frame.getlocal(0).__getattr__("onForwardMail")}, new String[] {"actionPerformed"}));
            frame.getlocal(3).invoke("add", frame.getlocal(0).__getattr__("forwardBt"));
            frame.getlocal(0).__getattr__("forwardBt").invoke("setEnabled", i$2);
            frame.getlocal(0).__getattr__("mailBoxPanel").invoke("add", frame.getlocal(3), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(0).__setattr__("mailList", frame.getglobal("JList").__call__(new PyObject[] {frame.getlocal(0).__getattr__("setmailContent")}, new String[] {"valueChanged"}));
            frame.getlocal(0).__getattr__("mailBoxPanel").invoke("add", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("mailList")), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(0).__setattr__("mailContent", frame.getglobal("JTextArea").__call__(i$19, i$19));
            frame.getlocal(0).__getattr__("mailContent").invoke("setEditable", i$2);
            frame.getlocal(0).__getattr__("mailBoxPanel").invoke("add", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("mailContent")), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            frame.getlocal(0).__setattr__("composePanel", frame.getglobal("JPanel").__call__());
            frame.getlocal(0).__getattr__("composePanel").invoke("setLayout", frame.getglobal("BorderLayout").__call__());
            frame.setlocal(13, frame.getglobal("JPanel").__call__());
            frame.getlocal(13).invoke("setLayout", frame.getglobal("GridLayout").__call__(i$2, i$8));
            frame.setlocal(12, frame.getglobal("JPanel").__call__());
            frame.setlocal(9, frame.getglobal("FlowLayout").__call__());
            frame.getlocal(9).invoke("setAlignment", frame.getglobal("FlowLayout").__getattr__("LEFT"));
            frame.getlocal(12).invoke("setLayout", frame.getlocal(9));
            frame.getlocal(12).invoke("add", frame.getglobal("JLabel").__call__(s$20));
            frame.getlocal(0).__setattr__("toTx", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("toTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$10, i$11));
            frame.getlocal(12).invoke("add", frame.getlocal(0).__getattr__("toTx"));
            frame.getlocal(13).invoke("add", frame.getlocal(12));
            frame.setlocal(5, frame.getglobal("JPanel").__call__());
            frame.getlocal(5).invoke("setLayout", frame.getlocal(9));
            frame.getlocal(5).invoke("add", frame.getglobal("JLabel").__call__(s$21));
            frame.getlocal(0).__setattr__("fromTx", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("fromTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$10, i$11));
            frame.getlocal(5).invoke("add", frame.getlocal(0).__getattr__("fromTx"));
            frame.getlocal(13).invoke("add", frame.getlocal(5));
            frame.setlocal(7, frame.getglobal("JPanel").__call__());
            frame.getlocal(7).invoke("setLayout", frame.getlocal(9));
            frame.getlocal(7).invoke("add", frame.getglobal("JLabel").__call__(s$22));
            frame.getlocal(0).__setattr__("subjTx", frame.getglobal("JTextField").__call__());
            frame.getlocal(0).__getattr__("subjTx").invoke("setPreferredSize", frame.getglobal("Dimension").__call__(i$10, i$11));
            frame.getlocal(7).invoke("add", frame.getlocal(0).__getattr__("subjTx"));
            frame.getlocal(13).invoke("add", frame.getlocal(7));
            frame.getlocal(0).__getattr__("composePanel").invoke("add", frame.getlocal(13), frame.getglobal("BorderLayout").__getattr__("NORTH"));
            frame.getlocal(0).__setattr__("composeContent", frame.getglobal("JTextArea").__call__());
            frame.getlocal(0).__getattr__("composePanel").invoke("add", frame.getglobal("JScrollPane").__call__(frame.getlocal(0).__getattr__("composeContent")), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.setlocal(6, frame.getglobal("JPanel").__call__());
            frame.getlocal(6).invoke("add", frame.getglobal("JButton").__call__(new PyObject[] {s$23, frame.getlocal(0).__getattr__("onSend")}, new String[] {"actionPerformed"}));
            frame.getlocal(6).invoke("add", frame.getglobal("JButton").__call__(new PyObject[] {s$24, frame.getlocal(0).__getattr__("onClear")}, new String[] {"actionPerformed"}));
            frame.getlocal(0).__getattr__("composePanel").invoke("add", frame.getlocal(6), frame.getglobal("BorderLayout").__getattr__("SOUTH"));
            frame.getlocal(0).__setattr__("tab", frame.getglobal("JTabbedPane").__call__(new PyObject[] {frame.getlocal(0).__getattr__("onChangeMode")}, new String[] {"stateChanged"}));
            frame.getlocal(0).__getattr__("tab").invoke("add", s$25, frame.getlocal(0).__getattr__("mailBoxPanel"));
            frame.getlocal(0).__getattr__("tab").invoke("add", s$26, frame.getlocal(0).__getattr__("composePanel"));
            frame.getlocal(0).__getattr__("contentPane").invoke("add", frame.getlocal(0).__getattr__("tab"), frame.getglobal("BorderLayout").__getattr__("CENTER"));
            frame.getlocal(0).invoke("initialize");
            if (frame.getlocal(0).__getattr__("agent").__not__().__nonzero__()) {
                frame.setlocal(10, s$27);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$28).__nonzero__()) {
                frame.setlocal(10, s$29);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$30).__nonzero__()) {
                frame.setlocal(10, s$31);
            }
            else if (frame.getlocal(0).__getattr__("agent").__getattr__("user_lookandfeel")._eq(s$32).__nonzero__()) {
                frame.setlocal(10, s$27);
            }
            else {
                frame.setlocal(10, frame.getglobal("UIManager").__getattr__("getSystemLookAndFeelClassName").__call__());
            }
            frame.getglobal("UIManager").__getattr__("setLookAndFeel").__call__(frame.getlocal(10));
            frame.getglobal("SwingUtilities").__getattr__("updateComponentTreeUI").__call__(frame.getlocal(0));
            return Py.None;
        }
        
        private static PyObject initialize$5(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            PyException t$0$PyException;
            
            // Code
            frame.getlocal(0).__setattr__("default_password", s$33);
            frame.getlocal(0).__setattr__("default_server", s$33);
            frame.getlocal(0).__setattr__("default_username", s$33);
            try {
                if (frame.getlocal(0).__getattr__("agent").__nonzero__()) {
                    frame.setlocal(5, frame.getlocal(0).__getattr__("agent").__getattr__("user_path")._add(frame.getglobal("MAIL_PROFILE")));
                }
                else {
                    frame.setlocal(5, s$34._add(frame.getglobal("MAIL_PROFILE")));
                }
                frame.setlocal(1, frame.getglobal("open").__call__(frame.getlocal(5)));
                frame.setlocal(6, frame.getglobal("map").__call__(frame.getglobal("string").__getattr__("strip"), frame.getlocal(1).invoke("readlines")));
                frame.getlocal(1).invoke("close");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$35);
            }
            try {
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(6);
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(4, t$0$PyObject);
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getglobal("map").__call__(frame.getglobal("string").__getattr__("strip"), frame.getlocal(4).invoke("split", s$36)), 2);
                    frame.setlocal(3, t$0$PyObject__[0]);
                    frame.setlocal(2, t$0$PyObject__[1]);
                    if (frame.getlocal(3).__not__().__nonzero__()) {
                        continue;
                    }
                    if (frame.getlocal(3)._eq(s$37).__nonzero__()) {
                        frame.getlocal(0).__setattr__("default_server", frame.getlocal(2));
                    }
                    else if (frame.getlocal(3)._eq(s$38).__nonzero__()) {
                        frame.getlocal(0).__setattr__("default_username", frame.getlocal(2));
                    }
                    else if (frame.getlocal(3)._eq(s$39).__nonzero__()) {
                        frame.getlocal(0).__setattr__("default_password", frame.getlocal(2));
                    }
                }
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                Py.println(s$40);
            }
            return Py.None;
        }
        
        private static PyObject finalize$6(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                if (frame.getlocal(0).__getattr__("agent").__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(0).__getattr__("agent").__getattr__("user_path")._add(frame.getglobal("MAIL_PROFILE")));
                }
                else {
                    frame.setlocal(3, s$34._add(frame.getglobal("MAIL_PROFILE")));
                }
                frame.setlocal(2, frame.getglobal("open").__call__(frame.getlocal(3), s$41));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$35);
            }
            frame.setlocal(1, s$42._mod(new PyTuple(new PyObject[] {frame.getlocal(0).__getattr__("serverTx").__getattr__("text"), frame.getlocal(0).__getattr__("userTx").__getattr__("text"), frame.getlocal(0).__getattr__("password").__getattr__("text")})));
            try {
                frame.getlocal(2).invoke("write", frame.getlocal(1));
                frame.getlocal(2).invoke("close");
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                Py.println(s$43);
            }
            return Py.None;
        }
        
        private static PyObject validateAll$7(PyFrame frame) {
            frame.getlocal(0).invoke("initialize");
            frame.getlocal(0).__getattr__("serverTx").__setattr__("text", frame.getlocal(0).__getattr__("default_server"));
            frame.getlocal(0).__getattr__("userTx").__setattr__("text", frame.getlocal(0).__getattr__("default_username"));
            frame.getlocal(0).__getattr__("password").__setattr__("text", frame.getlocal(0).__getattr__("default_password"));
            return Py.None;
        }
        
        private static PyObject onRetrieveMail$8(PyFrame frame) {
            frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("_onRetrieveMail"), new PyTuple(new PyObject[] {}));
            return Py.None;
        }
        
        private static PyObject _onRetrieveMail$9(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.getlocal(0).__setattr__("msgList", new PyList(new PyObject[] {}));
            frame.getlocal(0).__getattr__("mailContent").invoke("setText", s$33);
            try {
                frame.getlocal(0).invoke("loadMessages", new PyObject[] {frame.getlocal(0).__getattr__("serverTx").invoke("getText"), frame.getlocal(0).__getattr__("userTx").invoke("getText"), frame.getlocal(0).__getattr__("password").invoke("getText")});
                frame.setlocal(2, frame.getlocal(0).invoke("createIndexList", frame.getlocal(0).__getattr__("msgList")));
                frame.getlocal(0).__setattr__("fromList", frame.getlocal(0).invoke("createFromList", frame.getlocal(0).__getattr__("msgList")));
                frame.getlocal(0).__setattr__("subjList", frame.getlocal(0).invoke("createSubjList", frame.getlocal(0).__getattr__("msgList")));
                frame.getlocal(0).__getattr__("mailList").invoke("setListData", frame.getlocal(2));
                if (frame.getlocal(0).__getattr__("msgList")._ne(new PyList(new PyObject[] {})).__nonzero__()) {
                    frame.getlocal(0).__getattr__("saveBt").invoke("setEnabled", i$8);
                    frame.getlocal(0).__getattr__("replyBt").invoke("setEnabled", i$8);
                    frame.getlocal(0).__getattr__("forwardBt").invoke("setEnabled", i$8);
                    frame.getlocal(0).__getattr__("deleteBt").invoke("setEnabled", i$8);
                }
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$44);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$45, s$46, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            return i$8;
        }
        
        private static PyObject onSaveMail$10(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(4, frame.getglobal("JFileChooser").__call__(s$47));
            frame.setlocal(2, frame.getlocal(4).invoke("showSaveDialog", frame.getlocal(0)));
            if (frame.getlocal(2)._eq(frame.getglobal("JFileChooser").__getattr__("APPROVE_OPTION")).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(4).invoke("getSelectedFile"));
                try {
                    frame.getlocal(0).__getattr__("mailContent").invoke("write", frame.getglobal("FileWriter").__call__(frame.getlocal(3)));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$48, s$46, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
            }
            return Py.None;
        }
        
        private static PyObject onDeleteMail$11(PyFrame frame) {
            frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("_onDeleteMail"), new PyTuple(new PyObject[] {}));
            return Py.None;
        }
        
        private static PyObject _onDeleteMail$12(PyFrame frame) {
            frame.setlocal(4, frame.getlocal(0).__getattr__("serverTx").invoke("getText"));
            frame.setlocal(3, frame.getlocal(0).__getattr__("userTx").invoke("getText"));
            frame.setlocal(2, frame.getlocal(0).__getattr__("password").invoke("getText"));
            frame.setlocal(1, frame.getlocal(0).__getattr__("mailList").invoke("getSelectedIndices"));
            frame.setlocal(5, i$8);
            if (frame.getlocal(0).invoke("deletemessages", new PyObject[] {frame.getlocal(4), frame.getlocal(3), frame.getlocal(2), frame.getlocal(1), frame.getlocal(5)}).__nonzero__()) {
                frame.getlocal(0).invoke("_onRetrieveMail");
            }
            return Py.None;
        }
        
        private static PyObject onReplyMail$13(PyFrame frame) {
            frame.setlocal(3, frame.getlocal(0).__getattr__("mailList").invoke("getSelectedIndex"));
            frame.getlocal(0).__getattr__("toTx").invoke("setText", frame.getlocal(0).__getattr__("fromList").__getitem__(frame.getlocal(3)));
            frame.getlocal(0).__getattr__("fromTx").invoke("setText", frame.getlocal(0).__getattr__("userTx").invoke("getText")._add(s$49)._add(frame.getlocal(0).__getattr__("serverTx").invoke("getText")));
            frame.getlocal(0).__getattr__("subjTx").invoke("setText", s$50._add(frame.getlocal(0).__getattr__("subjList").__getitem__(frame.getlocal(3))));
            frame.setlocal(2, s$51._add(frame.getlocal(0).__getattr__("mailContent").invoke("getText")));
            frame.setlocal(2, frame.getlocal(2).invoke("replace", s$52, s$53));
            frame.getlocal(0).__getattr__("composeContent").invoke("setText", frame.getlocal(2));
            frame.getlocal(0).__getattr__("tab").invoke("setSelectedIndex", i$8);
            return Py.None;
        }
        
        private static PyObject onForwardMail$14(PyFrame frame) {
            frame.setlocal(3, frame.getlocal(0).__getattr__("mailList").invoke("getSelectedIndex"));
            frame.getlocal(0).__getattr__("toTx").invoke("setText", s$33);
            frame.getlocal(0).__getattr__("fromTx").invoke("setText", frame.getlocal(0).__getattr__("userTx").invoke("getText")._add(s$49)._add(frame.getlocal(0).__getattr__("serverTx").invoke("getText")));
            frame.getlocal(0).__getattr__("subjTx").invoke("setText", frame.getlocal(0).__getattr__("subjList").__getitem__(frame.getlocal(3)));
            frame.setlocal(2, s$51._add(frame.getlocal(0).__getattr__("mailContent").invoke("getText")));
            frame.setlocal(2, frame.getlocal(2).invoke("replace", s$52, s$53));
            frame.getlocal(0).__getattr__("composeContent").invoke("setText", frame.getlocal(2));
            frame.getlocal(0).__getattr__("tab").invoke("setSelectedIndex", i$8);
            return Py.None;
        }
        
        private static PyObject onSend$15(PyFrame frame) {
            frame.getglobal("start_new_thread").__call__(frame.getlocal(0).__getattr__("_onSend"), new PyTuple(new PyObject[] {}));
            return Py.None;
        }
        
        private static PyObject _onSend$16(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.setlocal(8, frame.getlocal(0).__getattr__("toTx").invoke("getText"));
            frame.setlocal(8, frame.getglobal("string").invoke("split", frame.getlocal(8), s$54));
            frame.setlocal(3, frame.getlocal(0).__getattr__("fromTx").invoke("getText"));
            frame.setlocal(2, frame.getlocal(0).__getattr__("subjTx").invoke("getText"));
            frame.setlocal(4, frame.getglobal("time").__getattr__("ctime").__call__(frame.getglobal("time").__getattr__("time").__call__()));
            frame.setlocal(7, s$55._mod(new PyTuple(new PyObject[] {frame.getlocal(3), frame.getglobal("string").invoke("join", frame.getlocal(8), s$54), frame.getlocal(4), frame.getlocal(2)})));
            frame.setlocal(7, frame.getlocal(7)._add(frame.getlocal(0).__getattr__("composeContent").invoke("getText")));
            Py.println(s$56);
            try {
                frame.setlocal(5, frame.getglobal("smtplib").__getattr__("SMTP").__call__(frame.getlocal(0).__getattr__("serverTx").invoke("getText")));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$45, s$46, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            try {
                frame.setlocal(6, frame.getlocal(5).invoke("sendmail", new PyObject[] {frame.getlocal(3), frame.getlocal(8), frame.getlocal(7)}));
            }
            catch (Throwable x$1) {
                t$0$PyException = Py.setException(x$1, frame);
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$57, s$46, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            frame.getlocal(5).invoke("quit");
            if (frame.getlocal(6).__nonzero__()) {
                Py.printComma(s$58);
                Py.println(frame.getlocal(6));
                if (frame.getlocal(1).__nonzero__()) {
                    frame.getglobal("JOptionPane").__getattr__("showMessageDialog").__call__(new PyObject[] {frame.getlocal(0), s$57, s$46, frame.getglobal("JOptionPane").__getattr__("ERROR_MESSAGE")});
                }
                return i$2;
            }
            else {
                Py.println(s$59);
            }
            return i$8;
        }
        
        private static PyObject setmailContent$17(PyFrame frame) {
            frame.setlocal(2, frame.getlocal(0).__getattr__("mailList").invoke("getSelectedIndex"));
            if (frame.getlocal(2)._ge(i$2).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(0).__getattr__("msgList").__getitem__(frame.getlocal(2)));
                frame.getlocal(0).__getattr__("mailContent").invoke("setText", frame.getlocal(3));
            }
            return Py.None;
        }
        
        private static PyObject onClear$18(PyFrame frame) {
            frame.getlocal(0).__getattr__("composeContent").invoke("setText", s$33);
            return Py.None;
        }
        
        private static PyObject onChangeMode$19(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject connect$20(PyFrame frame) {
            Py.println(s$56);
            frame.setlocal(4, frame.getglobal("poplib").__getattr__("POP3").__call__(frame.getlocal(1)));
            frame.getlocal(4).invoke("user", frame.getlocal(2));
            frame.getlocal(4).invoke("pass_", frame.getlocal(3));
            Py.printComma(s$60);
            Py.println(frame.getlocal(4).invoke("getwelcome"));
            return frame.getlocal(4);
        }
        
        private static PyObject loadMessages$21(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(6, frame.getlocal(0).invoke("connect", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3)}));
            try {
                Py.println(frame.getlocal(6).invoke("list"));
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(6).invoke("stat"), 2);
                frame.setlocal(10, t$0$PyObject__[0]);
                frame.setlocal(5, t$0$PyObject__[1]);
                Py.printComma(s$61);
                Py.printComma(frame.getlocal(10));
                Py.printComma(s$62);
                Py.printComma(frame.getlocal(5));
                Py.println(s$63);
                Py.printComma(s$64);
                t$0$int = 0;
                t$1$PyObject = frame.getglobal("range").__call__(frame.getlocal(4), frame.getlocal(10)._add(i$8));
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(8, t$0$PyObject);
                    Py.printComma(frame.getlocal(8));
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(6).invoke("retr", frame.getlocal(8)), 3);
                    frame.setlocal(11, t$0$PyObject__[0]);
                    frame.setlocal(12, t$0$PyObject__[1]);
                    frame.setlocal(9, t$0$PyObject__[2]);
                    frame.getlocal(0).__getattr__("msgList").invoke("append", frame.getglobal("string").invoke("join", frame.getlocal(12), s$52));
                    frame.setlocal(7, frame.getlocal(0).invoke("createIndexList", frame.getlocal(0).__getattr__("msgList")));
                    frame.getlocal(0).__getattr__("mailList").invoke("setListData", frame.getlocal(7));
                }
                Py.println();
            }
            finally {
                frame.getlocal(6).invoke("quit");
            }
            if (frame.getglobal("__debug__").__nonzero__()) Py.assert(frame.getglobal("len").__call__(frame.getlocal(0).__getattr__("msgList"))._eq(frame.getlocal(10)._sub(frame.getlocal(4))._add(i$8)));
            return Py.None;
        }
        
        private static PyObject createIndexList$22(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            frame.setlocal(4, new PyList(new PyObject[] {}));
            frame.setlocal(6, i$2);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                frame.setlocal(7, s$33);
                frame.setlocal(5, frame.getglobal("StringIO").__getattr__("StringIO").__call__(frame.getlocal(2)));
                frame.setlocal(3, frame.getglobal("rfc822").__getattr__("Message").__call__(frame.getlocal(5)));
                frame.setlocal(6, frame.getlocal(6)._add(i$8));
                frame.setlocal(7, frame.getglobal("str").__call__(frame.getlocal(6))._add(s$65)._add(frame.getglobal("str").__call__(frame.getglobal("len").__call__(frame.getlocal(2))))._add(s$66));
                t$1$int = 0;
                t$3$PyObject = new PyTuple(new PyObject[] {s$67, s$68, s$69});
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    frame.setlocal(8, t$2$PyObject);
                    try {
                        frame.setlocal(7, frame.getlocal(7)._add(s$70)._add(frame.getlocal(8))._add(s$71)._add(frame.getlocal(3).__getitem__(frame.getlocal(8))));
                    }
                    catch (Throwable x$0) {
                        t$0$PyException = Py.setException(x$0, frame);
                        frame.setlocal(7, frame.getlocal(7)._add(s$70)._add(frame.getlocal(8))._add(s$72));
                    }
                }
                frame.getlocal(4).invoke("append", frame.getlocal(7));
            }
            return frame.getlocal(4);
        }
        
        private static PyObject createFromList$23(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(2, new PyList(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.setlocal(6, frame.getglobal("StringIO").__getattr__("StringIO").__call__(frame.getlocal(3)));
                frame.setlocal(4, frame.getglobal("rfc822").__getattr__("Message").__call__(frame.getlocal(6)));
                try {
                    frame.setlocal(5, frame.getlocal(4).__getitem__(s$67));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    frame.setlocal(5, s$73);
                }
                frame.getlocal(2).invoke("append", frame.getlocal(5));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject createSubjList$24(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyException t$0$PyException;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            frame.setlocal(6, new PyList(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.setlocal(5, frame.getglobal("StringIO").__getattr__("StringIO").__call__(frame.getlocal(3)));
                frame.setlocal(4, frame.getglobal("rfc822").__getattr__("Message").__call__(frame.getlocal(5)));
                try {
                    frame.setlocal(2, frame.getlocal(4).__getitem__(s$69));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    frame.setlocal(2, s$73);
                }
                frame.getlocal(6).invoke("append", frame.getlocal(2));
            }
            return frame.getlocal(6);
        }
        
        private static PyObject deletemessages$25(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            Py.printComma(s$74);
            Py.println(frame.getlocal(4));
            if (((t$0$PyObject = frame.getlocal(5)).__nonzero__() ? i$8._eq(frame.getglobal("JOptionPane").__getattr__("showConfirmDialog").__call__(new PyObject[] {frame.getlocal(0), s$75, s$76, frame.getglobal("JOptionPane").__getattr__("YES_NO_OPTION")})) : t$0$PyObject).__nonzero__()) {
                return i$2;
            }
            else {
                frame.setlocal(7, frame.getlocal(0).invoke("connect", new PyObject[] {frame.getlocal(1), frame.getlocal(2), frame.getlocal(3)}));
                try {
                    Py.println(s$77);
                    t$0$int = 0;
                    t$1$PyObject = frame.getlocal(4);
                    while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                        frame.setlocal(6, t$0$PyObject);
                        frame.getlocal(7).invoke("dele", frame.getlocal(6)._add(i$8));
                    }
                }
                finally {
                    frame.getlocal(7).invoke("quit");
                }
                return i$8;
            }
        }
        
        private static PyObject EMailFrame$26(PyFrame frame) {
            /* EMailFrame([child]) -> EMailFrame Object */
            frame.setlocal("MyWindowAdapter", Py.makeClass("MyWindowAdapter", new PyObject[] {frame.getname("WindowAdapter")}, c$2_MyWindowAdapter, null, MyWindowAdapter.class));
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {i$8, frame.getname("None")}, c$3___init__));
            frame.setlocal("initialize", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_initialize));
            frame.setlocal("finalize", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_finalize));
            frame.setlocal("validateAll", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_validateAll));
            frame.setlocal("onRetrieveMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_onRetrieveMail));
            frame.setlocal("_onRetrieveMail", new PyFunction(frame.f_globals, new PyObject[] {i$8}, c$8__onRetrieveMail));
            frame.setlocal("onSaveMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_onSaveMail));
            frame.setlocal("onDeleteMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_onDeleteMail));
            frame.setlocal("_onDeleteMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$11__onDeleteMail));
            frame.setlocal("onReplyMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_onReplyMail));
            frame.setlocal("onForwardMail", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_onForwardMail));
            frame.setlocal("onSend", new PyFunction(frame.f_globals, new PyObject[] {frame.getname("None")}, c$14_onSend));
            frame.setlocal("_onSend", new PyFunction(frame.f_globals, new PyObject[] {i$8}, c$15__onSend));
            frame.setlocal("setmailContent", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_setmailContent));
            frame.setlocal("onClear", new PyFunction(frame.f_globals, new PyObject[] {}, c$17_onClear));
            frame.setlocal("onChangeMode", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_onChangeMode));
            frame.setlocal("connect", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_connect));
            frame.setlocal("loadMessages", new PyFunction(frame.f_globals, new PyObject[] {i$8}, c$20_loadMessages));
            frame.setlocal("createIndexList", new PyFunction(frame.f_globals, new PyObject[] {}, c$21_createIndexList));
            frame.setlocal("createFromList", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_createFromList));
            frame.setlocal("createSubjList", new PyFunction(frame.f_globals, new PyObject[] {}, c$23_createSubjList));
            frame.setlocal("deletemessages", new PyFunction(frame.f_globals, new PyObject[] {i$2}, c$24_deletemessages));
            return frame.getf_locals();
        }
        
        private static PyObject main$27(PyFrame frame) {
            frame.setglobal("__file__", s$79);
            
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
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            frame.setlocal("poplib", org.python.core.imp.importOne("poplib", frame));
            frame.setlocal("rfc822", org.python.core.imp.importOne("rfc822", frame));
            frame.setlocal("string", org.python.core.imp.importOne("string", frame));
            frame.setlocal("StringIO", org.python.core.imp.importOne("StringIO", frame));
            frame.setlocal("smtplib", org.python.core.imp.importOne("smtplib", frame));
            frame.setlocal("time", org.python.core.imp.importOne("time", frame));
            org.python.core.imp.importAll("thread", frame);
            frame.setlocal("MAIL_PROFILE", s$0);
            frame.setlocal("EMailFrame", Py.makeClass("EMailFrame", new PyObject[] {frame.getname("JFrame")}, c$25_EMailFrame, null, EMailFrame.class));
            if (frame.getname("__name__")._eq(s$78).__nonzero__()) {
                frame.setlocal("frame", frame.getname("EMailFrame").__call__(i$2));
                frame.getname("frame").invoke("show");
            }
            return Py.None;
        }
        
    }
    public static class EMailFrame extends javax.swing.JFrame implements org.python.core.PyProxy, org.python.core.ClassDictInit {
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
        
        public EMailFrame(java.awt.GraphicsConfiguration arg0) {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public EMailFrame(java.lang.String arg0) throws java.awt.HeadlessException {
            super(arg0);
            __initProxy__(new Object[] {arg0});
        }
        
        public EMailFrame(java.lang.String arg0, java.awt.GraphicsConfiguration arg1) {
            super(arg0, arg1);
            __initProxy__(new Object[] {arg0, arg1});
        }
        
        public EMailFrame() throws java.awt.HeadlessException {
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
            Py.initProxy(this, "MailClient", "EMailFrame", args, MailClient.jpy$packages, MailClient.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"processInputMethodEvent", "requestFocus", "firePropertyChange", "setRootPaneCheckingEnabled", "processMouseWheelEvent", "processWindowEvent", "processEvent", "processComponentEvent", "processWindowStateEvent", "paramString", "coalesceEvents", "requestFocusInWindow", "super__disableEvents", "super__enableEvents", "processMouseEvent", "super__finalize", "processKeyEvent", "addImpl", "validateTree", "processWindowFocusEvent", "processHierarchyBoundsEvent", "processMouseMotionEvent", "clone", "processContainerEvent", "processFocusEvent", "createRootPane", "frameInit", "processHierarchyEvent", "setRootPane", "isRootPaneCheckingEnabled"}));
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
            Py.initProxy(this, "MailClient", "MyWindowAdapter", args, MailClient.jpy$packages, MailClient.jpy$proxyProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
        }
        
        static public void classDictInit(PyObject dict) {
            dict.__setitem__("__supernames__", Py.java2py(new String[] {"super__windowClosing", "finalize", "clone"}));
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("MailClient"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "MailClient";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(MailClient._PyInner.class, newargs, MailClient.jpy$packages, MailClient.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
