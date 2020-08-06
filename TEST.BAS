SCREEN 12: CLS
DIM pose(50, 1)
FOR i = 0 TO 50
        pose(i, 0) = RND * 640
        pose(i, 1) = RND * 349
        LINE (pose(i, 0), pose(i, 1))-((pose(i, 0) + 1), (pose(i, 1) + 1)), 7, BF
NEXT i
DO
        FOR i = 0 TO 50
                LINE (pose(i, 0), pose(i, 1))-((pose(i, 0) + 1), (pose(i, 1) + 1)), 0, BF
                pose(i, 0) = pose(i, 0) - 30
        NEXT i
        FOR i = 0 TO 50
                IF pose(i, 0) <= 1 THEN pose(i, 0) = 640
                LINE (pose(i, 0), pose(i, 1))-((pose(i, 0) + 1), (pose(i, 1) + 1)), 7, BF
        NEXT i
LOOP UNTIL INKEY$ = CHR$(27)

