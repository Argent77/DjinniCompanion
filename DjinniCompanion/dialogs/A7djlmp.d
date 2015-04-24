// *** Dialog file for conversable item "Afaaq's djinni lamp" ***
// Traified

BEGIN A7DJLMP

// *** Global "catch-all" dialog entry for self-initiated conversations (Global("A7LampTalk", "GLOBAL", 1) indicates a lamp talk request) ***
IF ~Global("A7LampTalk", "GLOBAL", 1) Global("A7AfaaqSummoned", "GLOBAL", 0) Global("A7AfaaqMet", "GLOBAL", 1)~ LampTalk.SelfInitiated
  SAY @21000 /* (The magical lamp in your possession starts to emit a faint pulsating light and the djinni turns his attention to you.) */
  IF ~True()~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.Failed    // failsafe mechanism
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Quest2Grateful", "GLOBAL", 1)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.Quest2Grateful
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q3AfaaqEssence", "AR2100", 1) Global("A7Quest3", "GLOBAL", 0)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.Quest3SenseSoul.1
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Q3AfaaqEssence", "AR2100", 1) Global("A7Quest3", "GLOBAL", 1)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.Quest3SenseSoul.2
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7Shangalar", "AR1008", 1)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.TwistedRune
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7SlaverHendak", "AR0406", 1)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.SlaverQuest
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7DrowGenie", "AR2200", 2) Global("DrowCityHostile", "GLOBAL", 0)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.DrowGenie.Detected
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7DrowGenie", "AR2200", 4) Global("DrowCityHostile", "GLOBAL", 0)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.DrowGenie.Released
  IF ~InPartySlot(LastTalkedToBy, 0) Global("WarnEfreetReaction", "A77002", 1)~ DO ~SetGlobal("A7LampTalk", "GLOBAL", 0)~ + LampTalk.Quest5WarnPresence
END

// *** Failsafe talk in case of faulty conditions ***
IF ~~ LampTalk.Failed
  SAY @21001 /* (However before you can react, the djinni turns away and the lamp is dark once again.) */
  IF ~~ EXIT
END

// *** Party has rescued Afaaq from the rakshasa high priest in the jungle region (Quest 2) ***
IF ~~ LampTalk.Quest2Grateful
  SAY @21002 /* I thank you, my <PRO_LADYLORD>. You have rescued me again from those despicable rakshasa, and for that I am grateful. I doubt they will hunt me down anymore as you have killed the one who managed to bind me to the lamp. */
  IF ~~ DO ~SetGlobal("A7Quest2Grateful", "GLOBAL", 2)~ EXIT
END

// *** Afaaq senses his sealed spiritual essence somewhere nearby (Quest 3) ***
// before talking to the duergars
IF ~~ LampTalk.Quest3SenseSoul.1
  SAY ~My <PRO_LADYLORD>, I can feel it!  Yes, I am almost certain of it.~
  = ~I can feel my stolen spiritual essence somewhere nearby. Does this also mean I am to face that person again?~
  + ~!Global("A7TalkAboutDrow", "GLOBAL", 0)~ + ~Are you talking about the drow who enslaved you once long ago?~ + LampTalk.Quest3SenseSoul.3
  + ~Global("A7TalkAboutDrow", "GLOBAL", 0)~ + ~Afaaq, what are you talking about?~ + LampTalk.Quest3SenseSoul.4
  ++ ~We don't have time to search for the ghosts of your past. My first priority is to find Irenicus.~ + LampTalk.Quest3SenseSoul.5
END

// after talking to the duergars
IF ~~ LampTalk.Quest3SenseSoul.2
  SAY ~My <PRO_LADYLORD>, I can feel it!~
  = ~I can feel my stolen spiritual essence somewhere nearby. The drow party mentioned by those duergars are most certainly in possession of it.~
  = ~Does this mean I am to face that person again?~
  + ~!Global("A7TalkAboutDrow", "GLOBAL", 0)~ + ~Are you talking about the drow who enslaved you once long ago?~ + LampTalk.Quest3SenseSoul.3
  + ~Global("A7TalkAboutDrow", "GLOBAL", 0)~ + ~Afaaq, what are you talking about?~ + LampTalk.Quest3SenseSoul.4
  ++ ~We don't have time to search for the ghosts of your past. My first priority is to find Irenicus.~ + LampTalk.Quest3SenseSoul.5
END

IF ~~ LampTalk.Quest3SenseSoul.3
  SAY ~Yes, I am. He took a vital part of my spiritual essence and sealed it away. Even though I have escaped his grasp, my essence is still in his possession.~
  = ~I implore you, my <PRO_LADYLORD>, to help me get my spiritual essence back. I doubt that I will get a chance like this a second time.~
  ++ ~Of course, I will help you find your lost soul. I know that feeling of loss too well myself.~ + LampTalk.Quest3SenseSoul.6
  ++ ~I'll keep my eyes open, but I can't promise anything.~ + LampTalk.Quest3SenseSoul.6
  ++ ~I will think about it if the oppertunity actually arises. My first priority is to find Irenicus after all.~ + LampTalk.Quest3SenseSoul.7
END

IF ~~ LampTalk.Quest3SenseSoul.4
  SAY ~As I have mentioned before, my binding to the lamp had been made possible only because of adverse circumstances. Those circumstances were caused by a drow party that crossed my path ages ago.~
  = ~I do not want to got into the details, but the drow have taken a major part of my spiritual essence and sealed it away. The loss of my essence made it even impossible for me to return to my home plane.~
  = ~I implore you, my <PRO_LADYLORD>, to help me get my spiritual essence back. I doubt that I will get a chance like this a second time.~
  ++ ~Of course, I will help you find your lost soul. I know that feeling of loss all too well myself.~ + LampTalk.Quest3SenseSoul.6
  ++ ~I'll keep my eyes open, but I can't promise anything.~ + LampTalk.Quest3SenseSoul.6
  ++ ~I will think about it if the oppertunity actually arises. My first priority is to find Irenicus after all.~ + LampTalk.Quest3SenseSoul.7
END

IF ~~ LampTalk.Quest3SenseSoul.5
  SAY ~I do understand your impatience, but I implore you not to turn your back on me when the opportunity arises.~
  ++ ~You are right, of course. I will help you find your lost essence.~ + LampTalk.Quest3SenseSoul.6
  ++ ~I'll keep my eyes open, but I can't promise anything.~ + LampTalk.Quest3SenseSoul.6
  ++ ~I will think about it if the oppertunity actually arises.~ + LampTalk.Quest3SenseSoul.7
END

IF ~~ LampTalk.Quest3SenseSoul.6
  SAY ~I am grateful for your assistance, my <PRO_LADYLORD>. Without your help I would surely be helpless before my former master.~
  IF ~~ DO ~SetGlobal("A7Q3AfaaqEssence", "AR2100", 3)~ EXIT
END

IF ~~ LampTalk.Quest3SenseSoul.7
  SAY ~Fair enough. I trust that you will decide wisely in the end.~
  IF ~~ DO ~SetGlobal("A7Q3AfaaqEssence", "AR2100", 3)~ EXIT
END


// *** Afaaq's remark when entering the Twisted Rune ***
IF ~~ LampTalk.TwistedRune
  SAY @21003 /* Something does not feel right. I urge you to be very careful, my <PRO_LADYLORD>. */
  IF ~~ DO ~SetGlobal("A7Shangalar", "AR1008", 2)~ EXIT
END

// *** Afaaq's remark after freeing Hendak and the slaves in the Slums of Athkatla ***
IF ~~ LampTalk.SlaverQuest
  SAY ~Now that the slavers and their base have been destroyed, you have made this part of the town a little safer...at least for a while. It is now for the authorities and the citizens themselves to prevent their return.~
  IF ~~ DO ~SetGlobal("A7SlaverHendak", "AR0406", 2) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~ EXIT
END

// *** Afaaq detects the tortured genie in Ust Natha ***
IF ~~ LampTalk.DrowGenie.Detected
  SAY @21004 /* That is a terrible fate, to be tormented endlessly by the drow without hope of deliverance. If we were not on a mission of secrecy, I would gladly free the djinni from his bonds. */
  IF ~~ DO ~SetGlobal("A7DrowGenie", "AR2200", 3)~ EXIT
END

// *** Afaaq's remark after CHARNAME released the tortured genie in Ust Natha ***
IF ~~ LampTalk.DrowGenie.Released
  SAY @21005 /* I thank you for risking your disguise and even your life to release the djinni from his bonds, my <PRO_LADYLORD>. Do not worry though, by destroying his physical shell he was able to return home without permanent damage. */
  IF ~~ DO ~SetGlobal("A7DrowGenie", "AR2200", 5) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 2) DisplayStringNoName(Player1, @60029)~ EXIT
END

// *** Afaaq warns CHARNAME of his presence when entering the Magma Cave (Quest 5) ***
IF ~~ LampTalk.Quest5WarnPresence
  SAY @21006 /* My <PRO_LADYLORD>, I strongly advise you to keep my presence hidden while you explore the lower caves. Whatever has made its home down there will surely react with hostility to any djinn intrusion. */
  IF ~~ DO ~SetGlobal("WarnEfreetReaction", "A77002", 2)~ EXIT
END



// The lamp doesn't work in dream area
IF ~OR(2) AreaCheck("AR0028") AreaCheck("AR0012")~ Lamp.Inactive
  SAY @21007 /* The lamp doesn't appear to work. */
  IF ~~ EXIT
END


// *** Not yet introduced ***
IF ~Global("A7AfaaqMet", "GLOBAL", 0)~ Lamp.New
  SAY @21008 /* You hold the lamp in your hands and attempt to find out what's inside. But you are unable to see anything... */
  = @21009 /* ...except for a faintly glowing mist which you have no explanation for. After a while you put it back into your inventory. */
  IF ~~ EXIT
END


// *** Djinni is not in his lamp ***
IF ~!InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqSummoned", "GLOBAL", 1)~ Lamp.Summoned.NPC
  SAY @21010 /* You look into the lamp but find nothing of interest. */
  ++ @21011 /* (Put the lamp away) */ EXIT
END

IF ~InPartySlot(LastTalkedToBy, 0) Global("A7AfaaqSummoned", "GLOBAL", 1)~ Lamp.Summoned
  SAY @21010 /* You look into the lamp but find nothing of interest. */
  + ~!StateCheck("A7Afaaq", CD_STATE_NOTVALID) InMyArea("A7Afaaq") !ActuallyInCombat()~ + @21012 /* (Switch places with Afaaq) */ + Lamp.SwitchPlaces
  + ~Global("AfaaqLight", "LOCALS", 1) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) InMyArea("A7Afaaq") !AreaCheck("A77006")~ 
    + @21013 /* (Force the djinni into the lamp) */ + Lamp.ForceUnsummonLight
  + ~Global("AfaaqLight", "LOCALS", 0) !Allegiance("A7Afaaq", ENEMY) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) InMyArea("A7Afaaq") !AreaCheck("A77006") 
    OR(2) !Global("InToB", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 1) GlobalLT("A7AfaaqForceUnsummon", "GLOBAL", 6)~ 
    + @21013 /* (Force the djinni into the lamp) */ + Lamp.ForceUnsummon1
  + ~Global("AfaaqLight", "LOCALS", 0) !Allegiance("A7Afaaq", ENEMY) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) InMyArea("A7Afaaq") !AreaCheck("A77006") 
    OR(2) !Global("InToB", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 1) GlobalGT("A7AfaaqForceUnsummon", "GLOBAL", 5) GlobalLT("A7AfaaqForceUnsummon", "GLOBAL", 11)~ 
    + @21013 /* (Force the djinni into the lamp) */ + Lamp.ForceUnsummon2
  + ~Global("AfaaqLight", "LOCALS", 0) !Allegiance("A7Afaaq", ENEMY) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) InMyArea("A7Afaaq") !AreaCheck("A77006") 
    OR(2) !Global("InToB", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 1) GlobalGT("A7AfaaqForceUnsummon", "GLOBAL", 10)~ 
    + @21013 /* (Force the djinni into the lamp) */ + Lamp.ForceUnsummon3
  ++ @21011 /* (Put the lamp away) */ EXIT
END


// Switch places with Afaaq
IF ~~ Lamp.SwitchPlaces
  SAY @21014 /* You focus your thoughts on the djinni and everything around you becomes blurry... */
  IF ~~ DO ~CreateCreature("A7AFQHLP", [-1.-1], 0) ActionOverride("A7AFQHLP", SetGlobal("SwitchPlaces", "LOCALS", 1))~ EXIT
END

// Forced unsummoning: The light version Djinni always tolerates your action
IF ~~ Lamp.ForceUnsummonLight
  SAY @21015 /* You open the lamp and begin to focus your thoughts. After a few moments you feel a slight gust of wind. The djinni is in his lamp and you put it back into your inventory. */
  IF ~~ DO ~SetGlobal("A7AfaaqUnsummonOverride", "GLOBAL", 1) CreateCreature("A7AFQHLP", [-1.-1], 0)~ EXIT
END


// Forced unsummoning: Djinni tolerates your action
IF ~~ Lamp.ForceUnsummon1
  SAY @21016 /* You open the lamp and begin to focus your thoughts. After a few moments you feel a slight gust of wind and hear a faint sigh. */
  = @21017 /* The djinni is in his lamp and you put it back into your inventory. You feel a little guilty, however. */
  IF ~~ DO ~SetGlobal("A7AfaaqUnsummonOverride", "GLOBAL", 1) IncrementGlobal("A7AfaaqForceUnsummon", "GLOBAL", 1) CreateCreature("A7AFQHLP", [-1.-1], 0)~ EXIT
END


// Forced unsummoning: Djinni is annoyed by your action
IF ~~ Lamp.ForceUnsummon2
  SAY @21018 /* You open the lamp and begin to focus your thoughts. After a few moments you feel a slight gust of wind and hear a faint growl. */
  = @21019 /* The djinni is in his lamp and you put it back into your inventory. You are certain that the djinni is annoyed by your actions, though. */
  IF ~~ DO ~SetGlobal("A7AfaaqUnsummonOverride", "GLOBAL", 1) IncrementGlobal("A7AfaaqForceUnsummon", "GLOBAL", 1) CreateCreature("A7AFQHLP", [-1.-1], 0)~ EXIT
END


// Forced unsummoning: Djinni is enslaved
IF ~~ Lamp.ForceUnsummon3
  SAY @21020 /* You open the lamp and begin to focus your thoughts. After a few moments you feel a slight gust of wind and hear a faint scream. */
  = @21021 /* The djinni is in his lamp and you put it back into your inventory. */
  IF ~~ DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", -1) DisplayStringNoName(Player1, @60030) SetGlobal("A7AfaaqUnsummonOverride", "GLOBAL", 1) CreateCreature("A7AFQHLP", [-1.-1], 0)~ EXIT
END

