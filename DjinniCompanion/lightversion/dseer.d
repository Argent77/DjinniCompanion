// *** Dialog addition for the Seer in IWD:EE - HoW ***

// Seer in Gloomfrost mountain upgrades Afaaq
EXTEND_BOTTOM DSEER 43 45 46
  + ~Global("A7AfaaqUpgradeRequested", "LOCALS", 0) Global("A7AfaaqUpgraded", "GLOBAL", 0) PartyHasItem("A7DJLMP")~ + 
      @4300 /* I happen to have a djinni lamp in my possession. Is it possible to break the enchantment that binds the djinni to the lamp? */
      DO ~SetGlobal("A7AfaaqUpgradeRequested", "LOCALS", 1)~ + SeerAfaaqUpgrade.1
  + ~Global("A7AfaaqUpgradeRequested", "LOCALS", 1) Global("A7AfaaqUpgraded", "GLOBAL", 0) PartyHasItem("A7DJLMP")~ +
      @4301 /* I have reconsidered. Please try to break the seals, which restore some of Afaaq's powers. */ + SeerAfaaqUpgrade.3
END

APPEND DSEER
  IF ~~ SeerAfaaqUpgrade.1
    SAY @4302 /* I may be known as a seer, but my I can also cast a spell or two. Let me see that lamp of yours. */
    ++ @4303 /* Here you go. */  + SeerAfaaqUpgrade.2
  END

  IF ~~ SeerAfaaqUpgrade.2
    SAY @4304 /* Hmm, the enchantments are old and powerful. I can try to break the minor seals, but that will only restore some of the djinni's powers. He will still be bound to the lamp. */
    ++ @4305 /* That's certainly an improvement to his current state. Please do it. */ + SeerAfaaqUpgrade.3
    ++ @4306 /* On second thought, I'd like to keep the djinni as he is. */ + 44
  END

  IF ~~ SeerAfaaqUpgrade.3
    SAY @4082 /* Let me prepare the spell... */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct4a")~ EXIT
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct4b")~ EXIT
  END

  IF WEIGHT #-1 ~Global("A7PrepareAfaaq", "LOCALS", 1)~ SeerAfaaqUpgrade.4
    SAY @4083 /* The casting will take only a moment... [A7SLNT_S] */
    IF ~~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 2) TakePartyItem("A7DJLMP") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct4e")~ EXIT
  END

  IF WEIGHT #-1 ~Global("A7PrepareAfaaq", "LOCALS", 2)~ THEN SeerAfaaqUpgrade.5
    SAY @4084 /* It is done. [A7SLNT_S] */
    IF ~~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 3) ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0))~ + 44
  END
END
