-module(e030).
-export([main/1, start/0]).

pow(1, _M) ->
  1;
pow(_N, 0) ->
  1;
pow(N, M) ->
  N * pow(N, M - 1).

digits(Number) ->
  digits(Number, []).

digits(0, L) ->
  L;
digits(Number, L) ->
  digits(Number div 10, [Number rem 10 | L]).

main(_) ->
  start().

start() ->
  Numbers = lists:filter(
    fun(E) ->
      E =:= lists:foldl(fun(Elem, Acc) -> Acc + pow(Elem, 5) end, 0, digits(E))
    end,
    lists:seq(2, pow(9, 5) * 6)
  ),
  io:format("~p~n", [lists:sum(Numbers)]).
