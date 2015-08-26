// *** Dialog file for the djinni Afaaq (generic stuff) ***
// Traified

// used for normal and enslaved djinni, for djinni lamp
APPEND %afq_dialog%

  // *** Clone of CHARNAME talks to Afaaq inside the djinni lamp ***
  IF ~Name("A7Q6COPY", LastTalkedToBy) Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqMet", "GLOBAL", 1) AreaCheck("A77006") Global("BanterActive", "LOCALS", 0)~ TalkGeneric.InsideLamp
    SAY @10000 /* Yes, my <PRO_LADYLORD>? Do you want something from me? */
    + ~!ActuallyInCombat() HasItem("A7DJLMPA", Player1)~ + @10001 /* Please return me from whence I came. */ + TalkGeneric.Invitation.Return
    ++ @10002 /* I will talk to you later. */ + TalkGeneric.Bye
  END


  // *** Someone other than CHARNAME talks to Afaaq ***
  IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqMet", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkGeneric.NPC
    SAY @10003 /* I am sorry, <GABBER>. But I will only answer to <CHARNAME>. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END


  // *** Starting a conversation with the djinni lamp ***
  IF ~Global("A7AfaaqSummoned", "GLOBAL", 0) Global("A7AfaaqMet", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkGeneric.Lamp
    SAY @10004 /* You hold the lamp in your hands. A few moments later it starts to emit a faint pulsating light and the djinni turns his attention to you. */
    IF ~!InPartySlot(LastTalkedToBy, 0)~ + TalkGeneric.Lamp.NPC.1
    IF ~InPartySlot(LastTalkedToBy, 0) !AreaType(CITY)~ + TalkGeneric.Lamp.PC.1
    IF ~InPartySlot(LastTalkedToBy, 0) AreaType(CITY)~ DO ~IncrementGlobal("A7TalkedToLamp", "MYAREA", 1)~ + TalkGeneric.Lamp.PC.1
  END

  IF ~~ TalkGeneric.Lamp.NPC.1
    SAY @10005 /* When he realizes that you are not <CHARNAME>, he retreats back into the lamp and a short while later the glow disappears. */
    IF ~~ EXIT
  END

  IF ~~ TalkGeneric.Lamp.PC.1
    SAY @10006 /* Greetings, my <PRO_LADYLORD>. May I help you with something? */
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0)~ + @10007 /* How are you doing, everything okay in there? */ + TalkGeneric.HowAreYou.1

    // Granting a (limited) wish
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.Wish.Deny
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.LimitedWish.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 17, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(4, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy,18,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(3, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 9, WIS) CheckStatLT(LastTalkedToBy,15,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(2, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatLT(LastTalkedToBy, 10, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(1, 1)~ + TalkGeneric.Wish.Select.1

    // Djinni comes out of his lamp
    + ~!GlobalTimerNotExpired("A7AfaaqDeathTimer", "GLOBAL") OR(2) AreaCheck("AR3004") AreaCheck("AR3008")~ + @10009 /* Would you please come out of your lamp? */ + TalkGeneric.Summon.3
    + ~!GlobalTimerNotExpired("A7AfaaqDeathTimer", "GLOBAL") !AreaCheck("AR3004") !AreaCheck("AR3008")~ + @10009 /* Would you please come out of your lamp? */ + TalkGeneric.Summon.1
    + ~GlobalTimerNotExpired("A7AfaaqDeathTimer", "GLOBAL")~ + @10009 /* Would you please come out of your lamp? */ + TalkGeneric.Summon.2

    // Conversation topics
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 0)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe.FirstTime
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10011 /* Do you have any advice for me? */ + TalkGeneric.Advice.1

    // Fixes Afaaq's state in case of buggy behavior
    ++ @10028 /* You are behaving oddly. Care to fix it? */ + TalkGeneric.FixStates.1a

    ++ @10012 /* I just want to make sure you are still in there. Goodbye. */ + TalkGeneric.Lamp.Bye
  END

  IF ~~ TalkGeneric.Lamp.PC.2
    SAY @10013 /* May I help you with something else? */
    // Granting a (limited) wish
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.Wish.Deny
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.LimitedWish.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 17, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(4, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy,18,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(3, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 9, WIS) CheckStatLT(LastTalkedToBy,15,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(2, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatLT(LastTalkedToBy, 10, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(1, 1)~ + TalkGeneric.Wish.Select.1

    // Djinni comes out of his lamp
    + ~!GlobalTimerNotExpired("A7AfaaqDeathTimer", "GLOBAL") OR(2) AreaCheck("AR3004") AreaCheck("AR3008")~ + @10009 /* Would you please come out of your lamp? */ + TalkGeneric.Summon.3
    + ~!GlobalTimerNotExpired("A7AfaaqDeathTimer", "GLOBAL") !AreaCheck("AR3004") !AreaCheck("AR3008")~ + @10009 /* Would you please come out of your lamp? */ + TalkGeneric.Summon.1
    + ~GlobalTimerNotExpired("A7AfaaqDeathTimer", "GLOBAL")~ + @10009 /* Would you please come out of your lamp? */ + TalkGeneric.Summon.2

    // Conversation topics
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 0)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe.FirstTime
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe
    + ~Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10011 /* Do you have an advice for me? */ + TalkGeneric.Advice.1

    // Fixes Afaaq's state in case of buggy behavior
    ++ @10028 /* You are behaving oddly. Care to fix it? */ + TalkGeneric.FixStates.1a

    ++ @10014 /* That's all for now. Goodbye. */ + TalkGeneric.Lamp.Bye
  END


  // *** Standard dialog when CHARNAME talks to Afaaq ***
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqMet", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkGeneric.PC
    SAY @10000 /* Yes, my <PRO_LADYLORD>? Do you want something from me? */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("AfaaqLight", "LOCALS", 0) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqLeaveParty", "GLOBAL", 0) Global("HowDoYouFeel", "LOCALS", 0)~ + @10015 /* How do you feel with your body whole again? */ + TalkGeneric.HowAreYouUpgraded.1
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("AfaaqLight", "LOCALS", 0) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqLeaveParty", "GLOBAL", 1) Global("HowDoYouFeel", "LOCALS", 0)~ + @10015 /* How do you feel with your body whole again? */ + TalkGeneric.HowAreYouUpgraded.2

    // Offer medical help to the djinni
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) StateCheck(Myself, STATE_POISONED) OR(2) HasItem("POTN20", Player1) HasItem("POTN17", Player1)~ + @10016 /* You are poisoned. Do you need a cure? */ + TalkGeneric.CuringAsked
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) StateCheck(Myself, STATE_DISEASED) HasItem("POTN17", Player1)~ + @10017 /* You are diseased. Do you need a cure? */ + TalkGeneric.CuringAsked
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) OR(3) HasItem("POTN08", Player1) HasItem("POTN52", Player1) HasItem("POTN55", Player1) HPPercentLT(Myself, 100)~ + @10018 /* You are hurt. Do you need a healing potion? */ + TalkGeneric.HealingAsked
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) OR(3) HasItem("POTN08", Player1) HasItem("POTN52", Player1) HasItem("POTN55", Player1)~ + @10019 /* Would you like to have healing potions for emergency situations? */ + TalkGeneric.StoreHealingPotions

    // Changing combat scripts
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !Global("AfaaqActive", "LOCALS", 2)~ + @10475 /* Please take care of yourself in battle. */ + TalkGeneric.BattleSemiActive
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !Global("AfaaqActive", "LOCALS", 1)~ + @10021 /* Please engage in battle again. */ + TalkGeneric.BattleActive
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !Global("AfaaqActive", "LOCALS", 0)~ + @10020 /* Please don't engage in battle. */ + TalkGeneric.BattlePassive

    // Djinni returns into his lamp
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !PartyHasItem("A7DJLMP") !PartyHasItem("A7DJLMPA") !AreaCheck("A77006")~ + @10022 /* Please return into your lamp. */ + TalkGeneric.UnsummonDenied
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) OR(2) PartyHasItem("A7DJLMP") PartyHasItem("A7DJLMPA") !AreaCheck("A77006")~ + @10022 /* Please return into your lamp. */ + TalkGeneric.Unsummon

    // Granting a (limited) wish
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.Wish.Deny
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.LimitedWish.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 17, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(4, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy,18,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(3, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 9, WIS) CheckStatLT(LastTalkedToBy,15,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(2, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatLT(LastTalkedToBy, 10, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(1, 1)~ + TalkGeneric.Wish.Select.1

    // Storing/retrieving items
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqStore", "GLOBAL", 1)~ + @10023 /* I'd like to access your inventory again. */ + TalkGeneric.Store.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqStore", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10024 /* Afaaq, how do you manage to enter the djinni lamp even though you are carrying big swords and the like? */ + TalkGeneric.Store.2
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqStore", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10024 /* Afaaq, how do you manage to enter the djinni lamp even though you are carrying big swords and the like? */ + TalkGeneric.Store.3

    // Conversation topics
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 0)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe.FirstTime
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10011 /* Do you have an advice for me? */ + TalkGeneric.Advice.1

    // Telling Afaaq's stats
    + ~!ActuallyInCombat() Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10025 /* Can you tell me about your abilities? */ + TalkGeneric.TellStats.1
    + ~!ActuallyInCombat() Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10025 /* Can you tell me about your abilities? */ + TalkGeneric.TellStats.2

    // Inviting CHARNAME into the lamp
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) !AreaCheck("AR4500") !AreaCheck("A77006") Global("GavePocketPlane","GLOBAL",1) Global("A7AfaaqLeaveParty", "GLOBAL", 0) Global("LampInvitation", "LOCALS", 0)~ + @10026 /* I'm curious, Afaaq. What does the interior of your lamp look like? */ + TalkGeneric.Invitation.1
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) !AreaCheck("AR4500") !AreaCheck("A77006") Global("LampInvitation", "LOCALS", 2)~ + @10027 /* I'd like to enter your lamp again. */ + TalkGeneric.Invitation.2
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) AreaCheck("AR4500") Global("LampInvitation", "LOCALS", 2) Global("LampInvitationPP", "LOCALS", 0)~ + @10027 /* I'd like to enter your lamp again. */ + TalkGeneric.Invitation.5
    + ~!ActuallyInCombat() Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) AreaCheck("A77006")~ + @10001 /* Please return me from whence I came. */ + TalkGeneric.Invitation.Return

    // Fixes Afaaq's state in case of buggy behavior
    ++ @10028 /* You are behaving oddly. Care to fix it? */ + TalkGeneric.FixStates.1
    
    ++ @10029 /* I'll talk to you later. */ + TalkGeneric.Bye
    + ~False() Global("A7AfaaqUpgraded", "GLOBAL", 0) HasItem("A7DJLMP", Player1)~ + ~Debug: Upgrade yourself!~ + TalkGeneric.Debug.Upgrade
  END

  IF ~~ TalkGeneric.PC.1
    SAY @10031 /* Do you want something else from me? */
    // Offer medical help to the djinni
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) StateCheck(Myself, STATE_POISONED) OR(2) HasItem("POTN20", Player1) HasItem("POTN17", Player1)~ + @10016 /* You are poisoned. Do you need a cure? */ + TalkGeneric.CuringAsked
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) StateCheck(Myself, STATE_DISEASED) HasItem("POTN17", Player1)~ + @10017 /* You are diseased. Do you need a cure? */ + TalkGeneric.CuringAsked
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) OR(3) HasItem("POTN08", Player1) HasItem("POTN52", Player1) HasItem("POTN55", Player1) HPPercentLT(Myself, 100)~ + @10018 /* You are hurt. Do you need a healing potion? */ + TalkGeneric.HealingAsked
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) OR(3) HasItem("POTN08", Player1) HasItem("POTN52", Player1) HasItem("POTN55", Player1)~ + @10019 /* Would you like to have healing potions for emergency situations? */ + TalkGeneric.StoreHealingPotions

    // Changing combat scripts
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !Global("AfaaqActive", "LOCALS", 2)~ + @10475 /* Please take care of yourself in battle. */ + TalkGeneric.BattleSemiActive
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !Global("AfaaqActive", "LOCALS", 1)~ + @10021 /* Please engage in battle again. */ + TalkGeneric.BattleActive
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !Global("AfaaqActive", "LOCALS", 0)~ + @10020 /* Please don't engage in battle. */ + TalkGeneric.BattlePassive

    // Djinni returns into his lamp
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !PartyHasItem("A7DJLMP") !PartyHasItem("A7DJLMPA") !AreaCheck("A77006")~ + @10022 /* Please return into your lamp. */ + TalkGeneric.UnsummonDenied
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) OR(2) PartyHasItem("A7DJLMP") PartyHasItem("A7DJLMPA") !AreaCheck("A77006")~ + @10022 /* Please return into your lamp. */ + TalkGeneric.Unsummon

    // Granting a (limited) wish
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.Wish.Deny
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ + @10008 /* Can you grant me a wish? */ + TalkGeneric.LimitedWish.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 17, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(4, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy,18,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(3, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatGT(LastTalkedToBy, 9, WIS) CheckStatLT(LastTalkedToBy,15,WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(2, 1)~ + TalkGeneric.Wish.Select.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL") CheckStatLT(LastTalkedToBy, 10, WIS)~ + @10008 /* Can you grant me a wish? */ DO ~SetupWish(1, 1)~ + TalkGeneric.Wish.Select.1

    // Storing/retrieving items
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqStore", "GLOBAL", 1)~ + @10023 /* I'd like to access your inventory again. */ + TalkGeneric.Store.1
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqStore", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10024 /* Afaaq, how do you manage to enter the djinni lamp even though you are carrying big swords and the like? */ + TalkGeneric.Store.2
    + ~Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqStore", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10024 /* Afaaq, how do you manage to enter the djinni lamp even though you are carrying big swords and the like? */ + TalkGeneric.Store.3

    // Conversation topics
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 0)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe.FirstTime
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10010 /* Can you tell me something about yourself? */ + TalkGeneric.AboutMe
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + @10011 /* Do you have an advice for me? */ + TalkGeneric.Advice.1

    // Telling Afaaq's stats
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10025 /* Can you tell me about your abilities? */ + TalkGeneric.TellStats.1
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10025 /* Can you tell me about your abilities? */ + TalkGeneric.TellStats.2

    // Inviting CHARNAME into the lamp
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) !AreaCheck("AR4500") !AreaCheck("A77006") Global("GavePocketPlane","GLOBAL",1) Global("A7AfaaqLeaveParty", "GLOBAL", 0) Global("LampInvitation", "LOCALS", 0)~ + @10026 /* I'm curious, Afaaq. What does the interior of your lamp look like? */ + TalkGeneric.Invitation.1
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) !AreaCheck("AR4500") !AreaCheck("A77006") Global("LampInvitation", "LOCALS", 2)~ + @10027 /* I'd like to enter your lamp again. */ + TalkGeneric.Invitation.2
    + ~!ActuallyInCombat() Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) AreaCheck("AR4500") Global("LampInvitation", "LOCALS", 2) Global("LampInvitationPP", "LOCALS", 0)~ + @10027 /* I'd like to enter your lamp again. */ + TalkGeneric.Invitation.5
    + ~!ActuallyInCombat() Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) Global("A7AfaaqUpgraded", "GLOBAL", 1) HasItem("A7DJLMPA", Player1) AreaCheck("A77006")~ + @10001 /* Please return me from whence I came. */ + TalkGeneric.Invitation.Return
    
   // Fixes Afaaq's state in case of buggy behavior
    ++ @10028 /* You are behaving oddly. Care to fix it? */ + TalkGeneric.FixStates.1
 
    ++ @10002 /* I will talk to you later. */ + TalkGeneric.Bye
    + ~False() Global("A7AfaaqUpgraded", "GLOBAL", 0) HasItem("A7DJLMP", Player1)~ + ~Debug: Upgrade yourself!~ + TalkGeneric.Debug.Upgrade
  END


  // *** How are you? ***
  IF ~~ TalkGeneric.HowAreYou.1
    SAY @10032 /* Thanks for asking, but I am fine. How are you today? */
    ++ @10033 /* I'm feeling great today. */ + TalkGeneric.HowAreYou.2
    ++ @10034 /* I'm well enough. */ + TalkGeneric.HowAreYou.2
    ++ @10035 /* Not so good. */ + TalkGeneric.HowAreYou.3
    ++ @10036 /* I'm feeling miserable. */ + TalkGeneric.HowAreYou.4
  END

  IF ~~ TalkGeneric.HowAreYou.2
    SAY @10037 /* That is good to hear. */
    IF ~~ + TalkGeneric.Lamp.PC.2
  END

  IF ~~ TalkGeneric.HowAreYou.3
    SAY @10038 /* I hope you get better soon. */
    IF ~~ + TalkGeneric.Lamp.PC.2
  END

  IF ~~ TalkGeneric.HowAreYou.4
    SAY @10039 /* I am sorry to hear. */
    IF ~~ + TalkGeneric.Lamp.PC.2
  END


  // *** How are you upgraded? ***
  IF ~~ TalkGeneric.HowAreYouUpgraded.1
    SAY @10040 /* I feel very good, thanks to you. I will accompany you as long as you wish. */
    IF ~~ DO ~SetGlobal("HowDoYouFeel", "LOCALS", 1)~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.HowAreYouUpgraded.2
    SAY @10041 /* I feel very good, thanks to you. But I will return to my home plane after you have gotten your soul back. */
    IF ~~ DO ~SetGlobal("HowDoYouFeel", "LOCALS", 1)~ + TalkGeneric.PC.1
  END


  // *** Afaaq's advice ***
  IF ~~ TalkGeneric.Advice.1
    SAY @10042 /* Hmm, let me think... */
    // general tips
    IF ~RandomNum(6, 1)~ + TalkGeneric.Advice.General.1
    IF ~RandomNum(6, 2)~ + TalkGeneric.Advice.General.2
    IF ~RandomNum(6, 3)~ + TalkGeneric.Advice.General.3
    IF ~RandomNum(6, 4)~ + TalkGeneric.Advice.General.4
    IF ~RandomNum(6, 5)~ + TalkGeneric.Advice.General.5
    IF ~RandomNum(6, 6)~ + TalkGeneric.Advice.General.6
    IF ~TimeGT(5) TimeLT(21) RandomNum(4, 1)~ + TalkGeneric.Advice.General.Day.1    // a day-specific advice
    IF ~TimeGT(5) TimeLT(21) RandomNum(4, 2)~ + TalkGeneric.Advice.General.Day.2    // a day-specific advice
    IF ~OR(2) TimeGT(20) TimeLT(6) RandomNum(4, 1)~ + TalkGeneric.Advice.General.Night.1    // a night-specific advice
    IF ~OR(2) TimeGT(20) TimeLT(6) RandomNum(4, 2)~ + TalkGeneric.Advice.General.Night.2    // a night-specific advice

    // areatype-specific tips (max. 50% chance)
    IF ~AreaType(DUNGEON) RandomNum(8, 1)~ + TalkGeneric.Advice.Dungeon.1
    IF ~AreaType(DUNGEON) RandomNum(8, 2)~ + TalkGeneric.Advice.Dungeon.2
    IF ~AreaType(DUNGEON) RandomNum(8, 3)~ + TalkGeneric.Advice.Dungeon.3
    IF ~AreaType(DUNGEON) RandomNum(8, 4)~ + TalkGeneric.Advice.Dungeon.4
    IF ~AreaType(FOREST) RandomNum(6, 1)~ + TalkGeneric.Advice.Forest.1
    IF ~AreaType(FOREST) RandomNum(6, 2)~ + TalkGeneric.Advice.Forest.2
    IF ~AreaType(FOREST) RandomNum(6, 3)~ + TalkGeneric.Advice.Forest.3
    IF ~AreaType(CITY) RandomNum(8, 1)~ + TalkGeneric.Advice.City.1
    IF ~AreaType(CITY) RandomNum(8, 2)~ + TalkGeneric.Advice.City.2
    IF ~AreaType(CITY) RandomNum(8, 3)~ + TalkGeneric.Advice.City.3
    IF ~AreaType(CITY) RandomNum(8, 4)~ + TalkGeneric.Advice.City.4

    // area-specific tips (max. 50% chance)
    IF ~AreaCheck("AR0020") OR(2) TimeGT(20) TimeLT(6) RandomNum(4, 1)~ + TalkGeneric.Advice.AR0020.1    // City Gates (Night)
    IF ~AreaCheck("AR0020") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0020.2    // City Gates
    IF ~AreaCheck("AR0201") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0201.1    // Niche below the Cult of the Eyeless
    IF ~AreaCheck("AR0202") !Dead("gaal") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0202.1    // Cult of the Eyeless HQ (Cult-specific)
    IF ~AreaCheck("AR0202") !Dead("hlshade") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0202.2    // Cult of the Eyeless HQ (Lich-specific)
    IF ~AreaCheck("AR0204") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0204.1    // Forgotten Temple of Amaunator below Cult of the Eyeless
    IF ~AreaCheck("AR0205") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0205.1    // Beholder Lair below the Cult of the Eyeless
    IF ~AreaCheck("AR0300") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0300.1    // Dock District
    IF ~AreaCheck("AR0300") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0300.2    // Dock District
    IF ~OR(2) AreaCheck("AR0308") AreaCheck("AR0309") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0308.1    // Harper's HQ
    IF ~OR(2) AreaCheck("AR0330") AreaCheck("AR0331") !Dead("hldemi") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0330.1    // Demi-lich crypt
    IF ~AreaCheck("AR0400") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0400.1    // Slum District
    IF ~AreaCheck("AR0400") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0400.2    // Slum District
    IF ~AreaCheck("AR0404") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0404.1    // Sewers under the Slum District
    IF ~OR(4) AreaCheck("AR0410") AreaCheck("AR0411") AreaCheck("AR0412") AreaCheck("AR0413") Global("LavokOutside", "GLOBAL", 0) RandomNum(2, 1)~ + TalkGeneric.Advice.AR0410.1    // Planar Sphere
    IF ~AreaCheck("AR0414") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0414.1    // Planar Sphere: Hellish Dimension
    IF ~AreaCheck("AR0414") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0414.2    // Planar Sphere: Hellish Dimension
    IF ~AreaCheck("AR0500") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0500.1    // Bridge District
    IF ~AreaCheck("AR0500") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0500.2    // Bridge District
    IF ~OR(6) AreaCheck("AR0516") AreaCheck("AR0517") AreaCheck("AR0518") AreaCheck("AR0519") AreaCheck("AR0520") AreaCheck("AR0521") !Dead("pwarden") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0516.1    // Planar Prison
    IF ~OR(6) AreaCheck("AR0516") AreaCheck("AR0517") AreaCheck("AR0518") AreaCheck("AR0519") AreaCheck("AR0520") AreaCheck("AR0521") !Dead("pwarden") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0516.2    // Planar Prison
    IF ~AreaCheck("AR0526") !Dead("hllich") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0526.1    // Lich Crypt
    IF ~OR(4) AreaCheck("AR0600") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0600.1    // Enchanted Circus Tent
    IF ~OR(4) AreaCheck("AR0600") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0600.2    // Enchanted Circus Tent
    IF ~AreaCheck("AR0607") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0607.1    // Dispelled Circus Tent
    IF ~AreaCheck("AR0700") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0700.1    // Waukeen's Promenade
    IF ~AreaCheck("AR0700") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0700.2    // Waukeen's Promenade
    IF ~AreaCheck("AR0701") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0701.1    // Sewers under Temple District
    IF ~AreaCheck("AR0705") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0705.1    // Mekrath's Home
    IF ~AreaCheck("AR0711") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0711.1    // Secret Mindflayer Lair in Sewers (generic Mindflayer advice)
    IF ~AreaCheck("AR0800") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0800.1    // Graveyard
    IF ~AreaCheck("AR0800") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0800.2    // Graveyard
    IF ~OR(2) AreaCheck("AR0801") AreaCheck("AR0808") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0801.1    // Labyrinth below Graveyard / Vampire's Lair (generic advice without mentioning Bodhi)
    IF ~AreaCheck("AR0802") RandomNum(2, 1)~ + TalkGeneric.Advice.AR0802.1    // Ancient Crypt below the Graveyard
    IF ~OR(2) AreaCheck("AR0803") AreaCheck("AR0809") Global("AranJob", "GLOBAL", 3) RandomNum(2, 1)~ + TalkGeneric.Advice.AR0803.1    // Vampire's Lair Level 2
    IF ~AreaCheck("AR0900") RandomNum(4, 1)~ + TalkGeneric.Advice.AR0900.1    // Temple District
    IF ~AreaCheck("AR0900") RandomNum(4, 2)~ + TalkGeneric.Advice.AR0900.2    // Temple District
    IF ~AreaCheck("AR1000") RandomNum(4, 1)~ + TalkGeneric.Advice.AR1000.1    // Government District
    IF ~AreaCheck("AR1000") RandomNum(4, 2)~ + TalkGeneric.Advice.AR1000.2    // Government District
    IF ~AreaCheck("AR1100") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1100.1    // Imnesville
    IF ~AreaCheck("AR1200") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1200.1    // Windspear Hills
    IF ~OR(2) AreaCheck("AR1201") AreaCheck("AR1202") RandomNum(4, 1)~ + TalkGeneric.Advice.AR1201.1    // Firkraag's Lair
    IF ~OR(2) AreaCheck("AR1201") AreaCheck("AR1202") !Dead("firkra02") Global("Firmag01Move", "GLOBAL", 0) RandomNum(4, 2)~ + TalkGeneric.Advice.AR1201.2    // Firkraag's Lair (before meeting Firkraag)
    IF ~AreaCheck("AR1404") RandomNum(4, 1)~ + TalkGeneric.Advice.AR1404.1    // Temple Ruins (Shade Lord)
    IF ~AreaCheck("AR1404") RandomNum(4, 2)~ + TalkGeneric.Advice.AR1404.2    // Temple Ruins (Shade Lord)
    IF ~OR(2) AreaCheck("AR1401") AreaCheck("AR1402") !Dead("shadel") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1401.1    // Shadow Temple
    IF ~OR(3) AreaCheck("AR1512") AreaCheck("AR1513") AreaCheck("AR1514") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1512.1    // Spellhold Underground Complex
    IF ~AreaCheck("AR1600") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1600.1    // Brynnlaw
    IF ~AreaCheck("AR1800") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1800.1    // North Forest (where you are attacked by the genie/efreeti pair)
    IF ~AreaCheck("AR1900") RandomNum(2, 1)~ + TalkGeneric.Advice.AR1900.1    // Druid Grove
    IF ~AreaCheck("AR2000") Global("A7Quest1Rewarded", "GLOBAL", 1) RandomNum(4, 1)~ + TalkGeneric.Advice.AR2000.1    // Trademeet (when rewarded)
    IF ~AreaCheck("AR2000") RandomNum(4, 2)~ + TalkGeneric.Advice.AR2000.2    // Trademeet (general)
    IF ~AreaCheck("AR2100") RandomNum(4, 1)~ + TalkGeneric.Advice.AR2100.1    // Underdark main cavern
    IF ~AreaCheck("AR2100") RandomNum(4, 2)~ + TalkGeneric.Advice.AR2100.2    // Underdark main cavern
    IF ~AreaCheck("AR2101") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2101.1    // Underdark Beholder Lair
    IF ~AreaCheck("AR2200") RandomNum(4, 1)~ + TalkGeneric.Advice.AR2200.1    // Ust Natha
    IF ~AreaCheck("AR2200") RandomNum(4, 2)~ + TalkGeneric.Advice.AR2200.2    // Ust Natha
    IF ~AreaCheck("AR2300") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2300.1    // Sahuagin City
    IF ~AreaCheck("AR2400") !Dead("udmaster") RandomNum(4, 1)~ + TalkGeneric.Advice.AR2400.1    // Mindflayer City
    IF ~AreaCheck("AR2400") !Dead("udmaster") RandomNum(4, 2)~ + TalkGeneric.Advice.AR2400.2    // Mindflayer City
    IF ~AreaCheck("AR2401") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2401.1    // Ruined Elven Temple
    IF ~AreaCheck("AR2402") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2402.1    // Kuo-Toa Lair / Drow Guards / Demogorgon Statue
    IF ~AreaCheck("AR2500") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2500.1    // Elven War Camp
    IF ~AreaCheck("AR2800") RandomNum(4, 1)~ + TalkGeneric.Advice.AR2800.1    // Suldanessalar
    IF ~AreaCheck("AR2800") RandomNum(4, 2)~ + TalkGeneric.Advice.AR2800.2    // Suldanessalar
    IF ~AreaCheck("AR2806") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2806.1    // Tree of Life
    IF ~AreaCheck("AR2900") RandomNum(2, 1)~ + TalkGeneric.Advice.AR2900.1    // Irenicus Hell
    IF ~AreaCheck("AR3000") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3000.1    // Watcher's Keep Exterior
    IF ~AreaCheck("AR3001") Global("LivingStatues", "GLOBAL", 0) RandomNum(4, 1)~ + TalkGeneric.Advice.AR3001.1    // Watcher's Keep Level 1 (Statues not yet activated)
    IF ~AreaCheck("AR3001") RandomNum(4, 2)~ + TalkGeneric.Advice.AR3001.2    // Watcher's Keep Level 1 (general)
    IF ~OR(12) AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") 
           AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") RandomNum(4, 2)~ + TalkGeneric.Advice.AR3003.1    // Watcher's Keep Level 3 Rooms
    IF ~AreaCheck("AR3016") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3016.1    // Watcher's Keep Level 2
    IF ~AreaCheck("AR3017") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3017.1    // Watcher's Keep Level 4 Machine of Lum Room
    IF ~AreaCheck("AR3018") !Dead("gorsal") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3018.1    // Watcher's Keep Level 4 Saladrex
    IF ~AreaCheck("AR3019") Global("SealOpen", "AR3019", 0) RandomNum(2, 1)~ + TalkGeneric.Advice.AR3019.1    // Watcher's Keep Level 5 Demogorgon Seal
    IF ~AreaCheck("AR3020") Global("DemogorgonChange", "GLOBAL", 0) RandomNum(2, 1)~ + TalkGeneric.Advice.AR3020.1    // Watcher's Keep Level 6 Imprisoned Demogorgon (hidden)
    IF ~AreaCheck("AR3020") GlobalGT("DemogorgonChange", "GLOBAL", 0) !Dead("demogor2") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3020.2    // Watcher's Keep Level 6 Imprisoned Demogorgon (true form)
    IF ~AreaCheck("AR3021") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3021.1    // Watcher's Keep Level 4 Mindflayer Room
    IF ~AreaCheck("AR3022") RandomNum(2, 1)~ + TalkGeneric.Advice.AR3022.1    // Watcher's Keep Level 4 Githyanki Room
    IF ~AreaCheck("AR4000") RandomNum(2, 1)~ + TalkGeneric.Advice.AR4000.1    // Forest of Tethir (Start of ToB)
    IF ~AreaCheck("AR4500") RandomNum(2, 1)~ + TalkGeneric.Advice.AR4500.1    // Pocket Plane (branches into different paths depending on when you talk to Afaaq)
    IF ~AreaCheck("AR5000") RandomNum(2, 1)~ + TalkGeneric.Advice.AR5000.1    // Saradush
    IF ~AreaCheck("AR5200") RandomNum(2, 1)~ + TalkGeneric.Advice.AR5200.1    // Marching Mountains
    IF ~AreaCheck("AR5201") RandomNum(2, 1)~ + TalkGeneric.Advice.AR5201.1    // Marching Mountains - Fire Giant Temple Level 1
    IF ~AreaCheck("AR5202") RandomNum(2, 1)~ + TalkGeneric.Advice.AR5202.1    // Forest of Mir / Temple of Bhaal
    IF ~AreaCheck("AR5203") !Dead("yaga01") RandomNum(2, 1)~ + TalkGeneric.Advice.AR5203.1    // Saradush Siege Camp (Yaga-Shura alive)
    IF ~AreaCheck("AR5204") RandomNum(2, 1)~ + TalkGeneric.Advice.AR5204.1    // Marching Mountains - Fire Giant Temple Level 2
    IF ~AreaCheck("AR5500") RandomNum(4, 1)~ + TalkGeneric.Advice.AR5500.1    // Amkethran
    IF ~AreaCheck("AR5500") RandomNum(4, 2)~ + TalkGeneric.Advice.AR5500.2    // Amkethran
    IF ~AreaCheck("AR6000") !Dead("bazdra02") RandomNum(2, 1)~ + TalkGeneric.Advice.AR6000.1    // Abazigal Lair Entrance
    IF ~OR(7) AreaCheck("AR6001") AreaCheck("AR6002") AreaCheck("AR6003") AreaCheck("AR6004") AreaCheck("AR6008") AreaCheck("AR6011") AreaCheck("AR6012") !Dead("abazigal") RandomNum(4, 1)~ + TalkGeneric.Advice.AR6001.1    // Abazigal Lair (Abazigal alive)
    IF ~AreaCheck("AR6100") !Dead("sendai") RandomNum(4, 2)~ + TalkGeneric.Advice.AR6100.2    // Sendai's Entrance
    IF ~OR(11) AreaCheck("AR6101") AreaCheck("AR6102") AreaCheck("AR6103") AreaCheck("AR6104") AreaCheck("AR6105") AreaCheck("AR6101") 
           AreaCheck("AR6106") AreaCheck("AR6107") AreaCheck("AR6109") AreaCheck("AR6110") AreaCheck("AR6111") !Dead("sendai") RandomNum(4, 1)~ + TalkGeneric.Advice.AR6101.1    // Sendai's Enclave
    IF ~OR(11) AreaCheck("AR6101") AreaCheck("AR6102") AreaCheck("AR6103") AreaCheck("AR6104") AreaCheck("AR6105") AreaCheck("AR6101") 
           AreaCheck("AR6106") AreaCheck("AR6107") AreaCheck("AR6109") AreaCheck("AR6110") AreaCheck("AR6111") !Dead("sendai") RandomNum(4, 2)~ + TalkGeneric.Advice.AR6101.2    // Sendai's Enclave

    // situation-specific tips (max. 15% chance)
    IF ~GlobalLT("Chapter", "GLOBAL", 4) RandomNum(28, 1)~ + TalkGeneric.Advice.Specific.FollowIrenicus.1    // CHARNAME follows Irenicus and abducted Imoen
    IF ~GlobalLT("Chapter", "GLOBAL", 4) RandomNum(28, 2)~ + TalkGeneric.Advice.Specific.FollowIrenicus.2    // CHARNAME follows Irenicus and abducted Imoen
    IF ~GlobalLT("Chapter", "GLOBAL", 4) GlobalGT("WorkingForAran", "GLOBAL", 0) RandomNum(28, 3)~ + TalkGeneric.Advice.Specific.ShadowThieves.1    // CHARNAME joins the Shadow Thieves
    IF ~GlobalLT("Chapter", "GLOBAL", 4) GlobalGT("WorkingForAran", "GLOBAL", 0) GlobalGT("AranJob", "GLOBAL", 0) GlobalLT("AranJob", "GLOBAL", 3) RandomNum(28, 4)~ + TalkGeneric.Advice.Specific.ShadowThieves.2    // CHARNAME joins the Shadow Thieves (while working for them)
    IF ~GlobalLT("Chapter", "GLOBAL", 4) GlobalGT("WorkingForBodhi", "GLOBAL", 0) RandomNum(28, 3)~ + TalkGeneric.Advice.Specific.Bodhi.1    // CHARNAME joins Bodhi
    IF ~GlobalGT("Chapter", "GLOBAL", 4) GlobalLT("Chapter", "GLOBAL", 7) RandomNum(20, 1)~ + TalkGeneric.Advice.Specific.LostSoul.1    // CHARNAME has lost his soul
    IF ~GlobalGT("Chapter", "GLOBAL", 4) GlobalLT("Chapter", "GLOBAL", 7) RandomNum(20, 2)~ + TalkGeneric.Advice.Specific.LostSoul.2    // CHARNAME has lost his soul
    IF ~GlobalGT("Chapter", "GLOBAL", 4) GlobalLT("Chapter", "GLOBAL", 7) Global("A7TalkAboutLostSoul", "GLOBAL", 0) RandomNum(20, 3)~ + TalkGeneric.Advice.Specific.LostSoul.3    // CHARNAME has lost his soul
    IF ~Global("Chapter", "GLOBAL", 6) RandomNum(16, 1)~ + TalkGeneric.Advice.Specific.IrenicusGoal.1    // CHARNAME knows about Irenicus' true intent
    IF ~Global("Chapter", "GLOBAL", 6) RandomNum(16, 2)~ + TalkGeneric.Advice.Specific.IrenicusGoal.2    // CHARNAME knows about Irenicus' true intent
    IF ~Global("TalkedSarMel01", "GLOBAL", 1) !Dead("gromnir") RandomNum(24, 1)~ + TalkGeneric.Advice.Specific.Melissan.1    // speculating about Melissan and her plans (before Gromnir's defeat)
    IF ~Dead("yaga01") OR(2) !Dead("abazigal") !Dead("sendai") Global("A7TalkAboutMelissan", "GLOBAL", 0) RandomNum(24, 2)~ + TalkGeneric.Advice.Specific.Melissan.2    // speculating about Melissan and her plans (after Yaga-Shura is dead)
    IF ~Dead("abazigal") Dead("sendai") !Dead("balth") RandomNum(24, 3)~ + TalkGeneric.Advice.Specific.Melissan.3    // speculating about Melissan and her plans (after CHARNAME saw a vision of Melissan being detained)
    IF ~Dead("gromnir") !Dead("yaga01") RandomNum(15, 1)~ + TalkGeneric.Advice.Specific.Yaga.1    // about Yaga-Shura
    IF ~Dead("gromnir") !Dead("yaga01") RandomNum(15, 2)~ + TalkGeneric.Advice.Specific.Yaga.2    // about Yaga-Shura
    IF ~Dead("yaga01") !Dead("abazigal") RandomNum(16, 1)~ + TalkGeneric.Advice.Specific.Abazigal.1    // about Abazigal
    IF ~Dead("yaga01") !Dead("sendai") RandomNum(16, 2)~ + TalkGeneric.Advice.Specific.Sendai.1    // about Sendai
    IF ~Dead("abazigal") Dead("sendai") !Dead("balth") Global("BalthazarFights", "GLOBAL", 0) RandomNum(16, 1)~ + TalkGeneric.Advice.Specific.Balthazar.1    // about Balthazar
    IF ~Dead("abazigal") Dead("sendai") !Dead("balth") Global("BalthazarFights", "GLOBAL", 0) RandomNum(16, 2)~ + TalkGeneric.Advice.Specific.Balthazar.2    // about Balthazar
    IF ~Dead("yaga01") OR(2) !Dead("abazigal") !Dead("sendai") Global("A7TalkAboutSolarDream", "GLOBAL", 0) RandomNum(18, 1)~ + TalkGeneric.Advice.Specific.SolarDream.1    // about CHARNAME's dream-like situations with the Solar
    IF ~Dead("balth") RandomNum(18, 2)~ + TalkGeneric.Advice.Specific.SolarDream.2    // about CHARNAME's dream-like situations with the Solar (after Melissan's true self has been revealed)
  END


  // General tips
  IF ~~ TalkGeneric.Advice.General.1
    SAY @10043 /* If you ever face an overwhelming number of opponents, know that the classic divide and conquer strategy can help you tremendously. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.2
    SAY @10045 /* Even the most heavily armed opponents will be powerless before you if you can hinder their movements. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.3
    SAY @10046 /* Be careful when fighting extraplanar creatures. Many of them can see through your illusions and have special powers you do not expect. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.4
    SAY @10047 /* Outsiders like myself or the efreets will transform into a gaseous state and recover their health when they are badly hurt. I advise you to hit them hard and fast, it may also help to hinder them in their movements. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.5
    SAY @10048 /* Do not depend on your spells to silence enemy spellcasters. There is always a way to counteract their muted state. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.6
    SAY @10049 /* Spellcasters are usually lacking constitution or stamina to withstand physical attacks. It is always good practice to be prepared all the time, be it against overwhelming forces or the unseen dagger in the dark. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.Day.1
    SAY @10050 /* Your thief will have a hard time sneaking up on your targets without shadows in his reach. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.Day.2
    SAY @10051 /* Daylight is the natural enemy of the undead. Whenever you plan to defeat them, use it to your advantage. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.Night.1
    SAY @10052 /* The nights harbor more than zombies or skeletons. Even the shadows may come alive in the forsaken corners of the world. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.General.Night.2
    SAY @10053 /* Do not suppose that the darkness impairs your opponents. Many of them can see in the dark quite well, even better than you can. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  // Areatype-specific tips
  IF ~~ TalkGeneric.Advice.Dungeon.1
    SAY @10054 /* Be aware that you can not always flee from overwhelming forces like you can in open terrain. Make sure you are well prepared before you enter the fray. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Dungeon.2
    SAY @10055 /* Traps are very common in places like this. Your thief should always watch out for them. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Dungeon.3
    SAY @10056 /* You are not the only adventurer who is marching through a place like this. Do not be disappointed if you merely find empty treasure chests. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Dungeon.4
    SAY @10057 /* All kinds of creatures call places like this their home. Do not be surprised to encounter a wide range of monsters. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Forest.1
    SAY @10058 /* Forest creatures are usually not evil by themselves. You can avoid many unpleasant encounters if you do not disturb them in their activities. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Forest.2
    SAY @10059 /* Sentient beings like dryads or nymphs can be found in a forest like this. It is usually up to you how they will treat you. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Forest.3
    SAY @10060 /* Take care, my <PRO_LADYLORD>. Many adventurers have met an untimely end against the more unnatural beasts which make their home in the darker corners of the woods. */
    + ~OR(4) Class(Player1, RANGER_ALL) Class(Player1, DRUID_ALL) CheckStatGT(Player1, 15, INT) CheckStatGT(Player1, 14, WIS)~ + @10061 /* You are probably referring to the lycanthropes? I've had my share of trouble with them already. */ + TalkGeneric.Advice.Forest.3.1
    + ~!Class(Player1, RANGER_ALL) !Class(Player1, DRUID_ALL) CheckStatLT(Player1, 16, INT) CheckStatLT(Player1, 15, WIS)~ + @10062 /* Do you mean werewolves? I've had my share of trouble with them already. */ + TalkGeneric.Advice.Forest.3.2
    ++ @10063 /* What are you talking about? */ + TalkGeneric.Advice.Forest.3.3
    ++ @10064 /* I can take care of myself, Afaaq. */ + TalkGeneric.Advice.Forest.3.4
  END

  IF ~~ TalkGeneric.Advice.Forest.3.1
    SAY @10065 /* Oh, you have already encountered them? Take care of their bites and scratches, however. They are the primary way to infect others with their curse. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Forest.3.2
    SAY @10066 /* Yes, I am talking about lycanthropes. Werewolves are the most common example, I presume. Take care of their bites and scratches: they are the primary way to infect others with their curse. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Forest.3.3
    SAY @10067 /* I am talking about lycanthropes, usually in the form of werewolves. You may also encounter types like werebears, wererats or weretigers. However, do not mistake the latter with the despicable rakshasa. */
    = @10068 /* You should also take care of their bites and scratches: they are the primary way to infect others with their curse. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Forest.3.4
    SAY @10069 /* If you say so... */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.City.1
    SAY @10070 /* Cities tend to be a melting pot for a multitude of different cultures and customs. Do not be surprised if your actions will please one group and anger another one at the same time. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.City.2
    SAY @10071 /* Crime and corruption flourish in cities like this. You will see it for yourself if you visit the darker corners at night. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.City.3
    SAY @10072 /* You can purchase a lot of magical equipment in towns like this. However, to get your hands on the more powerful artifacts, you will usually have to pay more than just money. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.City.4
    SAY @10073 /* Take care when dealing with the authorities of the cities. The minds of mortals tend to be corrupted by the powers granted by their positions. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  // Area-specific tips
  IF ~~ TalkGeneric.Advice.AR0020.1    // City Gates (Night)
    SAY @10074 /* The Athkatlans seem to be very sure of their own defences. Not all cities allow bands of adventurers to enter or leave the town at night. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0020.2    // City Gates
    SAY @10075 /* The City Gates are usually a place where you can meet a lot of merchants and travellers. In Athkatla this seems not to be the case. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0201.1    // Niche below the Cult of the Eyeless
    SAY @10076 /* The stench is overwhelming, my <PRO_LADYLORD>. Only the most degenerated undead creatures will make this cave their home. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0202.1    // Cult of the Eyeless HQ (Cult-specific)
    SAY @10077 /* I can sense an unusual menacing force close by. It is almost of...divine nature? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0202.2    // Cult of the Eyeless HQ (Lich-specific)
    SAY @10078 /* This part of the sewers harbors more than strange cults and monsters. I can sense an evil aura of great power. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0204.1    // Forgotten Temple of Amaunator below Cult of the Eyeless
    SAY @10079 /* Abandoned and foul places like this can harbor beasts you may not have seen outside of your nightmares. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0205.1    // Beholder Lair below the Cult of the Eyeless
    SAY @10080 /* Beholders are fearsome beasts which you should avoid at all costs. Even their less powerful kin, the gauth, are not to be taken lightly in battle. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0300.1    // Dock District
    SAY @10081 /* I can almost feel the criminal acts taking place in the streets. The dead bodies floating in the sea confirm my suspicions. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0300.2    // Dock District
    SAY @10082 /* I am sure you can purchase *anything* in this part of the city. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0308.1    // Harper's HQ
    SAY @10083 /* This is an unusual place, my <PRO_LADYLORD>. I can feel powerful enchantments, however I do not recognize their nature. Strange... */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0330.1    // Demi-lich crypt
    SAY @10084 /* What an oppressive aura; it almost overwhelms my senses. Whatever lies hidden in this place is powerful and far more ancient than the town itself. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0400.1    // Slum District
    SAY @10085 /* Ah yes, the slums. I have the feeling that every human settlement has at least one place to dump the poor and the desperate. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0400.2    // Slum District
    SAY @10086 /* I doubt you can purchase high quality wares in these parts of the town. However, you will likely have more luck if you are looking for the more ethically questionable products mortals would sell. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0404.1    // Sewers under the Slum District
    SAY @10087 /* What a strange place you have brought me to, my <PRO_LADYLORD>. I can feel an otherworldly presence in the immediate vicinity, however I do not recognize its source. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0410.1    // Planar Sphere
    SAY @10088 /* I would not have thought it possible, but this construct is of human design. I have never seen such powerful magic woven into a structure to withstand the raw dimensional forces. */
    = @10089 /* Take care, there is no way to know what creatures have made the sphere their home. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0414.1    // Planar Sphere: Hellish Dimension
    SAY @10090 /* This is a pocket plane of some sort and appears to be connected to a layer of the Abyss. You will likely encounter all kinds of demonic creatures, be they as harmless as a quasit or as dangerous as a tanar'ri. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0414.2    // Planar Sphere: Hellish Dimension
    SAY @10091 /* I suggest that you complete your task as fast as possible. You will never know when a greater demonic power will lay its eyes on the wondrous sphere. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0500.1    // Bridge District
    SAY @10092 /* This place reminds me a bit of the streets of Calimport. You can hear the town criers shouting the latest gossip, see exotic merchants offering their wares and smell the food and drink from the taverns. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0500.2    // Bridge District
    SAY @10093 /* The townsfolk appear to be a bit tense, I wonder why... */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0516.1    // Planar Prison
    SAY @10094 /* This place appears to be an artificial pocket plane of some sorts. It is probably shielded by powerful enchantments too, so an escape is very unlikely. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0516.2    // Planar Prison
    SAY @10095 /* A prison has always wardens or supervisors. Maybe they know more about the people you are looking for. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0526.1    // Lich Crypt
    SAY @10096 /* The stench of evil is almost palpable in this place. I can only advise you to prepare for the worst. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0600.1    // Enchanted Circus Tent
    SAY @10097 /* I know this kind of magic very well. It is of djinn design and very powerful. */
    ++ @10098 /* Can't you do something about it? */ + TalkGeneric.Advice.AR0600.1.1
    ++ @10099 /* That's good to know, but it doesn't get me anywhere. */ + TalkGeneric.Advice.AR0600.1.2
  END
  
  IF ~~ TalkGeneric.Advice.AR0600.1.1
    SAY @10100 /* No, I can not. There are rules which forbid outsiders to interfere with a deal between mortals and djinn. */
    = @10101 /* You have to find a way to solve the puzzle for yourself. My intervention would do more harm than good in the end. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0600.1.2
    SAY @10102 /* Unfortunately I can not help you in this case directly. I can only advise you to find the mortal responsible for this illusion and deal with him personally. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0600.2    // Enchanted Circus Tent
    SAY @10103 /* These illusions are impressive indeed. Only a djinni of great power is able to alter reality to such an extent. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0607.1    // Dispelled Circus Tent
    SAY @10104 /* The circus is free to entertain the people once more. */
    IF ~Global("U!ReadyJafir", "GLOBAL", 0)~ + TalkGeneric.Advice.AR0607.1.1
    IF ~Global("U!ReadyJafir", "GLOBAL", 1)~ + TalkGeneric.Advice.AR0607.1.2
    IF ~GlobalGT("U!ReadyJafir", "GLOBAL", 1)~ + TalkGeneric.Advice.AR0607.1.3
  END
  
  IF ~~ TalkGeneric.Advice.AR0607.1.1
    SAY @10105 /* How the gnome was able to make a wish of this grand scale will always be a mystery. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0607.1.2
    SAY @10106 /* How the gnome was able to make a wish of this grand scale is astounding. Maybe we will find it out in time. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0607.1.3
    SAY @10107 /* It is a pity, however, that our gnome met his end in such a sad fashion. In the end he was nothing more than a plaything for the despicable rakshasa. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0700.1    // Waukeen's Promenade
    SAY @10108 /* This is an impressive marketplace, however it does not even come close to the grandeur with which markets present themselves in Calimshan cities. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0700.2    // Waukeen's Promenade
    SAY @10109 /* Marketplaces like this have much to offer to a successful adventurer like you. However, the wares will cost you an arm and a leg, too. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0701.1    // Sewers under Temple District
    SAY @10110 /* Is this the dark side of the Temple District? I do not sense unusual magical activities. However, I expect a lot of the less-reputable townsfolk to make their appearance now and then. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0705.1    // Mekrath's Home
    SAY @10111 /* You have entered the home of a wizard, my <PRO_LADYLORD>. I advise you to be courteous unless you are eager for a fight. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0711.1    // Secret Mindflayer Lair in Sewers (generic Mindflayer advice)
    SAY @10112 /* Take care, my <PRO_LADYLORD>, the residents of this place are very powerful. I can almost smell the stench of their evil minds. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0800.1    // Graveyard
    SAY @10113 /* Is this a place where they store your body after it ceases to function? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0800.2    // Graveyard
    SAY @10114 /* The dead are restless... I can sense a malevolent power defiling their resting places. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0801.1    // Labyrinth below Graveyard / Vampire's Lair (generic advice without mentioning Bodhi)
    SAY @10115 /* This place appears to be far older than the buildings above it. I can sense a multitude of creatures crawling around the dark corners of this place. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0802.1    // Ancient Crypt below the Graveyard
    SAY @10116 /* The lavish adornments and the stale air suggest this crypt is even older than the labyrinth which leads to it. Places like this are always guarded by undead of some kind. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0803.1    // Vampire's Lair Level 2
    SAY @10117 /* The place is teeming with undead, my <PRO_LADYLORD>. I hope you have brought enough stakes or holy water with you? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0900.1    // Temple District
    SAY @10118 /* Is this a sanctuary to reflect and contemplate? More probably a stage to show off and brag about. I wonder what your gods may think about places like this? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR0900.2    // Temple District
    SAY @10119 /* I can see why Athkatla is called the "City of Coin". While your streets may not be paved with gold, the wealth showed off by your churches would have every god go green with envy. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1000.1    // Government District
    SAY @10120 /* Did you know that Athkatla was founded by Calishite emigrants? The obsession for wealth and a decadent lifestyle has always been an important cornerstone of Calimshan. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1000.2    // Government District
    SAY @10121 /* I have heard that the Athkatlan council members are not known to the public. That is very unusual for a city which attaches so much importance to financial wealth. How do the people know whom to bribe? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1100.1    // Imnesville
    SAY @10122 /* A rural settlement on the fringes of Amn. I doubt you will find world-threatening dangers and heroic quests in a place like this. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1200.1    // Windspear Hills
    SAY @10123 /* This land appears to be wilder and more detached from the usual Amnish countryside. I suggest that you scout the surroundings carefully before you advance. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1201.1    // Firkraag's Lair
    SAY @10124 /* This complex appears to have been constructed in ancient times. The design is almost familiar...maybe it has been influenced by one of the former Calishite tribes. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1201.2    // Firkraag's Lair (before meeting Firkraag)
    SAY @10125 /* I can feel a frightening power lurking somewhere in this dungeon. Step carefully, my <PRO_LADYLORD>, I can only guess how many ancient and powerful creatures have made this place their home. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1404.1    // Temple Ruins (Shade Lord)
    SAY @10126 /* This unnatural darkness emanates from a place very near. I can almost feel the evil which is responsible for it. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1404.2    // Temple Ruins (Shade Lord)
    SAY @10127 /* The whole region has been infested by a dark mind. Do not stay too long or you too will fall prey to its powers. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1401.1    // Shadow Temple
    SAY @10128 /* The whole complex has been corrupted to the core. Do not trust your eyes alone or you will be easy prey to the darkness which lingers in every corner. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1512.1    // Spellhold Underground Complex
    SAY @10129 /* The whole dungeon reeks of perverted magic. This place became corrupted even long before the darkness had taken over. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1600.1    // Brynnlaw
    SAY @10130 /* This is a wild and uncivilized place, even by human standards. I wonder why the Cowled Wizards have chosen a place like this. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1800.1    // North Forest (where you are attacked by the genie/efreeti pair)
    SAY @10131 /* I can feel magical energies lingering around somewhere. However I am not sure whether it is a natural phenomenon or caused by arcane powers. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR1900.1    // Druid Grove
    SAY @10132 /* The magic of the land is powerful, I can feel it. You will likely encounter many strong beasts which make this grove their home. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2000.1    // Trademeet (when rewarded)
    SAY @10133 /* So, you have destroyed a pack of dao genies to please my captors? I doubt they will take revenge on Trademeet though. */
    = @10134 /* However, if they learn of your involvement in the imprisonment of their leader, you will be in big trouble. You have never seen an enraged group of daos seeking revenge before. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2000.2    // Trademeet (general)
    SAY @10135 /* The town looks peaceful on the surface, however the people seem troubled. Places like this are great opportunities for adventurers like you to earn money or fame. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2100.1    // Underdark main cavern
    SAY @10136 /* The Underdark is an extremely dangerous place even for the native inhabitants. A great many dangers lurk behind every corner and the majority of its residents will either capture or kill you on sight. */
    = @10137 /* You will find naught to eat but poisonous fungi, unless you are lucky to find peaceful traders or fellow adventurers. I advise you to make haste and find a way out as soon as possible. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2100.2    // Underdark main cavern
    SAY @10138 /* One of the greatest dangers you will likely encounter are raiding parties of drow. They appear harmless enough but their magic is powerful and can overwhelm you in an instant. I have come to know about their cunning and cruelty in the past. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2101.1    // Underdark Beholder Lair
    SAY @10080 /* Beholders are fearsome beasts which you should avoid at all costs. Even their less powerful kin, the gauth, is not to be taken lightly in battle. */
    = @10139 /* The more powerful kind of their species have mastered a great variety of magic spells as well. If you encounter one of them, take it out quickly or you are dead. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2200.1    // Ust Natha
    SAY @10140 /* Always watch your back. Do not trust anyone in this place, as they will take advantage of you the instant they see an opportunity to do so. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2200.2    // Ust Natha
    SAY @10141 /* You are lucky that the drow are preparing for war and are in need of outside help. Under normal circumstances you would have been sold as slaves to one of the ruling houses and your chances to leave the city alive would have been slim at best. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2300.1    // Sahuagin City
    SAY @10142 /* I do not know much about the sahuagin, but they are likely in no way inferior to their predatory relatives, the sharks. */
    = @10143 /* The only time I have seen them was in the wake of a marid horde, back in the glorious days of the Calim Empire. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2400.1    // Mindflayer City
    SAY @10144 /* We are unlucky to have stumbled upon a lair of illithids, also known as mindflayers by your kind. */
    = @10145 /* Their powers are terrible especially to yourself, as they will see you only as their next meal or cheap labor. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2400.2    // Mindflayer City
    SAY @10146 /* To leave the influence of the illithids, you either have to prove your superiority to them or kill their master brain. */
    = @10147 /* If you actually manage to kill their master brain, the remaining forces will likely flee from your presence as they are unable to launch coordinated attacks anymore. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2401.1    // Ruined Elven Temple
    SAY @10148 /* Even in this ruined state you can catch a glimpse of the former glory the temple radiated in the past. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2402.1    // Kuo-Toa Lair / Drow Guards / Demogorgon Statue
    SAY @10149 /* This looks like a passage to the surface, my <PRO_LADYLORD>. I can sense a multitude of monsters however which guard it well. */
    = @10150 /* If the rumors are true and the drow are at war with their surface cousins, it is unlikely you can pass them easily. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2500.1    // Elven War Camp
    SAY @10151 /* Did you see their grim faces, my <PRO_LADYLORD>? The destruction of their temple appears to mean a lot to them. Maybe there is more at stake than they are willing to admit. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2800.1    // Suldanessalar
    SAY @10152 /* It pains me to see the wonderful city of Suldanessellar fallen to Irenicus and his minions. Even more so as I can sense the tormentors of my past wrecking chaos in this place. */
    = @10153 /* You have to move quickly and put an end to this Irenicus. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2800.2    // Suldanessalar
    SAY @10154 /* This Irenicus must have spent a lot of time and resources to bring down a city like this so easily. */
    = @10155 /* However, I have the impression that he neglected to strengthen his defence in favor of a quick advance. You should be powerful enough already to deal with the many beasts guarding this place. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2806.1    // Tree of Life
    SAY @10156 /* You are close to your goal, my <PRO_LADYLORD>. This Irenicus is near and I doubt his remaining defences will be much trouble for you. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR2900.1    // Irenicus Hell
    SAY @10157 /* What a surprising situation: even after death this Irenicus does not give up your soul. */
    = @10158 /* You should take care, my <PRO_LADYLORD>, both you and the wizard have power in this place. I would not be surprised if he attempts to take control of this plane even as we speak. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3000.1    // Watcher's Keep Exterior
    SAY @10159 /* Where did you take me, my <PRO_LADYLORD>? I have never seen a building like this. */
    = @10160 /* There is a mysterious aura around, however I am unable to recognize its nature. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3001.1    // Watcher's Keep Level 1 (Statues not yet activated)
    SAY @10161 /* Did you see the statues near the portal? I am sure they are the key to open a gate to the next level. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3001.2    // Watcher's Keep Level 1 (general)
    SAY @10162 /* These rooms look like an abandoned library. I wonder who applied so much effort into collecting and maintaining all those books, especially in a remote place like this. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3003.1    // Watcher's Keep Level 3 Rooms
    SAY @10163 /* The teleporters are a nuisance. Without a map we might appear in the Nine Hells itself if we are not careful. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3016.1    // Watcher's Keep Level 2
    SAY @10164 /* Those rooms appear to be laboratories of powerful wizards. Who knows what has led to their demise. */
    = @10165 /* I advise you to be very careful, as wizards are not known for letting outsiders look over their shoulder. There may still be insidious traps or magical beasts waiting for you. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3017.1    // Watcher's Keep Level 4 Machine of Lum Room
    SAY @10166 /* That Machine of Lum is a curious contraption. The level of madness required to make it work is even beyond my scope. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3018.1    // Watcher's Keep Level 4 Saladrex
    SAY @10167 /* You should take care when dealing with the creatures of this place. Everyone appears to be affected by the infamous Machine of Lum one way or another. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3019.1    // Watcher's Keep Level 5 Demogorgon Seal
    SAY @10168 /* This room looks deceptively quiet, <PRO_LADYLORD>. However, we are deep within the keep and beyond the seal a great evil awaits us. */
    = @10169 /* I am reasonably sure that a seal of that scale is guarded by horrors beyond your imagination. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3020.1    // Watcher's Keep Level 6 Imprisoned Demogorgon (hidden)
    SAY @10170 /* Very strange, I can detect no evil intent in this room. Did the Imprisoned One already escape? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3020.2    // Watcher's Keep Level 6 Imprisoned Demogorgon (true form)
    SAY @10171 /* What power...its hatred is overwhelming. My <PRO_LADYLORD>, defeat it quickly or you will perish! */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3021.1    // Watcher's Keep Level 4 Mindflayer Room
    SAY @10172 /* Step carefully, my <PRO_LADYLORD>. The air is filled with the stench of illithids or even worse, and I can still feel the tortured minds of mortals echoing in my mind. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR3022.1    // Watcher's Keep Level 4 Githyanki Room
    SAY @10173 /* I can sense only madness and hate in the immediate vicinity, my <PRO_LADYLORD>. I fear you will have little success talking to the residents of this room. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR4000.1    // Forest of Tethir (Start of ToB)
    SAY @10174 /* I am sensing powerful spirits within those stone heads. You should take heed what they have to tell you. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR4500.1    // Pocket Plane (branches into different paths depending on when you talk to Afaaq)
    SAY @10175 /* I see you have returned to your pocket plane, my <PRO_LADYLORD>? */
    IF ~True()~ + TalkGeneric.Advice.AR4500.1.1
    IF ~GlobalGT("BeginChallenge1", "GLOBAL", 0)~ + TalkGeneric.Advice.AR4500.1.2
    IF ~Dead("yaga01")~ + TalkGeneric.Advice.AR4500.1.3
    IF ~Dead("abazigal") Dead("sendai")~ + TalkGeneric.Advice.AR4500.1.4
    IF ~Dead("balth")~ + TalkGeneric.Advice.AR4500.1.5
  END

  IF ~~ TalkGeneric.Advice.AR4500.1.1
    SAY @10176 /* Hmm, this place looks different than before. I guess it resembles your <PRO_RACE> nature more closely now, but it will take some time for your mortal mind to understand it completely. */
    = @10177 /* The challenges mentioned by your former adversary are likely formed by your subconscious desire to learn more about your true potential. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR4500.1.2
    SAY @10178 /* You have seen for yourself, by overcoming the challenges you are able to set free your true potential. When the time has come you will have another opportunity to learn more about your true self, I am sure of it. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR4500.1.3
    SAY @10179 /* The lessons taught to you by the Solar are essential on your way to godhood. How do you expect to take control over your divinity if you do not even know yourself? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR4500.1.4
    SAY @10180 /* You are nearing your goal, <CHARNAME>. I can already feel your divine soul taking form to guide your actions. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR4500.1.5
    SAY @10181 /* The time has finally come. You are almost ready to claim your heritage and take over Bhaal's Throne of Blood. */
    = @10182 /* Whatever choice you make, <CHARNAME>, I will fight on your side as long as I am able to. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5000.1    // Saradush
    SAY @10183 /* The town is already on the brink of destruction. I do not see how you can prevent the inevitable as long as we are confined within it, my <PRO_LADYLORD>. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5200.1    // Marching Mountains
    SAY @10184 /* The smell of brimstone and ashes is very strong in this region. The Fire Giant Temple will be not far away. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5201.1    // Marching Mountains - Fire Giant Temple Level 1
    SAY @10185 /* This place lives up to its name, my <PRO_LADYLORD>. The temple has been built over a massive magma chamber deep below the mountains. You will find no refuge from the heat here. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5202.1    // Forest of Mir / Temple of Bhaal
    SAY @10186 /* You have brought us to a dark and foul place, my <PRO_LADYLORD>. The magical energies surrounding the temple ruins feel like stale air. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5203.1    // Saradush Siege Camp (Yaga-Shura alive)
    SAY @10187 /* Do you see the masses of soldiers, my <PRO_LADYLORD>? Defeating them all would take at least weeks. I strongly suggest that you concentrate your attacks on Yaga-Shura and his generals. An army without leadership will disperse quickly. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5204.1    // Marching Mountains - Fire Giant Temple Level 2
    SAY @10188 /* This appears to be the heart of the temple. Step carefully, I can sense strong magic guarding this place. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5500.1    // Amkethran
    SAY @10189 /* Ah, this town reminds me of Calimshan. The blazing heat and dry wind... This will be a good place to restock your supplies and prepare for the coming battles. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR5500.2    // Amkethran
    SAY @10190 /* The townspeople seem to be frightened of something or someone. Maybe you can find a reason for their troubles, my <PRO_LADYLORD>. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR6000.1    // Abazigal Lair Entrance
    SAY @10191 /* The entrance to Abazigal's Lair is impressive indeed. */
    IF ~True()~ + TalkGeneric.Advice.AR6000.1.2
    IF ~Dead("firkra02") Global("A7I_FirkraagChallenged", "GLOBAL", 1)~ + TalkGeneric.Advice.AR6000.1.1
  END

  IF ~~ TalkGeneric.Advice.AR6000.1.1    // Abazigal Lair Entrance (if defeated Firkraag)
    SAY @10192 /* We have seen a grand place like this not too long ago, my <PRO_LADYLORD>. Do you remember the richly ornamented cave entrance in the Windspear Hills? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR6000.1.2    // Abazigal Lair Entrance (if Firkraag not dead)
    SAY @10193 /* I am curious about the Bhaalspawn who is living in this place. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR6001.1    // Abazigal Lair (Abazigal alive)
    SAY @10194 /* The creatures of this place are all very unique in their nature. The owner of this place must be powerful indeed. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR6100.2    // Sendai's Entrance
    SAY @10195 /* Do you feel the dark magic permeating everything, my <PRO_LADYLORD>? The entrance to Sendai's Enclave is not far. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR6101.1    // Sendai's Enclave
    SAY @10196 /* I have seen many drow enclaves in my past, but this one appears to be especially well defended. */
    = @10197 /* Behind every corner may await an ambushing party of drow and each chamber is likely filled with hordes of slaves, arachnids or magical beasts of all kinds. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.AR6101.2    // Sendai's Enclave
    SAY @10198 /* You do not need to bother to conceal your presence. The drow will most surely know already where you are. */
    = @10199 /* Drow are always paranoid of intruders of any kind and have likely spent a lot of resources into surveillance measures within the cave system. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  // Situation-specific tips
  IF ~~ TalkGeneric.Advice.Specific.FollowIrenicus.1    // CHARNAME follows Irenicus and abducted Imoen
    SAY @10200 /* I am aware that you are eager to catch up with your tormentor. However, you should take your time and plan ahead. The enemy surely expects you to follow his trail. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.FollowIrenicus.2    // CHARNAME follows Irenicus and abducted Imoen
    SAY @10201 /* My <PRO_LADYLORD>, do not worry too much about the fate of your childhood friend. You are already doing your best to reach her. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.ShadowThieves.1    // CHARNAME joins the Shadow Thieves
    SAY @10202 /* I suggest that you be wary of your current allies, my <PRO_LADYLORD>. There is no doubt in my mind that their interest in your plight is purely out of self interest. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.ShadowThieves.2    // CHARNAME joins the Shadow Thieves (while working for them)
    SAY @10203 /* The nature of your tasks given to you by your current allies has piqued my curiosity. */
    = @10204 /* They do not seem to be aimed at gaining profit or power. I am wondering about their true intentions and your part in it. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Bodhi.1    // CHARNAME joins Bodhi
    SAY @10205 /* You are playing with fire by working for Bodhi's vampire guild. Do not lower your guard even for a moment while you are in their domain, as treachery is part of their nature. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.LostSoul.1    // CHARNAME has lost his soul
    SAY @10206 /* I share the loss of your soul, my <PRO_LADYLORD>, as I am in a similar predicament. However, not all hope is lost. You are alive and what has been done can almost always be undone. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.LostSoul.2    // CHARNAME has lost his soul
    SAY @10207 /* Your soul may be gone, but it is not yet lost. Being alive means that you still share a connection with it. Let it guide you and you will surely reach your goal. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.LostSoul.3    // CHARNAME has lost his soul
    SAY @10208 /* How are you doing, my <PRO_LADYLORD>? I can feel you are getting weaker with every step you take. */
    + ~NumInPartyGT(1)~ + @10209 /* You are right. I can already feel the effects of my missing soul. */ DO ~SetGlobal("A7TalkAboutLostSoul", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.LostSoul.3.1
    + ~NumInParty(1)~ + @10209 /* You are right. I can already feel the effects of my missing soul. */ DO ~SetGlobal("A7TalkAboutLostSoul", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.LostSoul.3.2
    ++ @10210 /* Don't worry, I can manage a nuisance such as this. */ DO ~SetGlobal("A7TalkAboutLostSoul", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.LostSoul.3.3
  END

  IF ~~ TalkGeneric.Advice.Specific.LostSoul.3.1
    SAY @10211 /* You can count on me, my <PRO_LADYLORD>. I will support you in your search for your soul as best I can. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.LostSoul.3.2
    SAY @10212 /* You can count on me, my <PRO_LADYLORD>. I will support you in your search for your soul as best I can and I am sure your companions will too. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.LostSoul.3.3
    SAY @10213 /* So you want to play the hero? Very well, I am confident that you will survive your current condition. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.IrenicusGoal.1    // CHARNAME knows about Irenicus' true intent
    SAY @10214 /* I am amazed how easily this Irenicus was able to take over ancient Suldanessellar. I doubt he would have done it as quickly without intimate knowledge about the town and their people. */
    = @10215 /* Elves have always been very secretive about their objectives in the past. Judging from Elhan's responses I am convinced nothing has changed in that regard. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.IrenicusGoal.2    // CHARNAME knows about Irenicus' true intent
    SAY @10216 /* This Irenicus seems to leave a trail of devastation in his wake wherever he goes. I fear for the well-being of elven nature itself if he is not to be stopped soon. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Melissan.1    // speculating about Melissan and her plans (before Gromnir's defeat)
    SAY @10217 /* I am still pondering over Melissan's interest in you and all the other Bhaalspawns. She must be an intelligent and powerful woman to know how to deal with their erratic behavior. */
    = @10218 /* Yet she brought Gromnir Il-Khan and his men to Saradush knowing full well what they are capable of doing. She still remains a mystery to me. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Melissan.2    // speculating about Melissan and her plans (after Yaga-Shura is dead)
    SAY @10219 /* Melissan claims to be a benefactor of the Bhaalspawns, yet she did nothing to prevent the destruction of Saradush and the Bhaalspawns within. It would have been well within her powers to prevent the disaster. */
    = @10220 /* I am beginning to wonder about any ulterior motives behind her solicitous demeanor. */
    ++ @10221 /* Do you suspect she might be a Bhaalspawn too? */ DO ~SetGlobal("A7TalkAboutMelissan", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.Melissan.2.1
    ++ @10222 /* Could you be more precise about your suspicions? */ DO ~SetGlobal("A7TalkAboutMelissan", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.Melissan.2.2
    ++ @10223 /* I think you are overanalyzing the situation. The ferocity of the attacks have caught her off guard as much as everyone else. */ DO ~SetGlobal("A7TalkAboutMelissan", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.Melissan.2.3
  END

  IF ~~ TalkGeneric.Advice.Specific.Melissan.2.1
    SAY @10224 /* Possibly. At the very least, it would explain her unusual decision to collect all minor Bhaalspawns within the walls of Saradush. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Melissan.2.2
    SAY @10225 /* Not at the moment, she is still a mystery to me. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Melissan.2.3
    SAY @10226 /* I hope you are right, my <PRO_LADYLORD>. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Melissan.3    // speculating about Melissan and her plans (after CHARNAME saw a vision of Melissan being detained)
    SAY @10227 /* If the visions we have seen can be believed, then Melissan is no Bhaalspawn at all. That makes her meddlings into the Bhaalspawn affairs even more suspicious. */
    = @10228 /* Maybe this Balthazar can give us a satisfactory answer in this matter. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Yaga.1    // about Yaga-Shura
    SAY @10229 /* Yaga-Shura's supposed invincibility is surely no result of Bhaal's powers. It is much more likely that sorcerous forces are behind it. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Yaga.2    // about Yaga-Shura
    SAY @10230 /* Even without his Bhaalspawn powers a fire giant like Yaga-Shura will be a formidable foe. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Abazigal.1    // about Abazigal
    SAY @10231 /* Abazigal is supposed to be related to the dragon kind. If that is true then you have to watch out for his Bhaalspawn powers and his dragon kind abilities as well. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Sendai.1    // about Sendai
    SAY @10232 /* Although Sendai is a drow, her special origins have surely made her an outcast, as drow see all others, even the non-purebred drow, as inferior. */
    = @10233 /* You will likely have to deal with more than the usual drow forces if you want to deal with her. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Balthazar.1    // about Balthazar
    SAY @10234 /* This Balthazar appears to be a trained monk. Maybe there will be a chance to reason with him if his mental discipline is able to keep Bhaal's chaotic nature in check. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.Balthazar.2    // about Balthazar
    SAY @10235 /* Monks have trained their mind and body to surpass human limits. This Balthazar may be even more powerful than Abazigal and Sendai together. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.SolarDream.1    // about CHARNAME's dream-like situations with the Solar
    SAY @10236 /* For a moment I felt myself detached from time and space, shortly after Bhaal's essence left Yaga-Shura's body. */
    = @10237 /* It was a very unique experience. Do you have an explanation for it? */
    ++ @10238 /* The Solar summoned me to teach me something about myself. It was a very strange experience, almost like a dream. */ DO ~SetGlobal("A7TalkAboutSolarDream", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.SolarDream.1.1
    ++ @10239 /* I had a dream-like experience, but I can't make head nor tail of it. */ DO ~SetGlobal("A7TalkAboutSolarDream", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.SolarDream.1.2
    ++ @10240 /* No, nothing special happened. You've probably imagined things. */ DO ~SetGlobal("A7TalkAboutSolarDream", "GLOBAL", 1)~ + TalkGeneric.Advice.Specific.SolarDream.1.3
  END

  IF ~~ TalkGeneric.Advice.Specific.SolarDream.1.1
    SAY @10241 /* So your lessons have already begun. You should take some time and reflect about what has happened, my <PRO_LADYLORD>. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.SolarDream.1.2
    SAY @10242 /* I am sure it was more than a dream. You should take some time and reflect about what has happened, my <PRO_LADYLORD>. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.SolarDream.1.3
    SAY @10243 /* Well, if you say so? */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Advice.Specific.SolarDream.2    // about CHARNAME's dream-like situations with the Solar (after Melissan's true self has been revealed)
    SAY @10244 /* Your recent encounter with the Solar has revealed some truly disturbing news. If her revelations can be believed, then we have all been deceived by Melissan's disguise. */
    = @10245 /* Even I could not detect any falsehood in her being despite her suspicious behavior in Saradush. */
    + ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.Lamp.PC.2
    + ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + @10044 /* Thanks for your advice. */ + TalkGeneric.PC.1
  END


  // *** Store/Retrieve items ***
  IF ~~ TalkGeneric.Store.1
    SAY @10246 /* Of course, be my guest. */
    IF ~~ DO ~StartStore("A7AFQINV", LastTalkedToBy(Myself))~ EXIT
  END

  IF ~~ TalkGeneric.Store.2
    SAY @10247 /* You can not tell from the outside, but the interior of my lamp is a miniature version of my home, the Elemental Plane of Air, without any form of exit. Although you can call me forth, I am always bound to that place, unable to break through the dimensional barrier completely. */
    IF ~~ + TalkGeneric.Store.4
  END

  IF ~~ TalkGeneric.Store.3
    SAY @10248 /* You can not tell from the outside, but the interior of my lamp is a miniature version of my home, the Elemental Plane of Air. */
    IF ~~ + TalkGeneric.Store.4
  END

  IF ~~ TalkGeneric.Store.4
    SAY @10249 /* My equipment and other items in my possession are influenced by the lamp's enchantment as well. That is why even large objects can easily enter or leave the lamp. */
    ++ @10250 /* So you have a lot of space in there, haven't you? */ + TalkGeneric.Store.5
  END

  IF ~~ TalkGeneric.Store.5
    SAY @10251 /* Yes, I have. Why do you ask, my <PRO_LADYLORD>? */
    ++ @10252 /* Can I put some of my gear into your care? */ + TalkGeneric.Store.6
  END

  IF ~~ TalkGeneric.Store.6
    SAY @10253 /* That is no problem at all. Please keep in mind though that I am unable to help you while I am inside my lamp. */
    = @10254 /* I would also strongly advise you against putting the djinni lamp into my care. Without it in your possession you will not be able to call me forth anymore. */
    IF ~~ DO ~SetGlobal("A7AfaaqStore", "GLOBAL", 1) StartStore("A7AFQINV", LastTalkedToBy(Myself))~ EXIT
  END


  // *** Afaaq tells CHARNAME something about himself ***
  IF ~~ TalkGeneric.AboutMe.FirstTime
    SAY @10255 /* Of course, my <PRO_LADYLORD>. I am sure you have many questions about my people or myself. */
    = @10256 /* First and foremost however, I should tell you something about that curious artifact you have in your possession. */
    IF ~~ DO ~SetGlobal("A7AfaaqToldAboutHimself", "GLOBAL", 1)~ + TalkGeneric.AboutMe.FirstTime.2
  END

  IF ~~ TalkGeneric.AboutMe.FirstTime.1
    SAY @10257 /* Sure, why not? */
    IF ~~ + TalkGeneric.AboutMe.FirstTime.2
  END

  IF ~~ TalkGeneric.AboutMe.FirstTime.2
    SAY @10258 /* As you can see, I am bound to a magical lamp. It is my home, my prison and my sanctuary. */
    = @10259 /* Whenever I am badly hurt, I will retreat there and recover from my wounds. It will not take too long, I can assure you. */
    = @10260 /* If I am in good health, you can call me forth by removing the plug from my lamp. I will also come from or go into the lamp whenever you ask me. Do not be shy to talk to me even while I am in there, I can hear you quite well. */
    + ~Global("AfaaqLight", "LOCALS", 0)~ + @10261 /* I'd like to know more about you. */ + TalkGeneric.AboutMe
    ++ @10262 /* Thanks for your time, that is all I wanted to know. */ + TalkGeneric.AboutMe.Finished
  END

  IF ~~ TalkGeneric.AboutMe
    SAY @10263 /* Of course! What do you want to know, my <PRO_LADYLORD>? */
    + ~Global("AfaaqLight", "LOCALS", 0) GlobalLT("BanterPCAboutGenies", "LOCALS", 2)~ + @10264 /* Can you tell me about your people? */ + TalkGeneric.AboutMe.Djinns.Denied
    + ~Global("AfaaqLight", "LOCALS", 0) GlobalGT("BanterPCAboutGenies", "LOCALS", 1)~ + @10264 /* Can you tell me about your people? */ + TalkGeneric.AboutMe.Djinns
   // + ~Global("AfaaqLight", "LOCALS", 0)~ + ~Can you tell me something about your life?~ + TalkGeneric.AboutMe.Biography
    ++ @10025 /* Can you tell me about your abilities? */ + TalkGeneric.AboutMe.Stats
    ++ @10265 /* On second thought, I don't have the time for this. */ + TalkGeneric.AboutMe.Finished.1
  END

  IF ~~ TalkGeneric.AboutMe.1
    SAY @10266 /* Do you want to know more? */
    + ~Global("AfaaqLight", "LOCALS", 0) GlobalLT("BanterPCAboutGenies", "LOCALS", 2)~ + @10267 /* Can you tell me more about your people? */ + TalkGeneric.AboutMe.Djinns.Denied
    + ~Global("AfaaqLight", "LOCALS", 0) GlobalGT("BanterPCAboutGenies", "LOCALS", 1)~ + @10267 /* Can you tell me more about your people? */ + TalkGeneric.AboutMe.Djinns
   // + ~Global("AfaaqLight", "LOCALS", 0)~ + ~Can you tell me more about your life?~ + TalkGeneric.AboutMe.Biography
    ++ @10268 /* Can you tell me more about your abilities? */ + TalkGeneric.AboutMe.Stats
    ++ @10262 /* Thanks for your time, that is all I wanted to know. */ + TalkGeneric.AboutMe.Finished
  END

  // Talking about djinn culture
  IF ~~ TalkGeneric.AboutMe.Djinns.Denied
    SAY @10473 /* I am loath to tell outsiders of our culture or history. Maybe later when we know each other better. */
    IF ~~ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Djinns
    SAY @10269 /* I can tell you much about our origins, our history and our culture. What do you know about my people, my <PRO_LADYLORD>? */
    + ~Global("A7TalkAboutCultureImpressed", "GLOBAL", 0) CheckStatGT(Player1, 16, WIS)~ + @10270 /* I have considerable knowledge about your kind. The djinn are genies from the Elemental Plane of Air. They founded the Calim Empire ages ago and battled against an army of efreets, resulting in the creation of the Calim Desert. */ DO ~SetGlobal("A7TalkAboutCultureImpressed", "GLOBAL", 1) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~ + TalkGeneric.AboutMe.Djinns.History.5
    + ~Global("A7TalkAboutCultureImpressed", "GLOBAL", 1) CheckStatGT(Player1, 16, WIS)~ + @10270 /* I have considerable knowledge about your kind. The djinn are genies from the Elemental Plane of Air. They founded the Calim Empire ages ago and battled against an army of efreets, resulting in the creation of the Calim Desert. */ + TalkGeneric.AboutMe.Djinns.History.5
    + ~CheckStatGT(Player1, 12, WIS) CheckStatLT(Player1, 17, WIS)~ + @10271 /* I have head of them. The djinni is a genie from the Elemental Plane of Air and one of their more commonly known powers is to grant wishes to mortals, am I right? */ + TalkGeneric.AboutMe.Djinns.History.4
    + ~CheckStatGT(Player1, 8, WIS) CheckStatLT(Player1, 13, WIS)~ + @10272 /* I have heard of them. Aren't they the kind of genies that grant wishes? */ + TalkGeneric.AboutMe.Djinns.History.3
    + ~CheckStatGT(Player1, 8, WIS)~ + @10273 /* Truthfully, I don't know much about them. */ + TalkGeneric.AboutMe.Djinns.History.2
    + ~CheckStatLT(Player1, 9, WIS)~ + @10273 /* Truthfully, I don't know much about them. */ + TalkGeneric.AboutMe.Djinns.History.1
  END
  
  IF ~~ TalkGeneric.AboutMe.Djinns.History.1
    SAY @10274 /* I thought so. You do not strike me as the intellectual kind of <PRO_RACE>. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.2
    SAY @10275 /* Really? You do not strike me as a <PRO_RACE> who neglected <PRO_HISHER> studies. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.3
    SAY @10276 /* It saddens me that our kind is only known for its rather unimportant power to grant wishes. You are right, however. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.4
    SAY @10277 /* You are right, our people hail from the Elemental Plane of Air. In fact, many of our kind still live there. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.5
    SAY @10278 /* I am impressed by your knowledge about us, my <PRO_LADYLORD>. You are right, a great number of our people travelled to the prime material plane millennia ago and settled in the region known as Calimshan in this day and age. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.6
    SAY @10279 /* We are the djinn, genies of the Elemental Plane of Air. Eons ago, long before the dawn of the mortal races, our kind aided the primordials in their ancient battle with the gods over control of Faerun. Most of the primordials had been destroyed or banished from Toril in the course of the war and many of my kind were imprisoned in common objects and scattered all over the plane. */
    = @10280 /* Many ages ago a large group of djinn, led by our great leader Calim, travelled to Faerun and founded the Calim Empire. This event has been recorded in your history books as "The Great Arrival". In a short time we had built large cities and proceeded to expand our domain to the south and west of the Marching Mountains. */
    = @10281 /* Unfortunately, our progress had suffered a setback when we were attacked by a flight of dragons. As a result, our leader Calim led a campaign against the dragons of the Marching Mountains and returned victorious a couple of decades later. */
    ++ @10282 /* (Eagerly listen to his story...) */ + TalkGeneric.AboutMe.Djinns.History.8
    ++ @10283 /* (yawn) Oh, I'm sorry...please go on. */ + TalkGeneric.AboutMe.Djinns.History.8
    ++ @10284 /* It sounds like you witnessed those events first-hand? */ + TalkGeneric.AboutMe.Djinns.History.7
    ++ @10285 /* Very interesting, but let's talk about something else. */ + TalkGeneric.AboutMe
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.7
    SAY @10286 /* I see you have paid attention. You are right, my <PRO_LADYLORD>, I was a soldier in the service of a lesser caliph at that time. The whole court followed Calim to Faerun. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.8
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.8
    SAY @10287 /* Our empire, reigned by the noble Calim, flourished for millennia. Only minor skirmishes with the neighboring races and the haughty marids threatened our rule at times. */
    = @10288 /* However, a millennia or two later a series of events led to our downfall. Our enemies the efreets, led by their leader Memnon, moved against us. The following war lasted centuries and destroyed much of our empire. */
    = @10289 /* Eventually, a group of elven high mages intervened and managed to capture both Calim and Memnon, along with a great number of djinn and efreet. They disembodied our leaders and bound their essences to the sky and earth which created a region now called the Calim Desert. */
    = @10290 /* Our people along with the half-breeds and genasi were chased away or imprisoned into magical artifacts. I was fortunate to escape relatively unscathed. */
    ++ @10291 /* (Continue intently listening to his story...) */ + TalkGeneric.AboutMe.Djinns.History.11
    + ~Global("A7TalkAboutCalimshan", "GLOBAL", 0)~ + @10292 /* Did you also take part in this terrible war, Afaaq? */ + TalkGeneric.AboutMe.Djinns.History.10
    + ~Global("A7TalkAboutCalimshan", "GLOBAL", 1)~ + @10292 /* Did you also take part in this terrible war, Afaaq? */ + TalkGeneric.AboutMe.Djinns.History.9
    ++ @10293 /* (snore) ...uh, what? Ah yes, I'm still listening. */ + TalkGeneric.AboutMe.Djinns.1
    ++ @10285 /* Very interesting, but let's talk about something else. */ + TalkGeneric.AboutMe
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.9
    SAY @10294 /* Yes, I did. I was a soldier at that time. */
    = @10295 /* The battlefield was nothing you would see in this day and age. The air was charged with powerful magics to the point that it pierced the fabric of reality itself. You must understand that it happened long before the fall of Netheril. Even your most powerful spells would not compare in the least to the magics wielded in those battles. */
    = @10296 /* The toll of life on both sides was unimaginable. Beings such as us genies are merely cast back into the void only to re-emerge some time later in our respective plane of origin. The majority of combatants were mortal however, and even a great many immortal beings had been enslaved or imprisoned into magical artifacts in the course of the war. */
    = @10297 /* Although I survived the war relatively unscathed, it changed the very core of my existence forever... */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.11
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.10
    SAY @10298 /* Yes, but I do not want to talk about it. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.History.11
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.History.11
    SAY @10299 /* In the following centuries, many of our people returned to our home or founded their own empires somewhere on or above Faerun, hidden from the curious eyes of mortals. */
    = @10300 /* Others are still bound to artifacts waiting to be released one day. A great many of them have been discovered and misused by you mortals, hence it is commonly known that we are able to grant wishes to your kind. */
    ++ @10301 /* A fascinating story. Do you mind telling me more about your culture, Afaaq? */ + TalkGeneric.AboutMe.Djinns.Culture.1
    ++ @10302 /* (yawn) Your long-winded and weary talk reminds me of the classes I had to attend in Candlekeep. */ + TalkGeneric.AboutMe.Djinns.1
   // ++ ~Very interesting. Do you mind telling me about your part in the story?~ + TalkGeneric.AboutMe.Biography
    ++ @10303 /* (snore) zzz... (yawn) ...oh, you are finished already? */ + TalkGeneric.AboutMe.Djinns.1
    ++ @10285 /* Very interesting, but let's talk about something else. */ + TalkGeneric.AboutMe
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.1
    SAY @10304 /* Hmm, what can I tell you... Do you know something about our social structures? */
    + ~CheckStatGT(Player1, 17, WIS)~ + @10305 /* I know that your people are ruled by the Grand Caliph. There are also lesser caliphs, viziers and other noble djinn who are subject to the Grand Caliph's rule. */ + TalkGeneric.AboutMe.Djinns.Culture.5
    + ~CheckStatGT(Player1, 12, WIS) CheckStatLT(Player1, 18, WIS)~ + @10306 /* I've heard that your people live in grand palaces high above the clouds. */ + TalkGeneric.AboutMe.Djinns.Culture.4
    + ~CheckStatGT(Player1, 12, WIS)~ + @10307 /* No, nothing at all. */ + TalkGeneric.AboutMe.Djinns.Culture.3
    + ~CheckStatLT(Player1, 13, WIS)~ + @10307 /* No, nothing at all. */ + TalkGeneric.AboutMe.Djinns.Culture.2
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.2
    SAY @10308 /* I can imagine that it is no common knowledge to you mortals. We rarely allow outsiders into our homes. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.Culture.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.3
    SAY @10309 /* Are you sure? I thought you might have heard at least bits and pieces about us. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.Culture.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.4
    SAY @10310 /* That is not too far from the truth, my <PRO_LADYLORD>. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.Culture.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.5
    SAY @10311 /* I am amazed how much you know about our people, my <PRO_LADYLORD>. */
    IF ~~ + TalkGeneric.AboutMe.Djinns.Culture.6
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.6
    SAY @10312 /* Our society centers around the Grand Caliph Husam al-Balil ben Nafhat al-Yugayyim, also known as the Master of the Clouds, the Son of the Breezes and by many other titles to other races. */
    = @10313 /* We have been ruled by him since the beginnings of time. You mortals most likely do not know much about him, as he lives in the Court of Ice and Steel within the Elemental Plane of Air. */
    = @10314 /* He is served by various nobles and officials, including lesser caliphs, viziers, beys, emirs, sheiks, sherrifs, and maliks. Most of the djinn in existence were at one time or another in the service of a caliph or other noble. */
    = @10315 /* The word of the Grand Caliph is law. Disobeying him always means death, but a djinni risks punishment even for breaking the laws of the lesser nobles. */
    = @10316 /* That is why many djinn left their home and visited Faerun or other places outside the jurisdiction of the Grand Caliph. */
    + ~OR(2) CheckStatGT(Player1, 15, INT) CheckStatGT(Player1, 15, WIS)~ + @10317 /* Did you leave your home for the same reason? */ + TalkGeneric.AboutMe.Djinns.Culture.7
   // ++ ~Fascinating. Do you mind telling me about your yourself?~ + TalkGeneric.AboutMe.Biography
    ++ @10318 /* An interesting insight into your culture, but let's talk about something else. */ + TalkGeneric.AboutMe
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.Culture.7
    SAY @10319 /* You are very perceptive, my <PRO_LADYLORD>. Our great leader Calim and all who followed him shared a common ideal. Leaving behind our restrictive government was surely part of it. */
   // ++ ~Fascinating. Do you mind telling me about your yourself?~ + TalkGeneric.AboutMe.Biography
    ++ @10318 /* An interesting insight into your culture, but let's talk about something else. */ + TalkGeneric.AboutMe
  END
  

  IF ~~ TalkGeneric.AboutMe.Djinns.1
    SAY @10320 /* If I bore you with my talk you should let me know, my <PRO_LADYLORD>. */
    ++ @10321 /* I have! Didn't you notice? */ + TalkGeneric.AboutMe.Djinns.2
    ++ @10322 /* Not at all, but I didn't sleep much last night. May we continue the lessons at a later time? */ + TalkGeneric.AboutMe.Djinns.3
    ++ @10323 /* Not really, it was quite refreshing. Now that I've rested, let's return to our task. */ + TalkGeneric.AboutMe.Djinns.2
    ++ @10324 /* I'm sorry, I didn't mean to bother you with my snoring. */ + TalkGeneric.AboutMe.Djinns.2
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.2
    SAY @10325 /* (Hmpf) If you are through with your fun, we may continue our journey. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.AboutMe.Djinns.3
    SAY @10326 /* Yes, that is probably for the best. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END


  // Talking about his skills
  IF ~~ TalkGeneric.AboutMe.Stats
    SAY @10471 /* What do you want to know about me? */
    ++ @10332 /* Can you tell me again how you can help me in my adventures? */ + TalkGeneric.AboutMe.FirstTime.1
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10472 /* Can you tell me about your skills? */ + TalkGeneric.AboutMe.Stats.Skills.1
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10472 /* Can you tell me about your skills? */ + TalkGeneric.AboutMe.Stats.Skills.2
    ++ @10339 /* Can you tell me about your powers? */ + TalkGeneric.AboutMe.Stats.Powers
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Skills.1
    SAY @10327 /* As you wish. Firstly, I will present you a short summary of my skills... */
    = @60022    // My character stats: ...
    = @10328 /* As you can see, I am skilled in both using swords and magic. My current predicament limits my abilities, however. Being a djinni grants me a couple of additional traits as well. */
    = @10329 /* I can see in the dark and tolerate magical or electrical energies to a certain degree. */
    = @10330 /* Furthermore, my link to the lamp allows me to slowly recover from my wounds. However, I would be grateful if you could spare a healing potion or two in times of need. As I have told you before, I will recover much faster when I am within the lamp. */
    = @10331 /* The traditional weapon of choice for most djinn is the scimitar. My own blade is magically attuned to my soul, therefore I can control how it will affect my targets. Because of my current predicament, I can not show you its true powers, however. */
    ++ @10332 /* Can you tell me again how you can help me in my adventures? */ + TalkGeneric.AboutMe.FirstTime.1
    ++ @10333 /* What can you tell me about your powers? */ + TalkGeneric.AboutMe.Stats.Powers
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Skills.2
    SAY @10327 /* As you wish. Firstly, I will present you a short summary of my skills... */
    = @60023    // My (improved) character stats: ...
    = @10335 /* Thanks to your help, I can finally display my full potential in both using swords and magic. Being a djinni grants me a couple of additional traits as well. */
    = @10336 /* I can see in the dark and am highly impervious to magical and electrical energies. */
    = @10337 /* Furthermore, I have the ability to slowly recover from my wounds. However, I would be grateful if you could spare a healing potion or two in times of need. As I have told you before, I will recover much faster when I am within the lamp. */
    = @10338 /* The traditional weapon of choice for most djinn is the scimitar. My own blade is magically attuned to my soul, therefore I can control how it will affect my targets. Being in full control of my soul, my scimitar can show its true powers once again. An opponent hit by the weapon has to suffer electrical damage in addition to the scimitar's slashing damage, and has a small chance to be stunned for one round. */
    ++ @10332 /* Can you tell me again how you can help me in my adventures? */ + TalkGeneric.AboutMe.FirstTime.1
    ++ @10339 /* Can you tell me about your powers? */ + TalkGeneric.AboutMe.Stats.Powers
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers
    SAY @10340 /* I have gained a number of unique abilities in my time on and beyond the prime material plane. What power do you want me to talk about? */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    SAY @10347 /* Granting wishes is probably the best known power of the djinn kind. My current predicament, however, limits it considerably. */
    = @10348 /* I am able to grant you wishes which enable you to alter reality in a limited manner. The right wording is of utmost importance, however. An unwise person will more often than not meet with disaster when asking for a wish. */
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.Wish
    SAY @10352 /* Granting wishes is probably the best known power of the djinn kind. You can choose how strongly your wish can alter reality. */
    = @10353 /* A limited wish will alter reality centered around yourself. A powerful wish, however, can lead to global disaster, if not worded correctly. I will trust in your sense of responsibility when you ask for a wish. */
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.Invisibility
    SAY @10354 /* Being born from the chaotic forces of air, I am blessed with the power to turn invisible at will. */
    = @10355 /* The effect will stay active for about eight hours. However, it can be dispelled by magical means or I may reveal myself when I interact with the world around me. */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    SAY @10356 /* I am able to raise a small whirlwind in a controlled manner which is centered around myself. Being a creature of air, I have full control over it, naturally. Therefore I can choose how it affects my surrounding. */
    = @10357 /* As a result, I will concentrate its power only on creatures with hostile intent. The wind can blow around smaller chunks of debris damaging or even blinding nearby creatures. */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    SAY @10358 /* Being in full control of myself, I have the power to raise whirlwinds which can move around on their own. Each whirlwind can travel freely across the area, damaging or even blinding nearby enemies in their way. */
    = @10359 /* Since whirlwinds are extensions of myself, I can control them even if they move out of my visual range. */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.Haste
    SAY @10360 /* The ability to increase my movement has been granted by the very air itself. It will increase almost all aspects of movement caused by my physical body. */
    = @10361 /* Therefore I can move faster as well as increase my attack speed. The effect will last for about an hour. */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.AirShield
    SAY @10362 /* I have witnessed that your kind has learned how to cast elemental shields of fire. */
    = @10363 /* My people have learned to raise magical shields of air around them. They provide both protection and a means to harm attackers. */
    = @10364 /* A shield of air makes me immune to all kinds of electrical damage and partially shields me from missiles, and magical and physical damage. */
    = @10365 /* Additionally, each time I am physically attacked, the shield attempts to retaliate against the attacker within a certain radius. */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10346 /* Can you tell me more about your power to control Air Elementals? */ + TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  IF ~~ TalkGeneric.AboutMe.Stats.Powers.ControlElemental
    SAY @10366 /* Our close link to the elemental forces of air has given us the power to exercise limited control over beings born out of it. */
    = @10367 /* Air Elementals are self-aware entities, born out of the forces of the Elemental Plane of Air. I have the power to bring them under my control for a short time. */
    = @10368 /* Opposing elementals are usually protected against that kind of attack by their summoners. As a result, I will not always be successful in my attempts. */
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.LimitedWish
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10341 /* Can you tell me more about your power to grant wishes? */ + TalkGeneric.AboutMe.Stats.Powers.Wish
    ++ @10342 /* Can you tell me more about your innate power to turn invisible? */ + TalkGeneric.AboutMe.Stats.Powers.Invisibility
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 0)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.Whirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10349 /* Can you tell me more about your whirlwind power? */ + TalkGeneric.AboutMe.Stats.Powers.GreaterWhirlwind
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10350 /* Can you tell me more about your power to haste yourself? */ + TalkGeneric.AboutMe.Stats.Powers.Haste
    + ~Global("A7AfaaqUpgraded", "GLOBAL", 1)~ + @10351 /* Can you tell me more about your Air Shield power? */ + TalkGeneric.AboutMe.Stats.Powers.AirShield
    ++ @10334 /* Let's talk about something else. */ + TalkGeneric.AboutMe.1
  END

  // Finished talking about himself
  IF ~~ TalkGeneric.AboutMe.Finished
    SAY @10369 /* It was a pleasure talking to you. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.AboutMe.Finished.1
    SAY @10370 /* Suit yourself! */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END


  // *** Summon Afaaq ***
  IF ~~ TalkGeneric.Summon.1
    SAY @10257 /* Sure, why not? */
    IF ~~ DO ~ApplySpellRES("A7AFQSMN", Myself)~ EXIT
  END

  IF ~~ TalkGeneric.Summon.2
    SAY @10371 /* That is not possible at the moment. I still need some time to recover from my injuries. */
    IF ~~ + TalkGeneric.Lamp.PC.2
  END

  IF ~~ TalkGeneric.Summon.3
    SAY @10372 /* I am unable to do that in this place. My magic is being sucked away. */
    IF ~~ + TalkGeneric.Lamp.PC.2
  END


  // *** Unsummon Afaaq ***
  IF ~~ TalkGeneric.UnsummonDenied
    SAY @10373 /* The djinni begins to concentrate but nothing happens. Maybe he doesn't sense his magical lamp which is notably absent from your backpack. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.Unsummon
    SAY @10374 /* The djinni begins to concentrate and after a few moments he vanishes into thin air. Only a faint glow inside his lamp remains. */
    IF ~~ DO ~SetGlobal("unsummoning","LOCALS",1) ClearActions(Myself)~ EXIT
  END


  // *** Battle scripts ***
  IF ~~ TalkGeneric.BattlePassive
    SAY @10375 /* Alright, I will stay out of the action. */
    IF ~~ DO ~SetGlobal("AfaaqActive", "LOCALS", 0) ChangeAIScript("A7AFATK", DEFAULT) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.BattleActive
    SAY @10376 /* Sure, I will enter the heat of battle on my own. */
    IF ~~ DO ~SetGlobal("AfaaqActive", "LOCALS", 1) ChangeAIScript("A7AFATK2", DEFAULT) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.BattleSemiActive
    SAY @10476 /* Sure, I will take care of myself if necessary. */
    IF ~~ DO ~SetGlobal("AfaaqActive", "LOCALS", 2) ChangeAIScript("A7AFATK3", DEFAULT) ClearActions(Myself)~ EXIT
  END


  // *** Afaaq's Stats ***
  IF ~~ TalkGeneric.TellStats.1
    SAY @60022    // My character stats: (weak version) ...
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.TellStats.2
    SAY @60023    // My character stats: (strong version) ...
    IF ~~ + TalkGeneric.PC.1
  END


  // *** Curing and healing ***
  IF ~~ TalkGeneric.CuringAsked
    SAY @10377 /* Yes, I could use an antidote. */
    + ~StateCheck(Myself, STATE_POISONED) HasItem("POTN20", Player1)~ + @10378 /* Here, take this Antidote. */ + TalkGeneric.Curing1
    + ~OR(2) StateCheck(Myself, STATE_POISONED) StateCheck(Myself, STATE_DISEASED) HasItem("POTN17", Player1)~ + @10379 /* Here, take this Elixir of Health. */ + TalkGeneric.Curing2
    ++ @10380 /* I don't have a spare antidote, sorry. */ + TalkGeneric.HealingNone
  END

  IF ~~ TalkGeneric.Curing1
    SAY @10381 /* Thank you, my <PRO_LADYLORD>. */
    IF ~~ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("CurePotion", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.Curing2
    SAY @10382 /* Thank you very much, my <PRO_LADYLORD>. */
    IF ~~ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("ExtraCurePotion", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.HealingAsked
    SAY @10383 /* Yes, if you have one to spare? */
    + ~HasItem("POTN08", Player1)~ + @10384 /* This Potion of Healing should heal your injuries. */ + TalkGeneric.Healing
    + ~HasItem("POTN52", Player1)~ + @10385 /* This Potion of Extra Healing should heal your injuries. */ + TalkGeneric.HealingExtra
    + ~HasItem("POTN55", Player1)~ + @10386 /* This Potion of Superior Healing should heal your injuries. */ + TalkGeneric.HealingSuperior
    ++ @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.HealingNone
  END

  IF ~~ TalkGeneric.Healing
    SAY @10388 /* Thank you. I accept your offer. */
    IF ~~ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("HealingPotion", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.HealingExtra
    SAY @10389 /* Thank you very much. I accept your offer. */
    IF ~~ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("ExtraHealingPotion", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.HealingSuperior
    SAY @10390 /* Thank you. I accept your generous offer. */
    IF ~~ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("SuperiorHealingPotion", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.HealingNone
    SAY @10391 /* (sigh) Then I have to manage without it. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions
    SAY @10392 /* Yes, if you have some to spare? */
    + ~HasItem("POTN08", Player1) NumItemsLT("POTN08", "A7Afaaq", 5)~ + @10393 /* I can give you Potions of Healing. */ + TalkGeneric.StoreHealingPotions.2a
    + ~HasItem("POTN08", Player1) NumItemsGT("POTN08", "A7Afaaq", 4)~ + @10393 /* I can give you Potions of Healing. */ + TalkGeneric.StoreHealingPotions.2b
    + ~HasItem("POTN52", Player1) NumItemsLT("POTN52", "A7Afaaq", 5)~ + @10394 /* I can give you Potions of Extra Healing. */ + TalkGeneric.StoreHealingPotions.3a
    + ~HasItem("POTN52", Player1) NumItemsGT("POTN52", "A7Afaaq", 4)~ + @10394 /* I can give you Potions of Extra Healing. */ + TalkGeneric.StoreHealingPotions.3b
    + ~HasItem("POTN55", Player1) NumItemsLT("POTN55", "A7Afaaq", 5)~ + @10395 /* I can give you Potions of Superior Healing. */ + TalkGeneric.StoreHealingPotions.4a
    + ~HasItem("POTN55", Player1) NumItemsGT("POTN55", "A7Afaaq", 4)~ + @10395 /* I can give you Potions of Superior Healing. */ + TalkGeneric.StoreHealingPotions.4b
    + ~HasItem("POTN20", Player1) NumItemsLT("POTN20", "A7Afaaq", 5)~ + @10396 /* I can give you Antidote potions. */ + TalkGeneric.StoreHealingPotions.5a
    + ~HasItem("POTN20", Player1) NumItemsGT("POTN20", "A7Afaaq", 4)~ + @10396 /* I can give you Antidote potions. */ + TalkGeneric.StoreHealingPotions.5b
    + ~HasItem("POTN17", Player1) NumItemsLT("POTN17", "A7Afaaq", 5)~ + @10397 /* I can give you Elixirs of Help. */ + TalkGeneric.StoreHealingPotions.6a
    + ~HasItem("POTN17", Player1) NumItemsGT("POTN17", "A7Afaaq", 4)~ + @10397 /* I can give you Elixirs of Help. */ + TalkGeneric.StoreHealingPotions.6b
    + ~OR(3) HasItem("POTN08", "A7Afaaq") HasItem("POTN52", "A7Afaaq") HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1a
    + ~!HasItem("POTN08", "A7Afaaq") !HasItem("POTN52", "A7Afaaq") !HasItem("POTN55", "A7Afaaq") ~    + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1b
  END

  IF ~~ TalkGeneric.StoreHealingPotions.1a
    SAY @10398 /* Then I have to manage with the remaining potions in my possession. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.1b
    SAY @10399 /* Then I have to manage without it. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.2a
    SAY @10400 /* How many potions can you give me? */
    + ~NumItemsPartyGT("POTN08", 0) NumItemsLT("POTN08", "A7Afaaq", 5)~ + @10401 /* I can give you one Potion of Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveHealingPotion", "LOCALS", 1))~ + TalkGeneric.StoreHealingPotions.2.1
    + ~NumItemsPartyGT("POTN08", 1) NumItemsLT("POTN08", "A7Afaaq", 4)~ + @10402 /* I can give you two Potions of Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveHealingPotion", "LOCALS", 2))~ + TalkGeneric.StoreHealingPotions.2.1
    + ~NumItemsPartyGT("POTN08", 2) NumItemsLT("POTN08", "A7Afaaq", 3)~ + @10403 /* I can give you three Potions of Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveHealingPotion", "LOCALS", 3))~ + TalkGeneric.StoreHealingPotions.2.1
    + ~NumItemsPartyGT("POTN08", 3) NumItemsLT("POTN08", "A7Afaaq", 2)~ + @10404 /* I can give you four Potions of Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveHealingPotion", "LOCALS", 4))~ + TalkGeneric.StoreHealingPotions.2.1
    + ~NumItemsPartyGT("POTN08", 4) NumItemsLT("POTN08", "A7Afaaq", 1)~ + @10405 /* I can give you five Potions of Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveHealingPotion", "LOCALS", 5))~ + TalkGeneric.StoreHealingPotions.2.1
    + ~OR(3) HasItem("POTN08", "A7Afaaq") HasItem("POTN52", "A7Afaaq") HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1a
    + ~!HasItem("POTN08", "A7Afaaq") !HasItem("POTN52", "A7Afaaq") !HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1b
  END

  IF ~~ TalkGeneric.StoreHealingPotions.2b
    SAY @10406 /* Thank you my <PRO_LADYLORD>, but I have already a good number of healing potions in my possession. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.2.1
    SAY @10388 /* Thank you. I accept your offer. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.StoreHealingPotions.3a
    SAY @10400 /* How many potions can you give me? */
    + ~NumItemsPartyGT("POTN52", 0) NumItemsLT("POTN52", "A7Afaaq", 5)~ + @10407 /* I can give you one Potion of Extra Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraHealingPotion", "LOCALS", 1))~ + TalkGeneric.StoreHealingPotions.3.1
    + ~NumItemsPartyGT("POTN52", 1) NumItemsLT("POTN52", "A7Afaaq", 4)~ + @10408 /* I can give you two Potions of Extra Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraHealingPotion", "LOCALS", 2))~ + TalkGeneric.StoreHealingPotions.3.1
    + ~NumItemsPartyGT("POTN52", 2) NumItemsLT("POTN52", "A7Afaaq", 3)~ + @10409 /* I can give you three Potions of Extra Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraHealingPotion", "LOCALS", 3))~ + TalkGeneric.StoreHealingPotions.3.1
    + ~NumItemsPartyGT("POTN52", 3) NumItemsLT("POTN52", "A7Afaaq", 2)~ + @10410 /* I can give you four Potions of Extra Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraHealingPotion", "LOCALS", 4))~ + TalkGeneric.StoreHealingPotions.3.1
    + ~NumItemsPartyGT("POTN52", 4) NumItemsLT("POTN52", "A7Afaaq", 1)~ + @10411 /* I can give you five Potions of Extra Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraHealingPotion", "LOCALS", 5))~ + TalkGeneric.StoreHealingPotions.3.1
    + ~OR(3) HasItem("POTN08", "A7Afaaq") HasItem("POTN52", "A7Afaaq") HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1a
    + ~!HasItem("POTN08", "A7Afaaq") !HasItem("POTN52", "A7Afaaq") !HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1b
  END

  IF ~~ TalkGeneric.StoreHealingPotions.3b
    SAY @10412 /* Thank you my <PRO_LADYLORD>, but I have already a good number of extra healing potions in my possession. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.3.1
    SAY @10389 /* Thank you very much. I accept your offer. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.StoreHealingPotions.4a
    SAY @10400 /* How many potions can you give me? */
    + ~NumItemsPartyGT("POTN55", 0) NumItemsLT("POTN55", "A7Afaaq", 5)~ + @10413 /* I can give you one Potion of Superior Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveSuperHealingPotion", "LOCALS", 1))~ + TalkGeneric.StoreHealingPotions.4.1
    + ~NumItemsPartyGT("POTN55", 1) NumItemsLT("POTN55", "A7Afaaq", 4)~ + @10414 /* I can give you two Potions of Superior Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveSuperHealingPotion", "LOCALS", 2))~ + TalkGeneric.StoreHealingPotions.4.1
    + ~NumItemsPartyGT("POTN55", 2) NumItemsLT("POTN55", "A7Afaaq", 3)~ + @10415 /* I can give you three Potions of Superior Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveSuperHealingPotion", "LOCALS", 3))~ + TalkGeneric.StoreHealingPotions.4.1
    + ~NumItemsPartyGT("POTN55", 3) NumItemsLT("POTN55", "A7Afaaq", 2)~ + @10416 /* I can give you four Potions of Superior Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveSuperHealingPotion", "LOCALS", 4))~ + TalkGeneric.StoreHealingPotions.4.1
    + ~NumItemsPartyGT("POTN55", 4) NumItemsLT("POTN55", "A7Afaaq", 1)~ + @10417 /* I can give you five Potions of Superior Healing. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveSuperHealingPotion", "LOCALS", 5))~ + TalkGeneric.StoreHealingPotions.4.1
    + ~OR(3) HasItem("POTN08", "A7Afaaq") HasItem("POTN52", "A7Afaaq") HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1a
    + ~!HasItem("POTN08", "A7Afaaq") !HasItem("POTN52", "A7Afaaq") !HasItem("POTN55", "A7Afaaq") ~ + @10387 /* I don't have a spare healing potion, sorry. */ + TalkGeneric.StoreHealingPotions.1b
  END

  IF ~~ TalkGeneric.StoreHealingPotions.4b
    SAY @10418 /* Thank you my <PRO_LADYLORD>, but I have already a good number of superior healing potions in my possession. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.4.1
    SAY @10390 /* Thank you. I accept your generous offer. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.StoreHealingPotions.5a
    SAY @10400 /* How many potions can you give me? */
    + ~NumItemsPartyGT("POTN20", 0) NumItemsLT("POTN20", "A7Afaaq", 5)~ + @10419 /* I can give you one Antidote potion. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveCurePotion", "LOCALS", 1))~ + TalkGeneric.StoreHealingPotions.5.1
    + ~NumItemsPartyGT("POTN20", 1) NumItemsLT("POTN20", "A7Afaaq", 4)~ + @10420 /* I can give you two Antidote potions. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveCurePotion", "LOCALS", 2))~ + TalkGeneric.StoreHealingPotions.5.1
    + ~NumItemsPartyGT("POTN20", 2) NumItemsLT("POTN20", "A7Afaaq", 3)~ + @10421 /* I can give you three Antidote potions. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveCurePotion", "LOCALS", 3))~ + TalkGeneric.StoreHealingPotions.5.1
    + ~NumItemsPartyGT("POTN20", 3) NumItemsLT("POTN20", "A7Afaaq", 2)~ + @10422 /* I can give you four Antidote potions. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveCurePotion", "LOCALS", 4))~ + TalkGeneric.StoreHealingPotions.5.1
    + ~NumItemsPartyGT("POTN20", 4) NumItemsLT("POTN20", "A7Afaaq", 1)~ + @10423 /* I can give you five Antidote potions. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveCurePotion", "LOCALS", 5))~ + TalkGeneric.StoreHealingPotions.5.1
    ++ @10424 /* I don't have a spare antidote potion, sorry. */ + TalkGeneric.StoreHealingPotions.1b
  END

  IF ~~ TalkGeneric.StoreHealingPotions.5b
    SAY @10425 /* Thank you my <PRO_LADYLORD>, but I have already a good number of antidote potions in my possession. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.5.1
    SAY @10381 /* Thank you, my <PRO_LADYLORD>. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.StoreHealingPotions.6a
    SAY @10400 /* How many potions can you give me? */
    + ~NumItemsPartyGT("POTN17", 0) NumItemsLT("POTN17", "A7Afaaq", 5)~ + @10426 /* I can give you one Elixir of Health. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraCurePotion", "LOCALS", 1))~ + TalkGeneric.StoreHealingPotions.6.1
    + ~NumItemsPartyGT("POTN17", 1) NumItemsLT("POTN17", "A7Afaaq", 4)~ + @10427 /* I can give you two Elixirs of Health. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraCurePotion", "LOCALS", 2))~ + TalkGeneric.StoreHealingPotions.6.1
    + ~NumItemsPartyGT("POTN17", 2) NumItemsLT("POTN17", "A7Afaaq", 3)~ + @10428 /* I can give you three Elixirs of Health. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraCurePotion", "LOCALS", 3))~ + TalkGeneric.StoreHealingPotions.6.1
    + ~NumItemsPartyGT("POTN17", 3) NumItemsLT("POTN17", "A7Afaaq", 2)~ + @10429 /* I can give you four Elixirs of Health. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraCurePotion", "LOCALS", 4))~ + TalkGeneric.StoreHealingPotions.6.1
    + ~NumItemsPartyGT("POTN17", 4) NumItemsLT("POTN17", "A7Afaaq", 1)~ + @10430 /* I can give you five Elixirs of Health. */ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("GiveExtraCurePotion", "LOCALS", 5))~ + TalkGeneric.StoreHealingPotions.6.1
    ++ @10424 /* I don't have a spare antidote potion, sorry. */ + TalkGeneric.StoreHealingPotions.1b
  END

  IF ~~ TalkGeneric.StoreHealingPotions.6b
    SAY @10431 /* Thank you my <PRO_LADYLORD>, but I have already a good number of elixirs in my possession. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.StoreHealingPotions.6.1
    SAY @10382 /* Thank you very much, my <PRO_LADYLORD>. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END


  // *** Say Goodbye ***
  IF ~~ TalkGeneric.Lamp.Bye
    SAY @10432 /* See you later. */
    IF ~~ EXIT
  END

  IF ~~ TalkGeneric.Bye
    SAY @10433 /* Until next time. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END


  // *** No Wish today ***
  IF ~~ TalkGeneric.Wish.Deny
    SAY @10434 /* I am sorry, my <PRO_LADYLORD>. But you have to wait a while longer before I am able to grant you a wish. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END


  // *** Limited Wish ***
  IF ~~ TalkGeneric.LimitedWish.1
    SAY @10435 /* I will grant you a limited wish. You may ask for a wish I can repeat, or you may ask for a wish that will happen once only. Decide. */
    ++ #58536 /* A repeatable wish. */ + TalkGeneric.LimitedWish.12
    ++ #58537 /* A one time wish. */ + TalkGeneric.LimitedWish.2
    ++ #58584 /* I reconsider. I will make no wish at this time. */ + TalkGeneric.LimitedWish.22
  END

  IF ~~ TalkGeneric.LimitedWish.2
    SAY #58538 /* ~Choose wisely then, as I can perform each of these tasks once and once only. ~ */
    ++ #58539 /* ~Actually, I'd rather have a repeatable wish.~ */ + TalkGeneric.LimitedWish.12
    ++ #58540 /* ~I don't want a wish of any kind right now.~ */ + TalkGeneric.LimitedWish.22
    + ~Global("AfaaqLight", "LOCALS", 0) See("trskin01") Global("TrisLeave", "GLOBAL", 0) Global("A7WishRestoreRaissa","GLOBAL",0)~ + @11266 /* I wish Raissa's curse of the skin dancer to be removed. */ + TalkGeneric.LimitedWish.24
    + ~CheckStatGT(LastTalkedToBy, 9, WIS) Global("wishRich","GLOBAL",0)~ + #58541 /* ~I wish to be rich.~ */ + TalkGeneric.LimitedWish.3
    + ~CheckStatGT(LastTalkedToBy, 10, WIS) Global("wishArmor","GLOBAL",0)~ + #58542 /* ~I wish for a powerful magical item.~ */ + TalkGeneric.LimitedWish.6
    + ~CheckStatGT(LastTalkedToBy, 3, WIS) Global("wishXP","GLOBAL",0)~ + #58543 /* ~I wish to be more experienced.~ */ + TalkGeneric.LimitedWish.7
    + ~CheckStatGT(LastTalkedToBy, 11, WIS) Global("wishGlasses","GLOBAL",0)~ + #58544 /* ~I wish to see all as it really is.~ */ + TalkGeneric.LimitedWish.11
    + ~CheckStatGT(LastTalkedToBy, 9, WIS) Global("wishQuest","GLOBAL",0) !Dead("dennis") !Global("DennisHasGong","GLOBAL",1) Global("InToB", "GLOBAL", 0)~ + #58545 /* ~I wish for an adventure like none I've ever experienced before.~ */ + TalkGeneric.LimitedWish.23
    + ~CheckStatGT(LastTalkedToBy, 13, WIS) Global("wishTime","GLOBAL",0)~ + #58546 /* ~I wish for control over time.~ */ + TalkGeneric.LimitedWish.9
    + ~CheckStatGT(LastTalkedToBy, 5, WIS) Global("wishShape","GLOBAL",0)~ + #58547 /* ~I wish to be anything I desire.~ */ + TalkGeneric.LimitedWish.10
    + ~CheckStatGT(LastTalkedToBy, 9, WIS) Global("wishContigency","GLOBAL",0)~ + #58548 /* ~I wish to be prepared for anything.~ */ + TalkGeneric.LimitedWish.5
    + ~CheckStatGT(LastTalkedToBy, 11, WIS) Global("wishWail","GLOBAL",0)~ + #58549 /* ~I wish that all my enemies will die.~ */ + TalkGeneric.LimitedWish.4
  END

  IF ~~ TalkGeneric.LimitedWish.3
    SAY #58551 /* ~Rich you want, then rich you shall be.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Rich", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.4
    SAY #58552 /* ~Then let your enemies fall now!~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Wail", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.5
    SAY #58553 /* ~Contingencies are the key to preparation.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Contigency", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.6
    SAY #58554 /* ~Then you shall have it.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Armor", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.7
    SAY #58556 /* ~(chuckle)  Fight well and experience you will earn.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_XP", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.9
    SAY #58558 /* ~Time is now your ally, Master.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Time", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.10
    SAY #58559 /* ~I give you then the ability to shapechange...use it wisely for it will not last forever.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Shape", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.11
    SAY #58560 /* ~With these glasses no item will be beyond your ability to comprehend.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Glasses", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.12
    SAY #58561 /* ~Choose then, but be aware that unwise wishes shall leave the wisher wanting.~ */
    + ~CheckStatGT(LastTalkedToBy, 9, WIS)~ + #58562 /* ~I wish for my entire party to be healed.~ */ + TalkGeneric.LimitedWish.13
    + ~CheckStatLT(LastTalkedToBy, 10, WIS)~ + #58563 /* ~I wish that none of my party would die of their wounds.~ */ + TalkGeneric.LimitedWish.14
    + ~CheckStatGT(LastTalkedToBy, 15, WIS)~ + #58564 /* ~I wish that spells I have cast would be restored, that I might cast them again!~ */ + TalkGeneric.LimitedWish.15
    + ~CheckStatLT(LastTalkedToBy, 16, WIS)~ + #58565 /* ~I wish for my spells to be restored!~ */ + TalkGeneric.LimitedWish.16
    + ~CheckStatGT(LastTalkedToBy, 11, WIS)~ + #58566 /* ~I wish to make my party invulnerable.~ */ + TalkGeneric.LimitedWish.17
    + ~CheckStatLT(LastTalkedToBy, 12, WIS)~ + #58567 /* ~I wish that magic would fail to affect me or my party.~ */ + TalkGeneric.LimitedWish.18
    ++ #58568 /* ~I wish to summon a horde to overrun my enemies.~ */ + TalkGeneric.LimitedWish.19
    + ~CheckStatGT(LastTalkedToBy, 9, WIS)~ + #58569 /* ~I wish to be protected from the undead.~ */ + TalkGeneric.LimitedWish.20
    + ~CheckStatLT(LastTalkedToBy, 10, WIS)~ + #58570 /* ~I wish to be protected from undead right now.~ */ + TalkGeneric.LimitedWish.21
    ++ #58571 /* ~I want to ask for a one time wish instead.~ */ + TalkGeneric.LimitedWish.2
    ++ #58572 /* ~I do not want a wish now~ */ + TalkGeneric.LimitedWish.22
  END

  IF ~~ TalkGeneric.LimitedWish.13
    SAY #58573 /* ~Then all shall be healed. ~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_Heal", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.14
    SAY #58574 /* ~Granted.  All will die of other afflictions, but not of the wounds they have. ~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_DieWounds", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.15
    SAY #58575 /* ~Then I shall grant your wish and restore some of your lost spells.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_SpellMemorize", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.16
    SAY #58576 /* ~Granted. Your spells have been restored to the way they were before you memorized them. ~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_SpellLose", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.17
    SAY #58577 /* ~Invulnerability you shall have!~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_Invulnerable", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.18
    SAY #58578 /* ~A curious request, but consider it granted. None of your spells shall function. ~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_MagicFail", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.19
    SAY #58579 /* ~A horde?  As you wish...~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_Horde", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.20
    SAY #58580 /* ~Protection granted.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_ProtUndead", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.21
    SAY #58581 /* Protection from undead granted, and I shall have to summon some undead for you to be protected from. */
    IF ~~ DO ~CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishR_ProtUndeadSum", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.22
    SAY @10436 /* Very well then. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.LimitedWish.23
    SAY @10474 /* ~Soon you will have your quest, my <PRO_LADYLORD>.~ */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Quest", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END

  IF ~~ TalkGeneric.LimitedWish.24
    SAY @11267 /* Granted. Raissa's curse will been removed. */
    IF ~~ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreatureObject("A7AFQWSH", "TRSKIN01", 0, 0, 0) ActionOverride("A7AFQWSH", SetGlobal("WishO_Raissa", "LOCALS", 1)) ClearActions(Myself)~ EXIT
  END


  // *** Wish ***
  IF ~~ TalkGeneric.Wish.Select.1
    SAY @10437 /* Are you interested in a limited or a more powerful Wish? */
    ++ @10438 /* I'd like to choose a Limited Wish. */ + TalkGeneric.LimitedWish.1
    ++ @10439 /* I'd like to choose a Wish. */ + TalkGeneric.Wish.1
    ++ #58584 /* I reconsider. I will make no wish at this time. */ + TalkGeneric.LimitedWish.22
  END

  IF ~~ TalkGeneric.Wish.1
    SAY @10440 /* I will grant you a wish. But choose wisely, for I will carry out your wishes literally. */
    IF ~~ + TalkGeneric.Wish.2
  END

  IF ~~ TalkGeneric.Wish.2
    SAY @10441 /* You describe to the djinni your thoughts as accurately as possible. */
    IF ~~ + TalkGeneric.Wish.3
  END

  IF ~~ TalkGeneric.Wish.3
    SAY @10442 /* Afaaq listens to you closely and writes down everything you tell him. */
    IF ~~ + TalkGeneric.Wish.4
  END

  IF ~~ TalkGeneric.Wish.4
    SAY @10443 /* After a while his list is completed and he presents to you a summary of your ideas. */
    IF ~~ + TalkGeneric.Wish.5
  END

  IF ~~ TalkGeneric.Wish.5
    SAY @10444 /* Very well, my <PRO_LADYLORD>. I can interpret the items listed here in the following ways. Choose carefully which you would prefer. */
    + ~Global("WishPower01", "GLOBAL", 1)~ + #72526 /* ~'Breach' on everyone in the area, including the party.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power01", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower02", "GLOBAL", 1)~ + #72527 /* ~Blow all people, including party members, away from the caster.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power02", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower03", "GLOBAL", 1)~ + #72528 /* ~Heal everyone, party members and enemies included.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power03", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower04", "GLOBAL", 1)~ + #72529 /* ~Temporarily set Strength to 18 for everyone in the area, including enemies.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power04", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower05", "GLOBAL", 1)~ + #72530 /* ~'Miscast Magic' on everyone in the area, including party members.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power05", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower06", "GLOBAL", 1)~ + #72531 /* ~'Magic Resistance' on everyone in the area, including enemies.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power06", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower07", "GLOBAL", 1)~ + #72532 /* ~'Abi-Dalzim's Horrid Wilting' on everyone in the area, including the party.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power07", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower08", "GLOBAL", 1)~ + #72533 /* ~Everyone in the area, both party members and enemies, become intoxicated.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power08", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower09", "GLOBAL", 1)~ + #72534 /* ~Incur bad luck on everyone in the area, including party members.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power09", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower10", "GLOBAL", 1)~ + #72535 /* ~'Silence' on everyone in the area, including party members.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power10", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower11", "GLOBAL", 1)~ + #72536 /* ~'Haste' everyone in the area, including enemies.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power11", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower12", "GLOBAL", 1)~ + #72537 /* ~'Improved Haste' on all party members.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power12", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower13", "GLOBAL", 1)~ + #72538 /* ~'Breach' on all enemies in the area.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power13", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower14", "GLOBAL", 1)~ + #72539 /* ~'Restoration' on all party members.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power14", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower15", "GLOBAL", 1)~ + #72541 /* ~Raise all party members' characteristics to 25 for 4 rounds.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power15", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower16", "GLOBAL", 1)~ + #72542 /* ~'Resurrection' on all dead party members.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power16", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower17", "GLOBAL", 1)~ + #72543 /* ~All party members gain the temporary ability 'Greater Deathblow'.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power17", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower18", "GLOBAL", 1)~ + #72545 /* ~All party members gain the temporary ability 'Hardiness'.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power18", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower19", "GLOBAL", 1)~ + #72546 /* ~Create a random wand in caster's inventory.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power19", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower20", "GLOBAL", 1)~ + #72547 /* ~Create a random potion in the caster's inventory.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power20", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower21", "GLOBAL", 1)~ + #72548 /* ~Make it as if the entire party has just rested a full night and re-memorized all their spells.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power21", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower22", "GLOBAL", 1)~ + #72549 /* ~Cast a double-length 'Time Stop' and 'Improved Alacrity' on the caster.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power22", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower23", "GLOBAL", 1)~ + #72550 /* ~Heal all enemies in the area.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power23", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower24", "GLOBAL", 1)~ + #72551 /* ~'Improved Haste' on all enemies in the area.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power24", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower25", "GLOBAL", 1)~ + #72552 /* ~Summon an extra hostile monster into the area.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power25", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower26", "GLOBAL", 1)~ + #72553 /* ~Level Drain two levels from each party member.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power26", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower27", "GLOBAL", 1)~ + #72554 /* ~Temporarily remove half of the caster's HP.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power27", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower28", "GLOBAL", 1)~ + #72555 /* ~Temporarily remove 15% of all party members' HPs.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power28", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower29", "GLOBAL", 1)~ + #72556 /* ~Caster loses all memorized spells.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power29", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower30", "GLOBAL", 1)~ + #72557 /* ~Party loses 10,000 gp.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power30", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower31", "GLOBAL", 1)~ + #72558 /* ~Bring a 'Meteor Swarm' down upon the caster.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power31", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower32", "GLOBAL", 1)~ + #72559 /* ~Temporarily reduce the Strength of all party members to 3.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power32", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower33", "GLOBAL", 1)~ + #72560 /* ~Temporarily reduce the Wisdom of all party members to 3.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power33", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower34", "GLOBAL", 1)~ + #72561 /* ~Temporarily reduce the Constitution of all party members to 3.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power34", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower35", "GLOBAL", 1)~ + #72562 /* ~Temporarily reduce the Dexterity of all party members to 3.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power35", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower36", "GLOBAL", 1)~ + #72563 /* ~Temporarily reduce the Intelligence of all party members to 3.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power36", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower37", "GLOBAL", 1)~ + #72564 /* ~'Slow' the entire party.~ */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power37", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower38", "GLOBAL", 1)~ + @10445 /* Globe of Blades on the caster. */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power38", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~Global("WishPower39", "GLOBAL", 1)~ + @10446 /* Party gains 10,000 gp. */ DO ~SetGlobalTimer("A7AfaaqWish", "GLOBAL", EIGHT_HOURS) CreateCreature("A7AFQWSH", [-1.-1], 0) ActionOverride("A7AFQWSH", SetGlobal("Wish_Power39", "LOCALS", 1)) ClearActions(Myself)~ EXIT
    + ~RandomNum(66, 6)~ + @10447 /* I wish to lose the game. */ + TalkGeneric.Wish.Lose
    + ~RandomNum(77, 7)~ + @10448 /* I wish to win the game. */ + TalkGeneric.Wish.Win
    + ~CheckStatGT(LastTalkedToBy, 9, WIS)~ + @10449 /* I don't want to choose a wish at this time. */ DO ~ClearActions(Myself)~ + TalkGeneric.Wish.6
    + ~CheckStatLT(LastTalkedToBy, 10, WIS)~ + @10449 /* I don't want to choose a wish at this time. */ DO ~ClearActions(Myself)~ + TalkGeneric.Wish.7
  END

  IF ~~ TalkGeneric.Wish.6
    SAY @10436 /* Very well then. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Wish.7
    SAY @10450 /* Very well. Maybe a Potion of Insight might help. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ + TalkGeneric.Lamp.PC.2
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Wish.Lose
    SAY @10451 /* The djinni smiles to himself before he turns to you. "Are you sure you want to end your journey so soon?" */
    ++ @10452 /* Yes, absolutely. Do it! */ + TalkGeneric.Wish.Lose.1
    ++ @10453 /* I was just kidding. */ + TalkGeneric.Wish.6
  END

  IF ~~ TalkGeneric.Wish.Lose.1
    SAY @10454 /* As you wish. It was nice knowing you. */
    IF ~~ DO ~Kill(Player6) Kill(Player5) Kill(Player4) Kill(Player3) Kill(Player2) Kill(Player1)~ EXIT
  END

  IF ~~ TalkGeneric.Wish.Win
    SAY @10455 /* The djinni smiles to himself before he turns to you. "Are you sure you want to finish your adventure so easily?" */
    ++ @10452 /* Yes, absolutely. Do it! */ + TalkGeneric.Wish.Win.1
    ++ @10453 /* I was just kidding. */ + TalkGeneric.Wish.6
  END

  IF ~~ TalkGeneric.Wish.Win.1
    SAY @10456 /* As you wish. */
    = @10457 /* The djinni lays his eyes on you and concentrates for a moment. After a few moments everything becomes blurry around you... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7cut02")~ EXIT
  END


  // *** Inviting CHARNAME into the lamp ***
  IF ~~ TalkGeneric.Invitation.1
    SAY @10458 /* That is difficult to explain. Think of it as a miniature pocket plane, similar to your own. But it is made to look and feel like a part of the Elemental Plane of Air. */
    = @10459 /* Hmm, why do you not take a look for yourself, <CHARNAME>? I can link you to a projected image of yourself inside the lamp. That is the only way for you to enter the lamp safely. */
    ++ @10257 /* Sure, why not? */ DO ~SetGlobal("LampInvitation", "LOCALS", 1)~ + TalkGeneric.Invitation.3
    ++ @10460 /* No, it's too dangerous. */ DO ~~ + TalkGeneric.Invitation.4
  END

  IF ~~ TalkGeneric.Invitation.2
    SAY @10461 /* Okay, here we go... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7cut01b")~ EXIT
  END

  IF ~~ TalkGeneric.Invitation.3
    SAY @10462 /* Here we go. Brace yourself! */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7cut01a")~ EXIT
  END

  IF ~~ TalkGeneric.Invitation.4
    SAY @10463 /* There is very little risk involved. You can ask me whenever you are ready to go. */
    IF ~~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Invitation.5
    SAY @10462 /* Here we go. Brace yourself! */
    = @10464 /* ??? */
    = @10465 /* No, it does not work. The special nature of your pocket plane prevents me from using some of my own powers. */
    IF ~~ DO ~SetGlobal("LampInvitationPP", "LOCALS", 1)~ + TalkGeneric.PC.1
  END

  IF ~~ TalkGeneric.Invitation.Return
    SAY @10466 /* Very well, I will cut your link to the projected image. This will take only a moment... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7cut01d")~ EXIT
  END


  // Fixing screwed up variables and states
  IF ~~ TalkGeneric.FixStates.1
    SAY @10467 /* I will attempt to do so. Please wait a moment. */
    = @10468 /* ... */
    IF ~~ DO ~SetGlobal("A7AfaaqSummoned", "GLOBAL", 1) SetGlobal("A7AfaaqGaseous", "GLOBAL", 0) ApplySpellRES("A7MISTC", Myself) ChangeEnemyAlly(Myself, FAMILIAR)~ + TalkGeneric.FixStates.2
  END

  IF ~~ TalkGeneric.FixStates.1a
    SAY @10467 /* I will attempt to do so. Please wait a moment. */
    = @10468 /* ... */
    IF ~~ DO ~SetGlobal("A7AfaaqGaseous", "GLOBAL", 0) ChangeEnemyAlly(Myself, FAMILIAR)~ + TalkGeneric.FixStates.2
  END

  IF ~~ TalkGeneric.FixStates.2
    SAY @10469 /* It is done. If you still notice some odd behavior, you should tell my creator. */
    IF ~~ EXIT
  END

  // *** DEBUG: ***
  IF ~~ TalkGeneric.Debug.Upgrade
    SAY @10470 /* The djinni closes his eyes and concentrates for a few moments... */
    IF ~~ DO 
       ~TakeItemReplace("A7DJLMPA", "A7DJLMP", Player1)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("A7afqup1")~ EXIT
  END

END
