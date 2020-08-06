fractal:


 CLS
SCREEN 12: COLOR 15
LOCATE 3, 4, 0: PRINT "FRACTALE DE SIERPENS"
SLEEP 2
dens% = 1000
xp = 0
yp = 0
xg = 640
yg = 340
kg = 0
LOCATE 1, 40, 0, 0, 0: INPUT "DONNER la densite desirer:"; dens

zoom:
PRINT "go..."
k = 0
RANDOMIZE TIMER
x# = RND
RANDOMIZE TIMER
y# = RND
WINDOW (xp, yp)-(xg, yg)



review:
recom:
RANDOMIZE TIMER
cl = RND
fg = RND
rf = RND
DR = INT(cl + fg + rf) * 8 + 1
IF DR = rd OR DR > 256 OR DR < 0 THEN GOTO recom
rd = DR

IF k = dens THEN GOTO fin
ktotal = k + kg
LOCATE 1, 6, 0: PRINT "NBR POINT:"; ktotal
kg = ktotale
n# = RND
REM        PRINT n#
IF n# < (1 / 3) OR n# = (1 / 3) THEN GOTO yes1
GOTO no1
yes1:
x# = .5 * x#
y# = .5 * y#
LINE (x# * 640, y# * 340)-(x# * 640, y# * 340), DR
no1:
IF n# > (1 / 3) AND (n# < (2 / 3) OR n# = (2 / 3)) THEN GOTO yes2
GOTO no2
yes2:
x# = .5 * (.5 + x#)
y# = .5 * (1 + y#)
LINE (x# * 640, y# * 340)-(x# * 640, y# * 340), DR
no2:
IF n# > (2 / 3) THEN GOTO yes3
GOTO no3
yes3:
x# = .5 * (1 + x#)
y# = .5 * y#
LINE (x# * 640, y# * 340)-(x# * 640, y# * 340), DR

no3:
k = k + 1
GOTO review

fin:
LOCATE 1, 1, 0: INPUT "SI VOUS DESIREZ QUITER...TAPER Q:"; qit$
IF qit$ = "q" OR qit$ = "Q" THEN GOTO terminer
LOCATE 1, 1: PRINT
LOCATE 3, 4: PRINT
LOCATE 5, 1, 0: INPUT "DENSITER DE L'IMAGE DESIRER (0 >+inf) ="; dens
LOCATE 6, 1, 0: PRINT "-ZOOM"
LOCATE 7, 3, 0: INPUT "EN Xmin (-inf>+INF):"; xp
impos:
LOCATE 8, 3, 0: INPUT "EN XMAX (-inf>+inf):"; xg
IF xg = xp THEN GOTO impos
LOCATE 9, 3, 0: INPUT "EN Ymin (-inf>+inf):"; yp
impos2:
LOCATE 10, 3, 0: INPUT "EN YMAX (-inf>+inf):"; yg
IF yp = yg THEN GOTO impos2
CLS
LOCATE 1, 1, 0: PRINT "DONNEES EN COURS DE CALCUL..."
CLS
LOCATE 2, 2: COLOR 4: PRINT "ZOOM= XMIN:"; xp; "  XMAX:"; xg; "  Ymin:"; yp; "  YMAX:"; yg
LOCATE 5, 2: COLOR 15: PRINT "FRACTALE DE SIERPENS"
GOTO zoom

terminer:
END

