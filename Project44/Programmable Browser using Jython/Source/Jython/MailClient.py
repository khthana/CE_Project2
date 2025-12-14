from java.awt import *
from java.awt.event import *
from javax.swing import *
from javax.swing.event import *
from java.net import URL
from javax.swing.text import *
from javax.swing.text.html import *
from java.lang import *
from java.io import *

# import Python Module
import sys
import os
import string
import poplib, rfc822, string, StringIO
import smtplib, time
from thread import *

MAIL_PROFILE = 'mail.profile'

class EMailFrame(JFrame) :
    '''EMailFrame([child]) -> EMailFrame Object'''
    class MyWindowAdapter(WindowAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def windowClosing(self, event) :
            self.parent.finalize()
            self.parent.dispose()
            if self.parent.exit_when_term :
                sys.exit(0)
            
    def __init__(self, child=1, agent=None) :

        self.agent = agent        
        self.exit_when_term = not child
        self.setSize(600, 500)
        self.setTitle('PWB - e-Mail')
        self.setIconImage(ImageIcon(r'images/gear.gif').getImage())
        self.addWindowListener(self.MyWindowAdapter(self))
        self.contentPane.setLayout( BorderLayout() )

        self.loginPanel = JPanel()
        self.loginPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "e-Mail Account") )
        self.loginPanel.setLayout( GridLayout(0,1) )
        svPanel = JPanel()
        la = FlowLayout()
        la.setAlignment(FlowLayout.LEFT)
        svPanel.setLayout(la)
        svPanel.add(JLabel('Server :       '))
        self.serverTx= JTextField()
        self.serverTx.setPreferredSize(Dimension(300, 20))
        #self.serverTx.setText('diamond.ce.kmitl.ac.th')
        svPanel.add(self.serverTx)
        self.loginPanel.add(svPanel)

        unPanel = JPanel()
        unPanel.setLayout(la)
        unPanel.add(JLabel('User name :'))
        self.userTx= JTextField()
        self.userTx.setPreferredSize(Dimension(300, 20))
        #self.userTx.setText('s1014172')
        unPanel.add(self.userTx)
        self.loginPanel.add(unPanel)

        pwPanel = JPanel()
        pwPanel.setLayout(la)
        pwPanel.add(JLabel('Password :  '))
        self.password= JPasswordField()
        self.password.setPreferredSize(Dimension(300, 20))
        #self.password.setText('172thanawatt')
        pwPanel.add(self.password)
        self.loginPanel.add(pwPanel)
        
        self.contentPane.add(self.loginPanel, BorderLayout.NORTH)
        
        self.mailBoxPanel = JPanel()
        self.mailBoxPanel.setLayout(BorderLayout())
        mbtPanel = JPanel()
        self.retrBt = JButton('Retrieve mail', actionPerformed = self.onRetrieveMail)
        mbtPanel.add(self.retrBt)
        self.deleteBt = JButton('Delete mail', actionPerformed = self.onDeleteMail)
        mbtPanel.add(self.deleteBt)
        self.deleteBt.setEnabled(0)
        self.saveBt = JButton('Save mail', actionPerformed = self.onSaveMail)
        mbtPanel.add(self.saveBt)
        self.saveBt.setEnabled(0)
        self.replyBt = JButton('Reply mail', actionPerformed = self.onReplyMail)
        mbtPanel.add(self.replyBt)
        self.replyBt.setEnabled(0)
        self.forwardBt = JButton('Forward mail', actionPerformed = self.onForwardMail)
        mbtPanel.add(self.forwardBt)
        self.forwardBt.setEnabled(0)
        self.mailBoxPanel.add(mbtPanel, BorderLayout.NORTH)
        self.mailList = JList(valueChanged = self.setmailContent)
        self.mailBoxPanel.add(JScrollPane(self.mailList), BorderLayout.CENTER)
        #self.mailContent = JEditorPane('text/html', 'a<br>a<br>a<br>a<br>a<br>a<br>a<br>')
        self.mailContent = JTextArea(10, 10)
        self.mailContent.setEditable(0)
        self.mailBoxPanel.add(JScrollPane(self.mailContent), BorderLayout.SOUTH)
        
        self.composePanel = JPanel()
        self.composePanel.setLayout(BorderLayout())

        composeHeadPanel = JPanel()
        composeHeadPanel.setLayout(GridLayout(0,1) )
        toPanel = JPanel()
        la = FlowLayout()
        la.setAlignment(FlowLayout.LEFT)
        toPanel.setLayout(la)
        toPanel.add(JLabel('To :           '))
        self.toTx= JTextField()
        self.toTx.setPreferredSize(Dimension(300, 20))
        toPanel.add(self.toTx)
        composeHeadPanel.add(toPanel)

        fromPanel = JPanel()
        fromPanel.setLayout(la)
        fromPanel.add(JLabel('From :      '))
        self.fromTx= JTextField()
        self.fromTx.setPreferredSize(Dimension(300, 20))
        fromPanel.add(self.fromTx)
        composeHeadPanel.add(fromPanel)

        subjPanel = JPanel()
        subjPanel.setLayout(la)
        subjPanel.add(JLabel('Subject :  '))
        self.subjTx= JTextField()
        self.subjTx.setPreferredSize(Dimension(300, 20))
        subjPanel.add(self.subjTx)
        composeHeadPanel.add(subjPanel)
        self.composePanel.add(composeHeadPanel, BorderLayout.NORTH)

        self.composeContent = JTextArea()
        self.composePanel.add(JScrollPane(self.composeContent), BorderLayout.CENTER)

        composeBtPanel = JPanel()
        composeBtPanel.add(JButton('Send', actionPerformed = self.onSend))
        composeBtPanel.add(JButton('Clear', actionPerformed = self.onClear))
        self.composePanel.add(composeBtPanel, BorderLayout.SOUTH)
        
        self.tab = JTabbedPane(stateChanged = self.onChangeMode)
        self.tab.add('Mail box', self.mailBoxPanel)
        self.tab.add('Compose message', self.composePanel)
        self.contentPane.add(self.tab, BorderLayout.CENTER)        

        self.initialize()

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

    def initialize(self) :
        self.default_password = ''
        self.default_server = ''
        self.default_username = ''
        try :
            if self.agent :
                path = self.agent.user_path + MAIL_PROFILE
            else :
                path = 'profiles/' + MAIL_PROFILE
            f = open(path)
            lines = map(string.strip, f.readlines())
            f.close()            
        except :
            print "<<Mail>> Profile not found"
        try :
            for line in lines :
                key, value = map(string.strip, line.split('::'))
                if not key :
                    continue
                if key == 'server' :
                    self.default_server = value
                elif key == 'address' :
                    self.default_username = value
                elif key == 'password' :
                    self.default_password = value
        except :
            print "<<Mail>> MAIL-Profile file corrupt"        

    def finalize(self) :
        try :
            if self.agent :
                path = self.agent.user_path + MAIL_PROFILE
            else :
                path = 'profiles/' + MAIL_PROFILE
            f = open(path, 'w')                
        except :
            print "<<Mail>> Profile not found"
        lines = "server :: %s\naddress :: %s\npassword :: %s" % (self.serverTx.text, self.userTx.text, self.password.text)
        try :
            f.write(lines)
            f.close()
        except :
            print "<<Mail>> Error writing profile"

    def validateAll(self) :
        self.initialize()
        self.serverTx.text = self.default_server
        self.userTx.text = self.default_username
        self.password.text = self.default_password
 
    def onRetrieveMail(self, e) :
        start_new_thread(self._onRetrieveMail, () )
       
    def _onRetrieveMail(self, showDialog = 1)  :
        self.msgList = [] #Main list
        self.mailContent.setText('')
        try :
            self.loadMessages( self.serverTx.getText(), self.userTx.getText(), self.password.getText())
            indexList = self.createIndexList(self.msgList)
            self.fromList = self.createFromList(self.msgList)
            self.subjList = self.createSubjList(self.msgList)
            self.mailList.setListData(indexList)
            if self.msgList != [] :
                self.saveBt.setEnabled(1)
                self.replyBt.setEnabled(1)
                self.forwardBt.setEnabled(1)
                self.deleteBt.setEnabled(1)
        except :
            print '<<Mail>> Fail on retrieving mail'
            if showDialog :
                JOptionPane.showMessageDialog(self, 'An error occur when trying to connect to mail server.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0
        return 1    #No error occur
       
    def onSaveMail(self, e) :
        fc =  JFileChooser(".")
        result = fc.showSaveDialog(self)
        if result == JFileChooser.APPROVE_OPTION :
            file = fc.getSelectedFile()
            try :
                self.mailContent.write(FileWriter(file))
            except :
                JOptionPane.showMessageDialog(self, 'An error occur when trying to save mail.', 'Error', JOptionPane.ERROR_MESSAGE)

    def onDeleteMail(self, e) :
        start_new_thread(self._onDeleteMail, () )
        
    def _onDeleteMail(self) :
        #Delete
        servername = self.serverTx.getText()
        user = self.userTx.getText()
        passwd = self.password.getText()
        toDelete = self.mailList.getSelectedIndices()
        verify = 1  #Don't prompt or prompt confirm dialog
        if self.deletemessages(servername, user, passwd, toDelete, verify) :
        #Update list
            self._onRetrieveMail()                    

    def onReplyMail(self, e) :
        si = self.mailList.getSelectedIndex()
        self.toTx.setText(self.fromList[si])
        self.fromTx.setText( self.userTx.getText() + '@' + self.serverTx.getText() )
        self.subjTx.setText('Re :'+self.subjList[si])

        m = '>\n'+self.mailContent.getText()
        m = m.replace('\n','\n>')
        self.composeContent.setText( m )
        self.tab.setSelectedIndex(1)
        
    def onForwardMail(self, e) :
        si = self.mailList.getSelectedIndex()
        self.toTx.setText('')
        self.fromTx.setText( self.userTx.getText() + '@' + self.serverTx.getText() )
        self.subjTx.setText( self.subjList[si] )
        
        m = '>\n'+self.mailContent.getText()
        m = m.replace('\n','\n>')
        self.composeContent.setText( m )
        self.tab.setSelectedIndex(1)
        
    def onSend(self, e=None) :
        start_new_thread(self._onSend, () )

    def _onSend(self, showDialog = 1) :
        To   = self.toTx.getText()     
        To   = string.split(To, ';')  #Change to list
        From = self.fromTx.getText()  
        Subj = self.subjTx.getText()
        date = time.ctime(time.time())
        text = ('From: %s\nTo: %s\nDate: %s\nSubject: %s\n' 
                         % (From, string.join(To, ';'), date, Subj))

        text = text+self.composeContent.getText()
        print '<<Mail>> Connecting...'
        try :
            server = smtplib.SMTP( self.serverTx.getText() )    # connect, no login step
        except :
            if showDialog : #error connect to smtp server
                JOptionPane.showMessageDialog(self, 'An error occur when trying to connect to mail server.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0
        
        try :
            failed = server.sendmail(From, To, text)    #send mail
            
        except:
            if showDialog : #error connect to smtp server
                JOptionPane.showMessageDialog(self, 'An error occur when trying to send mail.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0
        
        server.quit()   #disconnect to smtp server
        
        if failed:    #error sending mail
            print '<<Mail>> Failed sending to recipients:', failed         # too, but let them pass here
            if showDialog :
                JOptionPane.showMessageDialog(self, 'An error occur when trying to send mail.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0    
        else:
            print '<<Mail>> Sending complete'
        
        return 1    #No error

    def setmailContent(self, e) :
        index = self.mailList.getSelectedIndex()
        if index >= 0 :
            content = self.msgList[index]
            self.mailContent.setText(content)
        
    def onClear(self,e) :
        self.composeContent.setText('')
        
    def onChangeMode(self,e) :
        pass



#Utilities    
    def connect(self, servername, user, passwd):
        print '<<Mail>> Connecting...'
        server = poplib.POP3(servername)
        server.user(user)                    # connect, login to mail server
        server.pass_(passwd)                 # pass is a reserved word
        print '<<Mail>>', server.getwelcome()            # print returned greeting message 
        return server

    def loadMessages(self, servername, user, passwd, loadfrom=1):
        server = self.connect(servername, user, passwd)
        try:
            print server.list()
            (msgCount, msgBytes) = server.stat()
            print '<<Mail>> There are', msgCount, 'mail messages in', msgBytes, 'bytes'
            print '<<Mail>> Retrieving:',
            #for i in range(msgCount, loadfrom-1, -1) :
            for i in range(loadfrom, msgCount+1):            # empty if low >= high
                print i,                                     # fetch mail now
                (hdr, message, octets) = server.retr(i)      # save text on list
                self.msgList.append(string.join(message, '\n'))   # leave mail on server
                indexList = self.createIndexList(self.msgList)
                self.mailList.setListData(indexList)
            print
        finally:
            server.quit()                                    # unlock the mail box
        assert len(self.msgList) == (msgCount - loadfrom) + 1     # msg nums start at 1
        #return msgList

    def createIndexList(self, msgList) :
        indexList = []
        count = 0   
        for msg in msgList:                      # strip,show some mail headers
            head = ''
            strfile = StringIO.StringIO(msg)     # make string look like a file
            msghdrs = rfc822.Message(strfile)    # parse mail headers into a dict
            count   = count + 1
            head = str(count)+': '+str(len(msg))+' bytes'
            for hdr in ('From', 'Date', 'Subject'):
                try:
                    head = head+ ' '+hdr+'=>'+msghdrs[hdr] 
                except :
                    head = head+ ' '+hdr+'=>(unknown)' 
                #print '\n\t%s=>%s' % (hdr, msghdrs.get(hdr, '(unknown)')
            indexList.append(head)
        return indexList
    
    def createFromList(self, msgList) :
        fromList = []
        for msg in msgList:                      # strip,show some mail headers
            strfile = StringIO.StringIO(msg)     # make string look like a file
            msghdrs = rfc822.Message(strfile)    # parse mail headers into a dict
            try:
                fromItem = msghdrs['From'] 
            except :
                fromItem = 'unknown'
            fromList.append(fromItem)
        return fromList

    def createSubjList(self, msgList) :
        subjList = []
        for msg in msgList:                      # strip,show some mail headers
            strfile = StringIO.StringIO(msg)     # make string look like a file
            msghdrs = rfc822.Message(strfile)    # parse mail headers into a dict
            try:
                subjItem = msghdrs['Subject'] 
            except :
                subjItem = 'unknown'
            subjList.append(subjItem)
        return subjList
    
    def deletemessages(self, servername, user, passwd, toDelete, verify=0):
        print '<<Mail>> Delete mail :', toDelete
        if verify and 1==JOptionPane.showConfirmDialog(self, 'Are you really want to delete?', 'Confirm',JOptionPane.YES_NO_OPTION) :
            return 0
        else:
            server = self.connect(servername, user, passwd)
            try:
                print '<<Mail>> Deleting messages from server'
                for msgnum in toDelete:                 # reconnect to delete mail
                    server.dele(msgnum+1)                 # mbox locked until quit()
            finally:
                server.quit()
            return 1

if __name__ == '__main__' :
    frame = EMailFrame(0)
    frame.show()
    
    
    