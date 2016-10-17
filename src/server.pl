
:- module(server,[]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_cors)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(option)).
:- use_module(library(settings)).
:- http_handler(root(.),handle,[]).

:- set_setting(http:cors, [*]).
server(Port) :-
   http_server(http_dispatch,[port(Port)]).

:- json_object
        poke(pokemon:text, move:text).
handle(Request) :-
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"Request2 is: ~p~n",[]),
   cors_enable,
   http_read_json_dict(Request, DictIn,[json_object(term)]),
   format(user_output,"I'm here~n",[]),
   term_string(Pokemon,DictIn.pokemon),
   findall(poke(P,M),beat(P,M,Pokemon),L),
   prolog_to_json(L,J),
   format(user_output,"Pokemons are: ~p~n",[J]),
   DictOut=J,
   reply_json(DictOut).

beat(P,M,E) :-
   pokerule:beat(P,M,E).
