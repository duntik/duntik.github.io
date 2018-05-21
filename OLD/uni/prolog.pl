male(yuya).
male(ay).
male(amenhotep_3).
male(akhenaten).
male(smenkhkare).
male(tutankhamun).
female(tuya).
female(tiy).
female(unknown).
female(nefertiti).
female(merytaten).
female(other_dauthers_4).
female(ankhesenamun).
female(kiya).
female(stillborn).

parent(tuya,tiy).
parent(tuya,ay).
parent(yuya,tiy).
parent(yuya,ay).
parent(ay,nefertiti).
parent(unknown,nefertiti).
parent(tiy,akhenaten).
parent(amenhotep_3,akhenaten).
parent(kiya,tutankhamun).
parent(akhenaten,tutankhamun).
parent(akhenaten,merytaten).
parent(akhenaten,other_dauthers_4).
parent(akhenaten,ankhesenamun).
parent(nefertiti,merytaten).
parent(nefertiti,other_dauthers_4).
parent(nefertiti,ankhesenamun).
parent(ankhesenamun,stillborn).
parent(tutankhamun,stillborn).

:- discontiguous male/1, female/1, parent/2.
mother(M,X)      :- female(M),parent(M,X).
father(F,B)      :- male(F),parent(F,B).
siblings(X,Y)    :- father(F,X), father(F,Y), mother(M,X), mother(M,Y) X \= Y.
sister(W,Z)      :- female(W),parent(P,W),parent(P,Z), W \= Z.
aunt(W,Z)        :- female(W),sister(W,D),father(D,Z).
/**partner(W,Z)  :- female(W), male(Z) ??????????*/
grandfather(W,Z) :- male(W),parent(W,S),parent(S,Z).
ancestor(W,Z)    :- parent(W,Z).
ancestor(W,Z)    :- parent(W,S),ancestor(S,Z).
nephew(W,Z)      :- male(W), parent(P,W), sibling(P,Z).
