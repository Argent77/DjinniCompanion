// *** Dialog portions for the priests in Saradush and Amkethran to purify the demilich skull ***

// Sister Farielle in Saradush
EXTEND_TOP SARTEM01 0 3 #1
  + ~PartyHasItemIdentified("a7skull") Global("A7SkullPurify", "GLOBAL", 0)~ + @6200 /* I have an odd request. I carry with me a cursed skull of a demilich. Is it possible to purify it? */ + A7SarPriest.1
  + ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
     !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
     PartyHasItemIdentified("a7skull") GlobalGT("A7SkullPurify", "GLOBAL", 0)~ + @6201 /* Can you purify this cursed skull of a demilich? */ + A7SarPriest.2
  + ~OR(6) HasItemEquiped("a7skull", Player1) HasItemEquiped("a7skull", Player2) HasItemEquiped("a7skull", Player3)
           HasItemEquiped("a7skull", Player4) HasItemEquiped("a7skull", Player5) HasItemEquiped("a7skull", Player6)
     PartyHasItemIdentified("a7skull") GlobalGT("A7SkullPurify", "GLOBAL", 0)~ + @6201 /* Can you purify this cursed skull of a demilich? */ + A7SarPriest.3
END

APPEND SARTEM01
  IF ~~ A7SarPriest.1
    SAY @6202 /* I felt its evil even before you entered the temple. */
    IF ~OR(6) HasItemEquiped("a7skull", Player1) HasItemEquiped("a7skull", Player2) HasItemEquiped("a7skull", Player3)
              HasItemEquiped("a7skull", Player4) HasItemEquiped("a7skull", Player5) HasItemEquiped("a7skull", Player6)~ + A7SarPriest.3
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GOOD) ReputationGT(LastTalkedToBy, 15)~ DO ~SetGlobal("A7SkullPurify", "GLOBAL", 1)~ + A7SarPriest.4a
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GENEUTRAL) ReputationGT(LastTalkedToBy, 18)~ DO ~SetGlobal("A7SkullPurify", "GLOBAL", 1)~ + A7SarPriest.4b
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GOOD) ReputationLT(LastTalkedToBy, 16)~ + A7SarPriest.5
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GENEUTRAL) ReputationLT(LastTalkedToBy, 19)~ + A7SarPriest.5
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_EVIL)~ + A7SarPriest.5
  END

  IF ~~ A7SarPriest.2
    SAY @6203 /* Yes, I can do it. Do you have the 5000 gold and a vial of Elven Holy Water? */
    + ~PartyGoldGT(4999) PartyHasItem("miscau")~ + @6204 /* Yes, please do it. Here is the money and a vial of holy water. */ + A7SarPriest.9
    + ~PartyGoldLT(5000) !PartyHasItem("miscau")~ + @6205 /* I don't have anything you need with me right now. Maybe another time. */ + 3
    + ~PartyGoldLT(5000) PartyHasItem("miscau")~ + @6206 /* Unfortunately I don't have enough money for the ritual. Maybe another time. */ + 3
    + ~PartyGoldGT(4999) !PartyHasItem("miscau")~ + @6207 /* I don't have any Elven Holy Water in my possession. Maybe another time. */ + 3
    ++ @6208 /* I have changed my mind. I don't want to do it now. */ + 3
  END

  IF ~~ A7SarPriest.3
    SAY @6209 /* I see that you have already chained yourself to its necromantic powers. There is nothing I can do for you in this state. */
    = @6210 /* If you want to break the link to the artifact, you can make use of my services which includes removing curses. */
    IF ~~ + 3
  END

  IF ~~ A7SarPriest.4a
    SAY @6211 /* Normally I would suggest you to get rid of such evil artifacts immediately. I can see that you are seasoned adventurers following the path of Good however, so I will make an exception. */
    IF ~~ + A7SarPriest.4c
  END

  IF ~~ A7SarPriest.4b
    SAY @6226 /* Normally I would suggest you to get rid of such evil artifacts immediately. I can see that you are seasoned adventurers following the path of righteousness however, so I will make an exception. */
    IF ~~ + A7SarPriest.4c
  END

  IF ~~ A7SarPriest.4c
    SAY @6212 /* To neutralize an evil of this scale I need a vial of potent Elven Holy Water. The ritual itself is very draining, so I have to ask for a modest fee of 5000 gold as well. Are you still interested? */
    + ~PartyGoldGT(4999) PartyHasItem("miscau")~ + @6204 /* Yes, please do it. Here is the money and a vial of holy water. */ + A7SarPriest.9
    + ~PartyGoldLT(5000) !PartyHasItem("miscau")~ + @6205 /* I don't have anything you need with me right now. Maybe another time. */ + 3
    + ~PartyGoldLT(5000) PartyHasItem("miscau")~ + @6206 /* Unfortunately I don't have enough money for the ritual. Maybe another time. */ + 3
    + ~PartyGoldGT(4999) !PartyHasItem("miscau")~ + @6207 /* I don't have any Elven Holy Water in my possession. Maybe another time. */ + 3
    ++ @6208 /* I have changed my mind. I don't want to do it now. */ + 3
  END

  IF ~~ A7SarPriest.5
    SAY @6213 /* Powerful artifacts such as this can do much damage if you succumbed to its evil. I cannot and will not, in good conscience, do what you want from me. */
    IF ~!Alignment(LastTalkedToBy, MASK_EVIL)~ + A7SarPriest.6
    IF ~Alignment(LastTalkedToBy, MASK_EVIL)~ + A7SarPriest.7
  END

  IF ~~ A7SarPriest.6
    SAY @6214 /* If you can prove to me your good intentions I might change my mind however. */
    IF ~~ + A7SarPriest.7
  END

  IF ~~ A7SarPriest.7
    SAY @6215 /* As a priest I can offer you to destroy this evil artifact instead. Do you want to leave it in my care? I promise you to take care of it and make your selfless act known to the people. */
    ++ @6216 /* Sure. Take it. */ + A7SarPriest.8
    ++ @6217 /* No, I'm not interested. */ + 3
  END

  IF ~~ A7SarPriest.8
    SAY @6218 /* That is a wise decision. I will destroy its evil immediately. */
    IF ~~ DO ~TakePartyItemNum("a7skull", 1) DestroyItem("a7skull") ReputationInc(1)~ + 3
  END

  IF ~~ A7SarPriest.9
    SAY @6219 /* Then let us begin. */
    IF ~~ DO ~TakePartyGold(5000) TakePartyItemNum("a7skull", 1) DestroyItem("a7skull") TakePartyItemNum("miscau", 1) DestroyItem("miscau") DestroyGold(5000)~ + A7SarPriest.10
  END

  IF ~~ A7SarPriest.10
    SAY @6220 /* (Sister Farielle takes the skull as well as the money and the vial of holy water and starts making preparations for the ritual.) */
    = @6221 /* (The skull is placed onto the altar and after an initial prayer she pours holy water over it, repeatedly interrupted by more prayers.) */
    = @6222 /* (After a long time that felt like an eternity you see a sudden flash of bright light that blinds your eyes and hear a faint scream coming from the skull. When you can see again, you have the impression that the skull has lost some of its dark glow.) */
    IF ~~ DO ~GiveItemCreate("a7skull2", LastTalkedToBy, 0, 0, 0)~ + A7SarPriest.11
  END

  IF ~~ A7SarPriest.11
    SAY @6223 /* It is done. The evil has been sealed away. It should be safe now to make use of its remaining powers. */
    IF ~~ + 3
  END
END


// Brother Chyil in Amkethran
EXTEND_BOTTOM AMCLER02 0 3 6 10 #1
  + ~PartyHasItemIdentified("a7skull") Global("A7SkullPurify", "GLOBAL", 0)~ + @6200 /* I have an odd request. I carry with me a cursed skull of a demilich. Is it possible to purify it? */ + A7AmPriest.1
  + ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
     !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
     PartyHasItemIdentified("a7skull") GlobalGT("A7SkullPurify", "GLOBAL", 0)~ + @6201 /* Can you purify this cursed skull of a demilich? */ + A7AmPriest.2
  + ~OR(6) HasItemEquiped("a7skull", Player1) HasItemEquiped("a7skull", Player2) HasItemEquiped("a7skull", Player3)
           HasItemEquiped("a7skull", Player4) HasItemEquiped("a7skull", Player5) HasItemEquiped("a7skull", Player6)
     PartyHasItemIdentified("a7skull") GlobalGT("A7SkullPurify", "GLOBAL", 0)~ + @6201 /* Can you purify this cursed skull of a demilich? */ + A7AmPriest.3
END

APPEND AMCLER02
  IF ~~ A7AmPriest.1
    SAY @6202 /* I felt its evil even before you entered the temple. */
    IF ~OR(6) HasItemEquiped("a7skull", Player1) HasItemEquiped("a7skull", Player2) HasItemEquiped("a7skull", Player3)
              HasItemEquiped("a7skull", Player4) HasItemEquiped("a7skull", Player5) HasItemEquiped("a7skull", Player6)~ + A7AmPriest.3
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GOOD) ReputationGT(LastTalkedToBy, 15)~ DO ~SetGlobal("A7SkullPurify", "GLOBAL", 1)~ + A7AmPriest.4a
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GENEUTRAL) ReputationGT(LastTalkedToBy, 18)~ DO ~SetGlobal("A7SkullPurify", "GLOBAL", 1)~ + A7AmPriest.4b
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GOOD) ReputationLT(LastTalkedToBy, 16)~ + A7AmPriest.5
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_GENEUTRAL) ReputationLT(LastTalkedToBy, 19)~ + A7AmPriest.5
    IF ~!HasItemEquiped("a7skull", Player1) !HasItemEquiped("a7skull", Player2) !HasItemEquiped("a7skull", Player3)
        !HasItemEquiped("a7skull", Player4) !HasItemEquiped("a7skull", Player5) !HasItemEquiped("a7skull", Player6)
        Alignment(LastTalkedToBy, MASK_EVIL)~ + A7AmPriest.5
  END

  IF ~~ A7AmPriest.2
    SAY @6203 /* Yes, I can do it. Do you have the 5000 gold and a vial of Elven Holy Water? */
    + ~PartyGoldGT(4999) PartyHasItem("miscau")~ + @6204 /* Yes, please do it. Here is the money and a vial of holy water. */ + A7AmPriest.9
    + ~PartyGoldLT(5000) !PartyHasItem("miscau")~ + @6205 /* I don't have anything you need with me right now. Maybe another time. */ EXIT
    + ~PartyGoldLT(5000) PartyHasItem("miscau")~ + @6206 /* Unfortunately I don't have enough money for the ritual. Maybe another time. */ EXIT
    + ~PartyGoldGT(4999) !PartyHasItem("miscau")~ + @6207 /* I don't have any Elven Holy Water in my possession. Maybe another time. */ EXIT
    ++ @6208 /* I have changed my mind. I don't want to do it now. */ EXIT
  END

  IF ~~ A7AmPriest.3
    SAY @6209 /* I see that you have already chained yourself to its necromantic powers. There is nothing I can do for you in this state. */
    = @6210 /* If you want to break the link to the artifact, you can make use of my services, however. */
    IF ~~ EXIT
  END

  IF ~~ A7AmPriest.4a
    SAY @6211 /* Normally I would suggest you to get rid of such evil artifacts immediately. I can see that you are seasoned adventurers following the path of Good however, so I will make an exception. */
    IF ~~ + A7AmPriest.4c
  END

  IF ~~ A7AmPriest.4b
    SAY @6226 /* Normally I would suggest you to get rid of such evil artifacts immediately. I can see that you are seasoned adventurers following the path of Righteousness however, so I will make an exception. */
    IF ~~ + A7AmPriest.4c
  END

  IF ~~ A7AmPriest.4c
    SAY @6212 /* To neutralize an evil of this scale I need a vial of potent Elven Holy Water. The ritual itself is very draining, so I have to ask for a modest fee of 5000 gold as well. Are you still interested? */
    + ~PartyGoldGT(4999) PartyHasItem("miscau")~ + @6204 /* Yes, please do it. Here is the money and a vial of holy water. */ + A7AmPriest.9
    + ~PartyGoldLT(5000) !PartyHasItem("miscau")~ + @6205 /* I don't have anything you need with me right now. Maybe another time. */ EXIT
    + ~PartyGoldLT(5000) PartyHasItem("miscau")~ + @6206 /* Unfortunately I don't have enough money for the ritual. Maybe another time. */ EXIT
    + ~PartyGoldGT(4999) !PartyHasItem("miscau")~ + @6207 /* I don't have any Elven Holy Water in my possession. Maybe another time. */ EXIT
    ++ @6208 /* I have changed my mind. I don't want to do it now. */ EXIT
  END

  IF ~~ A7AmPriest.5
    SAY @6213 /* Powerful artifacts such as this can do much damage if you succumbed to its evil. I cannot and will not, in good conscience, do what you want from me. */
    IF ~!Alignment(LastTalkedToBy, MASK_EVIL)~ + A7AmPriest.6
    IF ~Alignment(LastTalkedToBy, MASK_EVIL)~ + A7AmPriest.7
  END

  IF ~~ A7AmPriest.6
    SAY @6214 /* If you can prove to me your good intentions I might change my mind however. */
    IF ~~ + A7AmPriest.7
  END

  IF ~~ A7AmPriest.7
    SAY @6215 /* As a priest I can offer you to destroy this evil artifact instead. Do you want to leave it in my care? I promise you to take care of it and make your selfless act known to the people. */
    ++ @6216 /* Sure. Take it. */ + A7AmPriest.8
    ++ @6217 /* No, I'm not interested. */ EXIT
  END

  IF ~~ A7AmPriest.8
    SAY @6218 /* That is a wise decision. I will destroy its evil immediately. */
    IF ~~ DO ~TakePartyItemNum("a7skull", 1) DestroyItem("a7skull") ReputationInc(1)~ EXIT
  END

  IF ~~ A7AmPriest.9
    SAY @6219 /* Then let us begin. */
    IF ~~ DO ~TakePartyGold(5000) TakePartyItemNum("a7skull", 1) DestroyItem("a7skull") TakePartyItemNum("miscau", 1) DestroyItem("miscau") DestroyGold(5000)~ + A7AmPriest.10
  END

  IF ~~ A7AmPriest.10
    SAY @6224 /* (The priest takes the skull as well as the money and the vial of holy water and starts making preparations for the ritual.) */
    = @6225 /* (The skull is placed onto the altar and after an initial prayer he pours the holy water over it, repeatedly interrupted by more prayers.) */
    = @6222 /* (After a long time that felt like an eternity you see a sudden flash of bright light that blinds your eyes and hear a faint scream coming from the skull. When you can see again, you have the impression that the skull has lost some of its dark glow.) */
    IF ~~ DO ~GiveItemCreate("a7skull2", LastTalkedToBy, 0, 0, 0)~ + A7AmPriest.11
  END

    IF ~~ A7AmPriest.11
    SAY @6223 /* It is done. The evil has been sealed away. It should be safe now to make use of its remaining powers. */
    IF ~~ EXIT
  END
END
