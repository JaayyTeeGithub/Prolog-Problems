/**
 * comment format
 */


likes(joe, pizza).
likes(mary, pizza).
likes(jeff, chips).
likes(joe, chips).

friends(A, B) :- likes(A, Food), likes(B, Food).

my_append([], B, B).
my_append([Head|TailA], B, [Head|TailC]) :-
    my_append(TailA, B, TailC).

/**
 * member predicate
 *
 * member(1, [1,2,3,4]).
 * = True
 *
 * member(X, [1,2,3,4]).
 * = 1
 * = 2
 * = 3
 * = 4
 *
 */

/**
 * length predicate
 *
 * length([1,2,3], 3).
 * = True
 *
 * length([1,2,3], X).
 * = 3
 *
 */

/**
 * Find if list has odd items.
 *
 * oddSize([_]).
 * oddSize([_,_|Tail]) :- oddSize(Tail).
 *
 *
 */

/**
 * third predicate
 *
 * third([_,_,X|_], X).
 *
 *
 */

/**
 *
 * firstPair([Uno, Uno|_]).
 *
 */
