// *** Dialog file for serpent statue in A77004 ***
// Traified

BEGIN A7Q2SERP

// One of your party members talk to the statue
IF ~!InPartySlot(LastTalkedToBy, 0) !Name("Imoen2", LastTalkedToBy)~ Statue.NPC
  SAY @2001    // The serpent statue begins to glow and <GABBER> senses an alien presence...
  = @2002    // YOU ARE NOT WORTHY OF MY PRESENCE. BEGONE!
  = @2003    // It retreats as quickly as it came and leaves <HIMHER> slightly shaken.
  IF ~RandomNum(2, 1)~ EXIT
  IF ~RandomNum(2, 2)~ DO ~MoraleInc(LastTalkedToBy, -10)~ EXIT
END

// First time talk to one of the bhaalspawns
IF ~OR(2) InPartySlot(LastTalkedToBy, 0) Name("Imoen2", LastTalkedToBy) Global("SerpentRiddle", "A77004", 0)~ Statue.Intro1
  SAY @2005    // The serpent statue begins to glow and you sense an alien presence in your head...
  = @2006    // Images of long past memories flit before your eyes, occasionally mingled with a feeling of amusement...
  IF ~~ DO ~SetGlobal("SerpentRiddle", "A77004", 1)~ + Statue.1
END

// Subsequent talks
IF ~OR(2) InPartySlot(LastTalkedToBy, 0) Name("Imoen2", LastTalkedToBy) Global("SerpentRiddle", "A77004", 1)~ Statue.Intro2
  SAY @2007    // The serpent statue begins to glow and your mind is quickly probed by the presence once again.
  = @2008    // You stand before me again? Have you changed your mind? Are you now ready to answer my riddles?
  ++ @2009 + Statue.7    // Aye.
  ++ @2010 + Statue.Refused    // Nay.
END

IF ~~ Statue.1
  SAY @2011    // You are not one of my followers. Your kind doesn't belong here, but I sense you are more than you appear.
  = @2012    // Yes, I feel the divine power of your soul.
  = @2013    // I know your intentions, <GABBER>. You want to reclaim your prize from my hunters.
  ++ @2014 + Statue.2    // I don't know what you are talking about.
  ++ @2015 + Statue.3    // You are right. I intend to take back what they have stolen from me.
END

IF ~~ Statue.2
  SAY @2016    // You can not fool me, I know your thoughts.
  IF ~~ + Statue.3
END

IF ~~ Statue.3
  SAY @2017    // You are a brave creature following my hunters into unknown territory.
  = @2018    // I respect strength and cunning. My followers have disappointed me greatly, so I will help you.
  = @2019    // Prove your worth to me and I will bring you one step closer to your goal.
  + ~!Dead("A7Mahel")~ + @2020 + Statue.4    // What do you have in mind?
  + ~Dead("A7Mahel")~ + @2020 + Statue.5    // What do you have in mind?
  // ++ @2021 + Statue.Refused    // I don't want to play your games.
END

IF ~~ Statue.4
  SAY @2022    // You have proven your cunning by stealing from my favorite hunter.
  IF ~~ + Statue.6
END

IF ~~ Statue.5
  SAY @2023    // You have proven your strength by defeating my favorite hunter.
  IF ~~ + Statue.6
END

IF ~~ Statue.6
  SAY @2024    // But I want to make sure you are strong not only in body but also in mind.
  = @2025    // Answer my riddles correctly and I grant you my help.
  ++ @2026 + Statue.7    // I accept your condition.
  ++ @2021 + Statue.Refused    // I don't want to play your games.
END

IF ~~ Statue.7
  SAY @2027    // Here is my first riddle. Listen carefully.
  IF ~RandomNum(5, 1)~ + Statue.Riddle.1
  IF ~RandomNum(5, 2)~ + Statue.Riddle.2
  IF ~RandomNum(5, 3)~ + Statue.Riddle.3
  IF ~RandomNum(5, 4)~ + Statue.Riddle.4
  IF ~RandomNum(5, 5)~ + Statue.Riddle.5
END

IF ~~ Statue.8.1
  SAY @2028    // You are correct. Now pay attention to my second riddle.
  IF ~RandomNum(4, 1)~ + Statue.Riddle.1.2
  IF ~RandomNum(4, 2)~ + Statue.Riddle.1.3
  IF ~RandomNum(4, 3)~ + Statue.Riddle.1.4
  IF ~RandomNum(4, 4)~ + Statue.Riddle.1.5
END

IF ~~ Statue.8.2
  SAY @2028    // You are correct. Now pay attention to my second riddle.
  IF ~RandomNum(4, 1)~ + Statue.Riddle.2.1
  IF ~RandomNum(4, 2)~ + Statue.Riddle.2.3
  IF ~RandomNum(4, 3)~ + Statue.Riddle.2.4
  IF ~RandomNum(4, 4)~ + Statue.Riddle.2.5
END

IF ~~ Statue.8.3
  SAY @2028    // You are correct. Now pay attention to my second riddle.
  IF ~RandomNum(4, 1)~ + Statue.Riddle.3.1
  IF ~RandomNum(4, 2)~ + Statue.Riddle.3.2
  IF ~RandomNum(4, 3)~ + Statue.Riddle.3.4
  IF ~RandomNum(4, 4)~ + Statue.Riddle.3.5
END

IF ~~ Statue.8.4
  SAY @2028    // You are correct. Now pay attention to my second riddle.
  IF ~RandomNum(4, 1)~ + Statue.Riddle.4.1
  IF ~RandomNum(4, 2)~ + Statue.Riddle.4.2
  IF ~RandomNum(4, 3)~ + Statue.Riddle.4.3
  IF ~RandomNum(4, 4)~ + Statue.Riddle.4.5
END

IF ~~ Statue.8.5
  SAY @2028    // You are correct. Now pay attention to my second riddle.
  IF ~RandomNum(4, 1)~ + Statue.Riddle.5.1
  IF ~RandomNum(4, 2)~ + Statue.Riddle.5.2
  IF ~RandomNum(4, 3)~ + Statue.Riddle.5.3
  IF ~RandomNum(4, 4)~ + Statue.Riddle.5.4
END

IF ~~ Statue.9.1.2
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.1.2.3
  IF ~RandomNum(3, 2)~ + Statue.Riddle.1.2.4
  IF ~RandomNum(3, 3)~ + Statue.Riddle.1.2.5
END

IF ~~ Statue.9.1.3
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.1.3.2
  IF ~RandomNum(3, 2)~ + Statue.Riddle.1.3.4
  IF ~RandomNum(3, 3)~ + Statue.Riddle.1.3.5
END

IF ~~ Statue.9.1.4
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.1.4.2
  IF ~RandomNum(3, 2)~ + Statue.Riddle.1.4.3
  IF ~RandomNum(3, 3)~ + Statue.Riddle.1.4.5
END

IF ~~ Statue.9.1.5
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.1.5.2
  IF ~RandomNum(3, 2)~ + Statue.Riddle.1.5.3
  IF ~RandomNum(3, 3)~ + Statue.Riddle.1.5.4
END

IF ~~ Statue.9.2.3
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.2.3.1
  IF ~RandomNum(3, 2)~ + Statue.Riddle.2.3.4
  IF ~RandomNum(3, 3)~ + Statue.Riddle.2.3.5
END

IF ~~ Statue.9.2.4
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.2.4.1
  IF ~RandomNum(3, 2)~ + Statue.Riddle.2.4.3
  IF ~RandomNum(3, 3)~ + Statue.Riddle.2.4.5
END

IF ~~ Statue.9.2.5
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.2.5.1
  IF ~RandomNum(3, 2)~ + Statue.Riddle.2.5.3
  IF ~RandomNum(3, 3)~ + Statue.Riddle.2.5.4
END

IF ~~ Statue.9.3.4
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.3.4.1
  IF ~RandomNum(3, 2)~ + Statue.Riddle.3.4.2
  IF ~RandomNum(3, 3)~ + Statue.Riddle.3.4.5
END

IF ~~ Statue.9.3.5
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.3.5.1
  IF ~RandomNum(3, 2)~ + Statue.Riddle.3.5.2
  IF ~RandomNum(3, 3)~ + Statue.Riddle.3.5.4
END

IF ~~ Statue.9.4.5
  SAY @2029    // I am impressed. Here comes my last riddle.
  IF ~RandomNum(3, 1)~ + Statue.Riddle.4.5.1
  IF ~RandomNum(3, 2)~ + Statue.Riddle.4.5.2
  IF ~RandomNum(3, 3)~ + Statue.Riddle.4.5.3
END


IF ~~ Statue.Riddle.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.8.1
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.8.1
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.8.1
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.8.1
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.8.1
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.8.1
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.8.1
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.9.1.2
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.9.1.2
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.9.1.2
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.9.1.2
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.9.1.2
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.9.1.2
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.9.1.2
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.9.1.3
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.9.1.3
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.9.1.3
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.9.1.3
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.9.1.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.9.1.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.9.1.3
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.9.1.4
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.9.1.4
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.9.1.4
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.9.1.4
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.9.1.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.9.1.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.9.1.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.5.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.9.1.5
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.9.1.5
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.9.1.5
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.9.1.5
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.9.1.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.9.1.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.9.1.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.3.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.Rewarded
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.Rewarded
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.Rewarded
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.Rewarded
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.4.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.Rewarded
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.Rewarded
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.Rewarded
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.Rewarded
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.5.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.Rewarded
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.Rewarded
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.Rewarded
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.Rewarded
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.4.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.Rewarded
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.Rewarded
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.Rewarded
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.Rewarded
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.5.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.Rewarded
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.Rewarded
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.Rewarded
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.Rewarded
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.5.1
  SAY @2100    // My step is slow, the snow's my breath,...
  + ~RandomNum(7, 1)~ + @2101 + Statue.Rewarded
  ++ @2102 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2101 + Statue.Rewarded
  ++ @2103 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2101 + Statue.Rewarded
  ++ @2104 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2101 + Statue.Rewarded
  ++ @2105 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2106 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2101 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2107 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2101 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END


IF ~~ Statue.Riddle.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.8.2
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.8.2
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.8.2
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.8.2
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.8.2
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.8.2
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.8.2
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.9.1.2
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.9.1.2
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.9.1.2
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.9.1.2
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.9.1.2
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.9.1.2
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.9.1.2
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.9.2.3
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.9.2.3
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.9.2.3
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.9.2.3
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.9.2.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.9.2.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.9.2.3
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.9.2.4
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.9.2.4
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.9.2.4
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.9.2.4
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.9.2.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.9.2.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.9.2.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.5.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.9.2.5
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.9.2.5
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.9.2.5
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.9.2.5
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.9.2.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.9.2.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.9.2.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.3.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.Rewarded
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.Rewarded
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.Rewarded
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.Rewarded
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.4.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.Rewarded
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.Rewarded
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.Rewarded
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.Rewarded
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.5.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.Rewarded
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.Rewarded
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.Rewarded
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.Rewarded
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.4.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.Rewarded
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.Rewarded
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.Rewarded
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.Rewarded
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.5.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.Rewarded
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.Rewarded
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.Rewarded
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.Rewarded
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.5.2
  SAY @2110    // I am very strange, yet very common...
  + ~RandomNum(7, 1)~ + @2111 + Statue.Rewarded
  ++ @2112 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2111 + Statue.Rewarded
  ++ @2113 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2111 + Statue.Rewarded
  ++ @2114 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2111 + Statue.Rewarded
  ++ @2115 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2116 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2111 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2117 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2111 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END


IF ~~ Statue.Riddle.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.8.3
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.8.3
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.8.3
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.8.3
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.8.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.8.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.8.3
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.9.1.3
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.9.1.3
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.9.1.3
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.9.1.3
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.9.1.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.9.1.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.9.1.3
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.9.2.3
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.9.2.3
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.9.2.3
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.9.2.3
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.9.2.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.9.2.3
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.9.2.3
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.9.3.4
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.9.3.4
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.9.3.4
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.9.3.4
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.9.3.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.9.3.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.9.3.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.5.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.9.3.5
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.9.3.5
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.9.3.5
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.9.3.5
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.9.3.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.9.3.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.9.3.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.2.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.Rewarded
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.Rewarded
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.Rewarded
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.Rewarded
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.4.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.Rewarded
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.Rewarded
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.Rewarded
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.Rewarded
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.5.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.Rewarded
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.Rewarded
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.Rewarded
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.Rewarded
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.4.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.Rewarded
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.Rewarded
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.Rewarded
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.Rewarded
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.5.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.Rewarded
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.Rewarded
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.Rewarded
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.Rewarded
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.5.3
  SAY @2120    // This garden is a lonely place...
  + ~RandomNum(7, 1)~ + @2121 + Statue.Rewarded
  ++ @2122 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2121 + Statue.Rewarded
  ++ @2123 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2121 + Statue.Rewarded
  ++ @2124 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2121 + Statue.Rewarded
  ++ @2125 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2126 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2121 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2127 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2121 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END


IF ~~ Statue.Riddle.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.8.4
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.8.4
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.8.4
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.8.4
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.8.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.8.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.8.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.9.1.4
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.9.1.4
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.9.1.4
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.9.1.4
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.9.1.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.9.1.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.9.1.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.9.2.4
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.9.2.4
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.9.2.4
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.9.2.4
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.9.2.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.9.2.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.9.2.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.9.3.4
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.9.3.4
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.9.3.4
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.9.3.4
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.9.3.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.9.3.4
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.9.3.4
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.5.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.9.4.5
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.9.4.5
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.9.4.5
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.9.4.5
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.9.4.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.9.4.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.9.4.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.2.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.Rewarded
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.Rewarded
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.Rewarded
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.Rewarded
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.3.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.Rewarded
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.Rewarded
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.Rewarded
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.Rewarded
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.5.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.Rewarded
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.Rewarded
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.Rewarded
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.Rewarded
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.3.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.Rewarded
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.Rewarded
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.Rewarded
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.Rewarded
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.5.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.Rewarded
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.Rewarded
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.Rewarded
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.Rewarded
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.5.4
  SAY @2130    // My first is a number...
  + ~RandomNum(7, 1)~ + @2131 + Statue.Rewarded
  ++ @2132 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2131 + Statue.Rewarded
  ++ @2133 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2131 + Statue.Rewarded
  ++ @2134 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2131 + Statue.Rewarded
  ++ @2135 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2136 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2131 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2137 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2131 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END


IF ~~ Statue.Riddle.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.8.5
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.8.5
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.8.5
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.8.5
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.8.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.8.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.8.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.9.1.5
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.9.1.5
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.9.1.5
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.9.1.5
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.9.1.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.9.1.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.9.1.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.9.2.5
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.9.2.5
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.9.2.5
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.9.2.5
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.9.2.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.9.2.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.9.2.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.9.3.5
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.9.3.5
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.9.3.5
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.9.3.5
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.9.3.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.9.3.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.9.3.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.4.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.9.4.5
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.9.4.5
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.9.4.5
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.9.4.5
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.9.4.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.9.4.5
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.9.4.5
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.2.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.Rewarded
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.Rewarded
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.Rewarded
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.Rewarded
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.3.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.Rewarded
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.Rewarded
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.Rewarded
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.Rewarded
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.1.4.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.Rewarded
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.Rewarded
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.Rewarded
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.Rewarded
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.3.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.Rewarded
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.Rewarded
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.Rewarded
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.Rewarded
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.2.4.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.Rewarded
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.Rewarded
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.Rewarded
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.Rewarded
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END

IF ~~ Statue.Riddle.3.4.5
  SAY @2140    // A prison deep within the ground...
  + ~RandomNum(7, 1)~ + @2141 + Statue.Rewarded
  ++ @2142 + Statue.Punished
  + ~RandomNum(7, 2)~ + @2141 + Statue.Rewarded
  ++ @2143 + Statue.Punished
  + ~RandomNum(7, 3)~ + @2141 + Statue.Rewarded
  ++ @2144 + Statue.Punished
  + ~RandomNum(7, 4)~ + @2141 + Statue.Rewarded
  ++ @2145 + Statue.Punished
  + ~RandomNum(7, 5)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2146 + Statue.Punished
  + ~RandomNum(7, 6)~ + @2141 + Statue.Rewarded
  + ~CheckStatLT(LastTalkedToBy, 14, WIS) CheckStatLT(LastTalkedToBy, 16, INT)~ + @2147 + Statue.Punished
  + ~RandomNum(7, 7)~ + @2141 + Statue.Rewarded
  ++ @2030 + Statue.Refused
END


IF ~~ Statue.Rewarded
  SAY @2031    // You have satisfied my curiosity and solved all my riddles correctly. In return I will help you.
  = @2032    // Take my wardstone, one of four. The remaining three are near, but take care! My enchantments will not yield without a fight.
  IF ~~ DO ~SetGlobal("WardstoneFound", "A77004", 1)
      SetGlobal("SerpentRiddle", "A77004", 2)
      GiveItem("A7Q2WS3", LastTalkedToBy) 
      AddXP2DA("A7Q2SRP")
      EraseJournalEntry(@2806)~ 
      UNSOLVED_JOURNAL @2805 EXIT
END

IF ~~ Statue.Punished
  SAY @2033    // This isn't the correct answer!
  = @2034    // The strong are rewarded, but the weak will be...
  = @2035    // PUNISHED!
  IF ~RandomNum(3, 1)~ DO ~ReallyForceSpell(LastTalkedToBy, TRAP_ARROW_FIRE) SmallWait(3) ReallyForceSpell(LastTalkedToBy, TRAP_ARROW_FIRE) SmallWait(3) ReallyForceSpell(LastTalkedToBy, TRAP_ARROW_FIRE)~ EXIT
  IF ~RandomNum(3, 2)~ DO ~ReallyForceSpell(LastTalkedToBy, TRAP_ARROW_BITING) SmallWait(3) ReallyForceSpell(LastTalkedToBy, TRAP_ARROW_BITING) SmallWait(3) ReallyForceSpell(LastTalkedToBy, TRAP_ARROW_BITING)~ EXIT
  IF ~RandomNum(3, 3)~ DO ~ReallyForceSpell(LastTalkedToBy, TRAP_LIGHTNING_BOLT)~ EXIT
END

IF ~~ Statue.Refused
  SAY @2036    // So you want to rely only on yourself. Do you think your divine heritage is powerful enough to overcome my wards?
  = @2037    // So be it. Do what you need to do, but know that you have to surpass my power if you wish to advance.
  IF ~~ UNSOLVED_JOURNAL @2806 EXIT
END
