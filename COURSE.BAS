SCREEN 12: CLS
RANDOMIZE TIMER
DIM bon(500): DIM bon1(500)
DIM cheval(500): DIM cheval1(500)
xc1 = 50: yc1 = 50
xc2 = 50: yc2 = 100
        OPEN "ben.spr" FOR INPUT AS #1
                FOR x = 1 TO 49
                        FOR y = 1 TO 49
                        i = i + 1
                        INPUT #1, i, a
                        PSET (x, y), a
                        NEXT y
                NEXT x
        CLOSE #1
PAINT (27, 28), 1, 2
GET (0, 0)-(50, 50), bon
PAINT (27, 28), 4, 2
GET (0, 0)-(50, 50), cheval
        OPEN "ben1.spr" FOR INPUT AS #2
                FOR x = 1 TO 49
                        FOR y = 1 TO 49
                        i = i + 1
                        INPUT #2, i, a
                        PSET (x, y), a
                        NEXT y
                NEXT x
        CLOSE #2
PAINT (27, 28), 1, 2
GET (0, 0)-(50, 50), bon1
PAINT (27, 28), 4, 2
GET (0, 0)-(50, 50), cheval1
INPUT "A votre avis qui va gagner, le rouge ou le bleu ? Pariez !"; pari$
t = TIMER
DO
        LINE (590, 0)-(590, 400)
        LOCATE 2, 2: PRINT n; m
        n = (RND * 5)
        m = (RND * 5)
        IF TIMER - t >= .15 AND TIMER - t < .3 THEN
                PUT (xc1, yc1), bon, PSET
                PUT (xc2, yc2), cheval, PSET
        END IF
        IF TIMER - t >= .3 THEN
                PUT (xc1, yc1), bon1, PSET
                PUT (xc2, yc2), cheval1, PSET
                t = TIMER
        END IF
        xc1 = xc1 + n
        xc2 = xc2 + m
        IF xc1 AND xc2 >= 570 THEN PRINT "Ex aequo !": END
        IF xc2 >= 550 THEN GOTO rougegagne
        IF xc1 >= 550 THEN GOTO bleugagne
       GOSUB pertedetemps
LOOP

bleugagne: IF pari$ = "bleu" THEN
                PRINT "Bravo, le bleu … gagn‚ !"
           ELSEIF pari$ = "rouge" THEN
                PRINT "Dommage, c'est le bleu qui est arriv‚ en tˆte..."
           END IF
END

rougegagne: IF pari$ = "rouge" THEN
                PRINT "Bravo, le rouge … gagn‚ !"
            ELSEIF pari$ = "bleu" THEN
                PRINT "Dommage, le rouge … remport‚ la course..."
            END IF
END

pertedetemps: tt = TIMER
DO WHILE TIMER - tt < .01
LOOP
RETURN

