#Current Version : 000
from string import *
from smtplib import *

class user000:
    
    Username = 'username'
    Home_path = 'C:\Apachegroup\Apache\htdocs\user\\' + Username
    User_file = Home_path + '\user_met.py'
    Public_file = 'C:\Apachegroup\Apache\htdocs\Public\pub_lib.py'
    Version = '000'
    Methods = ['__find_methods', 'add_method', 'revise_method', 'remove_method']
    
    def __find_methods(self, file, name = '#all'):
        __m_name = []
        __f = open(file, 'r')
        __data = __f.read()
        __f.close()
        __i = 0
        __j = 0
        while __i != -1 and __j != -1:
            __i = find(__data, '\n    d' + 'ef ', __j)
            __j = find(__data, '(', __i + 9)
            if __i != -1:
                __m_name.append(__data[__i + 9:__j])
        if name == '#all':
            return __m_name
        elif name in __m_name:
            __i = find(__data, '    d' + 'ef ' + name)
            __j = find(__data, '\n    d' + 'ef ', __i)
            if __j != -1:
                return rstrip(__data[__i:__j])
            else:
                return rstrip(__data[__i:])
        else:
            return 'Error! Method not found.'
    def add_method(self, name):
        if name not in self.Methods:
            __tmp = str(int(self.Version) + 1)
            __new_v = '0'*(3 - len(__tmp)) + __tmp
            __source = self.__find_methods(self.Public_file, name)
            __file = open(self.User_file, 'r')
            __data = __file.read()
            __file.close()
            __tmp = "Methods = ['"
            for __met in self.Methods:
                __tmp = __tmp + __met + "', '"
            __tmp = __tmp[:-3] + ']'
            self.Methods.append(name)
            __str = "Methods = ['"
            for __met in self.Methods:
                __str = __str + __met + "', '"
            __str = __str[:-3] + ']'
            __data = __data + '\nclass user' + __new_v + '(user' + self.Version
            __data = __data + "):\n\n    Version = '" + __new_v +"'\n\n"
            __data = __data + __source + '\n'
            __data = replace(__data, 'Version : ' + self.Version, 'Version : ' + __new_v)
            __data = replace(__data, __tmp, __str)
            __file = open(self.User_file, 'w')
            __file.write(__data)
            __file.close()
            __result = 'Method ' + name + ' added.'
        else:
            __result = 'Error! Method already exist.'
        return __result
    def revise_method(self, name):
        if name in self.Methods:
            __tmp = str(int(self.Version) + 1)
            __new_v = '0'*(3 - len(__tmp)) + __tmp
            __source = self.__find_methods(self.Public_file, name)
            __file = open(self.User_file, 'r')
            __data = __file.read()
            __file.close()
            __data = __data + '\nclass user' + __new_v + '(user' + self.Version
            __data = __data + "):\n\n    Version = '" + __new_v +"'\n\n"
            __data = __data + __source + '\n'
            __data = replace(__data, 'Version : ' + self.Version, 'Version : ' + __new_v)
            __file = open(self.User_file, 'w')
            __file.write(__data)
            __file.close()
            __result = 'Method ' + name + ' revised.'
        else:
            __result = 'Error! Method not found.'
        return __result
    def remove_method(self, name):
        if name in self.Methods:
            __tmp = str(int(self.Version) + 1)
            __new_v = '0'*(3 - len(__tmp)) + __tmp
            __file = open(self.User_file, 'r')
            __data = __file.read()
            __file.close()
            __data = __data + '\nclass user' + __new_v + '(user' + self.Version
            __data = __data + "):\n\n    Version = '" + __new_v +"'\n\n"
            __data = __data + '    d' + 'ef ' + name + '(self):\n        pass\n'
            __data = replace(__data, 'Version : ' + self.Version, 'Version : ' + __new_v)
            __data = replace(__data, ", '" + name + "'", '')
            __file = open(self.User_file, 'w')
            __file.write(__data)
            __file.close()
            __result = 'Method ' + name + ' removed.'
        else:
            __result = 'Error! Method not found.'
        return __result
