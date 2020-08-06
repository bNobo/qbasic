SCREEN 12: CLS
DIM helico(400): DIM tir(200)
DIM ase(200): DIM enfire(100)
DIM flam(400): DIM tank1(400)
DIM tank2(400): DIM tank3(400)
DIM explosion(400)
RANDOMIZE TIMER
xh = 300: yh = 200
xa = INT(RND * 600): ya = INT(RND * 300)
e = 1: pt = 0: lives = 5
CIRCLE (50, 50), 10
DATA 50,60,50,80,45,75,55,75,40,40,60,60,60,40,40,60,50,40,50,37
helico: DATA 97.5,98,102.5,98,94,94,106,106,94,104,106,94
DATA 95,100,95,95,95,95,97.5,90,97.5,90,102.5,90,102.5,90,105,95
DATA 105,95,105,100,105,100,100,115,100,115,95,100,97.5,112,102.5,112
DATA 97.5,90,97,98,102.5,90,103,98,103,98,105,95,97,98,95,95,92.5,95,107.5,105
DATA 107.5,95,92.5,105
corps: DATA 200,200,210,215,202,201,208,203,198,198,201,217,209,198,212
DATA 217,205,208,205,208
canon1: DATA 204,210,206,220,202,220,208,223
canon2: DATA 208,207,218,209,218,205,221,211
canon3: DATA 192,207,202,209,189,205,192,211
explosion: DATA 150,150,155,160,155,160,165,160,165,160,160,170,160,170
DATA 165,180,165,180,155,180,155,180,150,190,150,190,145,180,145,180
DATA 135,180,135,180,140,170,140,170,135,160,135,160,145,160,145,160,150,150
LINE (150, 100)-(152, 105), 4, BF
LINE (151, 106)-(151, 108), 14
GET (148, 99)-(154, 115), tir
FOR i = 1 TO 5
READ x, y
READ x1, y1
LINE (x, y)-(x1, y1)
NEXT i
CIRCLE (50, 50), 10, 14
PAINT (50, 50), 2, 14
LINE (50, 40)-(50, 60), 4
LINE (40, 50)-(60, 50), 4
GET (40, 40)-(60, 60), ase
CIRCLE (50, 20), 3, 14
GET (45, 15)-(55, 25), enfire
FOR x = 0 TO 10
FOR y = 0 TO INT(RND * 30)
c = INT(RND * 4)
IF c = 0 THEN col = 0
IF c = 1 THEN col = 4
IF c = 2 THEN col = 14
IF c = 3 THEN col = 12
PSET (x, y), col
NEXT y
NEXT x
GET (0, 0)-(30, 45), flam
RESTORE helico
FOR i = 1 TO 17
READ x, y
READ x1, y1
LINE (x, y)-(x1, y1), 6
NEXT i
PAINT (100, 95), 1, 6: PAINT (100, 105), 8, 6
PAINT (96, 100), 8, 6: PAINT (103, 100), 8, 6
PAINT (97, 95), 1, 6
GET (85, 85)-(115, 125), helico
CLS
RESTORE corps
FOR i = 1 TO 5
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 8, B
NEXT i
CIRCLE (205, 208), 3, 8
RESTORE canon1
FOR i = 1 TO 2
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 8, B
NEXT i
GET (175, 190)-(225, 230), tank1
CLS
RESTORE corps
FOR i = 1 TO 5
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 8, B
NEXT i
CIRCLE (205, 208), 3, 8
RESTORE canon2
FOR i = 1 TO 2
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 8, B
NEXT i
GET (175, 190)-(230, 225), tank2
CLS
RESTORE corps
FOR i = 1 TO 5
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 8, B
NEXT i
CIRCLE (205, 208), 3, 8
RESTORE canon3
FOR i = 1 TO 2
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 8, B
NEXT i
GET (175, 190)-(220, 250), tank3
PUT (250, 250), tir, PSET
CLS
RESTORE explosion
FOR i = 1 TO 12
READ x, y, x1, y1
LINE (x, y)-(x1, y1), 14
NEXT i
PAINT (150, 170), 4, 14
GET (130, 150)-(170, 190), explosion
SLEEP: CLS
KEY(11) ON: KEY(12) ON
KEY(13) ON: KEY(14) ON
PUT (xa, ya), ase
DO
IF ABS(xh - xa) <= 20 AND ABS(yh - ya) <= 20 AND dd = 0 THEN GOSUB badaboom
PUT (xh, yh), helico, PSET
ON KEY(11) GOSUB haut
ON KEY(12) GOSUB gauche
ON KEY(13) GOSUB droite
xh = xh + roc
yh = yh + co
a$ = INKEY$
IF a$ = CHR$(32) THEN GOSUB tir
IF a$ = "5" THEN GOSUB bas
IF a$ = "*" THEN END
IF a = 1 THEN
PUT (xt, yt), tir, PSET
yt = yt - 2
END IF
IF yt < 10 THEN a = 0
tp = POINT(xt + 2, yt - 5)
IF tp = 2 OR tp = 4 THEN GOSUB destroy
IF yh < 10 THEN
yh = 350: CLS
dd = 0
xa = INT(RND * 600): ya = INT(RND * 300)
PUT (xa, ya), ase
e = 1
END IF
IF en = 0 AND e = 1 THEN GOSUB tirennemi
xe = xe + n: ye = ye + m
PUT (xe, ye), enfire, PSET
IF xe > 600 OR xe < 10 OR ye > 400 THEN
en = 0: n = 0: m = 0
END IF
IF xe - xh < 25 AND xe - xh > 0 AND ye - yh > -5 AND ye - yh < 5 THEN GOSUB badaboom
IF xh > 600 THEN xh = 600
IF xh < 10 THEN xh = 10
IF yh > 400 THEN yh = 400
LOCATE 1, 1: PRINT pt; "Pts"
IF pt >= 5000 THEN GOTO level2
LOOP

haut: roc = 0: co = -1.5
RETURN

gauche: roc = -1.5: co = 0
RETURN

droite: roc = 1.5: co = 0
RETURN

bas: roc = 0: co = 1.5
RETURN

tir: IF a = 1 THEN RETURN
xt = xh + 15: yt = yh - 10
PUT (xt, yt), tir, PSET
a = 1
RETURN

destroy: PUT (xa, ya), ase, XOR
e = 0: pt = pt + 500
dd = 1
RETURN

tirennemi: xe = xa + 8: ye = ya + 20
PUT (xe, ye), enfire, PSET
en = 1
IF xh > xa THEN n = 1: m = 2
IF xh < xa THEN n = -1: m = 2
IF ABS(xh - xa) < 20 THEN n = 0: m = 2
RETURN

badaboom:
PUT (xh, yh), helico, PSET
PUT (xh + 10, yh + 25), flam, PSET
ye = ye + 20
lives = lives - 1
IF lives = 0 THEN GOTO death
SLEEP
RETURN

level2: e = 1
CLS : PRINT "Level Two"
yh = 350
SLEEP
xtank = INT(RND * 600): ytank = INT(RND * 400)
DO
PUT (xh, yh), helico, PSET
ON KEY(11) GOSUB haut
ON KEY(12) GOSUB gauche
ON KEY(13) GOSUB droite
ON KEY(14) GOSUB bas
xh = xh + roc
yh = yh + co
a$ = INKEY$
IF a$ = CHR$(32) THEN GOSUB tir
IF a$ = "*" THEN END
IF a = 1 THEN
PUT (xt, yt), tir, PSET
yt = yt - 2
END IF
IF yt < 10 THEN a = 0
IF yh < 10 THEN
yh = 350: pts = 1: CLS
xtank = INT(RND * 550): ytank = INT(RND * 300)
PUT (xtank, ytank), tank1, PSET
END IF
IF xh - xtank < 50 AND xh - xtank > -50 THEN PUT (xtank, ytank), tank1, PSET
IF xh < xtank - 50 THEN PUT (xtank, ytank), tank3, PSET
IF xh > xtank + 50 THEN PUT (xtank, ytank), tank2, PSET
IF xh > 600 THEN xh = 600
IF xh < 10 THEN xh = 10
IF yh > 400 THEN yh = 400
LOCATE 1, 1: PRINT pt; "Pts"
IF e = 1 THEN GOSUB tirtank
PUT (xe, ye), enfire, PSET
xe = xe + n: ye = ye + m
IF xe > 600 OR xe < 10 OR ye > 400 THEN
e = 1: n = 0: m = 0
END IF
IF xt - xtank < 50 AND xt - xtank > -50 AND yt < ytank + 50 THEN GOSUB crashtank
IF xe - xh < 15 AND xe - xh > -15 AND ye - yh > -15 AND ye - yh < 30 THEN GOSUB badaboom
LOOP

tirtank:
IF xh - xtank < 50 AND xh - xtank > -50 THEN
n = 0: m = 2
xe = xtank + 25: ye = ytank + 35
END IF
IF xh < xtank - 50 THEN
n = -2: m = 0
xe = xtank: ye = ytank + 13
END IF
IF xh > xtank + 50 THEN
n = 2: m = 0
xe = xtank + 50: ye = ytank + 13
END IF
e = 0
RETURN

crashtank: PUT (xtank + 10, ytank), explosion, PSET
e = 0: IF pts = 1 THEN pt = pt + 500
pts = 0
RETURN

death: CLS
PRINT "GAME OVER !"
INPUT "Entrez votre nom : "; nom$
PRINT nom$; ", vous avez "; pt; " points"
nom = VAL(nom$)
OPEN "score.sco" FOR RANDOM AS #1
GET #1, 1, pt1
IF pt1 < pt THEN
PUT #1, 1, pt
PUT #1, 2, nom$
END IF
GET #1, 1, pt
GET #1, 2, nom$
CLOSE #1
PRINT "Meilleur score : "
PRINT nom$, pt











