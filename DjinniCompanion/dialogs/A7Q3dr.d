// Generic dialog lines of the Duergar Warriors (Quest 3)
// Traified

BEGIN A7Q3DR

IF ~NumTimesTalkedToLT(5) RandomNum(5, 1)~ Duergar.1
  SAY @3350 /* *BURP* */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToLT(5) RandomNum(5, 2)~ Duergar.2
  SAY @3351 /* *CRUNCH-CRUNCH* */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToLT(5) RandomNum(5, 3)~ Duergar.3
  SAY @3352 /* *CRUNCH-SLURP* */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToLT(5) RandomNum(5, 4)~ Duergar.4
  SAY @3353 /* Aha, and then... */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToLT(5) RandomNum(5, 5)~ Duergar.5
  SAY @3354 /* Sure, but... */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToGT(4) RandomNum(3, 1)~ Duergar.6
  SAY @3355 /* Will ya stop pestering us? */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToGT(4) RandomNum(3, 2)~ Duergar.7
  SAY @3356 /* Go away! */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~NumTimesTalkedToGT(4) RandomNum(3, 3)~ Duergar.8
  SAY @3357 /* Talk to someone else! */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END
