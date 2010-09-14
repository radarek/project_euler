% http://projecteuler.net/index.php?section=problems&id=52
% 
% It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
% 
% Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
-module(e052).
-export([start/0, main/1]).

digits(Number) -> digits(Number, []).

digits(0, L) -> L;
digits(Number, L) -> digits(Number div 10, [Number rem 10 | L]).

is_solution(N) ->
  Digits = lists:sort(digits(N)),
  lists:all(fun(E) -> lists:sort(digits(E)) =:= Digits end, [2*N, 3*N, 4*N, 5*N, 6*N]).

find_solution() -> find_solution(1).
find_solution(N) ->
  case is_solution(N) of
    true -> N;
    false -> find_solution(N + 1)
  end.

main(_) -> start().

start() ->
  io:format("~p~n", [find_solution()]).

