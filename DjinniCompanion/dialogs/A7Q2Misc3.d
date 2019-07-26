// *** Dialog file for quest item "Jade Orb" ***
// Traified

BEGIN A7MISC3

// Don't trigger when in combat mode
IF ~ActuallyInCombat()~ JadeOrb.Combat
  SAY @2407 /* The ongoing battle makes it impossible for you to concentrate on the orb's powers. */
  IF ~~ EXIT
END

// When Quest 2 has started and the Rakshasa Orb has been used, teleport the party to a new area
IF ~Global("A7Quest2", "GLOBAL", 1) !ActuallyInCombat() !GlobalTimerExpired("A7Quest2Timer", "GLOBAL")~ JadeOrb.Ready
  SAY @2411 /* You focus your thoughts on the Jade Orb in your hands. */
  = @2412 /* After a few moments it begins to glow as you are wrapped into a gleaming light... */
  IF ~~ DO ~ClearAllActions() DestroyItem("A7MISC3") StartCutSceneMode() StartCutScene("A7Q2ct2")~ EXIT
END

IF ~Global("A7Quest2", "GLOBAL", 1) !ActuallyInCombat() GlobalTimerExpired("A7Quest2Timer", "GLOBAL")~ JadeOrb.Expired
  SAY @2411 /* You focus your thoughts on the Jade Orb in your hands. */
  = @2413 /* After a few moments it flickers shortly and disintegrates into a cloud of dust. It looks like the stone's magic has already been used up. You have lost the djinni forever. */
  IF ~~ DO ~DestroyItem("A7MISC3") EraseJournalEntry(@2800)~ EXIT
END

// Cheating not allowed
IF ~True()~ JadeOrb.Default
  SAY @2410 /* The orb does nothing. */
  IF ~~ DO ~TakePartyItem("A7MISC3")~ EXIT
END
