// *** Dialog addition for Nym, the drow merchant, in IWD:EE ***

EXTEND_BOTTOM DNYM 1 2 3 4 5 6 8 10 11 13 14 16 17 18 19
  // first time request
  + ~Global("A7AfaaqUpgradeRequested", "LOCALS", 0) Global("A7AfaaqUpgraded", "GLOBAL", 0) PartyHasItem("A7DJLMP")~ + 
      @4307 /* I happen to have a djinni lamp in my possession. Do you have any means to break the enchantment that binds the djinni to the lamp? */
      DO ~SetGlobal("A7AfaaqUpgradeRequested", "LOCALS", 1)~ + NymAfaaqUpgrade.1
  // repeated request, before agreeing to a price
  + ~Global("A7AfaaqUpgradeRequested", "LOCALS", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) PartyHasItem("A7DJLMP") Global("A7AfaaqUpgradeDeal", "LOCALS", 0)~ + 
      @4308 /* I have reconsidered. Please try to break the enchantment on the djinni lamp. */ + NymAfaaqUpgrade.2a
  // repeated request, price: 20,000 gold
  + ~Global("A7AfaaqUpgradeRequested", "LOCALS", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) PartyHasItem("A7DJLMP") Global("A7AfaaqUpgradeDeal", "LOCALS", 1) PartyGoldGT(19999)~ + 
      @4309 /* I have reconsidered. I'm ready to pay your fee of 20,000 gold. Please try to break the enchantment on the djinni lamp. */
      DO ~TakePartyGold(20000)~ + NymAfaaqUpgrade.5
  // repeated request, price: 16,000 gold
  + ~Global("A7AfaaqUpgradeRequested", "LOCALS", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) PartyHasItem("A7DJLMP") Global("A7AfaaqUpgradeDeal", "LOCALS", 2) PartyGoldGT(15999)~ + 
      @4310 /* I have reconsidered. I'm ready to pay your fee of 16,000 gold. Please try to break the enchantment on the djinni lamp. */
      DO ~TakePartyGold(16000)~ + NymAfaaqUpgrade.5
END

APPEND DNYM
  IF ~~ NymAfaaqUpgrade.1
    SAY @4311 /* Hmm, this is a curious request. I might have something that can accomplish the task you have requested. */
    = @4312 /* It is an artifact that contains potent magic to break even ancient and powerful enchantments as I can sense on that lamp of yours. Coincidentally, I have the knowledge how to use this item properly as well. */
    ++ @4313 /* I see where this is going. How much will it cost me? */ + NymAfaaqUpgrade.2
    ++ @4314 /* On second thought, I'd like to keep the djinni as he is. Farewell, Nym. */ + 9
  END

  IF ~~ NymAfaaqUpgrade.2a
    SAY @4325 /* Very well. I can try to break the enchantment with a powerful artifact I have in my possession. */
    IF ~~ + NymAfaaqUpgrade.2
  END

  IF ~~ NymAfaaqUpgrade.2
    SAY @4315 /* You must understand, that artifacts of that quality are hard to come by. I am asking for the modest sum of 20,000 gold for my services. */
    + ~PartyGoldGT(19999) CheckStatLT(LastTalkedToBy, 16, CHR)~ + @4316 /* Is there no way to lower the price? */ DO ~SetGlobal("A7AfaaqUpgradeDeal", "LOCALS", 1)~ + NymAfaaqUpgrade.3
    + ~PartyGoldGT(15999) CheckStatGT(LastTalkedToBy, 15, CHR)~ + @4316 /* Is there no way to lower the price? */ DO ~SetGlobal("A7AfaaqUpgradeDeal", "LOCALS", 2)~ + NymAfaaqUpgrade.4
    + ~PartyGoldGT(19999)~ + @4317 /* Alright, I will pay your fee. */ DO ~TakePartyGold(20000)~ + NymAfaaqUpgrade.5
    ++ @4318 /* That's too expensive for me. I have to decline your offer for now. Farewell, Nym. */ + 9
  END

  IF ~~ NymAfaaqUpgrade.3
    SAY @4319 /* Unfortunately not. The artifact is very expensive, after all. Do we have a deal? */
    + ~PartyGoldGT(19999)~ + @4317 /* Alright, I will pay your fee. */ DO ~TakePartyGold(20000)~ + NymAfaaqUpgrade.5
    ++ @4318 /* That's too expensive for me. I have to decline your offer for now. Farewell, Nym. */ + 9
  END

  IF ~~ NymAfaaqUpgrade.4
    SAY @4320 /* Well, I'm not eager to set a precedence. But I could make an exception to you, outlander, as long as you don't spread words about it. I can lower the price to 16,000 gold. Do you accept? */
    + ~PartyGoldGT(15999)~ + @4317 /* Alright, I will pay your fee. */ DO ~TakePartyGold(16000)~ + NymAfaaqUpgrade.5
    ++ @4318 /* That's too expensive for me. I have to decline your offer for now. Farewell, Nym. */ + 9
  END

  IF ~~ NymAfaaqUpgrade.5
    SAY @4321 /* You have made a wise decision. Please let me take a closer look at the lamp. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct5a")~ EXIT
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct5b")~ EXIT
  END

  IF WEIGHT #-1 ~Global("A7PrepareAfaaq", "LOCALS", 1)~ NymAfaaqUpgrade.6
    SAY @4322 /* This will only take a moment. */
    IF ~~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 2) TakePartyItem("A7DJLMP") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct5e")~ EXIT
  END

  IF WEIGHT #-1 ~Global("A7PrepareAfaaq", "LOCALS", 2)~ THEN NymAfaaqUpgrade.7
    SAY @4084 /* It is done. [A7SLNT_S] */
    = @4323 /* Unfortunately, I was not able to break all the enchantments. The djinni is still bound to the lamp, but I could restore most of his powers. */
    = @4324 /* Since I couldn't fulfill my side of the deal satisfactorily, I will lower the original fee by 4,000 gold. */
    IF ~~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 3) ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0)) GiveGoldForce(4000)~ + 9
  END

END
