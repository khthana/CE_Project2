class Public_Library:

    def notify_email(self):
#notify_email_comment#
        '''This method is to notify user by email.
Requirement:
    - user email (can be more than 1)
Return:
    - result string
    	"Send mail success" for Ok
    	"Send mail fail" for Error'''
#notify_email_modify#
        '''20/4/2001 11:0'''
#notify_email_end#
        __mail_server = '161.246.4.3'
        __sender = 's0010086@ce.kmitl.ac.th'
        __msg = 'To: '
        from smtplib import *
        for __mail in EMAIL:
            __msg = __msg + __mail + ','
        __msg = __msg[:-1] + '\nSubject: Notification from schedule Server.\n\n'
        __msg = __msg + TIME + '\n<Event>' + EVENT
        if len(EXTEND) != 0:
            __i = 0
            __j = 0
            __tmp = replace(EXTEND, '<', '\n<')
            while __j != -1:
                __j = find(__tmp, '>', __i)
                if __j != -1:
                    __msg = __msg + __tmp[__i:__j + 1]
                else:
                    __msg = __msg + __tmp[__i:]
                __i = __j + 1
        __msg = __msg + '\n\nFrom Schedule Server.'
        __result = {}
        __server = SMTP(__mail_server)
        __result = __server.sendmail(__sender, EMAIL, __msg)
        __server.quit()
        if len(__result) == 0:
            return 'Send mail success'
        else:
            return 'Send mail fail'

    def notify_gsm(self):
#notify_gsm_comment#
        '''This method is to send notify to user via GSM Short Message Service.
Requirement:
    - user mobilephone number (can be more than 1)
Return:
    - result string include amount of message sent and amount of bad message'''
#notify_gsm_modify#
        '''20/4/2001 18.45'''
#notify_gsm_end#
        class gsm:
            def send_msg(self, data_out):
                from socket import *
                __Host = '202.183.251.250'
                __Port = 80
                __Url = 'http://202.183.251.250/cgi-bin/web2sms.cgi'
                data_out = 'POST ' + __Url + ''' HTTP/1.0
Accept: */*
Content-type: application/x-www-form-urlencoded
Content-length: ''' + str(len(data_out)) + '\n\n' + data_out
                __s = socket(AF_INET, SOCK_STREAM)
                __s.connect(__Host, __Port)
                __s.send(data_out)
                __info = __s.recv(1024)
                __i = find(__info, '\r\n')
                __result = __info[:__i]
                if __result == 'HTTP/1.0 200 OK':
                    return 'Ok'
                else:
                    return 'Error ' + __result[9:]
        __msg_amount = 0
        __bad_msg = 0
        for __mob_no in MOBILE:
            __head = 'szGsmNo=<mob_no>&szGsmPwd=<passwd>&szMesg='
            __mob_no = split(__mob_no, ':')
            if len(__mob_no) == 1:
                __mob_no.append('')
            __head = replace(__head, '<mob_no>', __mob_no[0][3:])
            __head = replace(__head, '<passwd>', __mob_no[1])
            __msg = TIME + ' :' + EVENT
            if len(EXTEND) != 0:
                __i = 0
                __j = 0
                #__tmp = EXTEND
                while __j != -1:
                    __i = find(EXTEND, '>', __j)
                    __j = find(EXTEND, '<', __i)
                    if __j != -1:
                        __msg = __msg + ' :' + EXTEND[__i + 1:__j]
                    else:
                        __msg = __msg + ' :' + EXTEND[__i + 1:]
            __sender = gsm()
            if len(__msg) > 140:
                while len(__msg) > 140:
                    __i = rfind(__msg, ' ', 0, 136)
                    __result = __sender.send_msg(__head + __msg[:i] + '...')
                    __msg_amount = __msg_amount + 1
                    if __result != 'Ok':
                        __bad_msg = __bad_msg + 1
                    __msg = __msg[i + 1:]
            __result = __sender.send_msg(__head + __msg)
            __msg_amount = __msg_amount + 1
            if __result != 'Ok':
                __bad_msg = __bad_msg + 1
        if __bad_msg == 0:
            if __msg_amount == 1:
                __result = str(__msg_amount) + 'message sent'
            else:
                __result = str(__msg_amount) + 'messages sent'
        else:
            if __msg_amount == 1:
                __result = str(__msg_amount) + 'message sent with'
            else:
                __result = str(__msg_amount) + 'messages sent with'
            if __bad_msg == 1:
                __result = __result + str(__bad_msg) + ' bad message'
            else:
                __result = __result + str(__bad_msg) + ' bad messages'
        return __result

    def show(self):
#show_comment#
        '''show Hello!'''
#show_modify#
        '''30/4/2001 13:54'''
#show_end#
        print 'Hello!'
