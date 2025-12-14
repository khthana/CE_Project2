import org.python.core.*;

public class tempfile extends java.lang.Object {
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
        private static PyObject i$10;
        private static PyObject s$11;
        private static PyObject s$12;
        private static PyObject s$13;
        private static PyObject i$14;
        private static PyObject s$15;
        private static PyObject s$16;
        private static PyObject s$17;
        private static PyObject s$18;
        private static PyObject s$19;
        private static PyObject s$20;
        private static PyObject i$21;
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
        private static PyCode c$0_gettempdir;
        private static PyCode c$1_gettempprefix;
        private static PyCode c$2_mktemp;
        private static PyCode c$3___init__;
        private static PyCode c$4_close;
        private static PyCode c$5___del__;
        private static PyCode c$6___getattr__;
        private static PyCode c$7_TemporaryFileWrapper;
        private static PyCode c$8_TemporaryFile;
        private static PyCode c$9___init__;
        private static PyCode c$10_get_next;
        private static PyCode c$11__ThreadSafeCounter;
        private static PyCode c$12_acquire;
        private static PyCode c$13__DummyMutex;
        private static PyCode c$14_main;
        private static void initConstants() {
            s$0 = Py.newString("Temporary files and filenames.");
            s$1 = Py.newString("mktemp");
            s$2 = Py.newString("TemporaryFile");
            s$3 = Py.newString("tempdir");
            s$4 = Py.newString("gettempprefix");
            s$5 = Py.newString("Function to calculate the directory to use.");
            s$6 = Py.newString("/tmp");
            s$7 = Py.newString("/var/tmp");
            s$8 = Py.newString("/usr/tmp");
            s$9 = Py.newString("nt");
            i$10 = Py.newInteger(0);
            s$11 = Py.newString("C:\\TEMP");
            s$12 = Py.newString("\\TEMP");
            s$13 = Py.newString("mac");
            i$14 = Py.newInteger(1);
            s$15 = Py.newString("");
            s$16 = Py.newString("TMPDIR");
            s$17 = Py.newString("TEMP");
            s$18 = Py.newString("TMP");
            s$19 = Py.newString("test");
            s$20 = Py.newString("posix");
            i$21 = Py.newInteger(448);
            s$22 = Py.newString("w");
            s$23 = Py.newString("blat");
            s$24 = Py.newString("Can't find a usable temporary directory amongst ");
            s$25 = Py.newString("~");
            s$26 = Py.newString("-");
            s$27 = Py.newString("Python-Tmp-");
            s$28 = Py.newString("tmp");
            s$29 = Py.newString("Function to calculate a prefix of the filename to use.\012\012    This incorporates the current process id on systems that support such a\012    notion, so that concurrent processes don't generate the same prefix.\012    ");
            s$30 = Py.newString("@");
            s$31 = Py.newString(".");
            s$32 = Py.newString("User-callable function to return a unique temporary file name.");
            s$33 = Py.newString("Temporary file wrapper\012\012    This class provides a wrapper around files opened for temporary use.\012    In particular, it seeks to automatically remove the file when it is\012    no longer needed.\012    ");
            s$34 = Py.newString("file");
            s$35 = Py.newString("Create and return a temporary file (opened read-write by default).");
            s$36 = Py.newString("w+b");
            s$37 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py");
            funcTable = new _PyInner();
            c$0_gettempdir = Py.newCode(0, new String[] {"dirid", "attempdirs", "msg", "dirname", "MACFS", "fp", "pwd", "fd", "dir", "filename", "macfs", "envname", "refnum", "testfile"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "gettempdir", false, false, funcTable, 0, null, null, 0, 1);
            c$1_gettempprefix = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "gettempprefix", false, false, funcTable, 1, null, null, 0, 1);
            c$2_mktemp = Py.newCode(1, new String[] {"suffix", "file", "dir", "pre", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "mktemp", false, false, funcTable, 2, null, null, 0, 1);
            c$3___init__ = Py.newCode(3, new String[] {"self", "file", "path"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "__init__", false, false, funcTable, 3, null, null, 0, 1);
            c$4_close = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "close", false, false, funcTable, 4, null, null, 0, 1);
            c$5___del__ = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "__del__", false, false, funcTable, 5, null, null, 0, 1);
            c$6___getattr__ = Py.newCode(2, new String[] {"self", "name", "a", "file"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "__getattr__", false, false, funcTable, 6, null, null, 0, 1);
            c$7_TemporaryFileWrapper = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "TemporaryFileWrapper", false, false, funcTable, 7, null, null, 0, 0);
            c$8_TemporaryFile = Py.newCode(3, new String[] {"mode", "bufsize", "suffix", "name", "fd", "file"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "TemporaryFile", false, false, funcTable, 8, null, null, 0, 1);
            c$9___init__ = Py.newCode(3, new String[] {"self", "mutex", "initialvalue"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "__init__", false, false, funcTable, 9, null, null, 0, 1);
            c$10_get_next = Py.newCode(1, new String[] {"self", "result", "newi"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "get_next", false, false, funcTable, 10, null, null, 0, 1);
            c$11__ThreadSafeCounter = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "_ThreadSafeCounter", false, false, funcTable, 11, null, null, 0, 0);
            c$12_acquire = Py.newCode(1, new String[] {"self"}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "acquire", false, false, funcTable, 12, null, null, 0, 1);
            c$13__DummyMutex = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "_DummyMutex", false, false, funcTable, 13, null, null, 0, 0);
            c$14_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\tempfile.py", "main", false, false, funcTable, 14, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$14_main == null) _PyInner.initConstants();
            return c$14_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.gettempdir$1(frame);
                case 1:
                return _PyInner.gettempprefix$2(frame);
                case 2:
                return _PyInner.mktemp$3(frame);
                case 3:
                return _PyInner.__init__$4(frame);
                case 4:
                return _PyInner.close$5(frame);
                case 5:
                return _PyInner.__del__$6(frame);
                case 6:
                return _PyInner.__getattr__$7(frame);
                case 7:
                return _PyInner.TemporaryFileWrapper$8(frame);
                case 8:
                return _PyInner.TemporaryFile$9(frame);
                case 9:
                return _PyInner.__init__$10(frame);
                case 10:
                return _PyInner.get_next$11(frame);
                case 11:
                return _PyInner._ThreadSafeCounter$12(frame);
                case 12:
                return _PyInner.acquire$13(frame);
                case 13:
                return _PyInner._DummyMutex$14(frame);
                case 14:
                return _PyInner.main$15(frame);
                default:
                return null;
            }
        }
        
        private static PyObject gettempdir$1(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            boolean t$0$boolean;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* Function to calculate the directory to use. */
            // global tempdir
            if (frame.getglobal("tempdir")._isnot(frame.getglobal("None")).__nonzero__()) {
                return frame.getglobal("tempdir");
            }
            try {
                frame.setlocal(6, frame.getglobal("os").__getattr__("getcwd").__call__());
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, new PyTuple(new PyObject[] {frame.getglobal("AttributeError"), frame.getglobal("os").__getattr__("error")}))) {
                    frame.setlocal(6, frame.getglobal("os").__getattr__("curdir"));
                }
                else throw t$0$PyException;
            }
            frame.setlocal(1, new PyList(new PyObject[] {s$6, s$7, s$8, frame.getlocal(6)}));
            if (frame.getglobal("os").__getattr__("name")._eq(s$9).__nonzero__()) {
                frame.getlocal(1).invoke("insert", i$10, s$11);
                frame.getlocal(1).invoke("insert", i$10, s$12);
            }
            else if (frame.getglobal("os").__getattr__("name")._eq(s$13).__nonzero__()) {
                frame.setlocal(10, org.python.core.imp.importOne("macfs", frame));
                frame.setlocal(4, org.python.core.imp.importOne("MACFS", frame));
                try {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(10).__getattr__("FindFolder").__call__(frame.getlocal(4).__getattr__("kOnSystemDisk"), frame.getlocal(4).__getattr__("kTemporaryFolderType"), i$14), 2);
                    frame.setlocal(12, t$0$PyObject__[0]);
                    frame.setlocal(0, t$0$PyObject__[1]);
                    frame.setlocal(3, frame.getlocal(10).__getattr__("FSSpec").__call__(new PyTuple(new PyObject[] {frame.getlocal(12), frame.getlocal(0), s$15})).invoke("as_pathname"));
                    frame.getlocal(1).invoke("insert", i$10, frame.getlocal(3));
                }
                catch (Throwable x$1) {
                    t$0$PyException = Py.setException(x$1, frame);
                    if (Py.matchException(t$0$PyException, frame.getlocal(10).__getattr__("error"))) {
                        // pass
                    }
                    else throw t$0$PyException;
                }
            }
            t$0$int = 0;
            t$1$PyObject = new PyTuple(new PyObject[] {s$16, s$17, s$18});
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(11, t$0$PyObject);
                if (frame.getglobal("os").__getattr__("environ").__getattr__("has_key").__call__(frame.getlocal(11)).__nonzero__()) {
                    frame.getlocal(1).invoke("insert", i$10, frame.getglobal("os").__getattr__("environ").__getitem__(frame.getlocal(11)));
                }
            }
            frame.setlocal(13, frame.getglobal("gettempprefix").__call__()._add(s$19));
            t$1$int = 0;
            t$3$PyObject = frame.getlocal(1);
            while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                frame.setlocal(8, t$2$PyObject);
                try {
                    frame.setlocal(9, frame.getglobal("os").__getattr__("path").__getattr__("join").__call__(frame.getlocal(8), frame.getlocal(13)));
                    if (frame.getglobal("os").__getattr__("name")._eq(s$20).__nonzero__()) {
                        t$0$boolean = true;
                        try {
                            frame.setlocal(7, frame.getglobal("os").__getattr__("open").__call__(frame.getlocal(9), frame.getglobal("os").__getattr__("O_RDWR")._or(frame.getglobal("os").__getattr__("O_CREAT"))._or(frame.getglobal("os").__getattr__("O_EXCL")), i$21));
                        }
                        catch (Throwable x$2) {
                            t$0$boolean = false;
                            t$0$PyException = Py.setException(x$2, frame);
                            if (Py.matchException(t$0$PyException, frame.getglobal("OSError"))) {
                                // pass
                            }
                            else throw t$0$PyException;
                        }
                        if (t$0$boolean) {
                            frame.setlocal(5, frame.getglobal("os").__getattr__("fdopen").__call__(frame.getlocal(7), s$22));
                            frame.getlocal(5).invoke("write", s$23);
                            frame.getlocal(5).invoke("close");
                            frame.getglobal("os").__getattr__("unlink").__call__(frame.getlocal(9));
                            frame.dellocal(5);
                            frame.dellocal(7);
                            frame.setglobal("tempdir", frame.getlocal(8));
                            break;
                        }
                    }
                    else {
                        frame.setlocal(5, frame.getglobal("open").__call__(frame.getlocal(9), s$22));
                        frame.getlocal(5).invoke("write", s$23);
                        frame.getlocal(5).invoke("close");
                        frame.getglobal("os").__getattr__("unlink").__call__(frame.getlocal(9));
                        frame.setglobal("tempdir", frame.getlocal(8));
                        break;
                    }
                }
                catch (Throwable x$3) {
                    t$0$PyException = Py.setException(x$3, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("IOError"))) {
                        // pass
                    }
                    else throw t$0$PyException;
                }
            }
            if (frame.getglobal("tempdir")._is(frame.getglobal("None")).__nonzero__()) {
                frame.setlocal(2, s$24._add(frame.getlocal(1).__repr__()));
                throw Py.makeException(frame.getglobal("IOError"), frame.getlocal(2));
            }
            return frame.getglobal("tempdir");
        }
        
        private static PyObject gettempprefix$2(PyFrame frame) {
            /* Function to calculate a prefix of the filename to use.
            
                This incorporates the current process id on systems that support such a
                notion, so that concurrent processes don't generate the same prefix.
                 */
            // global template
            if (frame.getglobal("template")._is(frame.getglobal("None")).__nonzero__()) {
                return s$30._add(frame.getglobal("os").__getattr__("getpid").__call__().__repr__())._add(s$31);
            }
            else {
                return frame.getglobal("template");
            }
        }
        
        private static PyObject mktemp$3(PyFrame frame) {
            /* User-callable function to return a unique temporary file name. */
            frame.setlocal(2, frame.getglobal("gettempdir").__call__());
            frame.setlocal(3, frame.getglobal("gettempprefix").__call__());
            while (i$14.__nonzero__()) {
                frame.setlocal(4, frame.getglobal("_counter").invoke("get_next"));
                frame.setlocal(1, frame.getglobal("os").__getattr__("path").__getattr__("join").__call__(frame.getlocal(2), frame.getlocal(3)._add(frame.getglobal("str").__call__(frame.getlocal(4)))._add(frame.getlocal(0))));
                if (frame.getglobal("os").__getattr__("path").__getattr__("exists").__call__(frame.getlocal(1)).__not__().__nonzero__()) {
                    return frame.getlocal(1);
                }
            }
            return Py.None;
        }
        
        private static PyObject __init__$4(PyFrame frame) {
            frame.getlocal(0).__setattr__("file", frame.getlocal(1));
            frame.getlocal(0).__setattr__("path", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject close$5(PyFrame frame) {
            frame.getlocal(0).__getattr__("file").invoke("close");
            frame.getglobal("os").__getattr__("unlink").__call__(frame.getlocal(0).__getattr__("path"));
            return Py.None;
        }
        
        private static PyObject __del__$6(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            try {
                frame.getlocal(0).invoke("close");
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                // pass
            }
            return Py.None;
        }
        
        private static PyObject __getattr__$7(PyFrame frame) {
            frame.setlocal(3, frame.getlocal(0).__getattr__("__dict__").__getitem__(s$34));
            frame.setlocal(2, frame.getglobal("getattr").__call__(frame.getlocal(3), frame.getlocal(1)));
            if (frame.getglobal("type").__call__(frame.getlocal(2))._ne(frame.getglobal("type").__call__(i$10)).__nonzero__()) {
                frame.getglobal("setattr").__call__(frame.getlocal(0), frame.getlocal(1), frame.getlocal(2));
            }
            return frame.getlocal(2);
        }
        
        private static PyObject TemporaryFileWrapper$8(PyFrame frame) {
            /* Temporary file wrapper
            
                This class provides a wrapper around files opened for temporary use.
                In particular, it seeks to automatically remove the file when it is
                no longer needed.
                 */
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {}, c$3___init__));
            frame.setlocal("close", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_close));
            frame.setlocal("__del__", new PyFunction(frame.f_globals, new PyObject[] {}, c$5___del__));
            frame.setlocal("__getattr__", new PyFunction(frame.f_globals, new PyObject[] {}, c$6___getattr__));
            return frame.getf_locals();
        }
        
        private static PyObject TemporaryFile$9(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Create and return a temporary file (opened read-write by default). */
            frame.setlocal(3, frame.getglobal("mktemp").__call__(frame.getlocal(2)));
            if (frame.getglobal("os").__getattr__("name")._eq(s$20).__nonzero__()) {
                frame.setlocal(4, frame.getglobal("os").__getattr__("open").__call__(frame.getlocal(3), frame.getglobal("os").__getattr__("O_RDWR")._or(frame.getglobal("os").__getattr__("O_CREAT"))._or(frame.getglobal("os").__getattr__("O_EXCL")), i$21));
                try {
                    frame.getglobal("os").__getattr__("unlink").__call__(frame.getlocal(3));
                    return frame.getglobal("os").__getattr__("fdopen").__call__(frame.getlocal(4), frame.getlocal(0), frame.getlocal(1));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    frame.getglobal("os").__getattr__("close").__call__(frame.getlocal(4));
                    throw Py.makeException();
                }
            }
            else {
                frame.setlocal(5, frame.getglobal("open").__call__(frame.getlocal(3), frame.getlocal(0), frame.getlocal(1)));
                return frame.getglobal("TemporaryFileWrapper").__call__(frame.getlocal(5), frame.getlocal(3));
            }
        }
        
        private static PyObject __init__$10(PyFrame frame) {
            frame.getlocal(0).__setattr__("mutex", frame.getlocal(1));
            frame.getlocal(0).__setattr__("i", frame.getlocal(2));
            return Py.None;
        }
        
        private static PyObject get_next$11(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            frame.getlocal(0).__getattr__("mutex").invoke("acquire");
            frame.setlocal(1, frame.getlocal(0).__getattr__("i"));
            try {
                frame.setlocal(2, frame.getlocal(1)._add(i$14));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("OverflowError"))) {
                    frame.setlocal(2, frame.getglobal("long").__call__(frame.getlocal(1))._add(i$14));
                }
                else throw t$0$PyException;
            }
            frame.getlocal(0).__setattr__("i", frame.getlocal(2));
            frame.getlocal(0).__getattr__("mutex").invoke("release");
            return frame.getlocal(1);
        }
        
        private static PyObject _ThreadSafeCounter$12(PyFrame frame) {
            frame.setlocal("__init__", new PyFunction(frame.f_globals, new PyObject[] {i$10}, c$9___init__));
            frame.setlocal("get_next", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_get_next));
            return frame.getf_locals();
        }
        
        private static PyObject acquire$13(PyFrame frame) {
            // pass
            return Py.None;
        }
        
        private static PyObject _DummyMutex$14(PyFrame frame) {
            frame.setlocal("acquire", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_acquire));
            frame.setlocal("release", frame.getname("acquire"));
            return frame.getf_locals();
        }
        
        private static PyObject main$15(PyFrame frame) {
            frame.setglobal("__file__", s$37);
            
            // Temporary Variables
            boolean t$0$boolean;
            PyException t$0$PyException;
            
            // Code
            /* Temporary files and filenames. */
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4}));
            frame.setlocal("tempdir", frame.getname("None"));
            frame.setlocal("template", frame.getname("None"));
            frame.setlocal("gettempdir", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_gettempdir));
            if (frame.getname("os").__getattr__("name")._eq(s$20).__nonzero__()) {
                frame.setlocal("template", frame.getname("None"));
            }
            else if (frame.getname("os").__getattr__("name")._eq(s$9).__nonzero__()) {
                frame.setlocal("template", s$25._add(frame.getname("os").__getattr__("getpid").__call__().__repr__())._add(s$26));
            }
            else if (frame.getname("os").__getattr__("name")._eq(s$13).__nonzero__()) {
                frame.setlocal("template", s$27);
            }
            else {
                frame.setlocal("template", s$28);
            }
            frame.setlocal("gettempprefix", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_gettempprefix));
            frame.setlocal("mktemp", new PyFunction(frame.f_globals, new PyObject[] {s$15}, c$2_mktemp));
            frame.setlocal("TemporaryFileWrapper", Py.makeClass("TemporaryFileWrapper", new PyObject[] {}, c$7_TemporaryFileWrapper, null));
            frame.setlocal("TemporaryFile", new PyFunction(frame.f_globals, new PyObject[] {s$36, i$14.__neg__(), s$15}, c$8_TemporaryFile));
            frame.setlocal("_ThreadSafeCounter", Py.makeClass("_ThreadSafeCounter", new PyObject[] {}, c$11__ThreadSafeCounter, null));
            t$0$boolean = true;
            try {
                frame.setlocal("thread", org.python.core.imp.importOne("thread", frame));
            }
            catch (Throwable x$0) {
                t$0$boolean = false;
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getname("ImportError"))) {
                    frame.setlocal("_DummyMutex", Py.makeClass("_DummyMutex", new PyObject[] {}, c$13__DummyMutex, null));
                    frame.setlocal("_counter", frame.getname("_ThreadSafeCounter").__call__(frame.getname("_DummyMutex").__call__()));
                    frame.dellocal("_DummyMutex");
                }
                else throw t$0$PyException;
            }
            if (t$0$boolean) {
                frame.setlocal("_counter", frame.getname("_ThreadSafeCounter").__call__(frame.getname("thread").__getattr__("allocate_lock").__call__()));
                frame.dellocal("thread");
            }
            frame.dellocal("_ThreadSafeCounter");
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("tempfile"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "tempfile";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(tempfile._PyInner.class, newargs, tempfile.jpy$packages, tempfile.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
