// *** Quest 5: Dialog for Efreeti Summoner ***
// Traified

BEGIN A7Q5EF06

// Generic talk
IF ~OR(2) GlobalLT("A7Q5SubQuest1", "A77003", 2) GlobalGT("A7Q5SubQuest1", "A77003", 4) RandomNum(3, 1)~ A7Q5EF06.Generic.1
  SAY @5570 /* Please don't disturb my work. */
  IF ~~ EXIT
END

IF ~OR(2) GlobalLT("A7Q5SubQuest1", "A77003", 2) GlobalGT("A7Q5SubQuest1", "A77003", 4) RandomNum(3, 2)~ A7Q5EF06.Generic.2
  SAY @5571 /* The fire elementals guarding our base have been further enhanced by my magic. Don't even think about taking on them. */
  IF ~~ EXIT
END

IF ~OR(2) GlobalLT("A7Q5SubQuest1", "A77003", 2) GlobalGT("A7Q5SubQuest1", "A77003", 4) RandomNum(3, 3) Class(LastTalkedToBy, MAGE_ALL) !Kit(LastTalkedToBy, MAGESCHOOL_CONJURER)~ A7Q5EF06.Generic.3a
  SAY @5572 /* You appear to be somewhat knowledgable in the arcane lore. But without the art of conjuration you'll never be able to attain real power. */
  IF ~~ EXIT
END

IF ~OR(2) GlobalLT("A7Q5SubQuest1", "A77003", 2) GlobalGT("A7Q5SubQuest1", "A77003", 4) RandomNum(3, 3) Class(LastTalkedToBy, MAGE_ALL) Kit(LastTalkedToBy, MAGESCHOOL_CONJURER)~ A7Q5EF06.Generic.3b
  SAY @5573 /* You will agree with me that our school of magic is more useful than others. */
  = @5574 /* What use is a limited number of destruction spells when you can call forth an endless supply of creatures throwing themselves into the battle. */
  IF ~~ EXIT
END

IF ~OR(2) GlobalLT("A7Q5SubQuest1", "A77003", 2) GlobalGT("A7Q5SubQuest1", "A77003", 4) RandomNum(3, 3)~ A7Q5EF06.Generic.3c
  SAY @5575 /* I think it's a bad idea to rely on inferior creatures such as trolls or salamanders. My elementals are much more efficient. */
  IF ~~ EXIT
END


// Subquest 1: Request a fire elemental
IF ~Global("A7Q5SubQuest1", "A77003", 2)~ A7Q5EF06.Subquest2.1.1
  SAY @5576 /* Why do you disturb my work, <RACE>? */
  ++ @5577 /* I'm in need of a fire elemental for the salamanders. */ + A7Q5EF06.Subquest2.1.3
  ++ @5578 /* Please excuse me, I will leave you alone. */ + A7Q5EF06.Subquest2.1.2
END

IF ~~ A7Q5EF06.Subquest2.1.2
  SAY @5579 /* That is much better. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF06.Subquest2.1.3
  SAY @5580 /* Are they out of their minds? I have never seen such disrespectful salamanders as them. I hope Lord Malik knows what he is doing by letting them join us. */
  = @5581 /* Well, if you want a fire elemental, you have to earn it. I'm short of certain materials for my conjuration rituals. */
  = @5582 /* Bring me at least three vials of mephit blood and I will summon your elemental. */
  ++ @5583 /* Where do I find mephits? */ + A7Q5EF06.Subquest2.1.4
  ++ @5584 /* Alright, that shouldn't be too difficult. */ + A7Q5EF06.Subquest2.1.5
  + ~NumItemsPartyGT("A7MISC9", 2)~ + @5585 /* I've already collected some mephit blood. */ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 3) TakePartyItemNum("A7MISC9", 3) DestroyItem("A7MISC9")~ + A7Q5EF06.Subquest2.1.7
END

IF ~~ A7Q5EF06.Subquest2.1.4
  SAY @5586 /* It shouldn't be difficult to find some of them in this cave. They are drawn to fiery place like this. */
  IF ~~ + A7Q5EF06.Subquest2.1.6
END

IF ~~ A7Q5EF06.Subquest2.1.5
  SAY @5587 /* Very good. */
  IF ~~ + A7Q5EF06.Subquest2.1.6
END

IF ~~ A7Q5EF06.Subquest2.1.6
  SAY @5588 /* I'll prepare the conjuring spell in the meantime. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 3)~ UNSOLVED_JOURNAL @6512 EXIT
END

IF ~~ A7Q5EF06.Subquest2.1.7
  SAY @5589 /* Really? Let me see! */
  IF ~~ + A7Q5EF06.Subquest2.2.3
END


// Subquest 1: Waiting for ingredients to create a fire elemental
IF ~Global("A7Q5SubQuest1", "A77003", 3) Global("SummonElemental", "LOCALS", 0)~ A7Q5EF06.Subquest2.2.1
  SAY @5590 /* Do you have found some mephit blood yet? */
  + ~NumItemsPartyGT("A7MISC9", 2)~ + @5591 /* Yes, I have it right here. */ DO ~TakePartyItemNum("A7MISC9", 3) DestroyItem("A7MISC9")~ + A7Q5EF06.Subquest2.2.3
  ++ @5592 /* Not yet. I'm still looking for it. */ + A7Q5EF06.Subquest2.2.2
END

IF ~~ A7Q5EF06.Subquest2.2.2
  SAY @5593 /* Take your time. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF06.Subquest2.2.3
  SAY @5594 /* Yes, this will do. */
  IF ~~ + A7Q5EF06.Subquest2.2.4
END

IF ~~ A7Q5EF06.Subquest2.2.4
  SAY @5595 /* Let me begin the casting... */
  IF ~~ DO ~SetGlobal("SummonElemental", "LOCALS", 1) IncrementGlobal("ElementalCount", "LOCALS", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct3b")~ EXIT
END

IF ~Global("SummonElemental", "LOCALS", 1)~ A7Q5EF06.Subquest2.2.5
  SAY @5596 /* Guide it to the salamanders. It is able to understand simple verbal commands. */
  = @5597 /* And now please leave me to my work. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 4) SetGlobal("SummonElemental", "LOCALS", 0) EraseJournalEntry(@6512)~ UNSOLVED_JOURNAL @6513 EXIT
END


// Subquest 1: After creating the elemental
IF ~Global("A7Q5SubQuest1", "A77003", 4)~ A7Q5EF06.Subquest2.3.1
  SAY @5598 /* Do you want something else? */
  + ~Global("SPRITE_IS_DEADA7Q5FES", "GLOBAL", 1) Global("ElementalCount", "LOCALS", 1)~ + @5599 /* I'm sorry, but our elemental has met an untimely end. */ + A7Q5EF06.Subquest2.3.3
  + ~Global("SPRITE_IS_DEADA7Q5FES", "GLOBAL", 2) Global("ElementalCount", "LOCALS", 2)~ + @5600 /* I'm sorry, but our elemental has met an untimely end... again. */ + A7Q5EF06.Subquest2.3.4
  + ~GlobalGT("SPRITE_IS_DEADA7Q5FES", "GLOBAL", 2) GlobalGT("ElementalCount", "LOCALS", 2)~ + @5601 /* I'm sorry, but our elementals seem to drop like flies. Do you have another one? */ + A7Q5EF06.Subquest2.3.5
  ++ @5602 /* No, I'm just stopping by. */ + A7Q5EF06.Subquest2.3.2
END

IF ~~ A7Q5EF06.Subquest2.3.2
  SAY @5603 /* Don't make a habit doing that. Goodbye. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF06.Subquest2.3.3
  SAY @5604 /* Why are you so careless and let it die? */
  = @5605 /* Luckily for you, I still have a spare vial of mephit blood to summon another one. */
  IF ~~ + A7Q5EF06.Subquest2.2.4
END

IF ~~ A7Q5EF06.Subquest2.3.4
  SAY @5606 /* You are a cruel lot to have it die so often. */
  = @5607 /* I'll summon you another one, but make sure that it reaches the salamanders this time. There will be no more elementals for you. */
  IF ~~ + A7Q5EF06.Subquest2.2.4
END

IF ~~ A7Q5EF06.Subquest2.3.5
  SAY @5608 /* I've warned you the last time. No more fire elementals for you. I guess our commander won't be pleased to hear that, but this is your problem. */
  + ~NumItemsPartyGT("A7MISC9", 2)~ + @5609 /* Won't you reconsider? I have brought you even more mephit blood for your conjurations. */ + A7Q5EF06.Subquest2.3.5.2
  IF ~NumItemsPartyLT("A7MISC9", 3)~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 9)~ + A7Q5EF06.Subquest2.3.5.1
END

IF ~~ A7Q5EF06.Subquest2.3.5.1
  SAY @5610 /* Now leave me to my work. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 9) EraseJournalEntry(@6509) EraseJournalEntry(@6513)~ UNSOLVED_JOURNAL @6514 EXIT
END

IF ~~ A7Q5EF06.Subquest2.3.5.2
  SAY @5611 /* No, I won't. And now leave me to my work. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 9) EraseJournalEntry(@6509) EraseJournalEntry(@6513)~ UNSOLVED_JOURNAL @6514 EXIT
END
