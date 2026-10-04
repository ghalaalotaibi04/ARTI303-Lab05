% Lab 5 - Working with Rules
% The Simpsons Family Knowledge Base

% Male facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).
male(ling).

% Female facts
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).

% Parent facts
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).


% Rules

% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% Sister
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

% Grandfather
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

% Aunt
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

% Uncle
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    (brother(P1, P2); sister(P1, P2)),
    X \= Y.

% Ancestor - Base case
ancestor(X, Y) :-
    parent(X, Y).

% Ancestor - Recursive case
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).


% ==================================================

% EXTRA: Test Queries and Results:

% Father
% Query 1: ?- father(homer, bart).
% Result: true.
% Query 2: ?- father(X, lisa).
% Result: X = homer.

% Mother
% Query 1: ?- mother(marge, bart).
% Result: true.
% Query 2: ?- mother(X, maggie).
% Result: X = marge.

% Son
% Query 1: ?- son(bart, homer).
% Result: true.
% Query 2: ?- son(X, marge).
% Result: X = bart.

% Daughter
% Query 1: ?- daughter(lisa, homer).
% Result: true.
% Query 2: ?- daughter(X, marge).
% Result: X = lisa ; X = maggie.

% Brother
% Query 1: ?- brother(bart, lisa).
% Result: true.
% Query 2: ?- brother(X, lisa).
% Result: X = bart.

% Sister
% Query 1: ?- sister(lisa, bart).
% Result: true.
% Query 2: ?- sister(X, bart).
% Result: X = lisa ; X = maggie.

% Grandfather
% Query 1: ?- grandfather(abraham, bart).
% Result: true.
% Query 2: ?- grandfather(X, lisa).
% Result: X = abraham.

% Aunt
% Query 1: ?- aunt(patty, bart).
% Result: true.
% Query 2: ?- aunt(X, lisa).
% Result: X = patty ; X = selma.

% Uncle
% Query 1: ?- uncle(herb, bart).
% Result: true.
% Query 2: ?- uncle(X, lisa).
% Result: X = herb.

% Cousin
% Query 1: ?- cousin(ling, bart).
% Result: true.
% Query 2: ?- cousin(bart, ling).
% Result: true.

% Ancestor
% Query 1: ?- ancestor(abraham, bart).
% Result: true.
% Query 2: ?- ancestor(X, maggie).
% Result: X = homer ; X = marge ; X = abraham.

