// *** Afaaq's temporary dialog file after having a duel with CHARNAME ***
// Traified

BEGIN A7AFAAQG

// While CHARNAME is fighting the greed genie
IF ~Global("GreedAfaaqMad", "LOCALS", 0)~ AfqDuel.Passive
  SAY @4200 /* I will not help you. This is your fight alone, <CHARNAME>. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// After CHARNAME killed the greed genie
IF ~Global("GreedAfaaqMad", "LOCALS", 1) Global("A7AfaaqUpgradeRefused", "GLOBAL", 0) GlobalLT("A7GreedWaitForDecision", "GLOBAL", 3)~ AfqDuel.GenieDied.1
  SAY @4201 /* You have killed the genie and missed my only chance to be free from my prison? I can not stand this anymore! */
  IF ~~ DO ~SetGlobal("A7AfaaqHostile", "GLOBAL", 1) ChangeAIScript("", OVERRIDE) ClearActions(Myself) RemoveFamiliar() Enemy()~ EXIT
END

// If CHARNAME refused to upgrade Afaaq
IF ~Global("GreedAfaaqMad", "LOCALS", 1) OR(2) Global("A7AfaaqUpgradeRefused", "GLOBAL", 1) Global("A7GreedWaitForDecision", "GLOBAL", 3)~ AfqDuel.GenieDied.2
  SAY @4202 /* The genie of your Greed Trial had the power to release me from my prison and you have not taken the chance to do so? */
  = @4203 /* You are indeed a selfish creature. I can not stand this anymore! */
  IF ~~ DO ~SetGlobal("A7AfaaqHostile", "GLOBAL", 1) ChangeAIScript("", OVERRIDE) ClearActions(Myself) RemoveFamiliar() Enemy()~ EXIT
END

// After duel lost to CHARNAME
IF ~Global("GreedAfaaqMad", "LOCALS", 2)~ AfqDuel.Lost.1
  SAY @4204 /* I give up! In my present form I am unable to accomplish anything. You have won and I will heed your commands. */
  IF ~~ DO ~SetGlobal("A7AfaaqHostile", "GLOBAL", 0)
      SetGlobal("A7AfaaqEnslaved", "GLOBAL", 1) 
      SetGlobal("AfaaqActive", "LOCALS", 1)
      ChangeAIScript("A7AFAAQ", OVERRIDE)
      ChangeAIScript("A7AFATK2", DEFAULT) 
      SetDialogue("A7AFAAQX") 
      ChangeEnemyAlly(Myself, FAMILIAR)
      AddFamiliar()
      EraseJournalEntry(@3850)
      EraseJournalEntry(@3851)
      EraseJournalEntry(@4800)
      EraseJournalEntry(@4801)
      EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4826 EXIT
END

