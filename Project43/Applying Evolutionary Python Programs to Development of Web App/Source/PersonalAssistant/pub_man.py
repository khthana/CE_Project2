from string import *

class Public_Manager:

    Public_file = 'C:\Apachegroup\Apache\htdocs\Public\pub_lib.py'
    log_file = 'C:\Apachegroup\Apache\htdocs\Public\log_file.txt'
    __log_data = {}

    def __get_log_data(self):
        __result = {}
        __f = open(self.log_file, 'r')
        __data = __f.readlines()
        __f.close()
        for __log in __data:
            __log = split(__log, '::')
            __result[__log[0]] = strip(__log[1])
        self.__log_data = __result

    def add(self, name, user, time, code, comment):
        self.__get_log_data()
        if not self.__log_data.has_key(name):
            __i = find(code, '\n    d' + 'ef ')
            __j = find(code, '):\n        ', __i)
            comment = '#' + name + "_comment#\n        '''" + comment + "'''\n#"
            comment = comment + name + "_modify#\n        '''" + time + "'''\n#" + name + '_end#'
            code = code[__i:__j + 3] + comment + code[__j + 2:]
            code = rstrip(code) + '\n'
            __f = open(self.Public_file, 'r')
            __data = __f.read()
            __f.close()
            __data = __data + code
            __f = open(self.Public_file, 'w')
            __f.write(__data)
            __f.close()
            __f = open(self.log_file, 'r')
            __history = __f.read()
            __f.close()
            __history = __history + name + '::' + user + '\n'
            __f = open(self.log_file, 'w')
            __f.write(__history)
            __f.close()
            return 'Method ' + name + ' added.'
        else:
            return 'Method ' + name + ' already exist.'

    def remove(self, name, user):
        self.__get_log_data()
        if self.__log_data.has_key(name):
            if user == self.__log_data[name]:
                __f = open(self.Public_file, 'r')
                __data = __f.read()
                __f.close()
                __i = find(__data, '\n    d' + 'ef ' + name + '(')
                __j = find(__data, '\n    d' + 'ef ', __i + 9)
                if __j != -1:
                    __data = __data[:__i] + __data[__j:]
                else:
                    __data = rstrip(__data[:__i]) + '\n'
                __f = open(self.Public_file, 'w')
                __f.write(__data)
                __f.close()
                __f = open(self.log_file, 'r')
                __history = __f.read()
                __f.close()
                __history = replace(__history, name + '::' + user + '\n', '')
                __f = open(self.log_file, 'w')
                __f.write(__history)
                __f.close()
                return 'Method ' + name + ' removed.'
            else:
                return 'User not allowed.'
        else:
            return 'Method not found.'
