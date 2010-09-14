% http://projecteuler.net/index.php?section=problems&id=100
% 
% If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.
% 
% The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.
% 
% By finding the first arrangement to contain over 10^(12) = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.
-module(e100).
-export([start/0, main/1]).
-compile(export_all).

% Helpful resource for this problem:
% http://www.alpertron.com.ar/QUAD.HTM
% X0 = 1
% Y0 = 1
% 
% Xn+1 = P Xn + Q Yn + K
% Yn+1 = R Xn + S Yn + L
% 
% P = 3
% Q = 2
% K = -2
% R = 4
% S = 3
% L = -3

-define(P, 3).
-define(Q, 2).
-define(K, -2).
-define(R, 4).
-define(S, 3).
-define(L, -3).
-define(MAX, 1000000000000).

find_solution(X, Y) ->
  if
    Y > ?MAX -> X;
    true -> find_solution(3 * X + 2 * Y -2, 4 * X + 3 * Y - 3)
  end.

main(_) -> start().

start() ->
  io:format("~p~n", [find_solution(1, 1)]).

