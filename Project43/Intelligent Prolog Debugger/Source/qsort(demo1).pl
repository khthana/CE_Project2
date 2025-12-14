sort([P1|Ps],Qs) :- partition(P1,Ps,Ls,Gs),sort(Gs,G1s),sort(Ls,L1s),append(L1s,[P1|G1s],Qs).
sort([],[]) :- true.
partition(V,[P1|Ps],[P1|Ls],Gs) :- P1=<V,partition(V,Ps,Ls,Gs).
partition(V,[P1|Ps],Ls,[P1|Ls]) :- P1>V,partition(V,Ps,Ls,Gs).
partition(V,[],[],[]) :- true.
append([],Ls,Ls) :- true.
append([P1|Ps],Qs,[P1|Ls]) :- append(Ps,Qs,Ls).
