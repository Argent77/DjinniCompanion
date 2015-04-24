// *** Dialog lines for rakshasa near teleporter in map A77004 ***
// Traified

BEGIN A7Q2RK1A

IF ~Global("RakTalk", "A77004", 0)~ RakQ2_1
  SAY @2200 /* Intruders have entered our territory? We will stop you here and now. Attack! */
  IF ~~ DO ~SetGlobal("RakTalk", "A77004", 1) Enemy()~ EXIT
END
