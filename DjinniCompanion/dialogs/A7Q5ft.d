// *** Generic dialog for fire trolls ***
// Traified

BEGIN A7Q5FT

IF ~RandomNum(3, 1)~ A7Q5FT.Generic.1
  SAY @5870 /* I only obey efreet master. */
  IF ~~ EXIT
END

IF ~RandomNum(3, 2)~ A7Q5FT.Generic.2
  SAY @5871 /* You look funny. So small and pale. */
  IF ~~ EXIT
END

IF ~RandomNum(3, 3)~ A7Q5FT.Generic.3
  SAY @5872 /* Do not disturb. I train with brothers for battle. */
  IF ~~ EXIT
END

