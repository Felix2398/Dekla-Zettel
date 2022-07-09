% Aufgabe 3.a)
without(List, Element, Result) :- List \= Result, delete(List, Element, X), X = Result.

delete([], X, []).
delete([X|Xs],X,Ys) :- delete(Xs,X,Ys).
delete([X|Xs],Z,[X|Ys]) :- X \= Z, delete(Xs, Z, Ys).


% Aufgabe 3.b)
nat(0).
nat(s(X)) :- nat(X).

add(0,X,X) :- nat(X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

sum(ListOfNat,Sum) :- addElement(ListOfNat, X), X = Sum.

addElement([], 0).
addElement([H|T], Sum) :- nat(H), addElement(T, Acc), add(H,Acc,Sum).
