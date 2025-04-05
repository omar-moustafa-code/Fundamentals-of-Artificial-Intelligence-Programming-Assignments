:- initialization(main).

% Facts: Ownership of cars
owns(jack, fiat).
owns(john, opel).

% Facts: Cars
car(fiat).
car(opel).

% Rule: If someone owns a car, they can drive
can_drive(X) :- owns(X, Y), car(Y).

% Facts: Driving behavior
exceeds_speed_limit(jack).
fasten_seat_belt(john).

% Rule: Every car owner is a driver
driver(X) :- can_drive(X).

% Rule: Drivers break traffic rules if they exceed speed limit OR don't fasten seat belt
breaks_traffic_rules(X) :- can_drive(X), exceeds_speed_limit(X).
breaks_traffic_rules(X) :- can_drive(X), \+ fasten_seat_belt(X).

% Rule: Anyone who breaks traffic rules gets a fine
gets_fine(X) :- breaks_traffic_rules(X).

% Rule: Bad drivers get fines
bad_driver(X) :- gets_fine(X).

% Rule: Good drivers do not get fines
good_driver(X) :- \+ gets_fine(X).

% Main function just to confirm the knowledge base loads
main :- write('Knowledge base loaded successfully!'), nl.


