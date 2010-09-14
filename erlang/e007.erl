-module(e007).
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

n_primes(N) ->
  n_primes(2, N, 0, []).

n_primes(_I, N, N, L) ->
  lists:reverse(L);
n_primes(I, N, Size, L) ->
  case number_is_prime(I) of
    true  -> n_primes(I + 1, N, Size + 1, [I | L]);
    false -> n_primes(I + 1, N, Size, L)
  end.

main(_) ->
  start().

start() ->
  Primes = n_primes(10001),
  io:format("~p~n", [lists:last(Primes)]).

