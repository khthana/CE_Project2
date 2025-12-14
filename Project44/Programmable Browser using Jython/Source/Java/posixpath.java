import org.python.core.*;

public class posixpath extends java.lang.Object {
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
        private static PyObject s$50;
        private static PyObject s$51;
        private static PyObject s$52;
        private static PyObject s$53;
        private static PyObject s$54;
        private static PyObject s$55;
        private static PyObject i$56;
        private static PyObject s$57;
        private static PyObject s$58;
        private static PyObject s$59;
        private static PyObject s$60;
        private static PyObject s$61;
        private static PyObject s$62;
        private static PyObject s$63;
        private static PyObject s$64;
        private static PyObject i$65;
        private static PyObject s$66;
        private static PyObject s$67;
        private static PyFunctionTable funcTable;
        private static PyCode c$0_normcase;
        private static PyCode c$1_isabs;
        private static PyCode c$2_join;
        private static PyCode c$3_split;
        private static PyCode c$4_splitext;
        private static PyCode c$5_splitdrive;
        private static PyCode c$6_basename;
        private static PyCode c$7_dirname;
        private static PyCode c$8_commonprefix;
        private static PyCode c$9_getsize;
        private static PyCode c$10_getmtime;
        private static PyCode c$11_getatime;
        private static PyCode c$12_islink;
        private static PyCode c$13_exists;
        private static PyCode c$14_isdir;
        private static PyCode c$15_isfile;
        private static PyCode c$16_samefile;
        private static PyCode c$17_sameopenfile;
        private static PyCode c$18_samestat;
        private static PyCode c$19_ismount;
        private static PyCode c$20_walk;
        private static PyCode c$21_expanduser;
        private static PyCode c$22_expandvars;
        private static PyCode c$23_normpath;
        private static PyCode c$24_abspath;
        private static PyCode c$25_main;
        private static void initConstants() {
            s$0 = Py.newString("Common operations on Posix pathnames.\012\012Instead of importing this module directly, import os and refer to\012this module as os.path.  The \"os.path\" name is an alias for this\012module on Posix systems; on other systems (e.g. Mac, Windows),\012os.path provides the same operations in a manner specific to that\012platform, and is an alias to another module (e.g. macpath, ntpath).\012\012Some of this can actually be useful on non-Posix systems too, e.g.\012for manipulation of the pathname component of URLs.\012");
            s$1 = Py.newString("normcase");
            s$2 = Py.newString("isabs");
            s$3 = Py.newString("join");
            s$4 = Py.newString("splitdrive");
            s$5 = Py.newString("split");
            s$6 = Py.newString("splitext");
            s$7 = Py.newString("basename");
            s$8 = Py.newString("dirname");
            s$9 = Py.newString("commonprefix");
            s$10 = Py.newString("getsize");
            s$11 = Py.newString("getmtime");
            s$12 = Py.newString("getatime");
            s$13 = Py.newString("islink");
            s$14 = Py.newString("exists");
            s$15 = Py.newString("isdir");
            s$16 = Py.newString("isfile");
            s$17 = Py.newString("ismount");
            s$18 = Py.newString("walk");
            s$19 = Py.newString("expanduser");
            s$20 = Py.newString("expandvars");
            s$21 = Py.newString("normpath");
            s$22 = Py.newString("abspath");
            s$23 = Py.newString("samefile");
            s$24 = Py.newString("sameopenfile");
            s$25 = Py.newString("samestat");
            s$26 = Py.newString("Normalize case of pathname.  Has no effect under Posix");
            s$27 = Py.newString("Test whether a path is absolute");
            i$28 = Py.newInteger(1);
            s$29 = Py.newString("/");
            s$30 = Py.newString("Join two or more pathname components, inserting '/' as needed");
            s$31 = Py.newString("");
            s$32 = Py.newString("Split a pathname.  Returns tuple \"(head, tail)\" where \"tail\" is\012    everything after the final slash.  Either part may be empty.");
            s$33 = Py.newString("Split the extension from a pathname.  Extension is everything from the\012    last dot to the end.  Returns \"(root, ext)\", either part may be empty.");
            s$34 = Py.newString(".");
            s$35 = Py.newString("Split a pathname into drive and path. On Posix, drive is always\012    empty.");
            s$36 = Py.newString("Returns the final component of a pathname");
            s$37 = Py.newString("Returns the directory component of a pathname");
            i$38 = Py.newInteger(0);
            s$39 = Py.newString("Given a list of pathnames, returns the longest common leading component");
            s$40 = Py.newString("Return the size of a file, reported by os.stat().");
            s$41 = Py.newString("Return the last modification time of a file, reported by os.stat().");
            s$42 = Py.newString("Return the last access time of a file, reported by os.stat().");
            s$43 = Py.newString("Test whether a path is a symbolic link");
            s$44 = Py.newString("Test whether a path exists.  Returns false for broken symbolic links");
            s$45 = Py.newString("Test whether a path is a directory");
            s$46 = Py.newString("Test whether a path is a regular file");
            s$47 = Py.newString("Test whether two pathnames reference the same actual file");
            s$48 = Py.newString("Test whether two open file objects reference the same file");
            s$49 = Py.newString("Test whether two stat buffers reference the same file");
            s$50 = Py.newString("Test whether a path is a mount point");
            s$51 = Py.newString("..");
            s$52 = Py.newString("walk(top,func,arg) calls func(arg, d, files) for each directory \"d\"\012    in the tree  rooted at \"top\" (including \"top\" itself).  \"files\" is a list\012    of all the files and subdirs in directory \"d\".\012    ");
            s$53 = Py.newString("Expand ~ and ~user constructions.  If user or $HOME is unknown,\012    do nothing.");
            s$54 = Py.newString("~");
            s$55 = Py.newString("HOME");
            i$56 = Py.newInteger(5);
            s$57 = Py.newString("Expand shell variables of form $var and ${var}.  Unknown variables\012    are left unchanged.");
            s$58 = Py.newString("$");
            s$59 = Py.newString("\\$(\\w+|\\{[^}]*\\})");
            s$60 = Py.newString("{");
            s$61 = Py.newString("}");
            s$62 = Py.newString("Normalize path, eliminating double slashes, etc.");
            s$63 = Py.newString("//");
            s$64 = Py.newString("///");
            i$65 = Py.newInteger(2);
            s$66 = Py.newString("Return an absolute path.");
            s$67 = Py.newString("C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py");
            funcTable = new _PyInner();
            c$0_normcase = Py.newCode(1, new String[] {"s"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "normcase", false, false, funcTable, 0, null, null, 0, 1);
            c$1_isabs = Py.newCode(1, new String[] {"s"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "isabs", false, false, funcTable, 1, null, null, 0, 1);
            c$2_join = Py.newCode(2, new String[] {"a", "p", "b", "path"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "join", true, false, funcTable, 2, null, null, 0, 1);
            c$3_split = Py.newCode(1, new String[] {"p", "tail", "head", "i"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "split", false, false, funcTable, 3, null, null, 0, 1);
            c$4_splitext = Py.newCode(1, new String[] {"p", "root", "ext", "c"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "splitext", false, false, funcTable, 4, null, null, 0, 1);
            c$5_splitdrive = Py.newCode(1, new String[] {"p"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "splitdrive", false, false, funcTable, 5, null, null, 0, 1);
            c$6_basename = Py.newCode(1, new String[] {"p"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "basename", false, false, funcTable, 6, null, null, 0, 1);
            c$7_dirname = Py.newCode(1, new String[] {"p"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "dirname", false, false, funcTable, 7, null, null, 0, 1);
            c$8_commonprefix = Py.newCode(1, new String[] {"m", "i", "item", "prefix"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "commonprefix", false, false, funcTable, 8, null, null, 0, 1);
            c$9_getsize = Py.newCode(1, new String[] {"filename", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "getsize", false, false, funcTable, 9, null, null, 0, 1);
            c$10_getmtime = Py.newCode(1, new String[] {"filename", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "getmtime", false, false, funcTable, 10, null, null, 0, 1);
            c$11_getatime = Py.newCode(1, new String[] {"filename", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "getatime", false, false, funcTable, 11, null, null, 0, 1);
            c$12_islink = Py.newCode(1, new String[] {"path", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "islink", false, false, funcTable, 12, null, null, 0, 1);
            c$13_exists = Py.newCode(1, new String[] {"path", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "exists", false, false, funcTable, 13, null, null, 0, 1);
            c$14_isdir = Py.newCode(1, new String[] {"path", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "isdir", false, false, funcTable, 14, null, null, 0, 1);
            c$15_isfile = Py.newCode(1, new String[] {"path", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "isfile", false, false, funcTable, 15, null, null, 0, 1);
            c$16_samefile = Py.newCode(2, new String[] {"f1", "f2", "s2", "s1"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "samefile", false, false, funcTable, 16, null, null, 0, 1);
            c$17_sameopenfile = Py.newCode(2, new String[] {"fp1", "fp2", "s2", "s1"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "sameopenfile", false, false, funcTable, 17, null, null, 0, 1);
            c$18_samestat = Py.newCode(2, new String[] {"s1", "s2"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "samestat", false, false, funcTable, 18, null, null, 0, 1);
            c$19_ismount = Py.newCode(1, new String[] {"path", "dev2", "dev1", "ino2", "ino1", "s2", "s1"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "ismount", false, false, funcTable, 19, null, null, 0, 1);
            c$20_walk = Py.newCode(3, new String[] {"top", "func", "arg", "name", "names", "st"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "walk", false, false, funcTable, 20, null, null, 0, 1);
            c$21_expanduser = Py.newCode(1, new String[] {"path", "userhome", "n", "i", "pwd", "pwent"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "expanduser", false, false, funcTable, 21, null, null, 0, 1);
            c$22_expandvars = Py.newCode(1, new String[] {"path", "name", "m", "j", "i", "tail", "re"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "expandvars", false, false, funcTable, 22, null, null, 0, 1);
            c$23_normpath = Py.newCode(1, new String[] {"path", "initial_slashes", "comp", "new_comps", "comps"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "normpath", false, false, funcTable, 23, null, null, 0, 1);
            c$24_abspath = Py.newCode(1, new String[] {"path"}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "abspath", false, false, funcTable, 24, null, null, 0, 1);
            c$25_main = Py.newCode(0, new String[] {}, "C:\\jdk1.4\\jython2.1\\Lib\\posixpath.py", "main", false, false, funcTable, 25, null, null, 0, 0);
        }
        
        
        public PyCode getMain() {
            if (c$25_main == null) _PyInner.initConstants();
            return c$25_main;
        }
        
        public PyObject call_function(int index, PyFrame frame) {
            switch (index){
                case 0:
                return _PyInner.normcase$1(frame);
                case 1:
                return _PyInner.isabs$2(frame);
                case 2:
                return _PyInner.join$3(frame);
                case 3:
                return _PyInner.split$4(frame);
                case 4:
                return _PyInner.splitext$5(frame);
                case 5:
                return _PyInner.splitdrive$6(frame);
                case 6:
                return _PyInner.basename$7(frame);
                case 7:
                return _PyInner.dirname$8(frame);
                case 8:
                return _PyInner.commonprefix$9(frame);
                case 9:
                return _PyInner.getsize$10(frame);
                case 10:
                return _PyInner.getmtime$11(frame);
                case 11:
                return _PyInner.getatime$12(frame);
                case 12:
                return _PyInner.islink$13(frame);
                case 13:
                return _PyInner.exists$14(frame);
                case 14:
                return _PyInner.isdir$15(frame);
                case 15:
                return _PyInner.isfile$16(frame);
                case 16:
                return _PyInner.samefile$17(frame);
                case 17:
                return _PyInner.sameopenfile$18(frame);
                case 18:
                return _PyInner.samestat$19(frame);
                case 19:
                return _PyInner.ismount$20(frame);
                case 20:
                return _PyInner.walk$21(frame);
                case 21:
                return _PyInner.expanduser$22(frame);
                case 22:
                return _PyInner.expandvars$23(frame);
                case 23:
                return _PyInner.normpath$24(frame);
                case 24:
                return _PyInner.abspath$25(frame);
                case 25:
                return _PyInner.main$26(frame);
                default:
                return null;
            }
        }
        
        private static PyObject normcase$1(PyFrame frame) {
            /* Normalize case of pathname.  Has no effect under Posix */
            return frame.getlocal(0);
        }
        
        private static PyObject isabs$2(PyFrame frame) {
            /* Test whether a path is absolute */
            return frame.getlocal(0).__getslice__(null, i$28, null)._eq(s$29);
        }
        
        private static PyObject join$3(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject;
            
            // Code
            /* Join two or more pathname components, inserting '/' as needed */
            frame.setlocal(3, frame.getlocal(0));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(1);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2).__getslice__(null, i$28, null)._eq(s$29).__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(2));
                }
                else if (((t$2$PyObject = frame.getlocal(3)._eq(s$31)).__nonzero__() ? t$2$PyObject : frame.getlocal(3).__getslice__(i$28.__neg__(), null, null)._eq(s$29)).__nonzero__()) {
                    frame.setlocal(3, frame.getlocal(3)._add(frame.getlocal(2)));
                }
                else {
                    frame.setlocal(3, frame.getlocal(3)._add(s$29)._add(frame.getlocal(2)));
                }
            }
            return frame.getlocal(3);
        }
        
        private static PyObject split$4(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            /* Split a pathname.  Returns tuple "(head, tail)" where "tail" is
                everything after the final slash.  Either part may be empty. */
            frame.setlocal(3, frame.getlocal(0).invoke("rfind", s$29)._add(i$28));
            t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(0).__getslice__(null, frame.getlocal(3), null), frame.getlocal(0).__getslice__(frame.getlocal(3), null, null)}), 2);
            frame.setlocal(2, t$0$PyObject__[0]);
            frame.setlocal(1, t$0$PyObject__[1]);
            if (((t$0$PyObject = frame.getlocal(2)).__nonzero__() ? frame.getlocal(2)._ne(s$29._mul(frame.getglobal("len").__call__(frame.getlocal(2)))) : t$0$PyObject).__nonzero__()) {
                while (frame.getlocal(2).__getitem__(i$28.__neg__())._eq(s$29).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(2).__getslice__(null, i$28.__neg__(), null));
                }
            }
            return new PyTuple(new PyObject[] {frame.getlocal(2), frame.getlocal(1)});
        }
        
        private static PyObject splitext$5(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject, t$1$PyObject;
            
            // Code
            /* Split the extension from a pathname.  Extension is everything from the
                last dot to the end.  Returns "(root, ext)", either part may be empty. */
            t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {s$31, s$31}), 2);
            frame.setlocal(1, t$0$PyObject__[0]);
            frame.setlocal(2, t$0$PyObject__[1]);
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                if (frame.getlocal(3)._eq(s$29).__nonzero__()) {
                    t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1)._add(frame.getlocal(2))._add(frame.getlocal(3)), s$31}), 2);
                    frame.setlocal(1, t$0$PyObject__[0]);
                    frame.setlocal(2, t$0$PyObject__[1]);
                }
                else if (frame.getlocal(3)._eq(s$34).__nonzero__()) {
                    if (frame.getlocal(2).__nonzero__()) {
                        t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {frame.getlocal(1)._add(frame.getlocal(2)), frame.getlocal(3)}), 2);
                        frame.setlocal(1, t$0$PyObject__[0]);
                        frame.setlocal(2, t$0$PyObject__[1]);
                    }
                    else {
                        frame.setlocal(2, frame.getlocal(3));
                    }
                }
                else if (frame.getlocal(2).__nonzero__()) {
                    frame.setlocal(2, frame.getlocal(2)._add(frame.getlocal(3)));
                }
                else {
                    frame.setlocal(1, frame.getlocal(1)._add(frame.getlocal(3)));
                }
            }
            return new PyTuple(new PyObject[] {frame.getlocal(1), frame.getlocal(2)});
        }
        
        private static PyObject splitdrive$6(PyFrame frame) {
            /* Split a pathname into drive and path. On Posix, drive is always
                empty. */
            return new PyTuple(new PyObject[] {s$31, frame.getlocal(0)});
        }
        
        private static PyObject basename$7(PyFrame frame) {
            /* Returns the final component of a pathname */
            return frame.getglobal("split").__call__(frame.getlocal(0)).__getitem__(i$28);
        }
        
        private static PyObject dirname$8(PyFrame frame) {
            /* Returns the directory component of a pathname */
            return frame.getglobal("split").__call__(frame.getlocal(0)).__getitem__(i$38);
        }
        
        private static PyObject commonprefix$9(PyFrame frame) {
            // Temporary Variables
            int t$0$int, t$1$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject;
            
            // Code
            /* Given a list of pathnames, returns the longest common leading component */
            if (frame.getlocal(0).__not__().__nonzero__()) {
                return s$31;
            }
            frame.setlocal(3, frame.getlocal(0).__getitem__(i$38));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(0);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                t$1$int = 0;
                t$3$PyObject = frame.getglobal("range").__call__(frame.getglobal("len").__call__(frame.getlocal(3)));
                while ((t$2$PyObject = t$3$PyObject.__finditem__(t$1$int++)) != null) {
                    frame.setlocal(1, t$2$PyObject);
                    if (frame.getlocal(3).__getslice__(null, frame.getlocal(1)._add(i$28), null)._ne(frame.getlocal(2).__getslice__(null, frame.getlocal(1)._add(i$28), null)).__nonzero__()) {
                        frame.setlocal(3, frame.getlocal(3).__getslice__(null, frame.getlocal(1), null));
                        if (frame.getlocal(1)._eq(i$38).__nonzero__()) {
                            return s$31;
                        }
                        break;
                    }
                }
            }
            return frame.getlocal(3);
        }
        
        private static PyObject getsize$10(PyFrame frame) {
            /* Return the size of a file, reported by os.stat(). */
            frame.setlocal(1, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            return frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_SIZE"));
        }
        
        private static PyObject getmtime$11(PyFrame frame) {
            /* Return the last modification time of a file, reported by os.stat(). */
            frame.setlocal(1, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            return frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_MTIME"));
        }
        
        private static PyObject getatime$12(PyFrame frame) {
            /* Return the last access time of a file, reported by os.stat(). */
            frame.setlocal(1, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            return frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_ATIME"));
        }
        
        private static PyObject islink$13(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Test whether a path is a symbolic link */
            try {
                frame.setlocal(1, frame.getglobal("os").__getattr__("lstat").__call__(frame.getlocal(0)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, new PyTuple(new PyObject[] {frame.getglobal("os").__getattr__("error"), frame.getglobal("AttributeError")}))) {
                    return i$38;
                }
                else throw t$0$PyException;
            }
            return frame.getglobal("stat").__getattr__("S_ISLNK").__call__(frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_MODE")));
        }
        
        private static PyObject exists$14(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Test whether a path exists.  Returns false for broken symbolic links */
            try {
                frame.setlocal(1, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("os").__getattr__("error"))) {
                    return i$38;
                }
                else throw t$0$PyException;
            }
            return i$28;
        }
        
        private static PyObject isdir$15(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Test whether a path is a directory */
            try {
                frame.setlocal(1, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("os").__getattr__("error"))) {
                    return i$38;
                }
                else throw t$0$PyException;
            }
            return frame.getglobal("stat").__getattr__("S_ISDIR").__call__(frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_MODE")));
        }
        
        private static PyObject isfile$16(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Test whether a path is a regular file */
            try {
                frame.setlocal(1, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("os").__getattr__("error"))) {
                    return i$38;
                }
                else throw t$0$PyException;
            }
            return frame.getglobal("stat").__getattr__("S_ISREG").__call__(frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_MODE")));
        }
        
        private static PyObject samefile$17(PyFrame frame) {
            /* Test whether two pathnames reference the same actual file */
            frame.setlocal(3, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
            frame.setlocal(2, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(1)));
            return frame.getglobal("samestat").__call__(frame.getlocal(3), frame.getlocal(2));
        }
        
        private static PyObject sameopenfile$18(PyFrame frame) {
            /* Test whether two open file objects reference the same file */
            frame.setlocal(3, frame.getglobal("os").__getattr__("fstat").__call__(frame.getlocal(0)));
            frame.setlocal(2, frame.getglobal("os").__getattr__("fstat").__call__(frame.getlocal(1)));
            return frame.getglobal("samestat").__call__(frame.getlocal(3), frame.getlocal(2));
        }
        
        private static PyObject samestat$19(PyFrame frame) {
            // Temporary Variables
            PyObject t$0$PyObject;
            
            // Code
            /* Test whether two stat buffers reference the same file */
            return (t$0$PyObject = frame.getlocal(0).__getitem__(frame.getglobal("stat").__getattr__("ST_INO"))._eq(frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_INO")))).__nonzero__() ? frame.getlocal(0).__getitem__(frame.getglobal("stat").__getattr__("ST_DEV"))._eq(frame.getlocal(1).__getitem__(frame.getglobal("stat").__getattr__("ST_DEV"))) : t$0$PyObject;
        }
        
        private static PyObject ismount$20(PyFrame frame) {
            // Temporary Variables
            PyException t$0$PyException;
            
            // Code
            /* Test whether a path is a mount point */
            try {
                frame.setlocal(6, frame.getglobal("os").__getattr__("stat").__call__(frame.getlocal(0)));
                frame.setlocal(5, frame.getglobal("os").__getattr__("stat").__call__(frame.getglobal("join").__call__(frame.getlocal(0), s$51)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("os").__getattr__("error"))) {
                    return i$38;
                }
                else throw t$0$PyException;
            }
            frame.setlocal(2, frame.getlocal(6).__getitem__(frame.getglobal("stat").__getattr__("ST_DEV")));
            frame.setlocal(1, frame.getlocal(5).__getitem__(frame.getglobal("stat").__getattr__("ST_DEV")));
            if (frame.getlocal(2)._ne(frame.getlocal(1)).__nonzero__()) {
                return i$28;
            }
            frame.setlocal(4, frame.getlocal(6).__getitem__(frame.getglobal("stat").__getattr__("ST_INO")));
            frame.setlocal(3, frame.getlocal(5).__getitem__(frame.getglobal("stat").__getattr__("ST_INO")));
            if (frame.getlocal(4)._eq(frame.getlocal(3)).__nonzero__()) {
                return i$28;
            }
            return i$38;
        }
        
        private static PyObject walk$21(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject;
            PyException t$0$PyException;
            
            // Code
            /* walk(top,func,arg) calls func(arg, d, files) for each directory "d"
                in the tree  rooted at "top" (including "top" itself).  "files" is a list
                of all the files and subdirs in directory "d".
                 */
            try {
                frame.setlocal(4, frame.getglobal("os").__getattr__("listdir").__call__(frame.getlocal(0)));
            }
            catch (Throwable x$0) {
                t$0$PyException = Py.setException(x$0, frame);
                if (Py.matchException(t$0$PyException, frame.getglobal("os").__getattr__("error"))) {
                    return Py.None;
                }
                else throw t$0$PyException;
            }
            frame.getlocal(1).__call__(frame.getlocal(2), frame.getlocal(0), frame.getlocal(4));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(4);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(3, t$0$PyObject);
                frame.setlocal(3, frame.getglobal("join").__call__(frame.getlocal(0), frame.getlocal(3)));
                try {
                    frame.setlocal(5, frame.getglobal("os").__getattr__("lstat").__call__(frame.getlocal(3)));
                }
                catch (Throwable x$1) {
                    t$0$PyException = Py.setException(x$1, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("os").__getattr__("error"))) {
                        continue;
                    }
                    else throw t$0$PyException;
                }
                if (frame.getglobal("stat").__getattr__("S_ISDIR").__call__(frame.getlocal(5).__getitem__(frame.getglobal("stat").__getattr__("ST_MODE"))).__nonzero__()) {
                    frame.getglobal("walk").__call__(frame.getlocal(3), frame.getlocal(1), frame.getlocal(2));
                }
            }
            return Py.None;
        }
        
        private static PyObject expanduser$22(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyException t$0$PyException;
            PyObject t$0$PyObject;
            
            // Code
            /* Expand ~ and ~user constructions.  If user or $HOME is unknown,
                do nothing. */
            if (frame.getlocal(0).__getslice__(null, i$28, null)._ne(s$54).__nonzero__()) {
                return frame.getlocal(0);
            }
            t$0$PyObject__ = org.python.core.Py.unpackSequence(new PyTuple(new PyObject[] {i$28, frame.getglobal("len").__call__(frame.getlocal(0))}), 2);
            frame.setlocal(3, t$0$PyObject__[0]);
            frame.setlocal(2, t$0$PyObject__[1]);
            while (((t$0$PyObject = frame.getlocal(3)._lt(frame.getlocal(2))).__nonzero__() ? frame.getlocal(0).__getitem__(frame.getlocal(3))._ne(s$29) : t$0$PyObject).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(3)._add(i$28));
            }
            if (frame.getlocal(3)._eq(i$28).__nonzero__()) {
                if (frame.getglobal("os").__getattr__("environ").__getattr__("has_key").__call__(s$55).__not__().__nonzero__()) {
                    return frame.getlocal(0);
                }
                frame.setlocal(1, frame.getglobal("os").__getattr__("environ").__getitem__(s$55));
            }
            else {
                frame.setlocal(4, org.python.core.imp.importOne("pwd", frame));
                try {
                    frame.setlocal(5, frame.getlocal(4).__getattr__("getpwnam").__call__(frame.getlocal(0).__getslice__(i$28, frame.getlocal(3), null)));
                }
                catch (Throwable x$0) {
                    t$0$PyException = Py.setException(x$0, frame);
                    if (Py.matchException(t$0$PyException, frame.getglobal("KeyError"))) {
                        return frame.getlocal(0);
                    }
                    else throw t$0$PyException;
                }
                frame.setlocal(1, frame.getlocal(5).__getitem__(i$56));
            }
            if (frame.getlocal(1).__getslice__(i$28.__neg__(), null, null)._eq(s$29).__nonzero__()) {
                frame.setlocal(3, frame.getlocal(3)._add(i$28));
            }
            return frame.getlocal(1)._add(frame.getlocal(0).__getslice__(frame.getlocal(3), null, null));
        }
        
        private static PyObject expandvars$23(PyFrame frame) {
            // Temporary Variables
            PyObject[] t$0$PyObject__;
            PyObject t$0$PyObject;
            
            // Code
            /* Expand shell variables of form $var and ${var}.  Unknown variables
                are left unchanged. */
            // global _varprog
            if (s$58._notin(frame.getlocal(0)).__nonzero__()) {
                return frame.getlocal(0);
            }
            if (frame.getglobal("_varprog").__not__().__nonzero__()) {
                frame.setlocal(6, org.python.core.imp.importOne("re", frame));
                frame.setglobal("_varprog", frame.getlocal(6).__getattr__("compile").__call__(s$59));
            }
            frame.setlocal(4, i$38);
            while (i$28.__nonzero__()) {
                frame.setlocal(2, frame.getglobal("_varprog").invoke("search", frame.getlocal(0), frame.getlocal(4)));
                if (frame.getlocal(2).__not__().__nonzero__()) {
                    break;
                }
                t$0$PyObject__ = org.python.core.Py.unpackSequence(frame.getlocal(2).invoke("span", i$38), 2);
                frame.setlocal(4, t$0$PyObject__[0]);
                frame.setlocal(3, t$0$PyObject__[1]);
                frame.setlocal(1, frame.getlocal(2).invoke("group", i$28));
                if (((t$0$PyObject = frame.getlocal(1).__getslice__(null, i$28, null)._eq(s$60)).__nonzero__() ? frame.getlocal(1).__getslice__(i$28.__neg__(), null, null)._eq(s$61) : t$0$PyObject).__nonzero__()) {
                    frame.setlocal(1, frame.getlocal(1).__getslice__(i$28, i$28.__neg__(), null));
                }
                if (frame.getglobal("os").__getattr__("environ").__getattr__("has_key").__call__(frame.getlocal(1)).__nonzero__()) {
                    frame.setlocal(5, frame.getlocal(0).__getslice__(frame.getlocal(3), null, null));
                    frame.setlocal(0, frame.getlocal(0).__getslice__(null, frame.getlocal(4), null)._add(frame.getglobal("os").__getattr__("environ").__getitem__(frame.getlocal(1))));
                    frame.setlocal(4, frame.getglobal("len").__call__(frame.getlocal(0)));
                    frame.setlocal(0, frame.getlocal(0)._add(frame.getlocal(5)));
                }
                else {
                    frame.setlocal(4, frame.getlocal(3));
                }
            }
            return frame.getlocal(0);
        }
        
        private static PyObject normpath$24(PyFrame frame) {
            // Temporary Variables
            int t$0$int;
            PyObject t$0$PyObject, t$1$PyObject, t$2$PyObject, t$3$PyObject, t$4$PyObject;
            
            // Code
            /* Normalize path, eliminating double slashes, etc. */
            if (frame.getlocal(0)._eq(s$31).__nonzero__()) {
                return s$34;
            }
            frame.setlocal(1, frame.getlocal(0).invoke("startswith", s$29));
            if (((t$0$PyObject = ((t$1$PyObject = frame.getlocal(1)).__nonzero__() ? frame.getlocal(0).invoke("startswith", s$63) : t$1$PyObject)).__nonzero__() ? frame.getlocal(0).invoke("startswith", s$64).__not__() : t$0$PyObject).__nonzero__()) {
                frame.setlocal(1, i$65);
            }
            frame.setlocal(4, frame.getlocal(0).invoke("split", s$29));
            frame.setlocal(3, new PyList(new PyObject[] {}));
            t$0$int = 0;
            t$1$PyObject = frame.getlocal(4);
            while ((t$0$PyObject = t$1$PyObject.__finditem__(t$0$int++)) != null) {
                frame.setlocal(2, t$0$PyObject);
                if (frame.getlocal(2)._in(new PyTuple(new PyObject[] {s$31, s$34})).__nonzero__()) {
                    continue;
                }
                if (((t$2$PyObject = ((t$3$PyObject = frame.getlocal(2)._ne(s$51)).__nonzero__() ? t$3$PyObject : ((t$4$PyObject = frame.getlocal(1).__not__()).__nonzero__() ? frame.getlocal(3).__not__() : t$4$PyObject))).__nonzero__() ? t$2$PyObject : ((t$3$PyObject = frame.getlocal(3)).__nonzero__() ? frame.getlocal(3).__getitem__(i$28.__neg__())._eq(s$51) : t$3$PyObject)).__nonzero__()) {
                    frame.getlocal(3).invoke("append", frame.getlocal(2));
                }
                else if (frame.getlocal(3).__nonzero__()) {
                    frame.getlocal(3).invoke("pop");
                }
            }
            frame.setlocal(4, frame.getlocal(3));
            frame.setlocal(0, s$29.invoke("join", frame.getlocal(4)));
            if (frame.getlocal(1).__nonzero__()) {
                frame.setlocal(0, s$29._mul(frame.getlocal(1))._add(frame.getlocal(0)));
            }
            return (t$2$PyObject = frame.getlocal(0)).__nonzero__() ? t$2$PyObject : s$34;
        }
        
        private static PyObject abspath$25(PyFrame frame) {
            /* Return an absolute path. */
            if (frame.getglobal("isabs").__call__(frame.getlocal(0)).__not__().__nonzero__()) {
                frame.setlocal(0, frame.getglobal("join").__call__(frame.getglobal("os").__getattr__("getcwd").__call__(), frame.getlocal(0)));
            }
            return frame.getglobal("normpath").__call__(frame.getlocal(0));
        }
        
        private static PyObject main$26(PyFrame frame) {
            frame.setglobal("__file__", s$67);
            
            /* Common operations on Posix pathnames.
            
            Instead of importing this module directly, import os and refer to
            this module as os.path.  The "os.path" name is an alias for this
            module on Posix systems; on other systems (e.g. Mac, Windows),
            os.path provides the same operations in a manner specific to that
            platform, and is an alias to another module (e.g. macpath, ntpath).
            
            Some of this can actually be useful on non-Posix systems too, e.g.
            for manipulation of the pathname component of URLs.
             */
            frame.setlocal("os", org.python.core.imp.importOne("os", frame));
            frame.setlocal("stat", org.python.core.imp.importOne("stat", frame));
            frame.setlocal("__all__", new PyList(new PyObject[] {s$1, s$2, s$3, s$4, s$5, s$6, s$7, s$8, s$9, s$10, s$11, s$12, s$13, s$14, s$15, s$16, s$17, s$18, s$19, s$20, s$21, s$22, s$23, s$24, s$25}));
            frame.setlocal("normcase", new PyFunction(frame.f_globals, new PyObject[] {}, c$0_normcase));
            frame.setlocal("isabs", new PyFunction(frame.f_globals, new PyObject[] {}, c$1_isabs));
            frame.setlocal("join", new PyFunction(frame.f_globals, new PyObject[] {}, c$2_join));
            frame.setlocal("split", new PyFunction(frame.f_globals, new PyObject[] {}, c$3_split));
            frame.setlocal("splitext", new PyFunction(frame.f_globals, new PyObject[] {}, c$4_splitext));
            frame.setlocal("splitdrive", new PyFunction(frame.f_globals, new PyObject[] {}, c$5_splitdrive));
            frame.setlocal("basename", new PyFunction(frame.f_globals, new PyObject[] {}, c$6_basename));
            frame.setlocal("dirname", new PyFunction(frame.f_globals, new PyObject[] {}, c$7_dirname));
            frame.setlocal("commonprefix", new PyFunction(frame.f_globals, new PyObject[] {}, c$8_commonprefix));
            frame.setlocal("getsize", new PyFunction(frame.f_globals, new PyObject[] {}, c$9_getsize));
            frame.setlocal("getmtime", new PyFunction(frame.f_globals, new PyObject[] {}, c$10_getmtime));
            frame.setlocal("getatime", new PyFunction(frame.f_globals, new PyObject[] {}, c$11_getatime));
            frame.setlocal("islink", new PyFunction(frame.f_globals, new PyObject[] {}, c$12_islink));
            frame.setlocal("exists", new PyFunction(frame.f_globals, new PyObject[] {}, c$13_exists));
            frame.setlocal("isdir", new PyFunction(frame.f_globals, new PyObject[] {}, c$14_isdir));
            frame.setlocal("isfile", new PyFunction(frame.f_globals, new PyObject[] {}, c$15_isfile));
            frame.setlocal("samefile", new PyFunction(frame.f_globals, new PyObject[] {}, c$16_samefile));
            frame.setlocal("sameopenfile", new PyFunction(frame.f_globals, new PyObject[] {}, c$17_sameopenfile));
            frame.setlocal("samestat", new PyFunction(frame.f_globals, new PyObject[] {}, c$18_samestat));
            frame.setlocal("ismount", new PyFunction(frame.f_globals, new PyObject[] {}, c$19_ismount));
            frame.setlocal("walk", new PyFunction(frame.f_globals, new PyObject[] {}, c$20_walk));
            frame.setlocal("expanduser", new PyFunction(frame.f_globals, new PyObject[] {}, c$21_expanduser));
            frame.setlocal("_varprog", frame.getname("None"));
            frame.setlocal("expandvars", new PyFunction(frame.f_globals, new PyObject[] {}, c$22_expandvars));
            frame.setlocal("normpath", new PyFunction(frame.f_globals, new PyObject[] {}, c$23_normpath));
            frame.setlocal("abspath", new PyFunction(frame.f_globals, new PyObject[] {}, c$24_abspath));
            return Py.None;
        }
        
    }
    public static void moduleDictInit(PyObject dict) {
        dict.__setitem__("__name__", new PyString("posixpath"));
        Py.runCode(new _PyInner().getMain(), dict, dict);
    }
    
    public static void main(String[] args) throws java.lang.Exception {
        String[] newargs = new String[args.length+1];
        newargs[0] = "posixpath";
        System.arraycopy(args, 0, newargs, 1, args.length);
        Py.runMain(posixpath._PyInner.class, newargs, posixpath.jpy$packages, posixpath.jpy$mainProperties, "", new String[] {"socket", "ftplib", "Parser", "UserDict", "Styles", "code", "MailClient", "pawt.swing", "macurl2path", "rfc822", "string", "Keymap", "WebAgent", "threading", "tempfile", "repr", "base64", "atexit", "Console", "sre", "StringIO", "copy_reg", "ScriptUtils", "random", "getopt", "Action", "nturl2path", "mimetools", "httplib", "sre_parse", "sre_compile", "quopri", "poplib", "traceback", "sre_constants", "javapath", "urllib", "SocketServer", "pawt.colors", "re", "mimetypes", "posixpath", "pawt.__init__", "AgentServer", "BaseHTTPServer", "SMSClient", "gopherlib", "stat", "linecache", "FTPClient", "javaos", "copy", "Browser", "smtplib"});
    }
    
}
