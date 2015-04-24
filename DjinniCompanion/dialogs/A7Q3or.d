// Generic dialog lines of the Orogs (Quest 3)
// Traified

BEGIN A7Q3OR

IF ~RandomNum(3, 1)~ Orog.1
  SAY @3404 /* You go no further. */
  IF ~~ EXIT
END

IF ~RandomNum(3, 2)~ Orog.2
  SAY @3405 /* Tunnel behind us is blocked. */
  IF ~~ EXIT
END

IF ~RandomNum(3, 3)~ Orog.3
  SAY @3406 /* Is dangerous in tunnel behind us. */
  IF ~~ EXIT
END
