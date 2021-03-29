%Поиск не повторяющихся элементов
unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).
%Содержит
contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).
%Вывод строки
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).
%Считывание строки
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).
%Вхождение в список
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).
%Не входит в список
in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).
%Переворот строки
reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).
%Достаем из списка
remove_from_list(List, Elem, Result) :-
	remove_from_list(List, Elem, [], Result).

remove_from_list([IH|IT], Elem, TempLeft, Result) :-
	IH = Elem,
	reverse(TempLeft, TempLeftReverse),

	append(TempLeftReverse, IT, Result), !.

remove_from_list([IH|IT], Elem, TempLeft, Result) :-
	not(IH = Elem),
	remove_from_list(IT, Elem, [IH|TempLeft], Result).

b_a_p_rep([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p_rep(A,Perm):-unique_elems(A, Aun), in_list_exlude(Aun,El,Aun1),remove_from_list(A, El, A1),b_a_p_rep(A1,[El|Perm]).

build_all_perm_rep(File) :-
	tell(File),
	read_str(A,N),
	not(b_a_p_rep(A,[])),
	told.
	
%Task1
slova(Stroka,Num):-read_str(Stroka,Num,0),write_str(Stroka),write(','),write_str(Stroka),write(','),write_str(Stroka).

%Task2
schitaem_slova1(List,Num):-read_str(List,_,0),schitaem_slova1(List,0,Num).
schitaem_slova1([],A,Num):- Num is A + 1,!.
schitaem_slova1([H|T],A,Num):-(H = 32->A1 is A+1,schitaem_slova1(T,A1,Num);schitaem_slova1(T,A,Num)).

%Task 4
lnght(List,N):-lnght(List,0,N).
lnght([],A,A):-!.
lnght([_|T],A,N):-A1 is A+1,lnght(T,A1,N).
pr7_4:-read_str(Stroka,_),lnght(Stroka,N),((N =< 5) -> xn(Stroka,N);N1 is N-3,print_b_e(Stroka,0,N1,N)).
xn(_,0):-!.
xn([H|_],N):-N1 is N-1,write(H),nl,xn([H|_],N1).
print_b_e([H|T],A,NE,N):-A1 is A+1,A1=<3,write(H),nl,print_b_e(T,A1,NE,N).
print_b_e([_|T],A,NE,N):-A1 is A+1,A1>3,A1=<NE,print_b_e(T,A1,NE,N).
print_b_e([H|T],A,NE,N):-A1 is A+1,A1>NE,A1=<N,write(H),nl,print_b_e(T,A1,NE,N).

%Task 5
pr7_5:-read_str(Stroka,_),find_last_el(Stroka,Last),find_copy(Stroka,0,Last).
find_last_el([H|[]],H):-!.
find_last_el([_|T],Last):-find_last_el(T,Last).
find_copy([],_,_):-!.
find_copy([H|T],A,Last):-A1 is A+1,H =:= Last,write(A1),nl,find_copy(T,A1,Last).
find_copy([_|T],A,Last):-A1 is A+1,find_copy(T,A1,Last).

%Task 6
pr7_6:-read_str(Stroka,_),show_3_mult_el(Stroka,0).
show_3_mult_el([],_):-!.
show_3_mult_el([H|T],A):-A1 is A+1,A2 is A1 mod 3,A2 =:= 0,write(H),nl,show_3_mult_el(T,A1).
show_3_mult_el([_|T],A):-A1 is A+1,A2 is A1 mod 3,A2 \= 0,show_3_mult_el(T,A1).

%Task 7
pr7_7:-read_str(Stroka,_),find_p_m(Stroka,0,0,_,_).
find_p_m([],CountPaM,Count0,CountPaM,Count0):-write('Count + & - :'),write(CountPaM),nl,
 write('Count 0 after +&- :'),write(Count0),!.
find_p_m([H1|[H2|T]],A,B,CountPaM,Count0):-(H1 is 43;H1 is 45),
 A1 is A+1,(H2 = 48 ->B1 is B+1,find_p_m([H2|T],A1,B1,CountPaM,Count0);find_p_m([H2|T],A1,B,CountPaM,Count0)).

find_p_m([_|T],A,B,CountPaM,Count0):-find_p_m(T,A,B,CountPaM,Count0).

%Task 8
pr7_8:-read_str(Stroka,_),find_let(Stroka).
find_let([]):-write('Ничего не нашли'),!.
find_let([H|_]):-(H == 120;H==119),write('Первым нашли символ :'),put(H),!.
find_let([_|T]):-find_let(T).

%Task 9
pr7_9:-write('Введите 1ю строку'),nl,read_str(Str1,N1),write('Введите 2ю строку'),nl,read_str(Str2,N2),(N1>N2 ->Rzn is N1 - N2,print_razn_str(Str1,Rzn);Rzn is N2-N1,print_razn_str(Str2,Rzn)).
print_razn_str(_,0):-!.
print_razn_str(Stroka,Lnght):-write_str(Stroka),nl,Lnght1 is Lnght-1,print_razn_str(Stroka,Lnght1).

%Task 10
pr7_10:-read_str(Stroka,_),obr_str(Stroka,Newstr),write_str(Newstr).
obr_str([H1|[H2|[H3|T]]],Newstr):-H1 == 97,H2 == 98, H3 == 99,Newstr = [119,119,119|T],!.
obr_str(Str,Newstr):-add_z(Str,Nstr),reverse(Nstr,Newstr).
add_z(Str,Nstr):-reverse(Str,Temp),Nstr = [122,122,122|Temp].

%Task 11
pr7_11:-read_str(Stroka,Size),(Size > 10 -> rez(Stroka,0,[],Res),write_str(Res);add_o(Stroka,Size)).
rez(_,6,Temp,Res):-reverse(Temp,Res),!.
rez([H|T],A,Nstr,Res):-A1 is A+1,Nstr1 = [H|Nstr],rez(T,A1,Nstr1,Res).
add_o(Res,12):-write_str(Res),!.
add_o(Stroka,Size):-Size < 12,Size1 is Size+1,add_to_end(Stroka,111,Res),add_o(Res,Size1).
add_to_end(Stroka,Symb,Res):-reverse(Stroka,Nstr),Nstr1 =[[Symb]|Nstr],reverse(Nstr1,Res).

%Task 13
pr7_13:-read_str(Stroka,_),zamena(Stroka,0,[],Res),reverse(Res,NRes),write_str(NRes).
zamena([],_,Temp,Temp):-!.
zamena([H|T],A,Temp,Res):-A1 is A+1,A1 mod 2 =:= 0,((H =:=97;H=:=98)->Temp1 =[99|Temp];Temp1 = [97|Temp]),zamena(T,A1,Temp1,Res).
zamena([H|T],A,Temp,Res):-A1 is A+1,A1 mod 2 =\= 0,Temp1 = [H|Temp],zamena(T,A1,Temp1,Res).

%Task 14
pr7_14:-read_str(Stroka,_),kolvo_cifr(Stroka,0,Kolvo),write(Kolvo).
kolvo_cifr([],Kolvo,Kolvo):-!.
kolvo_cifr([H|T],A,Kolvo):-H>=48,H=<57,A1 is A+1,kolvo_cifr(T,A1,Kolvo).
kolvo_cifr([_|T],A,Kolvo):-kolvo_cifr(T,A,Kolvo).

%Task 15
pr7_15:-read_str(Stroka,_),soderzhanie_a_b_c(Stroka).
soderzhanie_a_b_c([]):-!.
soderzhanie_a_b_c([H|T]):-H>=97,H=<99,soderzhanie_a_b_c(T).
soderzhanie_a_b_c(_):-!,fail.

%Task 17
pr7_17:-read_str(Stroka,_),del_x(Stroka,[],Res),reverse(Res,Nres),write_str(Nres).
del_x([],T,T):-!.
del_x([120,97,98,99|T],Temp,Res):-Temp1 = [99,98,97|Temp],del_x(T,Temp1,Res).
del_x([H|T],Temp,Res):-Temp1 = [H|Temp],del_x(T,Temp1,Res).

