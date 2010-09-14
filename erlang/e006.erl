-module(e006).
-export([main/1, start/0]).

main(_) ->
  start().

start() ->
  io:format("~p~n",
    [
      square(lists:sum(lists:seq(1, 100))) -
      lists:sum(lists:map(fun square/1, lists:seq(1, 100)))
    ]
  ).

square(X) ->
  X * X.

