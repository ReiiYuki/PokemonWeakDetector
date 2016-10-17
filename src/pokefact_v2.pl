:- module(pokerule, []).

% Pokemon P have the best move M beat Pokemon Enemey E if Pokemon P have Move M ,Move M have Type
% T1 and Pokemon Enemey E have Type T2 and T1 effective T2 with R >= 2.
pokerule:beat(P,M,E):-
  pokefact:pokemon(P),
  best_move(P,M),
  movefact:have_type(M,T1),
  pokefact:have_type(E,T2),
  pokefact:have_type(E,T3),not(T2=T3),
  super_effective(T1,[T2,T3]),attack_move(M),
  stronger(P,E).

super_effective(ATT_T1,[DEF_T1,DEF_T2]):-
  effective_ratio_defense(ATT_T1,[DEF_T1,DEF_T2],R),R>=2.

% pokemon A storger than pokemon B  if A have can fight with B and A resistance of B.
pokerule:stronger(A,B):-
  can_fight(A,B),
  resistance(A,B).

% pokemon A can fight pokemon B if base status of pokemon B have base status lower or equal A 50.
pokerule:can_fight(A,B) :-
  statfact:have_base_stat(A,Stat1),
  statfact:have_base_stat(B,Stat2),
  ((Stat2 =< Stat1 + 50 )).


% pokemon P have best move if pokemon P have Move M1 that not have other move and type more power than M1.
pokerule:best_move(P,M1) :-
    (
    pokefact:have_move(P,M1)
    ),
    not(
      (
        pokefact:have_move(P,M2),
        more_power(M2,M1),
        same_move_type(M1,M2)
      )
    ).

% Move M1 more power than Move M2 if Move M1 and M1 have power Damage is P1 , M2 have damage D2 and D1 > D2.
pokerule:more_power(M1,M2):-
  movefact:move(M1),
  movefact:move(M2),
  powerfact:power(M1,D1),
  powerfact:power(M2,D2),
  D1>D2.

pokerule:attack_move(M):-
  powerfact:power(M,D),
  (D>0).

%  Move M1 same move type M2  if have Move M1 have Type T1  and Move M2 have Type T2 and Type T1 = Type T2.
pokerule:same_move_type(M1,M2):-
  movefact:have_type(M1,T1),
  movefact:have_type(M2,T2),
  T1=T2.

% ppokemon A resistance pokemon B if pokemon A have type T1 ,pokemon B have type T2 and T2 effective T1 with ratio <= 0.5
pokerule:resistance(A,B):-
  pokefact:pokemon(A),
  pokefact:have_type(A,T1),
  pokefact:pokemon(B),
  pokefact:have_type(B,T2),
  typefact:effective(T2,T1,R),
  R =< 0.5.


  effective_ratio_defense(_, [], 1.0).
  effective_ratio_defense(Attack, [Defense | Defense2], Result) :-
  not(Defense = Defense2),
  typefact:effective(Attack, Defense, Result1),
  effective_ratio_defense(Attack, Defense2, Result2),
  Result is Result1 * Result2.

% effective_ratio_defense(ground,[grass,poison],R).
