// Dialog lines of Vlonyrr d'Arabani
// Traified

BEGIN A7ARAB03

// *** If Quest 3 didn't start ***
IF ~OR(2) GlobalLT("A7Quest3", "GLOBAL", 2) GlobalGT("A7Quest3", "GLOBAL", 9) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.NoQuest
  SAY @3560 /* Who are you? How did you pass the wards?! They must be assassins... Attack them! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

// *** If not yet spoken to one of the house members ***
IF ~Global("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.0
  SAY @3591 /* How did you pass the wards? You have to speak to the Matron Mother immediately. She will decide what is to be done with you. */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q3ct2")~ EXIT
END

// *** If accepted the matron mother's plan ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(2, 1)~ Arabani.4
  SAY @3582 /* I do not trust you. But I will obey the Matron Mother's command. */
  IF ~~ EXIT
END

IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(2, 2)~ Arabani.5
  SAY @3583 /* I have no reason to talk to you. */
  IF ~~ EXIT
END
