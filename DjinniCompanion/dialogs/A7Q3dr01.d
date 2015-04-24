// Generic dialog lines of the Duergar Warriors (Quest 3)
// Traified

BEGIN A7Q3DR01

IF ~RandomNum(3, 1)~ Duergar1.1
  SAY @3360 /* Stop distracting me! Can't ye see I'm busy? */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 2)~ Duergar1.2
  SAY @3361 /* No time to talk, busy fighting. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(3, 3)~ Duergar1.3
  SAY @3362 /* Don't pester me. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

