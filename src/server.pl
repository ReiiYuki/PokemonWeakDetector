
:- module(server,[]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- use_module(library(http/http_json)).

:- http_handler(root(.),handle,[]).

server(Port) :-
   http_server(http_dispatch,[port(Port)]).

handle(Request) :-
   http_read_json_dict(Request, DictIn,[json_object(term)]),
   % pokerule:beat(P,M,DictIn.pokemon),
   % format(user_output,"Pokemon is: ~p~n",[P]),
   % format(user_output,"Move is: ~p~n",[M]),
   DictOut=DictIn,
   reply_json(DictOut).
