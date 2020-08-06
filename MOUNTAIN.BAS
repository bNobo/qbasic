SCREEN 12: CLS
RANDOMIZE TIMER
y = 240
x = 0
DO
              sens = INT(RND * 4)
              IF sens = 1 THEN n = -1
              IF sens <> 1 THEN n = .5
              a = INT(RND * 15)
              IF a = 1 THEN nb = 1
              IF a = 2 THEN nb = -1
              y = y + nb
              x = x + n
              IF y <= 10 THEN y = 10
              IF x <= 1 THEN x = 1
              PSET (x, y), 2
              IF x >= 640 THEN EXIT DO
LOOP




