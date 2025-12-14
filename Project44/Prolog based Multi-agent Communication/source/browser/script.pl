checkmail_all :- 
	find_serv_user_pass(Server,Username,Pass),
	checkemail(Server,Username,Pass,`Subject`,[``]).

checkmail_bysubject(Condition) :- 
	find_serv_user_pass(Server,Username,Pass),
	checkemail(Server,Username,Pass,`Subject`,Condition).

checkmail_bydate(Condition) :- 
	find_serv_user_pass(Server,Username,Pass),
	checkemail(Server,Username,Pass,`Date`,Condition).

checkemail(Server,Username,Pass,TypeCheck,Condition) :-
	Window = (user_dialog,8000),
	MailFile = 'mail.txt',
	mail_check( Server, _, Username, Pass, NoOfMsgs),
	(NoOfMsgs == 0 ->
	  ( write_edit_box(Window,`ไม่มีข้อมูลใหม่`) );
          (mail_get_if( Server, _, Username,Pass ,0, 'mail.txt', (TypeCheck,contains,any_of,Condition),Total,Got ),
           (Got == 0 ->
		( write_edit_box(Window,`ไม่มีข้อมูลใหม่`) );
                (mail_parse_all(MailFile,Msgs,Parse),
                 del(MailFile),
		 ( write( ` There are `),
		   write( Got ),
		   write( ` mail for you. `)
		 ) ~> Message,
                 message_box(ok, Message, _ ), 
                 forall( member( (From,To,Cc,Bcc,Subj,Date,Header,Body,Attach) , Msgs ),
                         ( write_edit_box(Window,`Subject:~I`),
			   write_edit_box(Window,Subj),
			   write_edit_box(Window,`~M~JFrom:~I`),
			   write_edit_box(Window,From),
			   write_edit_box(Window,`~M~JDate:~I`),
			   write_edit_box(Window,Date),
			   write_edit_box(Window,`~M~J`),
			   write_data_from_file(Body)~>MailText,
			   write_edit_box(Window,MailText),
			   write_edit_box(Window,`~M~J~I=============================== END `),
			   write_edit_box(Window,`MESSAGE ==============================~M~J~M~J`)
                         )             
                       )   /*forall*/                 
                )   /*mail_parse_all*/   
           )   /*Got == 0*/    
          )  /*mail_get_if*/
     ).
sendmail(To,Subj,Body)  :- sendmail(To,_,_,Subj,Body,_).
sendmail(To,CC,BCC,Subj,Body,Attach) :-
	atom(Body),
	mail_set(log, on),
	my_name(ID),
	user_email(ID,Address,Password),	
	mail_send(`bundit.graduate.kmitl.ac.th`, _,(Address, To, CC, BCC, Subj, Body, Attach), Sent ).
sendmail(To,CC,BCC,Subj,Body,Attach) :-
	string(Body),
	write_to_file(Body, 'body.txt'),
	mail_set(log, on),
	my_name(ID),
	user_email(ID,Address,Password),	
	mail_send(`bundit.graduate.kmitl.ac.th`, _,(Address, To, CC, BCC, Subj, 'body.txt', Attach), Sent ).
	
	
