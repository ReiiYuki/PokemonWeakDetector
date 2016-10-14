:- use_module(pokefact,[]).
:- use_module(movefact,[]).
:- use_module(typefact,[]).

effective_ratio_defense(_, [], 1.0).
effective_ratio_defense(Attack, [Defense | Tail], Result) :-
    typefact:effective(Attack, Defense, Result1),
    effective_ratio_defense(Attack, Tail, Result2),
    Result is Result1 * Result2.
    
# testing ท่าที่ charmander ชนะ bulbasuar rate >= 2
# pokefact:have_move(charmander,X),movefact:have_type(X,TYPE),pokefact:have_type(bulbasaur,TYPE_E1),pokefact:have_type(bulbasaur,TYPE_E2),not(TYPE_E1=TYPE_E2),effective_ratio_defense(TYPE,[TYPE_E1,TYPE_E2],R),R>=2.
