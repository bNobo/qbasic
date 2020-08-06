CLS
INPUT "Test de joystick (t) ou centrage (c) ?"; rep$
IF rep$ = "t" THEN GOTO test ELSE GOTO centrage

centrage:
PRINT "Centrez le joystick et appuyer sur entr‚e"
SLEEP
xjoy = STICK(0): yjoy = STICK(1)
PRINT "Poussez le joystick en haut … gauche et appuyez sur entr‚e"
SLEEP
xjmin = STICK(0): yjmin = STICK(1)
PRINT "Poussez le joystick en bas … droite et appuyez sur entr‚e"
SLEEP
xjmax = STICK(0): yjmax = STICK(1)
OPEN "joystick.dat" FOR RANDOM AS #1
PUT #1, 1, xjoy
PUT #1, 2, yjoy
PUT #1, 3, xjmin
PUT #1, 4, yjmin
PUT #1, 5, xjmax
PUT #1, 6, yjmax
END

test:
CLS
DO
        LOCATE 1, 1: PRINT STICK(0); " ", STICK(1); " "
        IF STRIG(0) = -1 THEN bouton1 = 1 ELSE bouton1 = 0
        IF STRIG(4) = -1 THEN bouton2 = 1 ELSE bouton2 = 0
        LOCATE 1, 40: PRINT "Bouton 1 : "; bouton1
        LOCATE 2, 40: PRINT "Bouton 2 : "; bouton2
        a$ = INKEY$
        IF a$ = CHR$(27) THEN EXIT DO
LOOP
END

