from string import *
import time
import Threading

Home_path = 'C:\Apachegroup\Apache\htdocs\user\\'
Task_pool = {}
Task_list = []
Quit = 0

class Time_agent:

    Time = 'hr:mn'
    Date = 'dd/mm/year'
    Current_time = ''

    def cmp_time(self, tt):
        #tt > Current : 1
        __tmp = time.localtime(time.time())
        time.sleep(1)
        self.Time = str(__tmp[3]) + ':' + str(__tmp[4])
        self.Date = str(__tmp[2]) + '/' + str(__tmp[1]) + '/' + str(__tmp[0])
        self.Current_time = self.Date + ' ' + self.Time
        tt = split(tt, '/')
        self.Current_time = split(self.Current_time, '/')
        __tmp = split(tt[-1], ' ')
        tt[-1] = __tmp[0]
        __tmp = split(__tmp[1], ':')
        tt = tt + __tmp
        __tmp = split(self.Current_time[-1], ' ')
        self.Current_time[-1] = __tmp[0]
        __tmp = split(__tmp[1], ':')
        self.Current_time = self.Current_time + __tmp
        __index = [2,1,0,3,4]
        for __i in __index:
            if int(tt[__i]) > int(self.Current_time[__i]):
                return 1
            elif int(tt[__i]) < int(self.Current_time[__i]):
                return 0
        return 0

class Task_agent(Threading.Thread):

    def compare(self, obj1, obj2):
        # obj1 > obj2 : 1
        obj1 = split(obj1, '/')
        obj2 = split(obj2, '/')
        __tmp = split(obj1[-1], ' ')
        obj1[-1] = __tmp[0]
        __tmp = split(__tmp[1], ':')
        obj1 = obj1 + __tmp
        __tmp = split(obj2[-1], ' ')
        obj2[-1] = __tmp[0]
        __tmp = split(__tmp[1], ':')
        obj2 = obj2 + __tmp
        __index = [2,1,0,3,4]
        for __i in __index:
            if int(obj1[__i]) > int(obj2[__i]):
                return 1
            elif int(obj1[__i]) < int(obj2[__i]):
                return 0
        return 0

    def add_task(self, task):
        Task_pool[task[-1]] = task[:-1]
        __index = 0
        for __t in Task_list:
            if self.compare(__t[1], task[4]):
                __index = Task_list.index(__t)
                Task_list.insert(__index, [task[-1], task[4]])
                __index = -1
                break
        if __index == 0:
            Task_list.append([task[-1], task[4]])
        print 'Task added.'

    def del_task(self, task):
        for __i in range(len(Task_list)):
            if Task_list[__i][0] == task[1]:
                del Task_list[__i]
        if Task_pool.has_key(task[1]):
            del Task_pool[task[1]]
        print 'Task_remove done.'

    def run(self):
        while not Quit:
            time.sleep(5)
            __f = open(Home_path + 'username.txt', 'r')
            __user_list = strip(__f.read())
            __f.close()
            __user_list = split(__user_list, '\n')
            for __i in range(len(__user_list)):
                __tmp = split(__user_list[__i], ':')
                __user_list[__i] = __tmp[0]
            for __user in __user_list:
                if strip(__user) != '':
                    __f = open(Home_path + __user + '\job.txt', 'r')
                    __data = strip(__f.read())
                    __f.close()
                    __data = split(__data, '\n')
                    if __data != ['']:
                        __f = open(Home_path + __user + '\job.txt', 'w')
                        __f.write('')
                        __f.close()
                        for __job in __data:
                            __job = split(__job, '-')
                            for __i in range(len(__job)):
                                __job[__i] = replace(__job[__i], '#keed#', '-')
                            if __job[0] != 'remove':
                                __job.insert(0, __user)
                                self.add_task(__job)
                            else:
                                self.del_task(__job)

class Task_handler(Threading.Thread):

    def addobj(self, obj):
        self.__id = obj

    def get_var(self):
        global TASKID
        global USERNAME
        global TIME
        global EVENT
        global ACTION
        global ACTIONTIME
        global EXTEND
        global NAME
        global EMAIL
        global PAGER
        global MOBILE
        global FIELD
        __task = Task_pool[self.__id]
        TASKID = strip(self.__id)
        USERNAME = strip(__task[0])
        TIME = __task[1]
        EVENT = __task[2]
        ACTION = strip(__task[3])
        ACTIONTIME = strip(__task[4])
        EXTEND = __task[5]
        self.__user_path = Home_path + USERNAME + '\\'
        __f = open(self.__user_path + 'userdetail.txt', 'r')
        __data = __f.read()
        __f.close()
        __data = split(__data, '\n')
        for __i in range(len(__data)):
            __data[__i] = split(__data[__i], ':')
        NAME = __data[0][1]
        EMAIL = split(__data[3][1], ',')
        PAGER = split(__data[4][1], ',')
        MOBILE = split(__data[5][1], ',')
        FIELD = split(__data[6][1], '-')

    def run(self):
        self.get_var()
        __f = open(self.__user_path + 'user_met.py', 'r')
        __code = __f.read()
        __f.close()
        __version = __code[19:22]
        exec __code
        self.user = eval('user' + __version + '()')
        if ACTION != 'None':
            result = eval('self.user.' + ACTION + '()')
            print result

class Task_manager(Threading.Thread):

    def run(self):
        while not Quit:
            time.sleep(1)
            if len(Task_list) != 0:
                the_time = Time_agent()
                __task = Task_list[0]
                while the_time.cmp_time(__task[1]):
                    time.sleep(10)
                    __task = Task_list[0]
                the_worker = Task_handler()
                the_worker.addobj(__task[0])
                the_worker.start()
                Task_list.remove(__task)
                del Task_pool[__task[0]]

if __name__ == '__main__':
    the_seeker = Task_agent()
    the_seeker.start()
    the_watcher = Task_manager()
    the_watcher.start()
    
