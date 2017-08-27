// *** Banters with Korgan ***
// TODO

// Banter #1
// TODO: Korgan insults Afaaq because he let himself taken prisoner in a magical lamp...
// TODO: Korgan'ize lines
CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 1)~ THEN KORGANJ Korgan.0
  ~Ye're bloody lucky <CHARNAME> took ye wit' us. I were dumpin' a weaklin' as ye at the first opportunity, if I had my way.~ DO ~IncrementGlobal("A7BanterKorgan", "GLOBAL", 1)~
  == A7AFAAQ ~Weakling? I have told you the cause for my plight already.~
  == KORGANJ ~An excuse for the weak. You didn't even try, did you? From your meek reply I gather that I could bash in your skull and you'd apologize for the trouble.~
  == A7AFAAQ ~An excess of emotion often leads to mistakes in battles.~
  == KORGANJ ~Aargh! Don't you want to understand my point? You've got the brains of bloody rothe and the matching lack of temper.~
EXIT

CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 1)~ THEN KORGA25J Korgan.0
  ~(TODO: Korgan insults Afaaq because he let himself taken prisoner in a magical lamp...)~ DO ~IncrementGlobal("A7BanterKorgan", "GLOBAL", 1)~
  == A7AFAAQ ~(TODO: Afaaq doesn't react to the insults...)~
  == KORGA25J ~(TODO: Afaaq's reaction makes Korgan even angrier...)~
EXIT


// Banter #2
CHAIN IF ~Name("Korgan", LastTalkedToBy) Global("A7BanterKorgan", "GLOBAL", 3) Global("BanterActive", "LOCALS", 1)~ THEN A7AFAAQ Korgan.1
  ~(TODO: Afaaq tells Korgan that his ruthless and aggressive behavior reminds him of the rakshasa he had to serve...)~ DO ~IncrementGlobal("A7BanterKorgan", "GLOBAL", 1) RealSetGlobalTimer("A7KorganBanterNPCTimer", "GLOBAL", 3600)~
  == KORGANJ ~(TODO: Korgan is pissed because he has been compared to a pack of animals...)~
  == A7AFAAQ ~(TODO: Afaaq replies with a subtle sting to Korgan's reaction...)~
EXIT

CHAIN IF ~Name("Korgan", LastTalkedToBy) Global("A7BanterKorgan", "GLOBAL", 3) Global("BanterActive", "LOCALS", 1)~ THEN A7AFAAQ Korgan.1
  ~(TODO: Afaaq tells Korgan that his ruthless and aggressive behavior reminds him of the rakshasa he had to serve...)~ DO ~IncrementGlobal("A7BanterKorgan", "GLOBAL", 1) RealSetGlobalTimer("A7KorganBanterNPCTimer", "GLOBAL", 3600)~
  == KORGA25J ~(TODO: Korgan is pissed because he has been compared to a pack of animals...)~
  == A7AFAAQ ~(TODO: Afaaq replies with a subtle sting to Korgan's reaction...)~
EXIT


// Banter #3
CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 5)~ THEN KORGANJ Korgan.2
  ~(TODO: Korgan tries to provoke an emotional reaction from Afaaq by telling him what he would do with him, if he was his slave...)~ DO ~IncrementGlobal("A7BanterKorgan", "GLOBAL", 1) SetGlobal("A7KorganDuel", "GLOBAL", 1) RealSetGlobalTimer("A7KorganDuelTimer", "GLOBAL", 300)~
  == A7AFAAQ ~(TODO: Afaaq reacts calmly as usual...)~
  == KORGANJ ~(TODO: Afaaq's calm behavior infuriates Korgan even further...)~
EXIT

CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 5)~ THEN KORGA25J Korgan.2
  ~(TODO: Korgan tries to provoke an emotional reaction from Afaaq by telling him what he would do with him, if he was his slave...)~ DO ~IncrementGlobal("A7BanterKorgan", "GLOBAL", 1) SetGlobal("A7KorganDuel", "GLOBAL", 1) RealSetGlobalTimer("A7KorganDuelTimer", "GLOBAL", 300)~
  == A7AFAAQ ~(TODO: Afaaq reacts calmly as usual...)~
  == KORGA25J ~(TODO: Afaaq's calm behavior infuriates Korgan even further...)~
EXIT


// Banter #4 (the challenge)
APPEND KORGANJ
  // Korgan challenges Afaaq
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7KorganDuel", "GLOBAL", 2)~ KorganDuel.Challenge.1
    SAY ~Afaaq, ye bloody bastard! Let's see how tough ye really are.~
    IF ~~ DO ~SetGlobal("A7KorganDuel", "GLOBAL", 3) 
        SetGlobal("A7AfaaqInvincible", "GLOBAL", 1)      // Prevent Afaaq from dying or polymorphing
        CreateCreatureOffScreen("A7KDUEL", 0)
        ClearAllActions() 
        LeaveParty() 
        ChangeAIScript("A7KORGAN", OVERRIDE)
        ChangeAIScript("", CLASS)
        ChangeAIScript("", RACE)
        ChangeAIScript("", GENERAL)
        ChangeAIScript("", DEFAULT)
        ChangeEnemyAlly(Myself, GOODBUTBLUE)
        ActionOverride("A7Afaaq", ChangeAIScript("", CLASS))
        ActionOverride("A7Afaaq", ChangeAIScript("", RACE))
        ActionOverride("A7Afaaq", ChangeAIScript("A7AFATKK", DEFAULT))
        ActionOverride("A7Afaaq", RemoveFamiliar())
        ActionOverride("A7Afaaq", ChangeEnemyAlly(Myself, GOODBUTBLUE))
        ApplySpellRES("A7MINHP", Myself)~ EXIT
  END

  // during the fight
  IF WEIGHT #-1 ~Global("A7KorganDuel", "GLOBAL", 3)~ KorganDuel.1
    SAY ~Can't ye see I'm busy, <GIRLBOY>?~
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  // Korgan wins the duel
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) Global("A7KorganDuel", "GLOBAL", 4)~ KorganDuel.Win.1
    SAY ~Har! That's what ye're deservin', ye bloody bastard.~
    = ~C'mon <CHARNAME>, let's move on.~
    IF ~~ DO ~SetGlobal("A7KorganDuel", "GLOBAL", 10)
        SetGlobal("A7AfaaqInvincible", "GLOBAL", 0)
        SetGlobal("A7BanterKorgan", "GLOBAL", 8)
        JoinParty()
        ChangeAIScript("KORGAN", OVERRIDE)
        ChangeAIScript("DEFAULT", CLASS)
        ChangeAIScript("", RACE)
        ChangeAIScript("", GENERAL)
        ChangeAIScript("DPLAYER2", DEFAULT)~ EXIT
  END

  // Korgan loses the duel (before official talk)
  IF WEIGHT #-1 ~Global("A7KorganDuel", "GLOBAL", 5)~ KorganDuel.Lose.2
    SAY ~Hmpf, t'was a lucky blow by him.~
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END
END

APPEND KORGA25J
  // Korgan challenges Afaaq
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7KorganDuel", "GLOBAL", 2)~ KorganDuel.Challenge.1
    SAY ~Afaaq, ye bloody bastard! Let's see how tough ye really are.~
    IF ~~ DO ~SetGlobal("A7KorganDuel", "GLOBAL", 3) 
        SetGlobal("A7AfaaqInvincible", "GLOBAL", 1)      // Prevent Afaaq from dying or polymorphing
        CreateCreatureOffScreen("A7KDUEL", 0)
        ClearAllActions() 
        LeaveParty() 
        ChangeAIScript("A7KORGAN", OVERRIDE)
        ChangeAIScript("", CLASS)
        ChangeAIScript("", RACE)
        ChangeAIScript("", GENERAL)
        ChangeAIScript("", DEFAULT)
        ChangeEnemyAlly(Myself, GOODBUTBLUE)
        ActionOverride("A7Afaaq", ChangeAIScript("", CLASS))
        ActionOverride("A7Afaaq", ChangeAIScript("", RACE))
        ActionOverride("A7Afaaq", ChangeAIScript("A7AFATKK", DEFAULT))
        ActionOverride("A7Afaaq", RemoveFamiliar())
        ActionOverride("A7Afaaq", ChangeEnemyAlly(Myself, GOODBUTBLUE))
        ApplySpellRES("A7MINHP", Myself)~ EXIT
  END

  // during the fight
  IF WEIGHT #-1 ~Global("A7KorganDuel", "GLOBAL", 3)~ KorganDuel.1
    SAY ~Can't ye see I'm busy, <GIRLBOY>?~
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  // Korgan wins the duel
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) Global("A7KorganDuel", "GLOBAL", 4)~ KorganDuel.Win.1
    SAY ~Har! That's what ye're deservin', ye bloody bastard.~
    = ~C'mon <CHARNAME>, let's move on.~
    IF ~~ DO ~SetGlobal("A7KorganDuel", "GLOBAL", 10)
        SetGlobal("A7AfaaqInvincible", "GLOBAL", 0)
        SetGlobal("A7BanterKorgan", "GLOBAL", 8)
        JoinParty()
        ChangeAIScript("KORGAN", OVERRIDE)
        ChangeAIScript("DEFAULT", CLASS)
        ChangeAIScript("", RACE)
        ChangeAIScript("", GENERAL)
        ChangeAIScript("DPLAYER2", DEFAULT)~ EXIT
  END

  // Korgan loses the duel (before official talk)
  IF WEIGHT #-1 ~Global("A7KorganDuel", "GLOBAL", 5)~ KorganDuel.Lose.2
    SAY ~Hmpf, t'was a lucky blow by him.~
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END
END

APPEND A7AFAAQ
  // Afaaq during the fight
  IF ~Global("A7KorganDuel", "GLOBAL", 3)~ THEN AfaaqDuel.1
    SAY ~Please let me finish this fight, <GABBER>.~
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END
END

CHAIN IF ~Name("Korgan", LastTalkedToBy) Global("A7KorganDuel", "GLOBAL", 5)~ THEN A7AFAAQ AfaaqDuel.Win.1
  ~I hope that your curiosity about my strength has been satisfied.~ DO ~SetGlobal("A7KorganDuel", "GLOBAL", 10) SetGlobal("A7AfaaqInvincible", "GLOBAL", 0) SetGlobal("A7KorganRespect", "GLOBAL", 1)~
  == KORGANJ IF ~Global("InToB", "GLOBAL", 0)~ THEN ~Ye've done better than I thought. Ma'be ye aren't such a wimp after all.~ 
      DO ~SetGlobal("A7BanterKorgan", "GLOBAL", 10) JoinParty() ChangeAIScript("KORGAN", OVERRIDE) ChangeAIScript("DEFAULT", CLASS) ChangeAIScript("", RACE) ChangeAIScript("", GENERAL) ChangeAIScript("DPLAYER2", DEFAULT)~
  == KORGA25J IF ~Global("InToB", "GLOBAL", 1)~ THEN ~Ye've done better than I thought. Ma'be ye aren't such a wimp after all.~ 
      DO ~SetGlobal("A7BanterKorgan", "GLOBAL", 10) JoinParty() ChangeAIScript("KORGAN", OVERRIDE) ChangeAIScript("DEFAULT", CLASS) ChangeAIScript("", RACE) ChangeAIScript("", GENERAL) ChangeAIScript("DPLAYER2", DEFAULT)~
EXIT


// Banter #5: One banter after Korgan won the duel
CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 9)~ THEN KORGANJ Korgan.DuelWon
  ~(TODO: Korgan makes fun of Afaaq's impotence and helplessness...)~ DO ~SetGlobal("A7BanterKorgan", "GLOBAL", 256)~
EXIT

CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 9)~ THEN KORGA25J Korgan.DuelWon
  ~(TODO: Korgan makes fun of Afaaq's impotence and helplessness...)~ DO ~SetGlobal("A7BanterKorgan", "GLOBAL", 256)~
EXIT


// Banter #5: One banter after Korgan lost the duel
CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 11)~ THEN KORGANJ Korgan.DuelWon
  ~(TODO: Korgan is surprised to see a glimpse of strength and resolve left in Afaaq and takes back some of his earlier insults...)~ DO ~SetGlobal("A7BanterKorgan", "GLOBAL", 256)~
  == A7AFAAQ ~(TODO: Afaaq doubts his intentions...)~
  == KORGANJ ~(TODO: Korgan assures him that he really means it...)~
EXIT

CHAIN IF ~Global("A7BanterKorgan", "GLOBAL", 11)~ THEN KORGA25J Korgan.DuelWon
  ~(TODO: Korgan is surprised to see a glimpse of strength and resolve left in Afaaq and takes back some of his earlier insults...)~ DO ~SetGlobal("A7BanterKorgan", "GLOBAL", 256)~
  == A7AFAAQ ~(TODO: Afaaq doubts his intentions...)~
  == KORGA25J ~(TODO: Korgan assures him that he really means it...)~
EXIT

