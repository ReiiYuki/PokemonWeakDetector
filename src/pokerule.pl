:- module(pokerule, []).

pokerule:beat(P,M,E):-pokefact:pokemon(P),pokefact:have_move(P,M),
  movefact:move(M),movefact:have_type(M,T),
  pokefact:have_type(E,T1),
  typefact:effective(T,T1,R),R>=2,
  stronger(P,E).

% pokerule:stronger(A,B):-statfact:have_base_stat(A,Stat1),statfact:have_base_stat(B,Stat2),not(A=B),((Stat1-Stat2)>=50);(Stat2-Stat1)).

resistance(A,B):-pokefact:pokemon(A),
  pokefact:have_type(A,T1),
  pokefact:pokemon(B),
  pokefact:have_type(B,T2),
  typefact:effective(T2,T1,R),
  R = 0.5.
