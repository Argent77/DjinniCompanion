// Generic dialog lines of the male Drow Warriors (Quest 3)
// Traified

BEGIN A7Q3DWM

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) Gender(LastTalkedToBy, MALE) RandomNum(2, 1)~ DrowWarriorM.Male.1
  SAY @3390 /* If you meet a priestess of Lolth, lower your eyes and do not address them.  You are nothing to them, just as you are nothing to a Matron Mother. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) Gender(LastTalkedToBy, FEMALE) RandomNum(2, 1)~ DrowWarriorM.Female.1
  SAY #52865    // If you meet the handmaidens of Lolth, female, lower your eyes and do not address them.  You are nothing to them, just as you are nothing to a Matron Mother.
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 1)~ DrowWarriorM.1
  SAY @3391 /* I am eager to prove my skills against our enemies. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 2)~ DrowWarriorM.2
  SAY @3392 /* We are ready to strike as soon as our commander gives the word. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 3)~ DrowWarriorM.3
  SAY @3393 /* Our commander is invincible in battle. His magics have even felled an Elder Orb, most powerful of the dreaded eye tyrants. */
  IF ~~ EXIT
END


// *** When in battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 5)
  GlobalLT("A7Quest3", "GLOBAL", 10)
  ActuallyInCombat()~ DrowWarriorM.5
  SAY @3394 /* I'm a little busy right now. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** After the battle with Arabani ***
IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(2, 1)~ DrowWarriorM.6
  SAY @3395 /* The Arabani had no chance against us. */
  IF ~~ EXIT
END

IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(2, 2)~ DrowWarriorM.7
  SAY @3396 /* You would have a future in our house. */
  IF ~~ EXIT
END
