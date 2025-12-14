import org.python.core.*;

public class gopherlib extends java.lang.Object {
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
        private static PyObject s$24;
        private static PyObject s$25;
        private static PyObject s$26;
        private static PyObject s$27;
        private static PyObject s$28;
        private static PyObject s$29;
        private static PyObject s$30;
        private static PyObject i$31;
        private static PyObject s$32;
        private static PyObject s$33;
        private static PyObject s$34;
        private static PyObject s$35;
        private static PyObject s$36;
        private static PyObject i$37;
        private static PyObject i$38;
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
        private static PyObject i$50;
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
        private static PyObject i$62;
        private static PyObject i$63;
        private static PyObject s$64;
        private static PyObject s$65;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_type_to_name;
        private static PyCode c$1_send_selector;
        private static PyCode c$2_send_query;
        private static PyCode c$3_path_to_selector;
        private static PyCode c$4_path_to_datatype_name;
        private static PyCode c$5_get_directory;
        private static PyCode c$6_get_textfile;
        private static PyCode c$7_get_alt_textfile;
        private static PyCode c$8_get_binary;
        private static PyCode c$9_get_alt_binary;
        private static PyCode c$10_test;
        private static PyCode c$11_main;
        private static void initConstants() {
            s$0 = Py.newString("Gopher protocol client interface.");
            s$1 = Py.newString("send_selector");
            s$2 = Py.newString("send_query");
            s$3 = Py.newString("1/");
            s$4 = Py.newString("gopher.micro.umn.edu");
            i$5 = Py.newInteger(70);
            s$6 = Py.newString("0");
            s$7 = Py.newString("1");
            s$8 = Py.newString("2");
            s$9 = Py.newString("3");
            s$10 = Py.newString("4");
            s$11 = Py.newString("5");
            s$12 = Py.newString("6");
            s$13 = Py.newString("7");
            s$14 = Py.newString("8");
            s$15 = Py.newString("9");
            s$16 = Py.newString("+");
            s$17 = Py.newString("s");
            s$18 = Py.newString("e");
            s$19 = Py.newString("c");
            s$20 = Py.newString("h");
            s$21 = Py.newString("T");
            s$22 = Py.newString("M");
            s$23 = Py.newString("I");
            s$24 = Py.newString("w");
            s$25 = Py.newString("q");
            s$26 = Py.newString("g");
            s$27 = Py.newString(":");
            s$28 = Py.newString(";");
            s$29 = Py.newString("<");
            s$30 = Py.newString("Map all file types to strings; unknown types become TYPE='x'.");
            i$31 = Py.newInteger(2);
            s$32 = Py.newString("A_");
            s$33 = Py.newString("TYPE=");
            s$34 = Py.newString("\015\012");
            s$35 = Py.newString("\011");
            s$36 = Py.newString("Send a selector to a given host and port, return a file with the reply.");
            i$37 = Py.newInteger(0);
            i$38 = Py.newInteger(1);
            s$39 = Py.newString("");
            s$40 = Py.newString("rb");
            s$41 = Py.newString("Send a selector and a query string.");
            s$42 = Py.newString("Takes a path as returned by urlparse and returns the appropriate selector.");
            s$43 = Py.newString("/");
            s$44 = Py.newString("Takes a path as returned by urlparse and maps it to a string.\012    See section 3.4 of RFC 1738 for details.");
            s$45 = Py.newString("TYPE='unknown'");
            s$46 = Py.newString("Get a directory in the form of a list of entries.");
            s$47 = Py.newString("(Unexpected EOF from server)");
            s$48 = Py.newString(".");
            s$49 = Py.newString("(Empty line from server)");
            i$50 = Py.newInteger(4);
            s$51 = Py.newString("(Bad line from server:");
            s$52 = Py.newString(")");
            s$53 = Py.newString("(Extra info from server:");
            s$54 = Py.newString("Get a text file as a list of lines, with trailing CRLF stripped.");
            s$55 = Py.newString("Get a text file and pass each line to a function, with trailing CRLF stripped.");
            s$56 = Py.newString("..");
            s$57 = Py.newString("Get a binary file as one solid data block.");
            s$58 = Py.newString("Get a binary file and pass each block to a function.");
            s$59 = Py.newString("Trivial test program.");
            s$60 = Py.newString("binary data:");
            s$61 = Py.newString("bytes:");
            i$62 = Py.newInteger(40);
            i$63 = Py.newInteger(100);
            s$64 = Py.newString("__main__");
            s$65 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py");
            funcTable = new _PyInner();
            c$0_type_to_name = Py.newCode(1, new String[] {"gtype", "name"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "type_to_name", false, false, funcTable, 0, null, null, 0, 1);
            c$1_send_selector = Py.newCode(3, new String[] {"selector", "host", "port", "i", "socket", "s"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "send_selector", false, false, funcTable, 1, null, null, 0, 1);
            c$2_send_query = Py.newCode(4, new String[] {"selector", "query", "host", "port"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "send_query", false, false, funcTable, 2, null, null, 0, 1);
            c$3_path_to_selector = Py.newCode(1, new String[] {"path"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "path_to_selector", false, false, funcTable, 3, null, null, 0, 1);
            c$4_path_to_datatype_name = Py.newCode(1, new String[] {"path"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "path_to_datatype_name", false, false, funcTable, 4, null, null, 0, 1);
            c$5_get_directory = Py.newCode(1, new String[] {"f", "line", "gtype", "list", "parts"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "get_directory", false, false, funcTable, 5, null, null, 0, 1);
            c$6_get_textfile = Py.newCode(1, new String[] {"f", "list"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "get_textfile", false, false, funcTable, 6, null, null, 0, 1);
            c$7_get_alt_textfile = Py.newCode(2, new String[] {"f", "func", "line"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "get_alt_textfile", false, false, funcTable, 7, null, null, 0, 1);
            c$8_get_binary = Py.newCode(1, new String[] {"f", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "get_binary", false, false, funcTable, 8, null, null, 0, 1);
            c$9_get_alt_binary = Py.newCode(3, new String[] {"f", "func", "blocksize", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "get_alt_binary", false, false, funcTable, 9, null, null, 0, 1);
            c$10_test = Py.newCode(0, new String[] {"args", "type", "getopt", "query", "sys", "port", "opts", "host", "selector", "f", "list", "item", "data"}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "test", false, false, funcTable, 10, null, null, 0, 1);
            c$11_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\gopherlib.py", "main", false, false, funcTable, 11, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$11_main == null) _PyInner.initConstants();
            return c$11_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.type_to_name$1(frame);
                case 1:
                return _PyInner.send_selector$2(frame);
                case 2:
                return _PyInner.send_query$3(frame);
                case 3:
                return _PyInner.path_to_selector$4(frame);
                case 4:
                return _PyInner.path_to_datatype_name$5(frame);
                case 5:
                return _PyInner.get_directory$6(frame);
                case 6:
                return _PyInner.get_textfile$7(frame);
                case 7:
                return _PyInner.get_alt_textfile$8(frame);
                case 8:
                return _PyInner.get_binary$9(frame);
                case 9:
                return _PyInner.get_alt_binary$10(frame);
                case 10:
                return _PyInner.test$11(frame);
                case 11:
                return _PyInner.main$12(frame);
                default:
                return null;
            }
        }
        
        private static PyObject type_to_name$1(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Map all file types to strings; unknown types become TYPE='x'. */
            // global _type_to_name_map
            if (frame.getglobal("_type_to_name_map")._eq(new PyDictionary(new PyObject[] {})).__nonzero__()) {
                t$0$int = 0;
                t$1$PyObject = frame.getglobal("_names");
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(1, t$0$PyObject);
                    if (frame.getlocal(1).__getslice__(null, i$31, null)._eq(s$32).__nonzero__()) {
                        frame.getglobal("_type_to_name_map").__setitem__(frame.getglobal("eval").__call__(frame.getlocal(1)), frame.getlocal(1).__getslice__(i$31, null, null));
                    }
                }
            }
            if (frame.getglobal("_type_to_name_map").invoke("has_key", frame.getlocal(0)).__nonzero__()) {
                return frame.getglobal("_type_to_name_map").__getitem__(frame.getlocal(0));
            }
            return s$33._add(frame.getlocal(0).__repr__());
        }
        
        private static PyObject send_selector$2(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            
            // Code
            /* Send a selector to a given host and port, return a file with the reply. */
            frame.setlocal(4, org.python.core.imp.importOne("socket", frame));
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(3, frame.getlocal(1).invoke("find", s$27));
                if (frame.getlocal(3)._ge(i$37).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1).__getslice__(null, frame.getlocal(3), null), frame.getglobal("int").__call__(frame.getlocal(1).__getslice__(frame.getlocal(3)._add(i$38), null, null))}), 2);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(2, t$0$PyObject__[1]);
                }
            }
            if (frame.getlocal(2).__not__().__nonzero__()) {
                frame.setlocal(2, frame.getglobal("DEF_PORT"));
            }
            else if (frame.getglobal("type").__call__(frame.getlocal(2))._eq(frame.getglobal("type").__call__(s$39)).__nonzero__()) {
                frame.setlocal(2, frame.getglobal("int").__call__(frame.getlocal(2)));
            }
            frame.setlocal(5, frame.getlocal(4).__getattr__("socket").__call__(frame.getlocal(4).__getattr__("AF_INET"), frame.getlocal(4).__getattr__("SOCK_STREAM")));
            frame.getlocal(5).invoke("connect", new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)}));
            frame.getlocal(5).invoke("send", frame.getlocal(0)._add(frame.getglobal("CRLF")));
            frame.getlocal(5).invoke("shutdown", i$38);
            return frame.getlocal(5).invoke("makefile", s$40);
        }
        
        private static PyObject send_query$3(PyFrame frame) {
            /* Send a selector and a query string. */
            return frame.getglobal("send_selector").__call__(frame.getlocal(0)._add(s$35)._add(frame.getlocal(1)), frame.getlocal(2), frame.getlocal(3));
        }
        
        private static PyObject path_to_selector$4(PyFrame frame) {
            /* Takes a path as returned by urlparse and returns the appropriate selector. */
            if (frame.getlocal(0)._eq(s$43).__nonzero__()) {
                return s$43;
            }
            else {
                return frame.getlocal(0).__getslice__(i$31, null, null);
            }
        }
        
        private static PyObject path_to_datatype_name$5(PyFrame frame) {
            /* Takes a path as returned by urlparse and maps it to a string.
                See section 3.4 of RFC 1738 for details. */
            if (frame.getlocal(0)._eq(s$43).__nonzero__()) {
                return s$45;
            }
            else {
                return frame.getglobal("type_to_name").__call__(frame.getlocal(0).__getitem__(i$38));
            }
        }
        
        private static PyObject get_directory$6(PyFrame frame) {
            /* Get a directory in the form of a list of entries. */
            frame.setlocal(3, new PyList(new PyObject[] {}));
            while (i$38.__nonzero__()) {
                frame.setlocal(1, frame.getlocal(0).invoke("readline"));
                if (frame.getlocal(1).__not__().__nonzero__()) {
                    Py.println(s$47);
                    break;
                }
                if (frame.getlocal(1).__getslice__(i$31.__neg__(), null, null)._eq(frame.getglobal("CRLF")).__nonzero__()) {
                    frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$31.__neg__(), null));
                }
                else if (frame.getlocal(1).__getslice__(i$38.__neg__(), null, null)._in(frame.getglobal("CRLF")).__nonzero__()) {
                    frame.setlocal(1, frame.getlocal(1).__getslice__(null, i$38.__neg__(), null));
                }
                if (frame.getlocal(1)._eq(s$48).__nonzero__()) {
                    break;
                }
                if (frame.getlocal(1).__not__().__nonzero__()) {
                    Py.println(s$49);
                    continue;
                }
                frame.setlocal(2, frame.getlocal(1).__getitem__(i$37));
                frame.setlocal(4, frame.getlocal(1).__getslice__(i$38, null, null).invoke("split", frame.getglobal("TAB")));
                if (frame.getglobal("len").__call__(frame.getlocal(4))._lt(i$50).__nonzero__()) {
                    Py.printComma(s$51);
                    Py.printComma(frame.getlocal(1).__repr__());
                    Py.println(s$52);
                    continue;
                }
                if (frame.getglobal("len").__call__(frame.getlocal(4))._gt(i$50).__nonzero__()) {
                    if (frame.getlocal(4).__getslice__(i$50, null, null)._ne(new PyList(new PyObject[] {s$16})).__nonzero__()) {
                        Py.printComma(s$53);
                        Py.printComma(frame.getlocal(4).__getslice__(i$50, null, null));
                        Py.println(s$52);
                    }
                }
                else {
                    frame.getlocal(4).invoke("append", s$39);
                }
                frame.getlocal(4).invoke("insert", i$37, frame.getlocal(2));
                frame.getlocal(3).invoke("append", frame.getlocal(4));
            }
            return frame.getlocal(3);
        }
        
        private static PyObject get_textfile$7(PyFrame frame) {
            /* Get a text file as a list of lines, with trailing CRLF stripped. */
            frame.setlocal(1, new PyList(new PyObject[] {}));
            frame.getglobal("get_alt_textfile").__call__(frame.getlocal(0), frame.getlocal(1).__getattr__("append"));
            return frame.getlocal(1);
        }
        
        private static PyObject get_alt_textfile$8(PyFrame frame) {
            /* Get a text file and pass each line to a function, with trailing CRLF stripped. */
            while (i$38.__nonzero__()) {
                frame.setlocal(2, frame.getlocal(0).invoke("readline"));
                if (frame.getlocal(2).__not__().__nonzero__()) {
                    Py.println(s$47);
                    break;
                }
                if (frame.getlocal(2).__getslice__(i$31.__neg__(), null, null)._eq(frame.getglobal("CRLF")).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(2).__getslice__(null, i$31.__neg__(), null));
                }
                else if (frame.getlocal(2).__getslice__(i$38.__neg__(), null, null)._in(frame.getglobal("CRLF")).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(2).__getslice__(null, i$38.__neg__(), null));
                }
                if (frame.getlocal(2)._eq(s$48).__nonzero__()) {
                    break;
                }
                if (frame.getlocal(2).__getslice__(null, i$31, null)._eq(s$56).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(2).__getslice__(i$38, null, null));
                }
                frame.getlocal(1).__call__(frame.getlocal(2));
            }
            return Py.None;
        }
        
        private static PyObject get_binary$9(PyFrame frame) {
            /* Get a binary file as one solid data block. */
            frame.setlocal(1, frame.getlocal(0).invoke("read"));
            return frame.getlocal(1);
        }
        
        private static PyObject get_alt_binary$10(PyFrame frame) {
            /* Get a binary file and pass each block to a function. */
            while (i$38.__nonzero__()) {
                frame.setlocal(3, frame.getlocal(0).invoke("read", frame.getlocal(2)));
                if (frame.getlocal(3).__not__().__nonzero__()) {
                    break;
                }
                frame.getlocal(1).__call__(frame.getlocal(3));
            }
            return Py.None;
        }
        
        private static PyObject test$11(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            /* Trivial test program. */
            frame.setlocal(4, org.python.core.imp.importOne("sys", frame));
            frame.setlocal(2, org.python.core.imp.importOne("getopt", frame));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(2).__getattr__("getopt").__call__(frame.getlocal(4).__getattr__("argv").__getslice__(i$38, null, null), s$39), 2);
            frame.setlocal(6, t$0$PyObject__[0]);
            frame.setlocal(0, t$0$PyObject__[1]);
            frame.setlocal(8, frame.getglobal("DEF_SELECTOR"));
            frame.setlocal(1, frame.getlocal(8).__getitem__(i$37));
            frame.setlocal(7, frame.getglobal("DEF_HOST"));
            frame.setlocal(5, frame.getglobal("DEF_PORT"));
            if (frame.getlocal(0).__nonzero__()) {
                frame.setlocal(7, frame.getlocal(0).__getitem__(i$37));
                frame.setlocal(0, frame.getlocal(0).__getslice__(i$38, null, null));
            }
            if (frame.getlocal(0).__nonzero__()) {
                frame.setlocal(1, frame.getlocal(0).__getitem__(i$37));
                frame.setlocal(0, frame.getlocal(0).__getslice__(i$38, null, null));
                if (frame.getglobal("len").__call__(frame.getlocal(1))._gt(i$38).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1).__getitem__(i$37), frame.getlocal(1)}), 2);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(8, t$0$PyObject__[1]);
                }
                else {
                    frame.setlocal(8, s$39);
                    if (frame.getlocal(0).__nonzero__()) {
                        frame.setlocal(8, frame.getlocal(0).__getitem__(i$37));
                        frame.setlocal(0, frame.getlocal(0).__getslice__(i$38, null, null));
                    }
                }
                frame.setlocal(3, s$39);
                if (frame.getlocal(0).__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(0).__getitem__(i$37));
                    frame.setlocal(0, frame.getlocal(0).__getslice__(i$38, null, null));
                }
            }
            if (frame.getlocal(1)._eq(frame.getglobal("A_INDEX")).__nonzero__()) {
                frame.setlocal(9, frame.getglobal("send_query").__call__(frame.getlocal(8), frame.getlocal(3), frame.getlocal(7)));
            }
            else {
                frame.setlocal(9, frame.getglobal("send_selector").__call__(frame.getlocal(8), frame.getlocal(7)));
            }
            if (frame.getlocal(1)._eq(frame.getglobal("A_TEXT")).__nonzero__()) {
                frame.setlocal(10, frame.getglobal("get_textfile").__call__(frame.getlocal(9)));
                t$0$int = 0;
                t$1$PyObject = frame.getlocal(10);
                while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                    frame.setlocal(11, t$0$PyObject);
                    Py.println(frame.getlocal(11));
                }
            }
            else if (frame.getlocal(1)._in(new PyTuple(new PyObject[] {frame.getglobal("A_MENU"), frame.getglobal("A_INDEX")})).__nonzero__()) {
                frame.setlocal(10, frame.getglobal("get_directory").__call__(frame.getlocal(9)));
                t$1$int = 0;
                t$3$PyObject = frame.getlocal(10);
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    frame.setlocal(11, t$2$PyObject);
                    Py.println(frame.getlocal(11));
                }
            }
            else {
                frame.setlocal(12, frame.getglobal("get_binary").__call__(frame.getlocal(9)));
                Py.printComma(s$60);
                Py.printComma(frame.getglobal("len").__call__(frame.getlocal(12)));
                Py.printComma(s$61);
                Py.println(frame.getlocal(12).__getslice__(null, i$63, null).__repr__().__getslice__(null, i$62, null));
            }
            return Py.None;
        }
        
        private static PyObject main$12(PyFrame frame) {
            frame.setglobal("__file__", s$65);
            
            /* Gopher protocol client interface. */
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2}));
            frame.setlocal("DEF_SELECTOR", s$3);
            frame.setlocal("DEF_HOST", s$4);
            frame.setlocal("DEF_PORT", i$5);
            frame.setlocal("A_TEXT", s$6);
            frame.setlocal("A_MENU", s$7);
            frame.setlocal("A_CSO", s$8);
            frame.setlocal("A_ERROR", s$9);
            frame.setlocal("A_MACBINHEX", s$10);
            frame.setlocal("A_PCBINHEX", s$11);
            frame.setlocal("A_UUENCODED", s$12);
            frame.setlocal("A_INDEX", s$13);
            frame.setlocal("A_TELNET", s$14);
            frame.setlocal("A_BINARY", s$15);
            frame.setlocal("A_DUPLICATE", s$16);
            frame.setlocal("A_SOUND", s$17);
            frame.setlocal("A_EVENT", s$18);
            frame.setlocal("A_CALENDAR", s$19);
            frame.setlocal("A_HTML", s$20);
            frame.setlocal("A_TN3270", s$21);
            frame.setlocal("A_MIME", s$22);
            frame.setlocal("A_IMAGE", s$23);
            frame.setlocal("A_WHOIS", s$24);
            frame.setlocal("A_QUERY", s$25);
            frame.setlocal("A_GIF", s$26);
            frame.setlocal("A_HTML", s$20);
            frame.setlocal("A_WWW", s$24);
            frame.setlocal("A_PLUS_IMAGE", s$27);
            frame.setlocal("A_PLUS_MOVIE", s$28);
            frame.setlocal("A_PLUS_SOUND", s$29);
            frame.setlocal("_names", frame.getname("dir").__call__());
            frame.setlocal("_type_to_name_map", new PyDictionary(new PyObject[] {}));
            frame.setlocal("type_to_name", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_type_to_name));
            frame.setlocal("CRLF", s$34);
            frame.setlocal("TAB", s$35);
            frame.setlocal("send_selector", new PyFunction(frame.f_globals, new PyObject[] {i$37}, c$1_send_selector));
            frame.setlocal("send_query", new PyFunction(frame.f_globals, new PyObject[] {i$37}, c$2_send_query));
            frame.setlocal("path_to_selector", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_path_to_selector));
            frame.setlocal("path_to_datatype_name", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_path_to_datatype_name));
            frame.setlocal("get_directory", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_get_directory));
            frame.setlocal("get_textfile", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_get_textfile));
            frame.setlocal("get_alt_textfile", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_get_alt_textfile));
            frame.setlocal("get_binary", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_get_binary));
            frame.setlocal("get_alt_binary", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_get_alt_binary));
            frame.setlocal("test", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_test));
            if (frame.getname("__name__")._eq(s$64).__nonzero__()) {
                frame.getname("test").__call__();
            }
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("gopherlib"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "gopherlib";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(gopherlib._PyInner.class, newargs, gopherlib.jpy$packages, gopherlib.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
