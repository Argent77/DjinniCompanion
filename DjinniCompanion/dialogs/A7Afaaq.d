// *** Dialog file for Afaaq (specialized dialogs, but NO banters) ***
// Traified

BEGIN A7AFAAQ

// *** Afaaq's Introduction (Quest 1) ***
IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqMet", "GLOBAL", 0) Global("A7Q1AfaaqRewarded", "GLOBAL", 0) Global("AfaaqMetNPC", "LOCALS", 0) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Liberated.NPC.1
  SAY @11160 /* Greetings <RACE>, may I speak to my savior? */
  IF ~~ DO ~SetGlobal("AfaaqMetNPC", "LOCALS", 1)~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqMet", "GLOBAL", 0) Global("A7Q1AfaaqRewarded", "GLOBAL", 0) Global("AfaaqMetNPC", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Liberated.NPC.2
  SAY @11161 /* May I speak to my savior? */
  IF ~~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqMet", "GLOBAL", 0) Global("A7Q1AfaaqRewarded", "GLOBAL", 1) Global("AfaaqMetNPC", "LOCALS", 0) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Rewarded.NPC.1
  SAY @11162 /* Greetings <RACE>, may I speak to my new master? */
  IF ~~ DO ~SetGlobal("AfaaqMetNPC", "LOCALS", 1)~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqMet", "GLOBAL", 0) Global("A7Q1AfaaqRewarded", "GLOBAL", 1) Global("AfaaqMetNPC", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Rewarded.NPC.2
  SAY @11163 /* May I speak to my new master? */
  IF ~~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqMet", "GLOBAL", 0) Global("A7Q1AfaaqRewarded", "GLOBAL", 0) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Liberated
  SAY @11164 /* Greetings, my <PRO_LADYLORD>. I thank you for freeing me from the clutches of that despicable rakshasa. */
  IF ~~ DO ~SetGlobal("A7AfaaqMet", "GLOBAL", 1) SetGlobal("A7AfaaqFriendship", "GLOBAL", 5)~ + TalkIntro.0
END

IF ~InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqMet", "GLOBAL", 0) Global("A7Q1AfaaqRewarded", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkIntro.Rewarded
  SAY @11165 /* Greetings, my <PRO_LADYLORD>. (sigh) It appears that you are my new master then? */
  IF ~~ DO ~SetGlobal("A7AfaaqMet", "GLOBAL", 1) SetGlobal("A7AfaaqFriendship", "GLOBAL", 0)~ + TalkIntro.0
END

IF ~~ TalkIntro.0
  SAY @11166 /* My name is Afaaq. I belong to the race of djinn, genies of air. May I ask for your name? */
  ++ @11167 /* My name is <CHARNAME>. I'm pleased to meet you. */ + TalkIntro.1
  + ~Global("A7Q1AfaaqRewarded", "GLOBAL", 0)~ + @11168 /* I'd rather not tell my name. Who knows what a creature like you could misuse it for. */ + TalkIntro.2
  + ~Global("A7Q1AfaaqRewarded", "GLOBAL", 1)~ + @11169 /* You may call me <CHARNAME>. */ + TalkIntro.3
END

IF ~~ TalkIntro.1
  SAY @11170 /* The pleasure is all mine. */
  + ~CheckStatLT(Player1, 10, WIS)~ + @11171 /* Are you the proverbial djinni in a...lamp? */ + TalkIntro.4
  + ~CheckStatGT(Player1, 9, WIS)~ + @11172 /* How did you come to be bound to this lamp? */ + TalkIntro.5
  + ~GlobalLT("Chapter", "GLOBAL", %bg2_chapter_4%)~ + @11173 /* Please excuse my lack of manners, but I still have a wizard to catch. */ + TalkIntro.6
  + ~GlobalLT("Chapter", "GLOBAL", %bg2_chapter_4%) Global("A7Q1AfaaqRewarded", "GLOBAL", 0)~ + @11174 /* We should move on, Afaaq. I have yet another companion to free from her captors. */ + TalkIntro.6
  + ~GlobalGT("Chapter", "GLOBAL", %bg2_chapter_4%) GlobalLT("Chapter", "GLOBAL", %bg2_chapter_8%)~ + @11175 /* Please excuse my lack of manners, but I'm in a hurry to reclaim my soul. */ + TalkIntro.6
  ++ @11176 /* Well then, let's go! */ + TalkIntro.6
END

IF ~~ TalkIntro.2
  SAY @11177 /* You are a cautious one. But I have no intention to harm you. */
  + ~CheckStatLT(Player1, 10, WIS)~ + @11171 /* Are you the proverbial djinni in a...lamp? */ + TalkIntro.4
  + ~CheckStatGT(Player1, 9, WIS)~ + @11172 /* How did you come to be bound to this lamp? */ + TalkIntro.5
  + ~GlobalLT("Chapter", "GLOBAL", %bg2_chapter_4%)~ + @11173 /* Please excuse my lack of manners, but I still have a wizard to catch. */ + TalkIntro.6
  + ~GlobalLT("Chapter", "GLOBAL", %bg2_chapter_4%) Global("A7Q1AfaaqRewarded", "GLOBAL", 0)~ + @11174 /* We should move on, Afaaq. I have yet another companion to free from her captors. */ + TalkIntro.6
  + ~GlobalGT("Chapter", "GLOBAL", %bg2_chapter_4%) GlobalLT("Chapter", "GLOBAL", %bg2_chapter_8%)~ + @11175 /* Please excuse my lack of manners, but I'm in a hurry to reclaim my soul. */ + TalkIntro.6
  ++ @11176 /* Well then, let's go! */ + TalkIntro.6
END

IF ~~ TalkIntro.3
  SAY @11178 /* As you wish. */
  + ~CheckStatLT(Player1, 10, WIS)~ + @11171 /* Are you the proverbial djinni in a...lamp? */ + TalkIntro.4
  + ~CheckStatGT(Player1, 9, WIS)~ + @11172 /* How did you come to be bound to this lamp? */ + TalkIntro.5
  + ~GlobalLT("Chapter", "GLOBAL", %bg2_chapter_4%)~ + @11179 /* We should move on, Afaaq. I still have a wizard to catch. */ + TalkIntro.6
  + ~GlobalGT("Chapter", "GLOBAL", %bg2_chapter_4%) GlobalLT("Chapter", "GLOBAL", %bg2_chapter_8%)~ + @11180 /* We should move on, Afaaq. I still have a soul to reclaim. */ + TalkIntro.6
  ++ @11176 /* Well then, let's go! */ + TalkIntro.6
END

IF ~~ TalkIntro.4
  SAY @11181 /* Yes, indeed I am, my <PRO_LADYLORD>. I must commend you for grasping the obvious so quickly. */
  IF ~~ + TalkIntro.5
END

IF ~~ TalkIntro.5
  SAY @11182 /* My enslavement to the lamp was caused by powerful rakshasa sorcery. Usually I am capable of fending off their attacks easily, but adverse circumstances have led to my current plight. */
  IF ~~ + TalkIntro.6
END

IF ~~ TalkIntro.6
  SAY @11183 /* I will accompany you as long as you have my lamp in your possession. Truth be told, there is no other way while I am trapped in its enchantments. */
  = @11184 /* If you need my help, you can talk to me whenever you want. */
  IF ~~ DO ~EraseJournalEntry(@1801) EraseJournalEntry(@1802) EraseJournalEntry(@1803) EraseJournalEntry(@1804) EraseJournalEntry(@1810) EraseJournalEntry(@1811) EraseJournalEntry(@1812)
    AddFamiliar() ClearActions(Myself)~ SOLVED_JOURNAL @1820 EXIT
END


// *** Party has rescued Afaaq from the rakshasa high priest in the jungle region (Quest 2) ***
IF ~InPartySlot(LastTalkedToBy, 0) OR(2) Global("A7Quest2", "GLOBAL", 2) Global("A7Quest2", "GLOBAL", 10) Global("A7Quest2Grateful", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkQ2Thanks
  SAY @11185 /* I thank you, my <PRO_LADYLORD>. You have rescued me again from those despicable rakshasa, and for that I am grateful. I doubt they will hunt me down anymore as you have killed the one who managed to bind me to the lamp. */
  IF ~~ DO ~SetGlobal("A7Quest2Grateful", "GLOBAL", 2)~ EXIT
END


// *** Afaaq senses his sealed spiritual essence somewhere nearby (Quest 3) ***
// before talking to the duergars
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q3AfaaqEssence", "AR2100", 2) Global("A7Quest3", "GLOBAL", 0) Global("BanterActive", "LOCALS", 0)~ TalkQ3EssenceSensed.1.1
  SAY @11186 /* My <PRO_LADYLORD>, I can feel it!  Yes, I am almost certain of it. */
  = @11187 /* I can feel my stolen spiritual essence somewhere nearby. Does this also mean I am to face that person again? */
  + ~!Global("A7TalkAboutDrow", "GLOBAL", 0)~ + @11188 /* Are you talking about the drow who enslaved you once long ago? */ + TalkQ3EssenceSensed.1.3
  + ~Global("A7TalkAboutDrow", "GLOBAL", 0)~ + @11189 /* Afaaq, what are you talking about? */ + TalkQ3EssenceSensed.1.4
  ++ @11190 /* We don't have time to search for the ghosts of your past. My first priority is to find Irenicus. */ + TalkQ3EssenceSensed.1.5
END

// after talking to the duergars
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q3AfaaqEssence", "AR2100", 2) Global("A7Quest3", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkQ3EssenceSensed.1.2
  SAY @11191 /* My <PRO_LADYLORD>, I can feel it! */
  = @11192 /* I can feel my stolen spiritual essence somewhere nearby. The drow party mentioned by those duergars are most certainly in possession of it. */
  = @11193 /* Does this mean I am to face that person again? */
  + ~!Global("A7TalkAboutDrow", "GLOBAL", 0)~ + @11188 /* Are you talking about the drow who enslaved you once long ago? */ + TalkQ3EssenceSensed.1.3
  + ~Global("A7TalkAboutDrow", "GLOBAL", 0)~ + @11189 /* Afaaq, what are you talking about? */ + TalkQ3EssenceSensed.1.4
  ++ @11190 /* We don't have time to search for the ghosts of your past. My first priority is to find Irenicus. */ + TalkQ3EssenceSensed.1.5
END

IF ~~ TalkQ3EssenceSensed.1.3
  SAY @11194 /* Yes, I am. He took a vital part of my spiritual essence and sealed it away. Even though I have escaped his grasp, my essence is still in his possession. */
  = @11195 /* I implore you, my <PRO_LADYLORD>, to help me get my spiritual essence back. I doubt that I will get a chance like this a second time. */
  ++ @11196 /* Of course, I will help you find your lost soul. I know that feeling of loss too well myself. */ + TalkQ3EssenceSensed.1.6
  ++ @11197 /* I'll keep my eyes open, but I can't promise anything. */ + TalkQ3EssenceSensed.1.6
  ++ @11198 /* I will think about it if the opportunity actually arises. My first priority is to find Irenicus after all. */ + TalkQ3EssenceSensed.1.7
END

IF ~~ TalkQ3EssenceSensed.1.4
  SAY @11199 /* As I have mentioned before, my binding to the lamp had been made possible only because of adverse circumstances. Those circumstances were caused by a drow party that crossed my path ages ago. */
  = @11200 /* I do not want to go into the details, but the drow have taken a major part of my spiritual essence and sealed it away. The loss of my essence made it even impossible for me to return to my home plane. */
  = @11195 /* I implore you, my <PRO_LADYLORD>, to help me get my spiritual essence back. I doubt that I will get a chance like this a second time. */
  ++ @11201 /* Of course, I will help you find your lost soul. I know that feeling of loss all too well myself. */ + TalkQ3EssenceSensed.1.6
  ++ @11197 /* I'll keep my eyes open, but I can't promise anything. */ + TalkQ3EssenceSensed.1.6
  ++ @11198 /* I will think about it if the opportunity actually arises. My first priority is to find Irenicus after all. */ + TalkQ3EssenceSensed.1.7
END

IF ~~ TalkQ3EssenceSensed.1.5
  SAY @11202 /* I do understand your impatience, but I implore you not to turn your back on me when the opportunity arises. */
  ++ @11203 /* You are right, of course. I will help you find your lost essence. */ + TalkQ3EssenceSensed.1.6
  ++ @11197 /* I'll keep my eyes open, but I can't promise anything. */ + TalkQ3EssenceSensed.1.6
  ++ @11204 /* I will think about it if the opportunity actually arises. */ + TalkQ3EssenceSensed.1.7
END

IF ~~ TalkQ3EssenceSensed.1.6
  SAY @11205 /* I am grateful for your assistance, my <PRO_LADYLORD>. Without your help I would surely be helpless before my former master. */
  IF ~~ DO ~SetGlobal("A7Q3AfaaqEssence", "AR2100", 3)~ EXIT
END

IF ~~ TalkQ3EssenceSensed.1.7
  SAY @11206 /* Fair enough. I trust that you will decide wisely in the end. */
  IF ~~ DO ~SetGlobal("A7Q3AfaaqEssence", "AR2100", 3)~ EXIT
END


IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q3AfaaqEssence2", "AR2100", 1) GlobalLT("A7Q3AfaaqEssence", "AR2100", 3) GlobalLT("A7Quest3", "GLOBAL", 2) Global("BanterActive", "LOCALS", 0)~ TalkQ3EssenceSensed.2
  SAY @11207 /* My <PRO_LADYLORD>, I urge you to investigate the drow encampment that the duergar merchants have mentioned. You do not know how long your stay in the Underdark may last. */
  IF ~~ DO ~SetGlobal("A7Q3AfaaqEssence", "AR2100", 3) SetGlobal("A7Q3AfaaqEssence2", "AR2100", 2)~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q3AfaaqEssence2", "AR2100", 1) Global("A7Q3AfaaqEssence", "AR2100", 3) GlobalLT("A7Quest3", "GLOBAL", 2) Global("BanterActive", "LOCALS", 0)~ TalkQ3EssenceSensed.3
  SAY @11208 /* My <PRO_LADYLORD>, I implore you to investigate further whether I am right about my spiritual essence being nearby. I have felt it strongest near the duergar merchants. */
  IF ~~ DO ~SetGlobal("A7Q3AfaaqEssence2", "AR2100", 2)~ EXIT
END


// *** CHARNAME's reputation has reached 19 or higher ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Reputation19", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkReputation19
  SAY @11209 /* My <PRO_LADYLORD>, I am truly impressed by your steadfast dedication to support the downtrodden and fight against evil. You are an honorable <PRO_MANWOMAN> and I am proud to fight at your side. */
  IF ~~ DO ~SetGlobal("A7Reputation19", "GLOBAL", 2)~ EXIT
END


// *** Afaaq senses Kangaxx nearby ***
IF ~InPartySlot(LastTalkedToBy, 0) AreaCheck("AR0300") !Dead("hldemi") Global("KangaxxSensed", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkKangaxxSensed.1
  SAY @11210 /* My <PRO_LADYLORD>, I am sensing a powerful alien presence nearby. It is emanating from somewhere behind that door. */
  IF ~~ DO ~SetGlobal("KangaxxSensed", "LOCALS", 2)~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) AreaCheck("AR0330") !Dead("hldemi") GlobalLT("KangaxxSensed", "LOCALS", 2) Global("BanterActive", "LOCALS", 0)~ TalkKangaxxSensed.2
  SAY @11211 /* My <PRO_LADYLORD>, I am sensing a powerful alien presence nearby. It is emanating from somewhere down below this room. */
  IF ~~ DO ~SetGlobal("KangaxxSensed", "LOCALS", 3)~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) AreaCheck("AR0330") !Dead("hldemi") Global("KangaxxSensed", "LOCALS", 2) Global("BanterActive", "LOCALS", 0)~ TalkKangaxxSensed.3
  SAY @11212 /* The presence is much stronger now. I can feel it coming from somewhere down below this room. */
  IF ~~ DO ~SetGlobal("KangaxxSensed", "LOCALS", 3)~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) AreaCheck("AR0331") !Dead("hldemi") GlobalLT("KangaxxSensed", "LOCALS", 2) Global("BanterActive", "LOCALS", 0)~ TalkKangaxxSensed.4
  SAY @11213 /* My <PRO_LADYLORD>, there is a powerful presence in this room. It is almost overwhelming my senses. */
  IF ~~ DO ~SetGlobal("KangaxxSensed", "LOCALS", 4)~ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) AreaCheck("AR0331") !Dead("hldemi") GlobalGT("KangaxxSensed", "LOCALS", 1) GlobalLT("KangaxxSensed", "LOCALS", 4) Global("BanterActive", "LOCALS", 0)~ TalkKangaxxSensed.5
  SAY @11214 /* The presence is very near. It is almost overwhelming my senses. */
  IF ~~ DO ~SetGlobal("KangaxxSensed", "LOCALS", 4)~ EXIT
END


// *** Afaaq's remark when entering the Twisted Rune ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Shangalar", "AR1008", 1) Global("BanterActive", "LOCALS", 0)~ TalkTwistedRune
  SAY @11215 /* Something does not feel right. I urge you to be very careful, my <PRO_LADYLORD>. */
  IF ~~ DO ~SetGlobal("A7Shangalar", "AR1008", 2)~ EXIT
END


// *** Afaaq's remark after freeing the slaves in the Slums of Athkatla ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7SlaverHendak", "AR0406", 1) Global("BanterActive", "LOCALS", 0)~ TalkSlaverQuest
  SAY @11216 /* Now that the slavers and their base have been destroyed, you have made this part of the town a little safer...at least for a while. It is now for the authorities and the citizens themselves to prevent their return. */
  IF ~~ DO ~SetGlobal("A7SlaverHendak", "AR0406", 2) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~ EXIT
END


// *** Afaaq's remark after CHARNAME has defeated the warden in the Planar Prison ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7PlanarPrisonLiberated", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkPlanarPrison
  SAY @11217 /* You have taken a significant risk rescuing the actors by following them into unknown territory. You could have easily shared their fate in the end. */
  = @11218 /* Your actions speak well of you, my <PRO_LADYLORD>, and I am honored to share your company. */
  IF ~~ DO ~SetGlobal("A7PlanarPrisonLiberated", "GLOBAL", 2) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~ EXIT
END


// *** Afaaq detects the tortured genie in Ust Natha ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7DrowGenie", "AR2200", 2) Global("DrowCityHostile", "GLOBAL", 0) Global("BanterActive", "LOCALS", 0)~ TalkDrowGenie.Detected
  SAY @11219 /* That is a terrible fate, to be tormented endlessly by the drow without hope of deliverance. If we were not on a mission of secrecy, I would gladly free the djinni from his bonds. */
  IF ~~ DO ~SetGlobal("A7DrowGenie", "AR2200", 3)~ EXIT
END


// *** Afaaq's remark after CHARNAME released the tortured genie in Ust Natha ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7DrowGenie", "AR2200", 4) Global("BanterActive", "LOCALS", 0)~ TalkDrowGenie.Released
  SAY @11220 /* I thank you for risking your disguise and even your life to release the djinni from his bonds, my <PRO_LADYLORD>. Do not worry though, by destroying his physical shell he was able to return home without taking permanent damage. */
  IF ~~ DO ~SetGlobal("A7DrowGenie", "AR2200", 5) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 2) DisplayStringNoName(Player1, @60029)~ EXIT
END


// *** Afaaq's remark after CHARNAME released the slaves from the Illithid Lair in the Underdark ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7IllithidSlaves", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkIllithidSlaves.Released
  SAY @11221 /* I am glad that we could free the slaves from the Illithids. With luck they will reach the surface eventually. */
  IF ~~ DO ~SetGlobal("A7IllithidSlaves", "GLOBAL", 2) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~ EXIT
END


// *** Afaaq recognizes Tathas' soulcage collection (Quest 3) ***
IF ~InPartySlot(LastTalkedToBy, 0) GlobalGT("A7Quest3", "GLOBAL", 0) Global("Q3CollectionFound", "LOCALS", 1) Global("Player1Greed", "GLOBAL", 0) Global("BanterActive", "LOCALS", 0)~ TalkQ3SoulCollection
  SAY @11222 /* What did you find on the body of the drow, my <PRO_LADYLORD>? I am sensing a familiar presence in your possession. */
  IF ~~ DO ~SetGlobal("Q3CollectionFound", "LOCALS", 2)~ + TalkQ3SoulCollection.1
END

IF ~~ TalkQ3SoulCollection.1
  SAY @11223 /* Yes, I am sure of it. You have found the collection of imprisoned souls Tathas Melarn has captured in his lifetime. Let me examine it more closely... */
  = @11224 /* I have finally found a glimmer of hope that my imprisonment will come to an end. This crystal contains a major portion of my spiritual essence. Unfortunately it is sealed away and I have not the power to break it. I implore you, my <PRO_LADYLORD>, please keep it safe from any harm until I find a way to access its contents. */
  IF ~HasItem("A7MISC5", Player1)~ DO ~ActionOverride(Player1, DestroyItem("A7MISC5")) ActionOverride(Player1, CreateItem("A7MISC6", 0, 0, 0)) AddXP2DA("A7Q3AFQ")~ UNSOLVED_JOURNAL @3850 EXIT
  IF ~HasItem("A7MISC5", Player2)~ DO ~ActionOverride(Player2, DestroyItem("A7MISC5")) ActionOverride(Player2, CreateItem("A7MISC6", 0, 0, 0)) AddXP2DA("A7Q3AFQ")~ UNSOLVED_JOURNAL @3850 EXIT
  IF ~HasItem("A7MISC5", Player3)~ DO ~ActionOverride(Player3, DestroyItem("A7MISC5")) ActionOverride(Player3, CreateItem("A7MISC6", 0, 0, 0)) AddXP2DA("A7Q3AFQ")~ UNSOLVED_JOURNAL @3850 EXIT
  IF ~HasItem("A7MISC5", Player4)~ DO ~ActionOverride(Player4, DestroyItem("A7MISC5")) ActionOverride(Player4, CreateItem("A7MISC6", 0, 0, 0)) AddXP2DA("A7Q3AFQ")~ UNSOLVED_JOURNAL @3850 EXIT
  IF ~HasItem("A7MISC5", Player5)~ DO ~ActionOverride(Player5, DestroyItem("A7MISC5")) ActionOverride(Player5, CreateItem("A7MISC6", 0, 0, 0)) AddXP2DA("A7Q3AFQ")~ UNSOLVED_JOURNAL @3850 EXIT
  IF ~HasItem("A7MISC5", Player6)~ DO ~ActionOverride(Player6, DestroyItem("A7MISC5")) ActionOverride(Player6, CreateItem("A7MISC6", 0, 0, 0)) AddXP2DA("A7Q3AFQ")~ UNSOLVED_JOURNAL @3850 EXIT
END


// *** Afaaq comments on his soulcage after party received it from Tathas (Quest 3) ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Quest3", "GLOBAL", 10) Global("Q3SoulcageRewarded", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkQ3SoulCageRewarded
  SAY @11225 /* The soulcage is in our possession and I can finally see a glimmer of hope that my imprisonment will come to an end. */
  = @11226 /* Unfortunately the seal which protects it is strong and I have not the power to break it. I implore you, my <PRO_LADYLORD>, please keep it safe from any harm until I find a way to access its contents. */
  IF ~!Global("A7TathasAttacked", "GLOBAL", 0)~ EXIT
  IF ~Global("A7TathasAttacked", "GLOBAL", 0)~ DO ~SetGlobal("Q3SoulcageRewarded", "LOCALS", 2)~ UNSOLVED_JOURNAL @3851 EXIT
END


// *** When entered the djinni lamp interior the first time ***
IF ~Name("A7Q6COPY", LastTalkedToBy) AreaCheck("A77006") Global("LampInvitation", "LOCALS", 1) Global("BanterActive", "LOCALS", 0)~ TalkDjinniLampInterior.1
  SAY @11227 /* Welcome to my home, <CHARNAME>. */
  = @11228 /* After you broke the enchantments which bound me to the lamp, I have tried to make this pocket plane more homely by creating this small platform of solid matter. */
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


// *** In Subterranean Cave: Afaaq warns CHARNAME of his presence before entering the Magma Cavern (Quest 5) ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("WarnEfreetReaction", "A77002", 1) GlobalLT("A7Quest5", "GLOBAL", 10) AreaCheck("A77002") Global("BanterActive", "LOCALS", 0)~ TalkQ5WarnPresence.1
  SAY @11231 /* My <PRO_LADYLORD>, I strongly advise you to hide my presence before you enter the lower caves. Whatever has made its home down there will surely react with hostility to any djinn intrusion. */
  ++ @11232 /* Good point. I think you should take a rest for a while. */ DO ~SetGlobal("WarnEfreetReaction", "A77002", 2)~ + TalkQ5WarnPresence.2
  + ~CheckStatGT(LastTalkedToBy, 13, INT)~ + @11233 /* Maybe you could tag along if you turn invisible. */ DO ~SetGlobal("WarnEfreetReaction", "A77002", 2)~ + TalkQ5WarnPresence.3
  ++ @11234 /* Thanks for the warning, but I'll take my chances. */ DO ~SetGlobal("WarnEfreetReaction", "A77002", 2)~ + TalkQ5WarnPresence.4
END

IF ~~ TalkQ5WarnPresence.2
  SAY @11235 /* That is a sensible precaution. */
  IF ~~ DO ~SetGlobal("unsummoning", "LOCALS", 1) ClearActions(Myself)~ EXIT
END

IF ~~ TalkQ5WarnPresence.3
  SAY @11236 /* You are playing with fire, my <PRO_LADYLORD>! The enemy might have the ability to sense me nonetheless. It is worth a try though. */
  IF ~~ DO ~SpellRES("A7SPIN1", Myself)~ EXIT
END

IF ~~ TalkQ5WarnPresence.4
  SAY @11237 /* That is up to you. */
  IF ~~ EXIT
END


// *** After finishing Quest 5: If CHARNAME betrayed the djinnis ***
IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q5ChallengePC", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkQ5DjinnBetrayed.1
  SAY @11238 /* I despise you, <CHARNAME>, for what you have done to Sharif Karim and his subordinates. Your actions are many times worse than the humiliations I have suffered in the past. */
  = @11239 /* I will let you feel what it means to provoke the wrath of a djinni. Prepare yourself! */
  IF ~~ DO ~SetGlobal("A7Q5ChallengePC", "GLOBAL", 2)
    SetGlobal("A7AfaaqHostile", "GLOBAL", 1)
    ChangeAIScript("", OVERRIDE)
    ChangeAIScript("", CLASS) 
    ChangeAIScript("A7AFATKX", DEFAULT) 
    SetDialogue("A7AFAAQX")
    RemoveFamiliar()
    Enemy()~ EXIT
END


// *** Upgraded djinni: Introduction talk ***
IF ~NumTimesTalkedTo(0) !InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkIntroUpgraded.NPC
  SAY @11240 /* Please let me speak to <CHARNAME>. */
  IF ~~ DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~NumTimesTalkedTo(0) InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("BanterActive", "LOCALS", 0)~ TalkIntroUpgraded
  SAY @11241 /* My body... my mind... I am whole again. And I have to thank you, <CHARNAME>, for it. */
  IF ~Global("A7AfaaqLeaveParty", "GLOBAL", 0)~ DO ~AddFamiliar()~ + TalkIntroUpgraded.1
  IF ~Global("A7AfaaqLeaveParty", "GLOBAL", 1)~ DO ~AddFamiliar()~ + TalkIntroUpgraded.2
END

IF ~~ TalkIntroUpgraded.1
  SAY @11242 /* As you have helped me, I pledge my service and my eternal friendship to you as long as you desire. */
  IF ~~ DO ~EraseJournalEntry(@3850)
      EraseJournalEntry(@3851)
      EraseJournalEntry(@4800)
      EraseJournalEntry(@4801)
      EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4825 EXIT
END

IF ~~ TalkIntroUpgraded.2
  SAY @11243 /* You have helped me regain my powers, so I will help you in turn to reclaim your soul. */
  = @11244 /* But I will not stay much longer. */
  IF ~~ DO ~EraseJournalEntry(@3850) EraseJournalEntry(@3851)~ UNSOLVED_JOURNAL @4802 EXIT
END


// *** Afaaq is about to leave CHARNAME ***
IF ~Global("A7AfaaqLeaveParty", "GLOBAL", 2) !InPartySlot(LastTalkedToBy, 0) Global("BanterActive", "LOCALS", 0)~ TalkLeave.0
  SAY @11245 /* I need to speak with <CHARNAME>. */
  IF ~~ EXIT
END

IF ~Global("A7AfaaqLeaveParty", "GLOBAL", 2) InPartySlot(LastTalkedToBy, 0) Global("BanterActive", "LOCALS", 0)~ TalkLeave.1
  SAY @11246 /* <CHARNAME>, I have something important to discuss with you. */
  = @11247 /* You have your soul back and I have fulfilled my promise to you. It is now your turn to keep your promise. Please release me from your service. */
  + ~PartyHasItem("A7DJLMPA")~ + @11248 /* You are right, Afaaq. You are free and I wish you well on your journey home. */ + TalkLeave.2
  + ~PartyHasItem("A7DJLMPA")~ + @11249 /* You are a very important member of our party. Won't you reconsider your decision to leave? */ + TalkLeave.3
  // + ~!PartyHasItem("A7DJLMPA")~ + ~Even if I wanted to keep my promise, I'm unable to do so because I don't have your lamp anymore.~ + TalkLeave.4
  + ~!PartyHasItem("A7DJLMPA")~ + @11250 /* That is not possible, because I dumped your lamp long ago. */ + TalkLeave.4
  ++ @11251 /* You are too useful to let you go. I won't allow it. */ + TalkLeave.5
END

IF ~~ TalkLeave.2
  SAY @11252 /* I thank you wholeheartedly. You have shown great wisdom in your decision and I will not forget it. */
  = @11253 /* I wish you well and may your future shine brightly, <CHARNAME>. */
  IF ~Global("A7AfaaqStore", "GLOBAL", 1)~ DO ~
    CreateCreature("A7AFQHLP", [-1.-1], 0)
    ActionOverride("A7AFQHLP", TakePartyItem("A7DJLMP"))
    ActionOverride("A7AFQHLP", TakePartyItem("A7DJLMPA"))
    ActionOverride("A7AFQHLP", DestroySelf())~ + TalkLeave.2.1
  IF ~!Global("A7AfaaqStore", "GLOBAL", 1)~ DO ~
    CreateCreature("A7AFQHLP", [-1.-1], 0)
    ActionOverride("A7AFQHLP", TakePartyItem("A7DJLMP"))
    ActionOverride("A7AFQHLP", TakePartyItem("A7DJLMPA"))
    ActionOverride("A7AFQHLP", DestroySelf())
    SetGlobal("A7Q5AfaaqAppears", "GLOBAL", 1) 
    RemoveFamiliar()
    ChangeEnemyAlly(Myself, NEUTRAL) 
    ChangeAIScript("", OVERRIDE) 
    ChangeAIScript("", CLASS) 
    ChangeAIScript("", DEFAULT) 
    EscapeAreaDestroy(5)
    EraseJournalEntry(@4800)
    EraseJournalEntry(@4801)
    EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4827 EXIT
END

IF ~~ TalkLeave.2.1
  SAY @11254 /* But before I go, you should retrieve all items that you have left me for safekeeping. Who knows when we will meet each other again? */
  IF ~~ DO ~StartStore("A7AFQINV", LastTalkedToBy(Myself))~ + TalkLeave.2.2
END

IF ~~ TalkLeave.2.2
  SAY @11255 /* Have you picked up everything you need? */
  ++ @11256 /* I'm not sure. Please let me take a look again. */ DO ~StartStore("A7AFQINV", LastTalkedToBy(Myself))~ + TalkLeave.2.2
  ++ @11257 /* Yes, I have. Thank you again for all your help. Farewell! */ DO ~
    SetGlobal("A7Q5AfaaqAppears", "GLOBAL", 1) 
    RemoveFamiliar()
    ChangeEnemyAlly(Myself, NEUTRAL) 
    ChangeAIScript("", OVERRIDE) 
    ChangeAIScript("", CLASS) 
    ChangeAIScript("", DEFAULT) 
    EscapeAreaDestroy(5)
    EraseJournalEntry(@4800)
    EraseJournalEntry(@4801)
    EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4827 EXIT
END

IF ~~ TalkLeave.3
  SAY @11258 /* I have stayed for too long on the prime material plane. As much as I appreciate your request, I long to see my home again. */
  ++ @11259 /* Then I release you from my service. You are free and I wish you well on your journey home. */ + TalkLeave.2
  ++ @11260 /* I have to keep you in my party. You are too useful to let you go. */ + TalkLeave.5
END

IF ~~ TalkLeave.4
  SAY @11261 /* This is the most impudent insult I have heard for ages. You have deliberately cut off my means to be free. */
  = @11239 /* I will let you feel what it means to provoke the the wrath of a djinni. Prepare yourself! */
  IF ~~ DO ~SetGlobal("A7AfaaqLeaveParty", "GLOBAL", 3)
    SetGlobal("A7AfaaqHostile", "GLOBAL", 1)
    ChangeAIScript("", OVERRIDE)
    ChangeAIScript("", CLASS) 
    ChangeAIScript("A7AFATKX", DEFAULT) 
    SetDialogue("A7AFAAQX")
    RemoveFamiliar()
    Enemy()
    EraseJournalEntry(@4800)
    EraseJournalEntry(@4801)
    EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4828 EXIT
END

IF ~~ TalkLeave.5
  SAY @11262 /* If you deny my wish to release me, I have to force you to keep your promise. Prepare yourself! */
  IF ~~ DO ~SetGlobal("A7AfaaqLeaveParty", "GLOBAL", 3)
    SetGlobal("A7AfaaqHostile", "GLOBAL", 1)
    ChangeAIScript("", OVERRIDE)
    ChangeAIScript("", CLASS) 
    ChangeAIScript("A7AFATKX", DEFAULT) 
    SetDialogue("A7AFAAQX")
    RemoveFamiliar()
    Enemy()
    EraseJournalEntry(@4800)
    EraseJournalEntry(@4801)
    EraseJournalEntry(@4802)~ SOLVED_JOURNAL @4828 EXIT
END
