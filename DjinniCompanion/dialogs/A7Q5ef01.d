// *** Quest 5: Dialog for Efreeti Commander ***
// Traified

BEGIN A7Q5EF01

// When talking to NPC
IF ~!InPartySlot(LastTalkedToBy, 0) RandomNum(2, 1)~ A7Q5EF01.NPC.1
  SAY @5450 /* I'd like to talk to your leader in person. */
  IF ~~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy, 0) RandomNum(2, 2)~ A7Q5EF01.NPC.2
  SAY @5451 /* Please let me talk to your leader. */
  IF ~~ EXIT
END


// Introduction talk to CHARNAME
IF ~Global("A7Q5MeetCommander", "A77003", 0)~ A7Q5EF01.Intro.1
  SAY @5452 /* A <RACE> dares to enter our domain? I'm surprised that you could persuade our guards to let you through. */
  IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 3) SetGlobal("A7Q5MeetCommander", "A77003", 1)~ + A7Q5EF01.Intro.2
END

IF ~~ A7Q5EF01.Intro.2
  SAY @5453 /* And now you stand before me. However, I don't know yet about your purpose. Why are you here, mortal? */
  ++ @5454 /* My name is <GABBER>, an adventurer from above. I come in peace. */ + A7Q5EF01.Intro.3
  ++ @5455 /* There is no special reason. I have found this cavern by chance. */ + A7Q5EF01.Intro.4
  ++ @5456 /* I'm looking for the cause of the mysterious earthquakes which plague the town above for some time. */ + A7Q5EF01.Intro.4
  ++ @5457 /* I've been hired by the djinn to find out who is behind the attacks on their stronghold. */ + A7Q5EF01.Intro.5
  ++ @5458 /* I'm your death. Prepare yourself! */ + A7Q5EF01.Challenged.1
END

IF ~~ A7Q5EF01.Intro.3
  SAY @5459 /* Yes, yes. I already know your name. I am more interested why you are here? */
  ++ @5455 /* There is no special reason. I have found this cavern by chance. */ + A7Q5EF01.Intro.4
  ++ @5456 /* I'm looking for the cause of the mysterious earthquakes which plague the town above for some time. */ + A7Q5EF01.Intro.4
  ++ @5457 /* I've been hired by the djinn to find out who is behind the attacks on their stronghold. */ + A7Q5EF01.Intro.5
  ++ @5460 /* I refuse to be questioned any further by the likes of you. */ + A7Q5EF01.Challenged.2
END

IF ~~ A7Q5EF01.Intro.4
  SAY @5461 /* Hmm, I don't know whether you speak the truth or falsehood. You are lucky that I'm in a generous mood today. */
  = @5462 /* That's why I will give you the chance to earn our respect. If you prove your worth to us, you may even become useful to our lord. */
  ++ @5463 /* Who is your lord? */ + A7Q5EF01.Intro.6
  ++ @5464 /* What do you have in mind? */ + A7Q5EF01.Intro.8
  ++ @5465 /* No, I don't want to work for your kind. */ + A7Q5EF01.Challenged.2
END

IF ~~ A7Q5EF01.Intro.5
  SAY @5466 /* If you wanted to impress me with your answer, then I have to disappoint you, <RACE>. */
  = @5467 /* You are fortunate that I'm in a generous mood today, so I will let it pass. But don't sputter such nonsense again or you won't find me as forgiving as I am now. */
  = @5468 /* I will give you the chance to earn our respect. If you prove your worth to us, you may even become useful to our lord. */
  ++ @5463 /* Who is your lord? */ + A7Q5EF01.Intro.6
  ++ @5464 /* What do you have in mind? */ + A7Q5EF01.Intro.8
  ++ @5465 /* No, I don't want to work for your kind. */ + A7Q5EF01.Challenged.2
END

IF ~~ A7Q5EF01.Intro.6
  SAY @5469 /* That isn't for you to know yet. */
  IF ~~ + A7Q5EF01.Intro.7
END

IF ~~ A7Q5EF01.Intro.7
  SAY @5470 /* Are you ready to do some chores for us? */
  ++ @5471 /* Sure, why not? What do you have in mind? */ + A7Q5EF01.Intro.8
  ++ @5465 /* No, I don't want to work for your kind. */ + A7Q5EF01.Challenged.2
END

IF ~~ A7Q5EF01.Intro.8
  SAY @5472 /* Prove to us that you are willing to invest both your time and strength in our cause, no matter how insignificant the task. */
  IF ~~ + A7Q5EF01.SubQuest1.1.1
END


// *** Subquest 1 ***
IF ~~ A7Q5EF01.SubQuest1.1.1
  SAY @5473 /* I have a small problem concerning a group of salamanders who have settled in recently. */
  IF ~~ DO ~SetGlobal("SubQuest1Given", "LOCALS", 1)~ + A7Q5EF01.SubQuest1.1.2
END

IF ~~ A7Q5EF01.SubQuest1.1.2
  SAY @5474 /* They didn't show any interest in our proposal to join us and I'm getting tired of it. */
  = @5475 /* Although the matter is too small for my personal attention, it is perfectly suited to show me your talents. */
  ++ @5476 /* Who are they and where can I find them? */ DO ~IncrementGlobal("Motivation", "LOCALS", 1)~ + A7Q5EF01.SubQuest1.1.3
  ++ @5477 /* You don't leave me much choice. Alright, I'll see what I can do. */ + A7Q5EF01.SubQuest1.1.4
  ++ @5478 /* Let me think about it. */ + A7Q5EF01.SubQuest1.1.6
  ++ @5479 /* This is quickly sounding like it's beneath me. Find another lackey to do your menial tasks. */ + A7Q5EF01.Challenged.2
END

IF ~~ A7Q5EF01.SubQuest1.1.3
  SAY @5480 /* That's the spirit! */
  IF ~~ + A7Q5EF01.SubQuest1.1.5
END

IF ~~ A7Q5EF01.SubQuest1.1.4
  SAY @5481 /* You should seriously work on your motivation. */
  IF ~~ + A7Q5EF01.SubQuest1.1.5
END

IF ~~ A7Q5EF01.SubQuest1.1.5
  SAY @5482 /* Here, take this contract. Your task is to return it to me, signed by their "boss". You will find them in one of the structures to the south. */
  = @5483 /* Good luck. You will need it. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 1) GiveItemCreate("A7MISC8", LastTalkedToBy, 0, 0, 0)
      EraseJournalEntry(@6507)~ UNSOLVED_JOURNAL @6506 EXIT
END

IF ~~ A7Q5EF01.SubQuest1.1.6
  SAY @5484 /* Very well, we will talk again when you have found the courage to work for us. */
  IF ~~ UNSOLVED_JOURNAL @6507 EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) Global("SubQuest1Given", "LOCALS", 1)~ A7Q5EF01.SubQuest1.1.7
  SAY @5485 /* You return? Are you now ready to deal with the salamanders? */
  ++ @5486 /* Yes, I am. Who are they and where can I find them? */ DO ~IncrementGlobal("Motivation", "LOCALS", 1)~ + A7Q5EF01.SubQuest1.1.3
  ++ @5477 /* You don't leave me much choice. Alright, I'll see what I can do. */ + A7Q5EF01.SubQuest1.1.4
  ++ @5487 /* I need more time to decide. */ + A7Q5EF01.SubQuest1.1.6
  ++ @5488 /* I'm not interested. Find another lackey to do your menial tasks. */ + A7Q5EF01.Challenged.2
END

IF ~GlobalGT("A7Q5SubQuest1", "A77003", 0) GlobalLT("A7Q5SubQuest1", "A77003", 5)~ A7Q5EF01.SubQuest1.1.8
  SAY @5489 /* Did you make any progress, <GABBER>? */
  ++ @5490 /* Not yet. I'm still working on it. */ + A7Q5EF01.SubQuest1.1.9
  + ~Global("A7Q5SubQuest1", "A77003", 1)~ + @5491 /* Could you please repeat my task again? */ + A7Q5EF01.SubQuest1.1.10
  + ~Global("A7Q5SubQuest1", "A77003", 2) Global("SubQuest1Referred", "LOCALS", 0)~ + @5492 /* The salamanders don't want to sign the contract unless I provide them with a fire elemental. */ + A7Q5EF01.SubQuest1.2.1
  + ~Global("A7Q5SubQuest1", "A77003", 2) Global("SubQuest1Referred", "LOCALS", 1)~ + @5493 /* I can't find the summoner. */ + A7Q5EF01.SubQuest1.2.2
  + ~Global("A7Q5SubQuest1", "A77003", 3)~ + @5494 /* I need to find mephit blood. Do you have any? */ + A7Q5EF01.SubQuest1.3.1
  ++ @5495 /* This task is more trouble that it's worth it. Find another lackey to do your menial tasks. */ + A7Q5EF01.Challenged.2
END

IF ~~ A7Q5EF01.SubQuest1.1.9
  SAY @5496 /* Please hurry, I'm waiting for results. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF01.SubQuest1.1.10
  SAY @5497 /* Once again. */
  = @5498 /* Take the contract I have given you to the salamanders and convince their leader to sign it. Return the signed contract back to me and your task is done. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF01.SubQuest1.2.1
  SAY @5499 /* They are such an annoying bunch. I honestly don't know why our lord places so much value on bringing them into our service. */
  = @5500 /* You should seek out our summoner, he can probably help you. */
  IF ~~ DO ~SetGlobal("SubQuest1Referred", "LOCALS", 1)~ EXIT
END

IF ~~ A7Q5EF01.SubQuest1.2.2
  SAY @5501 /* Do you have nothing better to do than pestering me with trivial questions? */
  = @5502 /* Look for a building to the south and east. He's probably surrounded by his summoned creatures. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF01.SubQuest1.3.1
  SAY @5503 /* If you need reagents for our summoner then you have to discuss it with himself. */
  = @5504 /* I can't solve all of your petty problems myself. */
  IF ~~ EXIT
END


// PARTY returns either with signed contract or a poor excuse
IF ~GlobalGT("A7Q5SubQuest1", "A77003", 4) GlobalLT("A7Q5SubQuest1", "A77003", 10)~ A7Q5EF01.SubQuest1.5.1
  SAY @5505 /* Do you return with the signed contract? */
  + ~Global("A7Q5SubQuest1", "A77003", 5) PartyHasItem("A7MISC8A")~ + @5506 /* Yes, it's right here. */ + A7Q5EF01.SubQuest1.5.2
  + ~Global("A7Q5SubQuest1", "A77003", 9) CheckStatGT(LastTalkedToBy, 14, CHR)~ + @5507 /* I'm sorry to say that the salamanders have refused to join your army. */ + A7Q5EF01.SubQuest1.5.3
  + ~Global("A7Q5SubQuest1", "A77003", 9) CheckStatLT(LastTalkedToBy, 15, CHR)~ + @5507 /* I'm sorry to say that the salamanders have refused to join your army. */ + A7Q5EF01.SubQuest1.5.4
  ++ @5508 /* Not yet. */ + A7Q5EF01.SubQuest1.1.9
END

IF ~~ A7Q5EF01.SubQuest1.5.2
  SAY @5509 /* Congratulations for a job well done. You have proven persistence and wit in your dealings with the salamanders. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 10) TakePartyItem("A7MISC8A") AddXP2DA("A7Q5SQ1")
      EraseJournalEntry(@6506) EraseJournalEntry(@6511) EraseJournalEntry(@6513)~ + A7Q5EF01.SubQuest2.0.1
END

IF ~~ A7Q5EF01.SubQuest1.5.3
  SAY @5510 /* I should have seen that coming. They are a treacherous pack. */
  = @5511 /* You did your best, for that I commend you. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 10) AddXP2DA("A7Q5SQ1")
      EraseJournalEntry(@6506) EraseJournalEntry(@6509) EraseJournalEntry(@6510) EraseJournalEntry(@6511) 
      EraseJournalEntry(@6512) EraseJournalEntry(@6513) EraseJournalEntry(@6514)~ + A7Q5EF01.SubQuest2.0.1
END

IF ~~ A7Q5EF01.SubQuest1.5.4
  SAY @5512 /* You don't lie very well. I know that you are to blame. */
  = @5513 /* I hope that you can improve yourself a bit or there will be...consequences. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 10) IncrementGlobal("Motivation", "LOCALS", -1)
      EraseJournalEntry(@6506) EraseJournalEntry(@6509) EraseJournalEntry(@6510) EraseJournalEntry(@6511) 
      EraseJournalEntry(@6512) EraseJournalEntry(@6513) EraseJournalEntry(@6514) ~ + A7Q5EF01.SubQuest2.0.1
END


// *** Subquest 2 ***
IF ~~ A7Q5EF01.SubQuest2.0.1
  SAY @5514 /* There is still another problem which you can solve for us. It is a direct order from our lord. */
  = @5515 /* Let me explain. As you've probably seen for yourself we have amassed a great number of fighters for our upcoming mission. Unless ourselves, they lack certain abilities which limit their effectiveness in hostile environments. */
  = @5516 /* The biggest problem is their lack of elemental resistances. Although we are perfectly capable of protecting them temporarily, this will only distract us needlessly in the heat of battle. */
  = @5517 /* Fortunately you came along. I know that your kind has the ability to produce all kinds of magical potions. */
  IF ~~ + A7Q5EF01.SubQuest2.0.2
END

IF ~~ A7Q5EF01.SubQuest2.0.2
  SAY @5518 /* I'll need you to provide us with at least twelve potions of cold resistance and six potions of electricity protection. */
  = @5519 /* I'm sure you know better than I where to get those. */
  ++ @5520 /* It is as good as done, commander. */ DO ~IncrementGlobal("Motivation", "LOCALS", 1)~ + A7Q5EF01.SubQuest2.1.1
  ++ @5521 /* Very well, but I hope this is the last errand I have to do. */ + A7Q5EF01.SubQuest2.1.2
  ++ @5522 /* Another menial task? I'm getting tired of it. */ + A7Q5EF01.SubQuest2.1.3
END

IF ~~ A7Q5EF01.SubQuest2.1.1
  SAY @5523 /* Splendid. I'll be waiting for good news. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest2", "A77003", 1)~ UNSOLVED_JOURNAL @6518 EXIT
END

IF ~~ A7Q5EF01.SubQuest2.1.2
  SAY @5524 /* Don't worry, your effort isn't in vein. Our lord has already taken notice of you. */
  = @5525 /* I'll be waiting for good news. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest2", "A77003", 1)~ UNSOLVED_JOURNAL @6518 EXIT
END

IF ~~ A7Q5EF01.SubQuest2.1.3
  SAY @5526 /* Do you give up so easily? */
  ++ @5527 /* No, you are right. I will do it for you and your lord. */ + A7Q5EF01.SubQuest2.1.2
  ++ @5528 /* Yes, I'm fed up to work as a slave. */ + A7Q5EF01.Challenged.3
END

IF ~Global("A7Q5SubQuest2", "A77003", 1)~ A7Q5EF01.SubQuest2.1.4
  SAY @5529 /* Do you have the potions? */
  ++ @5530 /* I'm still looking for the potions you require. */ + A7Q5EF01.SubQuest2.1.5
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN18", 5)~ + @5531 /* I can give you twelve potions of cold resistance and six potions of absorbtion. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN18", 6)
      DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18")~ + A7Q5EF01.SubQuest2.2.1
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN31", 0) NumItemsPartyGT("POTN18", 4)~ + @5532 /* I can give you twelve potions of cold resistance, a potion of insulation and five potions of absorbtion. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN31", 1) DestroyItem("POTN31") 
      TakePartyItemNum("POTN18", 5) DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18")~ + A7Q5EF01.SubQuest2.2.1
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN31", 1) NumItemsPartyGT("POTN18", 3)~ + @5533 /* I can give you twelve potions of cold resistance, two potions of insulation and four potions of absorbtion. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN31", 2) DestroyItem("POTN31") DestroyItem("POTN31") 
      TakePartyItemNum("POTN18", 4) DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18")~ + A7Q5EF01.SubQuest2.2.1
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN31", 2) NumItemsPartyGT("POTN18", 2)~ + @5534 /* I can give you twelve potions of cold resistance, three potions of insulation and three potions of absorbtion. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN31", 3) DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") 
      TakePartyItemNum("POTN18", 3) DestroyItem("POTN18") DestroyItem("POTN18") DestroyItem("POTN18")~ + A7Q5EF01.SubQuest2.2.1
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN31", 3) NumItemsPartyGT("POTN18", 1)~ + @5535 /* I can give you twelve potions of cold resistance, four potions of insulation and two potions of absorbtion. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN31", 4) DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") 
      TakePartyItemNum("POTN18", 2) DestroyItem("POTN18") DestroyItem("POTN18")~ + A7Q5EF01.SubQuest2.2.1
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN31", 4) NumItemsPartyGT("POTN18", 0)~ + @5536 /* I can give you twelve potions of cold resistance, five potions of insulation and a potion of absorbtion. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN31", 5) DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") 
      TakePartyItemNum("POTN18", 1) DestroyItem("POTN18")~ + A7Q5EF01.SubQuest2.2.1
  + ~NumItemsPartyGT("POTN22", 11) NumItemsPartyGT("POTN31", 5)~ + @5537 /* I can give you twelve potions of cold resistance and six potions of insulation. */ 
    DO ~TakePartyItemNum("POTN22", 12) 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") DestroyItem("POTN22") 
      TakePartyItemNum("POTN31", 6)
      DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31") DestroyItem("POTN31")~ + A7Q5EF01.SubQuest2.2.1
END

IF ~~ A7Q5EF01.SubQuest2.1.5
  SAY @5538 /* Please hurry. This is a very important task. */
  IF ~~ EXIT
END

IF ~~ A7Q5EF01.SubQuest2.2.1
  SAY @5539 /* Very good. This will be a great help in our mission. */
  IF ~GlobalGT("Motivation", "LOCALS", 1)~ DO ~AddXP2DA("A7Q5SQ2")~ + A7Q5EF01.SubQuest2.2.2
  IF ~GlobalLT("Motivation", "LOCALS", 2)~ DO ~AddXP2DA("A7Q5SQ2")~ + A7Q5EF01.SubQuest2.2.3
END

IF ~~ A7Q5EF01.SubQuest2.2.2
  SAY @5540 /* You have performed surprisingly well for a mortal and earned our respect. */
  = @5541 /* Our lord is very interested in the <RACE> who helped us so much. He wants to talk to you in person. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest2", "A77003", 10) SetGlobal("A7Quest5", "GLOBAL", 4) 
      EraseJournalEntry(@6515) EraseJournalEntry(@6516) EraseJournalEntry(@6517) EraseJournalEntry(@6518) 
      ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct4a")~ UNSOLVED_JOURNAL @6519 EXIT
END

IF ~~ A7Q5EF01.SubQuest2.2.3
  SAY @5542 /* You have met our expectations, mortal. Maybe you are useful to us after all. */
  = @5543 /* There is yet another matter which has to be solved. This one is very important, that's why our lord will talk to you about it in person. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest2", "A77003", 10) SetGlobal("A7Quest5", "GLOBAL", 4) 
      EraseJournalEntry(@6515) EraseJournalEntry(@6516) EraseJournalEntry(@6517) EraseJournalEntry(@6518) 
      ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct4a")~ UNSOLVED_JOURNAL @6519 EXIT
END


// *** After insulting the commander ***
IF ~~ A7Q5EF01.Challenged.1
  SAY @5544 /* You seek to challenge us? Why not, there is always time for a bit of fun. */
  IF ~~ DO ~SetGlobal("A7Q5EfreetiAttacked", "GLOBAL", 1) 
      EraseJournalEntry(@6502) EraseJournalEntry(@6503) EraseJournalEntry(@6504) EraseJournalEntry(@6505) 
      EraseJournalEntry(@6506) EraseJournalEntry(@6507) EraseJournalEntry(@6508) EraseJournalEntry(@6509) 
      EraseJournalEntry(@6510) EraseJournalEntry(@6511) EraseJournalEntry(@6512) EraseJournalEntry(@6513) 
      EraseJournalEntry(@6514) EraseJournalEntry(@6515) EraseJournalEntry(@6516) EraseJournalEntry(@6517) 
      EraseJournalEntry(@6518) EraseJournalEntry(@6519) Enemy()~ UNSOLVED_JOURNAL @6520 EXIT
END

IF ~~ A7Q5EF01.Challenged.2
  SAY @5545 /* That's too bad. Then you will experience the frightful power of the efreets firsthand. */
  IF ~~ DO ~SetGlobal("A7Q5EfreetiAttacked", "GLOBAL", 1) 
      EraseJournalEntry(@6502) EraseJournalEntry(@6503) EraseJournalEntry(@6504) EraseJournalEntry(@6505) 
      EraseJournalEntry(@6506) EraseJournalEntry(@6507) EraseJournalEntry(@6508) EraseJournalEntry(@6509) 
      EraseJournalEntry(@6510) EraseJournalEntry(@6511) EraseJournalEntry(@6512) EraseJournalEntry(@6513) 
      EraseJournalEntry(@6514) EraseJournalEntry(@6515) EraseJournalEntry(@6516) EraseJournalEntry(@6517) 
      EraseJournalEntry(@6518) EraseJournalEntry(@6519) Enemy()~ UNSOLVED_JOURNAL @6520 EXIT
END

IF ~~ A7Q5EF01.Challenged.3
  SAY @5546 /* I gave you the chance to earn our respect, instead you have earned our wrath. */
  IF ~~ DO ~SetGlobal("A7Q5EfreetiAttacked", "GLOBAL", 1) 
      EraseJournalEntry(@6502) EraseJournalEntry(@6503) EraseJournalEntry(@6504) EraseJournalEntry(@6505) 
      EraseJournalEntry(@6506) EraseJournalEntry(@6507) EraseJournalEntry(@6508) EraseJournalEntry(@6509) 
      EraseJournalEntry(@6510) EraseJournalEntry(@6511) EraseJournalEntry(@6512) EraseJournalEntry(@6513) 
      EraseJournalEntry(@6514) EraseJournalEntry(@6515) EraseJournalEntry(@6516) EraseJournalEntry(@6517) 
      EraseJournalEntry(@6518) EraseJournalEntry(@6519) Enemy()~ UNSOLVED_JOURNAL @6520 EXIT
END


// *** Talks after Malik appeared ***
IF ~Global("A7Quest5", "GLOBAL", 4)~ A7Q5EF01.Misc.1
  SAY @5547 /* You may address Lord Malik directly if you need something. */
  IF ~~ EXIT
END

