:- use_module(pokefact,[]).
:- use_module(movefact,[]).
:- use_module(typefact,[]).
:- use_module(statfact,[]).
:- use_module(powerfact,[]).
:- use_module(pokerule,[]).
:- use_module(server,[]).

% :- initialization main.
% main:-
% 	write('Start Server'),
% 	server:server(9999).

%
% effective_ratio_defense(_, [], 1.0).
% effective_ratio_defense(Attack, [Defense | Tail], Result) :-
% not(Defense = Tail),
% typefact:effective(Attack, Defense, Result1),
% effective_ratio_defense(Attack, Tail, Result2),
% Result is Result1 * Result2.

% pokefact:have_move(charmander,X),movefact:have_type(X,TYPE),pokefact:have_type(bulbasaur,TYPE_E1),pokefact:have_type(bulbasaur,TYPE_E2),not(TYPE_E1=TYPE_E2),effective_ratio_defense(TYPE,[TYPE_E1,TYPE_E2],R),R>=2.

% movefact:have_type(dragon-tail,T),pokefact:have_type(abra,T1),effective(T,T1,R),R>=2.
% pokefact:pokemon(pikachu),
% pokefact:have_move(pikachu,ME),
% movefact:have_type(ME,TE),
% typefact:effective(TE,water,R),R=<1.
