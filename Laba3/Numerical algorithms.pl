max(X,Y,X):-X>Y,!.%max(X,Y,Z):-X>Y,Z is X.
max(_,Y,Y).% max(X,Y,Y):-X=<Y max(X,Y,Z):-X=<Y,Z is Y.
%2 TASK
max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

max1(X,Y,U,Z):-max(X,Y,C),max(C,U,Z).
%Rekursiya vverx
fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.
%Rekursiya vniz
fact1(N,X,N,X):-!.
fact1(I,F,N,X):-I1 is I+1,F1 is F*I1,fact1(I1,F1,N,X).
fact1(N,F):-fact1(0,1,N,F).%Сюда мы спрятали страшный факториал
%7
sum(0,0):-!.
sum(N,S):-N1 is N div 10,sum(N1,S1),S is S1+N mod 10.
%8 vniz rekyrsiya
sum1(N,S):-sum1(N,0,S).
sum1(0,S,S):-!.
sum1(A,Sum,S):-Am is A mod 10, Ad is A div 10,
               Sum1 is Sum+Am,sum1(Ad,Sum1,S).
%Task 5 vverx
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,fib(N1,X1),N2 is N-2,fib(N2,X2), X is X1+X2.

%Task 6 vniz
fib_vniz(N,X,_,N,X):-!.
fib_vniz(I,N1,N2,N,X):-I1 is I+1,N3 is N1+N2,fib_vniz(I1,N2,N3,N,X).
fib_vniz(N,X):-fib_vniz(1,1,1,N,X).

%Task 9
pr_cifr(0,1):-!.
pr_cifr(N,X):-N1 is N div 10,pr_cifr(N1,X1),X is X1*(N mod 10).

%Task 10
pr_cifr_vniz(0,X,_,X):-!.
pr_cifr_vniz(I,F,N,X):-I1 is I div 10,I2 is I mod 10,F1 is I2*F,pr_cifr_vniz(I1,F1,N,X).
pr_cifr_vniz(N,X):-pr_cifr_vniz(N,1,N,X).

%Task 11
kolvo_cifr(0,0):-!.
kolvo_cifr(N,X):-N1 is N div 10,kolvo_cifr(N1,X1),check(N,Y),X is X1+Y.

check(N,Y):-N1 is N mod 10,N1>3->Y is N1 mod 2;Y is 0,!.
