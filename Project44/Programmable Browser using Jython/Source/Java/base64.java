import org.python.core.*;

public class base64 extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject s$3;
        private static PyObject s$4;
        private static PyObject i$5;
        private static PyObject i$6;
        private static PyObject i$7;
        private static PyObject s$8;
        private static PyObject i$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject s$14;
        private static PyObject s$15;
        private static PyObject i$16;
        private static PyObject i$17;
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject s$20;
        private static PyObject s$21;
        private static PyObject s$22;
        private static PyObject s$23;
        private static PyObject s$24;
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_encode;
        private static PyCode c$1_decode;
        private static PyCode c$2_encodestring;
        private static PyCode c$3_decodestring;
        private static PyCode c$4_test;
        private static PyCode c$5_test1;
        private static PyCode c$6_main;
        private static void initConstants() {
            s$0 = Py.newString("Conversions to/from base64 transport encoding as per RFC-1521.");
            s$1 = Py.newString("encode");
            s$2 = Py.newString("decode");
            s$3 = Py.newString("encodestring");
            s$4 = Py.newString("decodestring");
            i$5 = Py.newInteger(76);
            i$6 = Py.newInteger(4);
            i$7 = Py.newInteger(3);
            s$8 = Py.newString("Encode a file.");
            i$9 = Py.newInteger(1);
            s$10 = Py.newString("Decode a file.");
            s$11 = Py.newString("Encode a string.");
            s$12 = Py.newString("Decode a string.");
            s$13 = Py.newString("Small test program");
            s$14 = Py.newString("deut");
            s$15 = Py.newString("usage: %s [-d|-e|-u|-t] [file|-]\012        -d, -u: decode\012        -e: encode (default)\012        -t: encode and decode string 'Aladdin:open sesame'");
            i$16 = Py.newInteger(0);
            i$17 = Py.newInteger(2);
            s$18 = Py.newString("-e");
            s$19 = Py.newString("-d");
            s$20 = Py.newString("-u");
            s$21 = Py.newString("-t");
            s$22 = Py.newString("-");
            s$23 = Py.newString("rb");
            s$24 = Py.newString("Aladdin:open sesame");
            s$25 = Py.newString("__main__");
            s$26 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\base64.py");
            funcTable = new _PyInner();
            c$0_encode = Py.newCode(2, new String[] {"input", "output", "line", "ns", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "encode", false, false, funcTable, 0, null, null, 0, 1);
            c$1_decode = Py.newCode(2, new String[] {"input", "output", "line", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "decode", false, false, funcTable, 1, null, null, 0, 1);
            c$2_encodestring = Py.newCode(1, new String[] {"s", "g", "StringIO", "f"}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "encodestring", false, false, funcTable, 2, null, null, 0, 1);
            c$3_decodestring = Py.newCode(1, new String[] {"s", "g", "StringIO", "f"}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "decodestring", false, false, funcTable, 3, null, null, 0, 1);
            c$4_test = Py.newCode(0, new String[] {"opts", "o", "msg", "func", "args", "getopt", "a", "sys"}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "test", false, false, funcTable, 4, null, null, 0, 1);
            c$5_test1 = Py.newCode(0, new String[] {"s2", "s1", "s0"}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "test1", false, false, funcTable, 5, null, null, 0, 1);
            c$6_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\base64.py", "main", false, false, funcTable, 6, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$6_main == null) _PyInner.initConstants();
            return c$6_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.encode$1(frame);
                case 1:
                return _PyInner.decode$2(frame);
                case 2:
                return _PyInner.encodestring$3(frame);
                case 3:
                return _PyInner.decodestring$4(frame);
                case 4:
                return _PyInner.test$5(frame);
                case 5:
                return _PyInner.test1$6(frame);
                case 6:
                return _PyInner.main$7(frame);
                default:
                return null;
            }
        }
        
        private static PyObject encode$1(PyFrame frame) {
            /* Encode a file. */
            while (i$9.__nonzero__()) {
                frame.setlocal(4, frame.getlocal(0).invoke("read", frame.getglobal("MAXBINSIZE")));
                if (frame.getlocal(4).__not__().__nonzero__()) {
                    break;
                }
                while (frame.getglobal("len").__call__(frame.getlocal(4))._lt(frame.getglobal("MAXBINSIZE")).__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(0).invoke("read", frame.getglobal("MAXBINSIZE")._sub(frame.getglobal("len").__call__(frame.getlocal(4)))));
                    if (frame.getlocal(3).__not__().__nonzero__()) {
                        break;
                    }
                    frame.setlocal(4, frame.getlocal(4)._add(frame.getlocal(3)));
                }
                frame.setlocal(2, frame.getglobal("binascii").__getattr__("b2a_base64").__call__(frame.getlocal(4)));
                frame.getlocal(1).invoke("write", frame.getlocal(2));
            }
            return Py.None;
        }
        
        private static PyObject decode$2(PyFrame frame) {
            /* Decode a file. */
            while (i$9.__nonzero__()) {
                frame.setlocal(2, frame.getlocal(0).invoke("readline"));
                if (frame.getlocal(2).__not__().__nonzero__()) {
                    break;
                }
                frame.setlocal(3, frame.getglobal("binascii").__getattr__("a2b_base64").__call__(frame.getlocal(2)));
                frame.getlocal(1).invoke("write", frame.getlocal(3));
            }
            return Py.None;
        }
        
        private static PyObject encodestring$3(PyFrame frame) {
            /* Encode a string. */
            frame.setlocal(2, org.python.core.imp.importOne("StringIO", frame));
            frame.setlocal(3, frame.getlocal(2).__getattr__("StringIO").__call__(frame.getlocal(0)));
            frame.setlocal(1, frame.getlocal(2).__getattr__("StringIO").__call__());
            frame.getglobal("encode").__call__(frame.getlocal(3), frame.getlocal(1));
            return frame.getlocal(1).invoke("getvalue");
        }
        
        private static PyObject decodestring$4(PyFrame frame) {
            /* Decode a string. */
            frame.setlocal(2, org.python.core.imp.importOne("StringIO", frame));
            frame.setlocal(3, frame.getlocal(2).__getattr__("StringIO").__call__(frame.getlocal(0)));
            frame.setlocal(1, frame.getlocal(2).__getattr__("StringIO").__call__());
            frame.getglobal("decode").__call__(frame.getlocal(3), frame.getlocal(1));
            return frame.getlocal(1).invoke("getvalue");
        }
        
        private static PyObject test$5(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* Small test program */
            frame.setlocal(7, org.python.core.imp.importOne("sys", frame));
            frame.setlocal(5, org.python.core.imp.importOne("getopt", frame));
            try {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(5).__getattr__("getopt").__call__(frame.getlocal(7).__getattr__("argv").__getslice__(i$9, null, null), s$14), 2);
                frame.setlocal(0, t$0$PyObject__[0]);
                frame.setlocal(4, t$0$PyObject__[1]);
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getlocal(5).__getattr__("error"))) {
                    frame.setlocal(2, t$0$PyException.value);
                    frame.getlocal(7).__setattr__("stdout", frame.getlocal(7).__getattr__("stderr"));
                    Py.println(frame.getlocal(2));
                    Py.println(s$15._mod(frame.getlocal(7).__getattr__("argv").__getitem__(i$16)));
                    frame.getlocal(7).__getattr__("exit").__call__(i$17);
                }
                else throw t$0$PyException;
            }
            frame.setlocal(3, frame.getglobal("encode"));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                t$0$PyObject__ = org.python.core.Py.unpackSequence(t$0$PyObject, 2);
                frame.setlocal(1, t$0$PyObject__[0]);
                frame.setlocal(6, t$0$PyObject__[1]);
                if (frame.getlocal(1)._eq(s$18).__nonzero__()) {
                    frame.setlocal(3, frame.getglobal("encode"));
                }
                if (frame.getlocal(1)._eq(s$19).__nonzero__()) {
                    frame.setlocal(3, frame.getglobal("decode"));
                }
                if (frame.getlocal(1)._eq(s$20).__nonzero__()) {
                    frame.setlocal(3, frame.getglobal("decode"));
                }
                if (frame.getlocal(1)._eq(s$21).__nonzero__()) {
                    frame.getglobal("test1").__call__();
                    return Py.None;
                }
            }
            if (((t$2$PyObject = frame.getlocal(4)).__nonzero__() ? frame.getlocal(4).__getitem__(i$16)._ne(s$22) : t$2$PyObject).__nonzero__()) {
                frame.getlocal(3).__call__(frame.getglobal("open").__call__(frame.getlocal(4).__getitem__(i$16), s$23), frame.getlocal(7).__getattr__("stdout"));
            }
            else {
                frame.getlocal(3).__call__(frame.getlocal(7).__getattr__("stdin"), frame.getlocal(7).__getattr__("stdout"));
            }
            return Py.None;
        }
        
        private static PyObject test1$6(PyFrame frame) {
            frame.setlocal(2, s$24);
            frame.setlocal(1, frame.getglobal("encodestring").__call__(frame.getlocal(2)));
            frame.setlocal(0, frame.getglobal("decodestring").__call__(frame.getlocal(1)));
            Py.printComma(frame.getlocal(2));
            Py.printComma(frame.getlocal(1).__repr__());
            Py.println(frame.getlocal(0));
            return Py.None;
        }
        
        private static PyObject main$7(PyFrame frame) {
            frame.setglobal("__file__", s$26);
            
            /* Conversions to/from base64 transport encoding as per RFC-1521. */
            frame.setlocal("binascii", org.python.core.imp.importOne("binascii", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4}));
            frame.setlocal("MAXLINESIZE", i$5);
            frame.setlocal("MAXBINSIZE", frame.getname("MAXLINESIZE")._div(i$6)._mul(i$7));
            frame.setlocal("encode", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_encode));
            frame.setlocal("decode", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_decode));
            frame.setlocal("encodestring", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_encodestring));
            frame.setlocal("decodestring", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_decodestring));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_test));
            frame.setlocal("test1", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_test1));
            if (frame.getname("__name__")._eq(s$25).__nonzero__()) {
                frame.getname("test").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("base64"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "base64";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(base64._PyInner.class, newargs, base64.jpy$packages, base64.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
