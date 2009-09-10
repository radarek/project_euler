-module(e021).
-export([main/1, start/0]).

proper_divisors(0) ->
  [];
proper_divisors(1) ->
  [];
proper_divisors(N) ->
  lists:filter(
    fun(E) -> N rem E =:= 0 end,
    lists:seq(1, N - 1)
  ).

d(N) ->
  lists:sum(proper_divisors(N)).

main(_) ->
  start().

start() ->
  AmicablePairs = [[A, B] || A <- lists:seq(1, 9999), B <- [d(A)], A =/= B, A =:= d(B)],
  Sum = lists:sum(sets:to_list(sets:from_list(lists:flatten(AmicablePairs)))),
  io:format("~p~n", [Sum]).

