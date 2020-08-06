CLS
DIM noms$(1 TO 8): DIM scores(1 TO 8)
pts = 0
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

' PROGRAMMED BY BINAIRE.



