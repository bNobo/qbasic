SCREEN 12: CLS
RANDOMIZE TIMER
REM $DYNAMIC
DIM palet(500): DIM ball(100): DIM nulball(100)
DIM brick(300): DIM nul(300)
DIM nom$(10): DIM score(10)
DIM bonus(300)
'OPEN "joystick.dat" FOR RANDOM AS #5
'GET #5, 1, xjoy
'CLOSE #5
niveau = 1
        OPEN "palet.spr" FOR INPUT AS #1
        OPEN "ball.spr" FOR INPUT AS #2
        OPEN "brick.spr" FOR INPUT AS #3
        OPEN "bonus.spr" FOR INPUT AS #4
                FOR x = 1 TO 99
                        FOR y = 1 TO 9
                        i = i + 1
                        INPUT #1, i, a
                        PSET (x + 50, y + 50), a
                        NEXT y
                NEXT x
                FOR x = 1 TO 9
                        FOR y = 1 TO 9
                        i = i + 1
                        INPUT #2, i, a
                        PSET (x + 10, y + 10), a
                        NEXT y
                NEXT x
                FOR x = 1 TO 29
                        FOR y = 1 TO 19
                        i = i + 1
                        INPUT #3, i, a
                        INPUT #4, i, B
                        PSET (x + 200, y + 50), a
                        PSET (x + 200, y + 100), B
                        NEXT y
                NEXT x
        CLOSE #1
        CLOSE #2
        CLOSE #3
        CLOSE #4
        LOCATE 15, 1
        PRINT "'Entr‚e' pour jouer, 'e' pour ‚diter..."
        SLEEP
GET (30, 45)-(170, 65), palet
GET (10, 10)-(20, 20), ball
GET (200, 50)-(230, 70), brick
GET (200, 100)-(230, 120), bonus
GET (300, 50)-(330, 70), nul
GET (300, 50)-(310, 60), nulball
CLS
DIM position(27, 2): DIM etat(27)
i = 1
FOR x = 124 TO 444 STEP 40
        FOR y = 32 TO 84 STEP 26
                PUT (x, y), brick
                position(i, 1) = x
                position(i, 2) = y
                i = i + 1
        NEXT y
NEXT x
FOR i = 1 TO 27
        etat(i) = 1
NEXT i
nbbrick = 27

deb:
LINE (2, 0)-(615, 0), 1: LINE (615, 0)-(615, 460), 1
LINE (2, 460)-(2, 0), 1
xpalet = 220: ypalet = 450
m = -2: n = 2
vitesse = 2
t = TIMER
FOR i = 1 TO 1000
        xball = xpalet + 60
        yball = 439
        PUT (xball, yball), ball, PSET
        a$ = INKEY$
        IF a$ <> "" THEN
                IF a$ = "6" THEN xpalet = xpalet + 16
                IF a$ = "4" THEN xpalet = xpalet - 16
                IF a$ = CHR$(32) THEN EXIT FOR
        END IF
       ' IF STICK(0) > xjoy + 2 THEN xpalet = xpalet + 16
       ' IF STICK(0) < xjoy - 2 THEN xpalet = xpalet - 16
       ' IF STRIG(0) = -1 THEN EXIT FOR
        IF xpalet > 490 THEN xpalet = 490
        IF xpalet < 5 THEN xpalet = 5
        PUT (xpalet, ypalet), palet, PSET
        PUT (xball, yball), nulball, PSET
NEXT i
DO
        IF xpalet > 490 THEN xpalet = 490
        IF xpalet < 5 THEN xpalet = 10
        PUT (xpalet, ypalet), palet, PSET
        k$ = INKEY$
        IF k$ <> "" THEN
                IF k$ = CHR$(27) THEN END
                IF k$ = "e" OR k$ = "E" THEN GOTO brickedit
                IF k$ = "l" THEN GOTO gagne
                IF k$ = "6" THEN xpalet = xpalet + 26
                IF k$ = "4" THEN xpalet = xpalet - 26
        END IF
        'IF STICK(0) > xjoy + 5 THEN xpalet = xpalet + 26
        'IF STICK(0) < xjoy - 5 THEN xpalet = xpalet - 26
        IF yball < 10 THEN m = vitesse
        IF xball <= 16 THEN n = RND * vitesse
        IF xball > 595 THEN n = -RND * vitesse
        PUT (xball, yball), nulball, PSET
        xball = xball + n
        yball = yball + m
        IF yball > 460 THEN GOTO perdu
        PUT (xball, yball), ball, PSET
        IF xball > xpalet AND xball < xpalet + 110 AND yball >= 440 THEN
                m = -m: pt = pt + 500
                SOUND 50, .5
        END IF
        test = 0
        FOR i = 1 TO nbbrick
                xbrick = position(i, 1): ybrick = position(i, 2)
                IF xball > xbrick - 8 AND xball < xbrick + 30 AND yball > ybrick - 10 AND yball < ybrick + 20 AND etat(i) = 1 THEN
                        PUT (xbrick, ybrick), nul, PSET
                        m = -m: pt = pt + 1000
                        etat(i) = etat(i) - 1
                        SOUND RND * 700 + 50, .5
                END IF
                IF (xball > xbrick - 10 AND xball < xbrick - 5 AND yball > ybrick + 1 AND yball < ybrick + 17 OR xball > xbrick + 28 AND xball < xbrick + 32 AND yball > ybrick + 1 AND yball < ybrick + 17) AND etat(i) = 1 THEN
                       PUT (xbrick, ybrick), nul, PSET
                       n = -n: pt = pt + 1000
                       etat(i) = etat(i) - 1
                       SOUND RND * 700 + 50, .5
                END IF
                IF etat(i) = 0 THEN test = test + 1
                IF test = nbbrick THEN GOTO gagne
        NEXT i
        LOCATE 1, 1: PRINT pt
        IF TIMER - t >= 5 THEN
                jeremy = INT(RND * 5)
                IF jeremy = 3 THEN
                        PUT (xbonus, ybonus), nul, PSET
                        xbonus = INT(RND * 600): ybonus = 450
                        PUT (xbonus, ybonus), bonus, PSET
                END IF
                FOR i = 1 TO nbbrick
                        IF etat(i) > 0 THEN PUT (position(i, 1), position(i, 2)), brick, PSET
                        t = TIMER
                NEXT i
        END IF
        IF jeremy = 3 AND TIMER - t > 2 THEN jeremy = 0: PUT (xbonus, ybonus), nul, PSET
        IF xpalet < xbonus + 30 AND xpalet > xbonus - 100 AND jeremy = 3 THEN
                PUT (xbonus, ybonus), nul, PSET
                jeremy = 0
                pt = pt + 2000
        END IF
        vitesse = vitesse + .0005
LOOP

perdu:
PRINT "PERDU !!!"
OPEN "cscore.dat" FOR RANDOM AS #1
INPUT "Entrez votre nom : "; name$
CLS
FOR i = 1 TO 10
        GET #1, i, nom$
        GET #1, i + 10, score
        score(i) = score
        nom$(i) = nom$
NEXT i
FOR i = 1 TO 10
        IF pt > score(i) THEN
                score(i) = pt
                nom$(i) = name$
                EXIT FOR
        END IF
NEXT i
FOR i = 1 TO 10
        PUT #1, i, nom$(i)
        PUT #1, i + 10, score(i)
NEXT i
FOR i = 1 TO 10
        GET #1, i, nom$
        GET #1, i + 10, score
        LOCATE i, 1: PRINT nom$
        LOCATE i, 20: PRINT score
NEXT i
CLOSE #1

END

gagne:
PRINT "GAGNE !!!"
CLS
niveau = niveau + 1
PRINT "Niveau : "; niveau
IF niveau > 10 THEN GOTO suit
SLEEP
IF niveau = 2 THEN
        OPEN "niveau02.dat" FOR RANDOM AS #1
        nbbrick = 25
END IF
IF niveau = 3 THEN
        OPEN "niveau03.dat" FOR RANDOM AS #1
        nbbrick = 32
END IF
IF niveau = 4 THEN
        OPEN "niveau04.dat" FOR RANDOM AS #1
        nbbrick = 25
END IF
IF niveau = 5 THEN
        OPEN "niveau05.dat" FOR RANDOM AS #1
        nbbrick = 24
END IF
IF niveau = 6 THEN
        OPEN "niveau06.dat" FOR RANDOM AS #1
        nbbrick = 40
END IF
IF niveau = 7 THEN
        OPEN "niveau07.dat" FOR RANDOM AS #1
        nbbrick = 28
END IF
IF niveau = 8 THEN
        OPEN "niveau08.dat" FOR RANDOM AS #1
        nbbrick = 18
END IF
IF niveau = 9 THEN
        OPEN "niveau09.dat" FOR RANDOM AS #1
        nbbrick = 34
END IF
IF niveau = 10 THEN
        OPEN "niveau10.dat" FOR RANDOM AS #1
        nbbrick = 50
END IF

REDIM position(nbbrick, 2)
REDIM etat(nbbrick)
FOR i = 1 TO nbbrick
        GET #1, i * 2 - 1, position(i, 1)
        GET #1, i * 2, position(i, 2)
        PUT (position(i, 1), position(i, 2)), brick, PSET
        etat(i) = 1
NEXT i
CLOSE #1
GOTO deb
suit:
OPEN "cscore.dat" FOR RANDOM AS #1
INPUT "Entrez votre nom : "; name$
FOR i = 1 TO 10
        GET #1, i, nom$
        GET #1, i + 10, score
        score(i) = score
        nom$(i) = nom$
NEXT i
FOR i = 1 TO 10
        IF pt > score(i) THEN
                score(i) = pt
                nom$(i) = name$
                EXIT FOR
        END IF
NEXT i
FOR i = 1 TO 10
        PUT #1, i, nom$(i)
        PUT #1, i + 10, score(i)
NEXT i
FOR i = 1 TO 10
        GET #1, i, nom$
        GET #1, i + 10, score
        LOCATE i, 1: PRINT nom$
        LOCATE i, 20: PRINT score
NEXT i
CLOSE #1
END

brickedit:
INPUT "Nombre de briques maxi : "; nbbrick
CLS
nb = 1
DIM brickpos(nbbrick, 2)
DO
        FOR i = 1 TO nbbrick
                PUT (xbrick, ybrick), brick, PSET
                k$ = INKEY$
                IF k$ = "6" THEN
                        PUT (xbrick, ybrick), nul, PSET
                        xbrick = xbrick + 36
                END IF
                IF k$ = "4" THEN
                        PUT (xbrick, ybrick), nul, PSET
                        xbrick = xbrick - 36
                END IF
                IF k$ = "5" THEN
                        PUT (xbrick, ybrick), nul, PSET
                        ybrick = ybrick + 25
                END IF
                IF k$ = "8" THEN
                        PUT (xbrick, ybrick), nul, PSET
                        ybrick = ybrick - 25
                END IF
                IF k$ = CHR$(32) THEN
                        brickpos(nb, 1) = xbrick
                        brickpos(nb, 2) = ybrick
                        nb = nb + 1
                        IF nb > nbbrick + 1 THEN PRINT "Trop de briques !!!": END
                END IF
                IF k$ = "s" THEN GOTO savelevel
                PUT (brickpos(i, 1), brickpos(i, 2)), brick, PSET
        NEXT i
LOOP

savelevel:
INPUT "Nom du niveau (*.dat) : "; nomniveau$
OPEN nomniveau$ FOR RANDOM AS #1
FOR i = 1 TO nbbrick
        PUT #1, i * 2 - 1, brickpos(i, 1)
        PUT #1, i * 2, brickpos(i, 2)
NEXT i
CLS
FOR i = 1 TO nbbrick
        GET #1, i * 2 - 1, brickpos(i, 1)
        GET #1, i * 2, brickpos(i, 2)
        PUT (brickpos(i, 1), brickpos(i, 2)), brick, PSET
NEXT i
CLOSE #1







