:- module(pokerule, []).

pokerule:beat(P,M,E):-pokefact:pokemon(P),pokefact:have_move(P,M),
  movefact:move(M),movefact:have_type(M,T),
  pokefact:have_type(E,T1),
  typefact:effective(T,T1,R),R>=2,
  stronger(P,E).

% pokerule:stronger(A,B):-

pokerule:same_level(A,B) :- statfact:have_base_stat(A,Stat1),
  statfact:have_base_stat(B,Stat2),
  ((Stat1-Stat2)>=50 ; (Stat1-Stat2)=<50).

% pokerule:best_move(P,M1) :-
%   (pokefact:have_move(P,M1)),(pokefact:have_move(P,M2)),
%   not(more_power(M2,M1)),
%   (M1\=M2).
%
% pokerule:more_power(M1,M2):- powerfact:power(M1,D1),
%   powerfact:power(M2,D2),
%   D1>D2,
%   same_move_type(M1,M2).
%
% pokerule:same_move_type(M1,M2):-
%   movefact:have_type(M1,T1),movefact:have_type(M2,T2),T1=T2.

pokerule:all_power(D,P) :-
  pokefact:have_move(P,M),
  powerfact:power(M,D).

pokerule:more_power(D,P) :-
  pokefact:have_move(P,M),
% pokerule:max_power(Max,P) :-
%   pokefact:pokemon(P),pokefact:have_move(P,M),powerfact:power(M,D),
%   accMax(D,0,Max).
