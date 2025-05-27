% Zinkov Mikhail, var 8

% Рекурсивное определение (декларативный подход)
last_element([X], X).
last_element([_ | Tail], Last) :-
    last_element(Tail, Last).

% Оптимизированная версия
last_element_tail(List, Last) :-
    last_element_tail(List, Last, []).

last_element_tail([Last], Last, _).  % Базовый случай: последний элемент найден.
last_element_tail([_ | Tail], Last, Acc) :-
    last_element_tail(Tail, Last, [_ | Acc]).


% Найти последний элемент списка [a, b, c].
% ?- last_element([a, b, c], X)
% X = c

% Проверить, является ли d последним элементом списка [a, b, d].
% ?- last_element([a, b, d], d)
% true

% Найти все возможные списки, где последний элемент — 3.
% ?- last_element(List, 3)
% List = [3]
% List = [_, 3]
% List = [_, _, 3]
% List = [_, _, _, 3]
% List = [_, _, _, _, 3]
% List = [_, _, _, _, _, 3]