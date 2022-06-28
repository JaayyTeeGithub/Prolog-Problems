blockage(4,1).
blockage(4,2).
blockage(6,3).
blockage(1,2).
blockage(7,6).

move([X, Y], 'right', [X1, Y]) :- X1 is X + 1, X1 < 9, \+ blockage(X1, Y).
move([X, Y], 'up', [X, Y1]) :- Y1 is Y + 1, Y1 < 9, \+ blockage(X, Y1).

path([8,8],[]).
path(CurrentState, [Move|Rest]) :- move(CurrentState,Move,NextState),
	path(NextState,Rest).
