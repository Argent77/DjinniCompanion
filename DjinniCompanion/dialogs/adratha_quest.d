// *** Dialog portions for Adratha's ghost, Master Verthan of the Druid Grove and Overgold Renwellyn of the Trademeet Temple ***
// Traified

// Adratha's ghost
BEGIN ~A7Q1ADRA~

IF ~Global("AskForHelp", "LOCALS", 1)~ A7Q1ADRA.1
  SAY @1550 /* You must help me, please! */
  IF ~~ DO ~SetGlobal("AskForHelp", "LOCALS", 2)~ + A7Q1ADRA.1a
END

IF ~~ A7Q1ADRA.1a
  SAY @1551 /* Deliver me from this misery. My spirit is trapped in the dark magics of this place. */
  ++ @1557 /* Who are you? */ + A7Q1ADRA.3
  ++ @1558 /* How can I help you? */ + A7Q1ADRA.5
  ++ @1559 /* I don't have the time to deal with ghosts. */ + A7Q1ADRA.2
END

IF ~~ A7Q1ADRA.2
  SAY @1552 /* I beseech you, stranger. Take my remains away from this dark place. Please... */
  IF ~~ DO ~
    SetGlobal("A7Q1AdrathaPeace", "GLOBAL", 1)
    SetGlobal("FadeAway", "LOCALS", 1)
    ApplySpellRES("a7q1sel", Myself)
    ClearActions(Myself)~
  UNSOLVED_JOURNAL @1851 /* The tortured spirit of the potion seller Adratha spoke to me and asked me... */ EXIT
END

IF ~~ A7Q1ADRA.3
  SAY @1553 /* I am...was Adratha. One night these monsters appeared and killed me in a gruesome manner. When I awoke again I was trapped in this nightmarish landscape unable to escape. */
  ++ @1560 /* But this scenery looks rather beautiful to me. */ + A7Q1ADRA.4
  ++ @1558 /* How can I help you? */ + A7Q1ADRA.5
  ++ @1559 /* I don't have the time to deal with ghosts. */ + A7Q1ADRA.2
END

IF ~~ A7Q1ADRA.4
  SAY @1554 /* Don't you see the grotesque forms of dead trunks that were once beautiful trees? Don't you feel the heat of this bleak landscape when you touch it? */
  = @1555 /* Please, stranger! Release me from this misery. */
  ++ @1558 /* How can I help you? */ + A7Q1ADRA.5
  ++ @1559 /* I don't have the time to deal with ghosts. */ + A7Q1ADRA.2
END

IF ~~ A7Q1ADRA.5
  SAY @1556 /* Take my remains away from this dark place and bury it in the soil of my home. Maybe then I can finally find some peace. */
  IF ~~ DO ~
    SetGlobal("A7Q1AdrathaPeace", "GLOBAL", 1)
    SetGlobal("FadeAway", "LOCALS", 1)
    ApplySpellRES("a7q1sel", Myself)
    ClearActions(Myself)~
  UNSOLVED_JOURNAL @1850 /* The tortured spirit of the potion seller Adratha spoke to me and asked me... */ EXIT
END


// Master Verthan
EXTEND_BOTTOM ~CECHALLE~ 2
  + ~Global("A7Q1AdrathaPeace", "GLOBAL", 1) PartyHasItem("a7misc2")~ + @1561 /* I have the remains of the herbalist Adratha in my possession. Can you put here spirit to rest? */ + CECHALLE.1
END

APPEND ~CECHALLE~
  IF ~~ CECHALLE.1
    SAY @1562 /* You have done well. I can bury her according to druidic traditions. It should bring some peace to her tortured soul. */
    = @1563 /* Please take this in return. */
    IF ~~ DO ~
      SetGlobal("A7Q1AdrathaPeace", "GLOBAL", 9)
      TakePartyItem("a7misc2")
      DestroyItem("a7misc2")
      GiveItem("potn33", LastTalkedToBy)
      AddXP2DA("A7Q1SQ1")
      EraseJournalEntry(@1850)
      EraseJournalEntry(@1851)~
    SOLVED_JOURNAL @1860 /* I have delivered Adratha's remains to Master Verthan of the local druid grove. */ EXIT
  END
END


// Overgold Renwellyn
EXTEND_BOTTOM ~TEMSUP~ 10 #1
  + ~Global("A7Q1AdrathaPeace", "GLOBAL", 1) PartyHasItem("a7misc2")~ + @1564 /* I have the remains of Adratha, the potion seller of the Druid Grove, in my possession. Can you put here spirit to rest? */ + TEMSUP.1
END

APPEND ~TEMSUP~
  IF ~~ TEMSUP.1
    SAY @1565 /* Yes, I can do it. I promise to take care of them personally. Her remains will be properly layed to rest in our town's cemetery. */
    = @1566 /* I'd like you to have this for your service. */
    IF ~~ DO ~
      SetGlobal("A7Q1AdrathaPeace", "GLOBAL", 9)
      TakePartyItem("a7misc2")
      DestroyItem("a7misc2")
      GiveItem("scrl07", LastTalkedToBy)
      AddXP2DA("A7Q1SQ1")
      EraseJournalEntry(@1850)
      EraseJournalEntry(@1851)~
    SOLVED_JOURNAL @1861 /* I have delivered Adratha's remains to Overgold Renwellyn, the head of the Temple of Waukeen in Trademeet. */ EXIT
  END
END
