// *** Generic rakshasa dialog file for "A77001" ***
// Traified

BEGIN A7Q1RKG1

// *** Hunter-specific dialogs ***
IF ~Name("A7Q1RKHU", Myself) GlobalGT("A7Quest1", "GLOBAL", 1) Global("A7RakAnnoyed", "LOCALS", 0)~ A7RakHunter1
  SAY @1103 /* Don't disturb me in my hunt, <RACE>. */
  IF ~~ DO ~SetGlobal("A7RakAnnoyed", "LOCALS", 1)~ EXIT
END

IF ~Name("A7Q1RKHU", Myself) GlobalGT("A7Quest1", "GLOBAL", 1) Global("A7RakAnnoyed", "LOCALS", 1)~ A7RakHunter2
  SAY @1104 /* I told you not to disturb me! You are scaring my prey. */
  IF ~~ DO ~SetGlobal("A7RakAnnoyed", "LOCALS", 2)~ EXIT
END

IF ~Name("A7Q1RKHU", Myself) GlobalGT("A7Quest1", "GLOBAL", 1) Global("A7RakAnnoyed", "LOCALS", 2)~ A7RakHunter3
  SAY @1105 /* Don't try my patience, <RACE>. Or you will be my next target! */
  IF ~~ DO ~SetGlobal("A7RakAnnoyed", "LOCALS", 3)~ EXIT
END

IF ~Name("A7Q1RKHU", Myself) GlobalGT("A7Quest1", "GLOBAL", 1) Global("A7RakAnnoyed", "LOCALS", 3)~ A7RakHunter4
  SAY @1106 /* That's it! Let's see how you handle this. */
  IF ~~ DO ~Enemy()~ EXIT
END


// A7RakGen1: Triggered dialog: first contact
IF ~GlobalLT("A7Quest1", "GLOBAL", 2)~ A7RakGen1
  SAY @1107 /* Stop! */
  IF ~~ DO ~SetGlobal("A7Quest1", "GLOBAL", 2)~ + A7RakGen1.1
END

IF ~~ A7RakGen1.1
  SAY @1108 /* What is a <RACE> doing in our territory? */
  + ~CheckStatLT(LastTalkedToBy, 12, INT)~ + @1109 /* What are you? */ + A7RakGen1.2
  + ~CheckStatGT(LastTalkedToBy, 11, INT)~ + @1110 /* Who are you? */ + A7RakGen1.2
  ++ @1111 /* We have entered a teleporter which brought us here. Where are we? */ + A7RakGen1.2
  + ~CheckStatLT(LastTalkedToBy, 15, CHR)~ + @1112 /* We have come here by accident. I think we should leave now. Goodbye. */ + A7RakGen1.3
  + ~CheckStatGT(LastTalkedToBy, 14, CHR)~ + @1113 /* I'm sorry, it wasn't our intention to disturb your presence. We will take our leave. */ + A7RakGen1.3
  ++ @1114 /* We'd rather die than tell you anything. */ + A7RakGen1.Hostile
END

IF ~~ A7RakGen1.2
  SAY @1115 /* We don't have to tell you anything. You have to see our leader. He will decide what to do with you. */
  ++ @1116 /* Very well, lead on. */ + A7RakGen1.4
  ++ @1117 /* I'd like to think about it. */ + A7RakGen1.5
  ++ @1118 /* No, I don't trust your kind. */ + A7RakGen1.Hostile
END

IF ~~ A7RakGen1.3
  SAY @1119 /* I cannot allow you to go, since you already know about our presence. Our leader will decide what to do with you. */
  ++ @1120 /* Very well, I accept. */ + A7RakGen1.4
  ++ @1117 /* I'd like to think about it. */ + A7RakGen1.5
  ++ @1118 /* No, I don't trust your kind. */ + A7RakGen1.Hostile
END

IF ~~ A7RakGen1.4
  SAY @1121 /* Don't do anything rash or we will kill you here and now. */
  IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q1ct1")~ EXIT
END

IF ~~ A7RakGen1.5
  SAY @1122 /* There is nothing to think about, <RACE>. You will obey our orders or suffer the consequences! */
  ++ @1120 /* Very well, I accept. */ + A7RakGen1.4
  ++ @1118 /* No, I don't trust your kind. */ + A7RakGen1.Hostile
END

IF ~~ A7RakGen1.Hostile
  SAY @1123 /* Then you will die. ATTACK! */
  IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ EXIT
END


// A7RakGen2: Requested dialog when quest accepted but not finished
IF ~RandomNum(3, 1) GlobalGT("A7Quest1", "GLOBAL", 1) !PartyHasItem("A7MISC1A")~ A7RakGen2a
  SAY @1124 /* What do you want from us, <RACE>? */
  ++ @1125 /* What are you doing here? */ + A7RakGen2.1
  ++ @1126 /* Nothing. */ + A7RakGen2.2
  ++ @1127 /* I've decided to end your existance. Die! */ + A7RakGen1.Hostile
END

IF ~RandomNum(3, 2) GlobalGT("A7Quest1", "GLOBAL", 1) !PartyHasItem("A7MISC1A")~ A7RakGen2b
  SAY @1128 /* It is highly unusual that our leader let you live. */
  = @1129 /* Do you have anything to say? */
  ++ @1125 /* What are you doing here? */ + A7RakGen2.1
  ++ @1130 /* I'm sorry for disturbing you. */ + A7RakGen2.2
  ++ @1127 /* I've decided to end your existance. Die! */ + A7RakGen1.Hostile
END

IF ~RandomNum(3, 3) GlobalGT("A7Quest1", "GLOBAL", 1) !PartyHasItem("A7MISC1A")~ A7RakGen2c
  SAY @1131 /* You are lucky not to be hunted as the prey you are. */
  = @1132 /* What do you want from us? */
  ++ @1125 /* What are you doing here? */ + A7RakGen2.1
  ++ @1130 /* I'm sorry for disturbing you. */ + A7RakGen2.2
  ++ @1127 /* I've decided to end your existance. Die! */ + A7RakGen1.Hostile
END

IF ~~ A7RakGen2.1
  SAY @1133 /* Talk to our leader if you want to know something. */
  IF ~~ EXIT
END

IF ~~ A7RakGen2.2
  SAY @1134 /* Then stop bothering me! */
  IF ~~ EXIT
END


// A7RakGen3: Requested dialog when quest accepted and creature has been trapped
IF ~RandomNum(2, 1) GlobalGT("A7Quest1", "GLOBAL", 1) PartyHasItem("A7MISC1A")~ A7RakGen3a
  SAY @1135 /* You have captured the dao? Our leader will be pleased. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~RandomNum(2, 2) GlobalGT("A7Quest1", "GLOBAL", 1) PartyHasItem("A7MISC1A")~ A7RakGen3b
  SAY @1136 /* So you are useful after all. Bring your trophy to our leader. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

