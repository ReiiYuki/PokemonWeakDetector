% test server.
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- use_module(library(http/http_json)).

:- http_handler(root(.),handle,[]).

server(Port) :-
   http_server(http_dispatch,[port(Port)]).

handle(Request) :-
   format(user_output,"I'm here~n",[]),
   http_read_json(Request, DictIn,[json_object(term)]),
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"DictIn is: ~p~n",[DictIn]),
   DictOut=DictIn,
   reply_json(DictOut).
