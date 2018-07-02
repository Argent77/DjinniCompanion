// *** Greed Trial: Enslaved Genie (Bioware version) ***
// Traified

ADD_TRANS_TRIGGER HELLGEN 0 ~OR(2) !Detect("A7Afaaq") StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ DO ~2~
EXTEND_BOTTOM HELLGEN 0
  + ~Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ + #55066 /* ~It shall be relieved by your death!!~ */ + GreedAttack1.1
END

ADD_TRANS_TRIGGER HELLGEN 1 ~OR(3) !PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 0) Global("A7AfaaqSensed", "LOCALS", 1)~
EXTEND_BOTTOM HELLGEN 1
  IF ~PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 1) Global("A7AfaaqSensed", "LOCALS", 0)~ DO ~SetGlobal("A7AfaaqSensed", "LOCALS", 1)~ + AfqIntro.0
END

ADD_TRANS_TRIGGER HELLGEN 2 ~OR(3) !PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 0) Global("A7AfaaqSensed", "LOCALS", 1)~
EXTEND_BOTTOM HELLGEN 2
  IF ~PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 1) Global("A7AfaaqSensed", "LOCALS", 0)~ DO ~SetGlobal("A7AfaaqSensed", "LOCALS", 1)~ + AfqIntro.0
END

ADD_TRANS_TRIGGER HELLGEN 5 ~OR(2) !PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 0)~
EXTEND_BOTTOM HELLGEN 5
  + ~PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 1)~ + @4000 /* So... let me get this straight.  The sword Blackrazor is the key to your release, and Afaaq's, too? */ + 6
END

ADD_TRANS_TRIGGER HELLGEN 6 ~OR(2) !PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 0)~ DO ~0~
ADD_TRANS_TRIGGER HELLGEN 6 ~OR(2) !Detect("A7Afaaq") StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ DO ~1~
EXTEND_BOTTOM HELLGEN 6 #1
  + ~PartyHasItem("MISCBC") PartyHasItem("A7DJLMP") Global("A7AfaaqMet", "GLOBAL", 1)~ + @4001 /* So if I were to give you Blackrazor, you would be able to release Afaaq from his enchantment?  And that would also release you from your punishment? */ + 7
  + ~PartyHasItem("MISCBC") Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ + #55079 /* ~So the sword allows me to kill you, is that it?  That would release you from your punishment?~ */ + GreedAttack2.1
END

ADD_TRANS_TRIGGER HELLGEN 7 ~Global("A7AfaaqIntro", "LOCALS", 0)~ DO ~0~
EXTEND_BOTTOM HELLGEN 7 #2
  + ~GlobalGT("A7AfaaqIntro", "LOCALS", 0)~ + #55082 /* ~But Blackrazor also allows me to kill you, is that right?  That would release you, too.~ */ + GreedAttack2.1
END

ADD_TRANS_TRIGGER HELLGEN 10 ~Global("A7AfaaqIntro", "LOCALS", 0)~
ADD_TRANS_ACTION HELLGEN BEGIN 10 END BEGIN 0 END ~SetGlobal("A7AfaaqUpgradeRefused", "GLOBAL", 1)~
EXTEND_BOTTOM HELLGEN 10
  IF ~GlobalGT("A7AfaaqIntro", "LOCALS", 0)~ THEN DO ~TakePartyItem("MISCBC") GiveItem("MISCB7",LastTalkedToBy) AddexperienceParty(20000) SetGlobal("Player1Greed","GLOBAL",1)~ + AfqHelp.1
END

ADD_TRANS_ACTION HELLGEN BEGIN 11 END BEGIN 0 END ~SetGlobal("A7ResetPositions", "LOCALS", 1)~

ADD_TRANS_TRIGGER HELLGEN 12 ~OR(2) !Detect("A7Afaaq") StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
EXTEND_BOTTOM HELLGEN 12
  IF ~Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ DO ~SetGlobal("Player1Greed","GLOBAL",2) Enemy()~ UNSOLVED_JOURNAL #10250 EXTERN ~A7AFAAQ~ AfqGreed.RefuseFight
END

ADD_TRANS_ACTION HELLGEN BEGIN 14 END BEGIN 0 END ~SetGlobal("A7ResetPositions", "LOCALS", 1)~

ADD_STATE_TRIGGER HELLGEN 15 ~!Global("A7AfaaqIntro", "LOCALS", 1) Global("A7AfaaqUpgrade", "LOCALS", 0) Global("A7GreedWaitForDecision", "GLOBAL", 0)~


APPEND A7AFAAQ
  // *** Afaaq's answer to CHARNAME's decision to fight the greed genie ***
  IF ~~ AfqGreed.RefuseFight
    SAY @4002 /* I will not support your decision, <CHARNAME>. You have to do it without me. */
    IF ~~ DO ~ChangeAIScript("", CLASS) ChangeAIScript("A7AFATKG", DEFAULT) SetDialogue("A7AFAAQG") ChangeEnemyAlly(Myself, NEUTRAL)~ UNSOLVED_JOURNAL @4800 EXIT
  END
END


APPEND HELLGEN
  // *** Afaaq is introduced to the Greed Genie (includes evaluation of friendship path) ***
  IF ~~ THEN BEGIN AfqIntro.0
    SAY @4003 /* But I see that you are already familiar with such a fate, as I sense someone in a situation not unlike my own in your ranks. */
    ++ @4004 /* Yes, Afaaq is his name and he is bound to a magical lamp. */ DO ~SetGlobal("A7AfaaqIntro", "LOCALS", 1)~ + AfqIntro.1
  END

  IF ~~ THEN BEGIN AfqIntro.1
    SAY @4005 /* I am curious about what has brought him into this predicament. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct2a")~ EXIT
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct2b")~ EXIT
  END
END

CHAIN IF ~Global("A7AfaaqIntro", "LOCALS", 1) Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ THEN HELLGEN AfqIntro.2.1
  @4006 /* Greeting Afaaq. I welcome you to my little prison. It would seem that our kind is fated to endure the whims of greater powers. */
  == A7AFAAQ @4007 /* You are right. Yet my prison allows me more freedom, as I am bound to a lamp which <CHARNAME> has with <PRO_HIMHER>. */
  == HELLGEN @4008 /* Yes, I see...  This might open a path to your freedom though. */
  == A7AFAAQ @4009 /* There is nothing I desire more, but how is this possible? */
  == HELLGEN @4010 /* The Child of Bhaal holds power in this realm. Possibly enough power to overcome the enchantments which bind you to the lamp. */
END IF ~~ THEN DO ~SetGlobal("A7AfaaqIntro", "LOCALS", 2)~ EXTERN HELLGEN AfqIntro.3

APPEND HELLGEN
  IF ~Global("A7AfaaqIntro", "LOCALS", 1) OR(2) !Detect("A7Afaaq") StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ AfqIntro.2.2
    SAY @4011 /* He appears to be bound to an artifact of power. Hmm...  this might open a path to his freedom. */
    = @4012 /* You hold power in this realm. Possibly enough power to overcome the enchantments which bind him to the lamp. */
    IF ~~ DO ~SetGlobal("A7AfaaqIntro", "LOCALS", 2)~ + AfqIntro.3
  END

  IF ~~ THEN BEGIN AfqIntro.3
    SAY @4013 /* But there are certain... conditions which hold me here. Unless they are met, I can do nothing. */
    ++ @4014 /* And what conditions might those be? */ + 4
  END
END


// *** CHARNAME decides to slay the greed genie #1 ***
CHAIN HELLGEN GreedAttack1.1
  @4015 /* It shall, indeed.  You have been given the key which allows you to end my life... and that, too, is a release. */
  == A7AFAAQ IF ~Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7GreedConcerned", "AR2903", 0)~ THEN @4016 /* No, <CHARNAME>, do not do this. There must be another way. */ DO ~SetGlobal("A7GreedConcerned", "AR2903", 1)~
EXTERN HELLGEN GreedAttack1.2

APPEND HELLGEN
  IF ~~ THEN BEGIN GreedAttack1.2
    SAY @4017 /* It is your decision, my <PRO_LADYLORD>. */
    ++ @4018 /* Maybe I was too hasty in my decision. There must be another way to release you. Why are you bound to this place? */ + 2
    ++ @4019 /* I have made my decision. Prepare to die! */ + GreedAttack1.3
  END
END

CHAIN HELLGEN GreedAttack1.3
  @4020 /* I welcome death... should you prove able. */ DO ~SetGlobal("Player1Greed","GLOBAL",2) Enemy()~
  == ~A7AFAAQ~ IF ~Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ THEN @4002 /* I will not support your decision, <CHARNAME>. You have to do it without me. */
    DO ~ChangeAIScript("", CLASS) ChangeAIScript("A7AFATKG", DEFAULT) SetDialogue("A7AFAAQG") ChangeEnemyAlly(Myself, NEUTRAL) AddJournalEntry(@4800, QUEST)~
END IF ~~ THEN UNSOLVED_JOURNAL #10250 EXIT


// *** CHARNAME decides to slay the greed genie #1 ***
CHAIN HELLGEN GreedAttack2.1
  #55085 /* ~You do not need the sword, itself, to do that.  The fact that you were given Blackrazor is enough, even if you possess it no longer.  But, yes... that, too, would be a release.~ */
  == A7AFAAQ IF ~Detect("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7GreedConcerned", "AR2903", 0)~ THEN @4016 /* No, <CHARNAME>, do not do this. There must be another way. */ DO ~SetGlobal("A7GreedConcerned", "AR2903", 1)~
EXTERN HELLGEN GreedAttack2.2

APPEND HELLGEN
  IF ~~ THEN BEGIN GreedAttack2.2
    SAY @4017 /* It is your decision, my <PRO_LADYLORD>. */
    ++ @4021 /* Maybe I was too hasty in my decision. There must be another way to release you. Could you please repeat the riddle again? */ + 5
    ++ @4019 /* I have made my decision. Prepare to die! */ + 12
  END


  // *** Greed Genie helps Afaaq ***
  IF ~~ THEN BEGIN AfqHelp.1
    SAY @4022 /* As you have helped me, I will help your companion in turn. */
    = @4023 /* Breaking an enchantment of that kind is no simple task. Do you have anything in your possession which may support my attempt to do so? */
    + ~PartyHasItem("A7MISC6")~ + @4024 /* Yes, I have found a magical crystal which contains the sealed powers of Afaaq. */ + AfqHelp.2
    + ~!PartyHasItem("A7MISC6")~ + @4025 /* I'm afraid not. But you told me of my own powers in this realm... */ + AfqHelp.4
  END

  // Party soulcage
  IF ~~ THEN BEGIN AfqHelp.2
    SAY @4026 /* That is exactly what I was looking for! With direct access to his spiritual essence I am able to break the enchantments of the lamp. */
    IF ~PartyHasItem("A7DJLMP") Global("A7ResetPositions", "LOCALS", 0)~ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 2) TakePartyItem("A7MISC6")~ + AfqHelp.3
    IF ~PartyHasItem("A7DJLMP") Global("A7ResetPositions", "LOCALS", 1)~ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 2) TakePartyItem("A7MISC6")~ + AfqRelease.1
    IF ~!PartyHasItem("A7DJLMP")~ + AfqHelp.10
  END

  IF ~~ THEN BEGIN AfqHelp.3
    SAY @4027 /* The casting will take only a moment... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct3a")~ EXIT
  END

  // Party does NOT have the soulcage
  IF ~~ THEN BEGIN AfqHelp.4
    SAY @4028 /* Yes... you are closely linked to this place. In a way, this place is part of you. */
    = @4029 /* But without the means to access Afaaq's spiritual essence directly, there may be significant risks involved. */
    ++ @4030 /* What risk? What are you trying to do? */ + AfqHelp.5
    + ~PartyHasItem("A7DJLMP") Global("A7ResetPositions", "LOCALS", 0)~ + @4031 /* I will take the risk. Begin your incantations! */ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 1)~ + AfqRelease.3
    + ~PartyHasItem("A7DJLMP") Global("A7ResetPositions", "LOCALS", 1)~ + @4031 /* I will take the risk. Begin your incantations! */ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 1)~ + AfqRelease.1
    + ~!PartyHasItem("A7DJLMP")~ + @4031 /* I will take the risk. Begin your incantations! */ + AfqHelp.10
  END

  IF ~~ THEN BEGIN AfqHelp.5
    SAY @4032 /* Your link to the divine will act as a catalyst to overcome the enchantments of Afaaq's magical prison. If the lamp is guarded by additional enchantments however, they will be projected back to you. */
    = @4033 /* Although I am reasonably sure it will cause no lethal damage, you should be prepared for anything. */
    + ~PartyHasItem("A7DJLMP") Global("A7ResetPositions", "LOCALS", 0)~ + @4031 /* I will take the risk. Begin your incantations! */ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 1)~ + AfqRelease.3
    + ~PartyHasItem("A7DJLMP") Global("A7ResetPositions", "LOCALS", 1)~ + @4031 /* I will take the risk. Begin your incantations! */ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 1)~ + AfqRelease.1
    + ~!PartyHasItem("A7DJLMP")~ + @4031 /* I will take the risk. Begin your incantations! */ + AfqHelp.10
    ++ @4034 /* You ask too much from me. I won't risk my life while I am still looking for my own soul. */ + AfqHelp.6
    ++ @4035 /* This is a difficult decision. Please give me a moment, I still need time to think about it. */ + AfqHelp.8
  END

  IF ~~ THEN BEGIN AfqHelp.6
    SAY @4036 /* Are you sure, my <PRO_LADYLORD>? There will be no second chance once I depart from this place. */
    ++ @4037 /* Yes. My decision is definite. */ + AfqHelp.7
    ++ @4038 /* Maybe I have to think it over again. Could you give me a moment to decide? */ + AfqHelp.8
  END

  IF ~~ THEN BEGIN AfqHelp.7
    SAY @4039 /* As you will. I am free and wish you well in whatever trials you are to face. */
    IF ~~ THEN
      DO ~SetGlobal("A7AfaaqUpgradeRefused", "GLOBAL", 1)
        TakePartyItem("MISCBC")
        GiveItem("MISCB7",LastTalkedToBy)
        AddexperienceParty(20000)
        SetGlobal("Player1Greed","GLOBAL",1)
        CreateVisualEffect("spplanar",[362.918])
        Wait(2)
        DestroySelf()~ EXIT
  END

  IF ~~ THEN BEGIN AfqHelp.8
    SAY @4040 /* I will stay as long as you don't leave this part of the realm. But make a decision soon. */
    IF ~~ DO ~SetGlobal("A7ResetPositions", "LOCALS", 1) SetGlobal("A7GreedWaitForDecision", "GLOBAL", 1)~ UNSOLVED_JOURNAL @4801 EXIT
  END

  // Make a decision on the release of Afaaq
  IF ~Global("A7AfaaqUpgrade", "LOCALS", 0) Global("A7GreedWaitForDecision", "GLOBAL", 1)~ THEN BEGIN AfqHelp.9
    SAY @4041 /* Did you come to a decision yet, my <PRO_LADYLORD>? */
    + ~PartyHasItem("A7DJLMP") PartyHasItem("A7MISC6")~ + @4042 /* I have found this magical crystal which contains the sealed powers of Afaaq. Would this be useful for your spell? */ DO ~SetGlobal("A7GreedWaitForDecision", "GLOBAL", 2)~ + AfqHelp.2
    + ~PartyHasItem("A7DJLMP") !PartyHasItem("A7MISC6")~ + @4031 /* I will take the risk. Begin your incantations! */ DO ~SetGlobal("A7AfaaqUpgrade", "LOCALS", 1) SetGlobal("A7GreedWaitForDecision", "GLOBAL", 2)~ + AfqRelease.1
    + ~!PartyHasItem("A7DJLMP") !PartyHasItem("A7MISC6")~ + @4031 /* I will take the risk. Begin your incantations! */ + AfqHelp.10
    + ~!PartyHasItem("A7MISC6")~ + @4043 /* Yes I did...  I have to turn down your offer. My own well-being is too important to me. */ + AfqHelp.6
    ++ @4044 /* Please give me a moment, I still need time to think about it. */ + AfqHelp.8
  END

  IF ~~ AfqHelp.10
    SAY @4045 /* I do not see Afaaq's magical prison in your possession. Without it I can do nothing for him. */
    ++ @4046 /* I must have misplaced it. Please wait a moment while I'm looking for it. */ DO ~SetGlobal("A7GreedWaitForDecision", "GLOBAL", 1)~ EXIT
  END


  // *** Greed Genie releases Afaaq ***
  IF ~~ AfqRelease.1
    SAY @4047 /* Very good. Let me prepare the spell. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct2c")~ EXIT
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct2d")~ EXIT
  END

  // Break enchantment with soulcage
  IF ~Global("A7PrepareAfaaq", "LOCALS", 1) Global("A7AfaaqUpgrade", "LOCALS", 2)~ AfqRelease.2
    SAY @4048 /* I will begin the casting... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct3a")~ EXIT
  END

  // Break enchantment WITHOUT soulcage
  IF ~~ THEN BEGIN AfqRelease.3
    SAY @4049 /* Very good. I will begin the casting... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct3b")~ EXIT
  END

  IF ~Global("A7PrepareAfaaq", "LOCALS", 1) Global("A7AfaaqUpgrade", "LOCALS", 1)~ AfqRelease.4
    SAY @4048 /* I will begin the casting... */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct3b")~ EXIT
  END

  // After upgrading Afaaq with the soulcage
  IF ~Global("A7SoulcageUsed", "LOCALS", 1) Global("A7AfaaqUpgrade", "LOCALS", 3)~ AfqRelease.5
    SAY @4050 /* It is done. */
    = @4051 /* I thank you again for my release. Good luck in whatever trials you are to face, my <PRO_LADYLORD>. And may your future shine brightly, Afaaq. */
    IF ~~ DO ~ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0)) CreateVisualEffect("spplanar",[362.918]) Wait(2) DestroySelf()~ EXIT
  END

  // After upgrading Afaaq WITHOUT the soulcage
  IF ~Global("A7SoulcageUsed", "LOCALS", 0) Global("A7AfaaqUpgrade", "LOCALS", 3)~ AfqRelease.6
    SAY @4052 /* It is done and you even survived it relatively unscathed. */
    = @4051 /* I thank you again for my release. Good luck in whatever trials you are to face, my <PRO_LADYLORD>. And may your future shine brightly, Afaaq. */
    IF ~~ DO ~ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0)) CreateVisualEffect("spplanar",[362.918]) Wait(2) DestroySelf()~ EXIT
  END
END
