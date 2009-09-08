-module(e009).
-export([main/1, start/0]).

-compile(export_all).

main(_) ->
  start().

start() ->
  Triplets = [
    A * B * C ||
    A <- lists:seq(1, 1000),
    B <- lists:seq(A, 1000),
    C <- [1000 - A - B],
    A * A + B * B =:= C * C
  ],
  First = hd(Triplets),
  io:format("~p~n", [First]).

