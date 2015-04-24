// *** Quest 5: Dialog for efreeti leader Malik ***
// Traified

BEGIN A7MALIK

// *** When entering hostile ***
IF ~Global("A7Quest5", "GLOBAL", 9) NumTimesTalkedTo(0)~ A7Malik.Hostile.1
  SAY @5300 /* Who dares to attack us? You will pay with your life! */
  IF ~~ DO ~Enemy()~ EXIT
END

// *** When turning hostile ***
IF ~Global("A7Quest5", "GLOBAL", 9) NumTimesTalkedToGT(0)~ A7Malik.Hostile.2
  SAY @5301 /* You dare to turn on us? I'll make short work of you! */
  IF ~~ DO ~Enemy()~ EXIT
END


// *** If Afaaqk talks to Malik ***
IF ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) GlobalLT("A7Quest5", "GLOBAL", 9)~ A7Malik.AskForLeader.Afaaq
  SAY @5302 /* Don't presume to talk to me, djinn. I would slay you without hesitation if we weren't honor-bound by our agreements with your master. */
  IF ~~ EXIT
END

// *** Whenever a party member except CHARNAME talks to Malik ***
IF ~GlobalLT("A7Quest5", "GLOBAL", 9) !InPartySlot(LastTalkedToBy, 0)~ A7Malik.AskForLeader.1
  SAY @5303 /* Leave my presence, <RACE>. I will only speak to your leader. */
  IF ~~ EXIT
END


// *** Friendly Malik ***
IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 0)~ A7Malik.Intro.1
  SAY @5304 /* Greetings, mortal. I am Lord Malik, the leader of our army. And you are the brave <PRO_RACE> who has helped us so much in our preparations for the upcoming mission? */
  = @5305 /* You can not fool me, <CHARNAME>. I know about you and your employers. I should kill you here and now for deceiving my subordinates. */
  = @5306 /* However, you have worked for us too. It would tarnish our honor if we didn't recognize the deeds you have done for us as well. */
  IF ~~ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 1)~ + A7Malik.Intro.2
END

IF ~~ A7Malik.Intro.2
  SAY @5307 /* No, I think there is a better way to deal with you. Your connection to those djinn might settle our little dispute peacefully, <PRO_RACE>. I'm sure your employers would like that. */
  = @5308 /* Despite what those djinn have told you, I'm not particularly eager to conquer their fortress. I am more interested in a single artifact that is currently in their possession. */
  = @5309 /* The artifact is called the "Crown of Qadeej" and its unique powers are suitable for my needs. I'm offering you the chance to earn more of our respect, and maybe even a small compensation for your troubles, if you return to your employers and convince them to surrender their artifact to me. What do do say, <CHARNAME>? */
  ++ @5310 /* Very well, I will return to the djinn and tell them your offer. */ + A7Malik.Artifact.Accepted.1
  + ~Alignment(Player1, MASK_EVIL) PartyHasItem("A7FLUTE")~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
  + ~Alignment(Player1, MASK_GENEUTRAL) PartyHasItem("A7FLUTE") OR(2) Global("A7Q5AfaaqAppears", "GLOBAL", 2) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
  ++ @5312 /* No, I don't want to be part of your schemes, Malik. */ + A7Malik.Artifact.Rejected.1
END


// *** CHARNAME betrays the djinns to Lord Malik ***
IF ~~ A7Malik.Artifact.Betrayal.1
  SAY @5313 /* That is an intriguing thought. Please, tell me more, <CHARNAME>. */
  ++ @5314 /* I have a whistle which enables me to summon the djinn at will. I could use it to lure the djinn to their doom. */ + A7Malik.Artifact.Betrayal.2
END

IF ~~ A7Malik.Artifact.Betrayal.2
  SAY @5315 /* That is exactly what I needed. You are quite a bold <PRO_RACE>, <CHARNAME>. I think it'll work best near the prison in the north... */
  IF ~~ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 5) SetGlobal("A7Q5MalikTrapDjinns", "A77003", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct6a")~ EXIT
END

IF ~Global("A7Q5Artifact", "GLOBAL", 5) Global("A7Q5DjinnsTrapped", "GLOBAL", 0) Global("A7Q5MalikTrapDjinns", "A77003", 1)~ A7Malik.Artifact.Betrayal.3
  SAY @5316 /* There we are. While I'm busy preparing the prison for our guest, you will call the djinn. */
  IF ~~ DO ~SetGlobal("A7Q5DjinnsTrapped", "GLOBAL", 1) TakePartyItem("A7FLUTE") DestroyItem("A7FLUTE") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct6b")~ EXIT
END


CHAIN IF ~Global("A7Q5DjinnsTrapped", "GLOBAL", 1)~ THEN A7MALIK A7Malik.Artifact.Betrayal.4
  @5317 /* Greetings Karim, I welcome you and your brothers to our domain. Unfortunately our hospitality will be somewhat limited as I need your services very soon. */
  == A7KARIM @5318 /* A trap? What did you do to us, efreet! */
  == A7MALIK @5319 /* Oh, nothing special. You can thank our good friend <CHARNAME> for your current inconveniences. */
  == A7KARIM @5320 /* How could you stab us in the back, <CHARNAME>? Do not think this will be the end. You have made a dangerous enemy today! */
  == A7Q5DJ05 IF ~Global("A7Q5AfaaqAppears", "GLOBAL", 2)~ THEN @5321 /* I despise you, <CHARNAME>. Your actions are many times worse than the humiliations I have suffered in the past. May your life find a gruesome end. */
EXTERN A7MALIK A7Malik.Artifact.Betrayal.5


APPEND A7MALIK
  IF ~~ A7Malik.Artifact.Betrayal.5
    SAY @5322 /* I'm afraid that your reunion with <CHARNAME> is a short one. Brace yourself, you have hard times before you. */
    = @5323 /* And now to you, <CHARNAME>. You have saved us a lot of time and effort. That's why I reward you with a valuable gift which grants you some powers of the efreet kind. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 10) SetGlobal("A7Q5Artifact", "GLOBAL", 10) SetGlobal("A7Q5EfreetiTeleportAway", "GLOBAL", 1)
        GiveItemCreate("A7WAND2", Player1, 10, 10, 10) AddXP2DA("A7Q5MQ4") ReputationInc(-1)
        EraseJournalEntry(@6521) EraseJournalEntry(@6522) EraseJournalEntry(@6523) EraseJournalEntry(@6524) 
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) 
        EraseJournalEntry(@6529) EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) 
        EraseJournalEntry(@6533) EraseJournalEntry(@6534) EraseJournalEntry(@6535) EraseJournalEntry(@6536) 
        EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) EraseJournalEntry(@6540) EraseJournalEntry(@6548) 
        ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct7a")~ SOLVED_JOURNAL @6590 EXIT
  END


  // *** CHARNAME rejects Lord Malik's offer to retrieve the artifact ***
  IF ~~ A7Malik.Artifact.Rejected.1
    SAY @5324 /* That is unfortunate. I fear that our hospitality will come to end now. Prepare yourself! */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 9) SetGlobal("A7Q5Artifact", "GLOBAL", 9) SetGlobal("A7Q5EfreetiAttacked", "GLOBAL", 1) SetGlobal("AttackParty", "LOCALS", 1) 
        EraseJournalEntry(@6521) EraseJournalEntry(@6522) EraseJournalEntry(@6523) EraseJournalEntry(@6524) 
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) 
        EraseJournalEntry(@6529) EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) 
        EraseJournalEntry(@6533) EraseJournalEntry(@6534) EraseJournalEntry(@6535) EraseJournalEntry(@6536) 
        EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) EraseJournalEntry(@6540) EraseJournalEntry(@6548) 
        Enemy()~ UNSOLVED_JOURNAL @6545 EXIT
  END


  // *** CHARNAME accepts Malik's offer to retrieve the artifact from the djinns ***
  IF ~~ A7Malik.Artifact.Accepted.1
    SAY @5325 /* Yes, do that. I will eagerly await your return. */
    IF ~Global("ToldAboutAfaaq", "LOCALS", 1)~ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 2) EraseJournalEntry(@6519)~ UNSOLVED_JOURNAL @6521 EXIT
    IF ~Global("ToldAboutAfaaq", "LOCALS", 0) !PartyHasItem("A7DJLMP") !PartyHasItem("A7DJLMPA")~ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 2) EraseJournalEntry(@6519)~ UNSOLVED_JOURNAL @6521 EXIT
    IF ~Global("ToldAboutAfaaq", "LOCALS", 0) OR(2) PartyHasItem("A7DJLMP") PartyHasItem("A7DJLMPA")~ + A7Malik.Artifact.Accepted.Afaaq
  END

  IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 2)~ A7Malik.Artifact.Accepted.1.1
    SAY @5326 /* Yes, <CHARNAME>? Do you have something else to say? */
    + ~Alignment(Player1, MASK_EVIL) PartyHasItem("A7FLUTE")~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
    + ~Alignment(Player1, MASK_GENEUTRAL) PartyHasItem("A7FLUTE") OR(2) Global("A7Q5AfaaqAppears", "GLOBAL", 2) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
    ++ @5327 /* Yes, I have. I don't want to be part of your schemes, Malik. */ + A7Malik.Artifact.Rejected.1
    ++ @5328 /* Not at the moment. I will talk to the djinn at once. */ + A7Malik.Artifact.Accepted.1.2
  END

  IF ~~ A7Malik.Artifact.Accepted.1.2
    SAY @5329 /* Then make haste and don't bother me with your meaningless chatter. */
    IF ~~ EXIT
  END

  IF ~~ A7Malik.Artifact.Accepted.Afaaq
    SAY @5330 /* And one last point. I know that you are accompanied by the djinni Afaaq, <CHARNAME>. I will tolerate his presence within our domain, as long as you keep his actions under control. */
    IF ~~ DO ~SetGlobal("ToldAboutAfaaq", "LOCALS", 1) SetGlobal("A7Q5Artifact", "GLOBAL", 2) EraseJournalEntry(@6519)~ UNSOLVED_JOURNAL @6522 EXIT
  END


  // *** CHARNAME returns from Karim with answer about artifact ***
  IF ~Global("A7Quest5", "GLOBAL", 4) OR(2) Global("A7Q5Artifact", "GLOBAL", 3) Global("A7Q5Artifact", "GLOBAL", 8)~ A7Malik.Artifact.Accepted.2
    SAY @5331 /* Welcome back, <CHARNAME>. Were you successful in your dealings with the djinn? */
    + ~OR(2) Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 1)~ + @5332 /* Yes, in a sense. After discussing your offer extensively, we have found a solution to satisfy both sides in this conflict. I'd like to offer you an artifact of comparable power. */ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 4)~ + A7Malik.Artifact.Alternative.1
    + ~Global("A7Q5DivineEssence", "GLOBAL", 1) !InParty("Imoen2") XPGT(Player1, 1000000)~ + @5333 /* Yes, maybe. I'd like to offer you a part of my soul. It contains the divine essence of the dead god Bhaal and may provide you with the same powers as the artifact you seek. */ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 4)~ + A7Malik.Artifact.Soul.1
    + ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2") !Alignment(Player1, MASK_EVIL) !Global("ImoenGiveSoul", "GLOBAL", 2) XPGT(Player1, 1000000) XPGT("Imoen2", 1000000)~ + @5334 /* Yes, maybe. I'd like to offer you a part of my or Imoen's soul. It contains the divine essence of the dead god Bhaal and may provide you with the same powers as the artifact you seek. */ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 4)~ + A7Malik.Artifact.Soul.1
    + ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2") Alignment(Player1, MASK_EVIL) XPGT(Player1, 1000000) XPGT("Imoen2", 1000000)~ + @5334 /* Yes, maybe. I'd like to offer you a part of my or Imoen's soul. It contains the divine essence of the dead god Bhaal and may provide you with the same powers as the artifact you seek. */ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 4)~ + A7Malik.Artifact.Soul.1
    + ~Alignment(Player1, MASK_EVIL) PartyHasItem("A7FLUTE")~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
    + ~Alignment(Player1, MASK_GENEUTRAL) PartyHasItem("A7FLUTE") OR(2) Global("A7Q5AfaaqAppears", "GLOBAL", 2) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
    ++ @5335 /* No, I don't want to be part of your schemes anymore, Malik. */ + A7Malik.Artifact.Rejected.1
    ++ @5336 /* Not yet. I still need some time to convince them. */ + A7Malik.Artifact.Accepted.4
  END

  IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 4)~ A7Malik.Artifact.Accepted.3
    SAY @5337 /* You are back, <CHARNAME>? Do you have something of interest to me? */
    + ~Global("A7Q5Demilich", "GLOBAL", 1) Global("TalkedAboutDemilich", "LOCALS", 0)~ + @5338 /* Maybe I have. I'd like offer you the phylactery of a powerful demilich instead of the "Crown of Qadeej". */ + A7Malik.Artifact.Demilich.1
    + ~Global("A7Q5Demilich", "GLOBAL", 1) Global("TalkedAboutDemilich", "LOCALS", 1)~ + @5339 /* I'd like to talk about the phylactery of a demilich. */ + A7Malik.Artifact.Demilich.7
    + ~Global("A7Q5DemonHeart", "GLOBAL", 1) Global("TalkedAboutDemonLord", "LOCALS", 0)~ + @5340 /* Maybe I have. I'd like to offer you the heart of a powerful demon lord in place of the "Crown of Qadeej". */ + A7Malik.Artifact.DemonHeart.1
    + ~Global("A7Q5DemonHeart", "GLOBAL", 1) Global("TalkedAboutDemonLord", "LOCALS", 1)~ + @5341 /* I'd like to talk about the heart of a demon lord. */ + A7Malik.Artifact.DemonHeart.4
    + ~Global("A7Q5DivineEssence", "GLOBAL", 1) !InParty("Imoen2") XPGT(Player1, 1000000)~ + @5333 /* Yes, maybe. I'd like to offer you a part of my soul. It contains the divine essence of the dead god Bhaal and may provide you with the same powers as the artifact you seek. */ + A7Malik.Artifact.Soul.1
    + ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2") !Alignment(Player1, MASK_EVIL) !Global("ImoenGiveSoul", "GLOBAL", 2) OR(2) XPGT(Player1, 1000000) XPGT("Imoen2", 1000000)~ + @5334 /* Yes, maybe. I'd like to offer you a part of my or Imoen's soul. It contains the divine essence of the dead god Bhaal and may provide you with the same powers as the artifact you seek. */ + A7Malik.Artifact.Soul.1
    + ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2") Alignment(Player1, MASK_EVIL) OR(2) XPGT(Player1, 1000000) XPGT("Imoen2", 1000000)~ + @5334 /* Yes, maybe. I'd like to offer you a part of my or Imoen's soul. It contains the divine essence of the dead god Bhaal and may provide you with the same powers as the artifact you seek. */ + A7Malik.Artifact.Soul.1
    + ~Alignment(Player1, MASK_EVIL) PartyHasItem("A7FLUTE")~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
    + ~Alignment(Player1, MASK_GENEUTRAL) PartyHasItem("A7FLUTE") OR(2) Global("A7Q5AfaaqAppears", "GLOBAL", 2) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ + @5311 /* I have a better plan. You could capture the djinn and use their powers to conquer their fortress. */ + A7Malik.Artifact.Betrayal.1
    ++ @5335 /* No, I don't want to be part of your schemes anymore, Malik. */ + A7Malik.Artifact.Rejected.1
    ++ @5342 /* Not yet. I still need some time. */ + A7Malik.Artifact.Accepted.4
  END

  IF ~~ A7Malik.Artifact.Accepted.4
    SAY @5343 /* Please hurry, <CHARNAME>. My patience is beginning to wear thin. */
    IF ~~ EXIT
  END


  // *** CHARNAME suggests an alternative artifact of comparable power ***
  IF ~~ A7Malik.Artifact.Alternative.1
    SAY @5344 /* I knew the djinn would be disagreeable. I have asked you to return with the "Crown of Qadeej" and you come back empty-handed? */
    + ~Global("A7Q5Demilich", "GLOBAL", 1)~ + @5345 /* Please hear me out. I'd like to offer you the phylactery of a powerful demilich. It provides similar powers as the artifact you seek. */ DO ~SetGlobal("TalkedAboutDemilich", "LOCALS", 1)~ + A7Malik.Artifact.Demilich.1
    + ~Global("A7Q5DemonHeart", "GLOBAL", 1)~ + @5346 /* Please hear me out. I'd like to offer you the heart of a mighty demon lord. It contains comparable powers to the artifact you seek. */ DO ~SetGlobal("TalkedAboutDemonLord", "LOCALS", 1)~ + A7Malik.Artifact.DemonHeart.1
  END

  IF ~~ A7Malik.Artifact.Demilich.1
    SAY @5347 /* Yes... yes, that might work. But can you also provide me with the knowledge how to tap its powers? */
    + ~PartyHasItem("A7BOOK01") PartyHasItem("A7SKULL")~ + @5348 /* You may be in luck. I came across a curious tome about undead rituals the other day which might explain what you want to know. */ + A7Malik.Artifact.Demilich.3
    ++ @5349 /* I don't know anything about it, but I promise to find the knowledge you seek. */ + A7Malik.Artifact.Demilich.2
  END

  IF ~~ A7Malik.Artifact.Demilich.2
    SAY @5350 /* Very well. When you've found everything I need, I will accept your offer. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 1) EraseJournalEntry(@6521) EraseJournalEntry(@6522)~ UNSOLVED_JOURNAL @6532 EXIT
  END

  IF ~~ A7Malik.Artifact.Demilich.3
    SAY @5351 /* Let me see it... Yes, this looks promising. Do you have the artifact as well? */
    + ~PartyHasItem("A7BOOK01") PartyHasItem("A7SKULL") !HasItemEquiped("A7SKULL", Player1) !HasItemEquiped("A7SKULL", Player2) !HasItemEquiped("A7SKULL", Player3) !HasItemEquiped("A7SKULL", Player4) !HasItemEquiped("A7SKULL", Player5) !HasItemEquiped("A7SKULL", Player6)~ 
      + @5352 /* Yes, of course. Here it is. */ + A7Malik.Artifact.Demilich.5
    + ~PartyHasItem("A7BOOK01") PartyHasItem("A7SKULL") OR(6) HasItemEquiped("A7SKULL", Player1) HasItemEquiped("A7SKULL", Player2) HasItemEquiped("A7SKULL", Player3) HasItemEquiped("A7SKULL", Player4) HasItemEquiped("A7SKULL", Player5) HasItemEquiped("A7SKULL", Player6)~ 
      + @5353 /* Yes, of course. Unfortunately the item is cursed and is causing us a bit of trouble. */ + A7Malik.Artifact.Demilich.6
    + ~OR(2) !PartyHasItem("A7SKULL") !PartyHasItem("A7BOOK01")~ + @5354 /* Not yet. I'm still searching, but I will return as soon as I have found it. */ + A7Malik.Artifact.Demilich.4
  END

  IF ~~ A7Malik.Artifact.Demilich.4
    SAY @5350 /* Very well. When you've found everything I need, I will accept your offer. */
    IF ~~ DO ~EraseJournalEntry(@6521) EraseJournalEntry(@6522) EraseJournalEntry(@6525) EraseJournalEntry(@6526) 
          EraseJournalEntry(@6527) EraseJournalEntry(@6528) EraseJournalEntry(@6529) EraseJournalEntry(@6530) EraseJournalEntry(@6531)~ UNSOLVED_JOURNAL @6532 EXIT
  END

  IF ~~ A7Malik.Artifact.Demilich.5
    SAY @5355 /* Thank you, <CHARNAME>, I am pleased. You can tell your employers that we will return home. Their little keep isn't of interest to us anymore. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 10) SetGlobal("A7Q5EfreetiTeleportAway", "GLOBAL", 1) 
        TakePartyItem("A7BOOK01") DestroyItem("A7BOOK01") TakePartyItem("A7SKULL") DestroyItem("A7SKULL")
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) EraseJournalEntry(@6529) 
        EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) EraseJournalEntry(@6533) EraseJournalEntry(@6534) 
        EraseJournalEntry(@6535) EraseJournalEntry(@6536) EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) 
        EraseJournalEntry(@6540) EraseJournalEntry(@6548) AddXP2DA("A7Q5MQ1") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct7a")~ UNSOLVED_JOURNAL @6541 EXIT
  END

  IF ~~ A7Malik.Artifact.Demilich.6
    SAY @5356 /* Haha, so you have played with fire and burned yourself. However, that doesn't hinder me to take it from you. */
    = @5357 /* I am pleased. You can tell your employers that we will return home. Their little keep isn't of interest to us anymore. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 10) SetGlobal("A7Q5EfreetiTeleportAway", "GLOBAL", 1) 
        ApplySpell(Player1, CLERIC_REMOVE_CURSE) ApplySpell(Player2, CLERIC_REMOVE_CURSE) ApplySpell(Player3, CLERIC_REMOVE_CURSE) 
        ApplySpell(Player4, CLERIC_REMOVE_CURSE) ApplySpell(Player5, CLERIC_REMOVE_CURSE) ApplySpell(Player6, CLERIC_REMOVE_CURSE) 
        TakePartyItem("A7BOOK01") DestroyItem("A7BOOK01") TakePartyItem("A7SKULL") DestroyItem("A7SKULL")
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) EraseJournalEntry(@6529) 
        EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) EraseJournalEntry(@6533) EraseJournalEntry(@6534) 
        EraseJournalEntry(@6535) EraseJournalEntry(@6536) EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) 
        EraseJournalEntry(@6540) EraseJournalEntry(@6548) 
        AddXP2DA("A7Q5MQ1") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct7a")~ UNSOLVED_JOURNAL @6541 EXIT
  END

  IF ~~ A7Malik.Artifact.Demilich.7
    SAY @5358 /* Do you have found everything I need? */
    + ~!PartyHasItem("A7BOOK01") PartyHasItem("A7SKULL")~ + @5359 /* I have found the skull of a demilich. It still contains much of its powers. */ + A7Malik.Artifact.Demilich.1
    + ~PartyHasItem("A7BOOK01") PartyHasItem("A7SKULL")~ + @5360 /* I came across a curious tome about undead rituals the other day which might explain what you want to know. */ + A7Malik.Artifact.Demilich.3
    ++ @5361 /* Not yet. I'm still searching, but I will return as soon as I have found what you need. */ + A7Malik.Artifact.Demilich.2
  END


  IF ~~ A7Malik.Artifact.DemonHeart.1
    SAY @5362 /* Demons are always a potent source of power. I would gladly accept such an artifact if you are capable to retrieve it. Demon lords are unimaginably powerful even on this plane and you will encounter their kind very rarely. */
    + ~OR(2) PartyHasItem("A7HEART1") PartyHasItem("A7HEART2")~ + @5363 /* There is no need to look for them, because I have already encountered one and collected his heart. */ + A7Malik.Artifact.DemonHeart.3
    ++ @5364 /* Nevertheless, I will make the attempt to find one and return with his heart. */ + A7Malik.Artifact.DemonHeart.2
  END

  IF ~~ A7Malik.Artifact.DemonHeart.2
    SAY @5365 /* I admire your courage and wait for your return. */
    IF ~~ DO ~EraseJournalEntry(@6521) EraseJournalEntry(@6522)~ UNSOLVED_JOURNAL @6533 EXIT
  END

  IF ~~ A7Malik.Artifact.DemonHeart.3
    SAY @5366 /* That was an impressive deed, <CHARNAME>. Even I would think twice before attacking a ruler of the demonic races. */
    = @5367 /* Thank you, I am pleased. You can tell your employers that we will return home. Their little keep isn't of interest to us anymore. */
    IF ~~ DO ~TakePartyItem("A7HEART1") DestroyItem("A7HEART1") 
        TakePartyItem("A7HEART2") DestroyItem("A7HEART2") 
        SetGlobal("A7Quest5", "GLOBAL", 10) SetGlobal("A7Q5EfreetiTeleportAway", "GLOBAL", 1) 
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) EraseJournalEntry(@6529) 
        EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) EraseJournalEntry(@6533) EraseJournalEntry(@6534) 
        EraseJournalEntry(@6535) EraseJournalEntry(@6536) EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) 
        EraseJournalEntry(@6540) EraseJournalEntry(@6548) 
        AddXP2DA("A7Q5MQ1") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct7a")~ UNSOLVED_JOURNAL @6542 EXIT
  END

  IF ~~ A7Malik.Artifact.DemonHeart.4
    SAY @5368 /* Did you find a heart already? */
    + ~OR(2) PartyHasItem("A7HEART1") PartyHasItem("A7HEART2")~ + @5369 /* Yes, I have defeated a powerful demon lord and collected his heart. */ + A7Malik.Artifact.DemonHeart.3
    ++ @5370 /* Not yet, but I will return as soon as I have found one. */ + A7Malik.Artifact.DemonHeart.2
  END


  // *** CHARNAME suggests a piece of his or Imoen's divine soul ***
  IF ~~ A7Malik.Artifact.Soul.1
    SAY @5371 /* This is unexpected, but what you tell me must be true. I can sense traces of divine power within you. */
    + ~!InParty("Imoen2")~ + @5372 /* I'd consider to sacrifice a part of my soul if you promise to cease your attacks on the djinn fortress. */ + A7Malik.Artifact.Soul.2
    + ~InParty("Imoen2") ~ + @5373 /* If you promise to cease your attacks on the djinn fortress, one of us would consider to sacrifice a part of our soul. */ + A7Malik.Artifact.Soul.2
  END

  IF ~~ A7Malik.Artifact.Soul.2
    SAY @5374 /* If you are really determined to do it, then I will accept your offer. However, the ritual I have in mind won't be painless. */
    ++ @5375 /* Very well, I will sacrifice myself. */ + A7Malik.Artifact.Soul.3
    + ~InParty("Imoen2") !StateCheck("Imoen2", CD_STATE_NOTVALID) XPGT("Imoen2", 1000000) Global("A7Q5ImoenEssenceDenied", "A77003", 0)~ + @5376 /* Your sacrifice will not be forgotten, Imoen. */ EXTERN IMOEN25J A7Imoen.DivineImoen.1
    ++ @5377 /* That sounds very dangerous. Please let me think about it some more. */ + A7Malik.Artifact.Accepted.4
  END

  IF ~~ A7Malik.Artifact.Soul.3
    SAY @5378 /* This is a selfless act you do for the djinn, but I won't complain. Brace yourself, <CHARNAME>! */
    IF ~~ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 6) SetGlobal("A7Q5MalikEssencePC", "A77003", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct6c")~ EXIT
  END

  IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 6) Global("A7Q5MalikEssencePC", "A77003", 1)~ A7Malik.Artifact.Soul.4
    SAY @5379 /* You have survived, <CHARNAME>, and I am pleased. You can tell your employers that we will return home. Their little keep isn't of interest to us anymore. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 10) SetGlobal("A7Q5Artifact", "GLOBAL", 10) SetGlobal("A7Q5MalikEssencePC", "A77003", 2) SetGlobal("A7Q5EfreetiTeleportAway", "GLOBAL", 1) 
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) EraseJournalEntry(@6529) 
        EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) EraseJournalEntry(@6533) EraseJournalEntry(@6534) 
        EraseJournalEntry(@6535) EraseJournalEntry(@6536) EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) 
        EraseJournalEntry(@6540) EraseJournalEntry(@6548) 
        AddXP2DA("A7Q5MQ2") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct7a")~ UNSOLVED_JOURNAL @6543 EXIT
  END

  IF ~~ A7Malik.Artifact.Soul.5
    SAY @5380 /* This is a selfless act you do for the djinn, but I won't complain. Brace yourself, Imoen! */
    IF ~~ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 6) SetGlobal("A7Q5MalikEssenceImoen", "A77003", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct6d")~ EXIT
  END

  IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 6) Global("A7Q5MalikEssenceImoen", "A77003", 1)~ A7Malik.Artifact.Soul.6
    SAY @5381 /* You have survived, Imoen, and I am pleased. You can tell your employers that we will return home. Their little keep isn't of interest to us anymore. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 10) SetGlobal("A7Q5Artifact", "GLOBAL", 10) SetGlobal("A7Q5MalikEssenceImoen", "A77003", 2) SetGlobal("A7Q5EfreetiTeleportAway", "GLOBAL", 1) 
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) EraseJournalEntry(@6529) 
        EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) EraseJournalEntry(@6533) EraseJournalEntry(@6534) 
        EraseJournalEntry(@6535) EraseJournalEntry(@6536) EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) 
        EraseJournalEntry(@6540) EraseJournalEntry(@6548) 
        AddXP2DA("A7Q5MQ3") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct7a")~ UNSOLVED_JOURNAL @6544 EXIT
  END
END


APPEND IMOEN25J
  IF ~~ A7Imoen.DivineImoen.1
    SAY @5382 /* Now that's really nice of you to decide over my head, <CHARNAME>. */
    + ~!Global("ImoenGiveSoul", "GLOBAL", 2)~ + @5383 /* Please do it, Imoen. It is for the good of dear friends. */ + A7Imoen.DivineImoen.2
    + ~Global("ImoenGiveSoul", "GLOBAL", 2)~ + @5383 /* Please do it, Imoen. It is for the good of dear friends. */ + A7Imoen.DivineImoen.4
    + ~!Alignment(Player1, MASK_GOOD)~ + @5384 /* Do it, Imoen! Don't forget who saved you from the clutches of Irenicus. */ + A7Imoen.DivineImoen.3
  END
  
  IF ~~ A7Imoen.DivineImoen.2
    SAY @5385 /* I know, I know.  I...will do it. */
    = @5386 /* I guess you have sacrificed enough in the past. But don't expect much from me for the rest of our journey. */
    ++ @5387 /* Thank you, Imoen. That really means a lot to me. */ EXTERN A7MALIK A7Malik.Artifact.Soul.5
    ++ @5388 /* Don't worry about that. I had planned to leave you in the safety of my pocket plane anyway. */ EXTERN A7MALIK A7Malik.Artifact.Soul.5
  END

  IF ~~ A7Imoen.DivineImoen.3
    SAY @5389 /* Don't yell at me, <CHARNAME>. You are always so pushy when you want something from me. Sheesh. */
    = @5390 /* Go ahead, do you stupid ritual and take my soul. I'll probably twiddling my thumbs for the rest of our journey anyway. */
    IF ~~ EXTERN A7MALIK A7Malik.Artifact.Soul.5
  END

  IF ~~ A7Imoen.DivineImoen.4
    SAY @5391 /* No way, <CHARNAME>. Have you already forgotten that I have sacrificed myself for Sarevok? */
    ++ @5392 /* Please do it one more time. */ + A7Imoen.DivineImoen.5
    ++ @5393 /* Very well, I understand. I will do it. */ EXTERN A7MALIK A7Malik.Artifact.Soul.3
    ++ @5394 /* I have to think about it some more. */ DO ~SetGlobal("A7Q5ImoenEssenceDenied", "A77003", 1)~ EXTERN A7MALIK A7Malik.Artifact.Accepted.4
  END

  IF ~~ A7Imoen.DivineImoen.5
    SAY @5395 /* Oh no! Now you it's your turn. Good luck! */
    ++ @5393 /* Very well, I understand. I will do it. */ EXTERN A7MALIK A7Malik.Artifact.Soul.3
    ++ @5394 /* I have to think about it some more. */ DO ~SetGlobal("A7Q5ImoenEssenceDenied", "A77003", 1)~ EXTERN A7MALIK A7Malik.Artifact.Accepted.4
  END
END

