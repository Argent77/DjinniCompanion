// *** Dialog portions for the cleric of Waukeen (Quest 5) ***
// Traified

EXTEND_BOTTOM ~AMCLER02~ 0 3 6 10 #1
  + ~GlobalGT("A7Quest5", "GLOBAL", 0) GlobalLT("A7Quest5", "GLOBAL", 10) Global("A7CastProtection", "LOCALS", 0) Global("A7Q5RumorCleric", "GLOBAL", 1) Global("A7SpellOffered", "LOCALS", 0)~
    + @5990 /* I've heard you are skilled in casting protection spells. Can you protect us from great heat like boiling water? */ DO ~SetGlobal("A7Q5RumorCleric", "GLOBAL", 2) SetGlobal("A7SpellOffered", "LOCALS", 1)~ + AMCLER02.1
  + ~GlobalGT("A7Quest5", "GLOBAL", 0) GlobalLT("A7Quest5", "GLOBAL", 10) Global("A7CastProtection", "LOCALS", 0) Global("A7SpellOffered", "LOCALS", 1)~
    + @5991 /* Can you cast your spell of heat protection on my party? */ + AMCLER02.6
  + ~GlobalGT("A7Quest5", "GLOBAL", 0) GlobalLT("A7Quest5", "GLOBAL", 10) GlobalGT("A7CastProtection", "LOCALS", 0)~
    + @5992 /* Can you cast your spell of heat protection on my party again? */ + AMCLER02.6
END

APPEND ~AMCLER02~
  IF ~~ AMCLER02.1
    SAY @5993 /* Yes I can, but why do you need such protection? */
    ++ @5994 /* I want to find out the reason of the tremors and heated water in the smuggler cave. But I need to get to the bottom of the problem, literally, if I want to solve it. */ + AMCLER02.2
  END

  IF ~~ AMCLER02.2
    SAY @5995 /* You are a very brave person if you risk your life to help another. But you are right. I can cast a spell to protect you from any heat, but fire itself. */
    IF ~!Global("A7TemplePlotFight", "GLOBAL", 2) CheckStatLT(LastTalkedToBy, 16, CHR)~ + AMCLER02.3.1
    IF ~!Global("A7TemplePlotFight", "GLOBAL", 2) CheckStatGT(LastTalkedToBy, 15, CHR)~ + AMCLER02.3.2
    IF ~Global("A7TemplePlotFight", "GLOBAL", 2)~ + AMCLER02.3.3
  END

  IF ~~ AMCLER02.3.1
    SAY @5996 /* For the fair price of 300 gold I will cast a protection spell on your party which lasts for eight hours. */
    + ~PartyGoldGT(299)~ + @5997 /* Very well, cast your spell. */ DO ~TakePartyGold(300)~ + AMCLER02.5
    ++ @5998 /* Not at the moment. I will return later. */ + AMCLER02.4
  END

  IF ~~ AMCLER02.3.2
    SAY @5999 /* For the fair price of 200 gold I will cast a protection spell on your party which lasts for eight hours. */
    + ~PartyGoldGT(199)~ + @5997 /* Very well, cast your spell. */ DO ~TakePartyGold(200)~ + AMCLER02.5
    ++ @5998 /* Not at the moment. I will return later. */ + AMCLER02.4
  END

  IF ~~ AMCLER02.3.3
    SAY @6000 /* I've heard you helped defend one of my brothers outside. That was very noble of you. Therefore I offer you my help free of charge. I will cast a protection spell on your party which lasts for eight hours. */
    ++ @5997 /* Very well, cast your spell. */ + AMCLER02.5
  END

  IF ~~ AMCLER02.4
    SAY @6001 /* You may come back whenever you want. */
    = #70362 /* ~May fortune seek you, child.~ */
    IF ~~ EXIT
  END

  IF ~~ AMCLER02.5
    SAY @6002 /* Please stand still for a moment... */
    IF ~~ DO ~SetGlobal("A7CastProtection", "LOCALS", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct2c")~ EXIT
  END

  IF ~~ AMCLER02.6
    SAY @6003 /* Of course, my <SONDAUGHTER>. */
    IF ~CheckStatLT(LastTalkedToBy, 16, CHR)~ + AMCLER02.3.1
    IF ~CheckStatGT(LastTalkedToBy, 15, CHR)~ + AMCLER02.3.2
  END
END
