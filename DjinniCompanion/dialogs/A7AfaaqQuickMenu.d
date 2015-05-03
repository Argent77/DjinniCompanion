// *** Quick Menu for Afaaq to control parts of his behavior ***
// Traified

BEGIN A7AFQQM

IF ~True()~ QuickMenu.1
  SAY @60064    // Choose your action!
  // Use potions
  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN17", Myself) OR(2) StateCheck(Myself, STATE_POISONED) StateCheck(Myself, STATE_DISEASED)~ + @60065 /* Quaff an Elixir of Help */ DO ~UseItem("POTN17", Myself)~ EXIT
  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN17", Myself) !StateCheck(Myself, STATE_POISONED) !StateCheck(Myself, STATE_DISEASED)~ + @60065 /* Quaff an Elixir of Help */ + QuickMenu.2

  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN20", Myself) StateCheck(Myself, STATE_POISONED)~ + @60066 /* Quaff an Antidote potion */ DO ~UseItem("POTN20", Myself)~ EXIT
  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN20", Myself) !StateCheck(Myself, STATE_POISONED)~ + @60066 /* Quaff an Antidote potion */ + QuickMenu.3

  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN08", Myself) HPPercentLT(Myself, 100)~ + @60067 /* Quaff a Potion of Healing */ DO ~UseItem("POTN08", Myself)~ EXIT
  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN52", Myself) HPPercentLT(Myself, 100)~ + @60068 /* Quaff a Potion of Extra Healing */ DO ~UseItem("POTN52", Myself)~ EXIT
  + ~!GlobalTimerNotExpired("PotionUsedTimer", "LOCALS") HasItem("POTN55", Myself) HPPercentLT(Myself, 100)~ + @60069 /* Quaff a Potion of Superior Healing */ DO ~UseItem("POTN55", Myself)~ EXIT
  
  // Change combat scripts
  + ~!Global("AfaaqActive", "LOCALS", 2)~ + @60095 /* Select health-protective combat script */ DO ~SetGlobal("AfaaqActive", "LOCALS", 2) ChangeAIScript("A7AFATK3", DEFAULT)~ EXIT
  + ~!Global("AfaaqActive", "LOCALS", 1)~ + @60070 /* Select active combat script */ DO ~SetGlobal("AfaaqActive", "LOCALS", 1) ChangeAIScript("A7AFATK2", DEFAULT)~ EXIT
  + ~!Global("AfaaqActive", "LOCALS", 0)~ + @60071 /* Select passive combat script */ DO ~SetGlobal("AfaaqActive", "LOCALS", 0) ChangeAIScript("A7AFATK", DEFAULT)~ EXIT

  // Return into the lamp
  + ~OR(2) PartyHasItem("A7DJLMP") PartyHasItem("A7DJLMPA") !AreaCheck("A77006")~ + @60072 /* Return into the djinni lamp */ DO ~SetGlobal("unsummoning","LOCALS",1)~ EXIT

  ++ @60073 /* Do nothing */ EXIT
END

IF ~~ QuickMenu.2
  SAY @60074    // You are neither poisoned nor diseased. Do you want to quaff the potion anyway?
  ++ @60076 /* Yes */ DO ~UseItem("POTN17", Myself)~ EXIT
  ++ @60077 /* No */ + QuickMenu.1
END

IF ~~ QuickMenu.3
  SAY @60075    // You are not poisoned. Do you want to quaff the potion anyway?
  ++ @60076 /* Yes */ DO ~UseItem("POTN20", Myself)~ EXIT
  ++ @60077 /* No */ + QuickMenu.1
END

