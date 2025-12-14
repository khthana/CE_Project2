xml_parser( FileXML, Output_s ) :-
	fcreate( file, FileXML,0,0),
	input(Was), 	input(file),
	( xml_parser ~> Output_s ->
		input(Was),
		fclose( file );
		input(Was),
		fclose( file ),
		!,fail ),
	!.
xml_parser :- 
	retractall( have_top_level ),
	repeat,
	( eof -> true;
		fread( s, 1, 0, Char ),
		( is_white_space( Char ) -> true;
		  Char == `<` ->
			( not eof ->
				( (xml_parse_tag(TagType)~>Data) ->
					( TagType==0 ->
						( retract( have_top_level ) ->
						    !,fail;
						    write(Data),
						    assert( have_top_level ));
						true
					);
					!,fail	);
				!,fail
			);
			!,fail
		),
		fail
	).

xml_parse_tag(2) :- xml_parse_comment,!.
xml_parse_tag(1) :- xml_parse_header,!.
xml_parse_tag(0) :-
	write(`'`),
	xml_parse_tag_name~>Name,	% find tag name and write it
	write(Name), 
	write(`'([`),
	xml_parse_tag_all_arg(End),	% find all Arg and write it into List format
	write(`],[`),
	( End == 1 -> true;
	  xml_parse_tag_all_body(Name)	% find all Data and write it into List format
	  ~>Body,
	  ( Body == [] ->
		true;
	  	( string_chars(Body,[44|Chars]) ->	% Ascii( `,`  ) == 44
	  		string_chars(Body2,Chars),
			write(Body2);
			write(Body)
		)
	  )
	),write(`])`),!.

xml_parse_name(FollowSetList) :-
	remove_white_space,
	write(``),
	one((repeat,
		( not eof -> 
			inpos(Inpos),
			fread( s, 1, 0, Char ),
			( is_tag_name_char(Char) -> write(Char),fail; inpos(Inpos))
		); !,fail )),
	!,(is_white_space( Char );member(Char,FollowSetList)).

xml_parse_tag_name :- xml_parse_name( [`>`,`/`] ),!.

xml_parse_tag_all_arg(EndBody) :-
	remove_white_space,
	inpos(Inpos),
	(not eof -> fread( s, 1, 0, Char ),
		    ( Char == `>` -> !, EndBody = 0;
		      Char == `/` -> (not eof -> fread( s, 1, 0, Char2 )),
				     Char2 == `>`, !,EndBody = 1;
			inpos(Inpos),
			one((repeat,
				( xml_parse_tag_arg( End ) -> write(``); !,fail ),
				( End == 0  -> write(`,`),fail;
				  End == -1 -> EndBody = 0;
				  End == 1  -> EndBody = 1)
			))
		    )),!.

xml_parse_tag_arg(EndTag) :-
	write(`'`),xml_parse_name([`=`]),
	write(`'(`),write('`'),
	remove_white_space,
	(not eof -> fread( s, 1, 0, Char1 ), Char1 == `=`),
	remove_white_space,
	(not eof -> fread( s, 1, 0, Char2 ), Char2 == `"`),
	one((repeat,
		( not eof ->
		  	fread( s, 1, 0, Char ),
			( Char == `"` -> true; write(Char),fail );
	  		true
		)
	)),
	write('`'),write(`)`),!,
	inpos(Inpos),
	(not eof -> fread( s, 1, 0, Char3 ),	% Check follow char of This Arg
		    ( 	is_white_space(Char3);	% if follow char is not in
		     	Char3 == `/`;		% Arg follow set then fail
			Char3 == `>`) 
		    ),
	inpos(Inpos),
	remove_white_space,
	inpos(Inpos2),
	(not eof -> fread( s, 1, 0, Char4 ),	% Is finish parse Arg
		    ( Char4 == `/` -> 
			(not eof -> fread( s, 1, 0, Char5 )),
			Char5 == `>`,
			EndTag =  1;
		      Char4 == `>` -> 
			EndTag = -1;
			inpos(Inpos2),
			EndTag =  0)
		    ),!.
xml_parse_tag_all_body(Name) :-
	repeat,
	( (xml_parse_tag_body( Name, End )~>S) -> write(S); !,fail ),
	( End == 0 -> fail; true ),!.


xml_parse_tag_body( Name, End ) :-
	inpos(Inpos),			% peek next charactor for do next step
	(not eof -> fread( s, 1, 0, Char1 ),
%		    inpos(Inpos3),
		    ( Char1 == `<` -> Operation = tag; Operation = text )
	),
	inpos(Inpos),
	( Operation == text ->
		write(',text(`'),
		one((repeat,
			inpos(Inpos2),
			(not eof -> 
				fread( s, 1, 0, Char ),
				(Char == `<` -> inpos(Inpos2); write(Char),fail )
			);true
		)),
		!,Char == `<`,
		write('`)');
	  Operation == tag ->
		(not eof ->		% Does this tag be ending tag?
			fread( s, 2, 0, Char2 ),
			( Char2 == `</` ->
				remove_white_space,
				xml_parse_tag_name~>End_tag_name,!,
				End_tag_name == Name,
				remove_white_space,
				(not eof -> 
					fread( s, 1, 0, Char3 ), 
					Char3 == `>`,
					End=1;
					!, fail					
				); % OR This this isn't ending tag
				inpos(Inpos4),
				Inpos3 is Inpos4 - 1,
				inpos(Inpos3),
				xml_parse_tag(Type)~>Sub_tag,
				(Type == 0 -> write(','),write(Sub_tag); true)
			)
		)
	),(End=0;true),!.

xml_parse_comment :- 
	inpos(Inpos),
	fread( s, 3, 0, String ),
	( String == `!--` ->
		xml_parse_comment1;
		inpos(Inpos), !, fail
	),!, print('Accept Comment').
xml_parse_comment1 :-
	(not eof) ->	fread( s, 1, 0, Char ),
	  ( Char == `-` -> xml_parse_comment2; xml_parse_comment1 ); !,fail.
xml_parse_comment2 :-
	(not eof) ->	fread( s, 1, 0, Char ),
	  ( Char == `-` -> xml_parse_comment3; xml_parse_comment1 ); !,fail.
xml_parse_comment3 :-
	(not eof) ->	fread( s, 1, 0, Char ),
	  ( Char == `>` -> true;
	    Char == `-` -> xml_parse_comment2; xml_parse_comment1 );
	  !,fail.

xml_parse_header :-
	inpos(Inpos),
	fread( s, 4, 0, Str_temp ),
	lwrupr(String,Str_temp),
	( String == `?xml` ->
		xml_parse_header1;
		inpos(Inpos), !, fail
	),!, print('Accept XML Header').

xml_parse_header1 :-
	(not eof) ->	fread( s, 1, 0, Char ),
	  ( Char == `?` -> xml_parse_header2; xml_parse_header1 ); !,fail.
xml_parse_header2 :-
	(not eof) ->	fread( s, 1, 0, Char ),
	  ( Char == `>` -> true; !,fail ); !,fail.

is_white_space(Char) :- Char = ` `; Char = `	`;Char = `~M`; Char = `~J`.
is_alpha(Char) :-
	nonvar(Char), string(Char),
	string_chars( Char, [Ascii|_] ),
	( ( Ascii >= 97, Ascii =< 122 );
	  ( Ascii >= 65, Ascii =< 90 ) ).
is_digit(Char) :-
	nonvar(Char), string(Char),
	string_chars( Char, [Ascii|_] ),
	( ( Ascii >= 48, Ascii =< 57 ) ).
is_tag_name_char(Char) :- Char == `_`; is_alpha(Char); is_digit(Char).

remove_white_space :-
	repeat,
	( eof -> true;
	  inpos(Inpos),	fread( s, 1, 0, Char ),	
	  ( is_white_space(Char) -> fail; inpos(Inpos) )
	),!.
