// Dialog lines of Riltana d'Arabani
// Traified

BEGIN A7ARAB02

// *** If Quest 3 didn't start ***
IF ~OR(2) GlobalLT("A7Quest3", "GLOBAL", 2) GlobalGT("A7Quest3", "GLOBAL", 9) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.NoQuest
  SAY @3580 /* Intruders have entered our building. Attack them! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

// *** If not yet spoken to one of the house members ***
IF ~Global("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.0
  SAY @3581 /* Whoever you are, you have to speak to the Matron Mother first. She will decide what is to be done with you. */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q3ct2")~ EXIT
END

// *** If accepted the matron mother's plan ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(2, 1)~ Arabani.1
  SAY @3568 /* You may enter our home freely as long as you possess the anchor stone. */
  IF ~~ EXIT
END

IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(2, 2)~ Arabani.2
  SAY @3569 /* Remember, you are under close observation while you are here. */
  IF ~~ EXIT
END
