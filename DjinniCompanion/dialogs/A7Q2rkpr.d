// *** Rakshasa High Priest dialog file for "A77004" ***
// Traified

BEGIN A7Q2RKPR

IF ~NumTimesTalkedTo(0)~ A7RakPr1
  SAY @2202 /* You've made it far, <PRO_RACE>. But this will be the end of you. By sacrificing both you and the djinni, I will become the favorite in Ravanna's eyes. */
  = @2203 /* Attack them, my disciples. They must not survive! */
  IF ~~ DO ~Enemy()~ EXIT
END