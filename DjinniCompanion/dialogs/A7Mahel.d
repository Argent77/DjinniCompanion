// *** Rakshasa Leader Mahel dialog file for "A77001" ***
// Traified

BEGIN A7MAHEL

// *** A7RakLe1: Triggered dialog: first contact ***
IF ~GlobalLT("A7Quest1", "GLOBAL", 3)~ A7RakLe1
  SAY @1201 /* A <RACE> has made it's way to our encampment? */
  IF ~~ DO ~SetGlobal("A7Quest1", "GLOBAL", 3)~ + A7RakLe1.1
END

IF ~~ A7RakLe1.1
  SAY @1202 /* Who are you? Tell us at once! */
  + ~CheckStatLT(LastTalkedToBy, 10, WIS)~ + @1203 /* My name is <GABBER>. Who... or what are you? */ + A7RakLe1.2
  + ~CheckStatGT(LastTalkedToBy, 9, WIS)~ + @1204 /* My name is <GABBER>. Who are you, rakshasa? */ + A7RakLe1.3
  + ~CheckStatLT(LastTalkedToBy, 14, CHR)~ + @1205 /* I'm... an adventurer who stumbled upon your camp by accident. */ + A7RakLe1.4
  + ~CheckStatGT(LastTalkedToBy, 13, CHR)~ + @1206 /* I'd like to know your name before I tell you anything. */ + A7RakLe1.5
  + ~CheckStatGT(LastTalkedToBy, 16, CHR)~ + @1207 /* I won't tell you anything if you continue your rude behavior. */ + A7RakLe1.5
  + ~CheckStatLT(LastTalkedToBy, 17, CHR)~ + @1207 /* I won't tell you anything if you continue your rude behavior. */ + A7RakLe1.6
END

IF ~~ A7RakLe1.2
  SAY @1208 /*  We are the hunters, you are the prey. That is all you need to know about us. You may still be of use to us, despite your ignorance. */
  IF ~~ + A7RakLe1.7
END

IF ~~ A7RakLe1.3
  SAY @1209 /* I'm called Mahel, <GABBER>. And I am the leader of our hunting party. */
  IF ~~ + A7RakLe1.7
END

IF ~~ A7RakLe1.4
  SAY @1210 /* You are pityful excuse for a <RACE>. But you may still be useful to us. */
  IF ~~ + A7RakLe1.7
END

IF ~~ A7RakLe1.5
  SAY @1211 /* I don't know whether you are bold or merely ignorant, but I like your directness. I'm Mahel, the leader of our hunting party. */
  IF ~~ + A7RakLe1.7
END

IF ~~ A7RakLe1.6
  SAY @1212 /* You dare? */
  = @1213 /* We will hunt you down and feast on your innards. ATTACK THEM! */
  IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ 
    UNSOLVED_JOURNAL @1803 EXIT
END

IF ~~ A7RakLe1.7
  SAY @1214 /* We came here several moons ago for hunting and feasting. But we have arroused the interest of our enemies, the dao genies. */
  IF ~Global("geniesgone", "GLOBAL", 0)~ + A7RakLe1.8
  IF ~Global("geniesgone", "GLOBAL", 1) !Dead("trgeni01")~ + A7RakLe1.9  // dao genies have left
  IF ~Global("geniesgone", "GLOBAL", 1) Dead("trgeni01")~ + A7RakLe1.10  // dao genies have been killed
END

IF ~~ A7RakLe1.8
  SAY @1215 /* They haven't persued us directly yet and we're getting tired of their games. */
  IF ~Global("zahraajob", "GLOBAL", 1)~ + A7RakLe1.11
  IF ~Global("zahraajob", "GLOBAL", 0)~ + A7RakLe1.12
END

IF ~~ A7RakLe1.9
  SAY @1216 /* Hmm, I cannot sense them anymore. They wouldn't leave unless they have collected their price. */
  = @1217 /* Your smell reveals you have worked for them already. Have you defeated our champion Ihtafeer? */
  ++ @1218 /* Yes, we have delivered his head to the dao genies. */ + A7RakLe1.14
  + ~CheckStatLT(LastTalkedToBy, 14, CHR)~ + @1219 /* (Lie) No, we have destroyed the dao genies. */ + A7RakLe1.15
  + ~CheckStatGT(LastTalkedToBy, 13, CHR)~ + @1219 /* (Lie) No, we have destroyed the dao genies. */ + A7RakLe1.16
  ++ @1220 /* I don't know what you are talking about? */ + A7RakLe1.15
END

IF ~~ A7RakLe1.10
  SAY @1216 /* Hmm, I cannot sense them anymore. They wouldn't leave unless they have collected their price. */
  ++ @1221 /* We have already destroyed them. */ + A7RakLe1.16
  ++ @1222 /* (Lie) Actually, we have brought them the head of a rakshasa and they left. */ + A7RakLe1.14
END

IF ~~ A7RakLe1.11
  SAY @1223 /* Hmm, do I smell the stench of the genies on you? No matter. */
  IF ~~ + A7RakLe1.12
END

// TODO: add remarks from either Hexxat, Dorn, Rasaad and/or Neera
CHAIN A7MAHEL A7RakLe1.12
  @1224 /* I have something in mind to spice up our hunt. You can bring their leader to us. */
  == KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn", CD_STATE_NOTVALID)~ 
    THEN @1225 /* Do not listen to him. The rakshasa are demonic creatures and have only evil intentions. */
  == MAZZYJ IF ~!InParty("Keldorn") InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy", CD_STATE_NOTVALID)~ 
    THEN @1226 /* The rakshasa are evil creatures without honor. Do not enslave yourself to their whims. */
  == ANOMENJ IF ~!InParty("Keldorn") !InParty("Mazzy") InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen", CD_STATE_NOTVALID)~
    THEN @1227 /* I'd rather slay those creatures where they stand and be done with them. It is doubtful they will even let us live once we have completed their task. */

  == JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira", CD_STATE_NOTVALID)~ 
    THEN @1228 /* I have some knowledge about those creatures. They call themselves rakshasa and are evil creatures with strong predatory tendencies. */
      = @1229 /* Be careful around them. We just might be a piece of meat to them. */
  == CERNDJ IF ~!InParty("Jaheira") InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd", CD_STATE_NOTVALID)~ 
    THEN @1230 /* The rakshasa are not part of the natural order of our world. Whatever their plan is, it will surely provoke a strong reaction from their opponents. */

  == HAERDAJ IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis", CD_STATE_NOTVALID) Global("zahraajob", "GLOBAL", 0)~
    THEN @1231 /* Our friend wants you to dance to his tune, my raven. Or do you wonder the tune of the other side is more to your liking? */
  == HAERDAJ IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis", CD_STATE_NOTVALID) Global("zahraajob", "GLOBAL", 1)~
    THEN @1232 /* This is a most interesting turn of events. You can choose between the tunes of the genies and the rakshasas, my raven. Do you have a preference? */
  == JANJ IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis", CD_STATE_NOTVALID) InParty("Jan") InMyArea("Jan") !StateCheck("Jan", CD_STATE_NOTVALID)~
    THEN @1233 /* Speaking of dancing, I once met a gnomish bard in my youth when-- */
  == HAERDAJ IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis", CD_STATE_NOTVALID) InParty("Jan") InMyArea("Jan") !StateCheck("Jan", CD_STATE_NOTVALID)~
    THEN @1234 /* Please, not now. I want to know how this little act develops before our host loses his patience. */

  == EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin", CD_STATE_NOTVALID)~ 
    THEN @1235 /* Powerful creatures have always powerful items in their possession. You'd be a fool to decline his offer. */
  == VICONIJ IF ~!InParty("Edwin") InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia", CD_STATE_NOTVALID) Global("zahraajob", "GLOBAL", 0)~ 
    THEN @1236 /* I suggest you accept his offer for now. You may still reconsider after you've heard the other side. Think about it. */
  == VICONIJ IF ~!InParty("Edwin") InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia", CD_STATE_NOTVALID) Global("zahraajob", "GLOBAL", 1)~ 
    THEN @1237 /* I suggest you accept his offer. You have slain his underling Ihtafeer already and can return its head for a reward. */
      = @1238 /* Why not get the best from both sides? */
  == KORGANJ IF ~!InParty("Edwin") !InParty("Viconia") InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan", CD_STATE_NOTVALID)~ 
    THEN @1239 /* Argh, do ye really want to bow down to those beasts? Let's have 'eir heads and loot 'em bodies. That be less a hassle an' more riches for us. */
END A7MAHEL A7RakLe1.13

APPEND A7MAHEL
  IF ~~ A7RakLe1.13
    SAY @1240 /* Do that and I will be pleased. */
    ++ @1241 /* I doubt the dao genies would be willing to meet you. */ + A7RakLe1.18
    ++ @1242 /* Yes, I will do it. */ + A7RakLe1.19
    + ~CheckStatLT(LastTalkedToBy, 14, CHR)~ + @1243 /* What will be our reward for this task? */ + A7RakLe1.21
    + ~CheckStatGT(LastTalkedToBy, 13, CHR)~ + @1243 /* What will be our reward for this task? */ + A7RakLe1.22
    ++ @1244 /* I'm not interested in your offer. */ + A7RakLe1.24
    ++ @1245 /* No, I'll never won't betray the dao genies. */ + A7RakLe1.25
  END

  IF ~~ A7RakLe1.14
    SAY @1246 /* You are a mighty specimen indeed, if you were able to defeat a ruhk in a straight fight. */
    IF ~~ + A7RakLe1.17
  END

  IF ~~ A7RakLe1.15
    SAY @1247 /* I don't think you tell us the truth. Your smell betrays you. */
    IF ~~ + A7RakLe1.17
  END

  IF ~~ A7RakLe1.16
    SAY @1248 /* You are a mighty speciment indeed, if you were able to take on the dao genies. */
    = @1249 /* You are worthy to become our prey. */
    IF ~~ + A7RakLe1.17
  END

  IF ~~ A7RakLe1.17
    SAY @1250 /* The game has changed, my brothers. We will hunt you down and feast on your innards. ATTACK THEM! */
    IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ 
      UNSOLVED_JOURNAL @1803 EXIT
  END

  IF ~~ A7RakLe1.18
    SAY @1251 /* They wouldn't have much of a choice, after you are done with them. */
    = @1252 /* So, what is your answer? */
    ++ @1253 /* Very well, I will do it. */ + A7RakLe1.19
    + ~CheckStatLT(LastTalkedToBy, 14, CHR)~ + @1243 /* What will be our reward for this task? */ + A7RakLe1.21
    + ~CheckStatGT(LastTalkedToBy, 13, CHR)~ + @1243 /* What will be our reward for this task? */ + A7RakLe1.22
    ++ @1244 /* I'm not interested in your offer. */ + A7RakLe1.24
    ++ @1245 /* No, I won't betray the dao genies. */ + A7RakLe1.25
  END

  IF ~~ A7RakLe1.19
    SAY @1254 /* You are more intelligent than I thought. */
    = @1255 /* Here, take this box. It contains a spell that will trap the spirit of the dao genie. */
    IF ~~ DO ~CreateItem("A7MISC1", 0, 0, 0) GiveItem("A7MISC1", LastTalkedToBy)~ + A7RakLe1.20
  END

  IF ~~ A7RakLe1.20
    SAY @1256 /* The item has only one charge, so make sure to target Khan Zahraa only. Once he is trapped, return him to us immediately. Do you understand? */
    ++ @1257 /* Yes, absolutely. I will trap Khan Zahraa and return him to you. */ + A7RakLe1.26
    ++ @1258 /* Could you please repeat that again? */ + A7RakLe1.27
    + ~Alignment(Player1, MASK_GOOD)~ + @1289 /* I've changed my mind. There is no way I can perform such a dark deed for you. */ + A7RakLe1.25
    + ~!Alignment(Player1, MASK_GOOD)~ + @1259 /* On second thought, I don't want to do it. */ + A7RakLe1.25
  END

  IF ~~ A7RakLe1.21
    SAY @1260 /* Don't test my patience, <RACE>! Your reward is your life. */
    = @1261 /* If you actually manage to fulfill our demands, I might think it over. */
    IF ~~ + A7RakLe1.23
  END

  IF ~~ A7RakLe1.22
    SAY @1262 /* I have something rare in my possession which might be useful to you. Fulfill our demand and it is yours. */
    IF ~~ + A7RakLe1.23
  END

  IF ~~ A7RakLe1.23
    SAY @1252 /* So, what is your answer? */
    ++ @1253 /* Very well, I will do it. */ + A7RakLe1.19
    ++ @1244 /* I'm not interested in your offer. */ + A7RakLe1.25
  END

  IF ~~ A7RakLe1.24
    SAY @1263 /* I think you misunderstood. I'm not offering this task to you, I demand it. */
    ++ @1264 /* I don't have a choice, do I? Very well, I'll do it. */ + A7RakLe1.19
    ++ @1265 /* No, I don't take orders from your kind. */ + A7RakLe1.25
  END

  IF ~~ A7RakLe1.25
    SAY @1266 /* You dare to refuse us? We will feast on your innards. ATTACK THEM! */
    IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ 
      UNSOLVED_JOURNAL @1803 EXIT
  END

  IF ~~ A7RakLe1.26
    SAY @1267 /* Very good. I will eagerly await your return. */
    IF ~~ DO ~SetGlobal("A7Quest1", "GLOBAL", 4) RevealAreaOnMap("AR2000")~
      UNSOLVED_JOURNAL @1802 EXIT
  END

  IF ~~ A7RakLe1.27
    SAY @1268 /* Once again. */
    = @1269 /* Return to the dao genies and use the box on Khan Zahraa. Don't use it on anyone else, because you have only one attempt. */
    = @1270 /* When he is trapped, return to me at once. Do you understand now? */
    ++ @1271 /* Yes. I will trap Khan Zahraa and return him to you. */ + A7RakLe1.26
    ++ @1258 /* Could you please repeat that again? */ + A7RakLe1.27
    + ~Alignment(Player1, MASK_GOOD)~ + @1289 /* I've changed my mind. There is no way I can perform such a dark deed for you. */ + A7RakLe1.25
    + ~!Alignment(Player1, MASK_GOOD)~ + @1259 /* On second thought, I don't want to do it. */ + A7RakLe1.25
  END


  // *** A7RakLe2: Requested dialog: return for more information ***
  IF ~GlobalGT("A7Quest1", "GLOBAL", 3) HasItem("A7djlmp", "A7Mahel") Global("geniesgone", "GLOBAL", 0) Global("A7Q1DaoTrapped", "GLOBAL", 0)~ A7RakLe2
    SAY @1272 /* You return to us again. What do you want? */
    ++ @1273 /* Could you please repeat your task again? */ + A7RakLe1.27
    + ~Alignment(Player1, MASK_GOOD)~ + @1289 /* I've changed my mind. There is no way I can perform such a dark deed for you. */ + A7RakLe1.25
    + ~!Alignment(Player1, MASK_GOOD)~ + @1259 /* On second thought, I don't want to do it. */ + A7RakLe1.25
    ++ @1274 /* There is nothing more I need to know. */ + A7RakLe2.1
  END

  IF ~~ A7RakLe2.1
    SAY @1275 /* Good. Go now and complete your task. */
    IF ~~ EXIT
  END


  // *** A7RakLe3: Party returns without creature and genies are already gone ***
  IF ~GlobalGT("A7Quest1", "GLOBAL", 3) Global("geniesgone", "GLOBAL", 1) Global("A7Q1DaoTrapped", "GLOBAL", 0)~ A7RakLe3
    SAY @1276 /* You return to us again? */
    = @1277 /* I cannot sense the genies anymore, but our trap is still empty? */
    = @1278 /* You have failed us? We will feast on your innards. ATTACK THEM! */
    IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ 
      UNSOLVED_JOURNAL @1803 EXIT
  END


  // *** A7RakLe4: Requested dialog: party returns with a trapped creature in the item ***
  IF ~Global("A7Quest1", "GLOBAL", 4) !Global("A7Q1DaoTrapped", "GLOBAL", 0) PartyHasItem("A7MISC1A")~ A7RakLe4
    SAY @1279 /* You return? */
    = @1280 /* You return successfully. I can sense a creature within our trap. Give it to me! */
    IF ~HasItem("A7MISC1A", Player1)~ DO ~ActionOverride(Player1, GiveItem("A7MISC1A", "A7Mahel"))~ + A7RakLe4.1
    IF ~HasItem("A7MISC1A", Player2)~ DO ~ActionOverride(Player2, GiveItem("A7MISC1A", "A7Mahel"))~ + A7RakLe4.1
    IF ~HasItem("A7MISC1A", Player3)~ DO ~ActionOverride(Player3, GiveItem("A7MISC1A", "A7Mahel"))~ + A7RakLe4.1
    IF ~HasItem("A7MISC1A", Player4)~ DO ~ActionOverride(Player4, GiveItem("A7MISC1A", "A7Mahel"))~ + A7RakLe4.1
    IF ~HasItem("A7MISC1A", Player5)~ DO ~ActionOverride(Player5, GiveItem("A7MISC1A", "A7Mahel"))~ + A7RakLe4.1
    IF ~HasItem("A7MISC1A", Player6)~ DO ~ActionOverride(Player6, GiveItem("A7MISC1A", "A7Mahel"))~ + A7RakLe4.1
  END

  IF ~~ A7RakLe4.1
    SAY @1281 /* Let's see what you have brought us... */
    IF ~Global("A7Q1DaoTrapped", "GLOBAL", 2)~ + A7RakLe4.2
    IF ~Global("A7Q1DaoTrapped", "GLOBAL", 1)~ + A7RakLe4.4
  END

  IF ~~ A7RakLe4.2
    SAY @1282 /* Ah, I sense the trapped genie. Very good. */
    = @1283 /* You have fulfilled your end of the deal. This magic lamp is your reward. You are very resourceful for a <RACE>. */
    IF ~~ DO ~
      GiveItem("A7djlmp", LastTalkedToBy) 
      AddXP2DA("A7Q1MQ1")
      SetGlobal("A7Quest1", "GLOBAL", 9) 
      SetGlobal("A7Q1AfaaqRewarded", "GLOBAL", 1)~ + A7RakLe4.3
  END

  IF ~~ A7RakLe4.3
    SAY @1284 /* Our deal is completed. We will leave now, and so should you. */
    IF ~~ DO ~SetGlobal("A7RakTeleport", "A77001", 1) ReallyForceSpell(Myself, DRYAD_TELEPORT)~ 
      UNSOLVED_JOURNAL @1810 EXIT
  END

  IF ~~ A7RakLe4.4
    SAY @1285 /* This isn't the requested genie! */
    = @1286 /* You dare to betray us? We will feast on your innards. ATTACK THEM! */
    IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ 
      UNSOLVED_JOURNAL @1804 EXIT
  END


  // *** A7RakLe5: Requested dialog: party has trapped creature, but returns WITHOUT the item ***
  IF ~Global("A7Quest1", "GLOBAL", 4) !Global("A7Q1DaoTrapped", "GLOBAL", 0) !PartyHasItem("A7MISC1A")~ A7RakLe5
    SAY @1287 /* I have nothing more to say to you until you have finished your task. */
    IF ~~ THEN EXIT
  END


  // *** A7RakLe6: Djinni lamp stolen from rakshasa leader ***
  IF ~GlobalGT("A7Quest1", "GLOBAL", 1) !HasItem("A7djlmp", "A7Mahel")~ A7RakLe6
    SAY @1288 /* You dare to steal from us? We will feast on your innards. ATTACK THEM! */
    IF ~~ DO ~SetGlobal("A7RakAttacked", "A77001", 1) Enemy()~ 
      UNSOLVED_JOURNAL @1804 EXIT
  END
END
