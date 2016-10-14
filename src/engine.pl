:- use_module(pokefact,[]).
:- use_module(movefact,[]).
:- use_module(typefact,[]).

effective_ratio_defense(_, [], 1.0).
effective_ratio_defense(Attack, [Defense | Tail], Result) :-
    typefact:effective(Attack, Defense, Result1),
    effective_ratio_defense(Attack, Tail, Result2),
    Result is Result1 * Result2.
