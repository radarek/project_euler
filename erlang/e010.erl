-module(e010).
-export([main/1, start/0]).

number_is_prime(2) ->
  true;
number_is_prime(3) ->
  true;
number_is_prime(N) when N < 2 ->
  false;
number_is_prime(N) ->
  PossibleDividers = lists:seq(2, trunc(math:sqrt(N))),
  lists:all(
    fun(E) ->
        N rem E =/= 0
    end,
    PossibleDividers
  ).

main(_) ->
  start().

start() ->
  Primes = lists:filter(fun number_is_prime/1, lists:seq(2, 1999999)),
  Sum = lists:sum(Primes),
  io:format("~p~n", [Sum]).

