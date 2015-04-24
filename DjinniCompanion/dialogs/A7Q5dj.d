// *** Quest 5: Generic dialog file for the djinnis ***
// Traified

BEGIN A7Q5DJ

// Special case: Djinni 5 is Afaaq
IF ~Name("A7Q5DJ05", Myself) AreaCheck("A77002") GlobalLT("A7Quest5", "GLOBAL", 10) Global("A7Q5AfaaqAppears", "GLOBAL", 2) Global("Smalltalk1", "LOCALS", 0)~ TalkA702.DJ05.Afaaq
  SAY @5200 /* It is good to see you again, my <PRO_LADYLORD>. Unfortunately I am of limited help to you in this matter. */
  ++ @5201 /* Why is that? */ + TalkA702.DJ05.Afaaq.1
END

IF ~~ TalkA702.DJ05.Afaaq.1
  SAY @5202 /* Whatever has made its home down there will surely react with hostility to any djinn intrusion. */
  = @5203 /* All we can do at the moment is guard this place and watch out for unusual activities in the region. */
  IF ~~ DO ~SetGlobal("Smalltalk1", "LOCALS", 1) ClearActions(Myself)~ EXIT
END

// Djinni 5 tells party about items in chest
IF ~Name("A7Q5DJ05", Myself) AreaCheck("A77002") GlobalLT("A7Quest5", "GLOBAL", 10) Global("HelpItems", "LOCALS", 0)~ TalkA702.DJ05.1
  SAY @5204 /* We have prepared for you a small selection of items which will help you survive in the cave below. */
  IF ~~ DO ~SetGlobal("HelpItems", "LOCALS", 1) ClearActions(Myself)~ EXIT
END


// Generic djinni talk in A77002
IF ~GlobalLT("A7Quest5", "GLOBAL", 10) AreaCheck("A77002") RandomNum(5, 1)~ TalkA702.1
  SAY @5205 /* This place is safe. You can rest here anytime you want. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~GlobalLT("A7Quest5", "GLOBAL", 10) AreaCheck("A77002") RandomNum(5, 2)~ TalkA702.2
  SAY @5206 /* If you have trouble getting to the surface, our leader will most certainly help you. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~GlobalLT("A7Quest5", "GLOBAL", 10) AreaCheck("A77002") RandomNum(5, 3)~ TalkA702.3
  SAY @5207 /* The attacks on our stronghold have lessened. Could this mean the enemy already knows about us? */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~GlobalLT("A7Quest5", "GLOBAL", 10) AreaCheck("A77002") RandomNum(5, 4)~ TalkA702.4
  SAY @5208 /* I wished I could join you in your task, but our leader is right. Entering the enemy's territory openly would do more harm than good. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~GlobalLT("A7Quest5", "GLOBAL", 10) AreaCheck("A77002") RandomNum(5, 5)~ TalkA702.DJ05.2
  SAY @5209 /* Sharif Karim is a wise and experienced leader. Without him we would have taken much more time to find the source of the attacks. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// *** While fighting the efreets ***
IF ~GlobalGT("A7Quest5", "GLOBAL", 7) GlobalLT("A7Quest5", "GLOBAL", 10) ActuallyInCombat() AreaCheck("A77003")~ TalkA703.1
  SAY @5210 /* I am busy at the moment. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** Talk after defeating the efreets and Karim has fallen ***
IF ~Global("A7Quest5", "GLOBAL", 10) AreaCheck("A77003") Dead("A7Karim")~ TalkA703.2
  SAY @5211 /* We thank you for defeating Malik and his army. Regrettably Karim has left this plane prematurely. */
  = @5212 /* We will return back to our home. May your future shine brightly, <CHARNAME>. */
  IF ~~ DO ~SetGlobal("A7Q5TeleportAway", "A77003", 1) EraseJournalEntry(@6502) EraseJournalEntry(@6503) 
      EraseJournalEntry(@6504) EraseJournalEntry(@6505) EraseJournalEntry(@6506) EraseJournalEntry(@6507) 
      EraseJournalEntry(@6508) EraseJournalEntry(@6509) EraseJournalEntry(@6510) EraseJournalEntry(@6511) 
      EraseJournalEntry(@6512) EraseJournalEntry(@6513) EraseJournalEntry(@6514) EraseJournalEntry(@6515) 
      EraseJournalEntry(@6516) EraseJournalEntry(@6517) EraseJournalEntry(@6518) EraseJournalEntry(@6519) 
      EraseJournalEntry(@6520) EraseJournalEntry(@6521) EraseJournalEntry(@6522) EraseJournalEntry(@6523) 
      EraseJournalEntry(@6524) EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) 
      EraseJournalEntry(@6528) EraseJournalEntry(@6529) EraseJournalEntry(@6530) EraseJournalEntry(@6531) 
      EraseJournalEntry(@6532) EraseJournalEntry(@6533) EraseJournalEntry(@6534) EraseJournalEntry(@6535) 
      EraseJournalEntry(@6536) EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) 
      EraseJournalEntry(@6540) EraseJournalEntry(@6541) EraseJournalEntry(@6542) EraseJournalEntry(@6543) 
      EraseJournalEntry(@6544) EraseJournalEntry(@6548)~ SOLVED_JOURNAL @6594 EXIT
END

// *** Talk after defeating the efreets and Karim is still alive ***
IF ~Global("A7Quest5", "GLOBAL", 10) AreaCheck("A77003") !Dead("A7Karim")~ TalkA703.3
  SAY @5213 /* We are victorious! But I think you should talk to our leader first. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

