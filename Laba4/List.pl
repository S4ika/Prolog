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
%Task 6
min_list_up([H],H):-!.
min_list_up([H|T],M):-min_list_up(T,M1),(H<M1->M is H;M is M1).
%Task 7
min_list_down([H|T],Min):-min_list_down([H|T],H,Min).
min_list_down([],M,M):-!.
min_list_down([H|T],M,Min):-H<M,M1 is H,min_list_down(T,M1,Min).
%Task 8
pr8:-write("Введите размер списка"),nl,read(N),write("Введите список : "),nl,read_list(N,List),write("Минимальный элемент в списке :"),nl,min_list_down(List,Min),write(Min).
%Task 10
my_reverse(List,Rlist):-my_reverse(List,Rlist,[]).
my_reverse([],Rlist,Rlist).
my_reverse([H|T],List,Rlist):-my_reverse(T,List,[H|Rlist]).
%Task 11
p([],_):-!.
p([Head|Tail],[HeadList|TailList]):-(Head is HeadList -> p(Tail,TailList);p([Head|Tail],TailList)).
%Task 12
del_el(List,Num):-del_el(List,Res,Num),write(Res).
del_el([_|T],T,0):-!.
del_el([H|T1],[H|T2],Num):-Num1 is Num-1,del_el(T1,T2,Num1).
%Task 13
del_same_el([],_,[]):-!.
del_same_el([H|T],El,End):-(H=:=El->del_same_el(T,El,End);End = [H|A],del_same_el(T,El,A)).
%Task 14
povtor_el([]):-!.
povtor_el([H|T]):-not(in_list(T,H)),povtor_el(T).
%Task 15
unique_list(List,Res):-unique_list(List,[],Res).
unique_list([],Res,Res):-!.
unique_list([H|T],List,Res):-not(in_list(List,H)),unique_list(T,[H|List],Res).
unique_list([H|T],List,Res):-in_list(List,H),unique_list(T,List,Res).
%Task 16
povtor_el(List,El):-povtor_el(List,El,0).
povtor_el([],_,Count):-write(Count),!.
povtor_el([H|T],El,Count):-H =:= El,Count1 is Count + 1,povtor_el(T,El,Count1).
povtor_el([H|T],El,Count):-H\=El,povtor_el(T,El,Count).
%Task 17
size_list(List,N):-size_list(List,0,N).
size_list([],Size,Size):-!.
size_list([_|T],Count,N):-Count1 is Count+1,size_list(T,Count1,N).

