%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%MAIN PROGRAM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
main:-	
	wfcreate(font,'Terminal',12,0),
   	
   	init,
	agent,
	shell,
	close_system.

init :-
	assert(hyp([])),retract(hyp([])),
	assert(specification([])),retract(specification([])),
	assert(property([])),retract(property([])),
	assert(axiom([])),retract(axiom([])),
	assert(intmodel([])),retract(intmodel([])),			
	
	assert(stack_depth(20)).

shell :-
	talk(`~M~J<<Welcome to Intelligent Prolog Debugging System>>~M~J`),
	talk(program,`Enter a goal to query`),
	talk(`~M~J`),

	user_input(Term),
	(
		Term=exit,!
	;
		query(user,program,Term,_),
		shell
	).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AGENT QUERYING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
query(program,user,Term,YN) :-
	%talk(program,Term),
	message_box(yesno,Term,YN).
	%talk(user,YN).

query(user,program,Term,YN) :-
	talk(program,`Querying ...`),
			
	stack_depth(Depth),
	demo(program,Term,YN,Proofs,Depth),
	(
		YN=yes,		
		talk(program,Term),
		
		list_string([Term,`~M~JDiagnose?`],MsgDiag),
		query(program,user,MsgDiag,YNDiag),
		(	YNDiag=yes,
			talk(`~M~J`),
			talk(program,`Diagnosing the incorrect solution ...`),	
			(	fp(Proofs,Err)
				->show_error(Err)
				;talk(program,`No error found.`)
			),
			show_tree(Proofs)
		;
			YNDiag=no,
			show_tree(Proofs),
			query(program,user,`Find more solutions?`,YNMore),
			YNMore=no
		)
		
	;
		YN=no,!,
		talk(program,`No solution!`),
		query(program,user,`No solution!~M~JDiagnose?`,YNMiss),
		(	YNMiss=yes,	
			talk(`~M~J`),
			talk(program,`Diagnosing the missing solution ...`),	
			(	ip(Term,Err)
				->show_error(Err)
				;talk(program,`No error found.`)
			)
		;
			YNMiss=no
		)
	;	
		YN=overflow,!,
		talk(program,`Stack overflow!`),
		show_tree(Proofs)
	).

show_tree(Proofs) :- 
	query(program,user,`Show the computation tree?`,YNTree),
	(	YNTree=yes,
		tree,					
		write_tree(0,Proofs,TreeStr),
		wtext((tree,8005),TreeStr)
	;
		YNTree=no
	).


show_error(Err) :-
	Err=incorrect(ErrClause)
	->
	talk(program,[`The incorrect clause is `,ErrClause,`~M~J`])
	;
	Err=incomplete(ErrClause),
	talk(program,[`The missing clause is `,ErrClause,`~M~J`]).
			
talk([H|T]) :- !,
	list_string([H|T],Str),
	talk(Str).
talk(Term) :-
	wtext((agent,8000),StrOld),
	term_string(Term,StrTerm),
	cat([StrOld,`~M~J`,StrTerm],StrNew,_),
	wtext((agent,8000),StrNew),
	wedtsel((agent,8000),64000,64000).
	
talk(From,[H|T]) :- !,
	list_string([H|T],Str),
	talk(From,Str).
talk(From,Term) :-
	wtext((agent,8000),StrOld),
	
	term_string(From,StrFrom),
	term_string(Term,StrTerm),

	cat([StrOld,`~M~J`,StrFrom,` : `,StrTerm],StrNew,_),
	wtext((agent,8000),StrNew),
	wedtsel((agent,8000),64000,64000).

user_input(Term) :-		
	retractall(user_input_data(_)),
	user_input1(Term).

user_input1(Term) :- 
	user_input_data(Str),
	string_term(Str,Term),!.
		
user_input1(Term) :- user_input1(Term).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% General Knowledge  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-op(1200,xfx,=>).
:-op(1200,xfx,<=>).

%---------- Builtin predicates -------------
builtin(true).
builtin(fail).
builtin(_ = _).
builtin(_ \= _).
builtin(_ == _).
builtin(_ \== _).
builtin(_ < _).
builtin(_ =< _).
builtin(_ > _).
builtin(_ >= _).
builtin(_ is _).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Program Agent %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
%------------- Demo ------------
demo(program,A,YN) :-
	demo(program,A),YN=yes;
	YN=no.

demo(program,A) :-
	builtin(A),!,A.
demo(program,(A,B)) :- !,
	demo(program,A),
	demo(program,B).
demo(program,not(A)) :- !,
	demo(program,A,YN),!,YN=no.
demo(program,A) :- 
	hyp(C),
	(C=(A:-B)->demo(program,B);A=C).

%------- Demo that collects proof ------
demo(program,A,YN,Ts) :-
	demo_tree(program,A,Ts),YN=yes;
	YN=no,Ts=[fail(A,[])].
	
demo_tree(program,A,[true(A,[])]) :-
	builtin(A),!,A.
demo_tree(program,(A,B),Ts) :- !,
	demo_tree(program,A,As),
	demo_tree(program,B,Bs),
	append(As,Bs,Ts).
demo_tree(program,not(A),Ts) :- !,
	demo(program,A,YN,Ts),!,YN=no.
demo_tree(program,A,[true(A,Ts)]) :- 
	hyp(C),
	(C=(A:-B)->demo(program,B,Ts);A=C,Ts=[]).

%------- Demo that collects proof and overflow check ------
demo(program,A,YN,Ts,Depth) :-
	demo_tree(program,A,Ts,Depth,OV),YN=OV;
	YN=no,Ts=[fail(A,[])].

demo_tree(program,A,[overflow],0,overflow) :- !.

demo_tree(program,A,[true(A,[])],D,yes) :-
	builtin(A),!,A.

demo_tree(program,(A,B),Ts,D,OV) :- !,
	demo_tree(program,A,As,D,OVA),
	(	OVA=overflow
		->
		OV=OVA,Ts=As
		;
		demo_tree(program,B,Bs,D,OV),
		append(As,Bs,Ts)
	).

demo_tree(program,not(A),Ts,D,OV) :- !,
	demo(program,A,YN,TAs,D),!,
	(	YN=overflow -> OV=YN,Ts=[overflow]
		;
		YN=no -> OV=yes,Ts=TAs
	).

demo_tree(program,A,[true(A,Ts)],D,OV) :- 
	hyp(C),
	(	C=(A:-B)
	->	D1 is D-1,
		demo_tree(program,B,Ts,D1,OV)
	;	A=C,Ts=[],OV=yes
	).

%------ Diagnose incorrect solution -----
fp([T1|Ts],C) :-
	fp(T1,C),!;
	fp(Ts,C).

fp(true(A,_),C) :- 
	builtin(A),!,fail.
fp(fail(A,_),C) :-
	ip(A,C).
fp(true(A,Bs),C) :-
	query(program,oracle,forall,A,no),
	(	
	fp(Bs,C),!;
	treelist_conj(Bs,Body),C=incorrect((A:-Body))
	).
treelist_conj([],true) :- !.
treelist_conj([true(A,_)],A) :- !.
treelist_conj([fail(A,_)],not(A)) :- !.
treelist_conj([T1|Ts],(C1,Cs)) :-
	treelist_conj([T1],C1),
	treelist_conj(Ts,Cs).

%------- Diagnose finite failure --------------
ip(A,C) :-
	builtin(A),!,fail.
ip(not(A),C) :- !,
	demo(program,A,yes,Ts),!,fp(Ts,C).
ip((A,B),C) :- !,
	(	demo(program,A),
		ip(B,C),!
	;
		ip(A,C)
	).
ip(A,C) :-
	findall(A,demo(program,A),As),
	freeze(A,A1),not_exist(member(A1,As)),
	query(program,oracle,comp,(A,As),no),
	(	hyp((A:-B)),
		ip(B,C),!
	;
		C=incomplete(A)
	).

%--------- Hypotheses ----------
%hyp( (p :- a,b) ).
%hyp( (a :- c,d) ).
%hyp( (b :- true) ).
%hyp( (c :- true) ).
%hyp( (d :- true) ).

%hyp( (u :- v) ).
%hyp( (v :- w) ).
%hyp( (w :- u) ).

%hyp( (sort([X|Xs],Ys) :- sort(Xs,Zs),insert(X,Zs,Ys)) ).
%hyp( (sort([],[]) :- true) ).
%hyp( (insert(X,[Y|Ys],[Y|Zs]) :- (X>Y),insert(X,Ys,Zs)) ).
%hyp( (insert(X,[Y|Ys],[Y|Ys]) :- (X=<Y)) ).
%hyp( (insert(X,[],[X]) :- true) ).

%hyp( (diff(X,Ys,Zs) :- memb(X,Ys) , not(memb(X,Zs))) ).
%hyp( (diff(X,Ys,Zs) :- memb(X,Zs) , not(memb(X,Ys))) ).
%hyp( (memb(X,[X|_]) :- true) ).
%hyp( (memb(X,[_|Ys]) :- memb(X,Ys)) ).

query(program,oracle,forall,Term,YN) :-
	talk(program,[Term,` Valid?`]),
	demo(oracle,forall,Term,YNValid,Source),
	talk(oracle,[YNValid,` -from `,Source]),
	YN=YNValid.

query(program,oracle,comp,(A,[]),YNComp) :- !,
	talk(program,[A,` Exist?`]),
	demo(oracle,exist,A,YNExist,Source),
	talk(oracle,[YNExist,` -from `,Source]),
	(YNExist=yes->YNComp=no;YNComp=yes).

query(program,oracle,comp,(A,As),YN) :-
	list_string([`The solutions of `,A,` are `,As,` Complete?`],MsgComp),
	talk(program,MsgComp),
	demo(oracle,comp,(A,As),YNComp,Source),
	talk(oracle,[YNComp,` -from `,Source]),
	YN=YNComp.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Oracle Agent %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
%---------- Demo -------------
demo(oracle,exist,A,YN,Source) :-
	ground(A),!,
	(
	demo(specification,A,YNSpec)->YN=YNSpec,Source=specification;
	demo(property,A,YNProp)->YN=YNProp,Source=property;
	demo(intmodel,A,YNInt)->YN=YNInt,Source=intmodel;
	demo(user,exist,A,YNUser)->YN=YNUser,Source=user
	).
demo(oracle,exist,A,YN,user) :-
	demo(user,exist,A,YN).

demo(oracle,forall,A,YN,Source) :-
	ground(A),!,
	(
	demo(specification,A,YNSpec)->YN=YNSpec,Source=specification;
	demo(property,A,YNProp)->YN=YNProp,Source=property;
	demo(intmodel,A,YNInt)->YN=YNInt,Source=intmodel;
	demo(user,forall,A,YNUser)->YN=YNUser,Source=user
	).		
demo(oracle,forall,A,YN,user) :-
	demo(user,forall,A,YN).

demo(oracle,comp,(A,As),YN,user) :-
	demo(user,comp,(A,As),YN).

demo(specification,A,YN) :-
	specification( (A<=>S) ),
	demo(axiom,S,YN).
demo(property,A,no) :-
	property( (A=>F) ),
	demo(axiom,F,no).
demo(intmodel,A,YN) :-
	intmodel(A-YN).

demo(axiom,A,YN) :-
	demo(axiom,A)->YN=yes;YN=no.
demo(axiom,true).
demo(axiom,(A,B)) :- !,
	demo(axiom,A),
	demo(axiom,B).
demo(axiom,A) :-
	builtin(A),!,A.
demo(axiom,A) :- 
	axiom((A:-B)),
	demo(axiom,B).

demo(user,exist,A,YN) :-
	query(oracle,user,exist,A,YN),
	(ground(A)->assert(intmodel(A-YN));true).
demo(user,forall,A,YN) :-
	query(oracle,user,forall,A,YN),
	(ground(A)->assert(intmodel(A-YN));true).
demo(user,comp,(A,As),YN) :-
	query(oracle,user,comp,(A,As),YN).

%---------- Specification -------------
%specification([]).

%---------- Property -------------
%property([]).
%property( (sort(Xs,Ys) => length(Xs,N),length(Ys,N)) ).
%property( (insert(X,Xs,Ys) => length(Xs,N),length(Ys,s(N))) ).

%---------- Axiom -------------
%axiom( (length([],0) :- true) ).
%axiom( (length([H|Ts],s(N1)) :- length(Ts,N1)) ).

query(oracle,user,forall,Term,YN) :-
	list_string([Term,`~M~JValid?`],MsgTerm),
	message_box(yesno,MsgTerm,YN).

query(oracle,user,exist,Term,YN) :-
	list_string([Term,`~M~JExist?`],MsgTerm),
	message_box(yesno,MsgTerm,YN).

query(oracle,user,comp,(A,As),YN) :-
	list_string([`The solutions of `,A,` are~M~J`,As,`~M~JComplete?`],MsgComp),
	message_box(yesno,MsgComp,YN).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End Main%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Agent%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
agent :- 
   _S1 = [dlg_ownedbyprolog,ws_sysmenu,ws_minimizebox,ws_caption],
   _S2 = [ws_child,bs_groupbox,ws_visible],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,ws_hscroll,ws_vscroll,es_autohscroll,es_autohscroll,es_readonly],
   _S4 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll,es_autovscroll,es_wantreturn],
   _S5 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   wdcreate(  agent,        `Agent Communication`,         44,  73, 702, 440, _S1 ),
   wccreate( (agent,11000), button, `Agent's Communication Room`,   5,   5, 690, 410, _S2 ),
   wccreate( (agent,8000),  edit,   ``,                    15, 110, 670, 215, _S3 ),%chat edit
   wccreate( (agent,8001),  edit,   ``,                    30, 360, 590,  25, _S4 ),%query edit
   wccreate( (agent,11001), button, `View`,                10,  35, 325,  70, _S2 ),
   wccreate( (agent,1000),  button, `Program Agent`,       15,  65, 150,  30, _S5 ),
   wccreate( (agent,1001),  button, `Oracle Agent`,       170,  65, 160,  30, _S5 ),
   wccreate( (agent,1002),  button, `Query`,     	  625, 360, 50,   25, _S5 ) ,
   wccreate( (agent,11002), button, ` User`,               15, 330, 665,  70, _S2 ),
   window_handler(agent,debug_handler),
   
   wfont((agent,8000),font),
   wfont((agent,8001),font),
   
   wshow(agent,1).	

debug_handler((agent,1000),msg_button,_,_):-
	program.

debug_handler((agent,1001),msg_button,_,_):-	
	oracle,
	update_oracle.

debug_handler((agent,1002),msg_button,_,_) :-
	wtext((agent,8001),Str),
	talk(user,Str),
	assert(user_input_data(Str)).

tree :- 
   _S1 = [dlg_ownedbyprolog,ws_sysmenu,ws_maximizebox,ws_minimizebox,ws_thickframe,ws_caption],
   _S2 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,ws_hscroll,ws_vscroll,es_autohscroll,es_autovscroll,es_readonly],
   wdcreate(  tree,       `Tree`,   26, 40, 758, 427, _S1 ),
   wccreate( (tree,8005), edit, ``, 10, 15, 730, 375, _S2 ),
   wfont((tree,8005),font),
   wshow(tree,1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Show Tree%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
write_tree(N,[],``).
write_tree(N,[T1|Ts],S) :-
	write_tree(N,T1,S1),
	write_tree(N,Ts,Ss),
	cat([S1,Ss],S,_).

write_tree(N,true(A,Bs),S) :-
	write_space(N,Space),
	pretty_write(A) ~> SA,
	N1 is N+1,
	write_tree(N1,Bs,SBs),
	cat([Space,SA,`~M~J`,SBs],S,_).

write_tree(N,fail(A,Bs),S) :-
	write_space(N,Space),
	pretty_write(not A) ~> SA,
	N1 is N+1,
	write_tree(N1,Bs,SBs),
	cat([Space,SA,`~M~J`,SBs],S,_).

write_tree(N,overflow,S) :-
	write_space(N,Space),
	cat([Space,`<OVERFLOW>~M~J`],S,_).

write_space(0,``):-!.
write_space(N,Space):-
	N1 is N-1,
	write_space(N1,Space1),
	cat([Space1,`.   `],Space,_).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End Show Tree%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End Agent%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Oracle Interface%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

oracle :- 
   _S1 = [dlg_ownedbyprolog,ws_sysmenu,ws_minimizebox,ws_caption],
   _S2 = [ws_child,bs_groupbox,ws_visible],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,ws_hscroll,ws_vscroll,es_autohscroll,es_autovscroll,es_readonly],
   _S4 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S5 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_autohscroll,es_autovscroll,es_wantreturn],
   
   wdcreate(  oracle,        `Oracle Agent`,           0,  5, 800, 550, _S1 ),
   wccreate( (oracle,11000), button, `Specifications`,   305,   5, 490, 165, _S2 ),
   wccreate( (oracle,11001), button, `Properties`,       305, 170, 490, 170, _S2 ),
   wccreate( (oracle,11002), button, `Oracle's Axiom`,   305, 345, 490, 170, _S2 ),
   wccreate( (oracle,11003), button, `Intended Model`,   5, 5, 300, 480, _S2 ),
   wccreate( (oracle,8000),  edit,   ``,                320,  35, 465,  95, _S3 ),%edit Spec
   wccreate( (oracle,8001),  edit,   ``,                320, 205, 465,  95, _S3 ),%edit Prop
   wccreate( (oracle,8002),  edit,   ``,                320, 375, 465,  95, _S3 ),%edit Axiam
   wccreate( (oracle,1000),  button, `Load Oracle`,           50,  490,  100,  25, _S4 ),
   wccreate( (oracle,1001),  button, `Save Oracle`,           155,  490, 100,  25, _S4 ),
   wccreate( (oracle,8003),  edit,   ``,                320, 135, 295,  25, _S5 ),%add Spec
   wccreate( (oracle,1003),  button, `Add`,            620, 135,  80,  25, _S4 ),
   wccreate( (oracle,1004),  button, `Remove`,         705, 135,  80,  25, _S4 ),
   wccreate( (oracle,1008),  button, `Remove`,         705, 305,  80,  25, _S4 ),
   wccreate( (oracle,1009),  button, `Add`,            620, 305,  80,  25, _S4 ),
   wccreate( (oracle,1010),  button, `Add`,            620, 475,  80,  25, _S4 ),
   wccreate( (oracle,1011),  button, `Remove`,         705, 475,  80,  25, _S4 ),		
   wccreate( (oracle,8004),  edit,   ``,                320, 305, 295,  25, _S5 ),%add Prop
   wccreate( (oracle,8005),  edit,   ``,                320, 475, 295,  25, _S5 ),%add Axiam
   wccreate( (oracle,8006),  edit,   ``,                10, 35, 290,  400, _S3 ),%edit Intended
   wccreate( (oracle,1012),  button, `Clear Intended`,  50,  450,200,  25, _S4 ),
   window_handler(oracle,debug_handler),
   wfont((oracle,8000),font),   	
	
   wfont((oracle,8001),font),
   wfont((oracle,8002),font),
   wfont((oracle,8003),font),
   wfont((oracle,8004),font),
   wfont((oracle,8005),font),
   wfont((oracle,8006),font),
   
   wshow(oracle,1),
   update_oracle. 	

debug_handler((oracle,1000),msg_button,_,_) :-
	opnbox('Open',[('Source','*.pl'),('Text','*.txt')],'*.*','pl',[F1|Fs]),
	open(F1,read),
	see(F1),
	read_file1,
	seen,
	close(F1),
	update_oracle.
	
debug_handler((oracle,1001),msg_button,_,_):-
	savbox(`Save`,[(`Source`,`*.pl`),(`Text`,`*.txt`)],`*.*`,`pl`,[F1|Fs]),
	open(F1,write),
	tell(F1),
	write_file1(specification),
	write_file1(property),
	write_file1(axiom),
	write_file1(intmodel),
	told,
	close(F1).

update_oracle :-
	write_file(specification) ~> Spec,
	write_file(property) ~> Prop,
	write_file(axiom) ~> Axiom,
	write_file(intmodel) ~> Int,
        wtext((oracle,8000),Spec),
	wtext((oracle,8001),Prop),
	wtext((oracle,8002),Axiom),
	wtext((oracle,8006),Int).

debug_handler((oracle,1003),msg_button,_,_):-
	wtext((oracle,8003),Input),
	cat([Input,` `],Input1,_),
	read(Term1) <~ Input1 ,
	assert(specification(Term1)),
	write_file(specification)~>String,
	wtext((oracle,8000),String).

debug_handler((oracle,1004),msg_button,_,_):-
	wtext((oracle,8003),Input),
	cat([Input,` `],Input1,_),
	read(Term1) <~ Input1 ,
	retract(specification(Term1)),
	write_file(property)~>String,
	wtext((oracle,8000),String).

debug_handler((oracle,1009),msg_button,_,_):-
	wtext((oracle,8004),Input),
	cat([Input,` `],Input1,_),
	read(Term1) <~ Input1 ,
	assert(property(Term1)),
	write_file(property)~>String,
	wtext((oracle,8001),String).

debug_handler((oracle,1008),msg_button,_,_):-
	wtext((oracle,8004),Input),
	cat([Input,` `],Input1,_),
	read(Term1) <~ Input1 ,
	retract(property(Term1)),
	write_file(property)~>String,
	wtext((oracle,8001),String).

debug_handler((oracle,1010),msg_button,_,_):-
	wtext((oracle,8005),Input),
	cat([Input,` `],Input1,_),
	read(Term1) <~ Input1 ,
	assert(axiom(Term1)),
	write_file(axiom)~>String,
	wtext((oracle,8002),String).

debug_handler((oracle,1011),msg_button,_,_):-
	wtext((oracle,8005),Input),
	cat([Input,` `],Input1,_),
	read(Term1) <~ Input1 ,
	retract(axiom(Term1)),
	write_file(axiom)~>String,
	wtext((oracle,8002),String).

debug_handler((oracle,1012),msg_button,_,_):-
	retractall(intmodel(X)),
	wtext((oracle,8006),``).
	

save_windows:-message_box(yesno,`Do you want to save Oracle?`,AnsYN),
	(
	AnsYN=yes,!,debug_handler((oracle,1001),msg_button,_,_);
	AnsYN=no
	).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End Oracle Interface%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Program Agent%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

program :- 
   _S1 = [ws_sysmenu,ws_caption,ws_minimizebox,dlg_ownedbyprolog],
   _S2 = [ws_child,bs_groupbox,ws_visible,ws_group],
   _S3 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,ws_hscroll,ws_vscroll,es_autohscroll,es_autovscroll,es_wantreturn],
   _S4 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,ws_hscroll,ws_vscroll,es_autohscroll,es_autovscroll,es_readonly,es_wantreturn],
   _S5 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,es_autohscroll,es_autovscroll,es_wantreturn],
   _S6 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_multiline,es_autohscroll,es_autovscroll,es_readonly,es_wantreturn],
   _S7 = [ws_child,ws_visible,ws_tabstop,bs_pushbutton],
   _S8 = [ws_child,bs_groupbox,ws_visible],
   _S9 = [ws_child,ws_visible,ws_tabstop,ws_border,es_left,es_wantreturn],	   

   wdcreate(  program, `Program Agent`,         100,  50, 610, 440, _S1),
   wccreate( (program,8000),  edit,   ``,      15,  35,565,325, _S3 ),%Program edit
   wccreate( (program,11004), button, `Program Editor`,  10,  15, 590, 400, _S8 ),
   wccreate( (program,1002),  button, `Update`,    15, 375, 100,  30, _S7 ),
   wccreate( (program,1008),  button, `Load`,      120, 375, 100,  30, _S7 ),
   wccreate( (program,1009),  button, `Save`,      225,375, 100,  30, _S7 ),
   wccreate( (program,10010), button, `Clear`,     330,375, 100,  30, _S7 ),
   wccreate( (program,10011), button, `Stack Depth`,435, 365,160, 45, _S2 ),
   wccreate( (program,8001),  edit,   ``,      440, 380,40,25, _S9),%Stack Depth edit	
   wccreate( (program,10012), button, `Set`,     485,380, 100,  25, _S7 ),	
   window_handler(program,debug_handler),
   
   wfont((program,8000),font),
   wfont((program,8001),font),
   
   wshow(program,1),   
   update_program.
 	
debug_handler((program,10012),msg_button,_,_):-
	retractall(stack_depth(N)),
	wtext((program,8001),Stadpt),		
	string_term(Stadpt,Termsta),
	assert(stack_depth(Termsta)).

debug_handler((program,1002),msg_button,_,_):-
	retractall(hyp(_)),	
	wtext((program,8000),Old),	
	cat([Old,` `],Old1,_),	
	read_file(hyp) <~ Old1,
	update_program.

debug_handler((program,10010),msg_button,_,_):-
	retractall(hyp(X)),
	wtext((program,8000),``).
	
debug_handler((program,1008),msg_button,_,_) :-
	opnbox('Open',[('Source','*.pl'),('Text','*.txt')],'*.*','pl',[F1|Fs]),	
	open(F1,read),
	see(F1),
	read_file(hyp),
	seen,
	close(F1),
	update_program.

debug_handler((program,1009),msg_button,_,_):-
	savbox(`Save`,[(`Source`,`*.pl`),(`Text`,`*.txt`)],`*.*`,`pl`,[F1|Fs]),
	open(F1,write),
	tell(F1),
	write_file(hyp),
	told,
	close(F1).	

update_program :-
	write_file(hyp) ~> Hyp,
        wtext((program,8000),Hyp),
	stack_depth(N),
   	term_string(N,Str),
   	wtext((program,8001),Str).
	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End Program Agent%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Utilities %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

read_file(Pred) :-
	repeat,
	read(Term),
	(	Term = end_of_file,!;
		assert(Pred(Term)),fail
	).
read_file1 :-
	repeat, 			
	read(Term), 			
	(	Term = end_of_file,!;
		assert(Term),fail
	).
write_file(Pred) :-
	Pred(Term),	
	pretty_print(Term),
	write(`.`),nl,
	fail.
write_file(Pred) :- !.

write_file1(Pred) :-
	Pred(Term),	
	pretty_print(Pred(Term)),
	write(`.`),nl,
	fail.
write_file1(Pred) :- !.

string_term(Str,Term) :-
	cat([Str,` `],Str1,_),
	read(Term) <~ Str1.

term_string(Term,Str) :-
	pretty_write(Term) ~> Str.

pretty_write(Term) :-
	vars(Term,Vs),
	ewrite(Term,Vs).
pretty_print(Term) :-
	vars(Term,Vs),
	eprint(Term,Vs).

list_string([],``).
list_string([H|T],Str) :-
	term_string(H,StrH),
	list_string(T,StrT),
	cat([StrH,StrT],Str,_).

not_exist(P) :-
	P,!,fail.
not_exist(P).

freeze(Term,Ground) :-
	copy_term(Term,Ground),
	numbervars(Ground,0,_).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Close System%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

debug_handler(agent,msg_close,_,_):-save_windows,close_system.	
debug_handler(program,msg_close,_,_):-wclose(program).
debug_handler(oracle,msg_close,_,_):-wclose(oracle).

close_system :-
	assert(user_input_data(`exit.`)),
	wshow(agent,0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%End Close System%%%%%%%%%%%%%%%%%%%%%%%%%%%


	
