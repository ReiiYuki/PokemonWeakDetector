:- module(pokerule, []).

beat(P,M,E):-pokefact:pokemon(P),pokefact:have_move(P,M),
  movefact:move(M),movefact:have_type(M,T),
  pokefact:have_type(E,T1),
  typefact:effective(T,T1,R),R>=2,
  stronger(P,E).

stronger(A,B):-statfact:have_base_stat(A,Stat1),statfact:have_base_stat(B,Stat2),(Stat1-Stat2)>=50.
