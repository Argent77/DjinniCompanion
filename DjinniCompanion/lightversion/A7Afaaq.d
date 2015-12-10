// Stub for Afaaq's dialog

BEGIN A7AFAAQ

// *** When entered the djinni lamp interior the first time ***
IF ~Name("A7Q6COPY", LastTalkedToBy) AreaCheck("A77006") Global("LampInvitation", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkDjinniLampInterior.1
  SAY @11227 /* Welcome to my home, <CHARNAME>. */
  = @11268 /* After you restored my sealed powers, I have tried to make this pocket plane more homely by creating this small platform of solid matter. */
  IF ~NumInParty(1)~ + TalkDjinniLampInterior.3
  IF ~NumInPartyGT(1)~ + TalkDjinniLampInterior.2
END

IF ~~ TalkDjinniLampInterior.2
  SAY @11229 /* Please make yourself at home, but do not keep your friends waiting for too long. And if you want to leave again, just talk to me. */
  IF ~~ DO ~SetGlobal("LampInvitation", "LOCALS", 2)~ EXIT
END

IF ~~ TalkDjinniLampInterior.3
  SAY @11230 /* Please make yourself at home as long as you want. And if you want to leave again, just talk to me. */
  IF ~~ DO ~SetGlobal("LampInvitation", "LOCALS", 2)~ EXIT
END
