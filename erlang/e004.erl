-module(e004).
-export([main/1, start/0]).

is_palindrom(N) ->
  Str = integer_to_list(N),
  Str =:= lists:reverse(Str).

main(_) ->
  start().

start() ->
  MaxPalindrom = lists:max([A * B || A <- lists:seq(100, 999), B <- lists:seq(A, 999), is_palindrom(A * B)]),
  io:format("~p~n", [MaxPalindrom]).

