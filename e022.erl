-module(e022).
-export([main/1, start/0]).

to_lower(S) ->
  lists:map(fun char_to_lower/1, S).

char_to_lower(C) when C >= $A, C =< $Z ->
  C bxor $\s;
char_to_lower(C) ->
  C.

sort([]) ->
  [];
sort([Pivot | Rest]) ->
  {Left, Right} = lists:partition(
    fun(E) -> E =< Pivot end,
    Rest
  ),
  sort(Left) ++ [Pivot] ++ sort(Right).

name_score(Name) ->
  lists:sum(
    lists:map(
      fun(Letter) -> Letter - $a + 1 end,
      to_lower(Name)
    )
  ).

name_list_score(NameList) ->
  name_list_score(1, 0, NameList).

name_list_score(_I, Score, []) ->
  Score;
name_list_score(I, Score, [Name | Rest]) ->
  name_list_score(I + 1, I * name_score(Name) + Score, Rest).

main(_) ->
  start().

start() ->
  {ok, Data} = file:read_file("names.txt"),
  Names = string:tokens(binary_to_list(Data), ",\""),
  SortedNames = sort(Names),
  Score = name_list_score(SortedNames),
  io:format("~p~n", [Score]).

