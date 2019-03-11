:- dynamic
    wumpus/1,
    gold/1,
    pit/1.

wumpus(X,Y):-
    wumpus(List),
    member([X,Y],List).

gold(X,Y):-
    gold(List),
    member([X,Y],List).

pit(X,Y):-
    pit(List),
    member([X,Y],List).

stench(X,Y):-
    X1 is X+1,
    wumpus(X1,Y);
    X2 is X-1,
    wumpus(X2,Y);
    Y1 is Y+1,
    wumpus(X,Y1);
    Y2 is Y-1,
    wumpus(X,Y2).

initialize_world([]):-!.

initialize_world([Fact|NextFacts]):-
	assert_fact(Fact),
    initialize_world(NextFacts).

assert_fact([pit|Coordinates]):-
    pit(List),
    append(List,[Coordinates],List1),
    retractall(pit(_)),
    assert(pit(List1)).

assert_fact([wumpus|Coordinates]):-
    wumpus(List),
    append(List,[Coordinates],List1),
    retractall(wumpus(_)),
    assert(wumpus(List1)).

assert_fact([gold|Coordinates]):-
    gold(List),
    append(List,[Coordinates],List1),
    retractall(gold(_)),
    assert(gold(List1)).

start(World):-
    retractall(pit(_)),
    assert(pit([])),
    retractall(wumpus(_)),
    assert(wumpus([])),
    retractall(gold(_)),
    assert(gold([])),
    initialize_world(World),
    start(1,1,[],1,1).

start(X,Y,Path,_,_):-
    gold(X,Y),
    append(Path,[[X,Y]],Path1),
    writeln(Path1),
    !.

start(6,_,_,_,_):-!.
start(_,6,_,_,_):-!.
start(0,_,_,_,_):-!.
start(_,0,_,_,_):-!.

start(X,Y,Path,_,_):-
    member([X,Y],Path),
    !.

start(X,Y,_,_,_):-
    pit(X,Y),
    !.

start(X,Y,_,1,_):-
    wumpus(X,Y),
    !.

start(X,Y,Path,1,1):-
    stench(X,Y),
    append(Path,[[X,Y]],Path1),
    X1 is X+1,
    X2 is X-1,
    Y1 is Y+1,
    Y2 is Y-1,
    (wumpus(X1,Y) ->  start(X1,Y,Path1,0,0); start(X1,Y,Path1,1,0)),
    (wumpus(X2,Y) ->  start(X2,Y,Path1,0,0); start(X2,Y,Path1,1,0)),
    (wumpus(X,Y1) ->  start(X,Y1,Path1,0,0); start(X,Y1,Path1,1,0)),
    (wumpus(X,Y2) ->  start(X,Y2,Path1,0,0); start(X,Y2,Path1,1,0)).

start(X,Y,Path,Wumpus,Arrows):-
    append(Path,[[X,Y]],Path1),
    X1 is X+1,
    X2 is X-1,
    Y1 is Y+1,
    Y2 is Y-1,
    start(X1,Y,Path1,Wumpus,Arrows),
    start(X2,Y,Path1,Wumpus,Arrows),
    start(X,Y1,Path1,Wumpus,Arrows),
    start(X,Y2,Path1,Wumpus,Arrows).

    
    







    

    
    



    
    
	