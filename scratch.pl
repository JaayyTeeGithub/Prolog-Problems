isMember(X, [X|_]).
isMember(X, [_|Tail]):- isMember(X, Tail).



remove(X, [X|Taily], Taily).
remove(X, Y, Z) :- \+ isMember(X,Y), \+ isMember(X,Z).
remove(X,[Heady,Secondy|Taily],[Heady|Z]):- remove(X,[Secondy|Taily],Z).

isBetween(X,Y,Z):- X<Y, X1 is X+1, isBetween(X1,Y,Z).


