'''
Programmable Web Browser v 2.0
Module : FTP Client
Last Updated : 28 January 2002
Programmer : Thanawat Keawka
                        Boontawee Suntisrivaraporn
Professor : Dr. Visit Hirankitti                        
===========================================
System Requirement
- Java 1.3
- Jython 2.1
- Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2

'''

import os
import sys
import ftplib

# import Java Modult
from java.lang import *
from javax.swing import *
from java.awt import *
from java.awt.event import *
from java.net import *
from java.io import File

# import Python Module
from thread import *
import string

FTP_PROFILE = 'ftp.profile'

class FTPClientFrame(JFrame) :
    '''FTPClientFrame([root, child]) -> FTPClientFrame Object'''
    class MyMouseAdapter(MouseAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def mouseClicked(self, event) :
            if event.getClickCount()==2 :   # double clicked
                if event.getSource()==self.parent.listLocal :
                    abs = os.path.join(self.parent.path, self.parent.listLocal.getSelectedValue())
                    self.parent.cdLocal(abs, 0)    # no alert
                elif event.getSource()==self.parent.listRemote :
                    abs = self.parent.tfCWDRemote.getText() + '/' + self.parent.listRemote.getSelectedValue()
                    self.parent.cdRemote(abs, 0)    # no alert
                    
    class MyMouseListener_bt(MouseListener) :
        def __init__(self, parent) :
            self.parent = parent
        def mouseClicked(self, event) :
            pass
        def mouseEntered(self, event) :
            event.getComponent().setBorderPainted(1)
        def mouseExited(self, event) :
            event.getComponent().setBorderPainted(0)
        def mousePressed(self, event) :
            pass
        def mouseReleased(self, event) :
            pass

    class MyCellRenderer(JLabel, ListCellRenderer) :
        def __init__(self, path) :
            self.path = path
            self.folderIcon = ImageIcon(r"images/folder.gif")
            self.fileIcon = ImageIcon(r"images/file.gif")
        def getListCellRendererComponent(self, list, value, index, isSelected, cellHasFocus) :
            #path = self.parent.tfCWDLocal.getText()
            file = str(value)
            self.setText(file)
            #self.setHeight(15)
            if os.path.isdir(os.path.join(self.path, file)) :
                self.setIcon(self.folderIcon)
            elif os.path.isfile(os.path.join(self.path, file)) :
                self.setIcon(self.fileIcon)
            if (isSelected) :
                #self.setBackground(Color(0,0,0));
                self.setForeground(Color(30,80,200));
            else :
                self.setBackground(list.getBackground());
                self.setForeground(list.getForeground());
            self.setEnabled(list.isEnabled())
            #self.setFont(Font('Arial', Font.BOLD, 12))
            return self 

    class MyWindowAdapter(WindowAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def windowClosing(self, event) :
            #self.parent.finalize()
            self.parent.finalize()
            self.parent.dispose()
            if self.parent.exit_when_term :
                sys.exit(0)

    # =============== Constructor ==============
    def __init__(self, root="", child=1, agent=None) :
        self.agent = agent
        self.path = root
        self.exit_when_term = not child # if child, don't exit program

        self.initialize()
        self.buildGUI()

    def buildGUI(self) :        
        self.setSize(600, 500)
        self.setTitle('PWB - FTP Client')
        self.setIconImage(ImageIcon(r'images/gear.gif').getImage())
        self.addWindowListener(self.MyWindowAdapter(self))
       
        # Panel
        self.left = JPanel(BorderLayout())
        self.left_top = JPanel(BorderLayout())
        self.right = JPanel(BorderLayout())
        self.right_top = JPanel(BorderLayout())
        self.bottom = JPanel(FlowLayout())

        self.splitter = JSplitPane(JSplitPane.HORIZONTAL_SPLIT, 1, self.left, self.right)
        self.splitter.setResizeWeight(0.5)
        self.splitter.setEnabled(1)

        # component on left-hand side
        self.tfCWDLocal = JTextField(actionPerformed=self.onCWDLocal)
        self.tfCWDLocal.setToolTipText("Local Current Working Directory")
        self.btUpLocal = JButton(ImageIcon(r'images/up.gif'), actionPerformed=self.onUpLocal)
        self.btUpLocal.addMouseListener(self.MyMouseListener_bt(self))
        self.btUpLocal.setBorderPainted(0)
        self.btUpLocal.setPreferredSize(Dimension(27,27))
        self.btUpLocal.setToolTipText('Up one level')
        self.listLocal = JList()
        self.listLocal.addMouseListener(self.MyMouseAdapter(self))
        
        # component on right-hand side        
        self.tfCWDRemote = JTextField(actionPerformed=self.onCWDRemote)
        self.tfCWDRemote.setToolTipText("Remotel Current Working Directory")
        self.btUpRemote = JButton(ImageIcon(r'images/up.gif'), actionPerformed=self.onUpRemote)
        self.btUpRemote.addMouseListener(self.MyMouseListener_bt(self))
        self.btUpRemote.setBorderPainted(0)
        self.btUpRemote.setPreferredSize(Dimension(27,27))
        self.btUpRemote.setToolTipText('Up one level')
        self.listRemote = JList()
        self.listRemote.addMouseListener(self.MyMouseAdapter(self))

        self.btDownload = JButton("Download", ImageIcon(r'images/ftp2.gif'), actionPerformed=self.onDownload)    
        self.btDownload.addMouseListener(self.MyMouseListener_bt(self))
        #self.btDownload.setPreferredSize(Dimension(40,35))
        self.btDownload.setBorderPainted(0)
        self.btDownload.setToolTipText("Download selected file")
        self.btUpload = JButton("Upload", ImageIcon(r'images/ftp.gif'), actionPerformed=self.onUpload)
        self.btUpload.addMouseListener(self.MyMouseListener_bt(self))
        #self.btUpload.setPreferredSize(Dimension(40,35))
        self.btUpload.setBorderPainted(0)
        self.btUpload.setToolTipText("Upload selected file")
        self.btConnect = JButton("Connect", ImageIcon(r'images/login.gif'), actionPerformed=self.onConnect)
        self.btConnect.addMouseListener(self.MyMouseListener_bt(self))
        #self.btConnect.setPreferredSize(Dimension(40,35))
        self.btConnect.setBorderPainted(0)
        self.btConnect.setToolTipText("Login")
        self.btDisconnect = JButton("Disconnect", ImageIcon(r'images/shutdown.gif'), actionPerformed=self.onDisconnect)
        self.btDisconnect.addMouseListener(self.MyMouseListener_bt(self))
        #self.btDisconnect.setPreferredSize(Dimension(40,35))
        self.btDisconnect.setBorderPainted(0)
        self.btDisconnect.setToolTipText("Disconnect")
        
        self.contentPane.setLayout(BorderLayout())

        #self.contentPane.add(self.top, BorderLayout.NORTH)        
        self.contentPane.add(self.splitter, BorderLayout.CENTER)
        self.contentPane.add(self.bottom, BorderLayout.SOUTH)

        self.left_top.add(self.tfCWDLocal, BorderLayout.CENTER)
        self.left_top.add(self.btUpLocal, BorderLayout.EAST)
        self.left.add(self.left_top, BorderLayout.NORTH)
        self.left.add(JScrollPane(self.listLocal), BorderLayout.CENTER)
        self.left_top.add(JLabel("Local File Explorer", ImageIcon(r"images/local.gif"), JLabel.CENTER), BorderLayout.NORTH)

        self.right_top.add(self.tfCWDRemote, BorderLayout.CENTER)
        self.right_top.add(self.btUpRemote, BorderLayout.EAST)
        self.right.add(self.right_top, BorderLayout.NORTH)
        self.right.add(JScrollPane(self.listRemote), BorderLayout.CENTER)
        self.right_top.add(JLabel("Remote File Explorer", ImageIcon(r"images/remote.gif"), JLabel.CENTER), BorderLayout.NORTH)
        
        self.bottom.add(self.btDownload)
        self.bottom.add(self.btUpload)
        self.bottom.add(self.btConnect)
        self.bottom.add(self.btDisconnect)

        self.buildLoginDialog()

        # change the look and feel of the GUI
        if not self.agent :
            app_style = 'com.sun.java.swing.plaf.windows.WindowsLookAndFeel'
        elif self.agent.user_lookandfeel == 'Metal' :
            app_style = 'javax.swing.plaf.metal.MetalLookAndFeel'
        elif self.agent.user_lookandfeel == 'Motif' :
            app_style = 'com.sun.java.swing.plaf.motif.MotifLookAndFeel'
        elif self.agent.user_lookandfeel == 'Windows' :
            app_style = 'com.sun.java.swing.plaf.windows.WindowsLookAndFeel'            
        else :
            app_style = UIManager.getSystemLookAndFeelClassName()
            
        UIManager.setLookAndFeel(app_style)
        SwingUtilities.updateComponentTreeUI(self)
        
        
        #=================================================
        self.isConnected = 0
        # find out the upper level drive letter
        roots = File.listRoots()
        self.drives = []
        for drive in roots :
            self.drives.append(drive.getPath())

        # default path at local
        if self.path == None :
            self.path = ""
        self.cdLocal(self.path)
    
    def buildLoginDialog(self) :
        self.loginPane = JPanel(GridLayout(3, 1))        
        self.loginPane.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Log in to FTP-Server") )
        serv_panel = JPanel(FlowLayout(FlowLayout.LEFT))
        user_panel = JPanel(FlowLayout(FlowLayout.LEFT))
        pass_panel = JPanel(FlowLayout(FlowLayout.LEFT))

        self.serv_tf = JTextField(self.default_server)
        self.serv_tf.setPreferredSize(Dimension(150, 20))
        self.serv_tf.setToolTipText("FTP server location")
        self.user_tf = JTextField(self.default_username)
        self.user_tf.setPreferredSize(Dimension(150, 20))
        self.user_tf.setToolTipText("Username")
        self.pass_pf = JPasswordField(self.default_password)
        self.pass_pf.setPreferredSize(Dimension(150, 20))
        self.pass_pf.setToolTipText("Password")

        serv_panel.add(JLabel("Server  :       "))
        serv_panel.add(self.serv_tf)
        user_panel.add(JLabel("User :           "))
        user_panel.add(self.user_tf)
        pass_panel.add(JLabel("Password  : "))
        pass_panel.add(self.pass_pf)
        
        self.loginPane.add(serv_panel)
        self.loginPane.add(user_panel)
        self.loginPane.add(pass_panel)

    def initialize(self) :
        self.default_password = ''
        self.default_server = ''
        self.default_username = ''
        try :
            if self.agent :
                path = self.agent.user_path + FTP_PROFILE
            else :
                path = 'profiles/' + FTP_PROFILE
            f = open(path)
            lines = map(string.strip, f.readlines())
            f.close()            
        except :
            print "<<FTP>> Profile not found"
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'server' :
                    self.default_server = value
                elif key == 'username' :
                    self.default_username = value
                elif key == 'password' :
                    self.default_password = value
        except :
            print "<<FTP>> FTP-Profile file corrupt"
        
    def finalize(self) :
        try :
            if self.agent :
                path = self.agent.user_path + FTP_PROFILE
            else :
                path = 'profiles/' + FTP_PROFILE
            f = open(path, 'w')                
        except :
            print "<<FTP>> Profile not found"
        lines = "server :: %s\nusername :: %s\npassword :: %s" % (self.serv_tf.text, self.user_tf.text, self.pass_pf.text)
        try :
            f.write(lines)
            f.close()
        except :
            print "<<FTP>> Error writing profile"

    def validateAll(self) :
        self.initialize()
        self.serv_tf.text = self.default_server
        self.user_tf.text = self.default_username
        self.pass_pf.text = self.default_password
        
    def onDownload(self, event) :
        if not self.isConnected :
            return
        # prepare parametor for downloading
        remoteFiles = self.listRemote.getSelectedValues()
        if len(remoteFiles)==0 :
            JOptionPane.showMessageDialog(self, 'Select remote file(s) to download')
            return
        localPath = self.path
        start_new_thread(self._downloading, (remoteFiles, localPath))

    # used by external
    def downloadFile(self, remoteFile, localPath) :
        # prepare parametor for downloading
        p = remoteFile.rfind('/')
        remotePath = remoteFile[ : p]        
        filename = remoteFile[p+1: ]
        print remotePath
        self.cdRemote(remotePath)
        remoteFiles = (filename, )
        result = self._downloading(remoteFiles, localPath)
        return result
        
    def _downloading(self, remoteFiles, localPath) :
        # change the way of cursor appear, so that user can be noticed the working
        self.setCursor( Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR ) )
        try :
            for remoteFile in remoteFiles :
                abs = os.path.join(localPath, remoteFile)
                print "<<FTP>> Starting download file to : " + abs
                f = open(abs, 'wb')
                self.connection.retrbinary('RETR ' + remoteFile, f.write, 30000)
                f.close()
                print "<<FTP>> Download file complete : " + abs + " <<"
        except :
            self.setCursor( Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR ) )
            print "<<FTP>> Error while downloading"
            return 0
        #refresh the local-file list
        self.cdLocal(self.path)
        # change cursor back to normal condition
        self.setCursor( Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR ) )
        return 1
        
    def onUpload(self, event) :
        if not self.isConnected :
            return
        # prepare parametor for downloading
        localFiles = self.listLocal.getSelectedValues()
        if len(localFiles)==0 :
            JOptionPane.showMessageDialog(self, 'Select local file(s) to upload')
            return
        localPath = self.path
        remotePath = self.tfCWDRemote.getText()
        self.cdRemote(remotePath)
        start_new_thread(self._uploading, (localFiles, remotePath))

    # used by external
    def uploadFile(self, localFile, remotePath) :
        # prepare parametor for downloading
        self.path, filename = os.path.split(localFile)
        localFiles = (filename, )
        self.cdRemote(remotePath)
        result = self._uploading(localFiles, remotePath)
        return result   

    def _uploading(self, localFiles, remotePath) :        
        # change the way of cursor appear, so that user can be noticed the working
        self.setCursor( Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR ) )
        try :
            for localFile in localFiles :
                if os.path.isdir(os.path.join(self.path, localFile)) :
                    continue
                abs = os.path.join(self.path, localFile)
                print "<<FTP>> Starting upload file : " + abs
                f = open(abs, 'r')
                self.connection.storbinary('STOR ' + localFile, f, 30000)
                f.close()
                print "<<FTP>> Upload file complete : " + abs + " >>"
        except :
            self.setCursor( Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR ) )
            print "<<FTP>> Error while uploading"
            return 0
        # refresh the remote-file list
        self.cdRemote(self.tfCWDRemote.getText())        
        # change cursor back to normal condition
        self.setCursor( Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR ) )
        return 1
 
    def onDisconnect(self, event, alert=1) :
        if not self.isConnected :
            print "<<FTP>> No connection establish"
            if alert :
                JOptionPane.showMessageDialog(self, "No connection!")
            return
        if alert :
            result = JOptionPane.showConfirmDialog(self,
                                               'Terminat current connection?',
                                               'Disconnect',
                                               JOptionPane.YES_NO_OPTION)
            if result==JOptionPane.NO_OPTION :
                return
        print "<<FTP>> Disconnect FTP server"
        self.connection.close()
        self.isConnected = 0
        self.tfCWDRemote.setText('')
        self.listRemote.setListData(())

    def onConnect(self, event, alert=1) :
        if (self.isConnected and alert) :
            result = JOptionPane.showConfirmDialog(self,
                                                   'Discard current connection?',
                                                   'Connect',
                                                   JOptionPane.YES_NO_OPTION)
            if result==JOptionPane.NO_OPTION :
                return
        if alert :
            result = JOptionPane.showConfirmDialog(self,
                                               self.loginPane,
                                               'Connection',
                                               JOptionPane.YES_NO_OPTION,
                                               -1 )
            if result!=JOptionPane.YES_OPTION :
                return
        host = self.serv_tf.getText()
        user = self.user_tf.getText()
        passwd = self.pass_pf.getText()
        try :
            self.connection = ftplib.FTP(host, user, passwd)
            listDir = self.connection.nlst()
            self.listRemote.setListData(listDir)
            self.tfCWDRemote.setText(self.connection.pwd())
            print "<<FTP>> Connect to FTP server : ", host, " as user : ", user
            if alert :
                JOptionPane.showMessageDialog(self, self.connection.welcome, 'Welcome', JOptionPane.INFORMATION_MESSAGE)
            self.isConnected = 1
            return 1
        except :
            print "<<FTP>> Connot connect to server"
            if alert :
                JOptionPane.showMessageDialog(self, 'Cannot connect to server')
            return 0
        
    def showConnectionDialog(self) :
        pass
    
    def onUpLocal(self, event, alert=1) :
        if self.path in self.drives :
            parent = ""
        else :
            parent = File(self.path).getParent() #os.path.dirname(self.path)
            if parent == None :
                return
        self.cdLocal(parent, alert)
        
    def onUpRemote(self, event, alert=1) :
        if self.isConnected :
            self.connection.cwd('..')
            self.cdRemote(self.connection.pwd(), alert)

    def onCWDLocal(self, event, alert=1) :
        self.cdLocal(self.tfCWDLocal.getText(), alert)
    
    def onCWDRemote(self, event, alert=1) :
        if self.isConnected :
            self.cdRemote(self.tfCWDRemote.getText(), alert)
            
    def cdRemote(self, path, alert=1) :
        try :
            self.connection.cwd(path)
            listDir = self.connection.nlst()
            listTable = []
            for file in listDir :
                listTable.append((None, file))
            listDir.sort()
            listTable.sort()
            self.tfCWDRemote.setText(path)
            self.listRemote.setListData(listDir)
            print "<<FTP>> Remote : ", path
        except :
            print "<<FTP>> No remote path found"
            if alert :
                JOptionPane.showMessageDialog(self, 'No remote path found')
            return        

    def cdLocal(self, path, alert=1) :
        print self.drives
        if path == "" :
            self.path = ""
            listDir = self.drives
            print "<<FTP>> Local : root"
        elif not os.path.exists(path) :
            print "<<FTP>> Not local path found"
            if alert :
                JOptionPane.showMessageDialog(self, 'No local path found')      
            return
        elif not os.path.isdir(path) :
            print "<<FTP>> No such directory"
            return
        else :
            self.path = path
            listDir = os.listdir(path)
            print "<<FTP>> Local : ", path
        listTable = []
        for file in listDir :
            if os.path.isdir(os.path.join(path, file)) :
                type = 'Directory'
            else :
                type = 'File'
            listTable.append((type,file))        
        self.tfCWDLocal.setText(path)
        listTable.sort()
        self.listLocal.setListData(listDir)
        self.listLocal.setCellRenderer(self.MyCellRenderer(self.tfCWDLocal.getText()))
        #self.listLocal.addMouseListener(self.MyMouseAdapter(self))
    
if __name__ == '__main__' :
    frame = FTPClientFrame(None, 0)   # input empty path to use profile instead    
    frame.show()
    