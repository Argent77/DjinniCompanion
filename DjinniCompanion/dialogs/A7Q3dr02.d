// Generic dialog lines of the Duergar Warriors (Quest 3)
// Traified

BEGIN A7Q3DR02

IF ~RandomNum(3, 1)~ Duergar2.1
  SAY @3363 /* I'll win for sure! */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 2)~ Duergar2.2
  SAY @3364 /* T'is is the life. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 3)~ Duergar2.3
  SAY @3365 /* He doesn't stand a chance! */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

