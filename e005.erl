-module(e005).
-export([main/1, start/0]).

divisible_by_all(N, Dividers) ->
  lists:all(
    fun(E) ->
        N rem E =:= 0
    end,
    Dividers
  ).

find_smallest_number_divisible_by(Dividers) ->
  find_smallest_number_divisible_by(1, Dividers).

find_smallest_number_divisible_by(N, Dividers) ->
  case divisible_by_all(N, Dividers) of
    true  -> N;
    false -> find_smallest_number_divisible_by(N + 1, Dividers)
  end.

main(_) ->
  start().

start() ->
  io:format("~p~n", [find_smallest_number_divisible_by(lists:seq(2, 20))]).

