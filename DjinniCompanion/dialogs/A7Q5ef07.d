// *** Quest 5: Dialog for Efreeti Summoner Apprentice ***
// Traified

BEGIN A7Q5EF07

// Generic talk
IF ~!Global("A7Q5SubQuest1", "A77003", 2) RandomNum(4, 1)~ A7Q5EF07.Generic.1
  SAY @5620 /* (grumble) So much to do and so little time... */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 2) RandomNum(4, 2)~ A7Q5EF07.Generic.2
  SAY @5621 /* Please stop disturbing me. I have to concentrate on that ritual or my master will punish me again. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 2) RandomNum(4, 3)~ A7Q5EF07.Generic.3
  SAY @5622 /* Learning the art of summoning is exciting but it needs a lot of patience to master all the intricacies. */
  // SAY ~Learning the art of summoning is exciting but it needs a lot of patience to avoid all the pitfalls.~
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 2) RandomNum(4, 4)~ A7Q5EF07.Generic.4
  SAY @5623 /* I had miscast a conjuration once. The summoned mephit caused a real mess before my master could banish it back to the elemental planes. */
  = @5624 /* My punishment was... never mind. But now I'm an expert in mephit conjurations. */
  IF ~~ EXIT
END


// Subquest 1
IF ~Global("A7Q5SubQuest1", "A77003", 2) Global("AskedForSummoner", "LOCALS", 0)~ A7Q5EF07.Subquest2.1
  SAY @5625 /* Do you need something? */
  ++ @5626 /* Where can I get a fire elemental for the salamanders? */ + A7Q5EF07.Subquest2.3
  ++ @5627 /* Not at the moment. */ + A7Q5EF07.Subquest2.2
END

IF ~~ A7Q5EF07.Subquest2.2
  SAY @5628 /* As you wish. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF07.Subquest2.3
  SAY @5629 /* You need to talk to my master. He's in the back working on his formulas. */
  IF ~~ DO ~SetGlobal("AskedForSummoner", "LOCALS", 1)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 2) Global("AskedForSummoner", "LOCALS", 1)~ A7Q5EF07.Subquest2.4
  SAY @5630 /* I can't help you. Talk to my master in the back. */
  IF ~~ EXIT
END
