vector_mult([],[],[]) :- true.
vector_mult([A1|As],[B1|Bs],[C1|Cs]) :-
	C1 is A1*B1,
	vector_mult(As,Bs,Cs).

vector_sum([_],0) :- true.
vector_sum([A1|As],Sum) :-
	vector_sum(As,Sum1),
	Sum is Sum1+A1.

vector_dot(A,B,R) :-
	vector_mult(A,B,C),
	vector_sum(C,R).

matrix_trans([[]|_],[]) :- true.
matrix_trans(M,[N1|Ns]) :-
	matrix_column(M,N1,M1),
	matrix_trans(M1,Ns).

matrix_column([],[],[]) :- true.
matrix_column([[M11|M1s]|Ms],[M11|Cs],[M1s|Os]) :-
	matrix_column(Ms,Cs,Os).

matrix_mult(M,N,O) :-
	matrix_trans(N,N1),
	matrix_mult1(M,N1,O).

matrix_mult1([],N,[]) :- true.
matrix_mult1([M1|Ms],N,[O1|Os]) :-
	vect_dot_mat(M1,N,O1),
	matrix_mult1(Ms,N,Os).

vect_dot_mat(V,[],[]) :- true.
vect_dot_mat(V,[M1|Ms],[R1|Rs]) :-
	vector_dot(V,M1,R1),
	vect_dot_mat(V,Ms,Rs).
