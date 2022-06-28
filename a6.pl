 %%  Jeremy Thomas
%

%
%%factorial definition
factorial(0,1).
factorial(N,Result) :- N > 0,P is N-1,factorial(P,Q),Result is N*Q.

%%bigger definition
bigger(X,Y,X) :- X > Y.
bigger(X, Y, Y) :- Y >= X.
%odd is true if list is one element
oddSize([_]).
% if list contains more than two elements recursively call oddSize on
% Tail
oddSize([_,_|Tail]):-oddSize(Tail).
%even is true if list contains no elements
evenSize([]).
%if list contains 2 or more elements recursively call evenSize on Tail
evenSize([_,_|Tail]):-evenSize(Tail).
%prefix is true when empty list is prefix of any list
isPrefix([], _).
%if list contains elements if heads match recursively call on tails
isPrefix([Head|Tailx], [Head|Taily]):-isPrefix(Tailx, Taily).
%is true if X matches head of list
isMember(X, [X|_]).
%if x doesnt match head then recursively call with x and tail
isMember(X, [_|Tail]):- isMember(X, Tail).
%is true if x is head of list and result list is tail
remove(X, [X|Taily], Taily).
%is true if X is notMember of Y and X is notMember of Z
remove(X, Y, Z) :- \+ isMember(X,Y), \+ isMember(X,Z).
%is true if list contains more than two values and head does not match x
%recursively call remove and x head of y to z
remove(X,[Heady,Secondy|Taily],[Heady|Z]):- remove(X,[Secondy|Taily],Z).
%is true if empty lists
isUnion([], [], []).
%is true if empty list unions Y then Y
isUnion([], Y, Y).
%first list contains items call recursively with Tail of x
%add head of x to z if head is not a member of y
isUnion([H|Tx], Y, [H|Tz]) :-isUnion(Tx, Y, Tz),\+ isMember(H, Y).
%if head is member of y do not add head to z
isUnion([H|Tx], Y, Z) :- isUnion(Tx, Y, Z),isMember(H, Y).
%is true if empty list
isEqual([],_).
%recursively call on Tail and Y if head is a member of Y
isEqual([Head|Tail], Y):-isEqual(Tail,Y), isMember(Head,Y).
%list is empty if x+1 == Y
isBetween(X,Y,[]) :- X1 is X+1, X1 == Y.
%add X1 to list if x less than y
isBetween(X,Y,[X1|Xs]) :- X < Y,X1 is X+1,isBetween(X1,Y,Xs).




%
%!  ADD YOUR CODE ABOVE
%!  ADD YOUR CODE ABOVE
%!
%!  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%% Unit tests for Prolog Assignment 1
%!  %%%%%%%%
%
%

cls :- write('\33\[2J').


%% factorial
:- begin_tests(factorial).
test(factorial_test1,[true]) :- factorial(0, 1).
test(factorial_test2) :- factorial(6,720).
:- end_tests(factorial).

%%  max
:- begin_tests(bigger).
test(max_test1) :- bigger(4,2,4).
test(max_test2) :- bigger(2,12,12).
:- end_tests(bigger).

/* oddSize */
:- begin_tests(oddSize).
test(oddSize_test1) :- oddSize([13,21,2,101,205,9,3]).
test(oddSize_test2) :- oddSize([101]).
test(oddSize_test3) :- oddSize(['apple','ball','cat']).
test(oddSize_test4, [fail]) :- oddSize([13,21,2,11]).
:- end_tests(oddSize).

/* evenSize */
:- begin_tests(evenSize).
test(evenSize_test1) :- evenSize([13,21,2,101,205,9]).
test(evenSize_test2) :- evenSize([]).
test(evenSize_test3) :- evenSize(['apple','ball','cat','dog']).
test(evenSize_test4, [fail]) :- evenSize([13,21,2,11,82]).
:- end_tests(evenSize).

/* prefix */
:- begin_tests(isPrefix).
test(prefix_test1) :- isPrefix([1,2], [1,2,3,4,5]).
test(prefix_test2) :- isPrefix([1,2,3,4], [1,2,3,4,5]).
test(prefix_test3) :- isPrefix([], [1,2,3,4,5]).
test(prefix_test4,all(X==[[],[1],[1,2],[1,2,3]])) :- isPrefix(X, [1,2,3]).
test(prefix_test5, [fail]) :- isPrefix([1,2], [1,3,2,4,5]).
:- end_tests(isPrefix).

/* isBetween */
:- begin_tests(isBetween).
test(isBetween_test1) :- isBetween(3, 8, [4,5,6,7]).
test(isBetween_test2) :- isBetween(2, 9, [3,4,5,6,7,8]).
test(isBetween_test3) :- isBetween(1, 2, []).
test(isBetween_test4,[fail]) :- isBetween(2, 7, [4,5,6,7]).
:- end_tests(isBetween).

/* isMember */
:- begin_tests(isMember).
test(isMember1) :- isMember(1, [1,2,3,4,5]).
test(isMember2) :- isMember(4, [1,2,13,4,5,16,7]).
test(isMember3) :- isMember(5, [11,21,13,41,5]).
test(isMember4, all(X==[1,2,3,20])) :- isMember(X, [1,2,3,20]).
test(isMember5, [fail]) :- isMember(100, [1,2,3,6]).
:- end_tests(isMember).

/* isUnion */
:- begin_tests(isUnion).
test(isUnion_test1) :- isUnion([3,1,2],[4,1,5,14],X), sort(X, [1,2,3,4,5,14]).
test(isUnion_test2) :- isUnion([2,1,3,4],[4,1,2,3],X), sort(X, [1,2,3,4]).
test(isUnion_test3) :- isUnion([4,2,6],[13,7,11],X), sort(X, [2,4,6,7,11,13]).
:- end_tests(isUnion).

/* isEqual */
:- begin_tests(isEqual).
test(isEqual_test1) :- isEqual([3,1,2],[1,2,3]).
test(isEqual_test2,[fail]) :- isEqual([3,1,2],[3,1,4]).
test(isEqual_test3) :- isEqual([1,2,3,4,5],[5,4,3,2,1]).
test(isEqual_test4) :- isEqual(['a','b','c'],['b','c','a']).
:- end_tests(isEqual).

/* remove */
:- begin_tests(remove).
test(remove_test1) :- remove(1, [1,2,3,4], [2,3,4]).
test(remove_test2) :- remove(2, [1,1,2,3,2,4], [1,1,3,2,4]).
test(remove_test3) :- remove(11, [1,1,2,3,2,4,11], [1,1,2,3,2,4]).
test(remove_test4) :- remove(13, [1,1,2,3,2,4,11], [1,1,2,3,2,4,11]).
:- end_tests(remove).

%% The following directives (at the shell prompt ?-) run the tests.
%% run_tests(testName). - runs the corresponding test
%% run_tests. - runs all the tests in the file

