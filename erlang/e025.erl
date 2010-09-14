-module(e025).
-export([main/1, start/0]).

digits(Number) ->
  digits(Number, []).

digits(0, L) ->
  L;
digits(Number, L) ->
  digits(Number div 10, [Number rem 10 | L]).

fib(N) ->
  fib(0, 1, N).

fib(A, _B, 0) ->
  A;
fib(A, B, N) ->
  fib(B, A + B, N - 1).

find_first_with_1000_digits() ->
  find_first_with_1000_digits(1).

find_first_with_1000_digits(N) ->
  case length(digits(fib(N))) >= 1000 of
    true -> N;
    false -> find_first_with_1000_digits(N + 1)
  end.

main(_) ->
  start().

start() ->
  io:format("~p~n", [find_first_with_1000_digits()]).

