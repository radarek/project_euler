-module(e020).
-export([main/1, start/0]).

digits(Number) ->
  digits(Number, []).

digits(0, L) ->
  L;
digits(Number, L) ->
  digits(Number div 10, [Number rem 10 | L]).

fac(0) ->
  1;
fac(N) ->
  N * fac(N - 1).

main(_) ->
  start().

start() ->
  io:format("~p~n", [lists:sum(digits(fac(100)))]).

