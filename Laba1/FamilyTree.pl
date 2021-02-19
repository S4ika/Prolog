man(pollux).
man(charlus).
man(orion).
man(alphard).
man(kygnus).
man(sirius).
man(regulus).
man(rodolphus).
man(ted).
man(lucius).
man(james).
man(draco).
man(harry).
man(alex).
man(ben).
man(arcturus).
man(abraxas).
man(joseph).

woman(irma).
woman(dorea).
woman(walburga).
woman(druella).
woman(bellatrix).
woman(andromeda).
woman(narcissa).
woman(lily).
woman(nymphadora).
woman(mari).
woman(gloria).
woman(melania).
woman(isabel).
woman(olivia).

parent(pollux,walburga).
parent(pollux,alphard).
parent(pollux,kygnus).

parent(irma,walburga).
parent(irma,alphard).
parent(irma,kygnus).

parent(charlus,james).

parent(dorea,james).

parent(arcturus,orion).

parent(melania,orion).

parent(orion,sirius).
parent(orion,regulus).

parent(walburga,sirius).
parent(walburga,regulus).

parent(kygnus,bellatrix).
parent(kygnus,andromeda).
parent(kygnus,narcissa).

parent(joseph,druella).

parent(olivia,druella).

parent(druella,bellatrix).
parent(druella,andromeda).
parent(druella,narcissa).

parent(alex,ted).

parent(mari,ted).

parent(ted,nymphadora).

parent(andromeda,nymphadora).

parent(abraxas,lucius).

parent(isabel,lucius).

parent(lucius,draco).

parent(narcissa,draco).

parent(ben,lily).

parent(gloria,lily).

parent(james,harry).

parent(lily,harry).

men():-man(X),write(X),nl,fail.

women():-woman(X),write(X),nl,fail.

children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).

mother(X):-mother(Y,X),write(Y).

father(X,Y):-parent(X,Y),man(X).

father(X):-father(Y,X),write(Y).

brother(X,Y):-parent(A,X),man(X),parent(A,Y),woman(A),X\=Y.

brothers(X):-brother(Y,X),write(Y),nl,fail.
