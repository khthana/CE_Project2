
/*   sendmail.pl by Z.Meltem ISMIK
   
   This program sends an email message through the specified outgoing 
   mail server. 
   
   The mail library predicate mail_send/  constructs an RFC822 header  
   from the arguments given, encodes attachments if neccessary, 
   connects to the outgoing mail server and sends the email message  
   stored in the given file.
   
   This program ouputs a log of the SMTP dialog by using the mail_set/2 
   predicate. You can save this information by redirecting the output 
   of the program to a  file.

 

USAGE :  Write your email message with a text editor and save it on
         disk.

         Compile 'sendmail.pl' using Run/Compile menu option.
     
         Execute send_mail/8 from the Prolog console. 


send_mail( +Server, 
           +From, 
           +ToList, 
           +CCList, 
           +BCCList, 
           +Subject, 
           +Message,
           +Attach )

Server   = String or atom
           The name or the Internet address of the outgoing mail 
           server    
          
From     = String
           Your email address  
           
ToList   = List of strings
           The email addresses of the recipients.
            
CCList   = List of strings or a varible
           The email addresses of the carbon copy recipients.

BCCList  = List of strings or a varible
           The email addresses of the blind carbon copy recipients.
         
Subject  = String or a variable
           The subject of the message
           
Message  = Atom
           The name of the file where the body of the message 
           is stored.
           
Attach   = List of atoms or a variable
           The filename/s of the attachments.
           
EXAMPLE : Mail Server:  smtp.free.com
          From       :  fred@free.com
          To         :  tcp@lpa.co.uk
          CC         :  mary@free.com
          BCc        :  tim@hotmail.com
          Subject    :  testing sendmail.pl
          Message    :  message.txt
          Attachment :  sendmail.pl,
                        index.htm,
                        abt.gif

| ?-send_mail( `smtp.free.com`, 
               `fred@free.com`, 
               [`tcp@lpa.co.uk`],
               [`mary@free.com`],
               [`tim@hotmail.com`],
               `testing sendmail.pl`,
               'message.txt', 
               ['sendmail.pl','index.htm','abt.gif']
              ). 
 
*/   
:- initialization(send_mail_init).

send_mail_init:-
   ensure_loaded(library('tcp\tcp')),
   ensure_loaded(library('tcp\mail')),
   mail_init.
 

 
send_mail( Server, From, To, CC, BCC, Subj, Body, Attach ):-
   mail_set(log, on),
   mail_send( Server, _, 
              (From, To, CC, BCC, Subj, Body, Attach), 
              Sent 
            ).
   
 
