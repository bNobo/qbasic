REM   ***********************************************************************
REM   ** Ce programme ne trace que 2 courbes : y (en vert) et y1 (en cyan) **
REM   ** , mais si vous ˆtes un peu programmeur, vous vous apercevrez vite **
REM   ** que vous pouvez en tracer autant que vous le d‚sirez. Modifiez    **
REM   ** les valeurs y et y1 plus bas, afin de tracer les courbes voulues. **
REM   ***********************************************************************
' PROGRAMMED BY BINAIRE.

SCREEN 12: CLS
INPUT "Souhaitez-vous modifier les valeurs de l'‚cran ? (ceci est obligatoire si vous d‚marrez ce programme pour la premiŠre fois)"; rep$
IF rep$ = "o" OR rep$ = "O" THEN
        INPUT "xmin="; xmin
        INPUT "xmax="; xmax
        INPUT "ymin="; ymin
        INPUT "ymax="; ymax
        INPUT "xstep="; xstep
        INPUT "ystep="; ystep
        OPEN "val.bin" FOR RANDOM AS #1
                PUT #1, 1, xmin: PUT #1, 2, xmax
                PUT #1, 3, ymin: PUT #1, 4, ymax
                PUT #1, 5, xstep: PUT #1, 6, ystep
        CLOSE #1
        ELSE
        OPEN "val.bin" FOR RANDOM AS #2
                GET #2, 1, xmin: GET #2, 2, xmax
                GET #2, 3, ymin: GET #2, 4, ymax
                GET #2, 5, xstep: GET #2, 6, ystep
        CLOSE #2
END IF
INPUT "Voulez-vous utiliser les fonctions trigo (t) ou tracer les courbes (c) ?", rep$
IF rep$ = "t" THEN GOTO trigo
PAINT (0, 0), 8
WINDOW (xmin, ymax)-(xmax, ymin)
LINE (xmin, 0)-(xmax, 0), 5: LINE (0, ymax)-(0, ymin), 5
FOR x = xmin TO xmax STEP xstep
        PSET (x, 0)
NEXT x
FOR y = ymin TO ymax STEP ystep
        PSET (0, y)
NEXT y
FOR x = xmin TO xmax STEP .01
        y = x / 2 + 2 / (x - 1)
        y1 = -(3 / 2) * x + 6
        y2 = (3 / 8) * x + 9 / 8
        PSET (x, y), 2
        PSET (x, y1), 3
        PSET (x, y2), 4
NEXT x
SLEEP
END

trigo:
PRINT "Angle en radian ?"
LOCATE 12, 10: PRINT "PI"
LOCATE 12, 2: INPUT angle
angle = angle * 3.141592654#
PAINT (0, 0), 8
WINDOW (xmin, ymax)-(xmax, ymin)
LINE (xmin, 0)-(xmax, 0), 5: LINE (0, ymax)-(0, ymin), 5
FOR x = xmin TO xmax STEP xstep
        PSET (x, 0)
NEXT x
FOR y = ymin TO ymax STEP ystep
        PSET (0, y)
NEXT y

FOR a = 0 TO 360 STEP .5
        PSET (xmax * COS(a), ymax * SIN(a))
NEXT a
LINE (0, 0)-((xmax - xmin) * COS(angle), (ymax - ymin) * SIN(angle))
SLEEP

   


