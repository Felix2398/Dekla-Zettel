% Aufgabe-4
edge(a,d).
edge(d,b).
edge(d,c).
edge(d,e).
edge(g,f).

path(N1,N2,PATH) :- con(N1, X, N2), X = PATH.

con(X, [[X, N2] |[]] , N2) :- edge(X, N2).
con(X, [[X, E2] | T], N2) :- edge(X, E2), con(E2, T, N2).
