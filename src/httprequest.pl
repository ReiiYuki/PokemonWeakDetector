:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

server(Port) :-
        http_server(http_dispatch,
                    [ port(Port)
                    ]).
:- http_handler(root(.), say_hi, []).

say_hi(_Request) :-
    reply_json_dict(json([a=999])).
