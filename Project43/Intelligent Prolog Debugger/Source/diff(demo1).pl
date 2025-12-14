diff(X,Ys,Zs) :- memb(X,Ys) , not memb(X,Zs).
diff(X,Ys,Zs) :- memb(X,Zs) , not memb(X,Ys).
memb(X,[Y|Xs]).
memb(X,[Y|Xs]) :- memb(X,Xs).
