%Ввод списка
read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1, read_list(N1,Tail).
%Вывод списка
write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list([Tail]).
%Рекурсия вниз
sum_list_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([Head|Tail],S,Sum):-S1 is S+Head,sum_list_down(Tail,S1,Sum).

pr_4_2:-write("Kolvo"),nl,read(N),read_list(N,List),
        sum_list_down(List,Sum),write(Sum).
%Рекурсия вверх
sum_list_up([],0):-!.
sum_list_up([Head|Tail],Sum):-sum_list_up([Tail],Sum1), Sum is Sum1+Head.

list_el_numb(List,Elem,Number):-list_el_numb(List,Elem,0,Number).
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):-I1 is I+1,list_el_numb(Tail,Elem,I1,Number).

pr_4_4:-write("Kolvo"),nl,read(N),write("List:"),nl,read_list(N,List),write("Elem"),nl,read(Elem),list_el_numb(List,Elem,Number),write("Number = "),write(Number),!.
pr_4_4:-write("Nema takogo").
%Task 9
in_list([El|_],El).
in_list([_|Tail],El):-in_list(Tail,El).
%Попарное произведение чисел
umnozh:-read_list(3,List),in_list(List,X),in_list(List,Y),Z is X*Y,write(Z),nl,fail.

append1([],List2,List2).%отсутствие ! дает возможность перебора например
%append1(X,Y,[1,2,3,4]).
append1([H|Tail1],List2,[H|Tail2]):-append1(Tail1,List2,Tail2).
%Task 5
find_elem(List,Num):-find_elem(List,0,Num).
find_elem([],_,_):-write("Nomer bol`she dliny spiska"),!.
find_elem([H|_],Count,Count):-write(H),!.
find_elem([_|T],Count,Num):-Count1 is Count+1,find_elem(T,Count1,Num).