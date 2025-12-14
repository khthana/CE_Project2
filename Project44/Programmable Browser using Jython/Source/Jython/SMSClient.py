from java.awt import *
from java.awt.event import *
from javax.swing import *
from javax.swing.event import *
from java.net import URL
from javax.swing.text import *
from javax.swing.text.html import *
from java.lang import *
from java.io import *

import sys
from thread import *
from urllib import *

SMS_PROFILE = 'sms.profile'

class SMSFrame(JFrame) :
    '''SMSFrame([child]) -> SMSFrame Object'''
    class MyWindowAdapter(WindowAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def windowClosing(self, event) :
            self.parent.dispose()
            if self.parent.exit_when_term :
                sys.exit(0)
            
    def __init__(self, child=1, agent=None) :
        self.agent = agent
        self.exit_when_term = not child
        self.setSize(225, 230)
        self.setResizable(0)
        self.setTitle('PWB - SMS Sender')
        self.setIconImage(ImageIcon(r'images/gear.gif').getImage())
        self.addWindowListener(self.MyWindowAdapter(self))
        self.contentPane.setLayout( BorderLayout() )
        
        mainPanel = JPanel()
        mainPanel.setLayout(GridLayout(0,1) )

        serverPanel = JPanel()
        la = FlowLayout()
        la.setAlignment(FlowLayout.LEFT)
        serverPanel.setLayout(la)
        l = JLabel('SMS Server :')
        l.setPreferredSize(Dimension(70, 20))
        serverPanel.add(l)
        self.serverCb= JComboBox(['www.geccorp.com', 'www.ais900.com'], itemStateChanged = self.onServerChange)
        self.serverCb.setPreferredSize(Dimension(135, 23))
        serverPanel.add(self.serverCb)
        mainPanel.add(serverPanel)
        
        telNoPanel = JPanel()
        la = FlowLayout()
        la.setAlignment(FlowLayout.LEFT)
        telNoPanel.setLayout(la)
        l = JLabel('Tel. Number :')
        l.setPreferredSize(Dimension(70, 20))
        telNoPanel.add(l)
        self.telNoTx= JTextField()
        self.telNoTx.setPreferredSize(Dimension(100, 20))
        telNoPanel.add(self.telNoTx)
        mainPanel.add(telNoPanel)

        passwordPanel = JPanel()
        passwordPanel.setLayout(la)
        l = JLabel('Password :')
        l.setPreferredSize(Dimension(70, 20))
        passwordPanel.add(l)
        self.passwordTx= JPasswordField()
        self.passwordTx.setPreferredSize(Dimension(100, 20))
        self.passwordTx.setEditable(0)
        passwordPanel.add(self.passwordTx)
        mainPanel.add(passwordPanel)
        self.contentPane.add(mainPanel, BorderLayout.NORTH)
               
        self.messageTxArea = JTextArea()
        self.messageTxArea.setLineWrap(1)
        self.contentPane.add( JScrollPane(self.messageTxArea), BorderLayout.CENTER )            
        
        btPanel = JPanel()
        btPanel.add(JButton('Send', actionPerformed = self.onSend))
        btPanel.add(JButton('Clear', actionPerformed = self.onClear))
        self.contentPane.add(btPanel, BorderLayout.SOUTH)

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
        pass
    
    def finalize(self) :
        pass
    
    def validateAll(self) :
        pass    
        
    def onSend(self, e=None) :
        start_new_thread( self._onSend, () )
        
    def _onSend(self, showDialog = 1) : 
        telNo = self.telNoTx.getText()
        
        try :
            telNo = str( int(telNo) )   #Test digit and eliminate 0 at the beginning of 01 and 09
        except :
            if showDialog :
                JOptionPane.showMessageDialog(self, 'Telephone number must be digit.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0
        
        if (len(telNo) != 8) or (telNo[0] not in '19') :
            if showDialog :
                JOptionPane.showMessageDialog(self, 'Telephone number must be\n 01 or 09 and follow by 7 digits.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0
        
        password = self.passwordTx.getText()
        message = self.messageTxArea.getText()

        try :
            if  self.serverCb.getSelectedIndex() == 0 :
                self.sendToGec(telNo, message)
            else :
                self.sendToAIS900(telNo, password, message)
            
        except :
            if showDialog :
                JOptionPane.showMessageDialog(self, 'An error occur when trying to send data to SMS server.', 'Error', JOptionPane.ERROR_MESSAGE)
            return 0

        return 1    # No error
        
    def onClear(self, e) :
        self.messageTxArea.setText('')
#Utilities function

    def sendToAIS900(self, telNo, password, message) :
        postDataDict = {'szGsmNo':telNo, 'szGsmPwd':password, 'szMesg':message}
        encodedData = urlencode(postDataDict)
        res = urlopen('http://www.gsm.ais900.com/gsmweb/web2sms.php', encodedData)
        print 'Sending to www.gsm.ais900.com complete'
        
        #action=./web2sms.php
    def sendToGec(self, telNo, message) :
        telNo = '+66'+telNo
        postDataDict = {'gsmno':telNo, 'gsmmsg':message}
        encodedData = urlencode(postDataDict)
        res = urlopen('http://www.geccorp.com/sms/sendsms.cgi', encodedData)
        print 'Sending to www.geccorp.com complete'

    def onServerChange(self, event) :
        if  self.serverCb.getSelectedIndex() == 0 :
            self.passwordTx.setEditable(0)
        else :
            self.passwordTx.setEditable(1)
        
    
if __name__ == '__main__' :
    frame = SMSFrame(0)
    frame.show()

    