:- initialization(main).

% Reuse the same knowledge base from 2(c)
owns(jack, fiat).
owns(john, opel).

car(fiat).
car(opel).

can_drive(X) :- owns(X, Y), car(Y).

exceeds_speed_limit(jack).
fasten_seat_belt(john).

driver(X) :- can_drive(X).

breaks_traffic_rules(X) :- can_drive(X), exceeds_speed_limit(X).
breaks_traffic_rules(X) :- can_drive(X), \+ fasten_seat_belt(X).

gets_fine(X) :- breaks_traffic_rules(X).

bad_driver(X) :- gets_fine(X).
good_driver(X) :- \+ gets_fine(X).

% Main function to prove Jack is a bad driver & John is a good driver
main :- 
    write('Knowledge base loaded successfully!'), nl,
    (bad_driver(jack) -> write('Jack is a bad driver: true'), nl ; write('Jack is a bad driver: false'), nl),
    (good_driver(john) -> write('John is a good driver: true'), nl ; write('John is a good driver: false'), nl).




