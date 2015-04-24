// *** Banters with CHARNAME ***
// Traified

APPEND A7AFAAQ
  // *** Conversations which take precedence over the regular banters ***

  // After heritage #1: Afaaq asks about the reason for CHARNAME's hunt for Irenicus
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCIrenicusHunt", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCSpecific.ReasonForHunt.1
    SAY @12000 /* It appears you are very single-minded about following the trail of this Irenicus. Do you mind telling me why you are doing it? */
    ++ @12001 /* Irenicus took a very close friend of mine with him, and I intend to get her back to my side. */ + PCSpecific.ReasonForHunt.4
    ++ @12002 /* Both Irenicus and my childhood friend Imoen have been abducted by the Cowled Mages and I won't leave them to their fates. */ + PCSpecific.ReasonForHunt.4
    ++ @12003 /* This is a personal matter and I don't want to talk about it. */ + PCSpecific.ReasonForHunt.2
  END

  IF ~~ PCSpecific.ReasonForHunt.2
    SAY @12004 /* I respect your decision, but I am now part of your life too. Will you not reconsider? */
    ++ @12005 /* If you insist. Irenicus took a very close friend of mine with him, and I intend to get her back to my side. */ + PCSpecific.ReasonForHunt.4
    ++ @12006 /* Very well. Both Irenicus and my childhood friend Imoen have been abducted by the Cowled Mages and I won't leave them to their fates. */ + PCSpecific.ReasonForHunt.4
    ++ @12007 /* No, this is something I have to solve by myself. */ + PCSpecific.ReasonForHunt.3
  END

  IF ~~ PCSpecific.ReasonForHunt.3
    SAY @12008 /* As you wish. */
    IF ~~ DO ~SetGlobal("BanterPCIrenicusHunt", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCSpecific.ReasonForHunt.4
    SAY @12009 /* So you want to make sure that your friend does not come to harm? */
    ++ @12010 /* Well, I don't really care that much for her. I merely want to make sure that Irenicus doesn't get a second chance to hurt us again. */ + PCSpecific.ReasonForHunt.5
    ++ @12011 /* You are right. I'm sure she would do the same if I were in a bind. */ + PCSpecific.ReasonForHunt.6
  END

  IF ~~ PCSpecific.ReasonForHunt.5
    SAY @12012 /* I see. Good luck on your quest, though. I hope you find both of them quickly. */
    IF ~~ DO ~SetGlobal("BanterPCIrenicusHunt", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCSpecific.ReasonForHunt.6
    SAY @12013 /* I wish you success in your quest, my <PRO_LADYLORD>. A bond of friendship, as the one you two obviously share, is a great boon to have. */
    = @12014 /* We do share bonds of trust and friendship with our siblings as well. But it is expressed in a different way than you mortals would imagine. */
    IF ~~ DO ~SetGlobal("BanterPCIrenicusHunt", "LOCALS", 2)~ EXIT
  END


  // Introduction to Imoen
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7BanterIntroImoen", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1)~ PCSpecific.ImoenIntro
    SAY @12015 /* <CHARNAME>, you are finally reunited with your childhood friend Imoen. */
    IF ~~ DO ~SetGlobal("A7BanterIntroImoen", "GLOBAL", 2)~ + PCSpecific.ImoenIntro.1
  END

  IF ~~ PCSpecific.ImoenIntro.1
    SAY @12016 /* Do you care to introduce her to me? */
    + ~Global("InToB", "GLOBAL", 0)~ + @12017 /* Sure, why not? This is my little sister and good friend Imoen. She went through a terrible ordeal and I am glad that she is at my side again. */ EXTERN IMOEN2J PCSpecific.ImoenIntro.2
    + ~Global("InToB", "GLOBAL", 1)~ + @12017 /* Sure, why not? This is my little sister and good friend Imoen. She went through a terrible ordeal and I am glad that she is at my side again. */ EXTERN IMOEN25J PCSpecific.ImoenIntro25.2
    ++ @12018 /* I don't have the time for this, at the moment. */ + PCSpecific.ImoenIntro.Rejected
  END
END

CHAIN IMOEN2J PCSpecific.ImoenIntro.2
  @12019 /* Little sister is good. I'd rather see *you* as my little <PRO_BROTHERSISTER>, <CHARNAME>. */
  = @12020 /* And you are our new travelling companion, Afaaq? You look like a cheerful fellow. */
  == A7AFAAQ @12021 /* I am honored to make your acquaintance, Imoen. */
  == IMOEN2J @12022 /* You betcha! I'm sure we'll get on like a house on fire, hehe. */
EXTERN A7AFAAQ PCSpecific.ImoenIntro.3

CHAIN IMOEN25J PCSpecific.ImoenIntro25.2
  @12019 /* Little sister is good. I'd rather see *you* as my little <PRO_BROTHERSISTER>, <CHARNAME>. */
  = @12020 /* And you are our new travelling companion, Afaaq? You look like a cheerful fellow. */
  == A7AFAAQ @12021 /* I am honored to make your acquaintance, Imoen. */
  == IMOEN25J @12022 /* You betcha! I'm sure we'll get on like a house on fire, hehe. */
EXTERN A7AFAAQ PCSpecific.ImoenIntro.3

APPEND A7AFAAQ
  IF ~~ PCSpecific.ImoenIntro.3
    SAY @12023 /* Ah, I am looking forward to your company, too. */
    IF ~~ EXIT
  END

  IF ~~ PCSpecific.ImoenIntro.Rejected
    SAY @12024 /* That is a pity. I am sure Imoen is curious about the new companion at her side. */
    IF ~True()~ EXIT
    IF ~Global("InToB", "GLOBAL", 0) Detect("Imoen2")~ EXTERN IMOEN2J PCSpecific.ImoenIntro.Rejected.1
    IF ~Global("InToB", "GLOBAL", 1) Detect("Imoen2")~ EXTERN IMOEN25J PCSpecific.ImoenIntro.Rejected.2
  END
END

APPEND IMOEN2J
  IF ~~ PCSpecific.ImoenIntro.Rejected.1
    SAY @12025 /* You betcha!  Be prepared for a barrage of questions, Afaaq. */
    IF ~~ EXIT
  END
END

APPEND IMOEN25J
  IF ~~ PCSpecific.ImoenIntro.Rejected.2
    SAY @12025 /* You betcha!  Be prepared for a barrage of questions, Afaaq. */
    IF ~~ EXIT
  END
END


APPEND A7AFAAQ
  // After defeating Firkraag: Talking about dragons and Afaaq's past experience with dragons
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCDragons", "LOCALS", 1) Dead("firkra02") Global("BanterActive", "LOCALS", 1)~ PCSpecific.Dragons.1
    SAY @12026 /* Your victory over Firkraag reminds me of my part in the great battle against the dragons of the Marching Mountains. */
    ++ @12027 /* You have battled against dragons? */ + PCSpecific.Dragons.2
    ++ @12028 /* I don't really have time to listen to one of your long-winded stories again. */ + PCSpecific.Dragons.3
  END

  IF ~~ PCSpecific.Dragons.2
    SAY @12029 /* Yes, I did long ago. At that time, dragons were much more numerous than today, and in the Marching Mountains this was doubly so. */
    = @12030 /* I still remember the sheer size of the armies. Our side consisted mostly of djinn, genasi and some of the mortal races, while the dragons mobilized hordes of wyverns, drakes and dragons of all kinds. */
    = @12031 /* Although both sides were very well prepared, the number of casualties was unbelievably high. It didn't really matter to us, as we were merely thrown back to our home plane, but the mortal races suffered considerable losses as well. */
    = @12032 /* Fortunately those times are long since past, and today the surviving dragons live quite reclusively, hidden from most other life forms. */
    IF ~~ DO ~SetGlobal("BanterPCDragons", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCSpecific.Dragons.3
    SAY @12033 /* As you wish. Nevertheless, I am impressed with your skills in vanquishing a dragon. Even a dreaded red one at that. */
    IF ~~ DO ~SetGlobal("BanterPCDragons", "LOCALS", 2)~ EXIT
  END


  // Afaaq rejoined CHARNAME after Quest 5
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCRejoined", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCSpecific.Rejoined.1
    SAY @12034 /* So, <CHARNAME>. I see that you have become a lot stronger in the short time of my absence. What have you accomplished since your victory over Irenicus? */
    ++ @12035 /* I had to fight for my life all the time, as one Bhaalspawn after another wanted me dead. What have you done in that time? */ + PCSpecific.Rejoined.2
    + ~!Dead("demogor2")~ + @12036 /* Oh, the usual. Cleaning out abandoned temples, defeating Bhaalspawns and the like. And you? */ + PCSpecific.Rejoined.2
    + ~Dead("demogor2")~ + @12037 /* Oh, the usual. Cleaning out abandoned temples, defeating Bhaalspawns and demon princes. And you? */ + PCSpecific.Rejoined.2
    ++ @12038 /* I was busy hunting down other Bhaalspawns. What about you? */ + PCSpecific.Rejoined.2
    ++ @12039 /* I'd rather not talk about it. What did you do after you left my presence? */ + PCSpecific.Rejoined.2
  END

  IF ~~ PCSpecific.Rejoined.2
    SAY @12040 /* I had thought long and hard what I wanted to do with my newfound freedom. I had even considered returning into service of my old employer Caliph Hasib. */
    = @12041 /* But then it occurred to me that there are more poor souls waiting to be released from imprisonment and I began searching for them. I had followed dozens of vague hints and leads when I bumped into a former colleague of mine, Sharif Karim. */
    = @12042 /* I decided to help him out, as he was in dire need of help at that moment. Shortly after you came around and saved the day, as usual. I am truly grateful for that. */
    ++ @12043 /* And now you have joined my adventures again. Are you sure that is what you really want? */ + PCSpecific.Rejoined.3
    ++ @12044 /* And that event has led to our reunion. Why have you decided to follow me again? */ + PCSpecific.Rejoined.3
  END

  IF ~~ PCSpecific.Rejoined.3
    SAY @12045 /* I have come to the conclusion that I can achieve much more by helping you out. */
    = @12046 /* You have dealt with the efreet army in an impressive way. By helping you in your quest, I have the opportunity to return a small measure of the gratitude Sharif Karim has expressed. */
    IF ~~ DO ~SetGlobal("BanterPCRejoined", "LOCALS", 2)~ EXIT
  END
END
