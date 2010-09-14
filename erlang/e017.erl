-module(e017).
-export([main/1, start/0]).

-define(L1, ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]).
-define(L2, ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]).

digits(Number) ->
  digits(Number, []).

digits(0, L) ->
  L;
digits(Number, L) ->
  digits(Number div 10, [Number rem 10 | L]).

number_in_words(N) ->
  if
    N < 20 ->
      lists:nth(N, ?L1);
    N < 100 ->
      [A, B] = digits(N),
      if
        B =:= 0 -> lists:nth(A - 1, ?L2);
        true    -> lists:nth(A - 1, ?L2) ++ " " ++ number_in_words(B)
      end;
    N < 1000 ->
      [A, B, C] = digits(N),
      lists:nth(A, ?L1) ++ " hundred" ++
      if
        B + C > 0 -> " and " ++ number_in_words(B * 10 + C);
        true -> ""
      end;
    N < 10000 ->
      [A, B, C, D] = digits(N),
      lists:nth(A, ?L1) ++ " thousand" ++
      if
        B + C + D > 0 -> " and " ++ number_in_words(B * 100 + C * 10 + D);
        true -> ""
      end
  end.

main(_) ->
  start().

start() ->
  Words = lists:map(
    fun(E) -> number_in_words(E) end,
    lists:seq(1, 1000)
  ),
  NumberOfLetters = length(re:replace(lists:flatten(Words), " ", "", [{return, list}, global])),
  io:format("~p~n", [NumberOfLetters]).

