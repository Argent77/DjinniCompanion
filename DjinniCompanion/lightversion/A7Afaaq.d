// Afaaq's dialog

BEGIN A7AFAAQ

// *** First-time introduction (IWD:EE only) ***
IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqBG2", "GLOBAL", 0) GlobalLT("IntroTalk", "LOCALS", 2) Global("AfaaqMetNPC", "LOCALS", 0) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Liberated.NPC.1
  SAY @100052 /* Greetings <RACE>, may I speak to your leader? */
  IF ~~ DO ~SetGlobal("AfaaqMetNPC", "LOCALS", 1)~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqBG2", "GLOBAL", 0) GlobalLT("IntroTalk", "LOCALS", 2) Global("AfaaqMetNPC", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Liberated.NPC.2
  SAY @100053 /* May I speak to your leader? */
  IF ~~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqBG2", "GLOBAL", 0) GlobalLT("IntroTalk", "LOCALS", 2) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Liberated
  SAY @100054 /* Greetings, my <PRO_LADYLORD>. I see that you have successfully wrested the lamp from the grasp of my former master? */
  = @100055 /* (sigh) I can also feel that the lamp has chosen you as my new sole master. */
  IF ~~ DO ~SetGlobal("IntroTalk", "LOCALS", 2)~ + TalkIntro.0
END

IF ~~ TalkIntro.0
  SAY @11166 /* My name is Afaaq. I belong to the race of djinn, genies of air. May I ask for your name? */
  ++ @11167 /* My name is <CHARNAME>. I'm pleased to meet you. */ + TalkIntro.1
  ++ @11168 /* I'd rather not tell my name. Who knows what a creature like you could misuse it for. */ + TalkIntro.2
  ++ @11169 /* You may call me <CHARNAME>. */ + TalkIntro.3
END

IF ~~ TalkIntro.1
  SAY @11170 /* The pleasure is all mine. */
  + ~CheckStatLT(Player1, 10, WIS)~ + @11171 /* Are you the proverbial djinni in a...lamp? */ + TalkIntro.4
  + ~CheckStatGT(Player1, 9, WIS)~ + @11172 /* How did you come to be bound to this lamp? */ + TalkIntro.5
  + ~PartyHasItem("HEARTGM")~ + @100056 /* Please excuse my lack of manners, but I have to bring back the Heartstone Gem to Kuldahar as quickly as possible. */ + TalkIntro.6
  ++ @11176 /* Well then, let's go! */ + TalkIntro.6
END

IF ~~ TalkIntro.2
  SAY @11177 /* You are a cautious one. But I have no intention to harm you. */
  + ~CheckStatLT(Player1, 10, WIS)~ + @11171 /* Are you the proverbial djinni in a...lamp? */ + TalkIntro.4
  + ~CheckStatGT(Player1, 9, WIS)~ + @11172 /* How did you come to be bound to this lamp? */ + TalkIntro.5
  + ~PartyHasItem("HEARTGM")~ + @100056 /* Please excuse my lack of manners, but I have to bring back the Heartstone Gem to Kuldahar as quickly as possible. */ + TalkIntro.6
  ++ @11176 /* Well then, let's go! */ + TalkIntro.6
END

IF ~~ TalkIntro.3
  SAY @11178 /* As you wish. */
  + ~CheckStatLT(Player1, 10, WIS)~ + @11171 /* Are you the proverbial djinni in a...lamp? */ + TalkIntro.4
  + ~CheckStatGT(Player1, 9, WIS)~ + @11172 /* How did you come to be bound to this lamp? */ + TalkIntro.5
  + ~PartyHasItem("HEARTGM")~ + @100057 /* We should move on, Afaaq. I still have to return the Heartstone Gem to Kuldahar. */ + TalkIntro.6
  ++ @11176 /* Well then, let's go! */ + TalkIntro.6
END

IF ~~ TalkIntro.4
  SAY @11181 /* Yes, indeed I am, my <PRO_LADYLORD>. I must commend you for grasping the obvious so quickly. */
  IF ~~ + TalkIntro.5
END

IF ~~ TalkIntro.5
  SAY @100058 /* My enslavement to the lamp was caused by powerful black sorcery. I was not able to divine the identity of my captors, but I can still feel that they are alive. In my current condition I would be unable to resist if they decided to come for me again. */
  IF ~~ + TalkIntro.6
END

IF ~~ TalkIntro.6
  SAY @11183 /* I will accompany you as long as you have my lamp in your possession. Truth be told, there is no other way while I am trapped in its enchantments. */
  = @11184 /* If you need my help, you can talk to me whenever you want. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


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
