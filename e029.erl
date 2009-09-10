-module(e029).
-export([main/1, start/0]).

pow(_N, 0) ->
  1;
pow(1, _M) ->
  1;
pow(N, M) ->
  N * pow(N, M - 1).

main(_) ->
  start().

start() ->
  Length = length(
    sets:to_list(sets:from_list([pow(A, B) || A <- lists:seq(2, 100), B <- lists:seq(2, 100)]))
  ),
  io:format("~p~n", [Length]).

