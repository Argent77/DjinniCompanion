// Generic dialog lines of the Drow Wizards (Quest 3)
// Traified

BEGIN A7Q3DM

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) !Class(LastTalkedToBy, MAGE_ALL) RandomNum(2, 1)~ DrowWizard.Wizard.1
  SAY #52866    // I am a graduate of Sorcere, and I have little to say to one such as you, <MALEFEMALE>.  Master the Art as I have and perhaps we might have cause to speak.
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) Class(LastTalkedToBy, MAGE_ALL) Gender(LastTalkedToBy, FEMALE) RandomNum(2, 1)~ DrowWizard.FemaleWizard.1
  SAY #52876    // You... seem to have some glimmer of the Art in you... but you are female.  I have never heard of a drow female mage.  Obviously I am mistaken... excuse me.
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 1)~ DrowWizard.1
  SAY @3330 /* Leave me be, <MALEFEMALE>. I am working on my formulas and you are interrupting my concentration. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 2)~ DrowWizard.2
  SAY @3331 /* I am here because of our master's command. */
  IF ~~ EXIT
END

IF ~GlobalLT("A7Quest3", "GLOBAL", 6) RandomNum(3, 3)~ DrowWizard.3
  SAY @3332 /* You should direct your questions to our commander. */
  IF ~~ EXIT
END

// *** When in battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 5)
  GlobalLT("A7Quest3", "GLOBAL", 10)
  ActuallyInCombat()~ DrowWizard.5
  SAY @3333 /* I'm a little busy right now. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** After the battle with Arabani ***
IF ~Global("A7Quest3", "GLOBAL", 10) Class(LastTalkedToBy, MAGE_ALL) RandomNum(2, 1)~ DrowWizard.6
  SAY @3334 /* You would be a promising candidate for Sorcere, why don't you join? */
  IF ~~ EXIT
END

IF ~Global("A7Quest3", "GLOBAL", 10) OR(2) !Class(LastTalkedToBy, MAGE_ALL) RandomNum(2, 2)~ DrowWizard.7
  SAY @3335 /* Thanks to you, our house has a foothold in this city. */
  IF ~~ EXIT
END
