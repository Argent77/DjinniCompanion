// Generic dialog lines of the remaining Arabani members
// Traified

BEGIN A7ARAB04

// *** If Quest 3 didn't start ***
IF ~OR(2) GlobalLT("A7Quest3", "GLOBAL", 2) GlobalGT("A7Quest3", "GLOBAL", 9) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.NoQuest
  SAY @3590 /* How did you pass the wards? Intruders have entered, attack them! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

// *** If not yet spoken to one of the house members ***
IF ~Global("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.0
  SAY @3591 /* How did you pass the wards? You have to speak to the Matron Mother immediately. She will decide what is to be done with you. */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q3ct2")~ EXIT
END

// *** If accepted the matron mother's plan ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(4, 1)~ Arabani.1
  SAY @3592 /* Remember, you are under close observation while you are here. */
  IF ~~ EXIT
END

IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(4, 2)~ Arabani.2
  SAY @3593 /* Don't make any wrong move or it will be your last! */
  IF ~~ EXIT
END

IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(4, 3)~ Arabani.3
  SAY @3594 /* Speak to the Matron Mother if you want something. */
  IF ~~ EXIT
END

IF ~GlobalGT("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0) RandomNum(4, 4)~ Arabani.4
  SAY @3595 /* We protect the Matron Mother with our lives, if need be. */
  IF ~~ EXIT
END
