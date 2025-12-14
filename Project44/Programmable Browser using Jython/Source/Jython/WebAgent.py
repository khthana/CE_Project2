'''
Programmable Web Browser v 2.1a2
Module : WebAgent Module [ Main module ]
Last Updated : 12 February 2002
Programmer : Thanawat Keawka
                        Boontawee Suntisrivaraporn
Professor : Dr. Visit Hirankitti                        
===========================================
System Requirement
- Java 1.3
- Jython 2.1
- Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2

'''

'''
    self.current_event_list is list of lists
    each item in self.current_event_list has this format
        [Event type, Flag, Event, Action]
    for example
        ['time', 'active', '2002/02/05 11:32', 'warnMessage("hello")']
    when save to file each item is seperated by '&'
    trick
        can add addition parameter to the end of each item list during polling item
'''

# import Java Module
from java.awt import *
from java.awt.event import *
from javax.swing import *
from javax.swing.event import *
#from javax.swing.plaf.basic import BasicComboPopup
from java.net import URL
from javax.swing.text import *
from javax.swing.text.html import *
from java.lang import Runnable
from java.util import Date, Calendar
from java.io import *

# import Python Module
import sys
import os
import traceback
import time
from thread import *
import string
import poplib, rfc822

# import my module
import Browser
import FTPClient
import MailClient
import SMSClient
from Parser import *
from ScriptUtils import *
# this import is used to create agentNameSpace instead of using real ScriptUtils.py file for security reason
import ScriptUtils
import Console

# ================= constant global declare here =====================
USER_PROFILE_PATH = './user-profiles/'
IMAGE_PATH = './images/'
SOUND_PATH = './sounds/'
MIDI_PATH = './sounds/midi/'
WAV_PATH = './sounds/wav/'
SCRIPT_PATH = './scripts/'
LIST_PATH = './lists/'
DEFAULT_USER_PATH = './user-profiles/Default-User/'

USER_PROFILE_FILE = 'user.profile'
DEFAULT_SCRIPT_FILE = 'default.script'
DEFAULT_LIST_FILE = 'default.list'
BROWSER_FAV_FILE = 'favorites.txt'
BROWSER_CACHE_FILE = 'cache.txt'
FTP_PROFILE = 'ftp.profile'
FTP_FAV_FILE = 'ftp_fav.txt'
MAIL_PROFILE = 'mail.profile'
MAIL_BOOK = 'mailbook.txt'
SMS_PROFILE = 'sms.profile'
PHONE_BOOK = 'phonebook.txt'
SETTING_FILE = 'settings.txt'

MY_HEADER = '''
Programmable Web Browser v2.1b3
Program by : Boontawee, Thanawat
Copyright 2001-2002, All Rights Reserved
'''
HTML_ABOUT_MSG = '''
<html><center><h3><font color="red">Web Agent for PWB  v2.1a2</font></h3></center>
<p><b>Program by</b> <i><br>Thanawat Keawka<br>Boontawee Suntisrivaraporn</i>
<br>Copyright &copy; 2001-2002
<br>All Rights Reserved
<p><b>email :</b> <a href="mailto:meng234@hotmail.com"<i>meng234@hotmail.com<i></a>
</html>
'''

# ===========================================================
# Description for all action in event mode
actionDes = {
    'showMessage()'             : 'param1 = Message',
    'checkMail()'                   : 'param1 = Mail Server\nparam2 = Username\nparam3 =Password',
    'closeAgent()'                  : '',
    'sendMail()'                    : 'param1 = To address\nparam2 = From address\nparam3 = Subject\nparam4 = Body',
    'sendSMS()'                     : 'param1 = Telephone number\nparam2 = Message\n[param3]=Server index\n[param4]=Password',
    'playMidi()'                    : 'param1 = midi file name',
    'playWav()'                     : 'param1 = midi file name',
    'openWebPage()'              : '[param1] = URL',
    'shutdownComputer()'    : '[param1] = Mode [0=shutdown,1=restart]',
    'sendLANMessage()'      : 'param1 = Destination IP\nparam2 = Message',
    'startFile()'                   : 'param1 = Path file',
    'Alert()'                       : 'param1 = Message\n[param2] = Function to be run by Runtime-binded button\n[param2] = Time the Alert last\n[param3] = Position of Alert',
    'uploadFile()'               : 'param1 = FTP host\nparam2 = User name\nparam3 = Password\nparam4 = Local pathfile\nparam5 = Remote path',
    'downloadFile()'               : 'param1 = FTP host\nparam2 = User name\nparam3 = Password\nparam4 = Remote pathfile\nparam5 = Local path'
}
# Initial parameter (Hint for enter parameter)
actionParam = {
    'showMessage()'             : '"Message"',
    'checkMail()'                   : 'my.mail.server, my,mail.address, my.mail.password',
    'closeAgent()'                  : '',
    'sendMail()'                        : '"to@host", "from@host", "subject", "message"',
    'playMidi()'                    : '"sounds/midi/melody.midi"',
    'playWav()'                     : '"sounds/wav/NEWS.wav"',
    'sendSMS()'                     : '"01xxxxxxx","message here"',
    'openWebPage()'               : '"http://www..com"',
    'shutdownComputer()'        : '0',
    'sendLANMessage()'          : '"127.0.0.1", "message here"',
    'startFile()'                       : '"./kmitl.jpg"',
    'Alert()'                           : '"Alert"',
    'uploadFile()'                  : 'my.ftp.server, my.ftp.username, my.ftp.password, "", ""',
    'downloadFile()'                : 'my.ftp.server, my.ftp.username, my.ftp.password, "", ""'
}

# canned script used as a template for ease of use
can1_tip = '''<html><font color=blue><i><center>Canned script 1</center></i></font><br>
    sequential> <br>
    /sequential> <br>
    parallel> <br>
    /parallel> <br>
    event> <br>
    /event> <br>
    </html>'''
can1_script = '''
<sequential>

</sequential>

<parallel>

</parallel>

<event>

</event>
'''
can2_tip = '''<html><font color=blue><i><center>Canned script 2</center></i></font><br>
    ftp = FTP("") <br>
    username = <br>
    password = <br>
    ftp.login(username, password) <br>
    local = <br>
    remote = <br>
    ftp.get(remote, local) <br>
    ftp.close() <br>
    </html>'''
can2_script = '''
ftp = FTP("")
'''
can3_tip = '''<html><font color=blue><i><center>Canned script 3</center></i></font><br>
    website = WebSite("") <br>
    website.showCurPage() <br>
    <br>
    filename = <br>
    f = open(filename) <br>
    source = website.getHomeSource() <br>
    f.write(source) <br>
    f.close() <br>
    </html>'''
can3_script = '''
website = WebSite("")
'''

class AgentFrame(JFrame) :

    class MyWindowAdapter(WindowAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def windowClosing(self, event) :
            self.parent.finalize()
            sys.exit(0)

    class MyMouseListener_bt(MouseListener) :
        def __init__(self, parent=None) :
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

    class MyMouseAdapter_list(MouseAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def mouseClicked(self, event) :
            if event.getClickCount()==2 :   # double clicked
                self.parent.onEditAction(event)

    class MyFileFilter(filechooser.FileFilter) :
        def __init__(self, ext, desc) :
            filechooser.FileFilter.__init__(self)
            self.filters = {}
            #self.description = ""
            self.addExtension(ext)
            #self.setDescription(desc)            
        def accept(self, f) :
            pass
        def getExtention(self, f) :
            return ""
        def addExtension(self, ext) :
            self.filters[ext.lower()] = self
        def getDescription(self) :
            return self.description
        def setDescription(self, desc) :
            #self.description = desc
            pass

    class MyCellRenderer(JLabel, ListCellRenderer) :
        def __init__(self, main) :
            self.main = main
            self.doneIcon = ImageIcon(IMAGE_PATH + 'done.gif')
            self.activeIcon = ImageIcon(IMAGE_PATH + 'active.gif')
            self.failIcon = ImageIcon(IMAGE_PATH + 'fail.gif')
            self.haltIcon = ImageIcon(IMAGE_PATH + 'halt.gif')            
        def getListCellRendererComponent(self, list, value, index, isSelected, cellHasFocus) :
            #path = self.parent.tfCWDLocal.getText()
            event, action = map(string.strip, str(value).split('->') ) # get event, action from event -> action

            p = event.find(' ')
            status = event[0:p].strip()
            event = event[p+1 : ].strip()
            if event.find('@') != -1 : # email event
                p1 = event.find(':')
                show = "Mail received-[%s] -> %s" % (event[ : p1].strip(), action)
            else :  # time event
                show = event + ' -> ' + action
            # set property of JList cell here
            self.setText(show)
            #self.setHeight(15)            
            if status=="done" :
                self.setIcon(self.doneIcon)
            elif status=="fail" :
                self.setIcon(self.failIcon)
            elif status=="active" :
                self.setIcon(self.activeIcon)
            elif status=="halt" :
                self.setIcon(self.haltIcon)
            else :
                    status=="halt"
            if (isSelected) :
                self.setForeground(Color(30,80,200))
            else :
                self.setForeground(list.getForeground())
            # make the list font to be bold
            self.setBackground(list.getBackground())
            self.setFont(Font('Arial', Font.BOLD, 12))
            self.setToolTipText(status.capitalize())
            self.setEnabled(list.isEnabled())
            return self

    class MyDocumentListener(DocumentListener) :
        def __init__(self, parent) :
            self.parent = parent
        def changedUpdate(self, event) :
            pass
        def insertUpdate(self, event) :
            self.parent.onScriptChanged(event)
        def removeUpdate(self, event) :
            pass

    class MyListSelectionListener_popup(ListSelectionListener) :
        def __init__(self, parent) :
            self.parent = parent
        def valueChanged(self, event) :
            event.getSource().ensureIndexIsVisible(event.getSource().getSelectedIndex())        
                
    class MyMouseListener_popup(MouseAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def mouseClicked(self, event) :
            if event.getButton() == MouseEvent.BUTTON3 :    # close
                # dispose
                self.parent.popup.hide()
                self.parent.popup = None
                self.parent.script_editor.requestFocus()
            elif (event.getClickCount() == 2) :   # get item
                # insert select item to script editor
                self.parent.script_editor.insert(str(event.getSource().getSelectedValue()), self.parent.curPos)
                # dispose
                self.parent.popup.hide()
                self.parent.popup = None
                self.parent.script_editor.requestFocus()
            else :
                return                
    
    def declareallmember(self) :
        self.current_script_name = ''
        self.current_event_list_name = ''
        self.original_script = ''
        self.current_event_list = []
        self.status = None
        self.time_status = ''

        self.isConsoleToNameSpace = 1 # true
    
        self.current_browser = []
        # ========= JFrame handler used when specified program is called for fast =========
        self.browserFrame = None
        self.ftpFrame = None
        self.mailFrame = None
        self.smsFrame = None
        self.actionDialog = None
        self.profileDialog = None
        self.popup = None
        
        # ================ user information ==============
        # working directory for each login user
        self.user_path = ''
        self.user_name = ''
        self.user_password = ''
        self.user_email = ''
        self.user_lookandfeel = 'Windows'
        # boolean indicate if the server time enable
        self.user_servertime = 1
        # boolean indicate if the sound enable
        self.user_sound = 1
        # script file name used at the startup time, to run it
        self.user_startupscript = ''
        
##################################################################################################
###########################  Constructor of MAIN class :: WebAgent #######################################
################################################################################################
        
    def __init__(self) :
        # ====== get global variable : status to inform the current working =========
        global status

        status.setText('creating NameSpace')
        #######################################
        # ====== this is Name Space of agent's script =================
        self.agentNameSpace = {} #globals()
        #execfile("ScriptUtils.py", self.agentNameSpace)
        for each in dir(ScriptUtils) :
            self.agentNameSpace[each] = eval('ScriptUtils.' + each)
            status.setText('creating NameSpace : ' + each)
        self.agentNameSpace['AGENT'] = self
        # ==================================================
        '''
        # ======== Load the language for GUI =======================
        if language == 'Thai' :
            from ThaiLangSetting import *
        elif language == 'English' :
            from EngLangSetting import *
        else :
            print "<<Agent>> Language not support"
            return None
        '''

        status.setText('Building GUI component')
        #####################################
        self.declareallmember()
        self.setSize(320, 380)
        self.setTitle('PWB - Agent')
        self.setIconImage(ImageIcon(IMAGE_PATH + 'gear.gif').getImage())
        self.contentPane.setLayout(BorderLayout())
        self.center = JPanel(BorderLayout())
        self.contentPane.add(self.center, BorderLayout.CENTER)
        self.buildMenuBar()
        self.buildToolBar()
        self.buildStatusBar()
        self.buildTabbedPane()
        
        self.addWindowListener(self.MyWindowAdapter(self))
        #UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel")
        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName())
        SwingUtilities.updateComponentTreeUI(self)

        status.setText('Building default tools')
        #####################################
        self.buildDefaultTools()        

        # ---- initialize must be called imediatly after GUI have been build and login
        #self.initialize()

        status.setText('Starting time and mail manager')
        ######################################
        # this is the three event-manager process; waiting for new coming event
        start_new_thread(self.timing, () )
        start_new_thread(self.mailChecking, () )
        start_new_thread(self.othersEvent, () )

        # this task must be done after user login
        #status.setText('Set local time by Time-Server')
        ######################################
        #self.synchronizeTime()

    def initialize(self) :
        if self.user_name == 'Default-User' :
            return
        ###### set defaultCode
        try :
            f = open(self.user_path + DEFAULT_SCRIPT_FILE, 'r')
            defaultCode = f.read()
            f.close()
            print "<<Agent>> Load default script"
        except :
            print "<<Agent>> Default-script file not found"
            defaultCode = ""
            
        self.script_editor.setText(defaultCode)
        self.original_script = defaultCode

        ###### set defaultList
        try :
            f = open(self.user_path + DEFAULT_LIST_FILE, 'r')
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load default list"
        except :
            print "<<Agent>> Default-list file not found"
            
        defaultList = []
        for line in lines :
            if not line.strip() :
                continue
            item = line.strip().split("&")
            if len(item) != 4 :
                print "<<Agent>> List file corrupt"
                break
            item[1] = 'halt'
            defaultList.append(item)            
        listToDisplay = self.convertToDisplay(defaultList)        
        self.event_list.setListData(listToDisplay)  #set to Jlist
        self.current_event_list = defaultList        #assign to current list            

        ###### set my.browser object
        try :
            f = open(self.user_path + BROWSER_FAV_FILE, 'r')
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load Browser-Favorite"
        except :
            print "<<Agent>> Browser-Favorite not found"
        favorites = {}
        try :
            for line in lines :                
                favName, favURL = map(string.strip, line.split('::'))
                if (not favName) :
                    continue
                favorites[favName] = favURL
        except :
            print "<<Agent>> Browser-Favorite file corrupt"
        browserOwner = BrowserOwner(favorites)
        ####### set my.ftp object
        try :
            f = open(self.user_path + FTP_PROFILE)
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load FTP-Profile"
        except :
            print "<<Agent>> FTP-Profile file not found"
        ftpOwner = FTPOwner()        
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'server' :
                    ftpOwner.server = value
                elif key == 'username' :
                    ftpOwner.username = value
                elif key == 'password' :
                    ftpOwner.password = value
        except :
            print "<<Agent>> FTP-Profile file corrupt"
        # ------ read FTP favorite server
        try :
            f = open(self.user_path + FTP_FAV_FILE, 'r')
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load FTP-Favorite"
        except :
            print "<<Agent>> FTP-Favorite not found"
        favorites = {}
        try :
            for line in lines :              
                favName, favURL = map(string.strip, line.split('::'))
                if (not favName) :
                    continue
                favorites[favName] = favURL
        except :
            print "<<Agent>> FTP-Favorite file corrupt"
        ftpOwner.favorites= favorites
        ####### set my.mail object
        try :
            f = open(self.user_path + MAIL_PROFILE)
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load Mail-Profile"
        except :
            print "<<Agent>> Mail-Profile file not found"
        mailOwner = MailOwner()
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'server' :
                    mailOwner.server = value
                elif key == 'address' :
                    mailOwner.address = value
                elif key == 'password' :
                    mailOwner.password = value
        except :
            print "<<Agent>> Mail-Profile file corrupt"
        # ------ read Mail favorite server
        try :
            f = open(self.user_path + MAIL_BOOK, 'r')
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load Mail-Address book"
        except :
            print "<<Agent>> Mail-Addrss book not found"
        addresses = {}
        try :
            for line in lines :          
                name, address = map(string.strip, line.split('::'))
                if (not name) :
                    continue
                addresses[name] = address
        except :
            print "<<Agent>> Mail-Address book file corrupt"
        mailOwner.addrbook = addresses
        ####### set my.sms object
        try :
            f = open(self.user_path + SMS_PROFILE)
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load SMS-Profile"
        except :
            print "<<Agent>> SMS-Profile file not found"
        smsOwner = SMSOwner()
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'username' :
                    smsOwner.username = value
                elif key == 'password' :
                    smsOwner.password = value
        except :
            print "<<Agent>> SMS-profile file corrupt"
        # ------ read phone book
        try :
            f = open(self.user_path + PHONE_BOOK, 'r')
            lines = f.readlines()
            f.close()
            print "<<Agent>> Load Phone book"
        except :
            print "<<Agent>> Phone book not found"
        book = {}
        try :
            for line in lines :            
                name, number = map(string.strip, line.split('::'))
                if (not name) :
                    continue
                book[name] = number
        except :
            print "<<Agent>> Phone book file corrupt"
        smsOwner.phonebook = book
        #######################################3
        # ======== build up the owner record object ===========
        my = Owner(browserOwner, ftpOwner, mailOwner, smsOwner)
        self.agentNameSpace['my'] = my

    def finalize(self) :
        self.browserFrame = None
        self.ftpFrame = None
        self.mailFrame = None
        self.smsFrame = None
        self.actionDialog = None
        self.profileDialog = None
        
        # nothing to do more for guest...
        if self.user_name == 'Default-User' :
            return
        # check the script save changed; save the defaultCode
        if self.original_script != self.script_editor.getText() :
            res = JOptionPane.showConfirmDialog(self,
                                                "The current script has changed\nDo you want to save the changes ?", 
                                                "Save changed script",
                                                JOptionPane.YES_NO_CANCEL_OPTION,
                                                JOptionPane.QUESTION_MESSAGE,
                                                None
                                                )
            if res == JOptionPane.CANCEL_OPTION :
                return
            elif res == JOptionPane.YES_OPTION :
                self.onSaveScript(None)
            else :
                pass
        defaultCode = self.script_editor.getText()
        try :
            f = open(self.user_path + DEFAULT_SCRIPT_FILE, 'w')
            f.write(defaultCode)
            f.close()
        except :
            print "<<Agent>> Error writing default.script"
        # save the defaultScript
        true_list = []
        for item in self.current_event_list :        
            true_list.append(item[0]+"&"+"halt"+"&"+item[2]+"&"+item[3]+'\n')
        try :
            f = open(self.user_path + DEFAULT_LIST_FILE, 'w')
            f.writelines(true_list)
            f.close()
        except :
            print "<<Agent>> Error writing default.list"

#Begin GUI component builders    

    def buildMenuBar(self) :
        mainmenu = JMenuBar()
        #############  File -> ########
        self.script_file_menu = JMenu('File')
        #--------- File -> New Script
        new_script_menu = JMenu('New script')
        new_script_menu.setMnemonic('n')
        new_script_menu.add(JMenuItem('Blank script', actionPerformed=self.onNewScript))
        new_script_menu.addSeparator()
        can1_menu = JMenuItem('Canned Script 1', actionPerformed=self.onNewScript)
        can1_menu.setToolTipText(can1_tip)
        new_script_menu.add(can1_menu)
        can2_menu = JMenuItem('Canned Script 2', actionPerformed=self.onNewScript)
        can2_menu.setToolTipText(can2_tip)
        new_script_menu.add(can2_menu)
        can3_menu = JMenuItem('Canned Script 3', actionPerformed=self.onNewScript)
        can3_menu.setToolTipText(can3_tip)
        new_script_menu.add(can3_menu)
        self.script_file_menu.add(new_script_menu)
        #------------------- file -> User profile 
        self.profile_menu = JMenu('User profile')
        self.profile_menu.add(JMenuItem('New profile', actionPerformed=self.onNewProfile))
        self.profile_menu.add(JMenuItem('Edit profile', actionPerformed=self.onEditProfile))
        self.profile_menu.add(JMenuItem('Delete profile', actionPerformed=self.onDeleteProfile))
        #------------------- file -> open
        open_script_menu = JMenuItem('Open script', actionPerformed=self.onOpenScript)
        open_script_menu.setMnemonic('o')
        self.script_file_menu.add(open_script_menu)
        self.script_file_menu.add(JMenuItem('Save script', actionPerformed=self.onSaveScript))
        self.script_file_menu.add(JMenuItem('Save script as', actionPerformed=self.onSaveScriptAs))
        self.script_file_menu.addSeparator()
        self.script_file_menu.add(self.profile_menu)
        self.script_file_menu.add(JMenuItem('Logout', actionPerformed=self.onLogout))
        self.script_file_menu.addSeparator()
        exit_menu = JMenuItem('Shutdown agent', actionPerformed=self.onExitProgram)
        exit_menu.setMnemonic('x')
        self.script_file_menu.add(exit_menu)
        mainmenu.add(self.script_file_menu)
        ################## File -> ################
        self.list_file_menu = JMenu('File')
        mi = JMenuItem('New list', actionPerformed=self.onNewList)
        mi.setMnemonic('n')
        self.list_file_menu.add(mi)
        mi = JMenuItem('Open list', actionPerformed=self.onOpenList)
        mi.setMnemonic('o')
        self.list_file_menu.add(mi)
        self.list_file_menu.add(JMenuItem('Save list', actionPerformed=self.onSaveList))
        self.list_file_menu.add(JMenuItem('Save list as', actionPerformed=self.onSaveListAs))
        self.list_file_menu.addSeparator()
        #------------------- file -> User profile 
        self.profile_menu2 = JMenu('User profile')
        self.profile_menu2.add(JMenuItem('New profile', actionPerformed=self.onNewProfile))
        self.profile_menu2.add(JMenuItem('Edit profile', actionPerformed=self.onEditProfile))
        self.profile_menu2.add(JMenuItem('Delete profile', actionPerformed=self.onDeleteProfile))        
        self.list_file_menu.add(self.profile_menu2)
        self.list_file_menu.add(JMenuItem('Logout', actionPerformed=self.onLogout))
        self.list_file_menu.addSeparator()                
        self.list_file_menu.add(JMenuItem('Shutdown agent', actionPerformed=self.onExitProgram))
        mainmenu.add(self.list_file_menu)
        self.list_file_menu.setVisible(0)
        ################## File -> ################
        self.console_file_menu = JMenu('File')
        self.console_file_menu.add(JMenuItem('Save console-text as', actionPerformed=self.onSaveConsole))
        self.console_file_menu.addSeparator()
        #------------------- file -> User profile 
        self.profile_menu2 = JMenu('User profile')
        self.profile_menu2.add(JMenuItem('New profile', actionPerformed=self.onNewProfile))
        self.profile_menu2.add(JMenuItem('Edit profile', actionPerformed=self.onEditProfile))
        self.profile_menu2.add(JMenuItem('Delete profile', actionPerformed=self.onDeleteProfile))        
        self.console_file_menu.add(self.profile_menu2)
        self.console_file_menu.add(JMenuItem('Logout', actionPerformed=self.onLogout))
        self.console_file_menu.addSeparator()                
        self.console_file_menu.add(JMenuItem('Shutdown agent', actionPerformed=self.onExitProgram))
        mainmenu.add(self.console_file_menu)
        self.console_file_menu.setVisible(0)
        ############################
        self.edit_menu = JMenu('Edit')
        self.edit_menu.add(JMenuItem('Cut', actionPerformed=self.onCut))
        self.edit_menu.add(JMenuItem('Copy', actionPerformed=self.onCopy))
        self.edit_menu.add(JMenuItem('Paste', actionPerformed=self.onPaste))
        mainmenu.add(self.edit_menu)
        
        mode_menu = JMenu('Mode')
        radiogroup = ButtonGroup() 
        self.mode_radio_item1 = JRadioButtonMenuItem('Script mode',1,actionPerformed=self.radioChangeMode)   #default selected
        radiogroup.add(self.mode_radio_item1)
        mode_menu.add(self.mode_radio_item1)
        self.mode_radio_item2 = JRadioButtonMenuItem('Event mode',0, actionPerformed=self.radioChangeMode)
        radiogroup.add(self.mode_radio_item2)
        mode_menu.add(self.mode_radio_item2)
        self.mode_radio_item3 = JRadioButtonMenuItem('Console mode',0, actionPerformed=self.radioChangeMode)
        radiogroup.add(self.mode_radio_item3)
        mode_menu.add(self.mode_radio_item3)
        mainmenu.add(mode_menu)

        ##########################################
        self.script_command_menu = JMenu('Command')
        self.script_command_menu.add(JMenuItem('Test script', actionPerformed=self.onTestScript))
        self.script_command_menu.add(JMenuItem('Run script', actionPerformed=self.onRunScript))
        self.script_command_menu.addSeparator()
        self.script_command_menu.add(JMenuItem('Clean up NameSpace', actionPerformed=self.onCleanupNameSpace))
        mainmenu.add(self.script_command_menu)

        # Event command menu (switch when event mode active)
        self.event_command_menu = JMenu('Command')
        self.event_command_menu.add(JMenuItem('Add item', actionPerformed=self.onAddAction))
        self.event_command_menu.add(JMenuItem('Edit item', actionPerformed=self.onEditAction))
        self.event_command_menu.add(JMenuItem('Delete item', actionPerformed=self.onDeleteAction))
        self.event_command_menu.add(JMenuItem('Delete All items', actionPerformed=self.onDeleteAllAction))
        self.event_command_menu.addSeparator()
        self.event_command_menu.add(JMenuItem('Clean up NameSpace', actionPerformed=self.onCleanupNameSpace))        
        mainmenu.add(self.event_command_menu)
        self.event_command_menu.setVisible(0)

        # Console command menu
        self.console_command_menu = JMenu('Command')
        item = JCheckBoxMenuItem('Use Agent NameSpace', self.isConsoleToNameSpace, actionPerformed=self.onUseAgentNameSpace)
        item.setSelected(1)
        self.console_command_menu.add(item)
        self.console_command_menu.add(JMenuItem('Get Console Header', actionPerformed=self.onGetConsoleHeader))
        self.console_command_menu.add(JMenuItem('Clear console', actionPerformed=self.onClearConsole))
        self.console_command_menu.addSeparator()
        self.console_command_menu.add(JMenuItem('Clean up NameSpace', actionPerformed=self.onCleanupNameSpace))        
        mainmenu.add(self.console_command_menu)
        self.console_command_menu.setVisible(0)
        
        #############################################
        menu = JMenu('Tools')
        menu.add(JMenuItem('Web Browser', actionPerformed=self.onOpenBrowser))
        menu.add(JMenuItem('FTP Client', actionPerformed = self.onOpenFTPClient))
        menu.add(JMenuItem('Mail Client', actionPerformed = self.onOpenMailClient))
        menu.add(JMenuItem('SMS Client', actionPerformed = self.onOpenSMSClient))
        menu.addSeparator()
        other_tools_menu = JMenu('Others..')
        other_tools_menu.add(JMenuItem('Internet Explorer', actionPerformed=self.onOpenOtherTools))
        other_tools_menu.add(JMenuItem('Window Explorer', actionPerformed=self.onOpenOtherTools))
        other_tools_menu.add(JMenuItem('Calculator', actionPerformed=self.onOpenOtherTools))
        other_tools_menu.add(JMenuItem('Notepad', actionPerformed=self.onOpenOtherTools))        
        other_tools_menu.add(JMenuItem('Command Prompt', actionPerformed=self.onOpenOtherTools))        
        menu.add(other_tools_menu)
        mainmenu.add(menu)

        menu = JMenu('Look & Feel')
        radiogroup = ButtonGroup() 
        self.style_metal_radio = JRadioButtonMenuItem('Metal',0,actionPerformed=self.onChangeStyle)   
        radiogroup.add(self.style_metal_radio)
        menu.add(self.style_metal_radio)
        self.style_motif_radio = JRadioButtonMenuItem('Motif',0, actionPerformed=self.onChangeStyle)
        radiogroup.add(self.style_motif_radio)
        menu.add(self.style_motif_radio)
        self.style_windows_radio = JRadioButtonMenuItem('Windows',0, actionPerformed=self.onChangeStyle)
        radiogroup.add(self.style_windows_radio)
        menu.add(self.style_windows_radio)
        self.style_auto_radio = JRadioButtonMenuItem('Auto',1, actionPerformed=self.onChangeStyle)#default selected
        radiogroup.add(self.style_auto_radio)
        menu.add(self.style_auto_radio)
        mainmenu.add(menu)

        menu = JMenu('Help')
        menu.add(JMenuItem('How to use agent', actionPerformed=self.onHowToUseAgent))
        menu.addSeparator()
        menu.add(JMenuItem('About agent program', actionPerformed=self.onAboutAgentProgram))
        mainmenu.add(menu)
        
        self.setJMenuBar(mainmenu)
    
    def buildToolBar(self) :
        toolbar = JToolBar('Tool bar')
        btRun = JButton(ImageIcon(IMAGE_PATH + 'run.gif'), actionPerformed=self.onRunScript)
        btRun.addMouseListener(self.MyMouseListener_bt(self))
        btRun.setBorderPainted(0)
        btRun.setToolTipText("Run Script")
        btBrowser = JButton(ImageIcon(IMAGE_PATH + 'browser.gif'), actionPerformed=self.onOpenBrowser)
        btBrowser.addMouseListener(self.MyMouseListener_bt(self))
        btBrowser.setBorderPainted(0)
        btBrowser.setToolTipText("Open Browser")
        btFTP = JButton(ImageIcon(IMAGE_PATH + 'ftp.gif'), actionPerformed=self.onOpenFTPClient)
        btFTP.addMouseListener(self.MyMouseListener_bt(self))
        btFTP.setBorderPainted(0)
        btFTP.setToolTipText("Open FTP Client")
        btMail = JButton(ImageIcon(IMAGE_PATH + 'mail.gif'), actionPerformed=self.onOpenMailClient)
        btMail.addMouseListener(self.MyMouseListener_bt(self))
        btMail.setBorderPainted(0)
        btMail.setToolTipText("Open e-mail Client")			 
        btSMS = JButton(ImageIcon(IMAGE_PATH + 'mobile.gif'), actionPerformed=self.onOpenSMSClient)
        btSMS.addMouseListener(self.MyMouseListener_bt(self))
        btSMS.setBorderPainted(0)
        btSMS.setToolTipText("Open SMS Client")	
        freespace = JPanel()
        freespace.setLayout(BorderLayout())
        btHelp = JButton(ImageIcon(IMAGE_PATH + 'help.gif'), actionPerformed=self.onHowToUseAgent)
        btHelp.addMouseListener(self.MyMouseListener_bt(self))
        btHelp.setBorderPainted(0)
        btHelp.setToolTipText('Help')
        
        toolbar.add(btRun)
        toolbar.addSeparator()
        toolbar.add(btBrowser)
        toolbar.add(btFTP)
        toolbar.add(btMail)
        toolbar.add(btSMS)
        toolbar.add(freespace)
        toolbar.add(btHelp)
        
        self.center.add(toolbar, BorderLayout.NORTH)

    def buildTabbedPane(self) : 
        ################## first tab = script editor
        self.script_editor = JTextArea()
        self.script_editor.setFont( Font("Tahoma", Font.PLAIN, 12) )
        self.script_editor.setTabSize(2)
        self.script_editor.getDocument().addDocumentListener(self.MyDocumentListener(self))
        pane1 = JPanel()
        pane1.setLayout(BorderLayout())
        pane1.add(JScrollPane(self.script_editor), BorderLayout.CENTER)
        ################## second tab = event list
        self.event_list = JList()
        self.event_list.setCellRenderer(self.MyCellRenderer(self))
        self.event_list.addMouseListener(self.MyMouseAdapter_list(self))
        pane2 = JPanel()
        pane2.setLayout(BorderLayout())
        pane2.add(JScrollPane(self.event_list), BorderLayout.CENTER)
        ################# third tab = console
        self.console = Console.Console(None, None, self)    # bind this agent to console so that it can use agentNameSpace
        self.console.capturePythonOutput()
        self.console.newInput()
        pane3 = JScrollPane(self.console.textpane)
        
        self.tab = JTabbedPane(stateChanged = self.onChangeMode)
        self.tab.add('Script editor', pane1)
        self.tab.add('Event list', pane2)
        self.tab.add(' Console ', pane3)
        self.center.add(self.tab, BorderLayout.CENTER)
    
    def buildStatusBar(self) :
        self.statusbar = JPanel(BorderLayout())
        
        self.status = JLabel('script')
        self.statusbar.add(self.status, BorderLayout.WEST)

        self.time_status = JLabel('time')
        self.time_status.setBorder(BorderFactory.createEtchedBorder())
        self.statusbar.add(self.time_status, BorderLayout.EAST)

        self.contentPane.add(self.statusbar, BorderLayout.SOUTH)


    def buildDefaultTools(self) :
        self.browserFrame = Browser.BrowserFrame('http://www.ce.kmitl.ac.th', 0, 1, 0, self)
        self.ftpFrame = FTPClient.FTPClientFrame("c:\\", 1, self)
        self.mailFrame = MailClient.EMailFrame(1, self)
        self.smsFrame = SMSClient.SMSFrame(1, self)
    
#####################################################################################################
########################    Begin menu item handlers   #####################################################
############################################################################################################

    def onNewScript(self, event) :
        if self.popup :
            self.popup.hide()
            self.popup = None
        if self.original_script != self.script_editor.getText() :
            res = JOptionPane.showConfirmDialog(self,
                                                "The current script has changed\nDo you want to save the changes ?", 
                                                "Save changed script",
                                                JOptionPane.YES_NO_CANCEL_OPTION,
                                                JOptionPane.QUESTION_MESSAGE,
                                                None
                                                )
            if res == JOptionPane.CANCEL_OPTION :
                return
            elif res == JOptionPane.YES_OPTION :
                self.onSaveScript(None)
            else :
                pass
        # === begin new script job here
        if event.getActionCommand()=="Canned Script 1" :
            self.script_editor.setText(can1_script)
            self.original_script = can1_script
            self.status.setText('New script : canned 1')
        elif event.getActionCommand()=="Canned Script 2" :
            self.script_editor.setText(can2_script)
            self.original_script = can2_script
            self.status.setText('New script : canned 2')
        elif event.getActionCommand()=="Canned Script 3" :
            self.script_editor.setText(can3_script)
            self.original_script = can3_script
            self.status.setText('New script : canned 3')
        else :
            self.script_editor.setText('')
            self.original_script = ''
            self.status.setText('New script')
        self.current_script_name = 'Untitled script'
        self.changeMode(0)        
        
    def onOpenScript(self, event) :
        if self.popup :
            self.popup.hide()
            self.popup = None        
        if self.original_script != self.script_editor.getText() :
            res = JOptionPane.showConfirmDialog(self,
                                                "The current script has changed\nDo you want to save the changes ?", 
                                                "Save changed script",
                                                JOptionPane.YES_NO_CANCEL_OPTION,
                                                JOptionPane.QUESTION_MESSAGE,
                                                None
                                                )
            if res == JOptionPane.CANCEL_OPTION :
                return
            elif res == JOptionPane.YES_OPTION :
                self.onSaveScript(None)
            else :
                pass
        # ===== begin open job here
        fc =  JFileChooser("./scripts")
        result = fc.showOpenDialog(self)
        if result ==JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            try :
                self.script_editor.read(FileReader(file), '')
                self.original_script = self.script_editor.getText()
                self.current_script_name = file.getAbsolutePath()
                self.changeMode(0)
                self.status.setText('Open script')
            except :
                JOptionPane.showMessageDialog(self, 'An error occur when trying to open script.', 'Error', JOptionPane.ERROR_MESSAGE)
    
    def onSaveScript(self, event) :
        if self.popup :
            self.popup.hide()
            self.popup = None
        if ( self.current_script_name == 'Untitled script' or self.current_script_name == '' ) :
            fc =  JFileChooser("./scripts")
            result = fc.showSaveDialog(self)
            if result ==JFileChooser.APPROVE_OPTION :
                file = fc.getSelectedFile()
                try :
                    self.script_editor.write(FileWriter(file))                    
                    self.current_script_name = file.getAbsolutePath()
                    self.changeMode(0)
                    self.status.setText('Save script')
                    # kind of commit to disk then set to original script
                    self.original_script = self.script_editor.getText()                
                except :
                    JOptionPane.showMessageDialog(self, 'An error occur when trying to save script.', 'Error', JOptionPane.ERROR_MESSAGE)
                    return
        else :
            f = open(self.current_script_name, 'w')
            f.write(self.script_editor.getText())        
            f.close()
            # kind of commit to disk then set to original script
            self.original_script = self.script_editor.getText()
        
    def onSaveScriptAs(self, event) :
        if self.popup :
            self.popup.hide()
            self.popup = None
        fc =  JFileChooser("./scripts")
        result = fc.showSaveDialog(self)
        if result ==JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            try :
                self.script_editor.write(FileWriter(file))
                self.current_script_name = file.getAbsolutePath()
                self.changeMode(0)
                self.status.setText('Save script as')
                # kind of commit to disk then set to original script
                self.original_script = self.script_editor.getText()    
            except :
                JOptionPane.showMessageDialog(self, 'An error occur when trying to save script.', 'Error', JOptionPane.ERROR_MESSAGE)
                return
        
    def onExitProgram(self, event, alert=1) :
        if self.popup :
            self.popup.hide()
            self.popup = None
        if alert :
            if JOptionPane.NO_OPTION == JOptionPane.showConfirmDialog(self,
                                                                   'Are you really want to exit?',
                                                                   'Confirm',
                                                                   JOptionPane.YES_NO_OPTION,
                                                                   -1,
                                                                   ImageIcon(IMAGE_PATH + 'shutdown.gif')
                                                                   ) :
                return
        self.finalize()
        sys.exit(0)

    def onNewList(self,e) :
        self.status.setText('New list')
        self.current_event_list_name = ''
        self.current_event_list = []
        self.event_list.setListData([])  #Jlist
        self.changeMode(1)

    def onOpenList(self,e) :
        fc =  JFileChooser("./lists")
        result = fc.showOpenDialog(self)
        if result ==JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            fname = file.getAbsolutePath()
            f = open(fname)
            lines = f.readlines()
            f.close()
            list = []
            for line in lines :
                if not line.strip() :
                    continue
                item = line.strip().split("&")
                if len(item) != 4 :
                    print "<<Agent>> List file corrupt"
                    self.status.setText("List file corrupt")
                    return
                list.append(item)
            
            listToDisplay = self.convertToDisplay(list)        
            self.event_list.setListData(listToDisplay)  #set to Jlist
            self.current_event_list = list        #assign to current list
            self.current_event_list_name = fname
            self.changeMode(1)        #update title
        self.status.setText('Open list')
        
    def onSaveList(self,e) :
        if self.current_event_list_name == '' :
            # create true list for save to file
            true_list = []
            if self.current_event_list != [] :
                for item in self.current_event_list :        
                    true_list.append(item[0]+"&"+"active"+"&"+item[2]+"&"+item[3]+'\n')
                true_list[-1] =true_list[-1][0:-1]
    
            fc =  JFileChooser("./lists")
            result = fc.showSaveDialog(self)
            if result ==JFileChooser.APPROVE_OPTION :
                file = fc.getSelectedFile()
                fname = file.getAbsolutePath()
                f = open(fname, 'w')
                f.writelines(true_list)
                f.close()
                self.current_event_list_name = fname
                self.changeMode(1)
        else :
            true_list = []
            if self.current_event_list != [] :
                for item in self.current_event_list :        
                    true_list.append(item[0]+"&"+"active"+"&"+item[2]+"&"+item[3]+'\n')
                true_list[-1] =true_list[-1][0:-1]
            f = open(self.current_event_list_name, 'w')
            f.writelines(true_list)
            f.close()
        self.status.setText('Save list')
            
                
    def onSaveListAs(self,e) :
        true_list = []
        if self.current_event_list != [] :
            for item in self.current_event_list :        
                true_list.append(item[0]+"&"+"active"+"&"+item[2]+"&"+item[3]+'\n')
            true_list[-1] =true_list[-1][0:-1]
    
        fc =  JFileChooser("./lists")
        result = fc.showSaveDialog(self)
        if result ==JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            fname = file.getAbsolutePath()
            f = open(fname, 'w')
            f.writelines(true_list)
            f.close()
            self.current_event_list_name = fname
            self.changeMode(1)
        self.status.setText('Save list as')

    def onSaveConsole(self, e) :
        fc =  JFileChooser(".")
        result = fc.showSaveDialog(self)
        if result ==JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            fname = file.getAbsolutePath()
            f = open(fname, 'w')
            f.write(self.console.textpane.text)
            f.close()
            #self.changeMode(2)  # console mode
        self.status.setText('Save console text')

    def onNewProfile(self, event) :
        JOptionPane.showMessageDialog(self,
                                      'If you want to create new account, do the following steps :\n  1) Logout\n  2) Select "Create new account" option\n  3) Enter username and password',
                                      )

    def onEditProfile(self, event) :
        self.status.setText('Edit profile')
        if not self.profileDialog :
            self.profileDialog = UserProfileDialog(self)
            self.profileDialog.show()
        else :
            self.profileDialog.setting_lookandfeel_cb.setSelectedItem(self.user_lookandfeel)
            self.profileDialog.show()

    def onDeleteProfile(self, event, alert=1) :
        if self.popup :
            self.popup.hide()
            self.popup = None
        if self.user_name in ['Default-User', 'Meng'] :
            JOptionPane.showMessageDialog(self, "Cannot remove this account?")
            return
        if alert :
            if JOptionPane.NO_OPTION == JOptionPane.showConfirmDialog(self,
                                                                      'Are you really want to "delete" current account?',
                                                                      'Confirm',
                                                                      JOptionPane.YES_NO_OPTION,
                                                                      -1,
                                                                      ImageIcon(IMAGE_PATH + 'login.gif')
                                                                   ) :
                return
        # default is window style, so change back when logout
        self.onChangeStyle(None, 'Windows')
        # set all condition to be the beginning
        self.script_editor.setText('')
        self.event_list.setListData([])
        self.browserFrame = None
        self.ftpFrame = None
        self.mailFrame = None
        self.smsFrame = None
        self.actionDialog = None
        self.profileDialog = None
        # Delete all files and folder
        #os.rmdir(self.user_path[:-1])
        os.system('deltree "%s"' % (self.user_path) )
        # prompt login for further login
        self.showLoginDialog()

    def onLogout(self, event, alert=1) :
        if self.popup :
            self.popup.hide()
            self.popup = None
        if alert :
            if JOptionPane.NO_OPTION == JOptionPane.showConfirmDialog(self,
                                                                      'Are you really want to logout?',
                                                                      'Confirm',
                                                                      JOptionPane.YES_NO_OPTION,
                                                                      -1,
                                                                      ImageIcon(IMAGE_PATH + 'login.gif')
                                                                   ) :
                return
        # default is window style, so change back when logout
        self.onChangeStyle(None, 'Auto')
        self.changeMode(0)
        # save user defaultCode and defaultList
        self.finalize()
        # set all condition to be the beginning
        self.script_editor.setText('')
        self.event_list.setListData([])
        self.console.textpane.setText('')
        # prompt the login dialog right after logout complete
        self.showLoginDialog()

    def showLoginDialog(self) :
        while(1) :
            login = LoginDialog(self)
            result = login.show()
            if result == -1 :
                # exit at this stage not required to finalize user data because no user appear to connect
                self.dispose()
                sys.exit(0)
            elif result == 0 :
                JOptionPane.showMessageDialog(self, 'Username or Password not correct !!\nPlease try again..')
                continue
            # ============== Login ==============
            elif result == 1 :                     
                print ('+'  * 75)
                print '+' * 30, "  Login  ", '+' * 30
                print ('+' * 75)
                ########################
                login.getLoginInfo()
                self.onChangeStyle(None, self.user_lookandfeel)
                self.initialize()
                self.runStartupScript()
                if self.user_servertime :
                    self.synchronizeTime()
                # rebind the key-event for console
                self.rebindConsoleKeymap()
                
                ########### do update or validate the default tools ###############
                if self.browserFrame :
                    self.browserFrame.validateAll()
                if self.ftpFrame :
                    self.ftpFrame.validateAll()
                if self.mailFrame :
                    self.mailFrame.validateAll()
                if self.smsFrame :
                    self.smsFrame.validateAll()
                return

    def rebindConsoleKeymap(self) :
        self.console.textpane.keymap = self.console.keymap

    def onCut(self, event) :
        self.script_editor.cut()
        self.script_editor.requestFocus()
        self.status.setText('Cut')
    
    def onCopy(self, event) :
        self.script_editor.copy()
        self.script_editor.requestFocus()
        self.status.setText('Copy')
    
    def onPaste(self, event) :
        self.script_editor.paste()
        self.script_editor.requestFocus()
        self.status.setText('Paste')
    
    def radioChangeMode(self, event) :
        if event.getActionCommand() == 'Script mode' :
            self.changeMode(0)
        elif event.getActionCommand() == 'Event mode' :
            self.changeMode(1)
        elif event.getActionCommand() == 'Console mode' :
            self.changeMode(2)

    def testScript(self, alert=1, alert2=1, alert3=0, input_script=None) :
        if not input_script :
            input_script = self.script_editor.getText()
        self.scripter = Parser(self, input_script)
        # test upper lever : if script separate correctly
        if not self.scripter.loadScript(alert3) :
            self.status.setText('Script not recognized')
            print "<<Agent>> Script segmentation not regonized"
            if alert :
                JOptionPane.showMessageDialog(self, 'Segmentation not regonized.\nPlease check your script and try again.', 'Script Checking', JOptionPane.ERROR_MESSAGE)    
            return 0
        # test the sequential part
        try :
            compile(self.scripter.seq_script, '', 'exec')
        except :
            self.status.setText('Sequential part error')
            print "<<Agent>> Script error at sequential part"
            if alert :
                JOptionPane.showMessageDialog(self, 'Incorrect sequential script format.\nPlease check your script and try again.', 'Script Checking', JOptionPane.ERROR_MESSAGE)
            return 0
        # test the parallel part
        try :
            stmts = map( string.strip, self.scripter.par_script.split('\n') )
            for stmt in stmts :                
                compile(stmt, '', 'exec')
        except :
            self.status.setText('Parallel part error')
            print "<<Agent>> Script error at parallel part"
            if alert :
                JOptionPane.showMessageDialog(self, 'Incorrect parallel script format.\nPlease check your script and try again.', 'Script Checking', JOptionPane.ERROR_MESSAGE)
            return 0
        # test the event-script part
        try :
            if not self.scripter.addEventAction(self.scripter.event_script, 1) :
                raise "in addEventAction"
        except :
            self.status.setText('Event part error')
            print "<<Agent>> Script error at event-script part"
            if alert :
                JOptionPane.showMessageDialog(self, 'Incorrect event-script script format.\nPlease check your script and try again.', 'Script Checking', JOptionPane.ERROR_MESSAGE)
            return 0
        self.status.setText('Script correct')
        print "<<Agent>> Script correct"
        if alert2 :
            JOptionPane.showMessageDialog(self, 'Script correct in syntax', 'Script Checking', JOptionPane.INFORMATION_MESSAGE)
        return 1

    def runStartupScript(self) :
        if not self.user_startupscript :
            return
        try :
            f = open(self.user_startupscript)
            script = f.read()
            f.close()
        except :
            return
        if not self.testScript(0, 0, 0, script) :
            return
        self.scripter.addEventAction()
        self.scripter.startParScript()
        start_new_thread(self.scripter.execSeqScript, ())
        print "<<Agent>> Startup-Script has been execute"
        
    def onTestScript(self, event) :
        if self.popup :
            self.popup.hide()
            self.popup = None        
        self.testScript()
         
    def onRunScript(self, event) :
        if self.testScript(1,0,1) :
            self.scripter.showResult()
            
            # add event-script part to event list
            self.scripter.addEventAction()
            # this method has just start new thread for each statement and immediately return
            self.scripter.startParScript()
            # spawn new thread for sequential script
            start_new_thread(self.scripter.execSeqScript, ())
            self.status.setText('Running script')

    def onCleanupNameSpace(self, event) :
        if self.popup :
            self.popup.hide()
            self.popup = None        
        res = JOptionPane.showConfirmDialog(self,
                                            "It is recommend that NameSpace be cleaned up often.\n" + \
                                            "However, if you confirm to clean up Agent's NameSpace,\n" + \
                                            "you will never be able to access former reference anymore !!\n" + \
                                            "Do you want to clean up NameSpace ?", 
                                            "Clean up NameSpace",
                                            JOptionPane.YES_NO_OPTION,
                                            JOptionPane.QUESTION_MESSAGE,
                                            None
                                            )
        if res == JOptionPane.NO_OPTION :
            return
        self.status.setText('Clean up Namespace')
        self.agentNameSpace.clear()
        runtime = Runtime.getRuntime()
        runtime.gc()

        # getting default script utilities
        for each in dir(ScriptUtils) :
            self.agentNameSpace[each] = eval('ScriptUtils.' + each)
        self.agentNameSpace['AGENT'] = self
        
    def onScriptChanged(self, event) :
        allText = self.script_editor.getText()
        curPos = self.script_editor.getCaretPosition()
        self.curPos = curPos
        #print allText[curPos-1]
        # ( to show arguement tip; . to show member (method) tip
        if allText[curPos-1] in ['(', '.'] :
            # find the closest separator of this fucntion name
            p1 = allText.rfind(' ', 0, curPos-1)
            p2 = allText.rfind(';', 0, curPos-1)
            p3 = allText.rfind(')', 0, curPos-1)
            p4 = allText.rfind('>', 0, curPos-1)
            p5 = allText.rfind('<', 0, curPos-1)
            p6 = allText.rfind('=', 0, curPos-1)
            p7 = allText.rfind('(', 0, curPos-1)
            p8 = allText.rfind(',', 0, curPos-1)
            p9 = allText.rfind('\n', 0, curPos-1)
            p10 = allText.rfind('\t', 0, curPos-1)
            p11 = allText.rfind(':', 0, curPos-1)
            pos = max((p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11))
                        
            tmp = allText[pos+1 : curPos-1].strip()
            point = tmp.find('.')
            if self.popup : # if current one is exist, dispose it first
                self.popup.hide()
                self.popup = None
            try :
                if point>0 :
                    head = tmp[ : point]
                    tails = tmp[ point : ]
                    token = eval( 'self.agentNameSpace[head]' + tails )            
                else :
                    token = self.agentNameSpace[tmp]
            except :
                print "<<Agent>> Not found in NameSpace"
                return
            # declare the component panel to be popup on script_editor
            pane = JPanel(BorderLayout(5,5))
            try :            
                if allText[curPos-1]=='(' :     # case of arguments
                    doc = token.__doc__
                    tip = doc.split('\n') [0]   # get only first line
                    pane.setBorder(BorderFactory.createLineBorder(Color.BLUE))
                    comp = JLabel(str(tip))
                    comp.setBackground(Color.BLACK)
                    comp.setForeground(Color.BLUE)
                    pane.add(comp)
                elif allText[curPos-1]=='.' :   # case of methos or member
                    pane.setBorder(BorderFactory.createBevelBorder(border.BevelBorder.RAISED))
                    members = dir( token )
                    if len(members) == 0 :
                        raise "no member"
                    comp = JList(members)
                    comp.setSelectionMode(ListSelectionModel.SINGLE_SELECTION)
                    comp.addListSelectionListener(self.MyListSelectionListener_popup(self))
                    comp.addMouseListener(self.MyMouseListener_popup(self))
                    pane.setPreferredSize(Dimension(110, 100))
                    pane.add( JScrollPane(comp,
                                          JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
                                          JScrollPane.HORIZONTAL_SCROLLBAR_NEVER ))
            except :
                print "<<Agent>> Error in getting information of method or object or module"
                print sys.last_value.args
                return
            # find the location on desktop screen where to show the popup
            rect = self.script_editor.modelToView(self.script_editor.getCaretPosition())
            point = Point(rect.x, rect.y+18)
            SwingUtilities.convertPointToScreen(point, self.script_editor)
            print "<<Agent>> Popup at (%d, %d)" % (point.x, point.y)
            # create new popup component
            factory =  PopupFactory.getSharedInstance()
            self.popup = factory.getPopup(
                self.script_editor,
                pane,
                point.x,
                point.y
            ) 
            self.popup.show()            
        elif allText[curPos-1] in [')', '(', '.', '>', '<', ':',  '=', ';', '\t', '\n'] :  # for all other charactors, dispose popup
            if self.popup :
                self.popup.hide()
                self.popup = None
        # get to focus owner back to the script editor
        self.script_editor.requestFocus()
    
    def onAddAction(self, event) :
        self.status.setText('Add event-action')
        if not self.actionDialog :
            self.actionDialog = AddActionDialog(self)
            self.actionDialog.show()
        else :
            self.actionDialog.dateSpinner.setValue(Date(self.nowDate + ' ' + self.nowTime))
            self.actionDialog.show()

    def onEditAction(self, event) :
        index = self.event_list.getSelectedIndex()
        if index==-1 :
            print "<<Agent>> No item selected"
            return
        type, flag, event, action = self.current_event_list[index]

        # build GUI for editing event-action
        pane = JPanel(GridLayout(3,2))
        pane.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "<%s> Event-Action" % type) )
        flagActive_cb = JCheckBox("Active", (flag=='active'))
        action_tf = JTextField(action, 20)
        
        #############################################
        if type == 'time' :        
            dateModel = SpinnerDateModel(Date(event), None, None, Calendar.MINUTE)
            dateSpinner = JSpinner(dateModel)
            dateEditor = JSpinner.DateEditor(dateSpinner, "yyyy/MM/dd HH:mm")
            dateSpinner.setEditor(dateEditor)
            dateSpinner.setBorder(BorderFactory.createEtchedBorder())
            
            pane.add(flagActive_cb)            
            pane.add(dateSpinner)
            pane.add(action_tf)
            
            result = JOptionPane.showConfirmDialog(self,
                                               pane,
                                               'Edit event-action',
                                               JOptionPane.YES_NO_OPTION,
                                               -1 )
            if result != JOptionPane.YES_OPTION :
                return
            
            date = dateSpinner.getValue()
            event = "%d/%d/%d %d:%d" % (date.getYear()+1900, date.getMonth()+1, date.getDate(), date.getHours(), date.getMinutes())
            event.strip()
            if not event :
                event = '<event>'
        #############################################
        elif type == 'mail' :
            mail_tf = JTextField("<not available>")
            mail_tf.setEditable(0)
            pane.add(flagActive_cb)
            pane.add(mail_tf)
            pane.add(action_tf)
            
            result = JOptionPane.showConfirmDialog(self,
                                               pane,
                                               'Edit event-action',
                                               JOptionPane.YES_NO_OPTION,
                                               -1 )
            if result != JOptionPane.YES_OPTION :
                return
                        
        ###############################################
        elif type == 'others' :
            others_tf = JTextField(event)
            pane.add(flagActive_cb)
            pane.add(others_tf)
            pane.add(action_tf)
            
            result = JOptionPane.showConfirmDialog(self,
                                               pane,
                                               'Edit event-action',
                                               JOptionPane.YES_NO_OPTION,
                                               -1 )
            if result != JOptionPane.YES_OPTION :
                return
            
            event = others_tf.text
            if not event :
                event = '<event>'
            
        action = action_tf.getText()
        if not action :
            action = '<action>'
        if flagActive_cb.isSelected() :
            flag = 'active'
        else :
            flag = 'halt'
            
        #==========================
        self.current_event_list[index] = [type, flag, event, action]
        displayList = self.convertToDisplay(self.current_event_list)
        self.event_list.setListData(displayList)
        
    def onDeleteAction(self, event) :
        self.status.setText('Delete event-action')
        listdata = list(self.event_list.getSelectedIndices())#get index from jlist
        listdata.reverse()    #Reverse avoid index change while delete
        for i in listdata :
            del self.current_event_list[i]
        displayList = self.convertToDisplay(self.current_event_list)
        self.event_list.setListData(displayList)
        
    def onDeleteAllAction(self, event) :
        self.status.setText('Delete all event-action')
        n = len(self.current_event_list)
        for i in range(n-1, -1, -1) :   #delete all items
            del self.current_event_list[i]
        displayList = self.convertToDisplay(self.current_event_list)
        self.event_list.setListData(displayList)        

    def onUseAgentNameSpace(self, event) :
        self.isConsoleToNameSpace = event.getSource().isSelected()

    def onGetConsoleHeader(self, event) :
        self.console.write(Console.header, 'output')
        self.console.write(MY_HEADER, 'header')
        self.console.textpane.requestFocus()
        self.console.newInput()

    def onClearConsole(self, event) :
        self.console.textpane.setText('')
        self.console.textpane.requestFocus()
        self.console.newInput()

    def onOpenBrowser(self, event) :
        self.status.setText('Open "Web Browser"')
        # if only one browser is open use default one for quick load
        if not self.browserFrame :
            self.browserFrame = Browser.BrowserFrame('http://www.ce.kmitl.ac.th', 0, 1, 1, self)
            self.browserFrame.validateAll()
            start_new_thread(self.browserFrame.show, ())
        elif not self.browserFrame.isShowing() :
            start_new_thread(self.browserFrame.show, ())
        else :
            # BrowserFrame(homeURL, id, child, getpage, parent)
            newFrame = Browser.BrowserFrame('http://www.ce.kmitl.ac.th', 1, 1, 1, self)
            newFrame.validateAll()
            start_new_thread(newFrame.show, ())

    def onOpenFTPClient(self, event) :
        self.status.setText('Open "FTP Client"')
        # if only one ftp is open use default for quick load
        if not self.ftpFrame :
            self.ftpFrame = FTPClient.FTPClientFrame("c:\\", 1, self)
            self.ftpFrame.validateAll()
            start_new_thread(self.ftpFrame.show, ())
        elif not self.ftpFrame.isShowing() :
            start_new_thread(self.ftpFrame.show, ())
        else :
            newFrame = FTPClient.FTPClientFrame("c:\\", 1, self)	# begin at root
            newFrame.validateAll()
            start_new_thread(newFrame.show, ())

    def onOpenMailClient(self, event) :
        self.status.setText('Open "Mail Client"')
        if not self.mailFrame :
            self.mailFrame = MailClient.EMailFrame(1, self)
            self.mailFrame.validateAll()
            start_new_thread(self.mailFrame.show, ())
        elif not self.mailFrame.isShowing() :
            start_new_thread(self.mailFrame.show, ())
        else :
            newFrame = MailClient.EMailFrame(1, self)
            newFrame.validateAll()
            start_new_thread(newFrame.show, ())
        
    def onOpenSMSClient(self, event) :
        self.status.setText('Open "SMS Sender"')
        if not self.smsFrame :
            self.smsFrame = SMSClient.SMSFrame(1, self)
            self.smsFrame.validateAll()
            start_new_thread(self.smsFrame.show, ())
        elif not self.smsFrame.isShowing() :
            start_new_thread(self.smsFrame.show, ())
        else :
            newFrame = SMSClient.SMSFrame(1, self)
            newFrame.validateAll()
            start_new_thread(newFrame.show, ())

    # this method work only for XP or 2000 window version
    def onOpenOtherTools(self, event) :
        tool = str(event.getActionCommand())
        self.status.setText('Open "%s"' % (tool,))
        path = ''
        if tool=='Internet Explorer' :
            path = "C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE"
        elif tool=='Window Explorer' :
            path = "%SystemRoot%\\explorer.exe"
        elif tool=='Calculator' :
            path = "%SystemRoot%\\System32\\calc.exe"
        elif tool=='Notepad' :
            path = "%SystemRoot%\\system32\\notepad.exe"
        elif tool=='Command Prompt' :
            path = "%SystemRoot%\\system32\\cmd.exe"
        try :
            start_new_thread(os.system, ('start "PWB" "' + path + '"',) )
        except :
            self.status.setText('Cannot start program')
            print "<<Agent>> Cannot start program"
            return
        
    def onChangeStyle(self, event, style=None) :
        #if not event and style :
        if (event == None) and (style != None) :
            look_and_feel = style
        #else :
        elif (event != None) and (style == None):
            look_and_feel = event.getActionCommand()
        else :
            return
            
        self.user_lookandfeel = look_and_feel
        self.status.setText('Look&Feel : ' + look_and_feel)
        if look_and_feel == 'Metal' :
            app_style = 'javax.swing.plaf.metal.MetalLookAndFeel'
            self.style_metal_radio.setSelected(1)
        elif look_and_feel == 'Motif' :
            app_style = 'com.sun.java.swing.plaf.motif.MotifLookAndFeel'
            self.style_motif_radio.setSelected(1)
        elif look_and_feel == 'Windows' :
            app_style = 'com.sun.java.swing.plaf.windows.WindowsLookAndFeel'
            self.style_windows_radio.setSelected(1)
        elif look_and_feel == 'Auto' :
            app_style = UIManager.getSystemLookAndFeelClassName()
            self.style_auto_radio.setSelected(1)
        try :
            # find out if it has this look and feel in our system
            UIManager.setLookAndFeel(app_style)
            SwingUtilities.updateComponentTreeUI(self)
            # set look & feel the all other children
            if self.browserFrame :
                SwingUtilities.updateComponentTreeUI(self.browserFrame)
            if self.ftpFrame :
                SwingUtilities.updateComponentTreeUI(self.ftpFrame)
            if self.mailFrame :
                SwingUtilities.updateComponentTreeUI(self.mailFrame)
            if self.smsFrame :
                SwingUtilities.updateComponentTreeUI(self.smsFrame)
            if self.actionDialog :
                SwingUtilities.updateComponentTreeUI(self.actionDialog)
            if self.profileDialog :
                SwingUtilities.updateComponentTreeUI(self.profileDialog)            
        except :
            self.status.setText('Cannot load Look&Feel')
            print "<<Agent>> Cannot load Look&Feel"
        self.rebindConsoleKeymap()
    
    def onHowToUseAgent(self, event) :
        self.status.setText('Help')
        #JOptionPane.showMessageDialog(self, 'How to use agent under construct', 'How to use agent', JOptionPane.INFORMATION_MESSAGE)
        startFile('manual/manual.html')
    
    def onAboutAgentProgram(self, event) :
        self.status.setText('About PWB')
        JOptionPane.showMessageDialog(self, JLabel(ImageIcon(IMAGE_PATH+'startup.jpg')), 'About Programmable Web Browser', -1, None)

#Begin toolbar handlers
    
#Begin tabbedpane handler

    def onChangeMode(self, e) :
        pane = e.getSource()
        mode = pane.getSelectedIndex()
        # mode of tab pane 0=script; 1=event; 2=console
        self.changeMode(mode)
        
#Begin utility routines
    def convertToDisplay(self,ls) :
        newls = []
        for item in ls:
            newls.append(item[1] + " " + item[2] + " -> " + item[3])
        return newls

    def changeMode(self, mode) :
        ########################################3
        if mode == 0 : #Script mode
            self.status.setText('Script Mode')
            self.mode_radio_item1.setSelected(1)
            self.tab.setSelectedIndex(0)
            self.setTitle('PWB Agent | Script - ['+self.current_script_name+']')
            
            self.script_file_menu.setVisible(1)
            self.list_file_menu.setVisible(0)
            self.console_file_menu.setVisible(0)
        
            self.script_command_menu.setVisible(1)
            self.event_command_menu.setVisible(0)
            self.console_command_menu.setVisible(0)
            
            self.edit_menu.setVisible(1)
        ##########################################
        elif mode == 1 : #Event mode
            self.status.setText('Event Mode')
            self.mode_radio_item2.setSelected(1)
            self.tab.setSelectedIndex(1)
            self.setTitle('PWB Agent | Event list - ['+self.current_event_list_name+']')
            
            self.script_file_menu.setVisible(0)
            self.list_file_menu.setVisible(1)
            self.console_file_menu.setVisible(0)
        
            self.script_command_menu.setVisible(0)
            self.event_command_menu.setVisible(1)
            self.console_command_menu.setVisible(0)
        
            self.edit_menu.setVisible(0)
            #hide popup if any
            if self.popup :
                self.popup.hide()
        ##########################################
        elif mode == 2 : #Console mode
            self.status.setText('Console Mode')
            self.mode_radio_item3.setSelected(1)
            self.tab.setSelectedIndex(2)
            self.setTitle('PWB Agent | Console')
            
            self.script_file_menu.setVisible(0)
            self.list_file_menu.setVisible(0)
            self.console_file_menu.setVisible(1)
        
            self.script_command_menu.setVisible(0)
            self.event_command_menu.setVisible(0)
            self.console_command_menu.setVisible(1)
        
            self.edit_menu.setVisible(0)
            #hide popup if any
            if self.popup :
                self.popup.hide()

    def synchronizeTime(self, event=None) :
        startTime = Date().getTime()
        #get server time
        try :
            f = urllib.urlopen('http://www.graduate.kmitl.ac.th/servlet/proj_gradl.timecgi')
        except :
            print '<<Agent>> Cannot connect to Time-Server'
            return 0  #cannot retrieve server time so use local time
        serverTimeRaw = f.readline()    #string in milisecs format
        f.close()
        endTime = Date().getTime()
        diff = endTime - startTime
        serverTime = str( Date( long( serverTimeRaw ) + diff ) )
        #set time to local machine
        timeCMD = 'time '+serverTime[11:19]
        if not runCMD(timeCMD) :
            print '<<Agent>> Cannot set local time'
            return 0
        #set date to local machine
        dateCMD = 'date '+self.monthOrder( serverTime[4:7] )+'-' + serverTime[8:10]+'-' + serverTime[-4:]
        if not runCMD(dateCMD) :
            print '<<Agent>> Cannot set local date'
            return 0
        return 1
            
    def monthOrder(self, month) :
        dict = {'Jan' : '1', 'Feb' : '2', 'Mar' : '3', 'Apr' : '4',
                'May' : '5', 'Jun' : '6', 'Jul' : '7', 'Aug' : '8',
                'Sep' : '9', 'Dec' : '10', 'Nov' : '11', 'Dec' : '12'}
        return dict[month]
    
    def execEventAction(self, action, index) :
        if action == "closeAgent()" :
            self.onExitProgram(None, 0) # no alert
            print "<<Agent>> Exit"
        try :
            self.current_event_list[index][1] = 'done'
            exec action in self.agentNameSpace
            print "<<Agent>> Execute event done"            
        except :
            print "<<Agent>> Execute event fail !!"
            self.current_event_list[index][1] = 'fail'
        displayList = self.convertToDisplay(self.current_event_list)
        self.event_list.setListData(displayList) #update Jlist
        
    def timing(self) :
        while(1) :   # loop forever
            try :
                #self.day=time.strftime("%w, %d/%m/%Y %H:%M:%S")   # time.gmtime()
                now = Date()
                self.nowDate = now.toString() [8:10] + ' ' + now.toString() [4:7] + ' ' + now.toString() [-4:]
                self.nowTime = now.toString() [11:19]
                now.setSeconds(0)   #Comparison not include second
                self.time_status.setText(self.nowTime)
                self.time_status.setToolTipText(self.nowDate)
                
                listLen = len(self.current_event_list)
                for index in range(listLen) :
                    try :
                        item = self.current_event_list[index]
                        itemType = item[0]
                        itemFlag = item[1]
                        itemEvent = item[2]
                        itemAction = item[3]
                    except :
                        print "<<Agent>> Time format not correct"
                    try :
                        if itemType == 'time' and itemFlag == 'active' :
                            if Date(itemEvent).toString() == now.toString() :
                                print '<<Agent>> This item active at ' + self.nowTime
                                start_new_thread(self.execEventAction, (itemAction,index))
                    except :
                        pass
                    
                time.sleep(0.2)
                self.rebindConsoleKeymap()
            except :
                print '<<Agent>> Index error in [time event] but no harm, continuing the task'
            
    def othersEvent(self) :
        while(1) :
            try :
                listLen = len(self.current_event_list)
                for index in range(listLen) :
                    item = self.current_event_list[index]
                    itemType = item[0]
                    itemFlag = item[1]
                    itemEvent = item[2]
                    itemAction = item[3]
                    if itemType == 'others' and itemFlag == 'active' :
                        self.current_event_list[index][1] = 'halt'
                        try :                            
                            result = eval(itemEvent, self.agentNameSpace)
                            if result == None :
                                pass
                            elif result == 0 :
                                raise
                            # no exception thrown, success -> run action and status must be done or fail
                            print '<<Agent>> This item active at ' + self.nowTime
                            start_new_thread(self.execEventAction, (itemAction, index))
                        except :
                            # return exception, means event not success -> status must be halt
                            displayList = self.convertToDisplay(self.current_event_list)
                            self.event_list.setListData(displayList) #update Jlist
                            continue             
                time.sleep(0.2)
            except :
                print '<<Agent>> Index error in [other events] but no harm, continuing the task'

    def mailChecking(self) :
        while(1) :   # loop forever
            try :
                listLen = len(self.current_event_list)
                for index in range(listLen) :
                    item = self.current_event_list[index]
                    itemType = item[0]
                    itemFlag = item[1]
                    itemEvent = item[2]
                    itemAction = item[3]
                    if itemType == 'mail' and itemFlag == 'active' :
                        # split the and find outthe == servername, username, password
                        try :
                            user, rest = itemEvent.split('@')
                            servername, passwd = rest.split(':')
                        except :
                            print "<<Agent>> Mail event format not correct"
                            continue
                        print '<<Agent>> Connecting... to Mail server'
                        try :
                            server = poplib.POP3(servername)
                            server.user(user)                    # connect, login to mail server
                            server.pass_(passwd)                 # pass is a reserved word
                            print '<<Agent>> ' + server.getwelcome()    
                            (msgCount, msgBytes) = server.stat()
                            server.quit() 
                            print '<<Agent>> Inbox mail : ' + str(msgCount)
                            if len(item) == 4 :     #have not been initialize
                                item.append(msgCount)
                            elif len(item) == 5 :   #initialize already
                                if msgCount > item[4] :     #compare to initialized value
                                    print '<<Agent>> This item active at ' + self.nowTime
                                    start_new_thread(self.execEventAction, (itemAction, index))                                
                        except :
                            print '<<Agent>> Error for connecting to Mail server ' + servername
                time.sleep(30)  #stop for 30 secs. and the check mail box again
            except :
                print '<<Agent>> Index error in [mail event] but no harm, continuing the task'
            
class AddActionDialog(JDialog) :
    
    def __init__(self, main) :
        self.main = main
        JDialog.__init__(self, main, 'Add Actions', 1)        
        self.setSize(270, 380)
        self.setResizable(0)
        self.contentPane.setLayout( BorderLayout() )
        
        timeEventPanel = JPanel( FlowLayout() )
        '''gb1 = GridBagLayout()
        timeEventPanel.setLayout( gb1 )
        constraints = GridBagConstraints()'''

        dateModel = SpinnerDateModel(Date(main.nowDate + ' ' + main.nowTime), None, None, Calendar.MINUTE)
        self.dateSpinner = JSpinner(dateModel)
        dateEditor = JSpinner.DateEditor(self.dateSpinner, "yyyy/MM/dd HH:mm")
        self.dateSpinner.setEditor(dateEditor)
        self.dateSpinner.setBorder(BorderFactory.createEtchedBorder())
        self.dateSpinner.setPreferredSize(Dimension(150, 25))
                
        timeEventPanel.add(self.dateSpinner)
       
        ############        

        mailEventPanel = JPanel()
        mailEventPanel.setLayout( GridLayout(0,1) )
        svPanel = JPanel()
        la = FlowLayout()
        la.setAlignment(FlowLayout.LEFT)
        svPanel.setLayout(la)
        lb1 = JLabel('Server :')
        lb1.setPreferredSize(Dimension(70, 20))
        svPanel.add(lb1)
        self.serverTx= JTextField('my.mail.server')
        self.serverTx.setPreferredSize(Dimension(100, 20))
        #self.serverTx.setText('diamond.ce.kmitl.ac.th')
        svPanel.add(self.serverTx)
        mailEventPanel.add(svPanel)

        unPanel = JPanel()
        unPanel.setLayout(la)
        lb1 = JLabel('User name :')
        lb1.setPreferredSize(Dimension(70, 20))        
        unPanel.add(lb1)
        self.userTx= JTextField('my.mail.address')
        self.userTx.setPreferredSize(Dimension(100, 20))
        #self.userTx.setText('s1014172')
        unPanel.add(self.userTx)
        mailEventPanel.add(unPanel)

        pwPanel = JPanel()
        pwPanel.setLayout(la)
        lb1 = JLabel('Password :  ')
        lb1.setPreferredSize(Dimension(70, 20))        
        pwPanel.add(lb1)
        self.password= JPasswordField('my.mail.password')
        self.password.setPreferredSize(Dimension(100, 20))
        pwPanel.add(self.password)
        mailEventPanel.add(pwPanel)
        ###########
        self.tab = JTabbedPane(stateChanged = self.onChangeMode)
        self.tab.addTab('Time', ImageIcon(IMAGE_PATH + 'time.gif'), timeEventPanel)
        self.tab.addTab('Mail', ImageIcon(IMAGE_PATH + 'mail.gif'), mailEventPanel)
        eventPanel = JPanel()
        eventPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Event") )
        eventPanel.setLayout( GridLayout(1, 0) )
        eventPanel.add(self.tab)
        self.contentPane.add(eventPanel, BorderLayout.CENTER)


        actionPanel = JPanel()
        actionPanel.setLayout( BoxLayout(actionPanel, BoxLayout.Y_AXIS) )
        actionPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Action") )
        sortedActionList = actionDes.keys()
        sortedActionList.sort()
        self.actionCb = JComboBox(sortedActionList, itemStateChanged = self.onItemChange)
        actionPanel.add(self.actionCb)
        self.actionParam = JTextField()
        actionPanel.add(self.actionParam)
        desPanel = JPanel()
        desPanel.setPreferredSize(Dimension(200, 120))
        desPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Description") )
        desPanel.setLayout( BorderLayout() )
        self.desTx = JTextArea(3,5)
        self.desTx.setEditable(0)
        #self.desTx.setLineWrap(1)
        desPanel.add( JScrollPane(self.desTx) )
        actionPanel.add(desPanel)
        self.contentPane.add(actionPanel, BorderLayout.SOUTH)
        
        btPanel = JPanel()
        btPanel.setLayout( BoxLayout(btPanel, BoxLayout.Y_AXIS) )
        addBt = JButton('Add', actionPerformed = self.onAddToList)
        exitBt = JButton('Exit', actionPerformed = self.onExitAddAction)
        btPanel.add(addBt)
        btPanel.add(exitBt)
        self.contentPane.add(btPanel, BorderLayout.EAST)
        #Set default selected action
        self.actionCb.setSelectedIndex(0)
        self.onItemChange(None)
    
    def onAddToList(self, e) :
        n = self.tab.getSelectedIndex()
        actionItem = self.actionCb.getSelectedItem()[:-1] + self.actionParam.getText() + ')'
        if n == 0 :    # time event mode
            # eventItem = self.activeYear.getText()+'/'+self.activeMonth.getText()+'/'+self.activeDate.getText()+' '+self.activeHour.getText()+':'+self.activeMin.getText()
            date = self.dateSpinner.getValue()
            eventItem = "%d/%d/%d %d:%d" % (date.getYear()+1900, date.getMonth()+1, date.getDate(), date.getHours(), date.getMinutes())
            listItem = ['time', 'active', eventItem, actionItem]
        elif n == 1 :    # mail event mode
            # ==== evaluate if it is meaningful, if not manage it as string      
            try :
                server = eval(self.serverTx.text, self.main.agentNameSpace)
            except :
                server = self.serverTx.text
            try :
                user = eval(self.userTx.text, self.main.agentNameSpace)
            except :
                user = self.userTx.text
            try :
                password = eval(self.password.text, self.main.agentNameSpace)
            except :
                password = self.password.text
            # ===========
            eventItem = user + '@' + server + ':' + password
            listItem = ['mail', 'active', eventItem, actionItem]
        self.main.current_event_list.append(listItem)
        displayList = self.main.convertToDisplay(self.main.current_event_list)
        self.main.event_list.setListData(displayList)
            
    def onExitAddAction(self, e) :
        self.dispose()

    def onChangeMode(self, e) :
        pane = e.getSource()
        n = pane.getSelectedIndex()

        if n == 0 :    #time event mode
            self.tab.setSelectedIndex(0)
                
        elif n == 1 :    #mail event mode
            self.tab.setSelectedIndex(1)

    def onItemChange(self, e) :
        selectedAction = self.actionCb.getSelectedItem()
        self.actionParam.setText(actionParam[selectedAction])
        self.desTx.setText(actionDes[selectedAction])


class UserProfileDialog(JDialog) :
    
    def __init__(self, main) :
        self.main = main
        JDialog.__init__(self, main, 'User Profile', 1)        
        self.setSize(350, 420)
        self.setResizable(0)
        self.contentPane.setLayout( BorderLayout() )

        self.buildProfilePane()
        self.buildBrowserPane()
        self.buildFTPPane()
        self.buildMailPane()
        self.buildSMSPane()
        self.buildSettingPane()

        self.tab = JTabbedPane()        
        self.tab.addTab(None, ImageIcon(IMAGE_PATH+'edit.gif'), self.profilePane, 'Profile')
        self.tab.addTab(None, ImageIcon(IMAGE_PATH+'browser.gif'), self.browserPane, 'Browser')
        self.tab.addTab(None, ImageIcon(IMAGE_PATH+'ftp.gif'), self.ftpPane, 'FTP Client')
        self.tab.addTab(None, ImageIcon(IMAGE_PATH+'mail.gif'), self.mailPane, 'Mail Client')
        self.tab.addTab(None, ImageIcon(IMAGE_PATH+'mobile.gif'), self.smsPane, 'SMS Sender')
        self.tab.addTab(None, ImageIcon(IMAGE_PATH+'gear.gif'), self.settingPane, 'Settings')
            
        self.bottom = JPanel( FlowLayout(FlowLayout.RIGHT) )
        self.bottom.add( JButton('OK', actionPerformed=self.onOK) )
        self.bottom.add( JButton('Cancel', actionPerformed=self.onCancel) )
        self.bottom.add( JButton('Apply', actionPerformed=self.onApply) )
        
        self.contentPane.add(self.tab, BorderLayout.CENTER)
        self.contentPane.add(self.bottom, BorderLayout.SOUTH)

    def buildProfilePane(self) :
        gbl = GridBagLayout()
        gbc = GridBagConstraints()
        self.profilePane = JPanel(gbl)

        username_lb = JLabel('User name')
        username_lb.setPreferredSize(Dimension(100, 20))
        self.username_tf = JTextField(self.main.user_name)
        self.username_tf.setPreferredSize(Dimension(150, 20))
        self.username_tf.setEditable(0)
        password_lb = JLabel('Old password')
        password_lb.setPreferredSize(Dimension(130, 20))
        self.password_pf = JPasswordField()
        self.password_pf.setPreferredSize(Dimension(120, 20))
        password1_lb = JLabel('New password')
        password1_lb.setPreferredSize(Dimension(130, 20))
        self.password1_pf = JPasswordField()
        self.password1_pf.setPreferredSize(Dimension(120, 20))
        password2_lb = JLabel('Confirmed new password')
        password2_lb.setPreferredSize(Dimension(130, 20))
        self.password2_pf = JPasswordField()
        self.password2_pf.setPreferredSize(Dimension(120, 20))
        email_lb = JLabel('E-mail')
        email_lb.setPreferredSize(Dimension(100, 20))
        self.email_tf = JTextField(self.main.user_email)
        self.email_tf.setPreferredSize(Dimension(150, 20))        
        
        pwPane = JPanel( GridLayout(3,2) )
        pwPane.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "User password") )
        pwPane.add(password_lb)
        pwPane.add(self.password_pf)
        pwPane.add(password1_lb)
        pwPane.add(self.password1_pf)
        pwPane.add(password2_lb)
        pwPane.add(self.password2_pf)
        

        gbc.gridx = 0
        gbc.gridy = 0
        gbl.setConstraints(username_lb, gbc)
        self.profilePane.add(username_lb)
        gbc.gridx = 1
        gbc.gridy = 0
        gbl.setConstraints(self.username_tf, gbc)
        self.profilePane.add(self.username_tf)
        gbc.gridx = 0
        gbc.gridy = 1
        gbc.gridwidth = 2
        gbl.setConstraints(pwPane, gbc)
        self.profilePane.add(pwPane)
        '''gbl.setConstraints(password_lb, gbc)
        self.profilePane.add(password_lb)
        gbc.gridx = 1
        gbc.gridy = 1
        gbl.setConstraints(password_pf, gbc)
        self.profilePane.add(password_pf)'''
        gbc.gridx = 0
        gbc.gridy = 3
        gbc.gridwidth = 1
        gbl.setConstraints(email_lb, gbc)
        self.profilePane.add(email_lb)
        gbc.gridx = 1
        gbc.gridy = 3
        gbl.setConstraints(self.email_tf, gbc)
        self.profilePane.add(self.email_tf)
        
    def buildBrowserPane(self) :
        self.browserPane = JPanel( BorderLayout() )

        favPane = JPanel( BorderLayout() )
        favPane.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "WebSite Favorites") )
        cachePane = JPanel( FlowLayout(FlowLayout.LEFT) )
        cachePane.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Cache") )        
        self.browserPane.add(favPane, BorderLayout.CENTER)
        self.browserPane.add(cachePane, BorderLayout.SOUTH)

        clearCache = JButton('Clear all cache URL', actionPerformed=self.onClearCache)
        cachePane.add(clearCache)
        
        table = []
        try :
            f = open(self.main.user_path + BROWSER_FAV_FILE)
            lines = f.readlines()
            f.close()
        except :
            print "<<Agent>> Error reading favorites file"
        try :
            for line in lines :
                favName, favURL = map(string.strip, line.split('::'))
                table.append((favName, favURL))
        except :
            print "<<Agent>> Favorites file format not correct"
        l = len(table)
        if l < 30 :
            for i in range(30-l) :
                table.append(('',''))

        self.favTable = JTable(table, ('Name', 'Location') )
        favPane.add(JScrollPane(self.favTable), BorderLayout.CENTER)

    def buildFTPPane(self) :
        self.ftpPane = JPanel(BorderLayout())

        p = JPanel(GridLayout(3, 2))
        p.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "FTP user-profile") )        
        self.ftp_server_tf = JTextField()
        #self.ftp_server_tf.setPreferredSize(Dimension(100, 20))
        self.ftp_username_tf = JTextField()
        self.ftp_password_pf = JPasswordField()

        p.add(JLabel("FTP server :"))
        p.add(self.ftp_server_tf)
        p.add(JLabel("Username :"))
        p.add(self.ftp_username_tf)
        p.add(JLabel("Password :"))
        p.add(self.ftp_password_pf)
        
        try :
            f = open(self.main.user_path + FTP_PROFILE)
            lines = f.readlines()
            f.close()            
        except :
            pass
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'server' :
                    self.ftp_server_tf.text = value
                elif key == 'username' :
                    self.ftp_username_tf.text = value
                elif key == 'password' :
                    self.ftp_password_pf.text = value
        except :
            pass
        # ------ read FTP favorite server
        lines = []
        f = None
        try :
            f = open(self.main.user_path + FTP_FAV_FILE, 'r')
            lines = f.readlines()
            f.close()
        except :
            print "<<Agent>> Error reading FTP-favorite file"

        table = []
        try :
            for line in lines :
                favName, favURL = map(string.strip, line.split('::'))
                if (not favName) :
                    continue
                table.append((favName, favURL))
        except :
            print "<<Agent>> FTP-Favorite file corrupt"
        l = len(table)
        if l < 30 :
            for i in range(30-l) :
                table.append(('', ''))

        self.ftpFavTable = JTable(table, ('Name', 'FTP-Server Location'))
        p2 = JPanel(BorderLayout())
        p2.add(JScrollPane(self.ftpFavTable))
        p2.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "FTP Favorites") )
        self.ftpPane.add(p, BorderLayout.NORTH)
        self.ftpPane.add(p2, BorderLayout.CENTER)        
        
    def buildMailPane(self) :
        self.mailPane = JPanel(BorderLayout())

        p = JPanel(GridLayout(3, 2))
        p.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Mail user-profile") )        
        self.mail_server_tf = JTextField()
        #self.mail_server_tf.setPreferredSize(Dimension(100, 20))
        self.mail_address_tf = JTextField()
        self.mail_password_pf = JPasswordField()

        p.add(JLabel("Mail server :"))
        p.add(self.mail_server_tf)
        p.add(JLabel("Address :"))
        p.add(self.mail_address_tf)
        p.add(JLabel("Password :"))
        p.add(self.mail_password_pf)
        
        try :
            f = open(self.main.user_path + MAIL_PROFILE)
            lines = f.readlines()
            f.close()            
        except :
            pass
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'server' :
                    self.mail_server_tf.text = value
                elif key == 'address' :
                    self.mail_address_tf.text = value
                elif key == 'password' :
                    self.mail_password_pf.text = value
        except :
            pass
        # ------ read address book
        lines = []
        f = None
        try :
            f = open(self.main.user_path + MAIL_BOOK, 'r')
            lines = f.readlines()
            f.close()
        except :
            print "<<Agent>> Error reading Address book"
        
        table = []
        try :
            for line in lines :
                bname, baddress = map(string.strip, line.split('::'))
                if (not bname) :
                    continue
                table.append((bname, baddress))
        except :
            print "<<Agent>> Address book file corrupt"
        l = len(table)
        if l < 30 :
            for i in range(30-l) :
                table.append(('', ''))

        self.addrTable = JTable(table, ('Name', 'E-mail Address'))
        p2 = JPanel(BorderLayout())
        p2.add(JScrollPane(self.addrTable))
        p2.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "E-mail address book") )
        self.mailPane.add(p, BorderLayout.NORTH)
        self.mailPane.add(p2, BorderLayout.CENTER)        
        
    def buildSMSPane(self) :
        self.smsPane = JPanel(BorderLayout())

        p = JPanel(GridLayout(3, 2))
        p.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "SMS user-profile") )        
        self.sms_server_tf = JTextField('<use default-server>')
        self.sms_server_tf.setEditable(0)
        self.sms_username_tf = JTextField()
        self.sms_password_pf = JPasswordField()

        p.add(JLabel("SMS server :"))
        p.add(self.sms_server_tf)
        p.add(JLabel("Username :"))
        p.add(self.sms_username_tf)
        p.add(JLabel("Password :"))
        p.add(self.sms_password_pf)
        
        try :
            f = open(self.main.user_path + SMS_PROFILE)
            lines = f.readlines()
            f.close()            
        except :
            pass
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'username' :
                    self.sms_username_tf.text = value
                elif key == 'password' :
                    self.sms_password_pf.text = value
        except :
            pass
        # ------ read address book
        lines = []
        f = None
        try :
            f = open(self.main.user_path + PHONE_BOOK, 'r')
            lines = f.readlines()
            f.close()
        except :
            print "<<Agent>> Error reading Phone book"
        
        table = []
        try :
            for line in lines :
                bname, bnumber = map(string.strip, line.split('::'))
                if (not bname) :
                    continue
                table.append((bname, bnumber))
        except :
            print "<<Agent>> Address book file corrupt"
        l = len(table)
        if l < 30 :
            for i in range(30-l) :
                table.append(('', ''))

        self.phoneTable = JTable(table, ('Name', 'Phone Number'))
        p2 = JPanel(BorderLayout())
        p2.add(JScrollPane(self.phoneTable))
        p2.setBorder( BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Phone book") )
        self.smsPane.add(p, BorderLayout.NORTH)
        self.smsPane.add(p2, BorderLayout.CENTER)        
        
        
    def buildSettingPane(self) :
        self.settingPane = JPanel(BorderLayout())
        pane = JPanel(GridLayout(6, 1))
        #pane.setPreferredSize(Dimension(300, 300))
        pane.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), 'Agent settings'))
        self.settingPane.add(pane, BorderLayout.NORTH)

        p = JPanel(FlowLayout(FlowLayout.LEFT))
        lb = JLabel('Look & Feel style : ')
        lb.setPreferredSize(Dimension(100, 20))
        self.setting_lookandfeel_cb = JComboBox(['Metal', 'Motif', 'Windows'])
        self.setting_lookandfeel_cb.setPreferredSize(Dimension(100, 20))
        self.setting_lookandfeel_cb.setSelectedItem(self.main.user_lookandfeel)        
        p.add(lb)
        p.add(self.setting_lookandfeel_cb)
        pane.add(p)

        p = JPanel(FlowLayout(FlowLayout.LEFT))
        self.setting_servertime_cb = JCheckBox('Automatically synchronize time when login', self.main.user_servertime)
        bt = JButton(ImageIcon(IMAGE_PATH+'go_small.gif'), actionPerformed=self.main.synchronizeTime)
        bt.addMouseListener(self.main.MyMouseListener_bt())
        bt.setBorderPainted(0)
        bt.setToolTipText('Synchronize Time Now')
        bt.setPreferredSize(Dimension(25, 22))
        p.add(self.setting_servertime_cb)
        p.add(bt)
        pane.add(p)

        p = JPanel(FlowLayout(FlowLayout.LEFT))
        self.setting_sound_cb = JCheckBox('Enable sounds', self.main.user_sound)
        p.add(self.setting_sound_cb)
        #pane.add(p)

        p = JPanel(FlowLayout(FlowLayout.LEFT))
        lb = JLabel('Startup script')
        self.setting_startupscript_tf = JTextField(self.main.user_startupscript)
        self.setting_startupscript_tf.setPreferredSize(Dimension(200, 20))
        bt = JButton('...', actionPerformed=self.onSettingOpenFile)
        bt.setPreferredSize(Dimension(20, 20))
        bt.addMouseListener(self.main.MyMouseListener_bt())
        bt.setBorderPainted(0)
        bt.setToolTipText('Browse')
        p.add(lb)#, BorderLayout.WEST)
        p.add(self.setting_startupscript_tf)#, BorderLayout.CENTER)
        p.add(bt)#, BorderLayout.EAST)
        pane.add(p)

    def onSettingOpenFile(self, event) :
        fc =  JFileChooser("./scripts")
        result = fc.showOpenDialog(self)
        if result ==JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            pathname = file.getPath()
            self.setting_startupscript_tf.setText(pathname)
            
    def onOK(self, event) :
        if self.username_tf.text == 'Default-User' :
            self.onCancel(event)
            return
        # we need to apply all; and then, close dialog
        self.onApplyProfile()
        self.onApplyBrowser()
        self.onApplyFTP()
        self.onApplyMail()
        self.onApplySMS()
        self.onApplySetting()
        # do just like cancel
        self.onCancel(event)

    def onCancel(self, event) :
        self.dispose()

    def onApply(self, event) :
        if self.username_tf.text == 'Default-User' :
            return        
        # get the active component and apply only that plane
        index = self.tab.getSelectedIndex()
        if index == -1 :
            return
        # onApply Profile
        elif index == 0 :
            self.onApplyProfile()
            print "<<Agent>> User profile have been updated"
        # onApply Browser
        elif index == 1 :
            self.onApplyBrowser()
            print "<<Agent>> Browser profile have been updated"
        # onApply FTP
        elif index == 2 :
            self.onApplyFTP()
            print "<<Agent>> FTP-Client profile have been updated"
        # onApply Mail
        elif index == 3 :
            self.onApplyMail()
            print "<<Agent>> Mail-Client profile have been updated"
        # onApply SMS
        elif index == 4 :
            self.onApplySMS()
            print "<<Agent>> SMS-Sender profile have been updated"
        # onApply Alias
        elif index == 5 :
            self.onApplySetting()
            print "<<Agent>> Agent-Setting have been updated"
                    
    def onClearCache(self, event) :
        try :
            f = open(self.main.user_path + BROWSER_CACHE_FILE, 'w')
            f.close()
            print "<<Agent>> Cache file have been cleard"
        except :
            print "<<Agent>> Error opening cache file"

    def onApplyProfile(self) :
        username = self.username_tf.getText()
        pw0 = self.password_pf.getText()
        pw1 = self.password1_pf.getText()
        pw2 = self.password2_pf.getText()
        email = self.email_tf.getText()

        # apply to agent property
        self.main.user_name = username
        self.main.user_email = email
        if (pw0 == self.main.user_password) and (pw1 == pw2) :
            self.main.user_password = pw1
        else :
            print "<<Agent>> Password changed not grant"
        # apply to file profile.txt
        try :
            f = open(self.main.user_path + USER_PROFILE_FILE, 'w')
            f.write('username :: ' + self.main.user_name + '\n')            
            f.write('password :: ' + self.main.user_password + '\n')            
            f.write('email :: ' + self.main.user_email + '\n')            
            f.close()
        except :
            print "<<Agent>> Error writing user profile file"
        
    def onApplyBrowser(self) :
        # get information from dialog
        favorites = {}
        for row in range(self.favTable.getRowCount()) :
            favName = self.favTable.getValueAt(row, 0).strip()
            favURL = self.favTable.getValueAt(row, 1).strip()
            if not favName :
                continue
            favorites[favName] = favURL
        # update agent name space
        self.main.agentNameSpace['my'].browser.favorites = favorites
        # update to file
        try :
            f = open(self.main.user_path + BROWSER_FAV_FILE, 'w')
            for favName in favorites.keys() :
                line = ("%s :: %s\n") % (favName, favorites[favName])
                f.write(line)
        except :
            print "<<Agent>> Error writing favorites file"
        f.close()
            
    def onApplyFTP(self) :
        # get FTP information from dialog
        server = self.ftp_server_tf.text
        username = self.ftp_username_tf.text
        password = self.ftp_password_pf.text
        favorites = {}
        for row in range(self.ftpFavTable.getRowCount()) :
            favName = self.ftpFavTable.getValueAt(row, 0).strip()
            favURL = self.ftpFavTable.getValueAt(row, 1).strip()
            if not favName :
                continue
            favorites[favName] = favURL
        # update agent name space
        self.main.agentNameSpace['my'].ftp.server = server
        self.main.agentNameSpace['my'].ftp.username = username
        self.main.agentNameSpace['my'].ftp.password = password
        self.main.agentNameSpace['my'].ftp.favorites = favorites
        # update to file
        lines = "server :: %s\nusername :: %s\npassword :: %s" % (server, username, password)
        try :
            f = open(self.main.user_path + FTP_PROFILE, 'w')
            f.write(lines)
            f.close()
        except :
            print "<<Agent>> Error writing FTP-profile file"
        try :
            f2 = open(self.main.user_path + FTP_FAV_FILE, 'w')
            for favName in favorites.keys() :
                line = ("%s :: %s\n") % (favName, favorites[favName])
                f2.write(line)
        except :
            print "<<Agent>> Error writing FTP-favorites file"
        f2.close()
        
    def onApplyMail(self) :
        # get Mail information from dialog
        server = self.mail_server_tf.text
        address = self.mail_address_tf.text
        password = self.mail_password_pf.text
        book = {}
        for row in range(self.addrTable.getRowCount()) :
            bname = self.addrTable.getValueAt(row, 0).strip()
            baddress = self.addrTable.getValueAt(row, 1).strip()
            if not bname :
                continue
            book[bname] = baddress
        # update agent name space
        self.main.agentNameSpace['my'].mail.server = server
        self.main.agentNameSpace['my'].mail.address = address
        self.main.agentNameSpace['my'].mail.password = password
        self.main.agentNameSpace['my'].mail.addrbook = book
        # update to file
        lines = "server :: %s\naddress :: %s\npassword :: %s" % (server, address, password)
        try :
            f = open(self.main.user_path + MAIL_PROFILE, 'w')
            f.write(lines)
            f.close()
        except :
            print "<<Agent>> Error writing Mail-profile file"
        try :
            f2 = open(self.main.user_path + MAIL_BOOK, 'w')
            for name in book.keys() :
                line = ("%s :: %s\n") % (name, book[name])
                f2.write(line)
        except :
            print "<<Agent>> Error writing Mail-favorites file"
        f2.close()
        
    def onApplySMS(self) :
        # get SMS information from dialog
        username = self.sms_username_tf.text
        password = self.sms_password_pf.text
        book = {}
        for row in range(self.phoneTable.getRowCount()) :
            bname = self.phoneTable.getValueAt(row, 0).strip()
            bnumber = self.phoneTable.getValueAt(row, 1).strip()
            if not bname :
                continue
            book[bname] = bnumber
        # update agent name space
        self.main.agentNameSpace['my'].sms.password = password
        self.main.agentNameSpace['my'].sms.phonebook = book
        # update to file
        lines = "username :: %s\npassword :: %s" % (username, password)
        try :
            f = open(self.main.user_path + SMS_PROFILE, 'w')
            f.write(lines)
            f.close()
        except :
            print "<<Agent>> Error writing SMS-profile file"
        try :
            f2 = open(self.main.user_path + PHONE_BOOK, 'w')
            for name in book.keys() :
                line = ("%s :: %s\n") % (name, book[name])
                f2.write(line)
        except :
            print "<<Agent>> Error writing Phone book file"
        f2.close()
        
    def onApplySetting(self) :
        # get information of setting
        lookandfeel = self.setting_lookandfeel_cb.getSelectedItem()
        servertime = self.setting_servertime_cb.isSelected()
        sound = self.setting_sound_cb.isSelected()
        startupscript = self.setting_startupscript_tf.getText()

        # update agent
        self.main.user_lookandfeel = lookandfeel
        self.main.onChangeStyle(None, lookandfeel)
        self.main.user_servertime = servertime
        self.main.user_sound = sound
        self.main.user_startupscript = startupscript

        lines = "look&feel :: %s\nservertime :: %d\nsounds :: %d\nstartupscript :: %s" \
                % (lookandfeel, servertime, sound, startupscript)
        # update to file
        try :
            f = open(self.main.user_path + SETTING_FILE, 'w')
            f.write(lines)
            f.close()
        except :
            print "<<Agent>> Error writing Settings file"        
    
class LoginDialog :
    def __init__(self, parent) :
        self.parent = parent

        self.user_path = ''
        self.user_name = ''
        self.user_password = ''
        self.user_lookandfeel = ''
        self.user_email = ''
        self.user_servertime = 1
        self.user_sound = 1
        self.user_startupscript = ''

        self.username = JTextField()
        self.username.setToolTipText('Anonymous if no account')
        self.password = JPasswordField()
        self.option = JComboBox(['Login', 'Create new account', 'Shutdown agent'])

        self.pane = JPanel(GridLayout(3,2))
        self.pane.add(JLabel('Please enter username : '))
        self.pane.add(self.username)
        self.pane.add(JLabel('Please enter password  : '))
        self.pane.add(self.password)
        self.pane.add(JLabel('Please select option : '))
        self.pane.add(self.option)

        self.username.requestFocus()        

    def show(self) :
        result = JOptionPane.showConfirmDialog(self.parent,                                               
                                                self.pane,
                                                'Login to PWB - Agent',
                                                JOptionPane.YES_NO_OPTION,
                                                -1,
                                                ImageIcon(IMAGE_PATH + 'login.gif')
                                                )
        if result==JOptionPane.NO_OPTION :
            return 0
        op = self.option.getSelectedIndex()
        
        #########################
        if op == 2 :  #'Shutdown agent' :
            if JOptionPane.YES_OPTION == JOptionPane.showConfirmDialog(self.parent,
                                                                       'Are you sure to shutdown agent?',
                                                                       'Shudown agent',
                                                                       JOptionPane.YES_NO_OPTION,
                                                                       -1,
                                                                       ImageIcon(IMAGE_PATH + 'shutdown.gif')
                                                                       ) :
                return -1
            else :
                return 0

        # get user input :: username and password
        self.user_name = self.username.getText()
        self.user_password = self.password.getText()
        #######################
        if op == 1 :  # 'Create new account'
            newpath = USER_PROFILE_PATH + self.user_name
            if os.path.isdir(newpath) :
                print "<<Agent>> Cannot create new account since username already exist"
                JOptionPane.showMessageDialog(self.parent, 'Cannot create new account \nsince username already exist!!')
                return 0
            # make new folder and copy template file here
            os.mkdir(newpath)
            self.user_path = newpath + '/'
            f = open(self.user_path+USER_PROFILE_FILE, 'w')
            f.write('username :: ' + self.user_name + '\n')
            f.write('password :: ' + self.user_password + '\n')
            #f.write('look&feel :: Windows\n')
            f.write('email :: \n')
            f.close()
            f = open(self.user_path+DEFAULT_SCRIPT_FILE, 'w')
            f.close()
            f = open(self.user_path+DEFAULT_LIST_FILE, 'w')
            f.close()
            f = open(self.user_path+BROWSER_FAV_FILE, 'w')
            f.close()
            f = open(self.user_path+BROWSER_CACHE_FILE, 'w')
            f.close()
            f = open(self.user_path+FTP_PROFILE, 'w')
            f.close()
            f = open(self.user_path+FTP_FAV_FILE, 'w')
            f.close()
            f = open(self.user_path+MAIL_PROFILE, 'w')
            f.close()
            f = open(self.user_path+MAIL_BOOK, 'w')
            f.close()
            f = open(self.user_path+SMS_PROFILE, 'w')
            f.close()
            f = open(self.user_path+PHONE_BOOK, 'w')
            f.close()            
            f = open(self.user_path+SETTING_FILE, 'w')
            f.close()            
            self.user_lookandfeel = 'Windows'
            return 1
        ###########################        
        if self.user_name == 'Anonymous' :
            self.user_path = './user-profiles/Default-User/'
            self.user_name = 'Default-User'
            self.user_lookandfeel = 'windows'
            return 1
        elif not self.user_name :
            return 0
        else :  #exist user login
            self.user_path = './user-profiles/' + self.user_name
            # check if the user profile exists; if not, return false
            if not os.path.isdir(self.user_path) :
                print "<<Agent>> Username [%s] not found" % (self.user_name, )
                return 0
            self.user_path += '/'
            # try to get password and check with the one user provide
            try :
                f = open(self.user_path + USER_PROFILE_FILE)
                lines = f.readlines()
                f.close()
            except :
                print "<<Agent>> Error reading user profile"
                return 0
            try :
                for line in lines :
                    key, value = map(string.strip, line.split('::'))
                    if key == 'username' :
                        if not (self.user_name == value) :
                            print "<<Agent>> Information in user profile not correct"
                            return 0
                        continue
                    elif key == 'password' :
                        if not (self.user_password == value) :
                            print "<<Agent>> Password not correct"
                            return 0
                        continue
                    elif key == 'email' :
                        self.user_email = value
                        continue
            except :
                print "<<Agent>> Profile format not correct"
                return 0
            # try to get the user setting about agent
            try :
                f = open(self.user_path + SETTING_FILE)
                lines = f.readlines()
                f.close()
            except :
                print "<<Agent>> Error reading setting file"
            try :
                for line in lines :
                    key, value= map(string.strip, line.split('::'))
                    if key == 'look&feel' :
                        self.user_lookandfeel = value
                        continue
                    elif key == 'servertime' :
                        self.user_servertime = int(value)
                        continue
                    elif key == 'sounds' :
                        self.user_sound = int(value)
                        continue
                    elif key == 'startupscript' :
                        self.user_startupscript = value
                        continue
            except :
                print "<<Agent>> Setting file format corrupt"
                
            return 1

    def getLoginInfo(self) :
        self.parent.user_path = self.user_path
        self.parent.user_name = self.user_name
        self.parent.user_password = self.user_password
        self.parent.user_email = self.user_email
        self.parent.user_lookandfeel = self.user_lookandfeel
        self.parent.user_servertime = self.user_servertime
        self.parent.user_sound = self.user_sound
        self.parent.user_startupscript = self.user_startupscript

def createLoadingPopup() :
    toolkit = Toolkit.getDefaultToolkit()
    max = toolkit.getScreenSize()

    image = ImageIcon(IMAGE_PATH+'startup.jpg')
    global status
    status = JLabel('Loading .... WebAgent')
    status.setBackground(Color.WHITE)

    pane = JPanel(BorderLayout())
    pane.add(JLabel(image), BorderLayout.CENTER)
    pane.add(status, BorderLayout.SOUTH)

    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName())
    SwingUtilities.updateComponentTreeUI(pane)
    size = pane.getPreferredSize()
    
    factory =  PopupFactory.getSharedInstance()
    popup = factory.getPopup(
                None,
                pane,
                max.width/2 - size.width/2,
                max.height/2 - size.height/2
            ) 
    return popup
            
       
if __name__ == '__main__' :
    
    status = None
    
    popup = createLoadingPopup()
    popup.show()
    ####################################################
    frame = AgentFrame()
    frame.show()
    ####################################################
    popup.hide()

    # Prompt the login dialog for first come
    frame.showLoginDialog()

'''
    c = Console.Console()
    c.capturePythonOutput()
    c.newInput()
    frame.tab.add('Console2', JScrollPane(c.textpane))'''
    



