read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str(A,N,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
read_str(A,N,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

in_list(El|_,El).
in_list([_|T],El):-in_list(T,El).

%Task 1
pr8_1:-see('z:/prolog/8_1.txt'),read_list_str(_,ListSize),seen,max(ListSize,Max),tell('z:/prolog/Out.txt'),write(Max),told.

%Task 2
pr8_2:-see('z:/prolog/8_2.txt'),read_list_str(List),seen,wo_spc(List,Value),tell('z:/prolog/out.txt'),write(Value),told.
wo_spc(List,Value):-wo_spc(List,0,Value).
wo_spc([],Counter,Counter):-!.
wo_spc([H|T],Counter,Value):-not(find_spc(H)),Counter1 is Counter+1,wo_spc(T,Counter1,Value).
wo_spc([_|T],Counter,Value):-wo_spc(T,Counter,Value).

find_spc([]):-!,fail.
find_spc([32|_]):-!.
find_spc([_|T]):-find_spc(T).

%Task 1_1
pr8_1_1:-see('z:/prolog/8_1_1.txt'),read_list_str(List,_),seen,fnd_rs(List,0,Count),tell('z:/prolog/Out.txt'),write('Number of Russian letters : '),write(Count),told.
fnd_rs([],A,A):-!.
fnd_rs([H|T],A,Count):-find_rus(H,0,R),A1 is A+R,fnd_rs(T,A1,Count).
find_rus([],A,A):-!.
find_rus([H|T],A,Count):-H >= 1040,H =<1103,A1 is A+1,find_rus(T,A1,Count).
find_rus([_|T],A,Count):-find_rus(T,A,Count).

%Task 1_18
pr8_1_18:-see('z:/prolog/8_1_18.txt'),read_list_str(List),seen,find_data(List).
find_data([]):-!.
find_data([H|T]):-find_dt(H),find_data(T).
find_dt([]):-!.
find_dt([H1,H2,H3,H4,H5,H6,H7,H8,H9,H10|T]):-H1 =< 51,H1>=48,H2>=48,H2=<57,H3 == 46,H4=<49,H4>=48,H5>=46,H5=<57,H6==46,H7>=49,H7=<57,H8>=48,H8=<57,H9>=48,H9=<57,H10>=48,H10=<57,write_str([H1,H2,H3,H4,H5,H6,H7,H8,H9,H10]),nl,find_dt(T).
find_dt([_|T]):-find_dt(T).

pr8_5:-see('z:/prolog/8_5.txt'),read_list_str(List,N),seen,sortirovka(List,N,[],Res),tell('z:/prolog/Out.txt'),write_list_str(Res),told.

sortirovka([],[],A,A):-!.

sortirovka([H|T],[HL|TL],A,Res):-Max =HL, Max_str=H, sortirvka([H|T],[HL|TL], Max, Max_str, Stroka, Nom),append(A,[Stroka],A1),del([H|T], Stroka, List),del([HL|TL], Nom, ListL), sortirovka(List, ListL,A1,Res),!.

sortirvka([],[], Max, Max_str,Max_str, Max):-!.
sortirvka([H|T], [HL|TL], Max, Max_str, St,Nm):- (HL>Max-> Max1 = HL, Max_str1 = H,sortirvka(T, TL, Max1, Max_str1, St,Nm); sortirvka(T, TL, Max, Max_str,St,Nm)).

del([H|T], X, List):-del([H|T],[],List,X, 1).
del([],List,List,_,_):-!.
del([H|T], Temp, List, X, 1):-(H=X-> del(T, Temp,List,X, 0)),!.
del([H|T], Temp, List, X, 1):-append(Temp,[H], Temp1), del(T, Temp1, List, X,1).
del([H|T], Temp, List, X, 0):-append(Temp,[H], Temp1), del(T, Temp1, List, X,1).
