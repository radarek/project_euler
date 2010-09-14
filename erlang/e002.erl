-module(e002).
-export([main/1, start/0]).

fib_seq(N) ->
  fib_seq(1, 1, 0, N).

fib_seq(A, _B, N, N) ->
  A;
fib_seq(A, B, I, N) ->
  fib_seq(B, A + B, I + 1, N).

fib_list(MaxValue) ->
  fib_list(1, MaxValue, []).

fib_list(Index, MaxValue, L) ->
  Next = fib_seq(Index),
  case Next =< MaxValue of
    true  -> fib_list(Index + 1, MaxValue, [Next | L]);
    false -> lists:reverse(L)
  end.

main(_) ->
  start().

start() ->
  Sum = lists:sum(lists:filter(fun(E) -> E rem 2 =:= 0 end, fib_list(4000000))),
  io:format("~p~n", [Sum]).

