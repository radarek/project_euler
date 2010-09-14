-module(e003).
-export([main/1, start/0]).

max_factor(N) ->
  max_factor(2, 2, N).

max_factor(_I, Pf, 1) ->
  Pf;
max_factor(I, Pf, N) ->
  case N rem I =:= 0 of
    true  -> max_factor(I, I, N div I);
    false -> max_factor(I + 1, Pf, N)
  end.

main(_) ->
  start().

start() ->
  Max = max_factor(600851475143),
  io:format("~p~n", [Max]).

