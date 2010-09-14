-module(e001).
-export([start/0, main/1]).

main(_) ->
  start().

start() ->
  Sum = lists:sum(
    lists:seq(3, 999, 3) ++
    lists:seq(5, 999, 5) --
    lists:seq(15, 999, 15)
  ),
  io:format("~p~n", [Sum]).

