:- ensure_loaded(library('tcp/tcp')),ensure_loaded(library('tcp/http')), tcp_reset.
:- ensure_loaded( util ).

get_url( HostName, Path, Output ) :- get_url( HostName, Path, _, Output ).
get_url( HostName, Path, Port, Output ) :-
   nonvar(HostName),  
   (nonvar(Port); Port = 80),
   (nonvar(Path); Path = `/`),
   len(Path,Length),
   (Length == 0 -> P = `/` ; write(Path) ~> P ),
   http_get( P, _, Command),	/* Make PostMessage */
   write(HostName) ~> Host,
   tcp_reset,			/* Send RequestMessage */
   catch(Error, tcp_connect( address(Port,Host), ID )),!,
   Error == 0,
   tcp_send( ID, Command ),
   receive_url( ID ) ~> Output,
   !.

post_message( HostName, Path, InputFile, Output ):- post_message( HostName, Path, _, InputFile, Output).
post_message( HostName, Path, Port, InputFile, Output ):-
   nonvar(HostName),  
   (nonvar(Port); Port = 80),
   (nonvar(Path); Path = `\`),
   len(Path,Length),
   (Length == 0 -> P = `/` ; write(Path) ~> P ),
   file(InputFile,-1,Info),Info == 1,			/* check file exist */
   file(InputFile,4,DataLen),
   write_data_from_file(InputFile)~>DataMessage,	/* Read Message Data */
   http_post(P, DataMessage,`plain/text`,_,Command),	/* Make PostMessage */
   write(HostName) ~> Host,
   tcp_reset,!,						/* Send RequestMessage */
   catch(Error, tcp_connect( address(Port,Host), ID )),!,
   Error == 0,
   tcp_send( ID, Command ),!,
   receive_url( ID ) ~> Output,
   !.

receive_url( ID ):-
   repeat,
   ( tcp_select( term(ID,Data) ) -> 
	write( Data ),
      	fail
     ; tcp_select( end_of_file( ID ) ) 
   ), !.
set_time_out(Ms) :-
	time(0,ThisTime), (_,Now) = ThisTime,
	retractall( time_out( _ ) ),
	TimeOut is Now + Ms,
	assert( time_out(TimeOut) ),!.
time_out :-
	time_out(Time),!,
	time( 0,ThisTime),(_,Time2) = ThisTime,
	Time2 > Time.
no_time_out :- retractall( timeout_set(_) ).
have_time_out :- retract( timeout_set(Time) ) ->  have_time_out(Time); have_time_out(2000).
have_time_out(Time) :- no_time_out,  asserta( timeout_set(Time) ).
delay(Time) :-
	set_time_out(Time),
	repeat,
	time_out,!.
parse_header(ResponseMessage, String) :- parse_header(ResponseMessage)~>String.
parse_header(ResponseMessage) :-
	input(Was),
	input( (ResponseMessage,0) ),
	( eof ->  input(Was), fail; true ),
	readln(Respone_header),
	( find_word(Respone_header,`200`,_) ;
	  ( input(Was), fail)
	),
	( eof -> true;
	  repeat,
	  readln(S),
	  (S == `~M~J`; eof),
	  ( eof -> true;
	    repeat,
	    fread(s,1,0,String),
	    ( String == `~J` -> write( `~M~J` );
	      String == `~M` -> true;
	      write(String) ),
	    eof
	  )
	),
	input(Was),!.

readln(String) :- fread(s,0,0,String).

:- have_time_out.
