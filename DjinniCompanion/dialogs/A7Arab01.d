// Dialog lines of Xunvrae d'Arabani
// Traified

BEGIN A7ARAB01

// *** If quest not active ***
IF ~OR(3) GlobalLT("A7Quest3", "GLOBAL", 2) GlobalGT("A7Quest3", "GLOBAL", 9) Global("A7ArabaniAttacked", "GLOBAL", 1)~ Arabani.1
  SAY #57214 /* ~Who are these intruders? How did they get past the wards?! Bah! They must be assassins... let us deal with them!~ */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

// *** If not yet spoken to one of the house members ***
IF ~Global("A7Quest3", "GLOBAL", 2) Global("A7ArabaniAttacked", "GLOBAL", 0)~ Arabani.Intro
  SAY @3500 /* Who are you? How dare you address a Matron Mother uninvited? Speak quickly! */
  ++ @3501 /* My name is Veldrin, a favorite of House Despana. I need to discuss a matter of highest urgency. */ + Arabani.Intro.1
  + ~CheckStatGT(LastTalkedToBy, 15, CHR)~ + @3502 /* My name is Veldrin, venerable Matron Mother. I come to warn you about Tathas Melarn of House Melarn. I have learned that he will attack you soon while your armies are preoccupied elsewhere. */ + Arabani.Intro.7
  + ~CheckStatLT(LastTalkedToBy, 16, CHR) CheckStatGT(LastTalkedToBy, 15, INT)~ + @3503 /* My name is Veldrin and I come with knowledge about an old enemy of your house. Tathas Melarn of House Melarn has ambitions to expand his influence in this city while your armies are preoccupied in the war with the hated surface elves. */ + Arabani.Intro.7
  ++ @3504 /* Hand over your House Insignia and I will spare your life! */ + Arabani.Intro.2
  ++ @3505 /* I am your doom. Defend yourself! */ + Arabani.Intro.3
END

IF ~~ Arabani.Intro.1
  SAY @3506 /* You are not in a position to demand anything from me, <MALEFEMALE>. But I am generous today, tell me about your 'urgent' matter and I will think about it. */
  ++ @3507 /* I want to speak with you about a possible attack on your house in the near future. */ + Arabani.Intro.4
  ++ @3508 /* I need to warn you about Tathas Melarn of House Melarn. He is on his way to attack your home. */ + Arabani.Intro.5
END

IF ~~ Arabani.Intro.2
  SAY @3509 /* I'd expected an assassin, but you look more like a simpleton. (chuckle)  You will see that we are anything but helpless. Guards, take care of this fool! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

IF ~~ Arabani.Intro.3
  SAY @3510 /* Bah.  I won't suffer fools in my home. Guards, attack them! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

IF ~~ Arabani.Intro.4
  SAY @3511 /* My house is always a target of threats and assassination attempts. What is your real purpose, Veldrin? To learn about our weaknesses? */
  = @3512 /* Our house is strong. Stronger than any house in the city. Whatever your plan may be, it will fail. Guards, attack these spies! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

IF ~~ Arabani.Intro.5
  SAY @3513 /* House Melarn...I know about it. They are strong in Ched Nasad, aren't they? */
  = @3514 /* What do they want? Tell me everything! */
  ++ @3515 /* They plan to use the turmoil of war to their advantage and want to take over your house. Their army stands ready and will take actions soon. */ + Arabani.Intro.7
  ++ @3516 /* Tathas Melarn desires your House Insignia for his plans. He assigned me to fetch it, but I don't want to do it. */ + Arabani.Intro.6
END

IF ~~ Arabani.Intro.6
  SAY @3517 /* What an honest <MALEFEMALE> you are. I really appreciate it. */
  = @3518 /* I will take matters in my own hands. First I will deal with you however, or you may be tempted to reveal my plans to anyone you come across. Guards, help me dispatch of this fool! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

IF ~~ Arabani.Intro.7
  SAY @3519 /* This is dire news indeed. My army takes part in the war too, and my home is more vulnerable then usual. */
  = @3520 /* You seem to know about him already, so I propose a deal. I will give you an item which you will use in Tathas Melarn's close proximity. This will incapacitate and bring him back to me. */
  = @3521 /* Do this and I will reward you generously. House Arabani is a prosperous house. */
  ++ @3522 /* I accept your offer. Tathas Melarn won't be free much longer. */ + Arabani.Intro.8
  ++ @3523 /* I don't want to be involved in this matter anymore. I have to decline your offer. */ + Arabani.Intro.9
END

IF ~~ Arabani.Intro.8
  SAY @3524 /* Good. This is an anchor stone. It will enable you to pass the wards as long as you have it in your possession. */
  = @3525 /* It will also take care of Tathas Melarn when you use it in his proximity. I expect results quickly. Good luck. */
  IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 3) CreateItem("A7MISC7", 0, 0, 0) GiveItem("A7MISC7", LastTalkedToBy)~ UNSOLVED_JOURNAL @3807 EXIT
END

IF ~~ Arabani.Intro.9
  SAY @3526 /* You are already involved, whether you like it or not. I'll accept your decision, but I can not allow you to walk freely while you know about us. */
  = @3527 /* Guards, help me dispatch of them quickly! */
  IF ~~ DO ~SetGlobal("A7Q3FirstTalk", "MYAREA", 1) SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END


// *** If accepted the matron mother's plan ***
IF ~Global("A7Quest3", "GLOBAL", 3) Global("A7ArabaniAttacked", "GLOBAL", 0) HasItem("A7MISC4", Myself)~ Arabani.1
  SAY @3528 /* Do you have made any progress in your task? */
  ++ @3529 /* Not yet, Matron Mother. */ + Arabani.2
END

IF ~Global("A7Quest3", "GLOBAL", 3) Global("A7ArabaniAttacked", "GLOBAL", 0) !HasItem("A7MISC4", Myself)~ Arabani.1
  SAY @3530 /* You dare to steal from me? Guards, attack! */
  IF ~~ DO ~SetGlobal("A7ArabaniAttacked", "GLOBAL", 1) Enemy()~ EXIT
END

IF ~~ Arabani.2
  SAY @3531 /* I demand results. Be quick! */
  IF ~~ EXIT
END


// *** When Tathas has been brought before her ***
CHAIN IF ~Global("A7Quest3", "GLOBAL", 4) Detect("A7Tathas") Global("A7TathasImprisoned", "LOCALS", 0)~ THEN ~A7ARAB01~ Arabani.3
@3532 /* Welcome to my home. I assume you are Tathas Melarn. But I am sure that we will get to know each other much better in the near future. */
== ~A7TATHAS~ @3533 /* Veldrin, you have betrayed me? I will destroy you! AND I WILL DESTROY HOUSE ARABANI AS WELL!!! */
== ~A7ARAB01~ @3534 /* You will do nothing but obey my commands. I am sure your...cooperation will prove to be useful. */
= @3535 /* Ah, and I will take that from you. Those crystals will be priceless in the right hands. */ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q3ct4")~
EXIT

APPEND ~A7ARAB01~
// *** After imprisoning Tathas Melarn ***
IF ~Global("A7Quest3", "GLOBAL", 4) Global("A7TathasImprisoned", "LOCALS", 1)~ Arabani.4
  SAY @3536 /* You have been very useful to me. With Tathas Melarn under my influence our house will rule supreme. But now to your reward. */
  IF ~!Dead("JAEL01")~ + Arabani.4.1
  IF ~Dead("JAEL01")~ + Arabani.4.2
END

IF ~~ Arabani.4.1
  SAY @3537 /* Do not think I have forgotten the destruction of Deirex, a respected ally of our house. */
  IF ~~ + Arabani.4.3
END

IF ~~ Arabani.4.2
  SAY @3543   /* Do not think your attack on House Jae'llat has gone unnoticed. Matron Mother Hindra and Deirex were respected allies of our house. */
  IF ~~ + Arabani.4.3
END

IF ~~ Arabani.4.3
  SAY @3538 /* You will pay for your impudence. Guards, attack them! */
  IF ~~ DO ~SetGlobal("A7ArabaniAttacked", "GLOBAL", 1)
      Enemy()
      SetGlobal("A7Quest3", "GLOBAL", 10)
      AddXP2DA("A7Q3MQ3")
      EraseJournalEntry(@3800)
      EraseJournalEntry(@3803)
      EraseJournalEntry(@3804)
      EraseJournalEntry(@3805)
      EraseJournalEntry(@3806)
      EraseJournalEntry(@3807)~ SOLVED_JOURNAL @3826 EXIT
END


// *** Talk after defeating Tathas Melarn  ***
IF ~GlobalGT("A7Quest3", "GLOBAL", 6) 
  GlobalLT("A7Quest3", "GLOBAL", 10) 
  Global("A7TathasAttacked", "GLOBAL", 0)
  !ActuallyInCombat()
  Dead("A7Tathas")~ Arabani.5
  SAY @3539 /* The fight is over and House Arabani is victorious as ever. */
  IF ~!Dead("JAEL01")~ + Arabani.7.1
  IF ~Dead("JAEL01")~ + Arabani.7.2
END

IF ~GlobalGT("A7Quest3", "GLOBAL", 6) 
  GlobalLT("A7Quest3", "GLOBAL", 10) 
  Global("A7TathasAttacked", "GLOBAL", 1)
  !ActuallyInCombat()
  Dead("A7Tathas")~ Arabani.6
  SAY @3540 /* The fight is over and with your help House Arabani is victorious. */
  IF ~!Dead("JAEL01")~ + Arabani.7.1
  IF ~Dead("JAEL01")~ + Arabani.7.2
END

IF ~~ Arabani.7.1
  SAY @3541 /* But your treachery has brought us unnecessary trouble. And I have not forgotten the destruction of Deirex, guardian and respected member of our house. */
  IF ~~ + Arabani.7.3
END

IF ~~ Arabani.7.2
  SAY @3544   /* But your treachery has brought us unnecessary trouble. Do not assume that that your attack on House Jae'llat has gone unnoticed. */
  = @3545   /* Matron Mother Hindra and Deirex were respected allies of our house. */
  IF ~~ + Arabani.7.3
END

IF ~~ Arabani.7.3
  SAY @3542 /* You will pay with your life. Guards, attack then! */
  IF ~~ DO ~SetGlobal("A7ArabaniAttacked", "GLOBAL", 1)
      Enemy()
      SetGlobal("A7Quest3", "GLOBAL", 10)
      AddXP2DA("A7Q3MQ3")
      EraseJournalEntry(@3800)
      EraseJournalEntry(@3803)
      EraseJournalEntry(@3804)
      EraseJournalEntry(@3805)
      EraseJournalEntry(@3806)
      EraseJournalEntry(@3807)~ SOLVED_JOURNAL @3827 EXIT
END

END
