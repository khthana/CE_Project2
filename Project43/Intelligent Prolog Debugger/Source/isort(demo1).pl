sort([X|Xs],Ys) :- sort(Xs,Zs),insert(X,Zs,Ys).
sort([],[]) :- true.
insert(X,[Y|Ys],[Y|Zs]) :- X>Y,insert(X,Ys,Zs).
insert(X,[Y|Ys],[Y|Ys]) :- X=<Y.
insert(X,[],[X]) :- true.

