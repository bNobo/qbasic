SCREEN 12: CLS
DIM gros(200): DIM gros2(200): DIM gros3(200)
DIM invgros(200): DIM invgros2(200): DIM invgros3(200)
DIM nul(200)
        OPEN "gros.spr" FOR INPUT AS #1
        OPEN "gros2.spr" FOR INPUT AS #2
        OPEN "gros3.spr" FOR INPUT AS #3
                FOR x = 1 TO 19
                        FOR y = 1 TO 19
                        i = i + 1
                        INPUT #1, i, a
                        INPUT #2, i, B
                        INPUT #3, i, c
                        PSET (x, y), a
                        PSET (x + 70, y), B
                        PSET (x + 140, y), c
                        NEXT y
                NEXT x
        CLOSE #1
        CLOSE #2
        CLOSE #3
        FOR x = 0 TO 20
                FOR y = 0 TO 20
                        test = POINT(x, y)
                        distx = 30 - x
                        PSET (30 + distx, y), test
                NEXT y
        NEXT x
        FOR x = 70 TO 90
                FOR y = 0 TO 20
                        test = POINT(x, y)
                        distx = 100 - x
                        PSET (100 + distx, y), test
                NEXT y
        NEXT x
        FOR x = 140 TO 160
                FOR y = 0 TO 20
                        test = POINT(x, y)
                        distx = 170 - x
                        PSET (170 + distx, y), test
                NEXT y
        NEXT x
        PAINT (0, 0), 4
        GET (0, 0)-(20, 20), gros
        GET (70, 0)-(90, 20), gros2
        GET (140, 0)-(160, 20), gros3
        GET (40, 0)-(60, 20), invgros
        GET (110, 0)-(130, 20), invgros2
        GET (180, 0)-(200, 20), invgros3
        GET (90, 90)-(110, 110), nul


SLEEP
CLS
PAINT (0, 0), 4
t = TIMER
gros = 1
LINE (0, 400)-(640, 420), 1, BF
DO
        a$ = INKEY$
        IF a$ = CHR$(27) THEN EXIT DO
        IF a$ = "6" THEN
                PUT (xgros, ygros), nul, PSET
                xgros = xgros + 5
                IF gros = 1 THEN PUT (xgros, ygros), gros, PSET
                IF gros = 2 THEN PUT (xgros, ygros), gros2, PSET
                IF gros = 3 THEN PUT (xgros, ygros), gros3, PSET
                gros = gros + 1
                IF gros > 3 THEN gros = 1
        END IF
        IF a$ = "4" THEN
                PUT (xgros, ygros), nul, PSET
                xgros = xgros - 5
                IF gros = 1 THEN PUT (xgros, ygros), invgros, PSET
                IF gros = 2 THEN PUT (xgros, ygros), invgros2, PSET
                IF gros = 3 THEN PUT (xgros, ygros), invgros3, PSET
                gros = gros + 1
                IF gros > 3 THEN gros = 1
        END IF
        test = POINT(xgros + 10, ygros + 22)
        IF test <> 1 THEN
                PUT (xgros, ygros), nul, PSET
                ygros = ygros + 1
                PUT (xgros, ygros), gros, PSET
        END IF
        IF a$ = "8" THEN
        END IF
LOOP



