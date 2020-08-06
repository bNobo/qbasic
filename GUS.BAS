SCREEN 12: CLS
DIM gus(300): DIM gus1(300): DIM gus2(300)
        OPEN "gus.spr" FOR INPUT AS #1
        OPEN "gus1.spr" FOR INPUT AS #2
        OPEN "gus2.spr" FOR INPUT AS #3
                FOR x = 1 TO 19
                        FOR y = 1 TO 29
                        i = i + 1
                        INPUT #1, i, a
                        INPUT #2, i, b
                        INPUT #3, i, c
                        PSET (x, y), a
                        PSET (x + 30, y), b
                        PSET (x + 60, y), c
                        NEXT y
                NEXT x
        CLOSE #1
        CLOSE #2
        CLOSE #3
        GET (0, 0)-(20, 30), gus
        GET (30, 0)-(50, 30), gus1
        GET (60, 0)-(80, 30), gus2
xgus = 50: ygus = 50
t = TIMER
DO
        k$ = INKEY$
        IF k$ = CHR$(27) THEN END
        IF k$ = "6" THEN droite = 1: gauche = 0
        IF droite = 1 THEN xgus = xgus + .1
        IF TIMER - t >= .3 AND TIMER - t < .6 THEN PUT (xgus, ygus), gus, PSET
        IF TIMER - t >= .6 AND TIMER - t < .9 THEN PUT (xgus, ygus), gus1, PSET
        IF TIMER - t >= .9 THEN PUT (xgus, ygus), gus2, PSET
        IF TIMER - t >= 1.2 THEN t = TIMER - .3
LOOP

