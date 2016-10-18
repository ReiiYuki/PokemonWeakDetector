:- module(pokerule, []).

% Pokemon P have the best move M beat Pokemon Enemey E if Pokemon P have Move M ,Move M have Type
% T1 and Pokemon Enemey E have Type T2 and T1 effective T2 with R >= 2.
pokerule:beat(P,M,E):-
  pokefact:pokemon(P),
  best_move(P,M),
  movefact:have_type(M,T1),
  pokefact:have_type(E,T2),
  pokefact:have_type(E,T4),
  pokefact:have_type(P,T3),
  (effective_ratio(T1,[T2,T4],R),not(T2=T4)),
  R>=2,can_fight(P,E),resistance(T3,T2).

% % pokemon A storger than pokemon B  if A have can fight with B and A resistance of B.
% pokerule:stronger(A,B):-
%   can_fight(A,B),
%   resistance(A,B).

% pokemon A can fight pokemon B if base status of pokemon B have base status lower or equal A 50.
pokerule:can_fight(A,B) :-
  statfact:have_base_stat(A,Stat1),
  statfact:have_base_stat(B,Stat2),
  ((Stat2 =< Stat1 + 50 )).


% pokemon P have best move if pokemon P have Move M1 that not have other move and type more power than M1.
pokerule:best_move(P,M1) :-
    (
    pokefact:have_move(P,M1),attack_move(M1)
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
  not(D=0).

%  Move M1 same move type M2  if have Move M1 have Type T1  and Move M2 have Type T2 and Type T1 = Type T2.
pokerule:same_move_type(M1,M2):-
  movefact:have_type(M1,T1),
  movefact:have_type(M2,T2),
  T1=T2.

pokemon_type(_,[]).
pokemon_type(P,[Type1 | Type2]):-
  pokefact:have_type(P,Type1),pokefact:have_type(P,Type2).


% ppokemon A resistance pokemon B if pokemon A have type T1 ,pokemon B have type T2 and T2 effective T1 with ratio <= 0.5
pokerule:resistance(T1,T2):-
  typefact:effective(T2,T1,R),
  R =< 1.
  effective_ratio(_, [], 1.0).
  effective_ratio(Attack, [Defense | Defense2], Ratio) :-
  not(Defense = Defense2),
  typefact:effective(Attack, Defense, Ratio1),
  effective_ratio(Attack, Defense2, Ratio2),
  Ratio is Ratio1 * Ratio2.

% :- module(pokerule, []).
%
% % Pokemon P have the best move M beat Pokemon Enemey E if Pokemon P have Move M ,Move M have Type
% % T1 and Pokemon Enemey E have Type T2 and T1 effective T2 with R >= 2.
% pokerule:beat(P,M,E):-
%   pokefact:pokemon(P),
%   best_move(P,M),
%   movefact:have_type(M,T1),
%   pokefact:have_type(E,T2),
%   typefact:effective(T1,T2,R),
%   R>=2,movefact:power(M,Power),Power>0,
%   can_fight(P,E).
%
% % pokemon A storger than pokemon B  if A have can fight with B and A resistance of B.
% pokerule:stronger(A,B):-
%   can_fight(A,B),
%   resistance(A,B).
%
% % pokemon A can fight pokemon B if base status of pokemon B have base status lower or equal A 50.
% pokerule:can_fight(A,B) :-
%   statfact:have_base_stat(A,Stat1),
%   statfact:have_base_stat(B,Stat2),
%   ((Stat2 =< Stat1 + 50 )).
%
%
% % pokemon P have best move if pokemon P have Move M1 that not have other move and type more power than M1.
% pokerule:best_move(P,M1) :-
%     (
%     pokefact:have_move(P,M1)
%     ),
%     not(
%       (
%         pokefact:have_move(P,M2),
%         more_power(M2,M1),
%         same_move_type(M1,M2)
%       )
%     ).
%
% % Move M1 more power than Move M2 if Move M1 and M1 have power Damage is P1 , M2 have damage D2 and D1 > D2.
% pokerule:more_power(M1,M2):-
%   powerfact:power(M1,D1),
%   powerfact:power(M2,D2),
%   D1>D2.
%
% pokerule:attack_move(M):-
%   powerfact:power(M,D),(D>0).
%
% %  Move M1 same move type M2  if have Move M1 have Type T1  and Move M2 have Type T2 and Type T1 = Type T2.
% pokerule:same_move_type(M1,M2):-
%   movefact:have_type(M1,T1),
%   movefact:have_type(M2,T2),
%   T1=T2.
%
% % Type T1 have resitance Type T2 if Type T1 effect T2 with ratio R <= 0.5
% pokerule:resistance(T1,T2):-
%   typefact:effective(T2,T1,R),
%   R =< 0.5.
%
% % :- module(pokerule, []).
% %
% % % Pokemon P have the best move M beat Pokemon Enemey E if Pokemon P have Move M ,Move M have Type
% % % T1 and Pokemon Enemey E have Type T2 and T1 effective T2 with R >= 2.
% % pokerule:beat(P,M,E):-
% %   pokefact:pokemon(P),
% %   best_move(P,M),
% %   movefact:have_type(M,T1),
% %   pokefact:have_type(E,T2),
% %   pokefact:have_type(E,T3),not(T2=T3),
% %   effective_ratio(T1,[T2,T3],R),
% %   R>=2,resistance(T1,T2),
% %   can_fight(P,E).
% %
% % % pokemon A storger than pokemon B  if A have can fight with B and A resistance of B.
% % pokerule:stronger(A,B):-
% %   can_fight(A,B).
% %
% %
% %
% % % pokemon A can fight pokemon B if base status of pokemon B have base status lower or equal A 50.
% % pokerule:can_fight(A,B) :-
% %   statfact:have_base_stat(A,Stat1),
% %   statfact:have_base_stat(B,Stat2),
% %   ((Stat2 =< Stat1 + 50 )).
% %
% %
% % % pokemon P have best move if pokemon P have Move M1 that not have other move and type more power than M1.
% % pokerule:best_move(P,M1) :-
% %     (
% %     pokefact:have_move(P,M1)
% %     ),
% %     not(
% %       (
% %         pokefact:have_move(P,M2),
% %         more_power(M2,M1),
% %         same_move_type(M1,M2)
% %       )
% %     ).
% %
% % % Move M1 more power than Move M2 if Move M1 and M1 have power Damage is P1 , M2 have damage D2 and D1 > D2.
% % pokerule:more_power(M1,M2):-
% %   movefact:move(M1),
% %   movefact:move(M2),
% %   powerfact:power(M1,D1),
% %   powerfact:power(M2,D2),
% %   D1>D2.
% %
% % pokerule:attack_move(M):-
% %   powerfact:power(M,D),
% %   not(D=0).
% %
% % %  Move M1 same move type M2  if have Move M1 have Type T1  and Move M2 have Type T2 and Type T1 = Type T2.
% % pokerule:same_move_type(M1,M2):-
% %   movefact:have_type(M1,T1),
% %   movefact:have_type(M2,T2),
% %   T1=T2.
% %
% % % ppokemon A resistance pokemon B if pokemon A have type T1 ,pokemon B have type T2 and T2 effective T1 with ratio <= 0.5
% % pokerule:resistance(T1,T2):-
% %   typefact:effective(T2,T1,R),
% %   R =< 0.5.
% %
% % effective_ratio(_, [], 1.0).
% % effective_ratio(Attack, [Defense | Defense2], Ratio) :-
% % not(Defense = Defense2),
% % typefact:effective(Attack, Defense, Ratio1),
% % effective_ratio(Attack, Defense2, Ratio2),
% % Ratio is Ratio1 * Ratio2.
