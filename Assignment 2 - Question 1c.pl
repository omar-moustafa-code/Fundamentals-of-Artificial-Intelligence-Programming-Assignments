:- initialization(main).

man(marcus).
pompiean(marcus).
roman(X) :- pompiean(X).
ruler(caesar).
person(X) :- man(X).

% Everyone is loyal to someone (assumption)
loyalto(X, _) :- person(X).

% People only try to assassinate rulers they are not loyal to
tried_to_assassinate(X, Y) :- person(X), ruler(Y), \+ loyalto(X, Y).

% Marcus tried to assassinate Caesar
tried_to_assassinate(marcus, caesar).

% All Romans are either loyal to Caesar or hate him
hates(X, caesar) :- roman(X), \+ loyalto(X, caesar).

main :- 
    write('Knowledge base loaded successfully!'), nl.