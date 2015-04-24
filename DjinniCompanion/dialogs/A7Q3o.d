// Generic dialog lines of the Orcs (Quest 3)
// Traified

BEGIN A7Q3O

IF ~RandomNum(4, 1)~ Orc.1
  SAY @3400 /* No hurt me, please. */
  IF ~~ EXIT
END

IF ~RandomNum(4, 2)~ Orc.2
  SAY @3401 /* I work harder. I promise. */
  IF ~~ EXIT
END

IF ~RandomNum(4, 3)~ Orc.3
  SAY @3402 /* I not allowed to speak to stranger. */
  IF ~~ EXIT
END

IF ~RandomNum(4, 4)~ Orc.4
  SAY @3403 /* Talk to master if you want something. */
  IF ~~ EXIT
END

