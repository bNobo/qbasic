'Ce programme vous permettra de calculer rapidement et simplement la taille
'de vos sprites afin de savoir quelle valeur affecter … leurs tableaux avec
'la commande DIM.
'PROGRAMMED BY BINAIRE.

CLS
INPUT "Mode d'‚cran : "; mode%
SCREEN mode%: CLS
deb:
INPUT "x1 : "; x1!
INPUT "y1 : "; y1!
INPUT "x2 : "; x2!
INPUT "y2 : "; y2!
IF mode% = 1 THEN
        bitspixelplan% = 2
        plans% = 1
END IF
IF mode% = 2 OR mode% = 3 OR mode% = 4 OR mode% = 11 THEN
        bitspixelplan% = 1
        plans% = 1
END IF
IF mode% = 7 OR mode% = 8 OR mode% = 9 OR mode% = 12 THEN
        bitspixelplan% = 1
        plans% = 4
END IF
IF mode% = 10 THEN
        bitspixelplan% = 1
        plans% = 2
END IF
IF mode% = 13 THEN
        bitspixelplan% = 8
        plans% = 1
END IF
size% = 4 + INT(((PMAP(x2!, 0) - PMAP(x1!, 0) + 1) * (bitspixelplan%) + 7) / 8) * plans% * (PMAP(y2!, 1) - PMAP(y1!, 1) + 1)
PRINT "Taille du sprite pour DIM : "; size% / 4
GOTO deb

