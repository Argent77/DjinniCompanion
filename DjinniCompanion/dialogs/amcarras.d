// *** Dialog portions for Carras the smuggler in the Cave of Amkethran (Quest 5) ***
// Traified

EXTEND_BOTTOM ~AMCARRAS~ 11
  + ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Permission", "GLOBAL", 0) Global("AskedPermission", "LOCALS", 0)~ + @5920 /* I'd like to use the tunnel system below your cave. */ + carras.perm.1
  + ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Permission", "GLOBAL", 0) Global("AskedPermission", "LOCALS", 1)~ + @5921 /* I wish to speak to you about the tunnel system again. */ + carras.perm.3.1
  + ~Global("A7Quest5", "GLOBAL", 1) Global("A7Q5Protection", "GLOBAL", 0) !PartyHasItem("A7WAND1")~ + @5922 /* Do you know where I can find some protection from heat? */ + carras.prot.1
END

APPEND ~AMCARRAS~
  IF ~~ carras.perm.1
    SAY @5923 /* This is a very unusual request. Maybe you should discuss it with our leader Esamon. He isn't here at the moment but if you stay for a couple of days... */
    + ~OR(2) CheckStatGT(LastTalkedToBy,14,INT) Global("SaemonPlot","GLOBAL",1)~ + #66923 /* ~Esamon?  You mean Saemon Havarian, don't you?~ */ + carras.perm.2
    ++ @5924 /* I cannot wait that long. Is there nothing you can do? */ + carras.perm.3
  END

  IF ~~ carras.perm.2
    SAY @5925 /* Our leader goes by many names, but I assure you I do not know his current whereabouts. If you are willing to wait a few days, however, he is bound to come back sooner or later. */
    ++ @5924 /* I cannot wait that long. Is there nothing you can do? */ + carras.perm.3
  END

  IF ~~ carras.perm.3
    SAY @5926 /* I don't know...  I cannot decide something like this over Esamon's head without giving him a good explanation, you understand? */
    + ~PartyGoldGT(999) CheckStatLT(LastTalkedToBy, 16, CHR)~ + @5927 /* Would you change your mind for 1000 gold? */ + carras.perm.4
    + ~PartyGoldGT(999) CheckStatGT(LastTalkedToBy, 15, CHR)~ + @5927 /* Would you change your mind for 1000 gold? */ DO ~TakePartyGold(1000)~ + carras.perm.5
    + ~PartyGoldGT(1999)~ + @5928 /* Are 2000 gold a good enough reason for you? */ DO ~TakePartyGold(2000)~ + carras.perm.5
    + ~PartyGoldGT(3999)~ + @5929 /* I'm willing to offer 4000 gold! No questions asked. */ DO ~TakePartyGold(4000)~ + carras.perm.5
    + ~Alignment(LastTalkedToBy, MASK_EVIL)~ + @5930 /* Don't play your games with me or I'll throw you into the pool myself! */ + carras.perm.6
    ++ @5931 /* I can think of no good reason at the moment. */ DO ~SetGlobal("AskedPermission", "LOCALS", 1)~ + 14
  END

  IF ~~ carras.perm.3.1
    SAY @5932 /* Well, do you have found a good reason to convince me yet? */
    + ~PartyGoldGT(999) CheckStatLT(LastTalkedToBy, 16, CHR)~ + @5927 /* Would you change your mind for 1000 gold? */ + carras.perm.4
    + ~PartyGoldGT(999) CheckStatGT(LastTalkedToBy, 15, CHR)~ + @5927 /* Would you change your mind for 1000 gold? */ DO ~TakePartyGold(1000)~ + carras.perm.5
    + ~PartyGoldGT(1999)~ + @5928 /* Are 2000 gold a good enough reason for you? */ DO ~TakePartyGold(2000)~ + carras.perm.5
    + ~PartyGoldGT(3999)~ + @5929 /* I'm willing to offer 4000 gold! No questions asked. */ DO ~TakePartyGold(4000)~ + carras.perm.5
    ++ @5931 /* I can think of no good reason at the moment. */ DO ~SetGlobal("AskedPermission", "LOCALS", 1)~ + 14
  END

  IF ~~ carras.perm.4
    SAY @5933 /* I doubt this will impress him much. Don't you have a better reason for me? */
    + ~PartyGoldGT(1999)~ + @5928 /* Are 2000 gold a good enough reason for you? */ DO ~TakePartyGold(2000)~ + carras.perm.5
    + ~PartyGoldGT(3999)~ + @5929 /* I'm willing to offer 4000 gold! No questions asked. */ DO ~TakePartyGold(4000)~ + carras.perm.5
    ++ @5934 /* I can think of no reason at the moment. */ DO ~SetGlobal("AskedPermission", "LOCALS", 1)~ + 14
  END

  IF ~~ carras.perm.5
    SAY @5935 /* Yes, this is good enough! You have convinced me of your sincerity. */
    IF ~~ DO ~SetGlobal("A7Q5Permission", "GLOBAL", 1)~ + carras.perm.7
  END

  IF ~~ carras.perm.6
    SAY @5936 /* WHAT?! You wouldn't do that to a harmless... merchant, would you? */
    = @5937 /* Ahem, under these circumstances I will make an exception. */
    IF ~~ DO ~SetGlobal("A7Q5Permission", "GLOBAL", 1)~ + carras.perm.7
  END

  IF ~~ carras.perm.7
    SAY @5938 /* You may use the pool, but I have to warn you. There are lots of deep and very long tunnels, and many of them are dead ends. */
    = @5939 /* You will also need some kind of protection from the heat, but this is up to you. */
    ++ @5940 /* Do you know where I can get some protection? */ + carras.perm.8
    + ~OR(2) Global("A7Q5Protection", "GLOBAL", 1) PartyHasItem("A7WAND1")~ + @5941 /* I've taken care of it already. */ + 14
    ++ @5942 /* Thank you. I'll be going now. */ + 14
  END

  IF ~~ carras.perm.8
    SAY @5943 /* Ask a mage or something about it. I'm only a simple trader. */
    = @5944 /* Our business is concluded. If fortunes permit, perhaps we shall meet again. */
    IF ~~ EXIT
  END

  IF ~~ carras.prot.1
    SAY @5945 /* Sorry, I cannot help you there. Maybe one of the mages in this village know more about this. */
    IF ~~ EXIT
  END
END
