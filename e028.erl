% http://projecteuler.net/index.php?section=problems&id=28
% 
% Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
% 
% 21 22 23 24 25
% 20  7  8  9 10
% 19  6  1  2 11
% 18  5  4  3 12
% 17 16 15 14 13
% 
% It can be verified that the sum of the numbers on the diagonals is 101.
% 
% What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
-module(e028).
-export([start/0, main/1]).

-compile(export_all).

pow(_, 0) -> 1;
pow(A, B) -> A * pow(A, B - 1).

% 43 44 45 46 47 48 49
% 42 21 22 23 24 25 26
% 41 20  7  8  9 10 27
% 40 19  6  1  2 11 28
% 39 18  5  4  3 12 29
% 38 17 16 15 14 13 30
% 37 36 35 34 33 32 31
diagonalsum(1) -> 1;
diagonalsum(N) ->
  2 * (pow(N - 1, 2) + pow(N, 2) - N + 2) +
  diagonalsum(N - 2).

main(_) -> start().

start() ->
  io:format("~p~n", [diagonalsum(1001)]).
