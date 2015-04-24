// Generic dialog lines of the Drow Priestess (Quest 3)
// Traified

BEGIN A7Q3DP

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) Gender(LastTalkedToBy, FEMALE) RandomNum(3, 1)~ DrowPriestess.Female
  SAY #52912    // I do not recognize you, female.  You shall be looked at closely, and if you be a faithful follower of the Spider Queen, you shall do as the priestesses command, soon enough.
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(2, 1)~ DrowPriestess.1
  SAY #52910    // Praise be to Lolth, the Queen of Spiders!
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(2, 2)~ DrowPriestess.3
  SAY @3340 /* Do not address me, <MALEFEMALE>. You are an outsider and only tolerated for the moment. */
  IF ~~ EXIT
END

// *** When in battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 5) 
  GlobalLT("A7Quest3", "GLOBAL", 10) 
  ActuallyInCombat()~ DrowPriestess.5
  SAY @3341 /* Don't interrupt me in my work, <MALEFEMALE>. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** After the battle with Arabani ***
IF ~Global("A7Quest3", "GLOBAL", 10)~ DrowPriestess.6
  SAY @3342 /* You would be a worthy addition to our house. */
  IF ~~ EXIT
END
