'''
Programmable Web Browser v 2.0
Module : Parser Module
Description : Contain parser of script language, definition of language datatype, and event function
Last Updated : 31 January 2002
Programmer :    Thanawat Keawka
                        Boontawee Suntisrivaraporn
Professor : Dr. Visit Hirankitti                        
===========================================
System Requirement
- Java 1.3
- Jython 2.1
- Windows 9x/Me/2000/XP, Linux Redhat 7.0/7.2

'''

# import Java Module
from java.awt import *
from java.awt.event import *
from javax.swing import *
from javax.swing.event import *
from java.net import URL
from javax.swing.text import *
from javax.swing.text.html import *
from java.lang import *

# import Python Module
import sys
import urllib
import os
import traceback
import time
import string
from thread import start_new_thread




# ======== define available event driven =============
DLD_COMPLETE   = "dld_cmplt"
DLD_ERROR   = "dld_err"
CGI_COMPLETE  = "cgi_cmplt"

# ===== tag to indicate the script type ===========
BEGIN_EVENT_TAG = "<event>"
END_EVENT_TAG   = "</event>"
BEGIN_SEQ_TAG    = "<sequential>"
END_SEQ_TAG  = "</sequential>"
BEGIN_PAR_TAG    = "<parallel>"
END_PAR_TAG  = "</parallel>"


# ======== Begin define event here ==========
# time event = "hh:mm"
TIME_EVENT = "yyyy/mm/dd hh:mm" # or just "hh:mm"
EMAIL_EVENT = "username@host:password"


# =====================================================
# ==================== Parser :  ==========================
# =====================================================

event_driven = {}

class Parser :
    def __init__(self, parent, full_script="", alert=1) :
        self.parent = parent
        self.event_actions = {}
        self.event_script = ""
        self.seq_script = ""
        self.par_script = ""
        self.input_script = full_script
        #self.loadScript(alert)
    
    def loadScript(self, alert=1) :
        # check format and separate
        p1 = self.input_script.find(BEGIN_EVENT_TAG)
        p2 = self.input_script.find(END_EVENT_TAG)
        p3 = self.input_script.find(BEGIN_SEQ_TAG)
        p4 = self.input_script.find(END_SEQ_TAG)
        p5 = self.input_script.find(BEGIN_PAR_TAG)
        p6 = self.input_script.find(END_PAR_TAG)
        # if not complete scope
        if (p1 == -1 and p2 != -1) or (p1 != -1 and p2 == -1) or (p1 > p2) \
           or (p3 == -1 and p4 != -1) or (p3 != -1 and p4 == -1) or (p3 > p4) \
           or (p5 == -1 and p6 != -1) or (p5 != -1 and p6 == -1) or (p5 > p6) :
            print "<<Parser>> Script syntax error!!"
            return 0
        # manipulate with an event part
        if (p1,p2) != (-1,-1) :
            self.event_script = self.input_script[ p1+len(BEGIN_EVENT_TAG) : p2 ]
            #self.addEventAction(self.event_script)
        # manipulate with an parallel script part
        if (p5,p6) != (-1,-1) :
            self.par_script = (self.input_script[ p5+len(BEGIN_PAR_TAG) : p6 ]).strip()
        # manipulate with an sequential script part
        if (p3,p4) != (-1,-1) :
            self.seq_script = self.input_script[ p3+len(BEGIN_SEQ_TAG) : p4 ]
        elif (p1,p2,p3,p4,p5,p6) == (-1,-1,-1,-1,-1,-1) :
            self.seq_script = self.input_script
        return 1

    #============== these three method : addEventAction, execSeqScript, startParScript ==============
    
    def addEventAction(self, event_script=None, isTest=0) :
        if event_script==None :
            event_script = self.event_script
        event_script = event_script.strip()
        lines = event_script.split('\n')
        for line in lines :
            line = line.strip()
            # if empty or comment, do not do it
            if line=="" or line[0]=='#' :
                continue
            try :
                event, action = line.split('->')
            except :
                print "<<Parser>> Event syntax error : -> expected"
                return 0
            p1 = event.find('/')
            p2 = event.find('/', p1+1)
            p3 = event.find(':')
            p4 = event.find('@')
            if p4!=-1 :
                event_type = "mail"
            elif (p1==4 and p2==7 and p3==13) or (p1==-1 and p2==-1 and p3!=-1 and p4==-1) :
                event_type = "time"
                if p1==-1 :
                    date = time.strftime("%Y/%m/%d")
                    event = date + ' ' + event
            else :
                event_type = "others"
            self.event_actions[event] = action
            if not isTest :
                if event_type == 'mail' :
                    # separate the event into 3 item
                    address0, server0, password0 = map(string.strip, (event[:p4], event[p4+1:p3], event[p3+1:]) )
                    # try to evaluate if it has meaning
                    try :
                        address = eval(address0, self.parent.agentNameSpace)
                    except :
                        address = address0
                    try :
                        server = eval(server0, self.parent.agentNameSpace)
                    except :
                        server = server0
                    try :
                        password = eval(password0, self.parent.agentNameSpace)
                    except :
                        password = password0
                    event = "%s@%s:%s" % (address, server, password)
                event_item = [event_type, "active", event, action]
                # add new event-item to Agent event-list
                #print event_item
                self.parent.current_event_list.append(event_item)
        if not isTest :
            # add event-list to Agent Event List interface
            displayList = self.parent.convertToDisplay(self.parent.current_event_list)
            self.parent.event_list.setListData(displayList)  #set to Jlist
        return 1

    def execSeqScript(self, script=None) :
        if script == None :  
            script = self.seq_script
            
        '''filename = "ScriptBuffer." + str(counter)
        try :
            f = open(filename, 'w')
            f.write(script)
            f.close()
        except :
            print "<<Parser>> Cannot open ScriptBuffer.tmp"
        '''

        exec script in self.parent.agentNameSpace      # we need to see the exception report
        '''try :
            exec script in self.parent.agentNameSpace
        except :
            print "<<Script>> Execute error!!!  Details :"
            traceback.print_last()
        '''

    def startParScript(self) :
        '''# this counter must begin with 1 because 0 is used by default sequential thread
        counter = 1
        '''
        stmts = map( string.strip, self.par_script.split('\n') )
        for stmt in stmts :
            if stmt=="" :
                continue
            print "<<Parser>> Start new thread for parallel script : ", stmt
            start_new_thread(self.execSeqScript, (stmt, ))
   
    def showResult(self) :
        jseq = JTextArea(self.seq_script)
        jseq.setEditable(0)
        jseq.setToolTipText('Sequential script')
        jseq.setFont( Font("Tahoma", Font.PLAIN, 11) )        
        jpar = JTextArea(self.par_script)
        jpar.setEditable(0)
        jpar.setToolTipText('Parallel script')
        jseq.setFont( Font("Tahoma", Font.PLAIN, 11) )                
        jtable = self.getEventActionTable()
        jtable.setEnabled(0)
        jtable.setShowHorizontalLines(0)
        jtable.setToolTipText('Event-Action')
        pane = JPanel(BorderLayout())
        pane.setPreferredSize(Dimension(293, 293))
        s1 = JScrollPane(jseq)
        s1.setPreferredSize(Dimension(180, 100))
        s2 = JScrollPane(jpar)
        s2.setPreferredSize(Dimension( 180, 100))
        s3 = JScrollPane(jtable)
        s3.setPreferredSize(Dimension(180, 93))
        pane.add(s1, BorderLayout.NORTH)
        pane.add(s2, BorderLayout.CENTER)
        pane.add(s3, BorderLayout.SOUTH)
        JOptionPane.showMessageDialog(self.parent, pane, "Add event and execute script", -1, None)
        
    def getEventActionTable(self) :
        table = []
        for row in self.event_actions.items() :
            table.append(row)
        table.sort()
        jtable = JTable(table, ("Event","Action"))
        jtable.setEnabled(0)
        return jtable

# after this line is not relate to the script part ..... just tester 

class Tester(JFrame) :
    def __init__(self, scripter) :
        self.scripter = scripter
        
        self.setSize(300, 300)
        self.setResizable(0)
        self.addWindowListener(MyWindowAdapter())

        self.jPanel = JPanel(BorderLayout())
        self.jBottomPanel = JPanel(BorderLayout())
        self.jTextArea = JTextArea()
        self.jTextField = JTextField(actionPerformed=self.doCommand)
        self.jButton = JButton("Run Script", actionPerformed=self.doRunScript)

        self.contentPane.add(self.jPanel, BorderLayout.CENTER)
        self.contentPane.add(self.jBottomPanel, BorderLayout.SOUTH)
        self.jBottomPanel.add(self.jButton, BorderLayout.EAST)
        self.jBottomPanel.add(self.jTextField, BorderLayout.CENTER)

    def doCommand(self, event) :
        #MSG("in doCommand Method")
        self.scripter.execSeqScript(str(self.jTextField.getText()))

    def doRunScript(self, event) :
        self.scripter.showResult()
        self.scripter.execSeqScript()
        self.jPanel.add(self.scripter.getEventActionTable())
        self.jPanel.updateUI()
        
class MyWindowAdapter(WindowAdapter) :
   def windowClosing(self, event) :
       sys.exit(0)

if __name__ == "__main__" :
    f = open("script.txt")
    input_script = f.read()
    f.close()
    
    scripter = Parser(input_script)
    tester = Tester(scripter)
    tester.show()