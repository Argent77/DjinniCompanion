// Generic dialog lines of the Duergar Warriors (Quest 3)
// Traified

BEGIN A7Q3DR03

IF ~RandomNum(3, 1)~ Duergar3.1
  SAY @3366 /* Talk to someone else, will ya? */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 2)~ Duergar3.2
  SAY @3367 /* Pay attention to the fight and you will learn something. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 3)~ Duergar3.3
  SAY @3368 /* Haegar is useless in battle, don't ya think? */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

