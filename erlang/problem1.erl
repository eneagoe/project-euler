#!/usr/bin/env escript

main(_) ->
  solve().

solve() ->
  RESULT = lists:sum([X || X <- lists:seq(1,999), (X rem 3 == 0) or (X rem 5 == 0)]),
  io:format("~p~n", [RESULT]).
