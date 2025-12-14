:- chdir( '.\' ).
:- ensure_loaded( conf ).
:- ensure_loaded( http_util ).
:- ensure_loaded( proweb_interface ).
:- ensure_loaded(library('tcp\mail')), mail_init.
:- ensure_loaded( script ).

user_dialog :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_thickframe,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,ws_vscroll,es_autohscroll,es_autovscroll,es_readonly,es_wantreturn],
   _S4 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll],
   _S5 = [ws_child,ws_visible,ss_left],
   wdcreate(  user_dialog,        `Prolog Web Browser`,  89, 31, 638, 504, _S1 ),
   wccreate( (user_dialog,1000),  button, `View`,       540, 30,  60,  30, _S2 ),
   wccreate( (user_dialog,1002),  button, `script`,     350, 18,  70,  22, _S2 ),
   wccreate( (user_dialog,1003),  button, `Checkmail`,  440, 20,  80,  22, _S2 ),
   wccreate( (user_dialog,8000),  edit,   ``,            10, 80, 610, 380, _S3 ),
   wccreate( (user_dialog,8001),  edit,   ``,            60, 20, 280,  20, _S4 ),
   wccreate( (user_dialog,8002),  edit,   ``,            60, 50, 460,  20, _S4 ),
   wccreate( (user_dialog,10000), static, `Demo`,        10, 20,  40,  20, _S5 ),
   wccreate( (user_dialog,10001), static, `Query`,       10, 50,  40,  20, _S5 ).


script_dialog :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_thickframe,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,es_autohscroll,es_autovscroll,es_wantreturn],
   _S3 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   wdcreate(  script_dialog,       `Write Script`,        227,  51, 468, 257, _S1 ),
   wccreate( (script_dialog,8000), edit,   ``,             10,  10, 350, 210, _S2 ),
   wccreate( (script_dialog,1000), button, `Run`,         370,  20,  80,  30, _S3 ),
   wccreate( (script_dialog,1001), button, `Cancel`,      370,  60,  80,  30, _S3 ),
   wccreate( (script_dialog,1002), button, `Ask`,         370, 100,  80,  30, _S3 ),
   wccreate( (script_dialog,1003), button, `Tell`,        370, 140,  80,  30, _S3 ),
   wccreate( (script_dialog,1004), button, `Send Script`, 370, 180,  80,  30, _S3 ).

ask_dialog :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_thickframe,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll,es_autovscroll],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,es_autohscroll,es_autovscroll],
   _S4 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S5 = [ws_child,ws_visible,ss_left],
   wdcreate(  ask_dialog,        `Ask`,                356, 56, 192, 151, _S1 ),
   wccreate( (ask_dialog,8000),  edit,   `Who`,         80, 20, 100,  20, _S2 ),
   wccreate( (ask_dialog,8001),  edit,   `Question?`,   80, 50, 100,  20, _S3 ),
   wccreate( (ask_dialog,1000),  button, `Ask`,         20, 80,  70,  30, _S4 ),
   wccreate( (ask_dialog,10000), static, `Ask who?`,    10, 20,  60,  20, _S5 ),
   wccreate( (ask_dialog,10001), static, `question :`,  10, 50,  60,  20, _S5 ),
   wccreate( (ask_dialog,1001),  button, `Cancel`,     100, 80,  70,  30, _S4 ).

tell_dialog :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_thickframe,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S3 = [ws_child,ws_visible,bs_autoradiobutton],
   _S4 = [ws_child,ws_visible,ws_tabstop,ws_border,lbs_sort,ws_vscroll,lbs_usetabstops],
   _S5 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,es_autohscroll,es_autovscroll,es_wantreturn],
   _S6 = [ws_child,ws_visible,ss_center],
   _S7 = [ws_child,bs_groupbox,ws_visible],
   wdcreate(  tell_dialog,        ``,                          260, 106, 268, 207, _S1 ),
   wccreate( (tell_dialog,1000),  button,  `Tell`,              20, 140,  60,  30, _S2 ),
   wccreate( (tell_dialog,1001),  button,  `Cancel`,           180, 140,  60,  30, _S2 ),
   wccreate( (tell_dialog,1002),  button,  `Forget`,           100, 140,  60,  30, _S2 ),
   wccreate( (tell_dialog,2000),  button,  `Tell Data`,         30,  70,  70,  20, _S3 ),
   wccreate( (tell_dialog,2001),  button,  `Tell File`,         30, 100,  70,  20, _S3 ),
   wccreate( (tell_dialog,4000),  listbox, `List1`,            120,  10, 120,  20, _S4 ),
   wccreate( (tell_dialog,8001),  edit,    ``,                 120,  70, 120,  60, _S5 ),
   wccreate( (tell_dialog,10000), static,  `Select Agent`,      20,  10,  90,  20, _S6 ),
   wccreate( (tell_dialog,10001), static,  `Data or FileName`, 120,  50, 120,  20, _S6 ),
   wccreate( (tell_dialog,11000), button,  `Type :`,            20,  50,  90,  80, _S7 ),
   wbtnsel( (tell_dialog,2000), 1 ),	
   forall( proweb_server(ServerName,_), 
		( to_write(ServerName)~>S, 
		  wlbxadd( (tell_dialog,4000), -1, S) )
	 ).

send_script :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_thickframe,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ss_center],
   _S3 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S4 = [ws_child,ws_visible,ws_tabstop,ws_border,lbs_sort,ws_vscroll,lbs_usetabstops],
   wdcreate(  send_script,        `Send Script`,              260, 138, 238, 137, _S1 ),
   wccreate( (send_script,10000), static,  `Select Agent :`,   10,  10,  90,  20, _S2 ),
   wccreate( (send_script,1000),  button,  `Send`,             30,  60,  60,  30, _S3 ),
   wccreate( (send_script,1001),  button,  `Cancel`,          130,  60,  60,  30, _S3 ),
   wccreate( (send_script,4000),  listbox, `List1`,           110,  10, 110,  20, _S4 ),
   forall( proweb_server(ServerName,_), 
		( to_write(ServerName)~>S, 
		  wlbxadd( (send_script,4000), -1, S) )
	 ).

login :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll,es_password],
   _S4 = [ws_child,ws_visible,ss_left],
   _S5 = [ws_child,ws_visible,ss_center],
   _S6 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   wdcreate(  login,        ` L O G I N `,       220,  41, 326, 195, _S1 ),
   wccreate( (login,8000),  edit,   ``,           90,  40, 210,  20, _S2 ),
   wccreate( (login,8001),  edit,   ``,           90,  80, 210,  20, _S3 ),
   wccreate( (login,10000), static, `User Name`,  10,  40,  70,  20, _S4 ),
   wccreate( (login,10001), static, `Password`,   10,  80,  70,  20, _S4 ),
   wccreate( (login,10002), static, `Login`,      10,  10, 300,  20, _S5 ),
   wccreate( (login,1000),  button, `Login`,      40, 120,  70,  30, _S6 ),
   wccreate( (login,1001),  button, `Exit`,      220, 120,  70,  30, _S6 ),
   wccreate( (login,1002),  button, `New User`,  130, 120,  70,  30, _S6 ).
newuser :- 
   _S1 = [dlg_ownedbydesktop,ws_sysmenu,ws_caption,ws_border,dlg_modalframe],
   _S2 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll,es_password],
   _S4 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S5 = [ws_child,ws_visible,ss_left],
   _S6 = [ws_child,ws_visible,ws_tabstop,ss_left],
   wdcreate(  newuser,        `PROFILE FORM`,              221,  41, 256, 325, _S1 ),
   wccreate( (newuser,8000),  edit,   ``,                   80,  20, 160,  20, _S2 ),
   wccreate( (newuser,8001),  edit,   ``,                   80,  50, 160,  20, _S2 ),
   wccreate( (newuser,8002),  edit,   ``,                   80,  80, 160,  20, _S3 ),
   wccreate( (newuser,8003),  edit,   ``,                   80, 110, 160,  20, _S3 ),
   wccreate( (newuser,8004),  edit,   ``,                   80, 150, 160,  20, _S2 ),
   wccreate( (newuser,8005),  edit,   ``,                   80, 180, 160,  20, _S2 ),
   wccreate( (newuser,8006),  edit,   ``,                   80, 210, 160,  20, _S2 ),
   wccreate( (newuser,1000),  button, `O K`,                30, 250,  70,  30, _S4 ),
   wccreate( (newuser,1002),  button, `CLEAR`,             150, 250,  70,  30, _S4 ),
   wccreate( (newuser,10000), static, `User Name`,          10,  20,  70,  20, _S5 ),
   wccreate( (newuser,10001), static, `e-mail`,             10,  50,  70,  20, _S5 ),
   wccreate( (newuser,10002), static, `Password`,           10,  80,  70,  20, _S5 ),
   wccreate( (newuser,10003), static, `Re-enter Password`,  10, 110,  70,  30, _S6 ),
   wccreate( (newuser,10004), static, `First Name`,         10, 150,  70,  20, _S5 ),
   wccreate( (newuser,10005), static, `Last Name`,          10, 180,  70,  20, _S5 ),
   wccreate( (newuser,10006), static, `Nick Name`,          10, 210,  70,  20, _S5 ).

prolog_browser :- 
	login,user_dialog,script_dialog,ask_dialog,tell_dialog,newuser,send_script,
	window_handler( login		,message_handler ),
	window_handler( user_dialog	,message_handler ),
	window_handler( script_dialog	,message_handler ),
	window_handler( ask_dialog	,message_handler ),
	window_handler( tell_dialog	,message_handler ),
	window_handler( newuser		,message_handler ),
	window_handler( send_script	,message_handler ),
	show_dialog(login).

message_handler(  user_dialog, msg_close, _, _) :- 
	wshow( user_dialog, 0 ),
	retractall( user_password( _, _) ),
	retractall( my_name(_) ),
	show_dialog(login),!.
message_handler(  Window, msg_close, _, _ ):- wshow( Window, 0 ),!.
message_handler( (Window,1001), msg_button, 0, _ ) :- wshow( Window, 0 ),!.

message_handler( Windows, Message, Data, Result) :- 
	handler( Windows, Message, Data, Result).

handler( (send_script,1000), msg_button, _, _ ) :-
	get_edit_box( (script_dialog,8000), Script ),
	not_empty(Script),
	get_selected_data_from_listbox((send_script,4000), String),
	wshow( send_script, 0 ),
	convert_str_to_atom(String, Agent),
	convert_str_to_atom(Script,  Atom),
	rewrite_edit_box( (user_dialog,8000), `Script running.~M~J` ),
	run_script( Agent, Atom, ErrorCode ),
	Window = (user_dialog,8000),
	( ErrorCode == 0 -> write_edit_box(Window,`~M~JRun script ready~M~J`);
	  ErrorCode == 1 -> write_edit_box(Window,`~M~JRun script fail~M~J`);
		write_edit_box(Window,`~M~JRun script error~M~J`) ).

handler( (newuser,1000), msg_button, _, _ ) :-
	get_edit_box( (newuser,8000),	Uname ),
	get_edit_box( (newuser,8001),	Email ),
	get_edit_box( (newuser,8002),	Pass1 ),
	get_edit_box( (newuser,8003),	Pass2 ),
	get_edit_box( (newuser,8004),	Fname ),
	get_edit_box( (newuser,8005),	Lname ),
	get_edit_box( (newuser,8006),	Nname ),
	nonvar(Uname), Uname \= ``,
	nonvar(Email), Email \= ``,
	nonvar(Pass1), Pass1 \= ``,
	nonvar(Pass2), Pass2 \= ``,!,
	( check_user_exist( Uname ) ->
		% This User had Exist
		message_box(ok, `This Username are already exist!!`,_),
		!,clear_new_user_form;
		( (Pass1 == Pass2, check_email_password(Email,Pass1)) ->
			!,
			new_user_profile(Uname,Email,Pass1,Fname,Lname,Nname),
			!,wshow(newuser,0),
			rewrite_edit_box((login,8000),Uname),
			rewrite_edit_box((login,8001),Pass1);
			message_box(ok, `Incorrect Password`,_)
		)
	).

handler( (newuser,1002), msg_button, _, _ ) :- clear_new_user_form.
clear_new_user_form :-
	clear_edit_box( (newuser,8000) ),
	clear_edit_box( (newuser,8001) ),
	clear_edit_box( (newuser,8002) ),
	clear_edit_box( (newuser,8003) ),
	clear_edit_box( (newuser,8004) ),
	clear_edit_box( (newuser,8005) ),
	clear_edit_box( (newuser,8006) ).

handler( (login,Id), Msg, Data, _ ) :-
	((Id == 1000, Msg == msg_button);
	 (Msg == msg_key, Data = (_,_,13))),
	wenable((login,1000), IsEnable),!, IsEnable == 1,
	wenable((login,1000), 0),
	get_edit_box((login,8000),Uname),
	get_edit_box((login,8001),Pass),
	( system_login( Uname, Pass ) ->
		clear_edit_box((user_dialog,8000)),
		clear_edit_box((user_dialog,8001)),
		clear_edit_box((user_dialog,8002)),
		wshow( login, 0 ), 		/* Close this windows*/
		show_dialog( user_dialog );	/* And open Browser */
		message_box(ok, `User ID does not exist Or Password Incorrect`,_)
	),!,
	wenable((login,1000), 1),
	clear_edit_box( (login,8001) ).

handler( (login,1002), msg_button, _, _ ) :-
	show_dialog(newuser).

handler( (user_dialog,1000), msg_button, _, _ ) :-
	Window = (user_dialog,8000),
	get_address(Host,URI),
	clear_edit_box(Window),
	write_edit_box(Window,`กำลังค้นหาคำตอบอยู่`),
	atom_string(Agent, Host),
	( convert_str_to_atom(URI,Query); atom_string(Query, URI) ),
	assert( data(demo(Agent, Query, Ans )) ),
	( demo(Agent, Query, Ans ) ->
	   rewrite_edit_box(Window,Ans);
	   clear_edit_box(Window),
	   write_edit_box(Window,`ไม่สามารถหาคำตอบได้`)
	),!.

handler( (user_dialog,1003), msg_button, _, _ ) :-
	Window = (user_dialog,8000),
	my_name(ID),
	user_email(ID,Address,Password),
	write(ID)~> Name,
	cat( [`กำลังตรวจสอบ e-mail ของ `, Name,`[`, Address, `]`, `กรุณารอ...~M~J` ], WaitMessage,_  ),
	rewrite_edit_box(Window,WaitMessage),
	email_check.
handler( (user_dialog,1002), msg_button, _, _ ) :-
	show_dialog(script_dialog).
handler( (script_dialog,1000), msg_button, _, _ ) :-
	get_edit_box( (script_dialog,8000) ,Data),
	not_empty(Data),
	Window = (user_dialog,8000),
	clear_edit_box(Window),
	convert_str_to_atom(Data,Atom),
	wshow( script_dialog, 0 ),
	rewrite_edit_box( Window, `Script running.~M~J` ),
	catch(ErrorCode, solve(Atom)),
	( ErrorCode == 0 -> write_edit_box(Window,`~M~JRun script ready~M~J`);
	  ErrorCode == 1 -> write_edit_box(Window,`~M~JRun script fail~M~J`);
		write_edit_box(Window,`~M~JRun script error~M~J`) ).

handler( (script_dialog,1002), msg_button, _, _ ) :-
	wshow( script_dialog, 0 ),
	show_dialog(ask_dialog).
handler( (script_dialog,1003), msg_button, _, _ ) :-
	wshow( script_dialog, 0 ),
	show_dialog(tell_dialog).
handler( (script_dialog,1004), msg_button, _, _ ) :-
	show_dialog(send_script).
handler( (ask_dialog,1000), msg_button, _, _ ) :- 
	get_edit_box( (ask_dialog,8000) ,Agent_s ),
	get_edit_box( (ask_dialog,8001) ,Question_s),
	atom_string( Agent, Agent_s ),
	convert_str_to_atom( Question_s, Question ),
	( write(`You Ask `),write(Agent),write(` that `),
	  write(Question),write(`.`) )~>Msg,
	show_answer(Msg),
	wshow( ask_dialog, 0 ),
	( ask(Agent, Question, Ans) ->
		convert_str_to_atom(Ans,ResultList),
		Window = (user_dialog,8000),
		write_edit_box(Window,`~M~JAsk Result ~M~J`),
		forall( member(A,ResultList),
			( write_edit_box(Window,`~I`),
			  write_edit_box(Window,A),
			  write_edit_box(Window,`~M~J`)
			) 
		);
		catch(Error, wait_for_mail),
		( Error == 0 ->
			retractall(wait_for_mail),
			show_error(`No Result now! You can wait your result later~M~J`);
			show_error(`No Result`)
		)
	).
handler( (tell_dialog,1000), msg_button, _, _ ) :-
	get_edit_box( (tell_dialog,8001), Data_s ),
	not_empty(Data_s),
	get_selected_data_from_listbox((tell_dialog,4000), String),
	convert_str_to_atom(String, Agent),
	wbtnsel((tell_dialog,2000),A),
	wbtnsel((tell_dialog,2001),B),
	( ( A == 1, B == 0) -> Flag = data, convert_str_to_atom(Data_s, Data);
	  ( A == 0, B == 1) -> Flag = file, atom_string( Data , Data_s  );
	  show_error(`You must select type!`),!,fail	  
	),

	( write(`Sending request: Tell `), write(Flag), write(` to `), write(Agent),
	  write(` that `), write(Data), write(`.`),nl )~>Send_data,
	show_answer(Send_data),
	wshow( tell_dialog, 0 ),
	assert( cmd(tell(Agent, Flag, Data)) ),
	( tell(Agent, Flag, Data)->
	  (write(`Sending `),write(Flag),write(` ok`))~>Message,
	  show_answer(Message);
	  show_error(`ไม่สามรถส่งข้อมูลได้`) ).
handler( (tell_dialog,1002), msg_button, _, _ ) :-
	get_edit_box( (tell_dialog,8001), Data_s ),
	not_empty(Data_s),
	get_selected_data_from_listbox((tell_dialog,4000), String),
	convert_str_to_atom(String, Agent),
	wbtnsel((tell_dialog,2000),A),
	wbtnsel((tell_dialog,2001),B),
	( ( A == 1, B == 0) -> Flag = predicate, convert_str_to_atom(Data_s, Data);
	  ( A == 0, B == 1) -> Flag = file,  Data = Data_s ;
	  show_error(`You must select type!`),!,fail	  
	),

	( write(`Sending request: Forget `), write(Flag), write(` to `), write(Agent),
	  write(` that `), write(Data), write(`.`),nl )~>Send_data,
	show_answer(Send_data),
	wshow( tell_dialog, 0 ),
	( forget(Agent, Flag, Data)->
	  (write(`Sending `),write(Flag),write(` ok`))~>Message,
	  show_answer(Message);
	  show_error(`ไม่สามรถส่งข้อมูลได้`) ).

get_selected_data_from_listbox(Window, String) :-
	find_selected_position(Window, 0, Point),
	wlbxget( Window, Point, String ).

find_selected_position(Window, Start, Point) :-
	wlbxsel( Window, Start, State ),
	( State == 1 ->
		Point = Start;
	  	Next is Start + 1,
		find_selected_position(Window, Next, Point)
	),!.
get_edit_box(Window,Data) :-
	wcount(Window,LastChar,_,_),
	wedtsel( Window,0,LastChar), 
	wedttxt( Window,Data).
get_address(Host,URI) :-
	get_edit_box((user_dialog,8001),Host),
	get_edit_box((user_dialog,8002),Temp ),
	( (Temp == ``; var(Temp)) -> URI = `/`; URI = Temp ).
clear_edit_box(Window) :-
	wcount(Window,LastChar,A,B),
	wedtsel( Window,0,LastChar),
	wedttxt( Window,``). % rewrite data with NULL
show_answer(Data) :-
	write(Data)~>String,
	rewrite_edit_box((user_dialog,8000),String).
show_error(Data) :-
	(nl,write(Data))~>String,
	write_edit_box((user_dialog,8000),String).
write_edit_box(Window,Data) :- write(Data)~>String, wedttxt( Window,String).
rewrite_edit_box(Window,String) :-
	clear_edit_box(Window),
	write_edit_box(Window,String).

system_login(Uname,Pass) :-
	nonvar(Uname),	Uname \= ``,
	nonvar(Pass),	Pass      \= ``, !,
	near_server(Agent),
	demo( Agent, user_profile(Uname,_,_,_,_), ProfileList ),!,
	demo( Agent, user_password(Uname,Pass), PassList ),!,
	len( ProfileList, 1 ),	len( PassList, 1 ),
	member(A, ProfileList),	member(B, PassList),
	( retract(A); true ),	assert(A),
	assert(B),
	retractall( my_name(_) ),
	assert( my_name(Uname) ),!.

new_user_profile(Uname,Email,Pass,Fname,Lname,Nname) :-
	near_server(Agent),!,
	run_script(Agent, add_user_profile(Uname,Email,Pass,Fname,Lname,Nname), ReturnCode ).
check_user_exist(Uname) :-
	near_server(Agent),
	demo(Agent, exist_user(Uname), AllUserList),!,
	len(AllUserList,1),!.

email_check :- 
	my_name(ID),
	user_email(ID,Address,Password),
	find_mail_server( Address, User, Server ),
	check_email(Server,User,Password),!.
find_mail_server( Address, User, Server ) :-
        find_word(Address,`@`,Point),
        string_cut(Address,Point,-1,Emailserver),
        Len is Point-1,
        string_cut(Address,0,Len,User),
        (Emailserver == `kmitl.ac.th`-> 
             Server = `mail.kmitl.ac.th`;
         Emailserver == `ce.kmitl.ac.th` ->
             Server = `diamond.ce.kmitl.ac.th`
        ).

check_email_password(Email,Pass) :- 
	find_mail_server( Email, User, Server ),
	mail_check( Server, _, User, Pass, _),!.
check_have_new_proweb_mail( Email,Pass ) :-
	find_mail_server( Email, User, Server ),
	del('mail.txt'),
	mail_get_if(Server,_,User,Pass,0,'mail.txt',(`Subject`,contains,any_of,[`Proweb Tell`]),_,Got),
	!, Got \= 0,
	del('mail.txt').
check_email(Server,Username,Pass) :-
	Window = (user_dialog,8000),
	MailFile = 'mail.txt',
	mail_check( Server, _, Username, Pass, NoOfMsgs),
	(NoOfMsgs == 0 ->
	  ( write_edit_box(Window,`ไม่มีข้อมูลใหม่`) );
          (mail_get_if(Server,_,Username,Pass,1,MailFile,(`Subject`,contains,any_of,[`Proweb Tell`]),Total,Got),
           (Got == 0 ->
		( write_edit_box(Window,`ไม่มีข้อมูลใหม่`) );
                (mail_parse_all(MailFile,Msgs,Parse),
                 del(MailFile),
		 ( write( ` There are `),
		   write( Got ),
		   write( ` new mail from proweb server. `)
		 ) ~> Message,
                 message_box(ok, Message, _ ), 
                 forall( member( (From,To,Cc,Bcc,Subj,Date,Header,Body,Attach) , Msgs ),
                         ( write_edit_box(Window,Subj),
			   write_edit_box(Window,`~IAnswer is~M~J`),
			   fcreate(Body,Body,0,0),
			   input(Body),
			   fread(s,0,0,ResultList_s),
			   convert_str_to_atom(ResultList_s,ResultList),
			   forall( member(A,ResultList),
			    ( write_edit_box(Window,`~I`),
			      write_edit_box(Window,A),
			      write_edit_box(Window,`~M~J`))
			   ),
			   write_edit_box(Window,`~M~J`),
			   fclose(Body)
                         )             
                       )   /*forall*/                 
                )   /*mail_parse_all*/   
           )   /*Got == 0*/    
          )  /*mail_get_if*/
     ).

find_serv_user_pass(Server,User,Password) :- 
	my_name(ID),
	user_email(ID,Address,Password),
	find_mail_server( Address, User, Server ).

:- prolog_browser.

