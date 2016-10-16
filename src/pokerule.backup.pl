:- module(pokerule, []).

pokerule:beat(P,M,E):-
  pokefact:pokemon(P),
  pokefact:have_move(P,M),
  movefact:move(M),
  movefact:have_type(M,T),
  pokefact:have_type(E,T1),
  typefact:effective(T,T1,R),
  R>=2,
  stronger(P,E).

pokerule:stronger(A,B):-
  same_level(A,B),
  resistance(A,B).

pokerule:same_level(A,B) :-
  statfact:have_base_stat(A,Stat1),
  statfact:have_base_stat(B,Stat2),
  ( (Stat1-Stat2)>=50 ; (Stat1-Stat2)=<50 ).

pokerule:best_move(P,M1,T1) :-
    (pokefact:pokemon(P),
    pokefact:have_move(P,M1),
    powerfact:power(M1,D1),
    movefact:have_type(M1,T1)),
    not(
    (pokefact:have_move(P,M2),
    movefact:have_type(M2,T2),
<<<<<<< HEAD
    powerfact:power(M2,D2),
    T1=T2,
    D2>D1)
    ).


  % (pokefact:have_move(P,M1),same_move_type(M1,M2),move(M2)),
  % not(
  %   (
  %   pokefact:have_move(P,M1)
  %     (move(M2),
  %     more_power(M2,M1))
  %     ).
%
pokerule:more_power(M1,M2):- powerfact:power(M1,D1),
  powerfact:power(M2,D2),
  D1>D2.
=======
    powerfact:power(M2,D2),T1=T2,
    D1>D2)
    ).
>>>>>>> 6b9d8eb7f54000a9b21ca3cd5845e784d20639bc

pokerule:same_move_type(M1,M2):-
  movefact:have_type(M1,T1),
  movefact:have_type(M2,T2),
  T1=T2.

pokerule:resistance(A,B):-
  pokefact:pokemon(A),
  pokefact:have_type(A,T1),
  pokefact:pokemon(B),
  pokefact:have_type(B,T2),
  typefact:effective(T2,T1,R),
  R = 0.5.
