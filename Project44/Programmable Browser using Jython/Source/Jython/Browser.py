'''
Programmable Web Browser v 2.0
Module : Web Browser
Last Updated : 28 January 2002
Programmer : Thanawat Keawka
                        Boontawee Suntisrivaraporn
Professor : Dr. Visit Hirankitti                        
===========================================
System Requirement
- Java 1.4
- Jython 2.1

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
from thread import start_new_thread
from os import system
import string

# define the constant variable
BROWSER_CACHE_FILE = 'cache.txt'
BROWSER_FAV_FILE = 'favorites.txt'

class BrowserFrame(JFrame) :
    '''BrowserFrame([urlHome, frameID, isChild, idGetPage]) -> BrowserFrame Object'''
    
# ============= Definition of inner-class
# most of them is Listener for the components
    class MyActionListener_cbLocation(ActionListener) :
        def __init__(self, parent) :
            self.parent = parent
            self.current = 0
            self.last = 0
        def actionPerformed(self, event) :
            self.current = event.getWhen()
            if self.current == self.last :      # old same time; do not do it
                return
            self.last = self.current
            self.parent.onGo(None)

    class MyItemListener_cbLocation(ItemListener) :
        def __init__(self, parent) :
            self.parent = parent            
        def itemStateChanged(self, event) :
            print event.getWhen()
            urlPath = self.parent.cbLocation.getSelectedItem()
            self.parent.go(urlPath)
    
    class MyMouseListener_btGo(MouseListener) :
        def __init__(self, parent) :
            self.parent = parent
        def mouseClicked(self, event) :
            pass
        def mouseEntered(self, event) :
            urlPath = self.parent.cbLocation.getEditor().getItem()
            if urlPath :
                tip = 'Go to "' + urlPath + '"'
            else :
                tip = 'Fill URL first'
            self.parent.btGo.setToolTipText(tip)
            event.getComponent().setBorderPainted(1)
        def mouseExited(self, event) :
            event.getComponent().setBorderPainted(0)
        def mousePressed(self, event) :
            pass
        def mouseReleased(self, event) :
            pass
        
    class MyMouseListener_btToolbar(MouseListener) :
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

    class MyMouseListener_idPad(MouseListener) :
        def __init__(self, parent) :
            self.parent = parent
        def mouseClicked(self, event) :
            pass
        def mouseEntered(self, event) :
            self.parent.idPad.setToolTipText('Browser ID : ' + str(self.parent.id) +
                                             ' Active : ' + str(BrowserFrame.activeCount))
        def mouseExited(self, event) :
            pass
        def mousePressed(self, event) :
            pass
        def mouseReleased(self, event) :
            pass

    # this Listener is used mainly by JEditorPane to enable the link to follow
    class MyHyperlinkListener_editor(HyperlinkListener) :
        def __init__(self, parent) :
            self.parent = parent
        
        def hyperlinkUpdate(self, event) :
            et = event.getEventType()
            self.url = event.getURL()
            self.parent.status.setText('Hyperlink to : ' + self.url.toString())
            #print self.url.toString()
            if et == HyperlinkEvent.EventType.ACTIVATED :
                pane = event.getSource()
                if isinstance(event, HTMLFrameHyperlinkEvent) :
                    evt = event
                    doc = pane.getDocument()
                    doc.processHTMLFrameHyperlinkEvent(evt)
                else :
                    self.parent.go(self.url.toString())
                    self.parent.cbLocation.getEditor().setItem(self.url.toString())

    class MyWindowAdapter(WindowAdapter) :
        def __init__(self, parent) :
            self.parent = parent
        def windowClosing(self, event) :
            self.parent.onClose(event)

    # ================= Constructor ==================
    # some of member variables are declare here; and some are declared in initialize
    def __init__(self, urlHome=None,id=0 , child=1, getpage=1, agent=None) :
    #'''urlHome [None=empty page], id=identifier of webbrowser frame, child= , getpage=get or not'''
        # ============== declare the necessary member variable here ===================
        
        # this is one way to use static member variable; we use classname.staticvariable
        # we try to increment it by one if it exists, if not, except will surely raise
        # so we catch it and again, make new one (this happen when first call)
        # this static variable is also used in the destructor to reduce by one for each terminate
        try :
            BrowserFrame.activeCount += 1
        except :
            BrowserFrame.activeCount = 1
        
        print "<<Browser>> New Browser ID=", id, " ; Active browser=", BrowserFrame.activeCount

        self.agent = agent        
        self.urlHome = urlHome
        self.id = id
        self.exit_when_term = not child # if child, don't exit program
        # font and size of editorpane
        self.fontName = "Tahoma"
        self.fontSize = 13
        
        # add window listener so we can keep track of the exit event
        self.addWindowListener(self.MyWindowAdapter(self))
        
        self.initialize()
        self.buildGUI()
        
        # normally getpage is true and Browser is automatically retrieve the page
        # but for event-driven use, we need no this step
        if getpage :              
            self.onGo(None)

    # builder all component of Web Browser
    def buildGUI(self) :        
        self.setSize(800, 570)
        self.setTitle('PWB - Browser')
        self.setIconImage(ImageIcon(r'images/gear.gif').getImage())
        
        # build the components in each part
        self.buildMenuBar()
        self.buildToolBar()
        self.buildAddressBar()
        self.buildStatusBar()
        
        self.top = JPanel()
        self.top.setLayout(BorderLayout())
        self.top.add(self.toolbar, BorderLayout.NORTH)
        self.top.add(self.addbar, BorderLayout.CENTER)

        self.setJMenuBar(self.mainMenu)
        
        self.editor = JEditorPane()
        self.editor.setEditable(0)
        self.editor.setToolTipText('HTML Document')
        self.editor.addHyperlinkListener(self.MyHyperlinkListener_editor(self))
        self.editor.setFont( Font(self.fontName, Font.PLAIN, self.fontSize) )
        
        self.contentPane.add(self.top, BorderLayout.NORTH)
        self.contentPane.add(self.statusbar, BorderLayout.SOUTH)
        self.contentPane.add(JScrollPane(self.editor), BorderLayout.CENTER)
        
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
        

    def buildMenuBar(self) :        
        self.mainMenu = JMenuBar()
        
        self.file_menu = JMenu('File')
        self.file_menu.add(JMenuItem('New window', actionPerformed=self.onNewWindow))
        self.file_menu.add(JMenuItem('Save page as', actionPerformed=self.onSavePageAs))
        self.file_menu.addSeparator()
        self.file_menu.add(JMenuItem('Close Browser', actionPerformed=self.onClose))
        self.mainMenu.add(self.file_menu)

        self.view_menu = JMenu('View')
        self.view_menu.add(JMenuItem('Previous page', actionPerformed=self.onBack))
        self.view_menu.add(JMenuItem('Next page', actionPerformed=self.onForward))
        self.view_menu.add(JMenuItem('Stop', actionPerformed=self.onStop))
        self.view_menu.add(JMenuItem('Reload', actionPerformed=self.onReload))
        self.view_menu.add(JMenuItem('Home page', actionPerformed=self.onHome))
        self.view_menu.addSeparator()
        view_textsize_menu = JMenu('Text size')
        view_textsize_menu.add(JMenuItem('10', actionPerformed=self.onTextSizeChanged))
        view_textsize_menu.add(JMenuItem('11', actionPerformed=self.onTextSizeChanged))
        view_textsize_menu.add(JMenuItem('12', actionPerformed=self.onTextSizeChanged))
        view_textsize_menu.add(JMenuItem('13', actionPerformed=self.onTextSizeChanged))
        view_textsize_menu.add(JMenuItem('14', actionPerformed=self.onTextSizeChanged)) 
        view_textsize_menu.add(JMenuItem('15', actionPerformed=self.onTextSizeChanged))
        self.view_menu.add(view_textsize_menu)
        self.view_menu.addSeparator()
        self.view_menu.add(JMenuItem('View source', actionPerformed=self.onViewSource))
        self.mainMenu.add(self.view_menu)

        self.favorite_menu = JMenu('Favorites')
        self.favorite_menu.add(JMenuItem('Add this page to Favorites', actionPerformed=self.onAddFavorite))
        self.favorite_menu.add(JMenuItem('Show Favorites', actionPerformed=self.onShowFavorite))
        self.favorite_menu.addSeparator()
        for favName in self.favorites.keys() :
            fav_menu_item = JMenuItem(favName, actionPerformed=self.onGoToFavorite)
            fav_menu_item.setToolTipText(self.favorites[favName])
            self.favorite_menu.add(fav_menu_item)            
        self.mainMenu.add(self.favorite_menu)
        
        self.help_menu = JMenu('Help')
        self.help_menu.add(JMenuItem('How to Web Browser', actionPerformed=self.onHelp))
        self.help_menu.addSeparator()
        self.help_menu.add(JMenuItem('About agent program', actionPerformed=self.onAbout))
        self.mainMenu.add(self.help_menu)

    def buildToolBar(self) :
        self.toolbar = JToolBar()
        self.toolbar.setBorderPainted(1)
        #self.toolbar.setBorder(BorderFactory.createEtchedBorder())
        self.toolbar.setFloatable(0)
        self.btBack = JButton(ImageIcon(r'images/back.gif'), actionPerformed=self.onBack)
        self.btBack.setPreferredSize(Dimension(35,35))
        self.btBack.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btBack.setBorderPainted(0)
        self.btBack.setToolTipText('Back')
        self.btForward = JButton(ImageIcon(r'images/forward.gif'), actionPerformed=self.onForward)
        self.btForward.setPreferredSize(Dimension(35,35))
        self.btForward.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btForward.setBorderPainted(0)
        self.btForward.setToolTipText('Forward')
        self.btStop = JButton(ImageIcon(r'images/stop.gif'), actionPerformed=self.onStop)
        self.btStop.setPreferredSize(Dimension(35,35))
        self.btStop.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btStop.setBorderPainted(0)
        self.btStop.setToolTipText('Stop')
        self.btReload = JButton(ImageIcon(r'images/reload.gif'), actionPerformed=self.onReload)
        self.btReload.setPreferredSize(Dimension(35,35))
        self.btReload.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btReload.setBorderPainted(0)
        self.btReload.setToolTipText('Reload')
        self.btHome = JButton(ImageIcon(r'images/home.gif'), actionPerformed = self.onHome)
        self.btHome.setPreferredSize(Dimension(35,35))
        self.btHome.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btHome.setBorderPainted(0)
        self.btHome.setToolTipText('Home')
        self.iconFavorite = ImageIcon(r'images/favorite.gif')
        self.btFavorite = JButton(self.iconFavorite, actionPerformed=self.onShowFavorite)
        self.btFavorite.setPreferredSize(Dimension(35,35))
        self.btFavorite.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btFavorite.setBorderPainted(0)
        self.btFavorite.setToolTipText('Favorite')
        freespace = JPanel()
        freespace.setLayout(BorderLayout())
        self.iconHelp = ImageIcon(r'images/help.gif')
        self.btHelp = JButton(self.iconHelp, actionPerformed=self.onHelp)
        self.btHelp.setPreferredSize(Dimension(35,35))
        self.btHelp.addMouseListener(self.MyMouseListener_btToolbar(self))
        self.btHelp.setBorderPainted(0)
        self.btHelp.setToolTipText('Help')

        self.toolbar.add(self.btBack)
        self.toolbar.add(self.btForward)
        self.toolbar.addSeparator()
        self.toolbar.add(self.btStop)
        self.toolbar.add(self.btReload)
        self.toolbar.add(self.btHome)
        self.toolbar.addSeparator()
        self.toolbar.add(self.btFavorite)
        # add free space
        self.toolbar.add(freespace)
        self.toolbar.add(self.btHelp)

    def buildAddressBar(self) :
        self.addbar = JToolBar()
        self.addbar.setFloatable(0)
        
        self.lbLocation = JLabel(' Location :')
        self.lbLocation.setPreferredSize(Dimension(60,20))
        self.cbLocation = JComboBox(self.cache)
        self.cbLocation.setEditable(1)
        self.cbLocation.setSelectedItem(self.urlHome)
        self.cbLocation.addActionListener(self.MyActionListener_cbLocation(self))
        #self.cbLocation.addItemListener(self.MyItemListener_cbLocation(self))
        self.cbLocation.setToolTipText('Put URL here!')
        self.cbLocation.setPreferredSize(Dimension(150,20))
        self.iconGo = ImageIcon(r'images/go_small.gif')
        self.btGo = JButton('Go', self.iconGo, actionPerformed=self.onGo)
        self.btGo.setBorder(BorderFactory.createRaisedBevelBorder())
        self.btGo.setBorderPainted(0)
        self.btGo.setPreferredSize(Dimension(55,25))
        self.btGo.addMouseListener(self.MyMouseListener_btGo(self))
        self.btGo.setToolTipText(self.cbLocation.getSelectedItem())
        
        self.addbar.add(self.lbLocation)
        self.addbar.add(self.cbLocation)
        self.addbar.add(self.btGo)

    def buildStatusBar(self) :
        self.statusbar = JPanel()
        self.statusbar.setLayout(BorderLayout())

        self.status = JLabel()
        self.status.setText('Welcome to PWB jython version')
        #self.status.setEditable(0)
        self.status.setToolTipText('Status Bar')
        self.idPad = JTextField()
        self.idPad.setText(str(self.id))
        self.idPad.setEditable(0)
        self.idPad.setPreferredSize(Dimension(25,20))
        self.idPad.setToolTipText('Browser ID : ' + str(self.id) + ' Active : ' + str(BrowserFrame.activeCount))
        self.idPad.addMouseListener(self.MyMouseListener_idPad(self))

        self.statusbar.add(self.idPad, BorderLayout.EAST)
        self.statusbar.add(self.status, BorderLayout.CENTER)

    def initialize(self) :
        # history datastructure :: number : urlPath
        self.hist = {}
        self.curHist = 0    # begin with home url
        # user favorite sites :: name : location
        self.favorites = {}
        # read favorite site from file
        try :
            if self.agent :
                path = self.agent.user_path + BROWSER_FAV_FILE
            else :
                path = 'profiles/' + BROWSER_FAV_FILE
            f = open(path, 'r')            
            favorites = f.readlines()
            f.close()
            for favorite in favorites :
                #self.favorites = map(string.strip, favorites)
                name, url = map(string.strip, favorite.split('::'))
                self.favorites[name] = url
        except :
            print '<<Browser>> Favorite-file not found!'
            self.favorites = {}
        # read cache URL from file
        try :
            if self.agent :
                path = self.agent.user_path + BROWSER_CACHE_FILE
            else :
                path = 'profiles/' + BROWSER_CACHE_FILE           
            f = open(path, 'r')
            cache = f.readlines()
            f.close()
            self.cache = map(string.strip, cache)
        except :
            print '<<Browser>> Cache-file not found'
            self.cache = []
        
    # on the contrary to initialize, some imformation is needed to save for further use
    # this method must be invoke by the destructor or, let say, onClose method
    def finalize(self) :
        # write new caching URL to file
        if self.agent :
            path = self.agent.user_path + BROWSER_CACHE_FILE
        else :
            path = 'profiles/' + BROWSER_CACHE_FILE           
        cache = map( (lambda x : x + '\n'), self.cache)
        f = open(path, 'w')
        f.writelines(cache)
        f.close()
        # write new favorite to file
        if self.agent :
            path = self.agent.user_path + BROWSER_FAV_FILE
        else :
            path = 'profiles/' + BROWSER_FAV_FILE           
        f = open(path, 'w')
        favNames = self.favorites.keys()
        favNames.sort()
        for favName in favNames :
            favorite = favName + ' :: ' + self.favorites[favName] + '\n'
            f.write(favorite)
        f.close()

    def validateAll(self) :
        self.initialize()
        self.validateFavorite()
        self.validateCache()

    def validateFavorite(self) :
        # remove old favorite menu
        self.favorite_menu.removeAll()
        # add two main and separator
        self.favorite_menu.add(JMenuItem('Add this page to Favorites', actionPerformed=self.onAddFavorite))
        self.favorite_menu.add(JMenuItem('Show Favorites', actionPerformed=self.onShowFavorite))
        self.favorite_menu.addSeparator()
        # add each favorite item
        for favName in self.favorites.keys() :
            fav_menu_item = JMenuItem(favName, actionPerformed=self.onGoToFavorite)
            fav_menu_item.setToolTipText(self.favorites[favName])
            self.favorite_menu.add(fav_menu_item)

    def validateCache(self) :
        # remove old cache combobox
        self.cbLocation.removeAllItems()
        for item in self.cache :
            self.cbLocation.addItem(item)

    # this is util method to create Java-based URL object for passing to JEditorPane
    # alert parametor is set to be 0 for use externally, event driven
    def createURL(self, urlPath, alert=1) :
        # check for default http protocol
        if not urlPath :    # if urlPath is None or empty string; this mean the page is gonna be empty (white page)
            self.url = None
            return 1
        elif urlPath[0:7] == 'http://' or urlPath[0:8] == 'file:///' :
            pass
        elif urlPath[0:3] == 'www' :
            urlPath = 'http://' + urlPath
            #print '<<Browser>> Use default protocal : http'
        elif urlPath[1:3] == ':\\' :
            urlPath = 'file:///' + urlPath
            #print '<<Browser>> Local location'
        else :
            pass
        # try to create new Java URL object
        try:
            self.url = URL(urlPath)
            return 1
        except:
            return 0

    # heart of web browser is this method, its main routine is to set the page to the specific URL
    # used by many method (travelling method) : onGo, onReload, onBack ...
    def go(self, urlPath, hist=1, alert=1) :
        if not self.createURL(urlPath, alert) :
            print '<<Browser>> Bad URL!'
            self.status.setText('Bad URL')
            if alert :
                JOptionPane.showMessageDialog(self, 'Bad URL\nOr not support protocol')            
            return
        # fork new thread to handle this routine
        start_new_thread(self.retrievingPage, (alert, ) )
        
        # add to history
        if hist :
            print '<<Browser>> Add URL to history table'
            self.curHist += 1
            self.hist[self.curHist] = urlPath

    # this is runnable working together with go method
    # it's solely called by go as new thred; just like go, alert is set to 0 for external use
    def retrievingPage(self, alert=1) :
        if not self.url :
            print '<<Browser>> Empty page'
            self.status.setText('Empty page')
            self.editor.setText('')
            return
        # change the way of cursor appear, so that user can be noticed the working
        self.setCursor( Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR ) )
        try :
            print '<<Browser>> Retrieving page'
            self.status.setText('Retrieving page')
            self.editor.setPage(self.url)
        except :
            self.setCursor( Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR ) )
            print '<<Browser>> Fail in retrieving page!'
            self.status.setText('Fail to open page!')
            if alert :
                JOptionPane.showMessageDialog(self,
                                              'Can not follow link!\n' + self.url.toString(),
                                              'PWB -Browser',
                                              JOptionPane.ERROR_MESSAGE
                                              )
        self.setCursor( Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR ) )

    # this method is used only by event-driven, it retrieve new page without separete new thread
    # this is because we need to keep track of whether it succeed or not
    def goToURL(self, newURL) :
        '''goToURL(newURL) -> success [retrieve page and display]'''
        if not self.createURL(newURL, 0) :
            return 0
        try :
            self.cbLocation.getEditor().setItem(newURL)
            self.status.setText('Retrieving page')
            self.editor.setPage(self.url)
        except :
            return 0
        return 1    

    # invoked when push Go button or enter at Location CB
    def onGo(self, event, alert=1) :
        # get user-input URL        
        urlPath0 = self.cbLocation.getEditor().getItem().strip()
        try :
            urlPath = eval(urlPath0, self.agent.agentNameSpace)
        except :
            urlPath = urlPath0

        # ===== go go go =====
        self.go(urlPath, 1, alert) # do the history; and pass alert in
        # add current url to cache list, unless it's not in

        for each in self.cache :
            if urlPath == each :
                return
        self.cbLocation.addItem(urlPath)
        self.cache.append(urlPath)

    # invoked when push Favorite item on menubar
    def onGoToFavorite(self, event) :
        favName = event.getActionCommand()
        favURL = self.favorites[favName]
        print "<<Browser>> Favorite :", favName, " = ", favURL
        self.go(favURL)
        self.cbLocation.getEditor().setItem(favURL)

    # invoked when puch Back button
    def onBack(self, event) :
        print self.curHist, '   :   ', self.hist
        self.curHist -= 1
        print self.curHist
        try :
            print '<<Browser>> Go back'
            self.go(self.hist[self.curHist], 0) # not update the history
            self.cbLocation.getEditor().setItem(self.hist[self.curHist])
        except :
            self.curHist += 1

    # invoke when push Forward button
    def onForward(self, event) :
        self.curHist += 1
        try :
            print '<<Browser>> Go forward'
            self.go(self.hist[self.curHist], 0) # not update the history
            self.cbLocation.getEditor().setItem(self.hist[self.curHist])
        except :
            self.curHist -= 1

    # invoked when push Stop button
    def onStop(self, event) :
        print '<<Browser>> Stop'
        # we should stop thread here

    # invoked when push Reload button
    def onReload(self, event) :
        print '<<Browser>> Reload'            
        self.go(self.url.toString(), 0) # not update the history

    # invoked when puch Home button
    # this will go to Home URL, which is specified on constructor by user
    def onHome(self, event) :
        print '<<Browser>> Home'            
        self.go(self.urlHome)
        self.cbLocation.getEditor().setItem(self.urlHome)

    # invoked when push NewWindow menubar
    def onNewWindow(self, event) :
        # this input dialog ask user the new location to go, and set as homeURL as well
        # this still have problem, I don't know the way to get return information regard which button user push
        # OK => go, whether location is empty or none
        # Cancel => never go, and create new frame
        # Close => just like Cancel
        
        location = JOptionPane.showInputDialog(self, "Please type the Intenet location :")
        if not location :
            print "<<Browser>> Open new page with empty url"
            location = None
        # open new browser with the same condition on exit; so it will work just well
        newFrame = BrowserFrame(location, BrowserFrame.activeCount, not self.exit_when_term)
        newFrame.show()

    # invoke when push SavePageAs menubar
    def onSavePageAs(self, event) :
        fc =  JFileChooser(".")
        result = fc.showSaveDialog(frame)
        if result ==JFileChooser.APPROVE_OPTION :
            saveFile = fc.getSelectedFile()
            try :
                fileName = str(saveFile)
                if not ( fileName[-4:] == ".htm" or fileName[-5:] == ".html" ) :
                    fileName += ".html"
                f = open(str(file), 'w')
                f.write(self.editor.getText())
                f.close()                
            except :
                print "<<Browser>> File save error!! : ", sys.exc_info()
                JOptionPane.showMessageDialog(self, 'An error occur when trying to save script.', 'Save as error', JOptionPane.ERROR_MESSAGE)

    # invoked when push Close menubar, or by window exit button
    def onClose(self, event) :
        self.finalize()
        self.dispose()
        
        # reduce the browser frame active count by one
        BrowserFrame.activeCount -= 1
        # if it is already 0, make it non-neggative number; counter cannot be negative
        if BrowserFrame.activeCount < 0 :
            BrowserFrame.activeCount = 0
        # only the last frame (active count is zero) can make the final exit (sys.exit(0) )
        # but anyway, if it is child, we cannot exit system ,because parent may be still alive
        if BrowserFrame.activeCount == 0 :
            if self.exit_when_term :
                sys.exit(0)

    # is invoked when push TextSizeChanged menubar
    # the caption on menu is used as textsize of JEditorPane
    # this method still have problem; it set size of only plain text not for html-based like IE
    def onTextSizeChanged(self, event) :
        newSize = int(event.getActionCommand())
        self.editor.setFont( Font(self.fontName, Font.PLAIN, newSize) )

    # invoked when push ViewSource menubar
    def onViewSource(self, event) :
        try :
            source = self.editor.getText()
            f = open('source.tmp', 'w')
            f.write(source)
            f.close()
            start_new_thread(system, ('notepad source.tmp', ))
            print "<<Browser>> Current source can be viewed by Notepad"
            self.status.setText('View source')
        except :
            print "<<Browser>> Cannot view source"
            self.status.setText('Cannot view source')

    # is invoked when push AddFavorite menubar
    # this method will set the current URL to be one of favorite list
    def onAddFavorite(self, event) :
        favName = JOptionPane.showInputDialog(self, "PWB - Browser will add this page to favorite list\nPlease enter name : ")
        favURL = self.cbLocation.getEditor().getItem()
        self.favorites[favName] = favURL
        fav_menu_item = JMenuItem(favName, actionPerformed=self.onGoToFavorite)
        fav_menu_item.setToolTipText(favURL)
        self.favorite_menu.add(fav_menu_item)
        print "<<Browser>> Add current page to favorite list"

    # invoked when push Favorite button or ShowFavorite menubar
    # just create and show FavoriteDialog()
    def onShowFavorite(self, event) :
        favDialog = FavoriteDialog(self)
        favDialog.show()

    # invoked when push Help button or Help menubar
    # this is underconstructed; it's gonna be HTML-based help and use either our Browser or IE
    def onHelp(self, event) :
        JOptionPane.showMessageDialog(self, "Help is underconstruct", "Browser", 0, self.iconHelp)

    # invoked when push About menubar
    def onAbout(self, event) :        
        msg = '<html><center><h3><font color="red">Web Browser for PWB</font></h3></center>' + \
                '<p><b>Program by</b> <i><br>Thanawat Keawka<br>Boontawee Suntisrivaraporn</i>' + \
                '<br>Copyright &copy; 2001' + \
                '<p><b>email :</b> <a href="mailto:meng234@hotmail.com"<i>meng234@hotmail.com<i></a>' + \
                '</html>'
        JOptionPane.showMessageDialog(self, msg, 'Browser Help', 0, self.iconHelp)

# =============  End of BrowserFrame Class ============


# ============= Begin of Organize Favorite Class ================
class FavoriteDialog(JDialog) :
    
    def __init__(self, parent) :
        JDialog.__init__(self, parent, 'Organize Favorites', 1)
        self.main = parent
        self.setSize(330, 300)
        #self.setResizable(0)
        self.contentPane.setLayout(BorderLayout(10,10))

        self.addWindowListener(self.main.MyWindowAdapter(self))
            
        table = []
        for favName in self.main.favorites.keys() :
            row = favName, self.main.favorites[favName]
            table.append(row)
        table.sort()
        self.jtable = JTable(table, ('Favorite name', 'Location'))
        #self.jtable.setEnabled(0)
        
        bottom = JPanel(FlowLayout())

        btApply = JButton("Apply", actionPerformed=self.onApply)
        btDelete = JButton("Delete", actionPerformed=self.onDelete)
        btClose = JButton("Close", actionPerformed=self.onClose)
        bottom.add(btApply)
        bottom.add(btDelete)
        bottom.add(btClose)

        self.scroller = JScrollPane(self.jtable)
        self.contentPane.add(self.scroller, BorderLayout.CENTER)
        self.contentPane.add(bottom, BorderLayout.SOUTH)

    def onApply(self, event) :
        # this line is very important; we are about to del all favorites
        self.main.favorites.clear()
        for row in range(self.jtable.getRowCount()) :
            favName = self.jtable.getValueAt(row, 0)
            favURL = self.jtable.getValueAt(row, 1)
            if ( favName=="" and favURL=="" ) :
                continue
            self.main.favorites[favName] = favURL
        # update the view of table
        self.contentPane.remove(self.scroller)
        table = []
        for favName in self.main.favorites.keys() :
            row = favName, self.main.favorites[favName]
            table.append(row)
        table.sort()
        self.jtable = JTable(table, ('Favorite name', 'Location'))
        self.scroller = JScrollPane(self.jtable)
        self.contentPane.add(self.scroller, BorderLayout.CENTER)
        self.validate()
        print "<<Browser>> Favorites have been updated"
        JOptionPane.showMessageDialog(self, "Favorites have been updated")        

    def onDelete(self, event) :
        delRows = self.jtable.getSelectedRows()
        for delRow in delRows :
            #favName = self.jtable.getValueAt(delRow, 0)
            self.jtable.setValueAt("", delRow, 0)
            self.jtable.setValueAt("", delRow, 1)

    def onClose(self, event) :
        # update the parent favorite menu
        self.main.validateFavorite()
        # close this dialog
        self.dispose()
    
    
#===========================================================================
#           Below this line is called only run this file as main module
#            And never reach by all other means
#===========================================================================


if __name__ == '__main__' :
    # create new BrowserFrame
    # homeURL = 'http://www.ce.kmitl.ac.th'
    # frameID = 0
    # isChild = 0 ; so whenever the program terminate it will call sys.exit(0)
    
    frame = BrowserFrame('http://www.ce.kmitl.ac.th', 0, 0)
    frame.show()
    