-module(e015).
-export([main/1, start/0]).

-compile(export_all).

routes(Rows, Cols) ->
  routes(Rows, Cols, 0, 0).

routes(Rows, Cols, Rows, Cols) ->
  1;
routes(Rows, _Cols, Rows, _X) ->
  1;
routes(_Rows, Cols, _Y, Cols) ->
  1;
routes(Rows, Cols, Y, X) ->
  case get({Rows, Cols, Y, X}) of
    undefined ->
      Res = routes(Rows, Cols, Y + 1, X) + routes(Rows, Cols, Y, X + 1),
      put({Rows, Cols, Y, X}, Res),
      Res;
    Res ->
      Res
  end.

main(_) ->
  start().
  
start() ->
  io:format("~p~n", [routes(20, 20)]).
