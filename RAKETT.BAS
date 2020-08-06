' Le programme est quasi fini, en tout cas il est jouable. J'ai r‚ussi a
' ‚liminer le clignotement de la balle et j'ai ajout‚ les bonus Enormus et
' SpeedBall. Je n'ai pas encore eu le temps de programmer le plus difficile :
' le MultiBall.

PRINT "Joueur rouge : touches 'q' et 'w'"
PRINT "Joueur bleu : touches '4' et '1'"
PRINT "Pressez la barre espace"
DO: LOOP UNTIL INKEY$ = CHR$(32)
SCREEN 12: CLS
i = 0
OPEN "rrakett.spr" FOR INPUT AS #1
OPEN "brakett.spr" FOR INPUT AS #2
     FOR x = 1 TO 9
	     FOR y = 1 TO 49
		     i = i + 1
		     INPUT #1, i, a
		     INPUT #2, i, B
		     PSET (x, y), a
		     PSET (x + 30, y), B
	     NEXT y
     NEXT x
CLOSE #1
CLOSE #2
OPEN "balle.spr" FOR INPUT AS #1
OPEN "ballle.spr" FOR INPUT AS #2
     FOR x = 1 TO 9
	     FOR y = 1 TO 9
		     i = i + 1
		     INPUT #1, i, a
		     INPUT #2, i, B
		     PSET (x + 50, y), a
		     PSET (x + 70, y), B
	     NEXT y
     NEXT x
CLOSE #1
CLOSE #2
OPEN "pavion.spr" FOR INPUT AS #1
OPEN "bcoeur.spr" FOR INPUT AS #2
     FOR x = 1 TO 9
	     FOR y = 1 TO 9
		     i = i + 1
		     INPUT #1, i, a
		     INPUT #2, i, B
		     PSET (x + 90, y), a
		     PSET (x + 110, y), B
	     NEXT y
     NEXT x
CLOSE #1
CLOSE #2
OPEN "ebonus1.spr" FOR INPUT AS #1
OPEN "mbonus1.spr" FOR INPUT AS #2
OPEN "sbonus1.spr" FOR INPUT AS #3
     FOR x = 1 TO 29
	     FOR y = 1 TO 29
		     i = i + 1
		     INPUT #1, i, a
		     INPUT #2, i, B
		     INPUT #3, i, c
		     PSET (x + 130, y), a
		     PSET (x + 170, y), B
		     PSET (x + 210, y), c
	     NEXT y
     NEXT x
CLOSE #1
CLOSE #2
CLOSE #3
OPEN "brrakett.spr" FOR INPUT AS #1
OPEN "bbrakett.spr" FOR INPUT AS #2
     FOR x = 1 TO 9
	     FOR y = 1 TO 99
		     i = i + 1
		     INPUT #1, i, a
		     INPUT #2, i, B
		     PSET (x + 250, y), a
		     PSET (x + 270, y), B
	     NEXT y
     NEXT x
CLOSE #1
CLOSE #2
DIM RaquetteRouge(103): DIM RaquetteBleue(103)
DIM BalleRouge(23): DIM BalleBleue(23)
DIM NulRaquette(103): DIM NulBalle(23)
DIM CoeurBleu(23): DIM CoeurRouge(23)
DIM SpeedBall(125): DIM NulBonus(125)
DIM Enormus(125)
DIM BigRaquetteRouge(203): DIM BigRaquetteBleue(203)
DIM NulBigRaquette(203)
GET (130, 0)-(160, 30), Enormus
GET (250, 0)-(260, 100), BigRaquetteRouge
GET (270, 0)-(280, 100), BigRaquetteBleue
GET (300, 200)-(330, 230), NulBonus
GET (210, 0)-(240, 30), SpeedBall
GET (90, 0)-(100, 10), CoeurRouge
GET (110, 0)-(120, 10), CoeurBleu
GET (0, 0)-(10, 50), RaquetteRouge
GET (30, 0)-(40, 50), RaquetteBleue
GET (50, 0)-(60, 10), BalleBleue
GET (70, 0)-(80, 10), BalleRouge
GET (300, 200)-(310, 250), NulRaquette
GET (300, 200)-(310, 210), NulBalle
GET (300, 200)-(310, 300), NulBigRaquette

deb:
PRINT "Vitesse du jeu (.1 -> 1) ?"
INPUT Speed
CLS
RANDOMIZE TIMER
yPaletr = 220
yPaletb = 220
xBall = 310
yBall = 250
EnormusBleu% = 0
EnormusRouge% = 0
CouleurBalle% = INT(RND * 2)
IF CouleurBalle% = 1 THEN
	DepX = RND * .2 + .2: DepY = RND * .2 + .2
	PUT (xBall, yBall), BalleRouge, PSET
ELSE
	DepX = -RND * .2 - .2: DepY = -RND * .2 - .2
	PUT (xBall, yBall), BalleBleue, PSET
END IF
BallSpeed = Speed
LPaletRouge = 50
LPaletBleu = 50
Blives% = 3
Rlives% = 3
LINE (0, 68)-(640, 68), 6
LINE (0, 472)-(640, 472), 6
PUT (20, yPaletr), RaquetteRouge, PSET
PUT (620, yPaletb), RaquetteBleue, PSET
FOR x = 10 TO 40 STEP 15
	PUT (x, 40), CoeurRouge, PSET
	PUT (x + 580, 40), CoeurBleu, PSET
NEXT x
xBonus = INT(RND * 560) + 30
yBonus = INT(RND * 360) + 80
Bonus% = INT(RND * 3) + 1
SELECT CASE Bonus%
	CASE 1
	PUT (xBonus, yBonus), Enormus, PSET
	CASE 2
REM     Bonus Multiball pas encore impl‚ment‚...
	CASE 3
	PUT (xBonus, yBonus), SpeedBall, PSET
END SELECT
tb = TIMER
t = TIMER
DO: LOOP WHILE TIMER - t < 2

DO
	B% = B% + 1
	IF B% = INT(BallSpeed * DepX) OR B% > 15000 THEN
		PUT (xBall, yBall), NulBalle, PSET
		B% = 0
	END IF
	k$ = INKEY$
	k$ = UCASE$(k$)
	IF k$ = "" THEN
		DepPaletR% = 0
		DepPaletB% = 0
	END IF
	IF k$ = "Q" AND yPaletr > 70 THEN
		DepPaletR% = -50
		SELECT CASE EnormusRouge%
			CASE 0
			PUT (20, yPaletr), NulRaquette, PSET
			yPaletr = yPaletr + DepPaletR%
			PUT (20, yPaletr), RaquetteRouge, PSET
			CASE 1
			PUT (20, yPaletr), NulBigRaquette, PSET
			yPaletr = yPaletr + DepPaletR%
			PUT (20, yPaletr), BigRaquetteRouge, PSET
		END SELECT
	END IF
	IF k$ = "W" AND yPaletr < 470 - LPaletRouge THEN
		DepPaletR% = 50
		SELECT CASE EnormusRouge%
			CASE 0
			PUT (20, yPaletr), NulRaquette, PSET
			yPaletr = yPaletr + DepPaletR%
			PUT (20, yPaletr), RaquetteRouge, PSET
			CASE 1
			PUT (20, yPaletr), NulBigRaquette, PSET
			yPaletr = yPaletr + DepPaletR%
			PUT (20, yPaletr), BigRaquetteRouge, PSET
		END SELECT
	END IF
	IF k$ = "4" AND yPaletb > 70 THEN
		DepPaletB% = -50
		SELECT CASE EnormusBleu%
			CASE 0
			PUT (620, yPaletb), NulRaquette, PSET
			yPaletb = yPaletb + DepPaletB%
			PUT (620, yPaletb), RaquetteBleue, PSET
			CASE 1
			PUT (620, yPaletb), NulBigRaquette, PSET
			yPaletb = yPaletb + DepPaletB%
			PUT (620, yPaletb), BigRaquetteBleue, PSET
		END SELECT
	END IF
	IF k$ = "1" AND yPaletb < 470 - LPaletBleu THEN
		DepPaletB% = 50
		SELECT CASE EnormusBleu%
			CASE 0
			PUT (620, yPaletb), NulRaquette, PSET
			yPaletb = yPaletb + DepPaletB%
			PUT (620, yPaletb), RaquetteBleue, PSET
			CASE 1
			PUT (620, yPaletb), NulBigRaquette, PSET
			yPaletb = yPaletb + DepPaletB%
			PUT (620, yPaletb), BigRaquetteBleue, PSET
		END SELECT
	END IF
	xBall = xBall + DepX * BallSpeed
	yBall = yBall + DepY * BallSpeed
	IF yBall <= 72 THEN DepY = ABS(DepY): BallSpeed = BallSpeed + .004
	IF yBall >= 458 THEN DepY = -ABS(DepY): BallSpeed = BallSpeed + .004
	IF xBall < 10 THEN GOSUB PerduRouge
	IF xBall > 620 THEN GOSUB PerduBleu
	IF xBall < 30 AND xBall > 10 AND yBall > yPaletr - 10 AND yBall < yPaletr + LPaletRouge THEN
		DepX = ABS(DepX)
		CouleurBalle% = 1
		IF DepPaletR% = 50 THEN DepY = ABS(DepY) * (RND * .6 + 1)
		IF DepPaletR% = -50 THEN DepY = -ABS(DepY) * (RND * .6 + 1)
	END IF
	IF xBall > 610 AND xBall < 620 AND yBall > yPaletb - 10 AND yBall < yPaletb + LPaletBleu THEN
		DepX = -ABS(DepX)
		CouleurBalle% = 0
		IF DepPaletB% = 50 THEN DepY = ABS(DepY) * 1.2
		IF DepPaletB% = -50 THEN DepY = -ABS(DepY) * 1.2
	END IF
	IF xBall > xBonus - 5 AND xBall < xBonus + 25 AND yBall > yBonus - 5 AND yBall < yBonus + 25 THEN
		PUT (xBonus, yBonus), NulBonus, PSET
		xBonus = 0: yBonus = 0
		SELECT CASE Bonus%
			CASE 1
			IF CouleurBalle% = 0 THEN
				LPaletBleu = 100
				EnormusBleu% = 1
				TEnormusBleu = TIMER
				IF yPaletb > 370 THEN yPaletb = 370
				PUT (620, yPaletb), BigRaquetteBleue, PSET
			ELSE
				LPaletRouge = 100
				EnormusRouge% = 1
				TEnormusRouge = TIMER
				IF yPaletr > 370 THEN yPaletr = 370
				PUT (20, yPaletr), BigRaquetteRouge, PSET
			END IF
			CASE 3
			BallSpeed = BallSpeed * 2
		END SELECT
	END IF
	IF TIMER - tb >= 30 THEN
		PUT (xBonus, yBonus), NulBonus, PSET
		Bonus% = 1
		xBonus = INT(RND * 570) + 30
		yBonus = INT(RND * 360) + 80
		SELECT CASE Bonus%
			CASE 1
			PUT (xBonus, yBonus), Enormus
			CASE 2
REM                     Bonus Multiball pas encore impl‚ment‚...
			CASE 3
			PUT (xBonus, yBonus), SpeedBall, PSET
		END SELECT
		tb = TIMER
	END IF
	IF TIMER - TEnormusBleu >= 60 THEN
		EnormusBleu% = 0: LPaletBleu = 50
		PUT (620, yPaletb), NulBigRaquette, PSET
		PUT (620, yPaletb), RaquetteBleue, PSET
		TEnormusBleu = TIMER
	END IF
	IF TIMER - TEnormusRouge >= 60 THEN
		EnormusRouge% = 0: LPaletRouge = 50
		PUT (20, yPaletr), NulBigRaquette, PSET
		PUT (20, yPaletr), RaquetteRouge, PSET
		TEnormusRouge = TIMER
	END IF
	IF CouleurBalle% = 1 THEN
		PUT (xBall, yBall), BalleRouge, PSET
	ELSE
		PUT (xBall, yBall), BalleBleue, PSET
	END IF
LOOP UNTIL k$ = CHR$(27)
END

PerduRouge:
Rlives% = Rlives% - 1
SELECT CASE Rlives%
	CASE 2
	PUT (40, 40), NulBalle, PSET
	CASE 1
	PUT (25, 40), NulBalle, PSET
	CASE 0
	PUT (10, 40), NulBalle, PSET
	CASE -1
	PRINT "Le rouge a perdu, bravo le bleu !"
	INPUT "Nouvelle Partie ? (o/n)"; Rep$
	Rep$ = UCASE$(Rep$)
	IF Rep$ = "O" THEN GOTO deb ELSE END
END SELECT
PUT (xBall, yBall), NulBalle, PSET
xBall = 310
yBall = 250
CouleurBalle% = 1
BallSpeed = Speed
DepX = RND * .2 + .2
DepY = RND * .2 + .2
PUT (xBall, yBall), BalleRouge, PSET
t = TIMER
DO: LOOP WHILE TIMER - t < 1
RETURN

PerduBleu:
Blives% = Blives% - 1
SELECT CASE Blives%
	CASE 2
	PUT (620, 40), NulBalle, PSET
	CASE 1
	PUT (605, 40), NulBalle, PSET
	CASE 0
	PUT (590, 40), NulBalle, PSET
	CASE -1
	PRINT "Bravo le rouge, le bleu s'est fait ‚cras‚ !"
	INPUT "Nouvelle Partie ? (o/n)"; Rep$
	Rep$ = UCASE$(Rep$)
	IF Rep$ = "O" THEN GOTO deb ELSE END
END SELECT
PUT (xBall, yBall), NulBalle, PSET
xBall = 310
yBall = 250
CouleurBalle% = 0
BallSpeed = Speed
DepX = -RND * .2 - .2
DepY = -RND * .2 - .2
PUT (xBall, yBall), BalleBleue, PSET
t = TIMER
DO: LOOP WHILE TIMER - t < 1
RETURN

