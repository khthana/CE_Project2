:- multifile( proweb_page     / 2 ).
:- multifile( proweb_form     / 2 ).
:- multifile( proweb_question / 2 ).
:- ensure_loaded( examples(sendmail) ).
:- ensure_loaded( examples(util) ).
:- ensure_loaded( examples(conf) ).
:- ensure_loaded( examples(http_util) ).
:- ensure_loaded( examples(proweb_interface) ).
:- dynamic( ask_other_server_debug/1 ).

main_goal :- 
	proweb_send_form( user_form ),
	proweb_returned_answer(userdata, Userdata ),  
	proweb_post_reply(userdata, Userdata ),
	proweb_send_form( select_form(select1) ),
	proweb_returned_answer( select1, Select1 ),
	( Select1 == 'tell' -> 
		( proweb_send_form(select_form(select2)),
		  proweb_returned_answer( select2, Select2 ),
		  function_tell(Select2)
		);  /* End Select1 == 'tell'*/
	  Select1 == 'ask' ->
		( proweb_send_form(ask_form),
		  proweb_returned_answer(askdata, Askdata ),  
		  proweb_post_reply(askdata, Askdata ), 
		  convert_str_to_atom(Askdata,Atom2),
		  ( ( findAns( Atom2, Answer2 ),len(Answer2,Len2),Len2 \=0 ) ->
			( to_write(Answer2)~>Temp_Answer2,
			  proweb_post_reply( solution, Temp_Answer2),
			  proweb_send_form( ans_ask_form )
			);
			( proweb_send_form( select3_form ),
			  proweb_returned_answer( select3, Select3 ),
			  ( Select3 = 'Client tell Proweb Server' -> 
				( proweb_send_form(select_form(select2)),
				  proweb_returned_answer( select2, Select5 ),
				  function_tell(Select5)
				);
				( /*'Tell another Proweb Server'*/
				  ( ( proweb_data_uco(MyUCO), ask_other_server_debug( MyUCO) ) ->
					AllResultList = [];
					ask_other_server( Askdata,  AllResultList ) 
				  ),
				  len( AllResultList, Len3 ),
				  ( Len3 \= 0  -> 
					( to_write( AllResultList )~> AllResultList_s,
					  proweb_post_reply( solution, AllResultList_s),
					  proweb_send_form( ans_ask_form ) );
					proweb_data_uco( MyUCO ),
					assert( ask_other_server_debug( MyUCO ) ),
					proweb_send_form(know_unknow_form),
					proweb_returned_answer( select4, Select4 ),
					retractall( ask_other_server_debug( MyUCO ) ),
					( Select4 = 'Tell' -> 
						( proweb_send_form(select_form(select2)),
						  proweb_returned_answer( select2, Select6 ),
						  function_tell(Select6)
						);
						( convert_str_to_atom(Askdata,Atom5),
						  proweb_posted_reply(userdata, Userdata ),
						  catch(Error1, mail(Atom5, Userdata)),
						  ( Error1 == 0 -> 
							proweb_send_form(ans_unknow_form);
							( (user_email(Userdata,Mail,_), nonvar(Mail)) ->
								asserta(mail(Atom5, Userdata));  
								true 
							),
						        proweb_send_form(ans_unknow_form)
						  ) /*Error1 == 0*/
						)
					) /*Select4 = 'Tell'*/
				  )  /*Len3 \= 0*/
				) /*'Tell another Proweb Server' */
			  ) /* Select3 = 'Client tell Proweb Server' */
			)
		  ) /* ( findAns( Atom2, Answer2 ) */
		); /* End Select1 == 'ask'*/
	  Select1 = 'run script' ->
	      ( proweb_send_form( script_form ),
		proweb_returned_answer(scriptdata, Scriptdata ),  
		proweb_post_reply(scriptdata, Scriptdata ),
		convert_str_to_atom(Scriptdata,Atom3),
		catch( Error, solve(Atom3) ),
		( Error == 0  -> Respond = `Run script ready`;
		  Error == -1 -> Respond = `Run script fail` ; 
				 Respond = `Run script Error`
		),
		proweb_send_form( ans_script_form(Respond) ) 
	      )  /* End Select1 = 'run script'*/
	).

proweb_page( _,
        [ include('html/project/head.htm'),
          'Project',
          include('html/project/body.htm'),
          proweb(select_form),
          include('html/project/foot.htm')
        ] ).

proweb_form( user_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr, /table,
              p, /p,
               table('WIDTH=90%',align='center'), tr(align='center'), td,
              unencoded @ 'User Name',  
              /td, /tr,
              tr(align='center'), td,
              ?userdata,
               /td, /tr, /table,          
               table('WIDTH=50%',align='center'), tr, td('WIDTH=50%',align='center'),
               input(type=submit, value=`OK`),
               /td, 
              td('WIDTH=50%',align='center'),
               input(type=reset),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( script_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr, /table,
              p, /p,
               table('WIDTH=90%',align='center'), tr(align='center'), td,
              unencoded @ 'Run Script ',  
              /td, /tr,
              tr(align='center'), td,
              ?scriptdata,
               /td, /tr, /table,          
               table('WIDTH=50%',align='center'), tr, td('WIDTH=50%',align='center'),
               input(type=submit, value=`OK`),
               /td, 
              td('WIDTH=50%',align='center'),
               input(type=reset),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( ans_script_form(R),
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
              p,  /p,
               table('WIDTH=100%'), tr, td(align='center'), 
               R,
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
              h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( select_form(S),
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr, /table,
              p, /p,
              table('WIDTH=50%',align='center'), tr, td(align='center'),
             ?S,
              /td, /tr,
             tr, td(align='center'),
              input(type=submit, value=`OK`),
              /td, /tr, /table,     
              p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
              h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( tell_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr, /table,
              p, /p,
              table('WIDTH=90%',align='center'), tr(align='center'), td,
              unencoded @ 'Tell',  
              /td, /tr,
              tr(align='center'), td,
              ?telldata,
               /td, /tr, /table,          
               table('WIDTH=100%',align='center'), tr, td('WIDTH=50%',align='center'),
               input(type=submit, value=`OK`),
               /td, 
              td('WIDTH=50%',align='center'),
               input(type=reset),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( sendfile_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr, /table,
              p, /p,
              table('WIDTH=90%',align='center'), tr(align='center'), td,
              unencoded @ 'Type file name',  
              /td, /tr,
              tr(align='center'), td,
              ?filename,
               /td, /tr, /table,          
               table('WIDTH=100%',align='center'), tr, td('WIDTH=50%',align='center'),
               input(type=submit, value=`OK`),
               /td, 
             td('WIDTH=50%',align='center'),
               input(type=reset),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( ask_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
              p, /p,
              table('WIDTH=90%',align='center'), tr(align='center'), td,
               unencoded @ 'Ask', 
              /td, /tr,
               tr(align='center'), td,
               ?askdata,
                /td, /tr, /table,          
               table('WIDTH=100%',align='center'), tr, td('WIDTH=50%',align='center'),
               input(type=submit, value=`OK`),
                /td,
                td('WIDTH=50%',align='center'),
                input(type=reset),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr,  /table ] ).

proweb_form( select3_form,
            [ p, /p,
             table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
               p, /p,
               table('WIDTH=100%'), tr, td(align='center'), 
               'Server can not find the solution for you.  ',
               /td, /tr, tr, td(align='center'),
               'What do you want to Proweb Server do? ',   
                /td, /tr, /table,
               p, /p,
               table('WIDTH=50%',align='center'), tr, td(align='center'),
              ?select3,
               /td, /tr,
              tr, td(align='center'),
               input(type=submit, value=`OK`),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( know_unknow_form,
            [ p, /p,
             table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
               p, /p,
               table('WIDTH=100%'), tr, td(align='center'), 
               ' All proweb server don''t know the solution. ',
               /td, /tr, tr, td(align='center'),
               ' Do you know the solution?  ',
               /td, /tr, tr, td(align='center'),
               ' If you know the solution, please tell me. ',   
                /td, /tr, /table,
               p, /p,
               table('WIDTH=50%',align='center'), tr, td(align='center'),
              ?select4,
               /td, /tr,
              tr, td(align='center'),
               input(type=submit, value=`OK`),
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( ans_tell_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
              p,  /p,
               table('WIDTH=100%'), tr, td(align='center'), 
               'You are tell me that  ',
               ??telldata,
               ' .',   
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
              h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( ans_sendfile_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
              p,  /p,
               table('WIDTH=100%'), tr, td(align='center'), 
               'You send file ',
               ??filename,
               ' to me.',   
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
              h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( ans_ask_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
               p, /p,
               table('WIDTH=100%'), tr, td(align='center'),
               'You are ask me that  ',
               ??askdata,
               ' .',   
                /td, /tr,
               tr, td(align='center'),
              'The answer is ',
                ??solution,
                ' .',
                /td, /tr,/table,
                p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td,  /tr,
              tr(align='center'), td,
             h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_form( ans_unknow_form,
            [ p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Web based Multi-agent Communication', 
              /td, /tr,
              tr(align='center'), td,
              h2 @ unencoded @ 'การติดต่อสื่อสารของเอเจนต์หลายตัวบนอินเตอร์เน็ต',  
              /td, /tr,  /table,
              p,  /p,
               table('WIDTH=100%'), tr, td(align='center'), 
               ' When I know the solution. I will send the solution to your e-mail. ',
                /td, /tr, /table,
               p, /p,
              table(border='0', 'width=100%'), tr(align='center'), td,
              h2 @ 'Department of Computer Engineering',
              /td, /tr,
              tr(align='center'), td,
              h2 @ 'King Mongkut''s Institute of Technology Ladkrabang',               
              /td, /tr, /table ] ).

proweb_question( userdata,
                 [ method    = input,
                   type         = string,
                   rows         = 1,
                  cols           = 50,
                  maxlength = 175
                 ] ).

proweb_question( scriptdata,
                 [ method    = input,
                   type         = string,
                   rows        = 1,
                  cols          = 100,
                  maxlength = 175
                 ] ).

proweb_question( select1,
                 [ method  = menubox,
                    select    = ['tell','ask','run script'],
                   prefill    = 'tell',
                    rows      = 3
                 ] ).

proweb_question( select2,
                 [ method  = menubox,
                    select    = ['tell by URL','send file'],
                    prefill    = 'tell by URL',
                    rows      = 2
                 ] ).

proweb_question( select3,
                 [ method  = menubox,
                    select    = ['Tell another Proweb Server','Client tell Proweb Server'],
                    prefill    = 'Tell another Proweb Server',
                    rows      = 2
                 ] ).

proweb_question( select4,
                 [ method  = menubox,
                    select    = ['Tell','Client doesn''t know the solution'],
                    prefill    = 'Tell',
                    rows      = 2
                 ] ).

proweb_question( telldata,
                 [ method    = input,
                   type         = string,
                   rows         = 1,
                  cols           = 100,
                  maxlength = 175    
                 ] ).

proweb_question( askdata,
                 [ method    = input,
                   type         = string,
                   rows        = 1,
                  cols          = 100,
                  maxlength = 175
                 ] ).

proweb_question( filename,
                 [ method  = input,
                   type        = string,
                   rows       = 1,
                  cols         = 50,    
                  maxlength = 175
                 ] ).

add_knowlage(File,Realname) :-
	retract_knowlage( _, Realname),
	fcreate(File,File,0,0),
	input(In), input(File),
	repeat,
	read(Knowlage),
	( Knowlage == end_of_file -> 
		 true;
		 real_assert_knowlage(Knowlage,Realname),
		 fail
	),
	input(In),
	fclose(File),
	forall(	retract( ':-'(A) ) , call(A) ) ,!.

retract_knowlage( Knowlage, Name) :-
	( nonvar(Name) ->
		( string(Name) ->
		  ( find_word( Name, `\`,Point3) ->
		  	string_cut(Name, Point3, -1 , Temp2 );
			Temp2 = Name
		  ),
		  ( find_word( Temp2, `.`,Point4) ->
			LenRealName is Point4 - 1,
		  	string_cut(Temp2, 0, LenRealName, Filename_s );
			Filename_s = Temp2
		  ); Filename_s = Name
		),
		( (Filename_s=='*';Filename_s==`*`) -> 
			var( Filename );
			( atom(Filename_s) -> Filename= Filename_s; atom_string(Filename, Filename_s ) )
		);
		Filename = `nofile`
	),
	proweb_posted_reply(userdata, Userdata ),
	findAns( data(Knowlage, Userdata, Filename) , DataList1 ),
	( forall( member( A, DataList1 ),
		  ( data(Knowlage, Userdata, Filename) = A,
		    findAns( data(Knowlage, _, _) , DataList2 ),!,
		    ( (len(DataList2, Len2), Len2 == 1) ->
			retract(Knowlage); true ),
		    retract(A) 
		  )
	        );true
	),!.
retract_knowlage(Knowlage,Name) :- !.

assert_knowlage(Knowlage,Filename) :-
	retract_knowlage(Knowlage,`nofile`),
	real_assert_knowlage(Knowlage,`nofile`).
real_assert_knowlage(Knowlage,Filename) :-
	nonvar( Knowlage ),
	proweb_posted_reply(userdata, Userdata ),
	assert( data(Knowlage, Userdata,Filename)),
	((findAns( Knowlage, AnsList ),AnsList \= []) -> true;
		( ( functor(Knowlage,':-',2) -> 
			( ( retract(Knowlage) ; true),
			    assert( Knowlage )  );
			assert( Knowlage )
	          ),
		  ( check_sendmail ; true)
		)  
 	), !.
check_sendmail :- 
	findAns( mail(_, _) , MailList ),
	MailList \= [],
	forall( member( mail(Question, Uname), MailList ),
		( findAns( Question, AnsList ), len(AnsList, Len), Len \=0 -> 
			retract( mail(Question, Uname) ),
			write_to_file(AnsList, 'Message.txt'),
			(print(`Proweb Tell `),to_write(Question) )~>Subject,
			user_email( Uname, Address, _ ),
			( var( Address ) -> 
				true; 
				send_mail(`bundit.graduate.kmitl.ac.th`,`s1014398@ce.kmitl.ac.th`,
					   [Address],_,_, Subject ,'Message.txt',_ )
			)
			; true
	  	)
	).

findAns( Goal, AnsList ) :- 
	repeat, 
	catch( Error, Goal ),
	( Error > 0 -> print('~M~JPredicate Not Defined.~M~J'),!,fail;true),
	( Error == 0 ->
		assert( temp_answer(Goal) ),
		fail;
	  Error == -1 ->
		datatolist( temp_answer,AnsList)
	),!.
datatolist(A,Out) :- retract(A(B)) -> 	Out=[B|Tail],	datatolist(A,Tail);	Out=[].

function_tell(Choice) :-        
	(Choice = 'tell by URL' -> 
		( proweb_send_form(tell_form),
		  proweb_returned_answer(telldata, Telldata ),  
		  proweb_post_reply(telldata, Telldata ),
		  convert_str_to_atom(Telldata,Atom1),
		  assert_knowlage(Atom1,_),
		  proweb_send_form( ans_tell_form ) );
		( proweb_send_form(sendfile_form),
		  proweb_returned_answer(filename, FullFilename ),  
		  proweb_post_reply(filename, FullFilename ),
		  find_word(FullFilename,`[`,Point1),
		  find_word(FullFilename,`]`,Point2),
		  LenFilename is Point1 - 1,
		  LenTemp1 is Point2 - Point1 - 1,
		  string_cut(FullFilename, 0,LenFilename, FileName_s ),
		  string_cut(FullFilename, Point1,LenTemp1, Temp1 ),
		  ( find_word( Temp1, `\`,Point3) ->
		  	string_cut(Temp1, Point3, -1 , Temp2 );
			Temp2 = Temp1
		  ),
		  ( find_word( Temp2, `.`,Point4) ->
			LenRealName is Point4 - 1,
		  	string_cut(Temp2, 0, LenRealName, RealName_s );
			RealName_s = Temp2
		  ),	
		  atom_string(RealName,RealName_s),	  
		  atom_string(FileName,FileName_s),	  
		  add_knowlage(FileName,RealName),
		  proweb_send_form( ans_sendfile_form ) )
          ). /* Choice = 'tell by URL' */

ask_other_server( Askdata, AllResultList ) :-
	retractall( agent_data_reply( _, _, _ ) ),
	convert_str_to_atom(Askdata, Query),
	forall( near_server(Agent),
		( ask(Agent, Query, ResultList_s, 1, 0, 0) ->
		  convert_str_to_atom(ResultList_s,ResultList),
		  assert( agent_data_reply( Agent, Askdata, ResultList ));true ) ),
	get_ask_other_server_result( Askdata, AllResultList ).

get_ask_other_server_result( Askdata, AllResultList  ) :-
	retract(  agent_data_reply( _, Askdata, ResultList )  ),!,
	get_ask_other_server_result( Askdata, OtherResultList ),
	append(  ResultList, OtherResultList, AllResultList ).
get_ask_other_server_result( _, [] ) :- !.

add_user_profile(Uname,Email,Pass,Fname,Lname,Nname) :- 
	nonvar( Uname ),
	( user_profile(Uname, _, _, _, _ ) ->
		!,fail;			/* Error, This User is Already Exist */
		( ( ask_other_server( user_profile(Uname, _, _, _, _ ), UList ),
		    len(UList,Len),Len \=0 ) ->
			!,fail;		/* Error, This User is Already Exist */
			!,absolute_file_name( 'user_profile.pl'  , AbsFileName ),
			( nl, to_write( user_profile(Uname,Email,Fname,Lname,Nname) ), write(`.~M~J`)) ~> 'user_profile.pl',
			( to_write( user_password(Uname,Pass) ), write(`.~M~J`), nl) ~> 'user_profile.pl',
			fclose(AbsFileName),
			ensure_loaded( user_profile )
		)
	),!.

make_all_user_list :-
	ask_other_server( user_profile(_,_,_,_,_), List ),
	retractall( other_server_user_email( _, _ ) ),
	forall( member( user_profile(Uname,Email,_,_,_), List ),
	assert( other_server_user_email( Uname, Email ) ) ),!.
