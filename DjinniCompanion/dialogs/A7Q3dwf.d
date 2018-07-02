// Generic dialog lines of the female Drow Warriors (Quest 3)
// Traified

BEGIN A7Q3DWF

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) Gender(LastTalkedToBy, MALE) RandomNum(2, 1)~ DrowWarriorF.Male.1
  SAY #52860    // We are the superior fighters in this place, male.  Do not bar our way and do not address us when we do not wish it.
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) Gender(LastTalkedToBy, FEMALE) RandomNum(2, 1)~ DrowWarriorF.Female.1
  SAY #52865    // If you meet the handmaidens of Lolth, female, lower your eyes and do not address them.  You are nothing to them, just as you are nothing to a Matron Mother.
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 1)~ DrowWarriorF.1
  SAY @3380 /* I lead the forces of my House when it is required.  You would be nothing but fodder in such a battle. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 2)~ DrowWarriorF.3
  SAY @3381 /* You are an outsider, <MALEFEMALE>. I have nothing to say to you. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 3)~ DrowWarriorF.4
  SAY @3382 /* I am eager to prove my skills against our enemies. */
  IF ~~ EXIT
END

// *** When in battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 5)
  GlobalLT("A7Quest3", "GLOBAL", 10)
  ActuallyInCombat()~ DrowWarriorF.5
  SAY @3383 /* I'm a little busy right now. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** After the battle with Arabani ***
IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(2, 1)~ DrowWarriorF.6
  SAY @3384 /* The Arabani had no chance against us. */
  IF ~~ EXIT
END

IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(2, 2)~ DrowWarriorF.7
  SAY @3385 /* You would have a future in our house. */
  IF ~~ EXIT
END
