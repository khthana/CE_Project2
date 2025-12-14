%define( server ).				/* Change Here for Select Browser or Server */
define( browser ).

:- dynamic( [my_name/1] ).

:- define( server ), assert( my_name(Name) ).	/* Set Server Name */

:- define( server ), ensure_loaded( user_profile ).

/* All Server In System */

proweb_server(big,'161.246.5.120').
proweb_server(neung,'161.246.5.103').

proweb_server( ID, IP ) :-
	nonvar(ID),!,
	proweb_server( _, ID ),
	IP =ID.
proweb_dir( Agent, '\proweb').			/* Default proweb directory */

receive_path( Agent, '\cgi-bin\receive.cgi').	/* Default CGI for Send File */

/* Other predicate */
near_server( AgentName ) :-
	proweb_server(AgentName,Agent),
	not my_name(AgentName).

user_email( Uname, Email, Pass ) :-		/* Get UserName of Current User */
	(my_name(Uname); true),			/* Or Specific User 		*/
	( user_profile( Uname, Email, _, _, _) -> 	/* Get Email of that User 	*/
	    (user_password( Uname, Pass ); true); /* If program in server then cann't get password */
	    define(server), other_server_user_email( Uname, Email )
	),!.
exist_user(Uname) :- user_profile( Uname, _, _, _, _).
