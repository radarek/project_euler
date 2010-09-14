-module(e016).
-export([main/1, start/0]).

-compile(export_all).

digits(Number) ->
  digits(Number, []).

digits(0, L) ->
  L;
digits(Number, L) ->
  digits(Number div 10, [Number rem 10 | L]).


% N ^ M
pow(_N, 0) ->
  1;
pow(1, _M) ->
  1;
pow(N, M) ->
  N * pow(N, M - 1).

main(_) ->
  start().

start() ->
  io:format("~p~n", [lists:sum(digits(pow(2, 1000)))]).

