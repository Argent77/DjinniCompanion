// *** Dialog portions for Lazarus Librarus (Quest 5) ***
// Traified

ADD_STATE_TRIGGER 25SPELL 5 ~Global("A7WandCreating", "LOCALS", 0)~

EXTEND_BOTTOM 25SPELL 1
  + ~!Global("lazarusscroll", "GLOBAL", 3) Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 0)~ 
    + @5960 /* I'm in need of a way to protect myself from great heat, like that of boiling water. Can you help me? */ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 1) SetGlobal("A7WandOffered", "LOCALS", 1)~ + 25SPELL.1
  + ~Global("lazarusscroll", "GLOBAL", 3) Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 0)~ 
    + @5960 /* I'm in need of a way to protect myself from great heat, like that of boiling water. Can you help me? */ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 2)~ + 25SPELL.2
  + ~Global("lazarusscroll", "GLOBAL", 3) Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 1)~ 
    + @5961 /* I'd like to talk about your item of heat protection again. */ + 25SPELL.6
  + ~GlobalGT("A7Quest5", "GLOBAL", 0) GlobalLT("A7Quest5", "GLOBAL", 10) PartyHasItem("A7WAND1") Global("A7WandOffered", "LOCALS", 2)~ 
    + @5962 /* Can you recharge my Wand of Heat Protection? */ + 25SPELL.7
END

APPEND 25SPELL
  IF ~~ 25SPELL.1
    SAY @5963 /* Sorry, but I am far too busy recreating my spell collections. If you are really desperate, you could try the mercenary mage in the tavern. I've met him briefly and he appeared to be an able mage. */
    = #70770 /* ~Can I interest you in my wares?  I've got a collection of scrolls most mages would die for!~ */
    ++ #70771 /* ~Let me see what you've got.~ */ + 2
    ++ #70772 /* ~I'd like to ask you some questions about this town.~ */ + 4
    ++ #70774 /* ~No thanks, I'll be going now.~ */ + 3
  END

  IF ~~ 25SPELL.2
    SAY @5964 /* This is a request I'm not asked every day. But you are in luck, <GABBER>. */
    = @5965 /* Thanks to your help in Saradush I have some spare materials left to create an item for you which fits your need. */
    = @5966 /* I have to ask for a moderate fee of 3000 gold, however. Creating such an item is no easy task. */
    + ~PartyGoldGT(2999)~ + @5967 /* Very well, I will pay your price. */ DO ~TakePartyGold(3000)~ + 25SPELL.4
    ++ @5968 /* No, this is too expensive for me. Maybe another time. */ + 25SPELL.3
  END

  IF ~~ 25SPELL.3
    SAY @5969 /* As you wish. If you change your mind, you can always come back to me. */
    IF ~~ DO ~SetGlobal("A7WandOffered", "LOCALS", 1)~ EXIT
  END

  IF ~~ 25SPELL.4
    SAY @5970 /* Very good. This won't take long... */
    IF ~~ DO ~SetGlobal("A7WandCreating", "LOCALS", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct2b")~ EXIT
  END

  IF ~Global("A7WandCreating", "LOCALS", 1)~ 25SPELL.5
    SAY @5971 /* Your wand is ready. */
    = @5972 /* It possesses at least ten charges which enable you and your companions to endure great heat for an extended period of time. */
    = @5973 /* If you need it recharged, come back and see me again. */
    IF ~~ DO ~SetGlobal("A7WandCreating", "LOCALS", 0) SetGlobal("A7WandOffered", "LOCALS", 2) SetGlobal("A7Q5Wand", "GLOBAL", 1) GiveItemCreate("A7WAND1", LastTalkedToBy, 10, 0, 0)~ EXIT
  END

  IF ~~ 25SPELL.6
    SAY @5974 /* So, do you have changed your mind? For only 3000 gold I am willing to create it for you. */
    + ~PartyGoldGT(2999)~ + @5967 /* Very well, I will pay your price. */ DO ~TakePartyGold(3000)~ + 25SPELL.4
    ++ @5968 /* No, this is too expensive for me. Maybe another time. */ + 25SPELL.3
  END

  IF ~~ 25SPELL.7
    SAY @5975 /* Yes, this will be no problem. It will cost you 2000 gold, however. */
    + ~PartyGoldGT(1999)~ + @5967 /* Very well, I will pay your price. */ DO ~TakePartyGold(2000) TakePartyItem("A7WAND1")~ + 25SPELL.8
    ++ @5968 /* No, this is too expensive for me. Maybe another time. */ + 25SPELL.3
  END

  IF ~~ 25SPELL.8
    SAY @5976 /* (The mage closes his eyes and mutters some words.) Your wand is recharged, use it well. */
    IF ~~ DO ~GiveItemCreate("A7WAND1", LastTalkedToBy, 10, 0, 0)~ + 1
  END
END
