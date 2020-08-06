SCREEN 12: CLS
DIM sapin(94): DIM maison(125): DIM mountain(1038)
DIM jet(169): DIM alien(169)
DIM laser(34): DIM missile(34)
DIM pavion(23): DIM nulpavion(23)
DIM explode(247): DIM nulexplode(247)
DIM boss1(1770): DIM nulboss1(1770)
DIM nuljet(169)
DIM nullaser(34)
DIM nulsapin(94): DIM nulmaison(125): DIM nulmountain(1038)
RANDOMIZE TIMER
LOCATE 30, 1: PRINT "Chargement des sprites en cours, veuillez patienter..."
i = 0
OPEN "sapin.spr" FOR INPUT AS #1
FOR x = 1 TO 19
        FOR y = 1 TO 29
                i = i + 1
                INPUT #1, i, a
                PSET (x, y), a
        NEXT y
NEXT x
CLOSE #1
i = 0
OPEN "maison.spr" FOR INPUT AS #1
FOR x = 1 TO 29
        FOR y = 1 TO 29
                i = i + 1
                INPUT #1, i, a
                PSET (x + 30, y), a
        NEXT y
NEXT x
CLOSE #1
i = 0
OPEN "mountain.spr" FOR INPUT AS #1
FOR x = 1 TO 129
        FOR y = 1 TO 59
                i = i + 1
                INPUT #1, i, a
                PSET (x + 70, y), a
        NEXT y
NEXT x
CLOSE #1
i = 0
OPEN "laser.spr" FOR INPUT AS #1
OPEN "missile.spr" FOR INPUT AS #2
FOR x = 1 TO 19
        FOR y = 1 TO 9
                i = i + 1
                INPUT #1, i, a
                PSET (x + 210, y), a
                INPUT #2, i, B
                PSET (x + 310, y), B
        NEXT y
NEXT x
CLOSE #1
CLOSE #2
i = 0
OPEN "jet.spr" FOR INPUT AS #1
OPEN "alien.spr" FOR INPUT AS #2
FOR x = 1 TO 59
        FOR y = 1 TO 19
                i = i + 1
                INPUT #1, i, a
                PSET (x + 240, y), a
                INPUT #2, i, B
                PSET (x + 340, y), B
        NEXT y
NEXT x
CLOSE #1
CLOSE #2
i = 0
OPEN "pavion.spr" FOR INPUT AS #1
FOR x = 1 TO 9
        FOR y = 1 TO 9
                i = i + 1
                INPUT #1, i, a
                PSET (x + 410, y), a
        NEXT y
NEXT x
CLOSE #1
i = 0
OPEN "explode.spr" FOR INPUT AS #1
FOR x = 1 TO 39
        FOR y = 1 TO 39
                i = i + 1
                INPUT #1, i, a
                PSET (x + 430, y), a
        NEXT y
NEXT x
CLOSE #1
i = 0
OPEN "boss1.spr" FOR INPUT AS #1
FOR x = 1 TO 229
        FOR y = 1 TO 59
                i = i + 1
                INPUT #1, i, a
                PSET (x, y + 70), a
        NEXT y
NEXT x
CLOSE #1
GET (0, 70)-(230, 130), boss1
LINE (0, 70)-(230, 130), 1, B
GET (430, 0)-(470, 40), explode
GET (240, 0)-(300, 20), jet
GET (210, 0)-(230, 10), laser
GET (0, 0)-(20, 30), sapin
GET (30, 0)-(60, 30), maison
GET (70, 0)-(200, 60), mountain
GET (310, 0)-(330, 10), missile
GET (340, 0)-(400, 20), alien
GET (410, 0)-(420, 10), pavion
GET (400, 200)-(630, 260), nulboss1
GET (500, 0)-(510, 10), nulpavion
GET (500, 0)-(540, 40), nulexplode
GET (500, 0)-(520, 30), nulsapin
GET (500, 0)-(530, 30), nulmaison
GET (500, 0)-(630, 60), nulmountain
GET (500, 0)-(520, 10), nullaser
GET (500, 0)-(560, 20), nuljet
SLEEP
CLS
LINE (0, 350)-(640, 350), 2
DIM pospaysage(2, 1)
DIM posmissile(4, 1)
FOR i = 0 TO 2
        pospaysage(i, 0) = RND * 560
        pospaysage(i, 1) = 319
NEXT i
SLEEP
pospaysage(2, 1) = 289
xjet = 50: yjet = 175
OPEN "joystick.dat" FOR RANDOM AS #1
GET #1, 1, xjoy
GET #1, 2, yjoy
CLOSE #1
missiletire = -1
t = TIMER
tboss = TIMER
yalien = INT(RND * 270)
xalien = 550
FOR x = 550 TO 590 STEP 20
        PUT (x, 0), pavion, PSET
NEXT x
lives = 3
xboss1 = 400: yboss1 = INT(RND * 230)
dxboss1 = -10
ptboss1 = 2500
DO
        PUT ((pospaysage(0, 0)), (pospaysage(0, 1))), sapin, PSET
        PUT ((pospaysage(1, 0)), (pospaysage(1, 1))), maison, PSET
        PUT ((pospaysage(2, 0)), (pospaysage(2, 1))), mountain, PSET
        PUT (xjet, yjet), jet, PSET
        FOR i = 0 TO 2
                IF pospaysage(i, 0) <= 10 THEN
                        PUT ((pospaysage(i, 0)), 289), nulmountain, PSET
                        pospaysage(i, 0) = 509
                        IF i < 2 THEN pospaysage(i, 0) = 609
                END IF
        NEXT i
        IF STICK(0) < xjoy - 5 THEN PUT (xjet, yjet), nuljet, PSET: xjet = xjet - 15
        IF STICK(0) > xjoy + 5 THEN PUT (xjet, yjet), nuljet, PSET: xjet = xjet + 15
        IF STICK(1) < yjoy - 5 THEN PUT (xjet, yjet), nuljet, PSET: yjet = yjet - 15
        IF STICK(1) > yjoy + 5 THEN PUT (xjet, yjet), nuljet, PSET: yjet = yjet + 15
        IF STRIG(0) = -1 AND missiletire < 4 THEN
                missiletire = missiletire + 1
                posmissile(missiletire, 0) = xjet + 60
                posmissile(missiletire, 1) = yjet + 10
        END IF
        FOR i = 1 TO missiletire
                PUT (posmissile(i, 0), posmissile(i, 1)), nullaser, PSET
                posmissile(i, 0) = posmissile(i, 0) + 20
                IF posmissile(i, 0) >= 610 THEN posmissile(i, 0) = 610
                PUT (posmissile(i, 0), posmissile(i, 1)), missile, PSET
                IF posmissile(i, 0) = 610 THEN PUT (610, posmissile(i, 1)), nullaser, PSET
                IF (posmissile(i, 0) <= xalien + 50 AND posmissile(i, 0) >= xalien - 10 AND posmissile(i, 1) <= yalien + 20 AND posmissile(i, 1) >= yalien) AND i <> missiletouche AND TIMER - t >= 5 THEN
                        t = TIMER
                        PUT (xalien, yalien), nuljet, PSET
                        PUT (xalien + 10, yalien - 10), explode, PSET
                        SLEEP .7
                        PUT (xalien + 10, yalien - 10), nulexplode, PSET
                        yalien = INT(RND * 270)
                        xalien = 550
                        missiletouche = i
                        pts = pts + 1000
                END IF
                IF posmissile(i, 0) <= xboss1 + 140 AND posmissile(i, 0) >= xboss1 + 80 AND posmissile(i, 1) <= yboss1 + 60 AND posmissile(i, 1) >= yboss1 + 45 AND boss = 1 THEN
                        PRINT "Boss touch‚"; RND * 10
                        ptboss1 = ptboss1 - 50
                END IF
                PUT (posmissile(missiletouche, 0), posmissile(missiletouche, 1)), nullaser, PSET
        NEXT i
        IF ptboss1 <= 0 THEN GOTO bossdestroyed
        IF missiletire >= 4 AND posmissile(4, 0) >= 610 THEN missiletire = -1
        IF yjet >= 270 THEN yjet = 270
        IF yjet < 15 THEN yjet = 15
        IF xjet < 15 THEN xjet = 15
        IF xjet > 550 THEN xjet = 550
        IF TIMER - t >= 5 THEN
                PUT (xalien, yalien), nuljet, PSET
                xalien = xalien - 15
                yalien = yalien + COS(angle) * 15
                angle = angle + .5
                IF angle > 3.1416 * 1000 THEN angle = 0
                IF yalien < 10 THEN yalien = 10
                IF yalien >= 270 THEN yalien = 270
                IF xalien <= 15 THEN xalien = 550
                PUT (xalien, yalien), alien, PSET
                missiletouche = 0
                IF nb = 1 AND lasertire = 0 AND xalien > 25 THEN
                        xlaser = xalien - 20: ylaser = yalien
                        PUT (xlaser - 20, ylaser), laser, PSET
                        lasertire = 1
                        PUT (xlaser - 20, ylaser), nullaser, PSET
                END IF
        END IF
        IF lasertire = 1 THEN
                PUT (xlaser, ylaser), nullaser, PSET
                xlaser = xlaser - 25
                IF xlaser <= xjet + 60 AND xlaser >= xjet - 15 AND ylaser <= yjet + 15 AND ylaser >= yjet - 5 THEN GOSUB touche
                IF xlaser <= 10 THEN
                        xlaser = 10: lasertire = 0
                END IF
                IF lasertire = 1 THEN PUT (xlaser, ylaser), laser, PSET
        END IF
        nb = INT(RND * 5)
        IF xalien <= xjet + 60 AND xalien >= xjet - 30 AND yalien <= yjet + 20 AND yalien >= yjet - 5 THEN GOSUB collision
        LOCATE 1, 1: PRINT pts
        IF TIMER - tboss >= 300 THEN
                boss = 1
                PUT (xboss1, yboss1), nulboss1, PSET
                xboss1 = xboss1 + dxboss1
                dep = INT(RND * 2)
                IF dep = 0 THEN yboss1 = yboss1 - 10
                IF dep = 1 THEN yboss1 = yboss1 + 10
                IF yboss1 <= 15 THEN yboss1 = 10
                IF yboss1 >= 230 THEN yboss1 = 230
                IF xboss1 <= 10 THEN xboss1 = 10: dxboss1 = 10
                IF xboss1 >= 400 THEN xboss1 = 400: dxboss1 = -10
                IF xjet < xboss1 + 230 AND xjet > xboss1 - 30 AND yjet < yboss1 + 60 AND yjet > yboss1 - 10 THEN GOSUB touche
                PUT (xboss1, yboss1), boss1, PSET
        END IF

        PUT ((pospaysage(0, 0)), (pospaysage(0, 1))), nulsapin, PSET
        PUT ((pospaysage(1, 0)), (pospaysage(1, 1))), nulmaison, PSET
        PUT ((pospaysage(2, 0)), (pospaysage(2, 1))), nulmountain, PSET
        FOR i = 0 TO 2
                pospaysage(i, 0) = pospaysage(i, 0) - 10
        NEXT i
LOOP UNTIL INKEY$ = CHR$(27)
END

collision:
PUT (xjet + 10, yjet - 10), explode, PSET
PUT (xalien + 10, yalien - 10), explode, PSET
lives = lives - 1
SELECT CASE lives
        CASE 2
        PUT (590, 0), nulpavion, PSET
        CASE 1
        PUT (570, 0), nulpavion, PSET
        CASE 0
        PUT (550, 0), nulpavion, PSET
        CASE -1
        GOTO enrgscores
END SELECT
SLEEP 2
t = TIMER
PUT (xjet + 10, yjet - 10), nulexplode, PSET
PUT (xalien + 10, yalien - 10), nulexplode, PSET
PUT (xalien, yalien), nuljet, PSET
xalien = 550
RETURN

touche:
PRINT "Touch‚"; INT(RND * 10)
lasertire = 0
PUT (xlaser, ylaser), nullaser, PSET
PUT (xjet + 10, yjet - 10), explode, PSET
SLEEP 2
lives = lives - 1
SELECT CASE lives
        CASE 2
        PUT (590, 0), nulpavion, PSET
        CASE 1
        PUT (570, 0), nulpavion, PSET
        CASE 0
        PUT (550, 0), nulpavion, PSET
        CASE -1
        GOTO enrgscores
END SELECT
PUT (xjet + 10, yjet - 10), nulexplode, PSET
yjet = yjet + 50
IF yjet >= 270 THEN yjet = 270
RETURN

bossdestroyed:
LOCATE 2, 1: PRINT "C'est Gagn‚ !"
total = pts + 10000
FOR x = xboss1 TO xboss1 + 230 STEP 40
        PUT (x, yboss1 + RND * 50), explode, PSET
        SLEEP .7
NEXT x
FOR pts = pts TO total
        LOCATE 1, 1: PRINT pts
NEXT pts
pts = pts - 1

enrgscores:
DIM noms$(1 TO 8): DIM scores(1 TO 8)
INPUT "Entrez votre nom (8 caractŠres maxi.) : "; joueur$
joueur$ = UCASE$(joueur$)
joueur$ = LEFT$(joueur$, 8)
IF joueur$ = "INIT" THEN GOTO initfichier
OPEN "idscores.dat" FOR RANDOM AS #1
FOR i = 9 TO 16
        GET #1, i, score
        IF pts >= score THEN EXIT FOR
NEXT i
IF i = 17 AND pts < score THEN GOTO affichscr
IF i > 9 THEN
        FOR i = 9 TO i - 1
                GET #1, i, score
                scores(i - 8) = score
                GET #1, i - 8, nom$
                noms$(i - 8) = nom$
        NEXT i
END IF
scores(i - 8) = pts
noms$(i - 8) = joueur$
FOR i = i TO 16
        GET #1, i, score
        GET #1, i - 8, nom$
        IF i <= 15 THEN
                scores(i - 7) = score
                noms$(i - 7) = nom$
        END IF
NEXT i
FOR i = 1 TO 8
        PUT #1, i, noms$(i)
        PUT #1, i + 8, scores(i)
        PRINT noms$(i), scores(i)
NEXT i
CLOSE #1
END

affichscr:
FOR i = 1 TO 8
        GET #1, i, noms$(i)
        GET #1, i + 8, scores(i)
        PRINT noms$(i), scores(i)
NEXT i
CLOSE #1
END

initfichier:
OPEN "idscores.dat" FOR RANDOM AS #1
nom$ = "ANONYME"
score = 8000
FOR i = 1 TO 8
        PUT #1, i, nom$
        PUT #1, i + 8, score
        score = score - 1000
NEXT i
CLOSE #1









