// Generic dialog lines of the Duergar Warriors (Quest 3)
// Traified

BEGIN A7Q3DR04

IF ~RandomNum(3, 1)~ Duergar4.1
  SAY @3369 /* This fight is great! */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 2)~ Duergar4.2
  SAY @3370 /* *BURP* */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 3)~ Duergar4.3
  SAY @3371 /* Wanna fight too? */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

