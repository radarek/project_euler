-module(e036).
-export([main/1, start/0]).

decimal_to_binary(N) ->
  hd(io_lib:format("~.2B", [N])).

is_palindrom(L) ->
  L =:= lists:reverse(L).

is_palindromic(N) ->
  is_palindrom(integer_to_list(N)) andalso is_palindrom(decimal_to_binary(N)).

main(_) ->
  start().

start() ->
  PalindromicNumbers = lists:filter(fun is_palindromic/1, lists:seq(1, 999999)),
  Sum = lists:sum(PalindromicNumbers),
  io:format("~p~n", [Sum]).

