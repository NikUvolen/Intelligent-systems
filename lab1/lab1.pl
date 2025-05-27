% Zinkov Mikhail, var 8

flight(amtrak, new_york, boston, train).
flight(transit, new_york, princeton, train).
flight(amtrak, boston, portland, train).
flight(greyhound, boston, portland, bus).
flight(amtrak, new_york, washington, train).
flight(peoples, new_york, washington, plane).
flight(peoples, burlington, new_york, plane).

competitors(Company1, Company2) :-
    flight(Company1, From, To, _),
    flight(Company2, From, To, _),
    Company1 \= Company2.

can_travel(From, To) :-
    flight(_, From, To, _).
can_travel(From, To) :-
    flight(_, From, Intermediate, _),
    can_travel(Intermediate, To).

route_companies(From, To, Company) :-
    flight(Company, From, To, _).

% requests:
% 1. Являются ли Амтpак и Пиплз конкуpентами?
% ?- competitors(amtrak, peoples).
% True

% 2. Какие компании дают возможность путешествовать из Hью-Йоpка в Вашингтон?
% ?- route_companies(new_york, washington, Company).
% Company = amtrak ;
% Company = peoples.

% 3. Можно ли путешествовать из Биpлингтона в Поpтленд?
% ?- can_travel(burlington, portland).
% True (Burlington -> New York -> Boston -> Portland)

% 4. Опpеделить всех конкуpентов.
% ?- competitors(Company1, Company2).
% Company1 = amtrak,
% Company2 = greyhound
% 
% Company1 = greyhound,
% Company2 = amtrak
% 
% Company1 = amtrak,
% Company2 = peoples
% 
% Company1 = peoples,
% Company2 = amtrak
% 
% False.