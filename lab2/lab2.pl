% Zinkov Mikhail, var 8

% Определение последнего элемента в списке
% последний элемент - сам элемент
last_element([X], X).
last_element([_|Tail], Last) :- last_element(Tail, Last).

% Принадлежность элемента списку
% элемент принадлежит списку, если он является головой списка
member(Element, [Element|_]).
member(Element, [_|Tail]) :- member(Element, Tail).

% ?- last_element([a, b, c, d], X).
% X = d

% ?- last_element([a], a).
% true

% ?- member(c, [a, b, c, d]).
% true