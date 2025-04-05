:- initialization(main).

% Facts
man(marcus).
pompiean(marcus).
ruler(caesar).

% Rules
roman(X) :- pompiean(X).
person(X) :- man(X).

% Explicit loyalty facts (Marcus is NOT in this list)
loyalto(john, caesar). % Example: John is loyal to Caesar

% People only try to assassinate rulers they are not loyal to
tried_to_assassinate(X, Y) :- person(X), ruler(Y), \+ loyalto(X, Y).

% Marcus tried to assassinate Caesar
tried_to_assassinate(marcus, caesar).

% All Romans either are loyal to Caesar or hate him
hates(X, caesar) :- roman(X), \+ loyalto(X, caesar).

% Main function to confirm the program loads successfully
main :- 
    write('Knowledge base loaded successfully!'), nl,
    (hates(marcus, caesar) -> write('Marcus hates Caesar: true'), nl ; write('Marcus hates Caesar: false'), nl).
    
    
    