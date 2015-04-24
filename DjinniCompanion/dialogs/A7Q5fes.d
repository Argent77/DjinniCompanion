// *** Dialog for Fire Elemental servant of the Fire Salamanders ***
// Traified

BEGIN A7Q5FES

// While following CHARNAME
IF ~Global("FESIgnore", "LOCALS", 0) Global("A7Q5FESDeny", "A77003", 0)~ fes.intro.1
  SAY @5720 /* What are your orders, master? */
  ++ @5721 /* Wait here! */ + fes.stay
  ++ @5722 /* Follow me! */ + fes.follow
END

IF ~~ fes.stay
  SAY @5723 /* I will wait here. */
  IF ~~ DO ~SetGlobal("FESWait", "LOCALS", 1) ClearActions(Myself)~ EXIT
END

IF ~~ fes.follow
  SAY @5724 /* I will follow you. */
  IF ~~ DO ~SetGlobal("FESFollow", "LOCALS", 1) ClearActions(Myself)~ EXIT
END

IF ~Global("FESIgnore", "LOCALS", 0) Global("A7Q5FESDeny", "A77003", 1)~ fes.denyfollow
  SAY @5725 /* I am not allowed to leave the area. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// After given to the salamanders
IF ~Global("FESIgnore", "LOCALS", 1)~ fes.salamander
  SAY @5726 /* The fire elemental ignores you completely. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

