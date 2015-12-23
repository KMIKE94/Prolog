
interleave([],[],[]).
interleave([],L,L).
interleave(L,[],L).
interleave([H|T], L, [H|R]) :- interleave(T,L,R).
interleave(T, [H|L], [H|R]) :- interleave(T,L,R).

female(ziva).
female(soca).
parent(barak, ziva).
% parent(barak, soca).
parent(fishel, barak).
parent(frances, barak).
parent(ziva, fishel).
female(frances).
male(barak).
male(fishel).

%% Prolog starts pattern matching from the left.
%% It's more efficient to start with a predicate with fewer solutions after :- (the "if" operator)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandfather(X, Z) :- father(X, Y), parent(Y, Z).
grandmother(X, Z) :- mother(X, Y), parent(Y, Z).

grandparent(X, Z) :- parent(X, Y) , parent(Y, Z).

cousin(X,Z) :- grandparent(X,Y), grandparent(X,Z).

%% Siblings will show that they're cousins because they share the same
%% grandparents, we can avoid this behaviour by having a check for
%% siblings and if the same person is checked against theirself

% siblings(X,Z) :- parent(Y, X), parent(Y, Z).
