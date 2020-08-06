SCREEN 12: CLS

RANDOMIZE TIMER
DIM troufion(52): DIM tank(166)
DIM nul52(52): DIM nulTank(166)
DIM Atom(52)
DIM batPrinc(344): DIM usine(344): DIM camp(344): DIM port(344)
DIM nulBatiment(344)
DIM grilleEnn(27, 19)           'une case a la valeur 0 si elle est vide,
                               '1 si elle contient un troufion, etc.
DIM grilleJoueur(27, 19)

REM DIM dejaJouee(27, 19)          'une case prend la valeur 1 si elle a deja ete
                               'jouee

OPEN "troufion.spr" FOR INPUT AS #1
FOR x% = 1 TO 15
       FOR y% = 1 TO 15
               i = i + 1
               INPUT #1, i, a
               PSET (x%, y%), a
        NEXT y%
NEXT x%
CLOSE #1
OPEN "atom.spr" FOR INPUT AS #1
FOR x% = 1 TO 15
        FOR y% = 1 TO 15
                i = i + 1
                INPUT #1, i, a
                PSET (x% + 20, y%), a
        NEXT y%
NEXT x%
CLOSE #1
GET (0, 0)-(16, 16), troufion
GET (20, 0)-(36, 16), Atom
GET (50, 50)-(66, 66), nul52
INPUT "Nombre de troufions par equipe ? ", nbTrouf
numCol = 1
troufionsEnn = nbTrouf
troufionsJoueur = nbTrouf
FOR i% = 1 TO nbTrouf
        ligne% = INT(RND * 27)
        colonne% = INT(RND * 19)
        IF grilleEnn(ligne%, colonne%) = 0 THEN
                grilleEnn(ligne%, colonne%) = 1
        ELSE
                i% = i% - 1
        END IF
NEXT i%

FOR i% = 1 TO 1
        ligne% = INT(RND * 27)
        colonne% = INT(RND * 19)

        IF grilleEnn(ligne%, colonne%) = 0 THEN
                grilleEnn(ligne%, colonne%) = 2
        ELSE
                i% = i% - 1
        END IF
NEXT i%


CLS
LINE (0, 0)-(639, 448), 7, B
LINE (320, 0)-(320, 448), 7
lettre% = 41
FOR i% = 41 TO 78 STEP 2
        LOCATE 28, i%
        PRINT CHR$(lettre% + 24)
        lettre% = lettre% + 1
NEXT i%
FOR i% = 1 TO 9
        LOCATE i%, 78
        PRINT i%
NEXT i%
FOR i% = 10 TO 27
        LOCATE i%, 77
        PRINT i%
NEXT i%
FOR i% = 0 TO 448 STEP 16
        FOR j% = 320 TO 639 STEP 16
                LINE (320, i%)-(639, i%), 7
                LINE (j%, 0)-(j%, 448), 7
        NEXT j%
NEXT i%

LOCATE 28, 2: PRINT "Positionnez votre bombe atomique       "
xAtom = 1: yAtom = 1
nbAtom% = 1
AtomJoueur% = nbAtom%
atomEnn% = nbAtom%
PUT (xAtom, yAtom), Atom, PSET
WHILE nbAtom% > 0
        k$ = INKEY$
        IF k$ <> "" THEN
        SELECT CASE k$
      
        CASE "6"
                IF grilleJoueur(yAtom / 16, xAtom / 16) = 0 THEN PUT (xAtom, yAtom), nul52, PSET
                IF xAtom < 288 THEN xAtom = xAtom + 16
                PUT (xAtom, yAtom), Atom, PSET
              
        CASE "4"
                IF grilleJoueur(yAtom / 16, xAtom / 16) = 0 THEN PUT (xAtom, yAtom), nul52, PSET
                IF xAtom > 1 THEN xAtom = xAtom - 16
                PUT (xAtom, yAtom), Atom, PSET

        CASE "8"
                IF grilleJoueur(yAtom / 16, xAtom / 16) = 0 THEN PUT (xAtom, yAtom), nul52, PSET
                IF yAtom > 1 THEN yAtom = yAtom - 16
                PUT (xAtom, yAtom), Atom, PSET
      
        CASE "5"
                IF grilleJoueur(yAtom / 16, xAtom / 16) = 0 THEN PUT (xAtom, yAtom), nul52, PSET
                IF yAtom < 416 THEN yAtom = yAtom + 16
                PUT (xAtom, yAtom), Atom, PSET

        CASE CHR$(32)
                grilleJoueur(yAtom / 16, xAtom / 16) = 2
                nbAtom% = nbAtom% - 1
                                  
        END SELECT
      
        END IF
      
WEND

LOCATE 28, 2: PRINT "Positionnez vos troufions              "
IF xAtom = 1 AND yAtom = 1 THEN
        xTrouf = 17: yTrouf = 1
ELSE
        xTrouf = 1: yTrouf = 1
END IF

PUT (xTrouf, yTrouf), troufion, PSET

WHILE nbTrouf > 0
        k$ = INKEY$
        IF k$ <> "" THEN
        SELECT CASE k$
       
        CASE "6"
                IF grilleJoueur(yTrouf / 16, xTrouf / 16) = 0 THEN PUT (xTrouf, yTrouf), nul52, PSET
                FOR i% = (xTrouf / 16 + 1) TO 18
                IF grilleJoueur(yTrouf / 16, i%) = 0 THEN
                        xTrouf = i% * 16 + 1
                        EXIT FOR
                END IF
                NEXT i%
                PUT (xTrouf, yTrouf), troufion, PSET

        CASE "4"
                IF grilleJoueur(yTrouf / 16, xTrouf / 16) = 0 THEN PUT (xTrouf, yTrouf), nul52, PSET
                FOR i% = (xTrouf / 16 - 1) TO 0 STEP -1
                IF grilleJoueur(yTrouf / 16, i%) = 0 THEN
                        xTrouf = i% * 16 + 1
                        EXIT FOR
                END IF
                NEXT i%
                PUT (xTrouf, yTrouf), troufion, PSET

        CASE "8"
                IF grilleJoueur(yTrouf / 16, xTrouf / 16) = 0 THEN PUT (xTrouf, yTrouf), nul52, PSET
                FOR i% = (yTrouf / 16 - 1) TO 0 STEP -1
                IF grilleJoueur(i%, xTrouf / 16) = 0 THEN
                        yTrouf = i% * 16 + 1
                        EXIT FOR
                END IF
                NEXT i%
                PUT (xTrouf, yTrouf), troufion, PSET
              
        CASE "5"
                IF grilleJoueur(yTrouf / 16, xTrouf / 16) = 0 THEN PUT (xTrouf, yTrouf), nul52, PSET
                FOR i% = (yTrouf / 16 + 1) TO 26
                IF grilleJoueur(i%, xTrouf / 16) = 0 THEN
                        yTrouf = i% * 16 + 1
                        EXIT FOR
                END IF
                NEXT i%
                PUT (xTrouf, yTrouf), troufion, PSET
              
        CASE CHR$(32)
                grilleJoueur(yTrouf / 16, xTrouf / 16) = 1
                nbTrouf = nbTrouf - 1

        END SELECT
       
        END IF
       
WEND

choixArme:
LOCATE 28, 2: PRINT SPC(39);
LOCATE 28, 2: INPUT "Choix de l'arme : ", arme$
SELECT CASE arme$
CASE "1":
        IF troufionsJoueur <= 0 THEN GOTO choixArme

CASE "2":
        IF AtomJoueur% <= 0 THEN GOTO choixArme

CASE ELSE:
        GOTO choixArme

END SELECT

k$ = ""
partieA$ = ""
partieB$ = ""

DO UNTIL k$ <> "" AND k$ <> CHR$(32) AND k$ <> "4" AND k$ <> "5" AND k$ <> "6" AND k$ <> "8"
        k$ = INKEY$
LOOP
l = ASC(UCASE$(k$)) - 65      'colonne ou l'on joue

DO UNTIL partieA$ <> ""
        partieA$ = INKEY$
LOOP

DO UNTIL partieB$ <> ""
        partieB$ = INKEY$
LOOP

IF partieA$ = "0" THEN
        k = VAL(RIGHT$(partieB$, 1))            'ligne ou l'on joue
ELSE
        nb$ = partieA$ + partieB$
        k = VAL(nb$)
END IF

IF l > 19 OR k > 27 OR l < 0 OR k < 0 THEN
        LOCATE 28, 2
        PRINT "Bad entry, reenter. Press space...    "
        SLEEP
        GOTO choixArme
END IF

SELECT CASE arme$
CASE "1":
IF grilleEnn(k, l) = 1 THEN
        IF POINT(321 + l * 16, k * 16 - 1) = 0 THEN PAINT (321 + l * 16, k * 16 - 1), 2, 7
        grilleEnn(k, l) = 0
        troufionsEnn = troufionsEnn - 1
        LOCATE 28, 2: PRINT "Il reste"; troufionsEnn; "troufions ennemis         "
        SLEEP
        GOTO choixArme
ELSE
        IF POINT(321 + l * 16, k * 16 - 1) = 0 THEN PAINT (321 + l * 16, k * 16 - 1), 4, 7
END IF
IF troufionsEnn <= 0 THEN PRINT "Gagne !!!": END

CASE "2":
FOR i% = k - 2 TO k + 2
        FOR j% = l - 2 TO l + 2
                IF grilleEnn(i%, j%) = 1 THEN
                        IF POINT(321 + j% * 16, i% * 16 - 1) = 0 THEN PAINT (321 + j% * 16, i% * 16 - 1), 2, 7
                        grilleEnn(i%, j%) = 0
                        troufionsEnn = troufionsEnn - 1
                ELSE
                        IF POINT(321 + j% * 16, i% * 16 - 1) = 0 THEN PAINT (321 + j% * 16, i% * 16 - 1), 7, 7
                END IF
        NEXT j%
NEXT i%
LOCATE 28, 2: PRINT "Il reste"; troufionsEnn; "troufions ennemis         "
AtomJoueur% = AtomJoueur% - 1
grilleJoueur(k, l) = -1
CIRCLE (xAtom + 8, yAtom + 8), 8, 7
PAINT (xAtom + 8, yAtom + 8), 7, 7
SLEEP

END SELECT

ChoixArmePC:

armePC% = 2
IF armePC% = 2 AND atomEnn% <= 0 THEN GOTO ChoixArmePC

pcRejoue:


SELECT CASE armePC%
CASE 2
        i% = INT(RND * 27): j% = INT(RND * 19)
        IF grilleJoueur(i%, j%) = -1 THEN
                GOTO pcRejoue
        ELSE
                FOR ligne% = i% - 2 TO i% + 2
                        FOR colonne% = j% - 2 TO j% + 2
                IF ligne% >= 0 AND colonne% >= 0 AND ligne% <= 27 AND colonne% <= 19 THEN
                IF grilleJoueur(ligne%, colonne%) = 1 THEN
                        CIRCLE (colonne% * 16 + 8, ligne% * 16 + 8), 8, 4
                        PAINT (colonne% * 16 + 8, ligne% * 16 + 8), 4, 4
                        grilleJoueur(ligne%, colonne%) = -1
                        troufionsJoueur = troufionsJoueur - 1
                        grilleJoueur(ligne%, colonne%) = -1
                ELSE
                        CIRCLE (colonne% * 16 + 8, ligne% * 16 + 8), 8, 7
                        PAINT (colonne% * 16 + 8, ligne% * 16 + 8), 7, 7
                        grilleJoueur(ligne%, colonne%) = -1
                END IF
                END IF
                        NEXT colonne%
                NEXT ligne%
        END IF
        LOCATE 28, 2: PRINT "Il vous reste "; troufionsJoueur; "troufions              "
        SLEEP
        GOTO choixArme

CASE ELSE
        i% = INT(RND * 27): j% = INT(RND * 19)
        IF grilleJoueur(i%, j%) = -1 THEN
                GOTO pcRejoue
        ELSE
                IF grilleJoueur(i%, j%) = 1 THEN
                        CIRCLE (j% * 16 + 8, i% * 16 + 8), 8, 4
                        PAINT (j% * 16 + 8, i% * 16 + 8), 4, 4
                        grilleJoueur(i%, j%) = -1
                        troufionsJoueur = troufionsJoueur - 1
                        grilleJoueur(i%, j%) = -1
                        LOCATE 28, 2: PRINT "Il vous reste "; troufionsJoueur; "troufions              "
                        SLEEP
                        GOTO pcRejoue
                ELSE
                        CIRCLE (j% * 16 + 8, i% * 16 + 8), 8, 2
                        PAINT (j% * 16 + 8, i% * 16 + 8), 2, 2
                        grilleJoueur(i%, j%) = -1
                END IF
        END IF
        IF troufionsJoueur <= 0 THEN PRINT "Perdu !!": END
        GOTO choixArme


END SELECT
                                




                                    

