// *** Quest 5: Special dialog file for djinni #5 ***
// Traified

BEGIN A7Q5DJ05

// *** Prevent talking to CHARNAME before starting the quest officially ***
IF ~Global("A7Quest5", "GLOBAL", 0) Name("AMCARRAS", LastTalkedToBy)~ A7Q5DJ05.1
  SAY @5214 /* Please talk to our leader if you want something. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END
