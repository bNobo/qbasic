5       CLEAR , , 20000
10 CLS : SCREEN 9: COLOR 1, 57
20 RANDOMIZE TIMER
25      INPUT "Niveau de difficult‚ ? "; dif: CLS
30 i = 0
35 DIM soum(2000): DIM diam(500): DIM min(500): DIM nul(500): DIM mvm(1 TO dif, 1 TO 2)
40        OPEN "soum.spr" FOR INPUT AS #1
45        OPEN "mine.spr" FOR INPUT AS #2
47        OPEN "diamant.spr" FOR INPUT AS #3
50                FOR x = 1 TO 64
60                        FOR y = 1 TO 34
70                        i = i + 1
80                        INPUT #1, i, a
90                        PSET (x, y), a
100                       NEXT y
110                NEXT x
115     GET (0, 0)-(65, 35), soum
117     CLOSE #1
120     CLS : i = 0
125                       FOR x = 1 TO 24
130                             FOR y = 1 TO 19
140                             i = i + 1
150                             INPUT #2, i, a
160                             PSET (x, y), a
170                             NEXT y
180                       NEXT x
190     GET (0, 0)-(25, 20), min
195     CLOSE #2
200     CLS : i = 0
210                FOR x = 1 TO 24
220                     FOR y = 1 TO 30
230                     i = i + 1
240                     INPUT #3, i, a
250                     PSET (x, y), a
260                     NEXT y
270                NEXT x
280     GET (0, 0)-(25, 30), diam
285     GET (50, 50)-(75, 75), nul
310     CLOSE #3
780     COLOR 1, 57: CLS
790     'Tirage al‚atoire de la position des mines.
850             FOR i = 1 TO dif
860             mvm(i, 1) = INT(RND * 500) + 1
870             mvm(i, 2) = INT(RND * 200) + 50
880             NEXT i
890     scr = 0: xdiam = INT(RND * 400) + 100
900     z = 650: COLOR 11
910     'Mise en place de l'‚cran de jeu et d‚but de la partie.
970     LINE (0, 0)-(650, 85), 11, BF
980     GOSUB 1610
990     PUT (xdiam, 300), diam
1000    xs = 10: ys = 100: vsx = 0: vsy = 0: scrl = 0
1010    PUT (xs, ys), soum, PSET
1020    scr = scr + 1: LOCATE 2, 35: PRINT "Score : "; scr
1030    exm = 0
1040            FOR i = 1 TO dif
1050            IF ABS(mvm(i, 1) + 25 - xs) > 150 OR ABS(mvm(i, 2) - ys) > 90 THEN GOTO 1100
1060            IF mvm(i, 1) < xs THEN mvm(i, 1) = mvm(i, 1) + 1
1070            IF mvm(i, 1) > xs THEN mvm(i, 1) = mvm(i, 1) - 1
1080            IF mvm(i, 2) < ys THEN mvm(i, 2) = mvm(i, 2) + 1
1090            IF mvm(i, 2) > ys THEN mvm(i, 2) = mvm(i, 2) - 1
1100            PUT (mvm(i, 1), mvm(i, 2)), min, PSET
1110            NEXT i
1120    IF xs > xdiam - 60 AND xs < xdiam + 20 AND ys > 260 THEN GOSUB 1850
1130    'Prise en compte des touches frapp‚es au clavier.
1190    k$ = INKEY$
1200    IF k$ = "6" AND vsx < 3 THEN vsx = vsx + .5
1210    IF k$ = "4" AND vsx > -3 THEN vsx = vsx - .5
1220    IF k$ = "5" AND vsy < 3 THEN vsy = vsy + .25
1230    IF k$ = "8" AND vsy > -3 THEN vsy = vsy - .25
1240    xs = xs + vsx - scrl
1250    IF xs > 570 THEN xs = 570
1260    IF xs < 1 THEN xs = 1
1270    IF xs > 350 THEN scrl = 1
1280    IF xs > 450 THEN scrl = 2
1290    scrlm = scrl
1300    IF scrl > 0 THEN GOSUB 1980
1310    IF xs < 250 THEN scrl = -1
1320    IF xs < 150 THEN scrl = -2
1330    scrlm = scrl
1340    IF scrl < 0 THEN GOSUB 2050
1350    ys = ys + vsy
1360    IF ys > 300 THEN ys = 300
1370    IF ys < 95 THEN ys = 95
1380    PUT (xs, ys), soum, PSET
1385    PUT (xdiam, 300), diam, PSET
1390    IF scrl = 0 THEN GOSUB 1610
1400    IF exm = 1 THEN GOSUB 1720
1410    IF exm = 0 THEN GOSUB 1010
1420    'Fin de partie et rebouclage pour un nouveau jeu.
1480    COLOR 1: CLS
1490    COLOR 14
1500    LOCATE 10, 30: PRINT "Votre score : "; scr
1510    LOCATE 20, 20: INPUT "Nouvelle partie (o/n) ? "; rep$
1520    IF rep$ = "o" THEN GOTO 780
1525    IF rep$ = "n" THEN GOTO 2200
1530    GOTO 780
1535    ON ERROR GOTO 2200
1540    GOTO 1010
1550    ON ERROR GOTO 2200
1610            FOR i% = 1 TO dif
1620            xmm = mvm(i%, 1): ymm = mvm(i%, 2)
1630            IF scrl <> 0 THEN PUT (xmm, ymm), min, PSET
1640            IF xmm < xs + 40 AND xmm > xs - 10 AND ymm < ys + 15 AND ymm > ys - 10 THEN exm = 1
1650            NEXT i%
1660    RETURN
1670    'Sous routine de fin de partie.
1720            FOR i = 1 TO 5
1730            COLOR i, i
1740            CLS
1750            FOR t = 1 TO 100: NEXT t
1760            NEXT i
1770    COLOR 2, 1: CLS
1780    RETURN
1790    'Sous routine d'animation de la chute du diamant.
1850    PUT (xdiam, 300), nul, PSET
1860    scr = scr + 1000
1870    xdiam = INT(RND * 400) + 100
1880            FOR i = 1 TO 300
1890            PUT (xdiam, i), diam, PSET
1900            NEXT i
1910    RETURN
1920    'Sous routine d'animation du d‚placement g‚n‚ral des mines.
1980            FOR i = 1 TO dif
1990            mvm(i, 1) = mvm(i, 1) - scrl
2000            IF mvm(i, 1) < 1 THEN mvm(i, 1) = 580: PUT (1, mvm(i, 2)), nul, PSET
2010            NEXT i
2020    GOSUB 1610
2030    scrl = 0
2040    RETURN
2050            FOR i = 1 TO dif
2060            mvm(i, 1) = mvm(i, 1) - scrl
2070            IF mvm(i, 1) > 610 THEN mvm(i, 1) = 1: PUT (610, mvm(i, 2)), nul, PSET
2080            NEXT i
2090    GOSUB 1610
2100    scrl = 0
2110    RETURN
2200    CLS
2210    PRINT "La partie est termin‚e."
2230    OPEN "hiscore.sav" FOR INPUT AS #1
2240    INPUT #1, nom$, score
2260    CLOSE #1
2265    IF scr > score THEN
2267    INPUT "HI-SCORE !!!, Votre nom : "; nom$
2270    OPEN "hiscore.sav" FOR OUTPUT AS #2
2280    PRINT #2, nom$
2285    PRINT #2, scr
2300    CLOSE #2
2305    END IF
2310    OPEN "hiscore.sav" FOR INPUT AS #1
2320    INPUT #1, nom$, score
2330    PRINT "Meilleur score d‚tenu par ", nom$, score











