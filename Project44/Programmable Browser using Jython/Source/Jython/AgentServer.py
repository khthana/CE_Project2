from os import curdir, sep
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import urllib
from WebAgent import *
from Parser import Parser

scriptOutput = '''<html>
<head>
<title>Un title page</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>

<body bgcolor="#FF99FF">
<div align="center"><font size="4" color="#FFCC33"><b>Output console </b></font> 
  <form name="form1" method="post" action="">
    <textarea name="output" cols="60" rows="19"><!-- output --></textarea>
    <br>
  </form>
</div>
</body>
</html>
'''
logoutPage = '''<html>
<head>
<title>Un title page</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>

<body bgcolor="#0066FF">
<div align="center"> 
  <p><font color="#CC3300" size="6"><b><font color="#FFCC33">Logout complete<br>
    Thanks for using me remotely</font></b></font><br>
    <font color="#00CC66"><b><font size="5">Bye Bye<br>
    <!-- username --></font></b></font></p>
</div>
</body>
</html>
'''
remoteLoginState = 0
class MyHandler(BaseHTTPRequestHandler) :
    def handleLogin(self, rawURL) :
        url, formData = rawURL.split('?')
        #print formData
        usrItem, pwdItem, submitItem = formData.split('&')
        #print usrItem
        #print pwdItem
        usr = usrItem.split('=')[1]
        #print usr
        pwd = pwdItem.split('=')[1]
        #print pwd
        #Begin unquote section
        print '###summary###'
        realURL = urllib.unquote_plus(url)
        print realURL
        realUsr = urllib.unquote_plus(usr)
        print realUsr
        realPwd = urllib.unquote_plus(pwd)
        print realPwd
        return realURL, realUsr, realPwd
    
    def handleRunCode(self, rawURL) :
        url, formData = rawURL.split('?')
        #print formData
        codeItem = formData.split('&')[0]
        #print codeItem
        code = codeItem.split('=')[1]
        #print code
        #Begin unquote section
        print '###summary###'
        realURL = urllib.unquote_plus(url)
        print realURL
        realCode = urllib.unquote_plus(code)
        print realCode
        return realURL, realCode
    
    def handleEventAction(self, rawURL) :
        url, formData = rawURL.split('?')
        #print formData
        listItem = formData.split('&')[0]
        #print codeItem
        list = listItem.split('=')[1]
        #print code
        #Begin unquote section
        print '###summary###'
        realURL = urllib.unquote_plus(url)
        print realURL
        realList = urllib.unquote_plus(list)
        print realList
        return realURL, realList
    
    def verifyUser(self, usr, pwd) :
        if usr == agent.user_name and pwd == agent.user_password :
            return 1
        return 0
    
    def runCode(self, code) :
        agent.console.textpane.setText('')
        try :
            exec code in agent.agentNameSpace
        except :
            print 'remote script error'

    def runEventAction(self, code) :
        agent.console.textpane.setText('')
        p = Parser(agent)
        p.addEventAction(code)
        
    def do_GET(self) :
        try :
            print self.path
            if self.path == '/' or self.path == '/login.html' :
                #Default is login page
                f=open(curdir+sep+'login.html')
                op = f.read()
                f.close()
            elif self.path.startswith('/mainframe.html') :
                #Verify usr, pwd and return editor page with no console
                url, usr, pwd = self.handleLogin(self.path)
                if self.verifyUser(usr, pwd) :
                    print 'verify pass'
                    global remoteLoginState
                    remoteLoginState = 1
                    #f=open(curdir+sep+url)
                    #op = run1HTML.replace('<!-- usr -->', usr)
                    f=open(curdir+sep+'mainframe.html')
                    op = f.read()
                    f.close()
                else :#login fail
                    op = "Login Fail"
                  
            elif self.path.startswith('/script') :
                #Return editor page with output console
                url, code= self.handleRunCode(self.path)
                global remoteLoginState
                if remoteLoginState  :
                    self.runCode(code)
                    #f=open(curdir+sep+url)
                    op = scriptOutput.replace('<!-- output -->', agent.console.textpane.getText())
                else :
                    print 'Cannot run because you do not login'
                    op= 'Cannot run because you do not login'
            elif self.path.startswith('/eventaction') :
                url, allLists = self.handleEventAction(self.path)
                global remoteLoginState
                if remoteLoginState  :
                    self.runEventAction(allLists)
                    op = scriptOutput.replace('<!-- output -->', allLists+agent.console.textpane.getText())
                else :
                    print 'Cannot run because you do not login'
                    op= 'Cannot run because you do not login'
            elif self.path.startswith('/logout') :
                if remoteLoginState  :
                    remoteLoginState = 0
                    op = logoutPage.replace('<!-- username -->', agent.user_name)
                else :
                    op = 'You do not login.'
            else :
                f = open(curdir+sep+self.path)
                op = f.read()
                f.close()

            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(op)  #f.read()
            
            
        except IOError :
            self.send_error(404, 'File not found: %s'%self.path)
            '''
    def do_POST(self) :
        try :
            f=open(curdir+sep+self.path)
            print self.path
            print self.headers
            #print self.rfile.read()
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(f.read())
            f.close()
        except IOError :
            self.send_error(404, 'File not found: %s'%self.path)
            '''
def createWebServer() :
    global remoteLoginState
    remoteLoginState = 0
    try :
        server = HTTPServer(('', 80), MyHandler)
        print 'Start HTTP Server'
        server.serve_forever()
    except KeyboardInterrupt :
        print 'Error in HTTP Server'
        server.socket.close()
   
    
        
if __name__ =='__main__' :
    
    status = None
    popup = createLoadingPopup()
    popup.show()
    ####################################################
    agent = AgentFrame()
    agent.show()
    ####################################################
    popup.hide()

    # Prompt the login dialog for first come
    agent.showLoginDialog()
    createWebServer()