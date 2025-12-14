'''
Programmable Web Browser v 2.0
Module : ScriptUtils Module
Description : Contain parser of script language, definition of language datatype, and event function
Last Updated : 31 January 2002
Programmer :Mr. Thanawat Keawka
            Mr. Boontawee Suntisrivaraporn
Professor : Dr. Visit Hirankitti                        
===========================================
System Requirement
- Java 1.3
- Jython 2.1
- Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2

'''

# this module is very important to keep the import as small as possible because we need to load it many times
# so that we won't waste the time for unnecessary class or module

# import Java Module
from java.awt import GridLayout, Toolkit, Dimension, Font, Color
from java.awt.event import WindowAdapter
from javax.swing import JFrame, JButton, ImageIcon, JProgressBar, JLabel, \
     PopupFactory, BorderFactory, JTextArea, JPanel, JTable, border, JOptionPane, JScrollPane
#from javax.swing.event import *
#from java.lang import *
from java.io import File
from javax.sound.midi import MidiSystem
from java.applet import Applet
from java.net import URL

# import Python Module
import sys
import urllib
import poplib
import os
import time
import string
from thread import start_new_thread

# import My module
from Browser import BrowserFrame
from FTPClient import FTPClientFrame
from MailClient import EMailFrame
from SMSClient import SMSFrame


###########################################
###########################################
########     from _ScriptUtils import *


# this global variable is used to refer to current WebAgent instance
AGENT = None

def getDefaultMailServer() :
    try :
        return eval(my.mail.server)
    except :
        return

TRUE = 1
true = 1
FALSE = 0
false = 0

MYEXCEPTION = 'PWB-Exception'

MAX_WAV_LENGTH = 100
WAV_PATH = 'sounds/wav/'
FAIL_WAV_FILE = 'sounds/wav/missed.wav'
ALERT_WAV_FILE = 'sounds/wav/hello.wav'

# ===============================================================
#============== Utility function used by both Script and Event ================
#================================================================'

def openWebPage(urlName) :
    '''openWebPage(url) -> None'''
    browser = BrowserFrame(None, 0, 1, 0)   # this frame must be child; do not get page yet
    browser.show()
    #browser.cbLocation.getEditor().setItem
    if not browser.goToURL(urlName) :
        browser.onClose(None)   # use this method instead dispose; for fear that unfinalized
        print "<<Script>> Fail to get page : " + urlName
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    print "<<Script>> Open web page complete"

def uploadFile(server, userName, passwd, localFile, remotePath) :
    '''uploadFile(server, userName, passwd, localFile, remotePath) -> None'''
    ftp = FTPClientFrame(os.getcwd(), 1)   # this frame must be child
    ftp.show()
    ftp.serv_tf.setText(server)
    ftp.user_tf.setText(userName)
    ftp.pass_pf.setText(passwd)
    if not ftp.onConnect(None, 0) : # no alert can be shown
        ftp.dispose()
        print "<<Script>> Fail to upload file : cannot connect"
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    if not ftp.uploadFile(localFile, remotePath) :
        ftp.dispose()
        print "<<Script>> Fail to upload file : transfer error"
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    print "<<Script>> Upload file complete"
    ftp.dispose()

def downloadFile(server, userName, passwd, remoteFile, localPath) :
    '''downloadFile(server, userName, passwd, remoteFile, localPath) -> None'''
    ftp = FTPClientFrame(os.getcwd(), 1)   # this frame must be child
    ftp.show()
    ftp.serv_tf.setText(server)
    ftp.user_tf.setText(userName)
    ftp.pass_pf.setText(passwd)
    if not ftp.onConnect(None, 0) : # no alert can be shown
        ftp.dispose()
        print "<<Script>> Fail to download file : cannot connect"
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    if not ftp.downloadFile(remoteFile, localPath) :
        ftp.dispose()
        print "<<Script>> Fail to download file : transfer error"
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    print "<<Script>> Download file complete"
    ftp.dispose()    

def sendMail(toAddr, fromAddr, subject, body) :
    '''sendMail(toAddress, fromAddr, subject, body) -> None'''
    mail = EMailFrame(1)    # this frame must be child
    mail.show()
    mail.tab.setSelectedIndex(1)
    mail.serverTx.setText('diamond.ce.kmitl.ac.th')
    mail.toTx.setText(toAddr)
    mail.fromTx.setText(fromAddr)
    mail.subjTx.setText(subject)
    mail.composeContent.setText(body)
    if not mail._onSend(0) : #Avoid internal thread to work properly (finish before dispose in next step)
        print "<<Event>> Fail to send e-mail : transfer error or input parameter incorrect"
        mail.dispose()
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION    
    mail.dispose()

def numMail(servername, user, passwd) :
        '''numMail(servAddr, user, password) -> number of mails in mail account'''
        try :
                server = poplib.POP3(servername)
                server.user(user)                    # connect, login to mail server
                server.pass_(passwd)                 # pass is a reserved word  
                (msgCount, msgBytes) = server.stat()
                return msgCount
        except :
                print '<<Event>> Error for connecting to Mail server ' + servername
                raise MYEXCEPTION    
    
def checkMail(servAddr, usr, pwd) :
        '''checkMail(servAddr, user, password) -> None '''
        mail = EMailFrame(1)    # this frame must be child
        mail.show()
        mail.tab.setSelectedIndex(0)
        mail.serverTx.setText(servAddr)
        mail.userTx.setText(usr)
        mail.password.setText(pwd)
        if not mail._onRetrieveMail(0) : #Avoid internal thread to work properly (finish before dispose in next step)
                print "<<Event>> Fail to retrieve e-mail : transfer error or input parameter incorrect"
                mail.dispose()
                playWav(FAIL_WAV_FILE)
                raise MYEXCEPTION    
         

def sendSMS(teleNo, mesg, server=0, password='') :
    '''sendSMS(telNo, message, server, password) -> None'''
    sms = SMSFrame(1)   # this frame must be child
    sms.show()
    sms.telNoTx.setText(teleNo)
    sms.serverCb.setSelectedIndex(server)
    if server :
            sms.passwordTx.setText(password)
    #sms.passwordTx.setText(pwd)
    sms.messageTxArea.setText(mesg)
    if not sms._onSend(0) : #Avoid internal thread to work properly (finish before dispose in next step)
        print "<<Event>> Fail to send SMS : transfer error or input parameter incorrect"
        sms.dispose()
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION    
    sms.dispose()
    
def playWav(song) :
    '''playWav(pathfile) -> None'''
    fileName = 'file:'+song
    try :
        file = URL(fileName)
        auClip = Applet.newAudioClip(file)
    except :
        print "<<ScriptUtils>> Cannot open wav file"
        raise MYEXCEPTION
    start_new_thread(playingWav, (auClip, ))
    
def playingWav(clip) :
    clip.play()      #stop loop play
    time.sleep(MAX_WAV_LENGTH)
    clip.stop()

def playMidi(song):
    '''playMidi(pathfile) -> None'''
    midi = midiFrame(song)
    if not midi.playMusic() :
        print "<<ScriptUtils>> Fail to play midi file"
        midi.dispose()
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    midi.dispose()
    
class midiFrame (JFrame) :
    
    class MyWindowAdapter(WindowAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def windowClosing(self, event) :
            self.parent.player.close()
            self.parent.dispose()
            
    def __init__(self, song) :
        self.songToPlay = song
        self.setTitle(song)
        self.setSize(180, 100)
        self.setResizable(0)
        self.setIconImage(ImageIcon(r'images/gear.gif').getImage())
        label = JLabel('Playing... ')
        self.progress = JProgressBar()
        self.stopBt = JButton('stop', actionPerformed = self.closeWindow)
        
        self.contentPane.setLayout(GridLayout(0, 1))
        self.contentPane.add(label)
        self.contentPane.add(self.progress)
        self.contentPane.add(self.stopBt)
        self.addWindowListener(self.MyWindowAdapter(self))
        self.show()
        #self.playMusic()
        
    def closeWindow(self, e) :
        self.player.close()
        
    def playMusic(self) :
        try :
            file = File(self.songToPlay)
            currentSound = MidiSystem.getSequence(file)
            self.player = MidiSystem.getSequencer()
        except :
            return 0
        
        self.player.open()
        self.player.setSequence(currentSound)
        self.progress.setMinimum(0)
        self.progress.setMaximum( self.player.getMicrosecondLength() )
        self.player.start()
        self.player.setTempoFactor(1)
        while(self.player.isRunning()) :
            self.progress.setValue( self.player.getMicrosecondPosition() )
            time.sleep(1)   #update progress every 3 secs.
            self.progress.setValue( self.player.getMicrosecondPosition() )
        self.player.close()
        return 1    #no error
      
def showMessage(msg) :
    '''showMessage(message) -> None'''
    JOptionPane.showMessageDialog(None, msg, 'PWB Message', JOptionPane.INFORMATION_MESSAGE)

def sendLANMessage(destIP, message) :
    '''sendLANMessage(destIP, message) -> None'''
    cmd = "net send " + destIP + ' "' + message + '"'
    success = runCMD(cmd)
    if not success :
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION

def startFile(pathfile) :
    '''startFile(pathfile) -> None'''
    cmd = 'start "PWB" "' + pathfile + '"'    
    success = runCMD(cmd)
    if not success :
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION
    
''' these two function always use with time=0 -- control time by event manager
force used whenever do not need to ask for unsafe docs
shutdown windows 2000/xp system '''
def shutdownComputer(mode=0, force=0) :
    '''shutdownComputer([mode, force]) -> None'''
    cmd = "shutdown "
    if mode==0 :
        cmd += "-s "
    else :
        cmd += "-r "
    if force :
        cmd += "-f "
    cmd += "-t 0"
    success = runCMD(cmd)
    if not success :
        playWav(FAIL_WAV_FILE)
        raise MYEXCEPTION

def runCMD(cmd) :
    '''runCMD(command) -> boolean success'''
    print cmd
    try :
        return_status = os.system(cmd)
        return not return_status
    except :
        print '<<Script>> Security or IO exception', sys.exc_info()
        return 0

# this is class that use as function
class Alert :
    '''Alert(msg [,func [,delay]]) -> popup obj'''    
    def __init__(self, msg, func=None, delay=15) :
        # set up the runtime-binded routine
        if func == None :
            func = lambda : 1   # default function, do just simply return 1
        self.func = func
        # set up the position of this popup
        toolkit = Toolkit.getDefaultToolkit()
        max = toolkit.getScreenSize()
        
        pane = JPanel(GridLayout(0,1))        
        pane.setPreferredSize(Dimension(130, 110))
        pane.setBorder( BorderFactory.createEtchedBorder(border.EtchedBorder.RAISED) )
        btDo = JButton("Push here", ImageIcon(r'images/go.gif'), actionPerformed=self.onPopupPushed)
        txMsg = JTextArea(msg, 10, 20)
        txMsg.setFont( Font("Tahoma", Font.PLAIN, 12) )
        txMsg.setBackground(Color(40,190,250))
        txMsg.setLineWrap(1)
        txMsg.setWrapStyleWord(1)
        txMsg.setEditable(0)
        factory =  PopupFactory.getSharedInstance()
        pane.add(txMsg)#, BorderLayout.CENTER)
        pane.add(btDo)#, BorderLayout.SOUTH)
        self.popup = factory.getPopup(AGENT, pane, max.width-135, max.height-138 ) #BasicComboPopup( JComboBox(tip) )
        self.popup.show()
        playWav(ALERT_WAV_FILE)
        #self.showing = 1
        if delay < 0 :
            return
        start_new_thread(self.waitingToHide, (delay,))
        
    def waitingToHide(self, delay) :
        time.sleep(delay)
        self.popup.hide()

    def onPopupPushed(self, event) :
        try :
            self.popup.hide()
            start_new_thread(self.func, ())
        except :
            print "<<Script>> User defined function error"        
        self.popup.hide()


######################################################################################################
# class Owner is create by Agent.initialize() right afert user login, and is used through out the program
class Owner :
    def __init__(self, browser, ftp, mail, sms) :
        self.browser = browser
        self.ftp = ftp
        self.mail = mail
        self.sms = sms

class BrowserOwner :
    def __init__(self, favorites={}) :
        self.favorites = favorites

class FTPOwner :
    def __init__(self, server='', username='', password='', favorites={}) :
        self.server = server
        self.username = username
        self.password = password
        self.favorites = favorites

class MailOwner :
    def __init__(self, server='', address='', password='', addrbook={}) :
        self.server = server
        self.address = address
        self.password = password
        self.addrbook = addrbook

# server is restrict only the AIS
class SMSOwner :
    def __init__(self, username='', password='', phonebook={}) :
        #self.server = None
        self.username = username
        self.password = password
        self.phonebook = phonebook

####################################################################################################


#========================================================
# =============== Begin Abstract Data Type here =================
# =======================================================

class WebSite :
    def __init__(self, url="") :
        self.url = url
        try :
            self.url_hd = urllib.urlopen(url)
            self.home_source = self.url_hd.read()
        except :
            print "<<Script>> URL error : ", sys.exc_info()
            return None
        self.cur_source = self.home_source
        self.cur_url = url
        
    def runCGI(self, path, cgi, params, method="GET", getSource=1) :
        if method == "GET" :
            url = path + cgi + "?" + urllib.urlencode(params)
            self.cur_url = url
            if getSource :
                f = urllib.urlopen(url)
                result = f.read()
                f.close()
                return result
        elif method == "POST" :
            pass

    def getHomeSource(self) :
        return self.home_source

    def saveHomeAs(self, destPath) :
        try :
            f = open(destPath, "w")
            f.write(self.homeSource)
            f.close()
        except :
            sys.exc_info()
            print "Save file error!"

    # after runCGI, you can use this method to show the just done CGI result            
    def showCurPage(self) :
        frm = BrowserFrame(self.cur_url, 0, 1)
        frm.show()
    
# ============ Web Server ===========
class KMITL(WebSite) :
    '''KMITL() -> WebSite object located to KMITL'''
    def __init__(self) :        
        WebSite.__init__(self, "http://www.kmitl.ac.th")

    def inquireGrade(self, _id, _pass, _year, _term) :
        '''inquireGrade(id, pass, year, term) -> result'''
        path = "http://161.246.10.36:8080/servlet/"
        cgi = "UnGraStuServlet"
        # this is GET version but it should be the POST version **** don't forget to change it
        params = { "id" : _id, "pass" : _pass, "year" : _year, "term" : _term }

        print "<<Script>> KMITL - Inquire grade of ", _id, " of term ", _term, " year ", _year
        result = self.runCGI(path, cgi, params)
        # this state need to format the resulr
        return result

    def inquireTotGrade(self, _id, _pass) :
        '''inquireTotGrade(id, pass) -> result'''
        path = "http://161.246.10.36:8080/servlet/"
        cgi = "UnGraTotServlet"
        params = { "id" : _id, "pass" : _pass }

        print "<<Script>> KMITL - Inquire total grade of ", _id
        result = self.runCGI(path, cgi, params)
        return result

    def extractGPA(self, html) :
        '''extractGPA(html) -> string
        html : string of KMITL-grade report'''
        out = ""
        buff = html
        p = buff.find('<TD WIDTH=100 ALIGN=center>')
        id = buff[p+27 : p+35]
        out += 'ID : ' + id
        
        buff = buff[p+36 : ]
        p1 = buff.find('<TD WIDTH=440 ALIGN=left>&nbsp;')
        p2 = buff.find('</TD>')
        tmp = buff[p1+31 : p2]
        tmp = tmp.split()
        name = ''
        for t in tmp :
            name += t + ' '
        name = name.strip()
        out += ' Name : ' + name
    
        buff = buff[p2+5 : ]
        table = []
        while (1) :
            p = buff.find('<TD WIDTH=80 ALIGN=center>')
            # no more record
            if p == -1 :
                break
            subjID = buff[p+26 : p+34]
            subjID = subjID.strip()
            buff = buff[p+35 : ]
            target1 = '&nbsp;'
            target2 = '</TD><TD WIDTH=60 ALIGN=center>'
            p1 = buff.find(target1)
            p2 = buff.find(target2)
            subject = buff[p1+len(target1) : p2]
            subject = subject.strip()
            buff = buff[p2+len(target2) : ]
            target1 = '</TD><TD WIDTH=50 ALIGN=center>'
            p1 = buff.find(target1)
            p2 = p1 + len(target1)
            credit = buff[ : p1]
            grade = buff[p2 : p2+5]
            credit = credit.strip()
            grade = grade.strip()
            buff = buff[p2+5 : ]
            
            out += '\n' + subjID + '|' + subject + '|' + credit + '|' + grade
            table.append((subjID, subject, credit, grade))
        
        return table

        
class Yahoo(WebSite) :
    ''' Yahoo() -> WebSite object located to Yahoo'''
    def __init__(self) :
        WebSite.__init__(self, "http://www.yahoo.com")
        
    def search(self, _keyword) :
        '''search(keyword) -> result'''
        path = "http://search.yahoo.com/bin/"
        cgi = "search"
        params = { "p" : _keyword }
        
        print "<<Script>> Yahoo - Search information regard ", _keyword
        result = self.runCGI(path, cgi, params, "GET", 0)
        return result


class Weather(WebSite) :
    temperatureHeader = ['Station', 'C', 'F', 'dew']
    rainHeader = ['Station', 'Rain Quantity(mm.)']
    windHeader = ['Station', 'Km/h.', 'Knot.', 'Wind direction']
    cloudHeader = ['Station', 'Cloud indication']
    weatherHeader = ['Station', 'Weather indication']
    pressureHeader = ['Station', 'Pressure(bar)']
    
    def temperature(self, region) :
        itemList = []    #contain list of weather data for each state
        postDataDict = {'region' : region, 'Choice' : 12}
        encodedData = urllib.urlencode(postDataDict)
        #retrieve data
        #print 'Connecting\n'
        try :
            print 'start retrieve'
            res = urllib.urlopen('http://www.thaimet.tmd.go.th/eng/weather.asp', encodedData)
            #res = open('TEMP.txt')
            print 'retrieve ok'
        except :
            print 'error reterieveing page '
        
        #find the beginning of table
        while(not res.readline().strip().startswith('<!-------------- Start Temparature ----------->')) : 
            pass
        #print 'found start point'
        
        #begin loop for each item
        while(1) :
            #find the beginning of each item
            st = res.readline().strip()
            while( not (st.startswith('<TR>') or st.startswith('<Hr Width="50%">')) ) :
                st = res.readline().strip()
            if st.startswith('<Hr Width="50%">') :
                break
            item = []
            #extract province name
            pro = res.readline()
            pro = pro.replace('</FONT></TD>','')
            pro = pro [pro.find('COLOR="Blue">')+13:]
            item.append(pro)
            #print pro
            #extract C
            c = res.readline()
            c = c.replace('</FONT></TD>','')
            c = c [c.find('SIZE="+1">')+len('SIZE="+1">'):]
            item.append(c)
            #print c
            #extract F
            f = res.readline()
            f = f.replace('</FONT></TD>','')
            f = f [f.find('SIZE="+1">')+len('SIZE="+1">'):]
            item.append(f)
            #print f
            #extract dew point
            d = res.readline()
            d = d.replace('</FONT></TD>','')
            d = d [d.find('SIZE="+1">')+len('SIZE="+1">'):]
            item.append(d)
            #print d
            #append province item to list
            itemList.append(item)
        return itemList
    
    def rain(self, region) :
        itemList = []    #contain list of weather data for each state
        postDataDict = {'region' : region, 'Choice' : 22}
        encodedData = urllib.urlencode(postDataDict)
        #retrieve data
        #print 'Connecting\n'
        try :
            print 'start retrieve'
            res = urllib.urlopen('http://www.thaimet.tmd.go.th/eng/weather.asp', encodedData)
            #res = open('RAIN.txt')
            print 'retrieve ok'
        except :
            print 'error reterieveing page '
        
        #find the beginning of table
        while(not res.readline().strip().startswith('<!------------ Start Quantity Rain  ----------->')) : 
            pass
        print 'found start point'
        
        #begin loop for each item
        while(1) :
            #find the beginning of each item
            st = res.readline().strip()
            while( not (st.startswith('<TR>') or st.startswith('<Hr Width="50%">')) ) :
                st = res.readline().strip()
            if st.startswith('<Hr Width="50%">') :
                break
            item = []
            #extract station name
            pro = res.readline()
            pro = pro.replace('</FONT></TD>','')
            pro = pro [pro.find('COLOR="Blue">')+13:]
            item.append(pro)
            #print pro
            #extract indicator
            c = res.readline()
            c = c.replace('</FONT></TD>','')
            c = c [c.find('COLOR="Blue" >')+len('COLOR="Blue" >'):]
            item.append(c)
            #print c
            #append province item to list
            itemList.append(item)
        return itemList
    
    def wind(self, region) :
        itemList = []    #contain list of weather data for each state
        postDataDict = {'region' : region, 'Choice' : 32}
        encodedData = urllib.urlencode(postDataDict)
        #retrieve data
        #print 'Connecting\n'
        try :
            print 'start retrieve'
            res = urllib.urlopen('http://www.thaimet.tmd.go.th/eng/weather.asp', encodedData)
            #res = open('WIND.txt')
            print 'retrieve ok'
        except :
            print 'error reterieveing page '
        
        #find the beginning of table
        while(not res.readline().strip().startswith('<!------------ Start Indication Wind  ----------->')) : 
            pass
        print 'found start point'
        
        #begin loop for each item
        while(1) :
            #find the beginning of each item
            st = res.readline().strip()
            while( not (st.startswith('<TR>') or st.startswith('<Hr Width="50%">')) ) :
                st = res.readline().strip()
            if st.startswith('<Hr Width="50%">') :
                break
            item = []
            #extract province name
            pro = res.readline()
            pro = pro.replace('</FONT></TD>','')
            pro = pro [pro.find('COLOR="Blue">')+13:]
            item.append(pro)
            #print pro
            #extract 
            c = res.readline()
            c = c.replace('</FONT></TD>','')
            c = c [c.find('COLOR="RED">')+len('COLOR="RED">'):]
            item.append(c)
            #print c
            #extract 
            f = res.readline()
            f = f.replace('</FONT></TD>','')
            f = f [f.find('COLOR="RED">')+len('COLOR="RED">'):]
            item.append(f)
            #print f
            #extract wind direction
            d = res.readline()
            d = d.replace('</FONT></TD>','')
            d = d [d.find('COLOR="RED">')+len('COLOR="RED">'):]
            item.append(d)
            #print d
            #append province item to list
            itemList.append(item)
        return itemList
    
    def cloud(self, region) :
        itemList = []    #contain list of weather data for each state
        postDataDict = {'region' : region, 'Choice' : 42}
        encodedData = urllib.urlencode(postDataDict)
        #retrieve data
        #print 'Connecting\n'
        try :
            print 'start retrieve'
            res = urllib.urlopen('http://www.thaimet.tmd.go.th/eng/weather.asp', encodedData)
            #res = open('CLOUD.txt')
            print 'retrieve ok'
        except :
            print 'error reterieveing page '
        
        #find the beginning of table
        while(not res.readline().strip().startswith('<!------------ Start Indication Cloud  ----------->')) : 
            pass
        print 'found start point'
        
        #begin loop for each item
        while(1) :
            #find the beginning of each item
            st = res.readline().strip()
            while( not (st.startswith('<TR>') or st.startswith('<Hr Width="50%">')) ) :
                st = res.readline().strip()
            if st.startswith('<Hr Width="50%">') :
                break
            item = []
            #extract station name
            pro = res.readline()
            pro = pro.replace('</FONT></TD>','')
            pro = pro [pro.find('COLOR="Blue">')+13:]
            item.append(pro)
            #print pro
            #extract indicator
            c = res.readline()
            c = c.replace('</FONT></TD>','')
            c = c [c.find('COLOR="RED">')+len('COLOR="RED">'):]
            item.append(c)
            #print c
            #append province item to list
            itemList.append(item)
        return itemList
    
    def weather(self, region) :
        itemList = []    #contain list of weather data for each state
        postDataDict = {'region' : region, 'Choice' : 52}
        encodedData = urllib.urlencode(postDataDict)
        #retrieve data
        #print 'Connecting\n'
        try :
            print 'start retrieve'
            res = urllib.urlopen('http://www.thaimet.tmd.go.th/eng/weather.asp', encodedData)
            #res = open('WEATHER.txt')
            print 'retrieve ok'
        except :
            print 'error reterieveing page '
        
        #find the beginning of table
        while(not res.readline().strip().startswith('<!------------ Start Indication weather ----------->')) : 
            pass
        print 'found start point'
        
        #begin loop for each item
        while(1) :
            #find the beginning of each item
            st = res.readline().strip()
            while( not (st.startswith('<TR>') or st.startswith('<Hr Width="50%">')) ) :
                st = res.readline().strip()
            if st.startswith('<Hr Width="50%">') :
                break
            item = []
            #extract station name
            pro = res.readline()
            pro = pro.replace('</FONT></TD>','')
            pro = pro [pro.find('COLOR="Blue">')+13:]
            item.append(pro)
            #print pro
            #extract indicator
            c = res.readline()
            c = c.replace('</FONT></TD>','')
            c = c [c.find('COLOR="Blue">')+len('COLOR="Blue">'):]
            item.append(c)
            #print c
            #append province item to list
            itemList.append(item)
        return itemList
    
    def pressure(self, region) :
        itemList = []    #contain list of weather data for each state
        postDataDict = {'region' : region, 'Choice' : 62}
        encodedData = urllib.urlencode(postDataDict)
        #retrieve data
        #print 'Connecting\n'
        try :
            print 'start retrieve'
            res = urllib.urlopen('http://www.thaimet.tmd.go.th/eng/weather.asp', encodedData)
            #res = open('PRESSURE.txt')
            print 'retrieve ok'
        except :
            print 'error reterieveing page '
        
        #find the beginning of table
        while(not res.readline().strip().startswith('<!------------ Start Indication weather ----------->')) : 
            pass
        print 'found start point'
        
        #begin loop for each item
        while(1) :
            #find the beginning of each item
            st = res.readline().strip()
            while( not (st.startswith('<TR>') or st.startswith('<Hr Width="50%">')) ) :
                st = res.readline().strip()
            if st.startswith('<Hr Width="50%">') :
                break
            item = []
            #extract station name
            pro = res.readline()
            pro = pro.replace('</FONT></TD>','')
            pro = pro [pro.find('COLOR="Blue">')+13:]
            item.append(pro)
            #print pro
            res.readline()
            res.readline()
            res.readline()
            #extract indicator
            c = res.readline()
            c = c.strip()
            item.append(c)
            #print c
            #append province item to list
            itemList.append(item)
        return itemList
     

def createTable(title, data ,head) :
    '''createTable(title, body, head) -> Table GUI'''
    frame = JFrame()
    frame.setSize(400,300)
    frame.setTitle(title)
    table = JTable(data ,head)
    frame.getContentPane().add(JScrollPane(table) )
    return frame
    

###########################################
###########################################

     
