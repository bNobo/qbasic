CLS
demand:
INPUT "Veuilez entrez votre nom, ou l'accŠs vous sera interdit :", nom$
IF nom$ = "" THEN GOTO demand
OPEN "c:\effrac.doc" FOR APPEND AS #1
PRINT #1, nom$; " a tent‚ d'acc‚derer au systŠme par effraction."
CLOSE #1
CLS
SYSTEM

