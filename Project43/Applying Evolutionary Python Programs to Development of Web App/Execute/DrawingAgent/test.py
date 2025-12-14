from mod_python import apache
from string import *
import os
import Threading
import time

class python_exe(Threading.Thread):
    def set_path(self, cp):
        self.c_path = cp

    def run(self):
        os.system('python ' + self.c_path + '\paintbook.py')

def handler(req):
    HomePath = 'c:\ApacheGroup\Apache\htdocs\\applet'
    Cli_Path = HomePath + '\client00'
    n = '00'
    while os.path.exists(Cli_Path):
        n = str(atoi(n) + 1)
        if len(n) < 2:
            n = '0' + n
        Cli_Path = Cli_Path[:-2] + n
    Sub_Path = Cli_Path + '\genpic'
    Cli_Url = 'http://161.246.5.100/applet/client' + n
    # create directories
    os.system('md ' + Cli_Path)
    os.system('md ' + Sub_Path)
    # create files
    os.system('copy ' + HomePath + '\paintbook.txt ' + Cli_Path + '\paintbook.py')
    os.system('copy ' + HomePath + '\\robot1.txt ' + Cli_Path + '\\robot1.py')
    os.system('copy ' + HomePath + '\\robot2.txt ' + Cli_Path + '\\robot2.py')
    os.system('copy ' + HomePath + '\\robot3.txt ' + Cli_Path + '\\robot3.py')
    os.system('copy ' + HomePath + '\Pyapplet.txt ' + Cli_Path + '\Pyapplet.java')
    os.system('copy ' + HomePath + '\Genpic.txt ' + Sub_Path + '\Genpic.java')
    os.system('copy ' + HomePath + '\Genpichtml.txt ' + Sub_Path + '\Genpichtml.html')
    # edit files
    file = open(Cli_Path + '\paintbook.py', 'r')
    data = file.read()
    file.close()
    data = replace(data, 'applet\client00', 'applet\client' + n)
    data = replace(data, 'Port = 10000', 'Port = 100' + n)
    file = open(Cli_Path + '\paintbook.py', 'w')
    file.write(data)
    file.close()
    file = open(Cli_Path + '\Pyapplet.java', 'r')
    data = file.read()
    file.close()
    data = replace(data, 'PORT = 10000', 'PORT = 100' + n)
    file = open(Cli_Path + '\Pyapplet.java', 'w')
    file.write(data)
    file.close()
    file = open(Sub_Path + '\Genpic.java', 'r')
    data = file.read()
    file.close()
    data = replace(data, 'PORT = 10000', 'PORT = 100' + n)
    file = open(Sub_Path + '\Genpic.java', 'w')
    file.write(data)
    file.close()
    # run paintbook.py
    runner = python_exe()
    runner.set_path(Cli_Path)
    runner.start()
    time.sleep(5)
    # compile javafiles
    os.system('javac ' + Cli_Path + '\Pyapplet.java')
    os.system('javac ' + Sub_Path + '\Genpic.java')
###### CGI ######
    req.content_type = "text/html"
    req.send_http_header()
    req.write('<HTML>')
    req.write('<HEAD>')
    req.write('<TITLE> Python Agent </TITLE>')
    req.write('<script language = "JavaScript">')
    req.write('function NewWin()')
    req.write('{WinOpen = open("' + Cli_Url + '/genpic/Genpichtml.html","w01","toolbar=yes,menubar=yes,addressbar=yes,statusbar=yes,width=800,height=500");}')
    req.write('</script>')
    req.write('</HEAD>')
    req.write('<BODY BGCOLOR="#FFFFFF">')
    req.write('<center>')
    req.write('<form>')
    req.write('<input type = button name = "N01"')
    req.write('value = "Genpic" onclick = "NewWin()">')
    req.write('</form>')
    req.write('</center>')
    req.write('<applet code="Pyapplet" codebase = "' + Cli_Url + '/" width=800 height=600></applet>')
    req.write('</BODY>')
    req.write('</HTML>')
    return apache.OK
