' L'instruction paint n'est … utiliser que si la couleur de remplissage est
' la mˆme que la couleur des traits.
' Entrez le nom du dessin avec son chemin (ex.a:\sprite)
' Tapez C pour changer de couleur, 0 pour tracer un cercle, R pour afficher
' un sprite (celui-ci devra avoir la mˆme taille que celle d‚finie), S pour
' sauvegarder votre sprite et ECHAP pour quitter.
' PROGRAMMED BY BINAIRE.

SCREEN 7: CLS
x = 5
y = 5
couleur = 0
INPUT "Veuillez entrer le nom de votre dessin : "; fich$
fich$ = fich$ + ".spr"
PRINT "Taille du sprite : (d‚faut : 50 * 50)"
INPUT "Largeur : "; largeur
INPUT "Hauteur : "; hauteur
CLS
IF largeur = 0 THEN largeur = 50
IF hauteur = 0 THEN hauteur = 50
LINE (0, 0)-(largeur, hauteur), 1, B
DO
a$ = INKEY$
IF a$ = "6" THEN x = x + 1
IF a$ = "4" THEN x = x - 1
IF a$ = "8" THEN y = y - 1
IF a$ = "5" THEN y = y + 1
IF a$ = "3" THEN x = x + 1: y = y + 1
IF a$ = "1" THEN x = x - 1: y = y + 1
IF a$ = "7" THEN x = x - 1: y = y - 1
IF a$ = "9" THEN x = x + 1: y = y - 1
IF a$ = "0" THEN GOSUB cercle
IF a$ = "s" THEN GOTO sauvegarde
IF a$ = "r" THEN GOSUB recup
IF a$ = CHR$(27) THEN EXIT DO
IF a$ = "c" THEN GOSUB coul
PSET (x, y), 14
PSET (x, y), couleur
LOOP
END

sauvegarde:
        OPEN fich$ FOR OUTPUT AS #1
                FOR x = 1 TO largeur - 1
                        FOR y = 1 TO hauteur - 1
                        i = i + 1
                        a = POINT(x, y)
                        PRINT #1, i, a
                        NEXT y
                NEXT x
        CLOSE #1
END

recup:
INPUT "Nom du dessin … afficher : "; dessin$
dessin$ = dessin$ + ".spr"
CLS
i = 0
        OPEN dessin$ FOR INPUT AS #2
                FOR x = 1 TO largeur - 1
                        FOR y = 1 TO hauteur - 1
                        i = i + 1
                        INPUT #2, i, a
                        PSET (x, y), a
                        NEXT y
                NEXT x
        CLOSE #2
LINE (0, 0)-(largeur, hauteur), 1, B
x = 25: y = 25
RETURN

coul:
LOCATE 15, 5
INPUT "Couleur ?"; b$
IF b$ = "noir" THEN couleur = 0
IF b$ = "bleu" THEN couleur = 1
IF b$ = "vert" THEN couleur = 2
IF b$ = "cyan" THEN couleur = 3
IF b$ = "rouge" THEN couleur = 4
IF b$ = "violet" THEN couleur = 5
IF b$ = "marron" THEN couleur = 6
IF b$ = "blanc" THEN couleur = 7
IF b$ = "gris" THEN couleur = 8
IF b$ = "bleu clair" THEN couleur = 9
IF b$ = "jaune" THEN couleur = 14
RETURN

cercle:
LOCATE 17, 5: INPUT "Rayon du cercle ?"; rayon
LOCATE 18, 5: INPUT "Cercle plein ou vide (p/v) ?"; rep$
CIRCLE (x, y), rayon, couleur
IF rep$ = "p" THEN PAINT (x + .5, y), couleur, couleur
RETURN


