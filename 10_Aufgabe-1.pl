nat(0).
nat(s(X)) :- nat(X).

add(0,X,X) :- nat(X).
add(s(X), Y, s(Z)) :- add(X,Y,Z).

% Aufgabe 1.a)
gte(X,0) :- nat(X).
gte(s(X),s(Y)) :- gte(X,Y).

% Aufgabe 1.b)
mult(0,X,0) :- nat(X).
mult(s(X),Y,Z) :- mult(X,Y,W), add(Y,W,Z).

% Aufgabe 1.c)
fib(s(0), s(0)).
fib(s(s(0)), s(0)).
fib(s(s(N)),F) :- fib(s(N),F1), fib(N,F2), add(F1, F2, F).
