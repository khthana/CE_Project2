:- ensure_loaded( conf ).
:- ensure_loaded( http_util ).

demo(Agent, Query, Ans ):-
	( proweb_server(Agent,AgentIP) ->
		( ask( AgentIP, Query,  AnsList, 0) ->
			convert_str_to_atom(AnsList,Ans);
			get_url( AgentIP, Query, Response ),
			parse_header(Response,Ans)
		);
		( have_time_out,
		  get_url( Agent, Query, Response ),
		  parse_header(Response,Ans)
		)
	),!.
forget( Agent, Type, FileKnowlage) :- 
/* Type == file -> Remove All Predicate that had been assert previous in This file
   Type == predicate -> Remove that Predicate  */
	( proweb_server(Agent,AgentIP) ->
		(  Type == file ->
			run_script( Agent, retract_knowlage(_,FileKnowlage),_ );
		   Type == predicate ->
			run_script( Agent, retract_knowlage(FileKnowlage,_),_ )
		);
		!,fail
	),!.

run_script( Agent, Data, ErrorCode ) :-
	( my_name(_) -> true; assert(my_name(nobody)) ),
	(atom(Data); compound(Data)),!,
	to_write(Data) ~>SendData,
	say_hello(Agent,Msg1),
	my_name(Me),
	speak1( Agent, Msg1,	       Me, Msg2 ),
	speak1( Agent, Msg2, `run script`, Msg3 ),
	speak1( Agent, Msg3, 	 SendData, Msg4 ),
	input(Was),
	input( (Msg4,0) ),
	repeat,
	( eof -> true;
		readln(String),
		( find_word(String,`Run script ready`,_) -> ErrorCode=  0;
		  find_word(String, `Run script fail`,_) -> ErrorCode= -1;
		  find_word(String,`Run script Error`,_) -> ErrorCode=  1;
		  fail
		)
	),nonvar(ErrorCode), !.	

tell(Agent, FileKnowlage) :-
	( (file(FileKnowlage),	file(FileKnowlage, -1, Info), Info == 1)->
		Method = file;
		Method = data
	),	  
	( proweb_server(Agent,AgentIP) ->
		tell(AgentIP, Method, FileKnowlage);
		!,fail
	),!.

tell(Agent, Flag, Knowlage) :- tell(Agent, Flag, Knowlage, _).
tell(Agent, Flag, Knowlage, MakeNewConnect) :-
	( my_name(_) -> true; assert(my_name(nobody)) ),
	(atom(Knowlage); compound(Knowlage)),!,
	to_write(Knowlage) ~>What,
	( Flag == file -> 
		send_file(Agent,Knowlage,HostPath), 
		Method = `send file`,
		write(Knowlage)~>Knowlage_s,
		cat( [HostPath,`[`,Knowlage_s,`]`],DataSend,_); 
		Flag == data, 
		Method = `tell by URL`,
		DataSend = What
	),
	(MakeNewConnect = 1 ; true), /* Set Default Value */
	( MakeNewConnect == 1 ->
		say_hello(Agent,Msg1),
		my_name(Me),
		speak1( Agent, _,	 Me, Msg2 ),
		speak1( Agent, _, `tell`, Msg3);
		true
	),
	speak1( Agent, _,   Method, Msg4),
	speak1( Agent, _, DataSend, _),!.

ask(Agent, Question, AnsList) :- 	/* Set Default Ask Argument */
	ask(Agent, Question, AnsList, _, _, _).
ask(Agent, Question, AnsList, AskOther) :- 
	ask(Agent, Question, AnsList, _, _, AskOther).
ask(Agent, Question, AnsList, DoesIknow, AskOther) :- 
	ask(Agent, Question, AnsList, _, DoesIknow, AskOther).

ask(Agent, Question, AnsList, MakeNewConnect, DoesIknow, AskOther) :-
	( my_name(_) -> true; assert(my_name(nobody)) ),
	(atom(Question); compound(Question)),!,
	to_write(Question) ~>What,
	(MakeNewConnect = 1 ; true), /* Set Default Value */
	(DoesIknow	= 0 ; true),
	(AskOther	= 1 ; true),
	( MakeNewConnect == 1 ->
		say_hello(Agent,Msg1),
		my_name(Me),
		speak1( Agent, _,	Me, Msg2 ),
		speak1( Agent, _, `ask`, Msg3);
		true
	),
	speak1( Agent, _, What, Msg4),
	!,
	( get_all_ans(Msg4,AnsList) ->
		true;
		( AskOther == 1 ->
			!,speak1( Agent, _, `Tell another Proweb Server`, Msg5),
			( get_all_ans(Msg5,AnsList) ->
				true;
				( DoesIknow == 1 ->
					speak1( Agent, _, `Tell`, Msg6),
					get_secreat_answer(Type,Secreat_answer),
					tell(Agent, Type, Secret_answer, 0);
					speak1( Agent, _, `Client doesn't know the solution`, _),
					assert( wait_for_mail ),
					!,fail
				)
			);
		  DoesIknow == 1 ->
			speak1( Agent, _, `Client tell Proweb Server`, Msg5),
			get_secreat_answer(Type,Secreat_answer),
			tell(Agent, Type, Secreat_answer, 0);
		  	!,fail
		)
	),!.
say_hello(Agent,Respond ) :-
	proweb_dir(Agent,Dir),
	( write(Dir),write(`\proweb.exe?lpa=examples`) )~>Hello,
	demo(Agent,Hello,Respond),!,
	get_page_id( UCO, Page)<~Respond,
	retractall( last_connection( Agent, _, _) ),
	assert( last_connection( Agent, UCO, `[0]`) ).
	

speak1(Agent,Last_Msg,DataSend, New_Msg) :-
	( nonvar(Last_Msg) ->
		get_page_id(UCO,Page) <~ Last_Msg;
		last_connection( Agent, UCO, LastPage),
		find_word(LastPage,`]`,Point1),
		Len is Point1 - 2,
		string_cut(LastPage, 1, Len, LastPage_s ),
		number_string( LastPageNum, LastPage_s ),
		PageNum is LastPageNum + 1,
		(write(`[`),write(PageNum),write(`]`))~>Page
	),
	proweb_dir(Agent,Dir),
	http_encode_form_data([(proweb_data_uco,UCO),(proweb_data_page,Page),
				(`Q0001`,DataSend)],Temp),
	( write(Dir),write(`\proweb.exe?`),write(Temp) )~>Send,
	demo(Agent,Send,New_Msg),!,
	retractall( last_connection( Agent, _, _) ),
	assert( last_connection( Agent, UCO, Page) ).

get_all_ans(Text,Ans) :-
	input(Was),
	input( (Text,0) ),
	( repeat,
	  ( eof -> true;
	    readln(String),
	    ( find_word(String,`The answer is `,Point1) ->
		/* I already get answer */
		get_all_ans(String)~>Ans
	     ;find_word(String,`can not find the solution`,_)->
		!,input(Was), fail
	     ;fail
	    )
	  )
	), !,
	input(Was),
	nonvar(Ans).
get_all_ans(FirstData) :-
	find_word(FirstData,`The answer is `,Point1),
	len(`The answer is `,Len),
	StartPoint is Point1 + Len - 1,
	string_cut(FirstData,StartPoint, -1, Str),
	write(Str),
	len(Str, A),
	B is A -1,
	string_cut(Str,B,1,Out),
	( Out == `.` -> true;
	    repeat,
	    readln(String),
	    string_cut(String, 0, -1, Str2),
	    write(Str2),
	    
            len(Str2, C),
	    D is C -1,
	    string_cut(Str2, D, 1,End),
	    End == `.`
	),!.	    
		

get_page_id(UCO,Page) :-
	( repeat,
	  ( eof -> !,fail; true ),
	  readln(String),
	  get_page_id2(String,`"proweb_data_uco"`,UCO) ), !,
	( repeat,
	  ( eof -> !,fail; true ),
	  readln(String2),
	  get_page_id2(String2,`"proweb_data_page"`,Page) ),!,
	!,nonvar(UCO),nonvar(Page).
get_page_id2(String,Word,Out) :-
	retractall( temp(get_page_id,_) ),
	find_word(String,Word,Point1),
	len(Word,Len1),
	Point2 is Point1 + Len1,
	forall( find_word(String,`"`,Point),
		( Point > Point2 -> assertz(temp(get_page_id,Point)) ;true ) ),
	retract( temp(get_page_id,Point3) ),
	retract( temp(get_page_id,Point4) ),
	Len2 is Point4 - Point3 - 1,
	string_cut(String,Point3,Len2,Out).

send_file(Who,MyPath,HostPath) :-
	receive_path( Who, Path),
	proweb_server(Who,AgentIP),
	post_message( AgentIP, Path, MyPath, Response ),
	parse_header(Response,Buffer),
	input(Was), 
	input( (Buffer,0) ),
	repeat,
	(eof -> !,input(Was),fail;true),
	readln(String),
	find_word(String,`Filename=`,Point),
	len(`Filename=`,Len),
	StartPoint is Point + Len - 1,
	string_cut(String,StartPoint,-1,HostPath),
	input(Was),!.
