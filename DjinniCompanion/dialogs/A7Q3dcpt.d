// Dialog of the Drow Captain (Quest 3)
// Traified

BEGIN A7Q3DCPT

IF ~NumTimesTalkedTo(0) GlobalLT("A7Quest3", "GLOBAL", 2)~ DrowCpt1.Intro.1
  SAY @3300 /* Greetings <MALEFEMALE>. I am the first captain under Tathas' command. */
  = @3301 /* I apologize for my lack of manners, but until you have decided to work for us I can offer you nothing. */
  IF ~~ EXIT
END

IF ~NumTimesTalkedTo(0) GlobalGT("A7Quest3", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 6)~ DrowCpt1.Intro.2
  SAY @3300 /* Greetings <MALEFEMALE>. I am the first captain under Tathas' command. */
  = @3302 /* As a hireling of our commander, you can make use of my services. I offer a safe place to rest and a small selection of armory for sale. */
  IF ~~ + DrowCpt.4
END

IF ~NumTimesTalkedToGT(0) GlobalLT("A7Quest3", "GLOBAL", 2)~ DrowCpt.1
  SAY @3303 /* I greet you again, <MALEFEMALE>. But unless you have agreed to the commander's offer, I can't do anything for you. */
  IF ~~ EXIT
END

IF ~NumTimesTalkedToGT(0) GlobalGT("A7Quest3", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 6) InPartySlot(LastTalkedToBy, 0)~ DrowCpt.2
  SAY @3304 /* I greet you again, Veldrin. */
  IF ~~ + DrowCpt.4
END

IF ~NumTimesTalkedToGT(0) GlobalGT("A7Quest3", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 6) !InPartySlot(LastTalkedToBy, 0)~ DrowCpt.3
  SAY @3305 /* I greet you again, <GABBER>. */
  IF ~~ + DrowCpt.4
END

IF ~~ DrowCpt.4
  SAY @3306 /* Do you need any of my services? */
  ++ @3307 /* I'd like to rest for a while. */ DO ~StartStore("A7Q3ud2", LastTalkedToBy(Myself))~ EXIT
  ++ @3308 /* I'd like see what you have for sale. */ DO ~StartStore("A7Q3ud1", LastTalkedToBy(Myself))~ EXIT
  ++ @3309 /* Not at the moment. */ + DrowCpt.5
END

IF ~~ DrowCpt.5
  SAY @3310 /* Maybe another time. */
  IF ~~ EXIT
END

// *** When in battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 5) 
  GlobalLT("A7Quest3", "GLOBAL", 10) 
  ActuallyInCombat()~ DrowCpt.6
  SAY @3311 /* I'm a little busy right now. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** After the battle with Arabani ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 10) Class(LastTalkedToBy, FIGHTER_ALL) RandomNum(3, 1)~ DrowCpt.7
  SAY @3312 /* You have potential, <MALEFEMALE>. If you want to join our house, I would support your request. */
  IF ~~ EXIT
END

IF ~Global("A7Quest3", "GLOBAL", 10) OR(2) !Class(LastTalkedToBy, FIGHTER_ALL) RandomNum(2, 1)~ DrowCpt.8
  SAY @3313 /* The Arabani had no chance against us. */
  IF ~~ EXIT
END

IF ~Global("A7Quest3", "GLOBAL", 10) OR(2) !Class(LastTalkedToBy, FIGHTER_ALL) RandomNum(2, 2)~ DrowCpt.9
  SAY @3314 /* You would have a future in our house. */
  IF ~~ EXIT
END
