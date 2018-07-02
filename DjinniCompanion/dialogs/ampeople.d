// *** Dialog portions for a couple of Amkethran citizen (Quest 5) ***
// Traified

// Mercenary archer
APPEND ~AMARCH01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") OR(2) GlobalLT("A7Q5RumorWizard", "GLOBAL", 2) GlobalLT("A7Q5RumorCleric", "GLOBAL", 2)~ AMARCH01.1
    SAY @6050 /* What do you want from me, citizen? */
    + ~Global("A7Q5RumorWizard", "GLOBAL", 0)~ + @6051 /* Do you know where I can find some protection from heat? */ + AMARCH01.2
    + ~!Global("A7Q5RumorWizard", "GLOBAL", 0) GlobalLT("A7Q5RumorCleric", "GLOBAL", 2)~ + @6051 /* Do you know where I can find some protection from heat? */ + AMARCH01.3
  END

  IF ~~ AMARCH01.2
    SAY @6052 /* Yeah, the heat is killing me too. I'd rather chilling in the tavern than practicing my marksman skills over and over again. */
    ++ @6053 /* No, I meant some kind of magical protection. */ + AMARCH01.4
  END

  IF ~~ AMARCH01.3
    SAY @6054 /* Why don't you ask the priests in the temple about it. They are in charge of that kind of things. */
    IF ~~ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 1)~ EXIT
  END

  IF ~~ AMARCH01.4
    SAY @6055 /* Do I look like a mage to you? Ask someone else about it? */
    = @6056 /* No, wait. I've heard, the monks hired wizards from the Twisted Rune. Ask around the tavern, they are a lazy bunch. */
    IF ~~ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 1)~ EXIT
  END
END


// Mercenary captain
APPEND ~AMCAPT01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorCleric", "GLOBAL", 2)~ AMCAPT01.1
    SAY @6057 /* What is it, citizen? Don't you see I am busy? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMCAPT01.2
  END

  IF ~~ AMCAPT01.2
    SAY @6058 /* Why does always everyone come to me when complaining about one thing or another? */
    ++ @6059 /* Can you help me or not?. */ + AMCAPT01.3
    ++ @6060 /* I'm sorry, I won't bother you anymore. */ EXIT
  END

  IF ~~ AMCAPT01.3
    SAY @6061 /* I always send my men to the local cleric when they complain about sunburns and heatstrokes. Why don't you go there, too, instead of bothering me further. */
    IF ~~ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 1)~ EXIT
  END
END


// Mercenary #1 in the tavern
APPEND ~AMCST02~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorWizard", "GLOBAL", 2)~ AMCST02.1
    SAY @6062 /* Begone, I am here to drink and don't want to talk to you folk. */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMCST02.2
  END

  IF ~~ AMCST02.2
    SAY @6063 /* Why don't you talk to my friend here. He is a wizard and knows about stuff like that. */
    = @6064 /* Will you please let me drink in peace? */
    IF ~~ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 1)~ EXIT
  END
END

// Mercenary #2 in the tavern
APPEND ~AMCST03~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorWizard", "GLOBAL", 2)~ AMCST03.1
    SAY @6065 /* Ho, friends. How do you like this dust mote of a village. */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMCST03.2
  END

  IF ~~ AMCST03.2
    SAY @6066 /* Protection from heat? Why don't you stay here in the tavern all day. It's the perfect place to chill out. */
    ++ @6067 /* No, I'm more interested in some kind of magical protection. */ + AMCST03.3
  END

  IF ~~ AMCST03.3
    SAY @6068 /* Why don't you say so in the first place? Ask my friend here. He's a mage and knows that sort of stuff. */
    IF ~~ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 1)~ EXIT
  END
END


// Amkethran Smuggler
APPEND ~AMSMUG01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorWizard", "GLOBAL", 2)~ AMSMUG01.1
    SAY @6069 /* Are you a customer? You may speak to Carras while our leader is busy elsewhere. */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMSMUG01.2
  END

  IF ~~ AMSMUG01.2
    SAY @6070 /* Hmm... I'm no mage, but maybe Carras can help you with it. He always has a variety of items and scrolls to sell. */
    = @6071 /* Other than that, I know of a mage in this village. His name is Lazarus Librarus. He has settled in just recently. Maybe he could help you in this matter. */
    IF ~~ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 1)~ EXIT
  END
END


// Amkethran Barkeeper
EXTEND_BOTTOM ~AMBAR01~ 3 21 #2
  + ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorCleric", "GLOBAL", 2) GlobalLT("A7Q5RumorWizard", "GLOBAL", 2)~
    + @6051 /* Do you know where I can find some protection from heat? */ + AMBAR01.1
  + ~Global("A7Q5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") Global("A7Q5RumorWizard", "GLOBAL", 1)~
    + @6072 /* I've heard that there are some mercenary wizards around. Do you know about them? */ + AMBAR01.2
END

APPEND ~AMBAR01~
  IF ~~ AMBAR01.1
    SAY @6073 /* Not used to the hot climate we have here, are you? */
    = @6074 /* Maybe our local priest of the Waukeen Temple can help you. He is specialized in all sorts of protections. */
    IF ~~ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 1)~ + 21
  END

  IF ~~ AMBAR01.2
    SAY @6075 /* Yes, of course. They are frequent visitors of my tavern. */
    = @6076 /* But I wouldn't bother talking to them. They are very rude to non-wizard folk. */
    IF ~~ + 21
  END
END


// Amkethran Tavern Wench
APPEND ~AMWENC01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1")~ AMWENC01.1
    SAY @6077 /* Welcome traveller. If you have an order, you'll have to give it to Zakee. */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMWENC01.2
  END

  IF ~~ AMWENC01.2
    SAY @6078 /* I'm too busy right now, sorry. Talk to Zakee if you have any questions. */
    IF ~~ EXIT
  END
END


// Amkethran tavern visitor
APPEND ~AMCST01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") Gender(LastTalkedToBy, FEMALE) NumTimesTalkedTo(0)~ AMCST01.Female.1
    SAY @6079 /* Hmm? Are you the new serving wench? Get me another round of ale, please! */
    ++ @6080 /* Watch your tongue! I just want to ask you something. */ + AMCST01.Female.2
  END

  IF ~~ AMCST01.Female.2
    SAY @6081 /* No? That's too bad. What can I do for you then, my <GIRLBOY>? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMCST01.1
  END

  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") Gender(LastTalkedToBy, FEMALE) NumTimesTalkedToGT(0)~ AMCST01.Female.3
    SAY @6082 /* Come, sit with me for a while. Can I help you in some way, my <GIRLBOY>? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMCST01.1
  END

  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") Gender(LastTalkedToBy, MALE)~ AMCST01.Male.1
    SAY @6083 /* Hmm? You don't look like the serving wench. What do you want from me? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMCST01.1
  END

  IF ~~ AMCST01.1
    SAY @6084 /* The heat is no problem to you if you stay in the tavern all day. The drinks are great and the company is friendly... well, most of the time. */
    IF ~~ EXIT
  END
END



// Amkethran woman #1
APPEND ~AMFEM01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorCleric", "GLOBAL", 2)~ AMFEM01.1
    SAY @6085 /* Are you one of the mercenaries? What do you want from me? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMFEM01.2
  END

  IF ~~ AMFEM01.2
    SAY @6086 /* If you are bothered by the heat so much, why don't you stay indoors during the days then? */
    ++ @6067 /* No, I'm more interested in some kind of magical protection. */ + AMFEM01.3
  END

  IF ~~ AMFEM01.3
    SAY @6087 /* I'm just a simple woman. What would I know about magic? */
    = @6088 /* Maybe our local cleric can help you. He had cured our son once when he burned himself on the kettle. */
    IF ~~ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 1)~ EXIT
  END
END


// Amkethran woman #2
APPEND ~AMFEM02~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") Gender(LastTalkedToBy, MALE)~ AMFEM02.Male.1
    SAY @6089 /* Hello darling. Are you new in the town? You certainly don't look like one of the mercenaries. Do you need something from me? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMFEM02.1
  END

  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") Gender(LastTalkedToBy, FEMALE)~ AMFEM02.Female.1
    SAY @6090 /* Are you new in the town? You certainly don't look like one of the mercenaries. Do you need something from me? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMFEM02.1
  END

  IF ~~ AMFEM02.1
    SAY @6091 /* Sorry, I can't help you with that. */
    IF ~~ EXIT
  END
END


// Amkethran man #1
APPEND ~AMMAN01~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorWizard", "GLOBAL", 2)~ AMMAN01.1
    SAY @6092 /* Are you one of the mercenaries Balthazar has hired? We already have enough of you here. */
    ++ @6093 /* No, we are not. */ + AMMAN01.2
    ++ @6094 /* Yes, and I want to ask you something. */ + AMMAN01.2
  END

  IF ~~ AMMAN01.2
    SAY @6095 /* Well, what do you want then? */
    ++ @6051 /* Do you know where I can find some protection from heat? */ + AMMAN01.3
  END

  IF ~~ AMMAN01.3
    SAY @6096 /* What protection? The summer's is almost over and you still complain about the heat? */
    ++ @6097 /* I need it to enter a boiling pool of water. */ + AMMAN01.4
  END

  IF ~~ AMMAN01.4
    SAY @6098 /* Are you serious about that? */
    = @6099 /* Hmm, there was this mage coming to our village a couple of days ago. I think he has set up his shop in one of the upper buildings over there atop the hillside. */
    = @6100 /* His name was Lazarus Library or something. Maybe he can help you. */
    IF ~~ DO ~SetGlobal("A7Q5RumorWizard", "GLOBAL", 1)~ EXIT
  END
END


// Amkethran man #2
APPEND ~AMMAN02~
  IF WEIGHT #-1 ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1") GlobalLT("A7Q5RumorCleric", "GLOBAL", 2)~ AMMAN02.1
    SAY @6101 /* Please don't hurt me. I don't have anything you need. */
    ++ @6102 /* I want to ask you something. */ + AMMAN02.2
  END

  IF ~~ AMMAN02.2
    SAY @6103 /* You aren't one of those mercenaries then? They come and hurt me when they are in the mood. */
    ++ @6104 /* No, I'm not a mercenary. Do you know where I can find some protection from heat? */ + AMMAN02.3
    ++ @6105 /* What if I would be one of them? */ + AMMAN02.4
  END

  IF ~~ AMMAN02.3
    SAY @6106 /* I always go to our local priest in the Temple of Waukeen if I have a problem. Maybe he can help you too. */
    = @6107 /* Is that all? */
    ++ @6108 /* Yes, that's all I wanted to know. */ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 1)~ EXIT
    + ~Alignment(LastTalkedToBy, MASK_EVIL)~ + @6109 /* Well, you could give me all your money before I decide to hurt you. */ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 1) GiveGoldForce(100) ReputationInc(-1)~ + AMMAN02.4
  END

  IF ~~ AMMAN02.4
    SAY @6110 /* Aah, please don't kill me! */
    IF ~~ DO ~ApplySpellRES("runrun", Myself) RunAwayFrom(LastTalkedToBy,60)~ EXIT
  END
END
