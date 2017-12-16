BEGIN A7HT01

// First encounter at entrance to Dragon's Eye
IF ~Global("A7HostTower", "GLOBAL", 1)~ a7ht01.1
  SAY @100000 /* Greetings, adventurer. My name is Kelvor Domine, wizard and high standing member of the Host Tower of the Arcane. */
  ++ @100001 /* Host Tower of the Arcane? */ + a7ht01.1.1
  + ~OR(2) CheckStatGT(LastTalkedToBy, 14, INT) CheckStatGT(LastTalkedToBy, 14, WIS)~ + @100002 /* What is a high standing member of the Host Tower doing so far away from home? */ + a7ht01.1.2
END

IF ~~ a7ht01.1.1
  SAY @100003 /* You appear to be somewhat ignorant about the region you are travelling through. */
  = @100004 /* The Host Tower of the Arcane is an important academy of magical training and a seat of power in the region. */
  ++ @100005 /* Interesting. And what are you doing so far away from home? */ + a7ht01.1.2
  ++ @100006 /* Would you get to the point already? */ + a7ht01.1.4
END

IF ~~ a7ht01.1.2
  SAY @100007 /* Yes, this is indeed very unusual. */
  = @100008 /* Let me just say that I have a passing interest in the events going on in the depths of this dormant volcano. */
  = @100009 /* You appear to have made a lasting impression on the local inhabitants by defeating their queen, Yxumonei. */
  ++ @100010 /* How do you know about this? */ + a7ht01.1.3
  ++ @100006 /* Would you get to the point already? */ + a7ht01.1.4
END

IF ~~ a7ht01.1.3
  SAY @100011 /* There is more than one way to learn about events such as this. */
  = @100012 /* But let me get to the point. */
  IF ~~ + a7ht01.1.4
END

IF ~~ a7ht01.1.4
  SAY @100013 /* Several years ago an agent of Yxunomei stole a very precious artifact from us. Ever since that incident we have repeatedly attempted to get it back without much success. Her lair was too well guarded to take her by surprise. */
  = @100014 /* The recent theft of the Heartstone Gem destroyed even the last bit of hope to retrieve the artifact without a direct confrontation. */
  IF ~See("A7Afaaq")~ + a7ht01.1.5
  IF ~!See("A7Afaaq")~ + a7ht01.1.6
END

IF ~~ a7ht01.1.5
  SAY @100015 /* I'm talking about the djinni I can see in your midst, and his lamp. */
  IF ~~ + a7ht01.1.7
END

IF ~~ a7ht01.1.6
  SAY @100016 /* I'm talking about the djinni lamp I can sense in your possesion. */
  IF ~~ + a7ht01.1.7
END

IF ~~ a7ht01.1.7
  SAY @100017 /* I would never have guessed that a rather inexperienced band of adventurers would be able to wrest the lamp from her grasp. */
  = @100018 /* Since the lamp is technically still ours, I would like to make you a deal. */
  = @100019 /* I can offer you either a magical long sword or some monetary compensation for it. Both are very tempting options for adventurers such as yourself. What do you say? */
  ++ @100020 /* You have conviced me. I'd like to have the magical weapon. */ + a7ht01.1.8
  ++ @100021 /* Very well. Give me the money. */ + a7ht01.1.9
  ++ @100022 /* Actually, I'd like to keep the lamp. */ + a7ht01.1.11
  ++ @100023 /* I'm not interested in any of your offers. The lamp is mine now. */ + a7ht01.1.Refuse
END

IF ~~ a7ht01.1.8
  SAY @100024 /* You have made a wise decision. This blade is heavily enchanted to cut even magical beings of great power. Use it well. */
  IF ~~ DO ~GiveItemCreate("turodah", LastTalkedToBy, 0, 0, 0)~ + a7ht01.1.10
END

IF ~~ a7ht01.1.9
  SAY @100025 /* You have made a wise decision. 5000 gold is no small amount of money, but you have earned it. */
  IF ~~ DO ~GiveGoldForce(5000)~ + a7ht01.1.10
END

IF ~~ a7ht01.1.10
  SAY @100026 /* I bid you farewell and good luck on your journey. */
  IF ~~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 10)
    TakePartyItem("A7DJLMP")
    TakePartyItem("A7DJLMPA")
    AddexperienceParty(20000)
    ActionOverride("A7Afaaq", SetGlobal("unsummoning", "LOCALS", 1))
    StartCutSceneMode()
    StartCutScene("a7htct1b")
    ~ SOLVED_JOURNAL @101900 EXIT
END

IF ~~ a7ht01.1.11
  SAY @100027 /* You should seriously reconsider. We are looking for the lamp for quite some time. A refusal from your side is out of question. */
  ++ @100028 /* If you insist. Then I'd like to have the magical weapon. */ + a7ht01.1.8
  ++ @100021 /* Very well. Give me the money. */ + a7ht01.1.9
  ++ @100029 /* I don't care about your offer. The lamp is mine now. */ + a7ht01.1.Refuse
END

IF ~~ a7ht01.1.Refuse
  SAY @100030 /* (sigh) I have almost expected you to be uncooperative. That's why I took the freedom to bring along some friends. Maybe they can convince you to part with it? */
  = @100031 /* Don't think this is over yet. I'll collect your lamp one way or another. */
  IF ~!NightmareModeOn()~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 2)
    StartCutSceneMode()
    StartCutScene("a7htct1c")
    ~ UNSOLVED_JOURNAL @101000 EXIT
  IF ~NightmareModeOn()~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 2)
    StartCutSceneMode()
    StartCutScene("a7htct1d")
    ~ UNSOLVED_JOURNAL @101000 EXIT
END


// Second encounter in Dorn's Deep cave
IF ~Global("A7HostTower", "GLOBAL", 3)~ a7ht01.2
  SAY @100032 /* Greetings, <GABBER>. I told you that we would meet again. */
  = @100033 /* I hope my friends were able to change your mind. Are you now more inclined to hand over the djinni lamp? */
  ++ @100034 /* Very well. You can have it. */ + a7ht01.2.1
  ++ @100035 /* No, I don't think so. */ + a7ht01.2.2
END

IF ~~ a7ht01.2.1
  SAY @100036 /* You have made a wise decision. I'm even willing to spare a bit of coin for your trouble. */
  = @100037 /* In return I promise that I won't bother you again. Farewell. */
  IF ~~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 10)
    TakePartyItem("A7DJLMP")
    TakePartyItem("A7DJLMPA")
    AddexperienceParty(50000)
    GiveGoldForce(2000)
    ActionOverride("A7Afaaq", SetGlobal("unsummoning", "LOCALS", 1))
    EraseJournalEntry(@101000)
    StartCutSceneMode()
    StartCutScene("a7htct2b")
    ~ SOLVED_JOURNAL @101901 EXIT
END

IF ~~ a7ht01.2.2
  SAY @100038 /* You don't seem to understand your situation. I have the power to destroy your sorry hides with as much as a gesture of my hands. But I am withholding my powers, as I'm still convinced that we can come to a civilized agreement. */
  = @100039 /* Don't you want to reconsider? I won't ask you so nicely again. */
  ++ @100040 /* If you insist, please take it. */ + a7ht01.2.1
  ++ @100041 /* I've told you my decision. Don't make me repeat myself! */ + a7ht01.2.Refuse
END

IF ~~ a7ht01.2.Refuse
  SAY @100042 /* Very well. Maybe you just need a better motivation to change your mind? I'm sure that my colleagues from the Host Tower can help you in this case. */
  = @100043 /* Be assured that I will hound you as long as you have the lamp in your possession. */
  IF ~!NightmareModeOn()~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 4)
    StartCutSceneMode()
    StartCutScene("a7htct2c")
    ~ UNSOLVED_JOURNAL @101001 EXIT
  IF ~NightmareModeOn()~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 4)
    StartCutSceneMode()
    StartCutScene("a7htct2d")
    ~ UNSOLVED_JOURNAL @101001 EXIT
END


// Third encounter at entrance to Lower Dorn's Deep
IF ~Global("A7HostTower", "GLOBAL", 5)~ a7ht01.3
  SAY @100044 /* Ah, there you are. I have waited for you, <GABBER>. You know why I'm here. */
  = @100045 /* I give you one last chance to hand over the djinni lamp peacefully. What is your decision? */
  ++ @100046 /* Alright, alright. You can have it. There is no need to spill more blood over it. */ + a7ht01.3.1
  ++ @100047 /* I told you before, this lamp is mine now! */ + a7ht01.3.2
END

IF ~~ a7ht01.3.1
  SAY @100048 /* It is good that you have come to your senses. You may not be happy about the situation, but at least you won't be dead. */
  = @100049 /* You may continue your journey. I won't bother you again. Farewell. */
  IF ~~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 10)
    TakePartyItem("A7DJLMP")
    TakePartyItem("A7DJLMPA")
    AddexperienceParty(80000)
    ActionOverride("A7Afaaq", SetGlobal("unsummoning", "LOCALS", 1))
    EraseJournalEntry(@101000)
    EraseJournalEntry(@101001)
    StartCutSceneMode()
    StartCutScene("a7htct3b")
    ~ SOLVED_JOURNAL @101902 EXIT
END

IF ~~ a7ht01.3.2
  SAY @100050 /* (sigh) Very well. You are forcing my hand now. I'll take the lamp from your dead body. */
  = @100051 /* Did I mention that I'm a master summoner? No? Then see for yourself! */
  IF ~!NightmareModeOn()~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 10)
    EraseJournalEntry(@101000)
    EraseJournalEntry(@101001)
    StartCutSceneMode()
    StartCutScene("a7htct3c")
  ~ SOLVED_JOURNAL @101903 EXIT
  IF ~NightmareModeOn()~ DO ~
    SetGlobal("A7HostTower", "GLOBAL", 10)
    EraseJournalEntry(@101000)
    EraseJournalEntry(@101001)
    StartCutSceneMode()
    StartCutScene("a7htct3d")
  ~ SOLVED_JOURNAL @101903 EXIT
END
