-module(e031).
-export([main/1, start/0]).

coins() ->
  [1, 2, 5, 10, 20, 50, 100, 200].

combinations(0, _Coins) ->
  1;
combinations(Value, Coins) ->
  LessCoins = lists:filter(
    fun(E) -> E =< Value end,
    Coins
  ),
  lists:sum(lists:map(fun(E) -> combinations(Value - E, [X || X <- LessCoins, X >= E]) end, LessCoins)).

main(_) ->
  start().

start() ->
  io:format("~p~n", [combinations(200, coins())]).

