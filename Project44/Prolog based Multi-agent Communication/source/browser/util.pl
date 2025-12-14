string_cut(String,Start,Len,Out) :-
	string_chars( String, String_chars ),
	string_cut_1( String_chars,Start,String_chars2 ),
	string_cut_2( String_chars2,Len )~>Out,
	!.
string_cut_1( Output, 0, Output ) :- !.
string_cut_1( [Head|Tails],Start, Output ) :- Temp is Start - 1, string_cut_1(Tails,Temp,Output).
string_cut_1( _, _, [] ) :- !.
string_cut_2( [], _ ) :- !.
string_cut_2(  _, 0 ) :- !.
string_cut_2( [Head|Tails], Len ) :- Len < 0, (Head == 13; Head == 10), !.
string_cut_2( [Head|Tails], Len ) :- Temp is Len -1, fwrite(b,0,0,[Head]), string_cut_2(Tails,Temp).

find_word(String,Word,Point) :-
	string_chars( String, String_chars ),
	string_chars( Word, Search_chars ),
	mapword(String_chars,Search_chars,Point2,Flag),
	length(Search_chars,Points),
	Point is Point2 - Points.
mapword([Head|Tail],[Headw|Tailw],Point,Flag) :-
	(  ( Head == Headw , mapword(Tail,Tailw,Point2,yes) )
	  ;( nonvar(Flag), Flag == yes, !, fail )
	  ;( !,mapword(Tail,[Headw|Tailw],Point2,no) ) 
	),
	Point is Point2 + 1.
mapword(_,[],1,yes) :- !.

convert_str_to_atom(Data,Atom) :-
	( write(Data),write(`~M~J.~M~J`) )~> String,
	input(In),input((String,0)),
	catch( Error, read(Atom) ),
	input(In),
	!,Error == 0,Atom \= end_of_file.	

to_write(Data) :-  /* Invert Function of convert_str_to_atom */
	type(Data,T),
	( ( T == 3 ) ->	write_atom(Data);
	  ( T == 4 ) ->	write_string(Data);
	  ( T == 6 ) ->	write(`[`), write_list(Data),	write(`]`);
	  ( T == 7 ) ->	functor(Data,A,Count),
			write(`'`), 	 write(A),	write(`'(`),
			write_tuple(Data,Count,0),	write(`)`);
	  write(Data)
	),!.
write_atom(Atom) :-
	write(''''),
	atom_chars(Atom,Chars),
	write_atom2(Chars),
	write('''').
write_atom2([]) :- !.
write_atom2([Head|Tails]) :-
	atom_chars(C, [Head] ),
	( C == '''' ->
		write('''''');
		write( C )
	),
	write_atom2(Tails).

write_string(String) :-
	write(````),
	string_chars(String,Chars),
	write_string2(Chars),
	write(````).
write_string2([]) :- !.
write_string2([Head|Tails]) :-
	string_chars(C, [Head] ),
	( C == ```` ->
		write(``````);
		write( C )
	),
	write_string2(Tails).
	
write_list(List) :-
	List = [Head|Tails],
	to_write(Head),
	( Tails \= [] ->
		write(','),
		write_list(Tails);
		true
	),!.
write_tuple(Tuple, Argv, Last) :-
	ArgAt is Last + 1,
	arg(ArgAt, Tuple, Data),
	to_write(Data),
	( Argv == ArgAt -> 
		true;
		write(','),
		write_tuple(Tuple, Argv, ArgAt)
	),!.
write_to_file(Data,File) :- 
	file( File, -1, Info ),
	(Info == 1 -> del(File); true),
	fcreate(File,File,-1,0),
	output(Was),
	output(File),
	write(Data),
	output(Was),
	fclose(File).
write_data_from_file(File) :-
	fcreate( File, File, 0, 0),
	input(Was),
	input(File),inpos(0),
	repeat,
	( not eof ->
		fread(s,0,0,Data),
		write(Data),
		fail;
		true
	),!,
	input(Was),
	fclose(File).

solve(true)  :- !.
solve((A,B)) :- !,solve(A), solve(B).
solve((A;B)) :- !,( solve(A); solve(B) ).
solve(A) :- repeat, catch( Error, clause( A, B ) ),
		( Error == 0 ->
			solve(B);
		  Error == -1 ->
			!,fail;
			!,call(A)
		).
left_functor(Predicate,Functor) :-
     	functor(Predicate, Temp2, Arity),
		( (Temp2 == ':-',Arity==2) -> 
			arg(1,Predicate,Temp);
			Temp = Temp2 ),
        ( atom(Temp) -> 
			Functor = Temp; 
			left_functor(Temp,Functor)  ),!.

not_empty(A) :-
	(var(A) -> !, fail; true),
	( string(A) ->
		string_chars(A,Lists),!,
		all_not_space(Lists)
		;true
	),!.
all_not_space( [] ) :- !, fail.
all_not_space(CharList) :-
	[H|T] = CharList,
	( check_is_space( H ) ->
		all_not_space( T );
	  true
	).

check_is_space( Char ) :- 
	string_chars(S,[Char]), 
	( S == ` `; S == `~I`; 
	  S == `~M`; S == `~J` ).

