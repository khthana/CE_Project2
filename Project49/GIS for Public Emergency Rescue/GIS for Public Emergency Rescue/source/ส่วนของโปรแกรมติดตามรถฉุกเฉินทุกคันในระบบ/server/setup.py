# A very simple setup script to create 2 executables.
#
# hello.py is a simple "hello, world" type program, which alse allows
# to explore the environment in which the script runs.
#
# test_wx.py is a simple wxPython program, it will be converted into a
# console-less program.
#
# If you don't have wxPython installed, you should comment out the
#   windows = ["test_wx.py"]
# line below.
#
#
# Run the build process by entering 'setup.py py2exe' or
# 'python setup.py py2exe' in a console prompt.
#
# If everything works well, you should find a subdirectory named 'dist'
# containing some files, among them hello.exe and test_wx.exe.
##import psyco
##psyco.full()

import glob, os, sys
#try:
#    import modulefinder
#    import win32com
#    for p in win32com.__path__[1:]:
#        modulefinder.AddPackagePath("win32com", p)
#    for extra in ["win32com.client"]: #,"win32com.mapi"
#        __import__(extra)
#        m = sys.modules[extra]
#        for p in m.__path__[1:]:
#            modulefinder.AddPackagePath(extra, p)
##
###    from win32com.client import gencache,WithEvents, Dispatch, constants
###    sapi_mod = gencache.EnsureModule('{C866CA3A-32F7-11D2-9602-00C04F8EE628}', 0, 5, 0)
###    tts_default = constants.SVSFDefault
##
#except ImportError, e:
##    print e
##    # no build path setup, no worries.
#    pass

from distutils.core import setup
import py2exe


sys.argv.append('py2exe')
sys.argv.append('-d')
sys.argv.append('Emergency')


    

    # targets to build
    
    #console = ["Search.py"],
    #console = ["member.py"]
    
setup(
    # The first three parameters are not required, if at least a
    # 'version' is given, then a versioninfo resource is built from
    # them and added to the executables.
    version = "1.0.1",
    description = "Emergency Rescue System",
    name = "Emergency",
    #windows = ["TaxiClient.py"],
##    version = "1.0.0",
##    description = "Intelligent Navigating Car",
##    name = "iNavigator",
    options = {"py2exe": { "typelibs": [('{C866CA3A-32F7-11D2-9602-00C04F8EE628}',0,5,0)], 
                        "packages": ["encodings.cp874",],
                        "dll_excludes": ["MFC71.dll"],
                        #"dll_include": ["proj.dll", "msvcp71.dll"],

                        }
              },
    # targets to build
    windows = [
    #console = [
                { 
                "script": "server.py" 
##                "icon_resources": [(1, "../../Project I/pictures/taxi.ico")] 
                }
##                } ,
##                { 
##                "script": "TaxiServer.py", 
##                "icon_resources": [(1, "../../Project I/pictures/taxi_server.ico")] 
##                }
                ],
    data_files=[
                (".",
                    [ #"pointdb.txt", "pathdb.txt",
                    "graph.dat", "location.dat",
                    "layers.xml", #"config.ini",
                    "inteltaxi.cfg", "wait.gif", "thaitaxi.jpg", 
                    "snd_errserv.wav", "snd_newserv.wav",
                    "new.txt", "gps1.txt",
                    #os.sys.prefix + "\\MFC71.dll",
                    os.sys.prefix + "\\proj.dll",
                    os.sys.prefix + "\\msvcp71.dll",   
#                   "C:\WINDOWS\system32\OLEAUT32.dll",
#                   "C:\WINDOWS\system32\USER32.dll",
#                   "C:\WINDOWS\system32\IMM32.dll",
#                   "C:\WINDOWS\system32\SHLWAPI.dll",
#                   "C:\WINDOWS\system32\ADVAPI32.dll",
#                   "C:\WINDOWS\system32\msvcrt.dll",
#                   "C:\WINDOWS\system32\WS2_32.dll",
#                   "C:\WINDOWS\system32\GDI32.dll",
#                   "C:\WINDOWS\system32\WINMM.dll",
#                   "C:\WINDOWS\system32\CRYPT32.dll",
#                   "C:\WINDOWS\system32\imagehlp.dll",
#                   "C:\WINDOWS\system32\MSWSOCK.dll",
#                   "C:\WINDOWS\system32\SHFOLDER.dll",
#                   "C:\WINDOWS\system32\KERNEL32.dll",
#                   "C:\WINDOWS\system32\ODBC32.dll",
#                   "C:\WINDOWS\system32\WSOCK32.dll",
#                   "C:\WINDOWS\system32\VERSION.dll",
#                   "C:\WINDOWS\system32\ole32.dll",
#                   "C:\WINDOWS\system32\SHELL32.dll",
#                   "C:\WINDOWS\system32\RPCRT4.dll",
#                   "C:\WINDOWS\system32\comdlg32.dll",
#                   "C:\WINDOWS\system32\COMCTL32.dll",
#                   "C:\WINDOWS\system32\WINSPOOL.DRV",
#                   
                    ]
                    ),
                ("data",
                    glob.glob(os.sys.prefix + '\\data\\*.*')
                  ),
                ("map",
                    glob.glob('.\\map\\*.*')
                  ),
                 
                  ],

    #console = ["Search.py"],
    #console = ["member.py"]
    )
