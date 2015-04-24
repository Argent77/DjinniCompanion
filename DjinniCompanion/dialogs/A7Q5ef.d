// *** Quest 5: Generic dialog for the efreets ***
// Traified

BEGIN A7Q5EF

// Party has to talk to the commander first
IF ~Global("A7Q5MeetCommander", "A77003", 0)~ A7Q5EF.Intro.1
  SAY @5680 /* Please talk to our commander first, mortal. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// Generic talks before doing any quest for the efreets
IF ~Global("A7Q5SubQuest1", "A77003", 0) RandomNum(3, 1)~ A7Q5EF.Generic.1
  SAY @5681 /* It is highly unusual that you are tolerated by our commander. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) RandomNum(3, 2)~ A7Q5EF.Generic.2
  SAY @5682 /* You are a <RACE>, aren't you? I haven't seen many of your kind yet. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) RandomNum(3, 3)~ A7Q5EF.Generic.3
  SAY @5683 /* I was told that mortals cannot survive in hot environments like these. You must be a powerful spellcaster. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// Talks when doing Mini-quest 1
IF ~OR(2) Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SubQuest1", "A77003", 2) RandomNum(3, 1)~ A7Q5EF.MiniQuest1.1
  SAY @5684 /* The commander wants to ensure your loyalty? This is a sensible precaution. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~OR(2) Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SubQuest1", "A77003", 2) RandomNum(3, 2)~ A7Q5EF.MiniQuest1.2
  SAY @5685 /* The salamanders slipped through the portal unnoticed shortly after we arrived. Since then they have taken up residence in one of the southern buildings. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~OR(2) Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SubQuest1", "A77003", 2) RandomNum(3, 3)~ A7Q5EF.MiniQuest1.3
  SAY @5686 /* You have quite a task before you, <RACE>. We didn't have much success to recruit the salamanders for our mission. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 3) RandomNum(3, 1)~ A7Q5EF.MiniQuest1.4
  SAY @5687 /* Mephits are quick to occupy any places which provide environments similar to their elemental origin. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 3) RandomNum(3, 2)~ A7Q5EF.MiniQuest1.5
  SAY @5688 /* Don't worry about killing any mephit you encounter in this place. They are too unreliable to be used in combat anyway. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 3) RandomNum(3, 3)~ A7Q5EF.MiniQuest1.6
  SAY @5689 /* Mephits usually attack in groups, because of their cowardly nature. This will make your hunt for their blood easier. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 4)~ A7Q5EF.MiniQuest1.7
  SAY @5690 /* Very good, very good. The sooner you have delivered the elemental, the sooner we have ensured their loyalty...and yours. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 5) RandomNum(2, 1)~ A7Q5EF.MiniQuest1.8
  SAY @5691 /* Our commander will be delighted to hear news of your success. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 5) RandomNum(2, 2)~ A7Q5EF.MiniQuest1.9
  SAY @5692 /* I commend you, <RACE>. Persuading the salamanders to join our mission was surely no easy task. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 9)~ A7Q5EF.MiniQuest1.10
  SAY @5693 /* The salamanders are as untrustworthy as I thought. The commander will be displeased. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// Talks when doing Mini-quest 2
IF ~Global("A7Q5SubQuest2", "A77003", 1) RandomNum(4, 1)~ A7Q5EF.MiniQuest2.1
  SAY @5694 /* Trolls make good front-liners. They are tough and won't die easily. Unfortunately they have their weaknesses, too. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest2", "A77003", 1) RandomNum(4, 2)~ A7Q5EF.MiniQuest2.2
  SAY @5695 /* You ask why you can't talk to our elementals? They are barely sentient parts of our home plane and are controlled directly by our commander. */
  = @5696 /* Unless the summoner enables verbal communication, they will only follow telepathic commands. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest2", "A77003", 1) RandomNum(4, 3)~ A7Q5EF.MiniQuest2.3
  SAY @5697 /* The salamanders will be a useful addition to our army. Unfortunately the price for their loyalty is always high. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Q5SubQuest2", "A77003", 1) RandomNum(4, 4)~ A7Q5EF.MiniQuest2.4
  SAY @5698 /* We do have the means to protect ourselves from the elemental forces, but we cannot be distracted needlessly in the heat of battle. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// Talk when Malik has appeared
IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Gossip1", "MYAREA", 0) RandomNum(3, 1)~ A7Q5EF.Malik.Gossip
  SAY @5699 /* Seizing the djinn stronghold is an important milestone towards our goal. But I shouldn't say more about it. */
  ++ @5700 /* What goal? */ + A7Q5EF.Malik.Gossip.1
END

IF ~~ A7Q5EF.Malik.Gossip.1
  SAY @5701 /* No, this isn't for you to know, <RACE>. */
  IF ~~ DO ~SetGlobal("A7Q5Gossip1", "MYAREA", 1) ClearActions(Myself)~ EXIT
END

IF ~Global("A7Quest5", "GLOBAL", 4) RandomNum(3, 1)~ A7Q5EF.Malik.1
  SAY @5702 /* Lord Malik has proven his outstanding tactical qualities many times already. This mission will be an easy one. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Quest5", "GLOBAL", 4) RandomNum(3, 2)~ A7Q5EF.Malik.2
  SAY @5703 /* I took part in Lord Malik's campaign against the gold dragons of the Orsraun Mountains. Although the odds were against us, Lord Malik's brilliant tactical maneuvers saved the day. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~Global("A7Quest5", "GLOBAL", 4) RandomNum(3, 3)~ A7Q5EF.Malik.3
  SAY @5704 /* It is highly unusual that Lord Malik shares his plans with outsiders, but I trust in his judgement. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

