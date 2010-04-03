% http://projecteuler.net/index.php?section=problems&id=56
% 
% A googol (10^(100)) is a massive number: one followed by one-hundred zeros; 100^(100) is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
% 
% Considering natural numbers of the form, a^(b), where a, b < 100, what is the maximum digital sum?
-module(e056).
-export([main/1, start/0]).

-compile(export_all).

digits(Number) -> digits(Number, []).

digits(0, L) -> L;
digits(Number, L) -> digits(Number div 10, [Number rem 10 | L]).

digits_sum(N) -> lists:sum(digits(N)).

pow(_, 0) -> 1;
pow(A, B) -> A * pow(A, B - 1).

main(_) -> start().

start() ->
  L = [pow(A, B) || A <- lists:seq(1, 100), B <- lists:seq(1, 100)],
  Max = lists:max(lists:map(fun(E) -> digits_sum(E) end, L)),
  io:format("~p~n", [Max]).

