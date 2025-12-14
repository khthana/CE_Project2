import org.python.core.*;

public class macurl2path extends java.lang.Object {
    static String[] jpy$mainProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions"};
    static String[] jpy$proxyProperties = new String[] {"python.modules.builtin", "exceptions:org.python.core.exceptions", "python.options.showJavaExceptions", "true"};
    static String[] jpy$packages = new String[] {"javax.swing.tree", null, "java.awt.color", null, "javax.swing.filechooser", null, "javax.swing.undo", null, "java.io", "Serializable,FileDescriptor,LineNumberReader,FilterReader,BufferedReader,FilterOutputStream,OutputStream,WriteAbortedException,FileInputStream,ObjectStreamField,StringReader,SyncFailedException,DataInput,ObjectOutput,BufferedInputStream,StreamCorruptedException,ObjectStreamException,OutputStreamWriter,DataInputStream,BufferedWriter,DataOutputStream,ObjectInput,IOException,PushbackReader,FileOutputStream,ObjectOutputStream,ObjectInputValidation,UTFDataFormatException,CharConversionException,NotSerializableException,Writer,InvalidClassException,ByteArrayInputStream,OptionalDataException,BufferedOutputStream,PrintStream,ObjectStreamConstants,PipedReader,File,InterruptedIOException,LineNumberInputStream,PipedWriter,FileWriter,FileNotFoundException,FilterWriter,InvalidObjectException,NotActiveException,FilePermission,CharArrayWriter,InputStream,UnsupportedEncodingException,ObjectStreamClass,PipedOutputStream,FileFilter,EOFException,FilterInputStream,StreamTokenizer,Externalizable,FilenameFilter,FileReader,StringWriter,ObjectInputStream,DataOutput,SerializablePermission,Reader,PipedInputStream,RandomAccessFile,StringBufferInputStream,ByteArrayOutputStream,CharArrayReader,PushbackInputStream,PrintWriter,SequenceInputStream,InputStreamReader", "java.applet", null, "java.awt.peer", null, "java.awt.dnd", null, "javax.swing.text", "Caret,JTextComponent,ViewFactory,Element,DocumentFilter,Document,PlainView,Style,NumberFormatter,SimpleAttributeSet,TabStop,LabelView,DefaultEditorKit,MutableAttributeSet,DefaultTextUI,DefaultCaret,MaskFormatter,FlowView,StyleContext,ChangedCharSetException,BadLocationException,Keymap,TableView,FieldView,View,StyleConstants,NavigationFilter,AbstractWriter,AsyncBoxView,Segment,PlainDocument,TabExpander,PasswordView,StyledEditorKit,LayeredHighlighter,DateFormatter,CompositeView,StringContent,DefaultFormatter,InternationalFormatter,GlyphView,WrappedPlainView,IconView,StyledDocument,GapContent,AbstractDocument,TabSet,AttributeSet,TextAction,Position,DefaultStyledDocument,EditorKit,ParagraphView,DefaultFormatterFactory,Utilities,ComponentView,LayoutQueue,TabableView,Highlighter,ElementIterator,ZoneView,BoxView,DefaultHighlighter", "java.awt.geom", null, "javax.swing.table", null, "java.awt.print", null, "javax.swing.plaf", null, "javax.swing.colorchooser", null, "javax.swing.border", null, "java.lang.reflect", null, "java.awt.datatransfer", null, "javax.sound.midi", null, "java.awt.event", "HierarchyBoundsAdapter,AdjustmentListener,WindowListener,AWTEventListenerProxy,WindowFocusListener,ContainerEvent,AWTEventListener,ItemListener,ComponentEvent,PaintEvent,TextListener,WindowAdapter,ComponentAdapter,ContainerAdapter,FocusEvent,WindowStateListener,InputMethodEvent,HierarchyListener,MouseAdapter,ComponentListener,InputEvent,InvocationEvent,ItemEvent,FocusListener,FocusAdapter,KeyEvent,ContainerListener,MouseListener,KeyListener,ActionEvent,InputMethodListener,MouseWheelEvent,KeyAdapter,MouseMotionAdapter,HierarchyBoundsListener,TextEvent,WindowEvent,ActionListener,AdjustmentEvent,HierarchyEvent,MouseMotionListener,MouseWheelListener,MouseEvent", "java.awt", "FlowLayout,PopupMenu,CompositeContext,TextField,LayoutManager,Graphics,Point,Stroke,KeyEventDispatcher,Adjustable,Label,GradientPaint,MenuContainer,FontMetrics,AWTEvent,GraphicsConfigTemplate,FileDialog,Color,GraphicsConfiguration,GraphicsEnvironment,Image,AWTException,Robot,TextComponent,CheckboxMenuItem,DefaultFocusTraversalPolicy,Rectangle,BufferCapabilities,Menu,CardLayout,GridLayout,Polygon,RenderingHints,DisplayMode,Container,Font,ItemSelectable,Insets,PrintGraphics,ActiveEvent,Transparency,KeyboardFocusManager,Composite,PaintContext,Graphics2D,Canvas,ScrollPaneAdjustable,PageAttributes,TexturePaint,Toolkit,TextArea,AWTPermission,MenuBar,Choice,BorderLayout,GraphicsDevice,MediaTracker,HeadlessException,LayoutManager2,AWTEventMulticaster,Frame,ContainerOrderFocusTraversalPolicy,AWTKeyStroke,AlphaComposite,DefaultKeyboardFocusManager,Shape,Checkbox,List,SystemColor,BasicStroke,KeyEventPostProcessor,Dimension,FontFormatException,MenuComponent,GridBagLayout,JobAttributes,EventQueue,Component,GridBagConstraints,CheckboxGroup,ScrollPane,Window,Event,IllegalComponentStateException,Paint,Cursor,Scrollbar,PrintJob,ImageCapabilities,Dialog,AWTError,MenuShortcut,FocusTraversalPolicy,Button,MenuItem,Panel,ComponentOrientation", "java.awt.image", null, "javax.swing", "JFileChooser,SingleSelectionModel,UIManager,JApplet,LookAndFeel,ProgressMonitorInputStream,RootPaneContainer,JSeparator,WindowConstants,AbstractSpinnerModel,Timer,UIDefaults,DefaultSingleSelectionModel,Box,ComboBoxModel,ScrollPaneConstants,JTextArea,FocusManager,AbstractButton,JPopupMenu,ToolTipManager,JMenu,JProgressBar,Icon,JScrollBar,JCheckBoxMenuItem,JFrame,SortingFocusTraversalPolicy,JRadioButtonMenuItem,ImageIcon,SpinnerListModel,SpinnerModel,InternalFrameFocusTraversalPolicy,AbstractAction,SwingUtilities,JMenuItem,SizeSequence,ListSelectionModel,CellRendererPane,ActionMap,JCheckBox,JViewport,JMenuBar,UnsupportedLookAndFeelException,DebugGraphics,TransferHandler,DefaultDesktopManager,BorderFactory,KeyStroke,DefaultListCellRenderer,JPanel,Action,JLabel,MenuSelectionManager,JRootPane,DefaultButtonModel,ListCellRenderer,JColorChooser,BoxLayout,InputVerifier,ButtonModel,JToggleButton,JButton,JToolBar,MenuElement,DefaultBoundedRangeModel,ListModel,Spring,CellEditor,DefaultListModel,JRadioButton,ComboBoxEditor,ComponentInputMap,JDesktopPane,JEditorPane,JInternalFrame,AbstractCellEditor,JSpinner,JSplitPane,ViewportLayout,DefaultFocusManager,Scrollable,JTree,JToolTip,JScrollPane,JFormattedTextField,Popup,JList,GrayFilter,DefaultComboBoxModel,OverlayLayout,PopupFactory,BoundedRangeModel,LayoutFocusTraversalPolicy,JSlider,AbstractListModel,JTextPane,SpringLayout,SpinnerNumberModel,InputMap,RepaintManager,JTabbedPane,JPasswordField,DefaultListSelectionModel,MutableComboBoxModel,JWindow,SpinnerDateModel,SwingConstants,DesktopManager,JDialog,JComponent,JOptionPane,SizeRequirements,JComboBox,DefaultCellEditor,Renderer,JLayeredPane,JTable,JTextField,ProgressMonitor,ButtonGroup,ScrollPaneLayout,__jpythonc_name__,test,__file__", "org.python.core", null, "java.lang", "NumberFormatException,StackTraceElement,ArrayStoreException,UnsupportedOperationException,UnsatisfiedLinkError,StackOverflowError,Exception,RuntimePermission,NegativeArraySizeException,NullPointerException,ExceptionInInitializerError,NoSuchMethodError,VirtualMachineError,StringBuffer,CloneNotSupportedException,InstantiationError,ClassCircularityError,Byte,ArrayIndexOutOfBoundsException,ThreadLocal,IllegalArgumentException,VerifyError,NoSuchMethodException,Long,Error,ClassNotFoundException,RuntimeException,Thread,ThreadGroup,SecurityManager,Compiler,SecurityException,Short,Double,IncompatibleClassChangeError,IllegalAccessError,Character,IllegalMonitorStateException,Float,ClassCastException,Package,UnsupportedClassVersionError,InterruptedException,NoClassDefFoundError,NoSuchFieldException,UnknownError,Runtime,IndexOutOfBoundsException,Number,StringIndexOutOfBoundsException,IllegalAccessException,InternalError,StrictMath,ArithmeticException,String,Process,IllegalThreadStateException,Comparable,ThreadDeath,Void,OutOfMemoryError,LinkageError,Throwable,InstantiationException,ClassLoader,AbstractMethodError,Cloneable,Math,Integer,Object,System,AssertionError,Class,NoSuchFieldError,ClassFormatError,InheritableThreadLocal,Boolean,Runnable,IllegalStateException,CharSequence", "java.util", null, "javax.swing.text.html.parser", null, "com.sun.java.swing", null, "java.lang.ref", null, "java.awt.im", null, "java.net", "URLStreamHandler,Inet6Address,SocketOptions,PasswordAuthentication,InetSocketAddress,UnknownServiceException,URISyntaxException,SocketTimeoutException,URLDecoder,SocketImpl,FileNameMap,UnknownHostException,URLClassLoader,HttpURLConnection,NoRouteToHostException,ProtocolException,SocketImplFactory,PortUnreachableException,URI,URLStreamHandlerFactory,DatagramPacket,BindException,InetAddress,MalformedURLException,Authenticator,URL,Socket,NetPermission,JarURLConnection,URLEncoder,ContentHandlerFactory,ServerSocket,Inet4Address,NetworkInterface,URLConnection,ContentHandler,SocketPermission,DatagramSocketImplFactory,SocketAddress,DatagramSocketImpl,MulticastSocket,DatagramSocket,ConnectException,SocketException", "javax.swing.event", "PopupMenuEvent,UndoableEditEvent,EventListenerList,MouseInputAdapter,MenuEvent,SwingPropertyChangeSupport,TreeSelectionEvent,TableModelEvent,ListDataListener,TreeExpansionEvent,ListSelectionListener,CellEditorListener,TreeSelectionListener,MenuDragMouseEvent,TreeWillExpandListener,MenuDragMouseListener,AncestorEvent,CaretEvent,InternalFrameAdapter,TreeModelEvent,ListDataEvent,MenuKeyEvent,CaretListener,InternalFrameEvent,ListSelectionEvent,UndoableEditListener,MenuKeyListener,ChangeEvent,TableColumnModelEvent,TableModelListener,AncestorListener,TableColumnModelListener,DocumentListener,TreeModelListener,HyperlinkEvent,MouseInputListener,PopupMenuListener,ChangeListener,MenuListener,DocumentEvent,TreeExpansionListener,InternalFrameListener,HyperlinkListener", "java.awt.font", null, "javax.swing.text.html", "HTMLDocument,StyleSheet,ParagraphView,HTMLWriter,FormView,CSS,HTML,InlineView,ListView,Option,MinimalHTMLWriter,ObjectView,HTMLFrameHyperlinkEvent,HTMLEditorKit,BlockView,ImageView", "javax.swing.text.rtf", null};
    
    public static class _PyInner extends PyFunctionTable implements PyRunnable {
        private static PyObject s$0;
        private static PyObject s$1;
        private static PyObject s$2;
        private static PyObject s$3;
        private static PyObject i$4;
        private static PyObject s$5;
        private static PyObject s$6;
        private static PyObject i$7;
        private static PyObject s$8;
        private static PyObject i$9;
        private static PyObject s$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject i$14;
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
        private static PyFunctionTable funcTable;
        private static PyCode c$0_url2pathname;
        private static PyCode c$1_pathname2url;
        private static PyCode c$2__pncomp2url;
        private static PyCode c$3_test;
        private static PyCode c$4_main;
        private static void initConstants() {
            s$0 = Py.newString("Macintosh-specific module for conversion between pathnames and URLs.\012\012Do not import directly; use urllib instead.");
            s$1 = Py.newString("url2pathname");
            s$2 = Py.newString("pathname2url");
            s$3 = Py.newString("Convert /-delimited pathname to mac pathname");
            i$4 = Py.newInteger(0);
            s$5 = Py.newString("file");
            s$6 = Py.newString("Cannot convert non-local URL to pathname");
            i$7 = Py.newInteger(3);
            s$8 = Py.newString("///");
            i$9 = Py.newInteger(2);
            s$10 = Py.newString("//");
            s$11 = Py.newString("/");
            s$12 = Py.newString(".");
            s$13 = Py.newString("..");
            i$14 = Py.newInteger(1);
            s$15 = Py.newString("");
            s$16 = Py.newString(":");
            s$17 = Py.newString("convert mac pathname to /-delimited pathname");
            s$18 = Py.newString("Cannot convert pathname containing slashes");
            i$19 = Py.newInteger(31);
            s$20 = Py.newString("index.html");
            s$21 = Py.newString("bar/index.html");
            s$22 = Py.newString("/foo/bar/index.html");
            s$23 = Py.newString("/foo/bar/");
            s$24 = Py.newString("->");
            s$25 = Py.newString("drive:");
            s$26 = Py.newString("drive:dir:");
            s$27 = Py.newString("drive:dir:file");
            s$28 = Py.newString("drive:file");
            s$29 = Py.newString(":file");
            s$30 = Py.newString(":dir:");
            s$31 = Py.newString(":dir:file");
            s$32 = Py.newString("__main__");
            s$33 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\macurl2path.py");
            funcTable = new _PyInner();
            c$0_url2pathname = Py.newCode(1, new String[] {"pathname", "i", "components", "tp", "rv"}, "C:\\jdk1.4\\jython2.1\\Lib\\macurl2path.py", "url2pathname", false, false, funcTable, 0, null, null, 0, 1);
            c$1_pathname2url = Py.newCode(1, new String[] {"pathname", "i", "components"}, "C:\\jdk1.4\\jython2.1\\Lib\\macurl2path.py", "pathname2url", false, false, funcTable, 1, null, null, 0, 1);
            c$2__pncomp2url = Py.newCode(1, new String[] {"component"}, "C:\\jdk1.4\\jython2.1\\Lib\\macurl2path.py", "_pncomp2url", false, false, funcTable, 2, null, null, 0, 1);
            c$3_test = Py.newCode(0, new String[] {"url", "path"}, "C:\\jdk1.4\\jython2.1\\Lib\\macurl2path.py", "test", false, false, funcTable, 3, null, null, 0, 1);
            c$4_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\macurl2path.py", "main", false, false, funcTable, 4, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$4_main == null) _PyInner.initConstants();
            return c$4_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.url2pathname$1(frame);
                case 1:
                return _PyInner.pathname2url$2(frame);
                case 2:
                return _PyInner._pncomp2url$3(frame);
                case 3:
                return _PyInner.test$4(frame);
                case 4:
                return _PyInner.main$5(frame);
                default:
                return null;
            }
        }
        
        private static PyObject url2pathname$1(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Convert /-delimited pathname to mac pathname */
            frame.setlocal(3, frame.getglobal("urllib").__getattr__("splittype").__call__(frame.getlocal(0)).__getitem__(i$4));
            if (((t$0$PyObject = frame.getlocal(3)).__nonzero__() ? frame.getlocal(3)._ne(s$5) : t$0$PyObject).__nonzero__()) {
                throw Py.makeException(frame.getglobal("RuntimeError"), s$6);
            }
            if (frame.getlocal(0).__getslice__(null, i$7, null)._eq(s$8).__nonzero__()) {
                frame.setlocal(0, frame.getlocal(0).__getslice__(i$9, null, null));
            }
            else if (frame.getlocal(0).__getslice__(null, i$9, null)._eq(s$10).__nonzero__()) {
                throw Py.makeException(frame.getglobal("RuntimeError"), s$6);
            }
            frame.setlocal(2, frame.getlocal(0).invoke("split", s$11));
            frame.setlocal(1, i$4);
            while (frame.getlocal(1)._lt(frame.getglobal("len").__call__(frame.getlocal(2))).__nonzero__()) {
                if (frame.getlocal(2).__getitem__(frame.getlocal(1))._eq(s$12).__nonzero__()) {
                    frame.getlocal(2).__delitem__(frame.getlocal(1));
                }
                else if (((t$0$PyObject = ((t$1$PyObject = frame.getlocal(2).__getitem__(frame.getlocal(1))._eq(s$13)).__nonzero__() ? frame.getlocal(1)._gt(i$4) : t$1$PyObject)).__nonzero__() ? frame.getlocal(2).__getitem__(frame.getlocal(1)._sub(i$14))._notin(new PyTuple(new PyObject[] {s$15, s$13})) : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(2).__delslice__(frame.getlocal(1)._sub(i$14), frame.getlocal(1)._add(i$14), null);
                    frame.setlocal(1, frame.getlocal(1)._sub(i$14));
                }
                else if (((t$0$PyObject = ((t$1$PyObject = frame.getlocal(2).__getitem__(frame.getlocal(1))._eq(s$15)).__nonzero__() ? frame.getlocal(1)._gt(i$4) : t$1$PyObject)).__nonzero__() ? frame.getlocal(2).__getitem__(frame.getlocal(1)._sub(i$14))._ne(s$15) : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(2).__delitem__(frame.getlocal(1));
                }
                else {
                    frame.setlocal(1, frame.getlocal(1)._add(i$14));
                }
            }
            if (frame.getlocal(2).__getitem__(i$4).__not__().__nonzero__()) {
                frame.setlocal(4, s$16.invoke("join", frame.getlocal(2).__getslice__(i$14, null, null)));
            }
            else {
                frame.setlocal(1, i$4);
                while (((t$0$PyObject = frame.getlocal(1)._lt(frame.getglobal("len").__call__(frame.getlocal(2)))).__nonzero__() ? frame.getlocal(2).__getitem__(frame.getlocal(1))._eq(s$13) : t$0$PyObject).__nonzero__()) {
                    frame.getlocal(2).__setitem__(frame.getlocal(1), s$15);
                    frame.setlocal(1, frame.getlocal(1)._add(i$14));
                }
                frame.setlocal(4, s$16._add(s$16.invoke("join", frame.getlocal(2))));
            }
            return frame.getglobal("urllib").__getattr__("unquote").__call__(frame.getlocal(4));
        }
        
        private static PyObject pathname2url$2(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* convert mac pathname to /-delimited pathname */
            if (s$11._in(frame.getlocal(0)).__nonzero__()) {
                throw Py.makeException(frame.getglobal("RuntimeError"), s$18);
            }
            frame.setlocal(2, frame.getlocal(0).invoke("split", s$16));
            if (frame.getlocal(2).__getitem__(i$4)._eq(s$15).__nonzero__()) {
                frame.getlocal(2).__delitem__(i$4);
            }
            if (frame.getlocal(2).__getitem__(i$14.__neg__())._eq(s$15).__nonzero__()) {
                frame.getlocal(2).__delitem__(i$14.__neg__());
            }
            t$0$int = 0;
            t$1$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(2)));
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(1, t$0$PyObject);
                if (frame.getlocal(2).__getitem__(frame.getlocal(1))._eq(s$15).__nonzero__()) {
                    frame.getlocal(2).__setitem__(frame.getlocal(1), s$13);
                }
            }
            frame.setlocal(2, frame.getglobal("map").__call__(frame.getglobal("_pncomp2url"), frame.getlocal(2)));
            if (frame.getglobal("os").__getattr__("path").__getattr__("isabs").__call__(frame.getlocal(0)).__nonzero__()) {
                return s$11._add(s$11.invoke("join", frame.getlocal(2)));
            }
            else {
                return s$11.invoke("join", frame.getlocal(2));
            }
        }
        
        private static PyObject _pncomp2url$3(PyFrame frame) {
            frame.setlocal(0, frame.getglobal("urllib").__getattr__("quote").__call__(new PyObject[] {frame.getlocal(0).__getslice__(null, i$19, null), s$15}, new String[] {"safe"}));
            return frame.getlocal(0);
        }
        
        private static PyObject test$4(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            t$0$int = 0;
            t$1$PyObject = new PyList(new PyObject[] {s$20, s$21, s$22, s$23, s$11});
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(0, t$0$PyObject);
                Py.printComma(frame.getlocal(0).__repr__());
                Py.printComma(s$24);
                Py.println(frame.getglobal("url2pathname").__call__(frame.getlocal(0)).__repr__());
            }
            t$1$int = 0;
            t$3$PyObject = new PyList(new PyObject[] {s$25, s$26, s$27, s$28, s$5, s$29, s$30, s$31});
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                frame.setlocal(1, t$2$PyObject);
                Py.printComma(frame.getlocal(1).__repr__());
                Py.printComma(s$24);
                Py.println(frame.getglobal("pathname2url").__call__(frame.getlocal(1)).__repr__());
            }
            return Py.None;
        }
        
        private static PyObject main$5(PyFrame frame) {
            frame.setglobal("__file__", s$33);
            
            /* Macintosh-specific module for conversion between pathnames and URLs.
            
            Do not import directly; use urllib instead. */
            frame.setlocal("urllib", org.python.core.imp.importOne("urllib", frame));
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2}));
            frame.setlocal("url2pathname", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_url2pathname));
            frame.setlocal("pathname2url", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_pathname2url));
            frame.setlocal("_pncomp2url", new PyFunction(frame.f_globals, new PyObject[] {}, c$2__pncomp2url));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_test));
            if (frame.getname("__name__")._eq(s$32).__nonzero__()) {
                frame.getname("test").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("macurl2path"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "macurl2path";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(macurl2path._PyInner.class, newargs, macurl2path.jpy$packages, macurl2path.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
