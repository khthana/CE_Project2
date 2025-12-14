property((sort(A,B) => length(A,C),length(B,D),C = D)).
axiom((length([],0) :- true)).
axiom((length([_|A],B) :- length(A,C),B is C + 1)).

