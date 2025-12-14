import org.python.core.*;

public class AgentServer extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject i$2;
        private static PyObject s$3;
        private static PyObject s$4;
        private static PyObject i$5;
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
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject s$22;
        private static PyObject s$23;
        private static PyObject i$24;
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyObject i$27;
        private static PyObject s$28;
        private static PyObject s$29;
        private static PyObject i$30;
        private static PyObject s$31;
        private static PyObject s$32;
        private static PyObject s$33;
        private static PyObject s$34;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_handleLogin;
        private static PyCode c$1_handleRunCode;
        private static PyCode c$2_handleEventAction;
        private static PyCode c$3_verifyUser;
        private static PyCode c$4_runCode;
        private static PyCode c$5_runEventAction;
        private static PyCode c$6_do_GET;
        private static PyCode c$7_MyHandler;
        private static PyCode c$8_createWebServer;
        private static PyCode c$9_main;
        private static void initConstants() {
            s$0 = Py.newString("<html>\012<head>\012<title>Un title page</title>\012<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\012<style type=\"text/css\">\012<!--\012body {  margin: 0px  0px; padding: 0px  0px}\012a:link { color: #005CA2; text-decoration: none}\012a:visited { color: #005CA2; text-decoration: none}\012a:active { color: #0099FF; text-decoration: underline}\012a:hover { color: #0099FF; text-decoration: underline}\012-->\012</style>\012</head>\012\012<body bgcolor=\"#FF99FF\">\012<div align=\"center\"><font size=\"4\" color=\"#FFCC33\"><b>Output console </b></font> \012  <form name=\"form1\" method=\"post\" action=\"\">\012    <textarea name=\"output\" cols=\"60\" rows=\"19\"><!-- output --></textarea>\012    <br>\012  </form>\012</div>\012</body>\012</html>\012");
            s$1 = Py.newString("<html>\012<head>\012<title>Un title page</title>\012<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">\012<style type=\"text/css\">\012<!--\012body {  margin: 0px  0px; padding: 0px  0px}\012a:link { color: #005CA2; text-decoration: none}\012a:visited { color: #005CA2; text-decoration: none}\012a:active { color: #0099FF; text-decoration: underline}\012a:hover { color: #0099FF; text-decoration: underline}\012-->\012</style>\012</head>\012\012<body bgcolor=\"#0066FF\">\012<div align=\"center\"> \012  <p><font color=\"#CC3300\" size=\"6\"><b><font color=\"#FFCC33\">Logout complete<br>\012    Thanks for using me remotely</font></b></font><br>\012    <font color=\"#00CC66\"><b><font size=\"5\">Bye Bye<br>\012    <!-- username --></font></b></font></p>\012</div>\012</body>\012</html>\012");
            i$2 = Py.newInteger(0);
            s$3 = Py.newString("?");
            s$4 = Py.newString("&");
            i$5 = Py.newInteger(1);
            s$6 = Py.newString("=");
            s$7 = Py.newString("###summary###");
            s$8 = Py.newString("");
            s$9 = Py.newString("remote script error");
            s$10 = Py.newString("/");
            s$11 = Py.newString("/login.html");
            s$12 = Py.newString("login.html");
            s$13 = Py.newString("/mainframe.html");
            s$14 = Py.newString("verify pass");
            s$15 = Py.newString("mainframe.html");
            s$16 = Py.newString("Login Fail");
            s$17 = Py.newString("/script");
            s$18 = Py.newString("<!-- output -->");
            s$19 = Py.newString("Cannot run because you do not login");
            s$20 = Py.newString("/eventaction");
            s$21 = Py.newString("/logout");
            s$22 = Py.newString("<!-- username -->");
            s$23 = Py.newString("You do not login.");
            i$24 = Py.newInteger(200);
            s$25 = Py.newString("Content-type");
            s$26 = Py.newString("text/html");
            i$27 = Py.newInteger(404);
            s$28 = Py.newString("File not found: %s");
            s$29 = Py.newString("\012    def do_POST(self) :\012        try :\012            f=open(curdir+sep+self.path)\012            print self.path\012            print self.headers\012            #print self.rfile.read()\012            self.send_response(200)\012            self.send_header('Content-type', 'text/html')\012            self.end_headers()\012            self.wfile.write(f.read())\012            f.close()\012        except IOError :\012            self.send_error(404, 'File not found: %s'%self.path)\012            ");
            i$30 = Py.newInteger(80);
            s$31 = Py.newString("Start HTTP Server");
            s$32 = Py.newString("Error in HTTP Server");
            s$33 = Py.newString("__main__");
            s$34 = Py.newString("H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py");
            funcTable = new _PyInner();
            c$0_handleLogin = Py.newCode(2, new String[] {"self", "rawURL", "usrItem", "url", "formData", "usr", "pwd", "realUsr", "pwdItem", "realPwd", "realURL", "submitItem"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "handleLogin", false, false, funcTable, 0, null, null, 0, 1);
            c$1_handleRunCode = Py.newCode(2, new String[] {"self", "rawURL", "url", "realCode", "code", "formData", "codeItem", "realURL"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "handleRunCode", false, false, funcTable, 1, null, null, 0, 1);
            c$2_handleEventAction = Py.newCode(2, new String[] {"self", "rawURL", "listItem", "url", "formData", "realList", "list", "realURL"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "handleEventAction", false, false, funcTable, 2, null, null, 0, 1);
            c$3_verifyUser = Py.newCode(3, new String[] {"self", "usr", "pwd"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "verifyUser", false, false, funcTable, 3, null, null, 0, 1);
            c$4_runCode = Py.newCode(2, new String[] {"self", "code"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "runCode", false, false, funcTable, 4, null, null, 0, 0);
            c$5_runEventAction = Py.newCode(2, new String[] {"self", "code", "p"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "runEventAction", false, false, funcTable, 5, null, null, 0, 1);
            c$6_do_GET = Py.newCode(1, new String[] {"self", "url", "code", "usr", "op", "f", "pwd", "allLists"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "do_GET", false, false, funcTable, 6, null, null, 0, 1);
            c$7_MyHandler = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "MyHandler", false, false, funcTable, 7, null, null, 0, 0);
            c$8_createWebServer = Py.newCode(0, new String[] {"server"}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "createWebServer", false, false, funcTable, 8, null, null, 0, 1);
            c$9_main = Py.newCode(0, new String[] {}, "H:\\@Project\\to Write\\Programmable Browser\\AgentServer.py", "main", false, false, funcTable, 9, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$9_main == null) _PyInner.initConstants();
            return c$9_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.handleLogin$1(frame);
                case 1:
                return _PyInner.handleRunCode$2(frame);
                case 2:
                return _PyInner.handleEventAction$3(frame);
                case 3:
                return _PyInner.verifyUser$4(frame);
                case 4:
                return _PyInner.runCode$5(frame);
                case 5:
                return _PyInner.runEventAction$6(frame);
                case 6:
                return _PyInner.do_GET$7(frame);
                case 7:
                return _PyInner.MyHandler$8(frame);
                case 8:
                return _PyInner.createWebServer$9(frame);
                case 9:
                return _PyInner.main$10(frame);
                default:
                return null;
            }
        }
        
        private static PyObject handleLogin$1(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1).invoke("split", s$3), 2);
            frame.setlocal(3, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(4).invoke("split", s$4), 3);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(8, t$0$PyObject__[1]);
            frame.setlocal(11, t$0$PyObject__[2]);
            frame.setlocal(5, frame.getlocal(2).invoke("split", s$6).__getitem__(i$5));
            frame.setlocal(6, frame.getlocal(8).invoke("split", s$6).__getitem__(i$5));
            Py.println(s$7);
            frame.setlocal(10, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(3)));
            Py.println(frame.getlocal(10));
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(5)));
            Py.println(frame.getlocal(7));
            frame.setlocal(9, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(6)));
            Py.println(frame.getlocal(9));
            return new PyTuple(new PyObject[] {frame.getlocal(10), frame.getlocal(7), frame.getlocal(9)});
        }
        
        private static PyObject handleRunCode$2(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1).invoke("split", s$3), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(5, t$0$PyObject__[1]);
            frame.setlocal(6, frame.getlocal(5).invoke("split", s$4).__getitem__(i$2));
            frame.setlocal(4, frame.getlocal(6).invoke("split", s$6).__getitem__(i$5));
            Py.println(s$7);
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(2)));
            Py.println(frame.getlocal(7));
            frame.setlocal(3, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(4)));
            Py.println(frame.getlocal(3));
            return new PyTuple(new PyObject[] {frame.getlocal(7), frame.getlocal(3)});
        }
        
        private static PyObject handleEventAction$3(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(1).invoke("split", s$3), 2);
            frame.setlocal(3, t$0$PyObject__[0]);
            frame.setlocal(4, t$0$PyObject__[1]);
            frame.setlocal(2, frame.getlocal(4).invoke("split", s$4).__getitem__(i$2));
            frame.setlocal(6, frame.getlocal(2).invoke("split", s$6).__getitem__(i$5));
            Py.println(s$7);
            frame.setlocal(7, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(3)));
            Py.println(frame.getlocal(7));
            frame.setlocal(5, frame.getglobal("urllib").__getattr__("unquote_plus").__call__(frame.getlocal(6)));
            Py.println(frame.getlocal(5));
            return new PyTuple(new PyObject[] {frame.getlocal(7), frame.getlocal(5)});
        }
        
        private static PyObject verifyUser$4(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            if (((t$0$PyObject = frame.getlocal(1)._eq(frame.getglobal("agent").__getattr__("user_name"))).__nonzero__() ? frame.getlocal(2)._eq(frame.getglobal("agent").__getattr__("user_password")) : t$0$PyObject).__nonzero__()) {
                return i$5;
            }
            return i$2;
        }
        
        private static PyObject runCode$5(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.getname("agent").__getattr__("console").__getattr__("textpane").invoke("setText", s$8);
            try {
                Py.exec(frame.getlocal(1), frame.getname("agent").__getattr__("agentNameSpace"), null);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                Py.println(s$9);
            }
            return Py.None;
        }
        
        private static PyObject runEventAction$6(PyFrame frame) {
            frame.getglobal("agent").__getattr__("console").__getattr__("textpane").invoke("setText", s$8);
            frame.setlocal(2, frame.getglobal("Parser").__call__(frame.getglobal("agent")));
            frame.getlocal(2).invoke("addEventAction", frame.getlocal(1));
            return Py.None;
        }
        
        private static PyObject do_GET$7(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            try {
                Py.println(frame.getlocal(0).__getattr__("path"));
                if (((t$0$PyObject = frame.getlocal(0).__getattr__("path")._eq(s$10)).__nonzero__() ? t$0$PyObject : frame.getlocal(0).__getattr__("path")._eq(s$11)).__nonzero__()) {
                    frame.setlocal(5, frame.getglobal("open").__call__(frame.getglobal("curdir")._add(frame.getglobal("sep"))._add(s$12)));
                    frame.setlocal(4, frame.getlocal(5).invoke("read"));
                    frame.getlocal(5).invoke("close");
                }
                else if (frame.getlocal(0).__getattr__("path").invoke("startswith", s$13).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("handleLogin", frame.getlocal(0).__getattr__("path")), 3);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(3, t$0$PyObject__[1]);
                    frame.setlocal(6, t$0$PyObject__[2]);
                    if (frame.getlocal(0).invoke("verifyUser", frame.getlocal(3), frame.getlocal(6)).__nonzero__()) {
                        Py.println(s$14);
                        // global remoteLoginState
                        frame.setglobal("remoteLoginState", i$5);
                        frame.setlocal(5, frame.getglobal("open").__call__(frame.getglobal("curdir")._add(frame.getglobal("sep"))._add(s$15)));
                        frame.setlocal(4, frame.getlocal(5).invoke("read"));
                        frame.getlocal(5).invoke("close");
                    }
                    else {
                        frame.setlocal(4, s$16);
                    }
                }
                else if (frame.getlocal(0).__getattr__("path").invoke("startswith", s$17).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("handleRunCode", frame.getlocal(0).__getattr__("path")), 2);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(2, t$0$PyObject__[1]);
                    // global remoteLoginState
                    if (frame.getglobal("remoteLoginState").__nonzero__()) {
                        frame.getlocal(0).invoke("runCode", frame.getlocal(2));
                        frame.setlocal(4, frame.getglobal("scriptOutput").invoke("replace", s$18, frame.getglobal("agent").__getattr__("console").__getattr__("textpane").invoke("getText")));
                    }
                    else {
                        Py.println(s$19);
                        frame.setlocal(4, s$19);
                    }
                }
                else if (frame.getlocal(0).__getattr__("path").invoke("startswith", s$20).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(0).invoke("handleEventAction", frame.getlocal(0).__getattr__("path")), 2);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(7, t$0$PyObject__[1]);
                    // global remoteLoginState
                    if (frame.getglobal("remoteLoginState").__nonzero__()) {
                        frame.getlocal(0).invoke("runEventAction", frame.getlocal(7));
                        frame.setlocal(4, frame.getglobal("scriptOutput").invoke("replace", s$18, frame.getlocal(7)._add(frame.getglobal("agent").__getattr__("console").__getattr__("textpane").invoke("getText"))));
                    }
                    else {
                        Py.println(s$19);
                        frame.setlocal(4, s$19);
                    }
                }
                else if (frame.getlocal(0).__getattr__("path").invoke("startswith", s$21).__nonzero__()) {
                    if (frame.getglobal("remoteLoginState").__nonzero__()) {
                        frame.setglobal("remoteLoginState", i$2);
                        frame.setlocal(4, frame.getglobal("logoutPage").invoke("replace", s$22, frame.getglobal("agent").__getattr__("user_name")));
                    }
                    else {
                        frame.setlocal(4, s$23);
                    }
                }
                else {
                    frame.setlocal(5, frame.getglobal("open").__call__(frame.getglobal("curdir")._add(frame.getglobal("sep"))._add(frame.getlocal(0).__getattr__("path"))));
                    frame.setlocal(4, frame.getlocal(5).invoke("read"));
                    frame.getlocal(5).invoke("close");
                }
                frame.getlocal(0).invoke("send_response", i$24);
                frame.getlocal(0).invoke("send_header", s$25, s$26);
                frame.getlocal(0).invoke("end_headers");
                frame.getlocal(0).__getattr__("wfile").invoke("write", frame.getlocal(4));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                    frame.getlocal(0).invoke("send_error", i$27, s$28._mod(frame.getlocal(0).__getattr__("path")));
                    /* 
                        def do_POST(self) :
                            try :
                                f=open(curdir+sep+self.path)
                                print self.path
                                print self.headers
                                #print self.rfile.read()
                                self.send_response(200)
                                self.send_header('Content-type', 'text/html')
                                self.end_headers()
                                self.wfile.write(f.read())
                                f.close()
                            except IOError :
                                self.send_error(404, 'File not found: %s'%self.path)
                                 */
                }
                else throw t$0$PyException;
            }
            return Py.None;
        }
        
        private static PyObject MyHandler$8(PyFrame frame) {
            frame.setlocal("handleLogin", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_handleLogin));
            frame.setlocal("handleRunCode", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_handleRunCode));
            frame.setlocal("handleEventAction", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_handleEventAction));
            frame.setlocal("verifyUser", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_verifyUser));
            frame.setlocal("runCode", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_runCode));
            frame.setlocal("runEventAction", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_runEventAction));
            frame.setlocal("do_GET", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_do_GET));
            return frame.getf_locals();
        }
        
        private static PyObject createWebServer$9(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            // global remoteLoginState
            frame.setglobal("remoteLoginState", i$2);
            try {
                frame.setlocal(0, frame.getglobal("HTTPServer").__call__(new PyTuple(new PyObject[] {s$8, i$30}), frame.getglobal("MyHandler")));
                Py.println(s$31);
                frame.getlocal(0).invoke("serve_forever");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("KeyboardInterrupt"))) {
                    Py.println(s$32);
                    frame.getlocal(0).__getattr__("socket").invoke("close");
                }
                else throw t$0$PyException;
            }
            return Py.None;
        }
        
        private static PyObject main$10(PyFrame frame) {
            frame.setglobal("__file__", s$34);
            
            PyObject[] imp_accu;
            // Code
            imp_accu = org.python.core.imp.importFrom("os", new String[] {"curdir", "sep"}, frame);
            frame.setlocal("curdir", imp_accu[0]);
            frame.setlocal("sep", imp_accu[1]);
            imp_accu = null;
            imp_accu = org.python.core.imp.importFrom("BaseHTTPServer", new String[] {"BaseHTTPRequestHandler", "HTTPServer"}, frame);
            frame.setlocal("BaseHTTPRequestHandler", imp_accu[0]);
            frame.setlocal("HTTPServer", imp_accu[1]);
            imp_accu = null;
            frame.setlocal("urllib", org.python.core.imp.importOne("urllib", frame));
            org.python.core.imp.importAll("WebAgent", frame);
            imp_accu = org.python.core.imp.importFrom("Parser", new String[] {"Parser"}, frame);
            frame.setlocal("Parser", imp_accu[0]);
            imp_accu = null;
            frame.setlocal("scriptOutput", s$0);
            frame.setlocal("logoutPage", s$1);
            frame.setlocal("remoteLoginState", i$2);
            frame.setlocal("MyHandler", Py.makeClass("MyHandler", new PyObject[] {frame.getname("BaseHTTPRequestHandler")}, c$7_MyHandler, null));
            frame.setlocal("createWebServer", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_createWebServer));
            if (frame.getname("__name__")._eq(s$33).__nonzero__()) {
                frame.setlocal("status", frame.getname("None"));
                frame.setlocal("popup", frame.getname("createLoadingPopup").__call__());
                frame.getname("popup").invoke("show");
                frame.setlocal("agent", frame.getname("AgentFrame").__call__());
                frame.getname("agent").invoke("show");
                frame.getname("popup").invoke("hide");
                frame.getname("agent").invoke("showLoginDialog");
                frame.getname("createWebServer").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("AgentServer"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "AgentServer";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(AgentServer._PyInner.class, newargs, AgentServer.jpy$packages, AgentServer.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
