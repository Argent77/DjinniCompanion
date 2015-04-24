// *** Dialog portions for the three duergar merchants in the southern region of the Underdark ***
// Traified

// *** Introduction talk to the duergar in human form ***
ADD_TRANS_TRIGGER ~UDDUER03~ 3 ~OR(2) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~
EXTEND_BOTTOM ~UDDUER03~ 3
  IF ~HasItem("A7DJLMP", Player1) GlobalLT("udDrowPlot", "GLOBAL", 9)~ THEN EXTERN ~UDDUER01~ udduer01.1
END

APPEND ~UDDUER01~
  IF ~~ THEN BEGIN udduer01.1
    SAY @3000    // And I'd advice you to avoid the passage behind us. We've accidently stumbled upon a camp of drow warriors a couple of days ago.
    = @3001    // We talked a bit about the current events in this region, but they barred the way to non-drow now. I guess they want to be left alone.
    ++ @3002 /* A drow war party? Do you know why they are here? */
      DO ~SetGlobal("A7Quest3", "GLOBAL", 1) 
        SetGlobal("A7Q3TravelTrigger", "AR2100", 1)
        AddJournalEntry(@3800, QUEST)~ 
        + udduer01.2
    ++ @3003 /* Thanks for the warning, but we have no business with the drow. */
      DO ~SetGlobal("A7Quest3", "GLOBAL", 1) 
        SetGlobal("A7Q3TravelTrigger", "AR2100", 1)
        AddJournalEntry(@3800, QUEST)~ + 10
  END

  IF ~~ THEN BEGIN udduer01.2
    SAY @3004    // I'm afraid not. Drow aren't known to share their knowledge with outsiders.
    IF ~~ + 10
  END
END

// *** Introduction talk to the duergar in drow form ***
ADD_TRANS_TRIGGER ~UDDUER01~ 0 ~OR(2) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~ DO 2
EXTEND_BOTTOM ~UDDUER01~ 0
  IF ~Global("PlayerLooksLikeDrow","GLOBAL",1) 
    !IsValidForPartyDialogue("VICONIA") 
    !IsValidForPartyDialogue("JAHEIRA") 
    !IsValidForPartyDialogue("MINSC") 
    HasItem("A7DJLMP", Player1) 
    GlobalLT("udDrowPlot", "GLOBAL", 9)~ 
    THEN GOTO udduer01.6
END

// modify/add new transition to VICONIJ 141
ADD_TRANS_TRIGGER ~VICONIJ~ 141 ~OR(2) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~
EXTEND_BOTTOM ~VICONIJ~ 141
  IF ~HasItem("A7DJLMP", Player1) GlobalLT("udDrowPlot", "GLOBAL", 9)~ THEN EXTERN ~UDDUER01~ udduer01.6
END

// modify/add new transition to JAHEIRAJ 471
ADD_TRANS_TRIGGER ~JAHEIRAJ~ 471 ~OR(2) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~
EXTEND_BOTTOM ~JAHEIRAJ~ 471
  IF ~HasItem("A7DJLMP", Player1) GlobalLT("udDrowPlot", "GLOBAL", 9)~ THEN EXTERN ~UDDUER01~ udduer01.6
END

// modify/add new transition to UDDUER02 15
ADD_TRANS_TRIGGER ~UDDUER02~ 15 ~Global("A7Quest3", "GLOBAL", 0)~
EXTEND_BOTTOM ~UDDUER02~ 15
  IF ~GlobalGT("A7Quest3", "GLOBAL", 0)~ THEN GOTO udduer02.1
END

// modify/add new transition to UDDUER02 17
ADD_TRANS_TRIGGER ~UDDUER02~ 17 ~OR(2) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~
EXTEND_BOTTOM ~UDDUER02~ 17 
  IF ~HasItem("A7DJLMP", Player1) GlobalLT("udDrowPlot", "GLOBAL", 9)~ THEN EXTERN ~UDDUER01~ udduer01.6
END

// *** Talk with Uder Mordin ***
APPEND ~UDDUER02~
  IF ~~ THEN udduer02.1
    SAY @3014    // Other than the imprisoned mage and the drow encampment I have not seen anything unusual.
    IF ~~ EXIT
  END
END


// *** Talk with Carlig in human form ***
ADD_STATE_TRIGGER ~UDDUER01~ 12 ~OR(3) GlobalGT("A7Quest3", "GLOBAL", 0) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~

APPEND ~UDDUER01~
  IF ~Global("PlayerLooksLikeDrow","GLOBAL",0) Global("A7Quest3", "GLOBAL", 0) HasItem("A7DJLMP", Player1) GlobalLT("udDrowPlot", "GLOBAL", 9)~ THEN BEGIN udduer01.3
    SAY @3005    // Ahh, you are back. Please forgive us, but we are a bit jumpy right now.
    = @3006    // We've accidently stumbled upon a camp of drow warriors a couple of days ago. There in the passage behind our back.
    = @3001    // We talked a bit about the current events in this region, but they barred the way to non-drow now. I guess they want to be left alone.
    ++ @3002 /* A drow war party? Do you know why they are here? */
      DO ~SetGlobal("A7Quest3", "GLOBAL", 1) 
        SetGlobal("A7Q3TravelTrigger", "AR2100", 1)
        AddJournalEntry(@3800, QUEST)~ 
        + udduer01.4
    ++ @3003 /* Thanks for the warning, but we have no business with the drow. */
      DO ~SetGlobal("A7Quest3", "GLOBAL", 1) 
        SetGlobal("A7Q3TravelTrigger", "AR2100", 1)
        AddJournalEntry(@3800, QUEST)~ 
        + 10
  END

  IF ~~ THEN BEGIN udduer01.4
    SAY @3004    // I'm afraid not. Drow aren't known to share their knowledge with outsiders.
    IF ~~ + 10
  END

  IF ~~ THEN BEGIN udduer01.5
    SAY @3007    // Do you require a look at my wares now, or is there something else I can do?
    + ~Global("DrowGuest","GLOBAL",0)~ + #50225 /* ~I'll have a look at what you have.~ */ DO ~StartStore("udduer01",LastTalkedToBy())~ EXIT
    ++ #50226 /* ~Heard anything new about those two people I'm looking for?~ */ + 14
    ++ #50227 /* ~Nothing right now. I'll be going.~ */ + 13
    + ~Global("DrowGuest","GLOBAL",1)~ + #50257 /* ~I'll have a look at what you have.~ */ DO ~StartStore("udduer02",LastTalkedToBy())~ EXIT
  END
END

// *** Talk with Carlig in drow disguise ***
ADD_STATE_TRIGGER ~UDDUER01~ 15 ~OR(3) GlobalGT("A7Quest3", "GLOBAL", 0) !HasItem("A7DJLMP", Player1) GlobalGT("udDrowPlot", "GLOBAL", 8)~

APPEND ~UDDUER01~
  IF ~Global("PlayerLooksLikeDrow", "GLOBAL", 1) Global("A7Quest3", "GLOBAL", 0) HasItem("A7DJLMP", Player1) GlobalLT("udDrowPlot", "GLOBAL", 9)~ THEN BEGIN udduer01.6
    SAY #50233 /* ~M-malla C'rintri, most n-noble of Drow. I, Carlig, a simple trader, welcome your passing. Lolth kyorl dos.~ */
    = @3008    // When want to enter passage in our back, we clear way for you.
    ++ @3009 /* Tell me about this passage and be quick about it. */ + udduer01.7
    ++ #50237 /* ~Spare my language your fumbling tongue. Show me your wares and be quick.~ */ DO ~StartStore("udduer02",LastTalkedToBy())~ EXIT
    ++ #50238 /* ~Have you seen anyone that shouldn't be here? You would know of whom I speak.~ */ + 17
    ++ #50239 /* ~I wish nothing from you, worm. You will be fortunate if my mood remains so.~ */ + 16
  END

  IF ~~ THEN udduer01.7
    SAY @3010    // Of course malla C'rintri. We found camp of drow many days back, in tunnel behind. They ask about affairs in region here.
    = @3011    // But they have locked tunnel now. We can not enter, but you may.
    ++ @3012 /* That's all I wanted to know. I leave you your life. Good bye. */
    DO ~SetGlobal("A7Quest3", "GLOBAL", 1) 
      SetGlobal("A7Q3TravelTrigger", "AR2100", 3)
      AddJournalEntry(@3800, QUEST)~ 
      + 16
  END
END

// *** When talking directly to Finderlig ***
ADD_STATE_TRIGGER ~UDDUER03~ 4 ~Global("A7Quest3", "GLOBAL", 0)~

APPEND ~UDDUER03~
  IF ~Global("PlayerLooksLikeDrow","GLOBAL",0) GlobalGT("A7Quest3", "GLOBAL", 0)~ THEN BEGIN 4
    SAY @3013    // Been pretty busy these last few days. You come through; those other two; and the drow encampment in the back... bad sign, it is.
    ++ #50336 /* ~Why do you say that?~ */ + 5
    ++ #50337 /* ~Yes, for everyone but me.~ */ + 6
    ++ #50338 /* ~You are a superstitious little fellow, aren't you.~ */ + 7
  END
END
