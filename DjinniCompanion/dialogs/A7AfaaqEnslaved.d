// *** Dialog file for the djinni Afaaq after losing the duel with CHARNAME (specialized stuff) ***
// Traified

BEGIN A7AFAAQX

// Afaaq has been enslaved after Irenicus' defeat
IF ~Global("A7AfaaqLeaveParty", "GLOBAL", 4)~ AfqDuel.Lost
  SAY @11002 /* I surrender! You have proven to be the stronger opponent and I will bow to your will. */
  IF ~~ DO ~SetGlobal("A7AfaaqHostile", "GLOBAL", 0)
      SetGlobal("A7AfaaqLeaveParty", "GLOBAL", 10)
      SetGlobal("A7AfaaqEnslaved", "GLOBAL", 1) 
      SetGlobal("AfaaqActive", "LOCALS", 1)
      ChangeAIScript("A7AFAAQ", OVERRIDE)
      ChangeAIScript("A7AFATK2", DEFAULT) 
      ChangeEnemyAlly(Myself, FAMILIAR)
      AddFamiliar()
      EraseJournalEntry(@4800)
      EraseJournalEntry(@4801)
      EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4828 EXIT
END

// Afaaq has been enslaved after Quest 5
IF ~Global("A7Q5ChallengePC", "GLOBAL", 3)~ TalkQ5DjinnBetrayed.Lost
  SAY @11002 /* I surrender! You have proven to be the stronger opponent and I will bow to your will. */
  IF ~~ DO ~SetGlobal("A7AfaaqHostile", "GLOBAL", 0)
      SetGlobal("A7Q5ChallengePC", "GLOBAL", 4)
      SetGlobal("A7AfaaqEnslaved", "GLOBAL", 1) 
      SetGlobal("AfaaqActive", "LOCALS", 1)
      ChangeAIScript("A7AFAAQ", OVERRIDE)
      ChangeAIScript("A7AFATK2", DEFAULT) 
      ChangeEnemyAlly(Myself, FAMILIAR)
      AddFamiliar()~ EXIT
END
