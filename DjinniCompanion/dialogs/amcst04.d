// *** Dialog portions for the mercenary mage (Quest 5) ***
// Traified

ADD_STATE_TRIGGER ~AMCST04~ 0 ~!Global("A7Quest5", "GLOBAL", 1)~ 1 2 3 4 5 UNLESS ~!Global("A7Quest5","GLOBAL",1)~

APPEND ~AMCST04~
  // IF ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 0) Global("A7Q5RumorWizard", "GLOBAL", 0) Global("A7WandCreating", "LOCALS", 0)~ AMCST04.1
  IF ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 0) Global("A7Q5RumorWizard", "GLOBAL", 0) Global("A7WandCreating", "LOCALS", 0)~ AMCST04.1
    SAY @6010 /* Are you one of the newly recruited mercenaries? I don't recognize you. */
    ++ @6011 /* No, I'm in need of a way to protect myself from great heat, like that of boiling water. Can you help me? */ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 2)~ + AMCST04.3
  END

  // IF ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 0) Global("A7Q5RumorWizard", "GLOBAL", 1) Global("A7WandCreating", "LOCALS", 0)~ AMCST04.2
  IF ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 0) Global("A7Q5RumorWizard", "GLOBAL", 1) Global("A7WandCreating", "LOCALS", 0)~ AMCST04.2
    SAY @6012 /* So, you are the one in need of a mage I have heard about. It must be very important indeed, if you make such a ruckus. */
    ++ @6013 /* Yes, I'm in need of a way to protect myself from great heat, like that of boiling water. Can you help me? */ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 2)~ + AMCST04.3
  END

  IF ~~ AMCST04.3
    SAY @6014 /* You wouldn't ask me that if you'd know a simple spell like Protection from Fire would solve your problems. */
    = @6015 /* Let me think... I could devise a spell similar to fire protection which will shield you from any kind of heat. Maybe an item with a limited number of charges, so you can use it without learning the arts of magic. */
    = @6016 /* But this will take a while. And I need to be compensated for my time and effort I have to put into this. */
    = @6017 /* It will cost you 8000 gold. Are you still interested? */
    + ~PartyGoldGT(7999)~ + @6018 /* Very well, I will pay your price. */ DO ~TakePartyGold(8000)~ + AMCST04.5
    ++ @6019 /* No, this is too expensive for me. Maybe another time. */ + AMCST04.4
  END

  IF ~~ AMCST04.4
    SAY @6020 /* As you wish. I'll be still here, if you change your mind or until Balthazar finally gives us new orders. */
    IF ~~ DO ~SetGlobal("A7WandOffered", "LOCALS", 1)~ EXIT
  END

  IF ~~ AMCST04.5
    SAY @6021 /* Very good. This won't take long... */
  /*  = ~(The mage opens his bag and places an ornate piece of wood, several unknown substances and a scroll covered in runes onto the table. Quickly he draws some ritualistic symbols and places the substances on some of them before he starts to chant in a low voice. For a minute nothing happens, but then the substances begin to burn and the symbols come to life. The chant goes on for a while before it stops abruptly. The mage places the piece of wood into the center of the table and continues his chants while gesturing with his hands. The table starts to vibrate and a moment later with a huge flash and a loud bang the mage has reached the final stage of his casting. Both the symbols and the substances are gone and only the ornate piece of wood remains which appears to almost burst from the energies which are now bound to it.)~ */
    IF ~~ DO ~SetGlobal("A7WandCreating", "LOCALS", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct2a")~ EXIT
  END

  IF ~Global("A7Quest5", "GLOBAL", 1) Global("A7WandCreating", "LOCALS", 1)~ AMCST04.5.1
    SAY @6022 /* Whew! That was harder than I thought... *ahem* I mean, it is done. */
    = @6023 /* Take this wand. It possesses at least ten charges which enable you and your companions to endure great heat for an extended period of time. */
    = @6024 /* If you need it recharged, come and see me. */
    IF ~~ DO ~SetGlobal("A7WandCreating", "LOCALS", 0) SetGlobal("A7WandOffered", "LOCALS", 2) SetGlobal("A7Q5Wand", "GLOBAL", 1) GiveItemCreate("A7WAND1", LastTalkedToBy, 10, 0, 0)~ EXIT
  END

  IF ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Wand", "GLOBAL", 0) Global("A7WandOffered", "LOCALS", 1) Global("A7WandCreating", "LOCALS", 0)~ AMCST04.6
    SAY @6025 /* Greeting. Are you still in need of some heat protection? For 8000 gold I can solve your problem. */
    + ~PartyGoldGT(7999)~ + @6018 /* Very well, I will pay your price. */ DO ~TakePartyGold(8000)~ + AMCST04.5
    ++ @6026 /* No, not at the moment. */ + AMCST04.4
  END

  // IF WEIGHT #0 ~GlobalGT("A7Quest5", "GLOBAL", 0) GlobalLT("A7Quest5", "GLOBAL", 10) PartyHasItem("A7WAND1") Global("A7WandOffered", "LOCALS", 2)~ AMCST04.7
  IF ~GlobalGT("A7Quest5", "GLOBAL", 0) GlobalLT("A7Quest5", "GLOBAL", 10) PartyHasItem("A7WAND1") Global("A7WandOffered", "LOCALS", 2)~ AMCST04.7
    SAY @6027 /* Greetings, <GABBER>. Do you need something? I can recharge your wand for a small fee, if needed. */
    ++ @6028 /* Could you recharge my wand? */ + AMCST04.8
    ++ @6029 /* No, I don't need something at the moment. */ + AMCST04.4
  END

  IF ~~ AMCST04.8
    SAY @6030 /* Sure, for the small fee of 5000 gold I can recharge the wand to its limit. */
    + ~PartyGoldGT(4999)~ + @6018 /* Very well, I will pay your price. */ DO ~TakePartyGold(5000) TakePartyItem("A7WAND1")~ + AMCST04.9
    ++ @6019 /* No, this is too expensive for me. Maybe another time. */ + AMCST04.4
  END

  IF ~~ AMCST04.9
    SAY @6031 /* (The mage closes his eyes and mutters some words.) Your wand is recharged, use it well. */
    IF ~~ DO ~GiveItemCreate("A7WAND1", LastTalkedToBy, 10, 0, 0)~ EXIT
  END
END
