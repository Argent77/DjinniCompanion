// *** Afaaq's temporary dialog after finishing Quest 5 (if Afaaq was part of Karim's group) ***
// Traified

BEGIN A7AFQQ5

IF ~Global("A7Quest5", "GLOBAL", 10) Global("A7Q5Finished", "A77002", 2)~ A7AFQQ5.1
  SAY @6150 /* You have done something very noble, my <PRO_LADYLORD>. I would not have thought you would risk your life for my kind. */
  = @6151 /* Now that sharif Karim has returned home, I am free to persue my own goals. I would be honored if I could join your adventures once more. */
  ++ @6152 /* I would be glad if you could share our company again. */ + A7AFQQ5.2
  ++ @6153 /* I'm sorry, but I'm not interested in you anymore. */ + A7AFQQ5.3
END

IF ~~ A7AFQQ5.2
  SAY @6154 /* Thank you, <CHARNAME>. I am looking forward to fight on you side. */
  = @6155 /* Please take my lamp. I am still bound to it, so that I can enter the heat of battle without the risk to be permanently destroyed. */
  IF ~~ DO ~SetGlobal("A7AfaaqLeaveParty", "GLOBAL", 0) 
      GiveItemCreate("A7DJLMPA", LastTalkedToBy, 0, 0, 0) 
      ChangeEnemyAlly(Myself, FAMILIAR) 
      AddFamiliar()
      SetGlobal("A7AfaaqBanterTimer", "GLOBAL", 0)
      SetGlobal("A7AfaaqBanterNPCTimer", "GLOBAL", 0)
      ChangeAIScript("A7AFAAQ", OVERRIDE)
      ChangeAIScript("A7AFQTLK", CLASS)
      ChangeAIScript("A7AFQLVL", RACE)
      ChangeAIScript("A7AFATK", DEFAULT)
      SetDialogue("A7AFAAQ")~ EXIT
END

IF ~~ A7AFQQ5.3
  SAY @6156 /* That is a pity. I wish you well in your adventures, however, and may your future shine brightly, <CHARNAME>. */
  IF ~~ DO ~StartCutSceneMode() CreateVisualEffectObject("SPPLANAR", Myself) PlaySound("EFF_M09") Wait(2) EndCutSceneMode() DestroySelf()~ EXIT
END
