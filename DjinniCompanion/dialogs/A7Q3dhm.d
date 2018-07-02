// Dialog of Iraedril Do'ndar (Quest 3)
// Traified

BEGIN A7Q3DHM

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(4, 1)~ HandmaidenDummy.1
  SAY @3320 /* Do not speak to me, worm. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(4, 2)~ HandmaidenDummy.2
  SAY @3321 /* You dare to talk to me? Begone! */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(4, 3)~ HandmaidenDummy.3
  SAY @3322 /* The drow rule supreme. And I am their best. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(4, 4)~ HandmaidenDummy.4
  SAY @3323 /* Cower before the Spider Queen. */
  IF ~~ EXIT
END

// *** When in battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 5)
  GlobalLT("A7Quest3", "GLOBAL", 10)
  ActuallyInCombat()~ HandmaidenDummy.5
  SAY @3324 /* Don't interrupt me in my work, <MALEFEMALE>. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** After the battle with Arabani ***
IF ~Global("A7Quest3", "GLOBAL", 10)~ HandmaidenDummy.6
  SAY @3325 /* You are allowed to live another day, <MALEFEMALE>. Be thankful for it. */
  IF ~~ EXIT
END
