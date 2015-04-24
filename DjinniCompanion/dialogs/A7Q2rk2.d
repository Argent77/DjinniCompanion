// *** Dialog lines for rakshasa near temple in map A77004 ***
// Traified

BEGIN A7Q2RK2

IF ~GlobalLT("RakTalk", "A77004", 2)~ RakQ2_2
  SAY @2201 /* Are you the one who took the djinni from our champion? Soon he will be a sacrifice for Ravanna and you'll be powerless before us! */
  IF ~~ DO ~SetGlobal("RakTalk", "A77004", 2) Enemy()~ EXIT
END
