// *** Quest 5: Dialog for djinni leader Karim ***
// Traified

BEGIN A7KARIM

IF ~AreaCheck("A77002") Name("A7Afaaq", LastTalkedToBy)~ Karim.Afaaq
  SAY @5000 /* Greetings, Afaaq. It is good to see you safe and sound. You should visit us sometime when our current problems have been solved. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

IF ~AreaCheck("A77002") !InPartySlot(LastTalkedToBy, 0)~ Karim.NPC
  SAY @5001 /* Hello, <GABBER>. I'd prefer to discuss our task with <CHARNAME> if possible. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END


// *** Prevent talking to CHARNAME before starting the quest officially ***
IF ~Global("A7Quest5", "GLOBAL", 0) !Name("AMCARRAS", LastTalkedToBy)~ THEN Karim.NotCarras
  SAY @5002 /* I don't have the time to talk to strangers. */
  IF ~~ DO ~ClearActions(Myself)~ EXIT
END

// *** Talk with Carras (together with djinni #1 and djinni #6/Afaaq) ***
CHAIN IF ~Global("A7Quest5", "GLOBAL", 0) Name("AMCARRAS", LastTalkedToBy) !StateCheck("AMCARRAS", CD_STATE_NOTVALID)~ THEN A7KARIM Karim.Carras
  @5003 /* But you are not listening. The threat we have perceived clearly has its origin below your little cave. */
  == AMCARRAS @5004 /* We've used the tunnel system for a long time and never found anything suspicious. How do I know you aren't merely playing games with me? */
  == A7Q5DJ01 @5005 /* Do not address our esteemed leader in such a disrespectful manner. */
  == A7KARIM @5006 /* There are many clues to the observing eye that something is not right. */
  = @5007 /* The dramatic rise of the water temperature and the periodically occuring tremors should be sufficient proof that we are serious. */
  == A7Q5DJ05 @5008 /* You will profit from it too. If you allow us to investigate we will find a way to stop the threat. */
  == AMCARRAS @5009 /* I have to consult our leader first before I can give you any answer. */
  == A7KARIM @5010 /* Very well. But do not delay your decision for too long. */
END A7KARIM Karim.Intro


APPEND A7KARIM
  IF ~~ Karim.Intro
    SAY @5011 /* Let us return to... */
    IF ~~ + Karim.Intro.0
    IF ~Global("A7Q5AfaaqAppears", "GLOBAL", 2)~ EXTERN A7Q5DJ05 Afaaq.Intro.1
  END

  IF ~~ Karim.Intro.0
    SAY @5012 /* ... */
    IF ~Global("A7Q5AfaaqAppears", "GLOBAL", 0) OR(2) Global("A7AfaaqEnslaved", "GLOBAL", 1) !See("A7Afaaq")~ + Karim.Intro.1
    IF ~Global("A7Q5AfaaqAppears", "GLOBAL", 0) Global("A7AfaaqEnslaved", "GLOBAL", 0) See("A7Afaaq")~ + Karim.Intro.2
  END

  // If Afaaq is enslaved
  IF ~~ Karim.Intro.1
    SAY @5013 /* Visitors? */
    = @5014 /* Hmm, I sense one of our kind in your midst. Am I right? */
    ++ @5015 /* Yes, he is bound to a magical lamp we have found in one of our adventures. */ + Karim.Intro.4
    ++ @5016 /* That doesn't concern you. I have business with the smugglers. */ + Karim.GoodBye.1
  END
END


// If Afaaq is around
CHAIN A7KARIM Karim.Intro.2
  @5017 /* What an unexpected encounter. I am honored to meet you, Afaaq. */
  == A7Afaaq @5018 /* I greet you, my lord. I am the honored one to be remembered by my superiors. */
  == A7KARIM @5019 /* I still remember you being in the services of Caliph Hasib. It appears that is not the case anymore. */
  == A7Afaaq @5020 /* I had left his presence a while ago and roamed this plane for a time. */
    = @5021 /* I sense a grave matter is weighing upon your shoulders. May I ask you to share it with us? <CHARNAME> is an able adventurer and I trust <PRO_HIMHER> to be descreet when necessary. */
END A7KARIM Karim.Intro.6


APPEND A7Q5DJ05
  // If Afaaq is part of the djinni group
  IF ~~ Afaaq.Intro.1
    SAY @5022 /* May I interrupt you, my lord. I might have a solution to our problem. */
    = @5023 /* Welcome <CHARNAME>! I am glad to meet you so soon again. As always you have the gift to be in the right place at the right time. */
    = @5024 /* We are currently in need of assistance and I would be grateful if you could help us in an important matter. */
    ++ @5025 /* I am glad to see you too. How are you doing, Afaaq? */ + Afaaq.Intro.2
    ++ @5026 /* What matter are you referring to? */ + Afaaq.Intro.3
    ++ @5027 /* I really don't have time at the moment. Maybe another time. */ + Afaaq.Intro.4
  END

  IF ~~ Afaaq.Intro.2
    SAY @5028 /* Thanks to you I am able to enjoy my freedom once more. */
    = @5029 /* Soon after our parting I encountered friends from my past and joined their cause. We have only arrived two days ago and now you are appearing. */
    = @5030 /* It appears we are fated to work together again and we are indeed in need of help in a matter of utmost importance. */
    ++ @5026 /* What matter are you referring to? */ + Afaaq.Intro.3
    ++ @5027 /* I really don't have time at the moment. Maybe another time. */ + Afaaq.Intro.4
  END

  IF ~~ Afaaq.Intro.3
    SAY @5031 /* It is best to let our leader explain it himself... */
    IF ~~ EXTERN A7KARIM Karim.Intro.6
  END

  IF ~~ Afaaq.Intro.4
    SAY @5032 /* You really disappoint my expectations in you. Will you not reconsider? */
    ++ @5033 /* Maybe it doesn't hurt to hear you out. */ + Afaaq.Intro.5
    ++ @5034 /* No, my decision is definite. */ + Afaaq.Intro.6
  END

  IF ~~ Afaaq.Intro.5
    SAY @5035 /* Thank you, <CHARNAME>. This matter is of great importance to me. */
    IF ~~ + Afaaq.Intro.3
  END

  IF ~~ Afaaq.Intro.6
    SAY @5036 /* I will not force you if you are not determined to help us, otherwise you may do more harm than good. */
    = @5037 /* Farewell, <CHARNAME>. And may your future shine brightly. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 11) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ EXIT
  END
END


APPEND A7KARIM
  IF ~~ Karim.Intro.4
    SAY @5038 /* Interesting, but not unusual. Do you have business with us, <PRO_RACE>? */
    + ~OR(2) !Alignment(Player1, MASK_EVIL) ReputationGT(Player1, 9)~ + @5039 /* I couldn't help overhearing your discussion with the smugglers. Is there something I can do to help you? */ + Karim.Intro.5
    ++ @5040 /* No, I merely wanted to talk to the smugglers. */ + Karim.GoodBye.1
  END

  IF ~~ Karim.Intro.5
    SAY @5041 /* I do not question your willingness to help us, but I doubt you will be of much use to us without magical assistance. */
    = @5042 /* As you have noticed, the entrance to the tunnel system below this cave has become dangerous to enter, especially for mortals like you. */
    = @5043 /* Are your really aware of the dangers involved when you accept to help us? */
    ++ @5044 /* Yes, I am. Please tell me of your problems. */ + Karim.Intro.6
    ++ @5045 /* Come to think about it, I don't really want to be involved in your affairs. */ + Karim.GoodBye.1
  END

  // Explaining his task
  IF ~~ Karim.Intro.6
    SAY @5046 /* Then let me introduce myself. I am Karim, the first sharif at the court of Caliph Azhar, high above the northern borders of Calimshan. */
    IF ~~ + Karim.Intro.7
  END

  IF ~~ Karim.Intro.7
    SAY @5047 /* Some time ago our wise ruler sensed an unknown power probing our defenses, despite their effort to conceal their actions from us. The activities have increased over time and our protective shield is now more or less openly attacked. */ 
    = @5048 /* Our divinations revealed that the source of the attacks originates from somewhere below the settlement you call Amkethran. You have witnessed our dealings with the current residents of the cave. They appear to be a suspicious lot. Maybe you have more luck in dealing with them. */
    = @5049 /* We will leave for the moment. If you find a way to safely enter the tunnel system, we will surely meet again. */
    IF ~True()~ DO ~SetGlobal("A7Quest5", "GLOBAL", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ UNSOLVED_JOURNAL @6500 EXIT
    IF ~InParty("Aerie")~ EXTERN AERIE25J Karim.Intro.Aerie.1
    IF ~InParty("Imoen2")~ EXTERN IMOEN25J Karim.Intro.Imoen.1
    IF ~InParty("Jaheira")~ EXTERN JAHEI25J Karim.Intro.Jaheira.1
    IF ~InParty("Jan")~ EXTERN JAN25J Karim.Intro.Jan.1
    IF ~InParty("Korgan")~ EXTERN KORGA25J Karim.Intro.Korgan.1
  END

  IF ~~ Karim.GoodBye.1
    SAY @5050 /* Very well. Let us return home for the time being, my brothers. */
    IF ~~ DO ~SetGlobal("A7Quest5", "GLOBAL", 11) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ EXIT
  END


  // *** First-time talk in the Subterranean Cave ***
  IF ~Global("A7Quest5", "GLOBAL", 2) Global("TellAboutCave", "A77002", 0)~ Karim.Cave.1
    SAY @5051 /* We meet again, <CHARNAME>. Since you are here, I assume that you have decided to help us. Then I will tell you what we have found out so far. */
    = @5052 /* This cavern leads to a deeper and much bigger cave. You will need an effective protection from the heat which is emanating from the depths. It even penetrates our innate resistances. We are unable to tell you more because our attempts to scan this region more thoroughly have been magically blocked. */
    = @5053 /* Your task is to gather as much information as possible about the threat and report back to me, so that we can discuss our next steps. */
    = @5054 /* Take this whistle with you. If you are confronted with hostility and are in dire need of assistance, you may use it to call us for help. We can only survive for a short while down there, so use it only in an emergency. */
    = @5055 /* May you be successful in your task. */
    IF ~~ DO ~SetGlobal("TellAboutCave", "A77002", 1) GiveItemCreate("A7FLUTE", LastTalkedToBy, 0, 0, 0) EraseJournalEntry(@6500)~ UNSOLVED_JOURNAL @6501 EXIT
  END


  // *** Talk in the Subterranean Cave: After meeting the efreet commander ***
  IF ~Global("A7Quest5", "GLOBAL", 3) GlobalLT("TellAboutCave", "A77002", 3)~ Karim.Cave.2
    SAY @5056 /* (You tell Karim everything you have learned from the efreet commander.) */
    = @5057 /* Thank you, <GABBER>, this information is invaluable to us. */
    = @5058 /* I'd advise you to continue your work for the efreets. They will see your actions as a means to earn their respect. Please inform us as soon as you learn anything else. */
    IF ~~ DO ~SetGlobal("TellAboutCave", "A77002", 3) AddXP2DA("A7Q5ADV1") ClearActions(Myself) 
        EraseJournalEntry(@6501) EraseJournalEntry(@6502) EraseJournalEntry(@6503) EraseJournalEntry(@6504)~ UNSOLVED_JOURNAL @6505 EXIT
  END


  // *** Talk in the Subterranean Cave: After Lord Malik's revelations ***
  IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 2) GlobalLT("TellAboutCave", "A77002", 4)~ Karim.Cave.3
    SAY @5059 /* (You tell Karim everything you have learned from the efreet warlord Malik.) */
    IF ~~ DO ~SetGlobal("TellAboutCave", "A77002", 4)~ + Karim.Cave.3.1
  END

  IF ~~ Karim.Cave.3.1
    SAY @5060 /* I don't know how Malik came by his knowledge about the artifact, but he is right. We do have the "Crown of Qadeej" securely kept within our fortress. */
    = @5061 /* It is one of our most precious artifacts and a remnant of the Dawn War era. Surrendering it to our enemies is out of question. */
    ++ @5062 /* Do you have an alternative solution how to deal with the efreets peacefully? */ + Karim.Alternative.1
    ++ @5063 /* I could always solve your problem by defeating the efreets... */ + Karim.Alternative.Defeat.1
    ++ @5064 /* Then I'll come up with something on my own. */ + Karim.Alternative.Reject.1
  END

  IF ~~ Karim.Alternative.Defeat.1
    SAY @5065 /* Yes, you could do that, but it will be a difficult battle. The efreets are prepared for war and have brought lots of allies and slaves with them. */
    = @5066 /* If you are serious about it, then I will repeat my offer to help you in your fight. You have already received our whistle, use it when you attack the efreets and we will appear. */
    + ~OR(3) Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5067 /* Maybe I should try to find a peaceful solution first. Do you have any advice for me? */ + Karim.Alternative.1
    ++ @5068 /* Alright, I'll keep that in mind. */ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 8) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6523 EXIT
  END

  IF ~~ Karim.Alternative.Reject.1
    SAY @5069 /* Very well, I will accept your decision and wish you well in your dealings with the efreets. */
    + ~OR(3) Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5070 /* On second thought, I'd prefer to find a peaceful solution first. Do you have any advice? */ + Karim.Alternative.1
    ++ @5071 /* Thanks. I'll return to Lord Malik at once. */ DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 8) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6524 EXIT
  END

  IF ~~ Karim.Alternative.1
    SAY @5072 /* Maybe I have. */
    = @5073 /* From what I know about the nature of the artifact, I believe that Malik could be persuaded to accept an equally powerful substitute. */
    = @5074 /* The only comparable artifacts which spring to my mind are the phylacteries of powerful demiliches, undamaged hearts of demon lords or the sealed essences of divine beings. */
    + ~Global("A7Q5Demilich", "GLOBAL", 0)~ + @5075 /* What are phylacteries of powerful demiliches? */ + Karim.Alternative.2
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5076 /* Please tell me more about the hearts of demon lords. */ + Karim.Alternative.5
    + ~Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5077 /* What can you tell me about the sealed essences of divine beings? */ + Karim.Alternative.8
    ++ @5078 /* I'd prefer to defeat the efreets. */ + Karim.Alternative.Defeat.1
    ++ @5079 /* That sounds far too complicated to me. I will come up with something on my own. */ + Karim.Alternative.Reject.1
  END
  
  IF ~~ Karim.Alternative.2
    SAY @5080 /* Demiliches share a permanent connection with the negative energy plane using their phylacteries, which are basically repositories used to store their souls. */
    = @5081 /* They are usually merged with their remaining body parts, that's why it is highly likely that the remains of a defeated demilich still contain their spiritual essences. */
    IF ~!PartyHasItem("A7SKULL")~ DO ~SetGlobal("A7Q5Demilich", "GLOBAL", 1)~ + Karim.Alternative.3
    + ~PartyHasItem("A7SKULL")~ + @5082 /* As a matter of fact, we already have the remnants of a demilich in our possession. */ DO ~SetGlobal("A7Q5Demilich", "GLOBAL", 1)~ + Karim.Alternative.4
  END

  IF ~~ Karim.Alternative.3
    SAY @5083 /* I don't know about demilich lairs in the vicinity, but I will investigate in this matter. Maybe I can tell you more if you return to me later. */
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5084 /* Please tell me about the hearts of demon lords. */ + Karim.Alternative.5
    + ~Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5085 /* Please tell me about the sealed essences of divine beings. */ + Karim.Alternative.8
    + ~OR(2) Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 1)~ + @5086 /* Thanks, I will ask Lord Malik if he settles on one of the alternatives you have mentioned. */ + Karim.Alternative.11
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5087 /* Thanks, I will ask Lord Malik if he settles on a demilich phylactery as a substitute. */ + Karim.Alternative.11
  END

  IF ~~ Karim.Alternative.4
    SAY @5088 /* I am impressed, <CHARNAME>. You appear to be more powerful than even I imagined. I suggest you return to Malik and offer it to him as an equal substitute. He will surely accept it. */
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5076 /* Please tell me more about the hearts of demon lords. */ + Karim.Alternative.5
    + ~Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5077 /* What can you tell me about the sealed essences of divine beings? */ + Karim.Alternative.8
    + ~OR(2) Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 1)~ + @5086 /* Thanks, I will ask Lord Malik if he settles on one of the alternatives you have mentioned. */ + Karim.Alternative.11
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5089 /* Thanks, I will ask Malik if he settles on a demilich phylactery as a substitute. */ + Karim.Alternative.11
  END

  IF ~~ Karim.Alternative.5
    SAY @5090 /* Demon lords are in control over one or more layers of the Abyss. If you manage to destroy a demon lord while leaving his heart intact, you could offer it to Malik as another substitute. */
    = @5091 /* The heart contains much of the demon lord's power and, more importantly, still shares a connection to the demon's layer of the Abyss. */
    IF ~!PartyHasItem("A7HEART1") !PartyHasItem("A7HEART2")~ DO ~SetGlobal("A7Q5DemonHeart", "GLOBAL", 1)~ + Karim.Alternative.6
    + ~OR(2) PartyHasItem("A7HEART1") PartyHasItem("A7HEART2")~ + @5092 /* Coincidentally, we have already a heart of a demon lord in our possession. */ DO ~SetGlobal("A7Q5DemonHeart", "GLOBAL", 1)~ + Karim.Alternative.7
  END

  IF ~~ Karim.Alternative.6
    SAY @5093 /* I know only of few places within Faerun which harbor demons. The most famous place is Ascalhorn, also known as Hellgate Keep, but it is too far away to be of use. */
    = @5094 /* I suggest to look for ancient sites linked to myths and stories about extraplanar involvements. Other possibilities to find powerful demons are demonic cults, but they are usually practicing in secret and would be even more difficult to find. */
    + ~Global("A7Q5Demilich", "GLOBAL", 0)~ + @5095 /* Please tell me more about the phylacteries of powerful demiliches. */ + Karim.Alternative.2
    + ~Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5077 /* What can you tell me about the sealed essences of divine beings? */ + Karim.Alternative.8
    + ~OR(2) Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 1)~ + @5086 /* Thanks, I will ask Lord Malik if he settles on one of the alternatives you have mentioned. */ + Karim.Alternative.11
    + ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5096 /* Thanks, I will ask Lord Malik if he settles on the heart of a demon lord as a substitute. */ + Karim.Alternative.11
  END

  IF ~~ Karim.Alternative.7
    SAY @5097 /* I'm relieved to hear about that. I have felt a sinister aura surrounding your party, but I couldn't find the reason for it. */
    = @5098 /* You should offer the heart to Malik, he will surely accept it as an alternative. */
    + ~Global("A7Q5Demilich", "GLOBAL", 0)~ + @5095 /* Please tell me more about the phylacteries of powerful demiliches. */ + Karim.Alternative.2
    + ~Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5077 /* What can you tell me about the sealed essences of divine beings? */ + Karim.Alternative.8
    + ~OR(2) Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 1)~ + @5086 /* Thanks, I will ask Lord Malik if he settles on one of the alternatives you have mentioned. */ + Karim.Alternative.11
    + ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + @5096 /* Thanks, I will ask Lord Malik if he settles on the heart of a demon lord as a substitute. */ + Karim.Alternative.11
  END

  IF ~~ Karim.Alternative.8
    SAY @5099 /* Unfortunately, I don't know much in that regard. However, I do know that during the Time of Troubles several gods had been destroyed. Some parts of their essences might have be sealed away in magical artifacts. If you need to know more about it, you should find other sources of knowledge. */
    + ~CheckStatLT(LastTalkedToBy, 17, INT) OR(2) !InParty("Imoen2") StateCheck("Imoen2", CD_STATE_NOTVALID) Global("A7Q5Demilich", "GLOBAL", 0)~ + @5095 /* Please tell me more about the phylacteries of powerful demiliches. */ + Karim.Alternative.2
    + ~CheckStatLT(LastTalkedToBy, 17, INT) OR(2) !InParty("Imoen2") StateCheck("Imoen2", CD_STATE_NOTVALID) Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5076 /* Please tell me more about the hearts of demon lords. */ + Karim.Alternative.5
    + ~CheckStatLT(LastTalkedToBy, 17, INT) OR(2) !InParty("Imoen2") StateCheck("Imoen2", CD_STATE_NOTVALID)~ + @5063 /* I could always solve your problem by defeating the efreets... */ + Karim.Alternative.Defeat.1
    + ~CheckStatGT(LastTalkedToBy, 16, INT) OR(2) !InParty("Imoen2") StateCheck("Imoen2", CD_STATE_NOTVALID)~ + @5100 /* My own soul contains the divine essences of the dead god Bhaal. Maybe that could be another alternative to Lord Malik. */ DO ~SetGlobal("A7Q5DivineEssence", "GLOBAL", 1)~ + Karim.Alternative.9
    IF ~InParty("Imoen2") !StateCheck("Imoen2", CD_STATE_NOTVALID)~ DO ~SetGlobal("A7Q5DivineEssence", "GLOBAL", 1)~ EXTERN ~IMOEN25J~ Imoen.Quest5.SuggestDivineSoul.1
  END

  IF ~~ Karim.Alternative.9
    SAY @5101 /* You continue to surprise me, <CHARNAME>. However, you should be aware of the dangers if you actually tell Malik about it. It might be more than you can handle. */
    = @5102 /* But I believe it is a valid option for Malik, nonetheless. */
    + ~Global("A7Q5Demilich", "GLOBAL", 0)~ + @5095 /* Please tell me more about the phylacteries of powerful demiliches. */ + Karim.Alternative.2
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5076 /* Please tell me more about the hearts of demon lords. */ + Karim.Alternative.5
    + ~OR(2) Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 1)~ + @5103 /* Thanks for the warning, but I will ask Lord Malik if he accepts one of the alternatives you have mentioned. */ + Karim.Alternative.11
    + ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5104 /* Thanks for the warning, but I will ask Lord Malik if he accepts to use parts of my divine soul. */ + Karim.Alternative.11
  END
  
  IF ~~ Karim.Alternative.10
    SAY @5105 /* This is surprising news, Imoen. However, you should be aware of the dangers if you actually tell Malik about it. It might be more than you can handle. */
    = @5102 /* But I believe it is a valid option for Malik, nonetheless. */
    + ~Global("A7Q5Demilich", "GLOBAL", 0)~ + @5095 /* Please tell me more about the phylacteries of powerful demiliches. */ + Karim.Alternative.2
    + ~Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5076 /* Please tell me more about the hearts of demon lords. */ + Karim.Alternative.5
    + ~OR(2) Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 1)~ + @5103 /* Thanks for the warning, but I will ask Lord Malik if he accepts one of the alternatives you have mentioned. */ + Karim.Alternative.11
    + ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 0)~ + @5106 /* Thanks for the warning, but I will ask Lord Malik if he accepts to use parts of Imoen's or my divine soul. */ + Karim.Alternative.11
  END
END

APPEND IMOEN25J
  // Interjection: CHARNAME agrees to help Karim and his group
  IF ~~ Karim.Intro.Imoen.1
    SAY @5107 /* A mysterious power infiltrates one of the fabled djinni fortresses?  This is the kind of adventure I've always wanted to see.  C'mon <CHARNAME>, you must help those poor genies. */
    IF ~True()~ DO ~SetGlobal("A7Quest5", "GLOBAL", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ UNSOLVED_JOURNAL @6500 EXIT
    IF ~InParty("Aerie")~ EXTERN AERIE25J Karim.Intro.Aerie.1
  END

  // If CHARNAME suggests to use Imoen's soul as a sacrifice
  IF ~~ Imoen.Quest5.SuggestDivineSoul.1
    SAY @5108 /* Hey, <CHARNAME>. Isn't a part of divine powers sealed within your soul? Why don't you share a bit? This will save us a lot of trouble. */
    + ~Global("ImoenGiveSoul", "GLOBAL", 2)~ + @5109 /* Not to mention your divine soul... */ + Imoen.Quest5.SuggestDivineSoul.2
    + ~!Global("ImoenGiveSoul", "GLOBAL", 2)~ + @5109 /* Not to mention your divine soul... */ + Imoen.Quest5.SuggestDivineSoul.3
  END

  IF ~~ Imoen.Quest5.SuggestDivineSoul.2
    SAY @5110 /* Oh, come on. Yours fits the bill much better. I'm still drained from my last sacrifice. */
    IF ~~ EXTERN A7KARIM Karim.Alternative.10
  END

  IF ~~ Imoen.Quest5.SuggestDivineSoul.3
    SAY @5111 /* Oh, come on. Yours fits the bill much better. You have already a lot more experience in this matter than me, hehe. */
    IF ~~ EXTERN A7KARIM Karim.Alternative.10
  END
END

APPEND AERIE25J
  IF ~~ Karim.Intro.Aerie.1
    SAY @5112 /* You have to find a way into the underground cave, <CHARNAME>. I can't stand by and see Afaaq's friends suffer. */
    IF ~True()~ DO ~SetGlobal("A7Quest5", "GLOBAL", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ UNSOLVED_JOURNAL @6500 EXIT
  END
END

APPEND JAHEI25J
  IF ~~ Karim.Intro.Jaheira.1
    SAY @5113 /* I'm more worried about the increasing strength of the tremors and their effect on Amkethran. The people are already oppressed by the monastic order and can't cope with yet another disaster. If you decide to help the djinn, you could also find a way to stop the quakes. */
    IF ~True()~ DO ~SetGlobal("A7Quest5", "GLOBAL", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ UNSOLVED_JOURNAL @6500 EXIT
    IF ~InParty("Aerie")~ EXTERN AERIE25J Karim.Intro.Aerie.1
    IF ~InParty("Imoen2")~ EXTERN IMOEN25J Karim.Intro.Imoen.1
  END
END

APPEND JAN25J
  IF ~~ Karim.Intro.Jan.1
    SAY @5114 /* I would take care and look before you leap.  I know, I know, that doesn't sound like myself. But the last time I've heard about genies attacked by someone underground, it turned out to be a small clan of gully dwarves who were fed up by the big folk in the clouds always blowing fresh air into their homes. */
    = @5115 /* You don't want to deal with gully dwarves, believe me. Their stench will follow you forever. Just think about your future, <CHARNAME>. What would the other gods think of a young godling who permanently smells like death and decay?  Well, it doesn't help much that you'll also inherit the realm of a god of death and decay, but that's beside the point. */
    IF ~True()~ DO ~SetGlobal("A7Quest5", "GLOBAL", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ UNSOLVED_JOURNAL @6500 EXIT
    IF ~InParty("Aerie")~ EXTERN AERIE25J Karim.Intro.Aerie.1
    IF ~InParty("Imoen2")~ EXTERN IMOEN25J Karim.Intro.Imoen.1
    IF ~InParty("Jaheira")~ EXTERN JAHEI25J Karim.Intro.Jaheira.1
  END
END

APPEND KORGA25J
  IF ~~ Karim.Intro.Korgan.1
    SAY @5116 /* Ye don't really consider t' help those weaklings, do ye?  If they can't solve 'eir petty problems by themselves, then they deserve to be wiped out. */
    IF ~True()~ DO ~SetGlobal("A7Quest5", "GLOBAL", 1) ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct1b")~ UNSOLVED_JOURNAL @6500 EXIT
    IF ~InParty("Aerie")~ EXTERN AERIE25J Karim.Intro.Aerie.1
    IF ~InParty("Imoen2")~ EXTERN IMOEN25J Karim.Intro.Imoen.1
    IF ~InParty("Jaheira")~ EXTERN JAHEI25J Karim.Intro.Jaheira.1
    IF ~InParty("Jan")~ EXTERN JAN25J Karim.Intro.Jan.1
  END
END


APPEND A7KARIM
  IF ~~ Karim.Alternative.11
    SAY @5117 /* Agreed. You should return to Malik at once. I wish you success in your dealings with him, <CHARNAME>. */
    IF ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 1)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6525 EXIT
    IF ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 0)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6526 EXIT
    IF ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 1)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6527 EXIT
    IF ~Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6528 EXIT
    IF ~Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 1)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6529 EXIT
    IF ~Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 0)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6530 EXIT
    IF ~Global("A7Q5Demilich", "GLOBAL", 1) Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5DivineEssence", "GLOBAL", 1)~ 
      DO ~SetGlobal("A7Q5Artifact", "GLOBAL", 3) AddXP2DA("A7Q5ADV2") ClearActions(Myself) EraseJournalEntry(@6505)~ UNSOLVED_JOURNAL @6531 EXIT
  END


  // *** Talk in the Subterranean Cave: After Lord Malik accepts the alternative but also wants knowledge how to use it ***
  IF ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 4) GlobalLT("TellAboutCave", "A77002", 5)~ Karim.Cave.4
    SAY @5118 /* (You tell Karim of Lord Malik's response about his suggestions.) */
    IF ~Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5Tome", "GLOBAL", 0)~ DO ~SetGlobal("TellAboutCave", "A77002", 5)~ + Karim.Misc.1
    IF ~Global("A7Q5DemonHeart", "GLOBAL", 1) Global("A7Q5Tome", "GLOBAL", 0)~ DO ~SetGlobal("TellAboutCave", "A77002", 5)~ + Karim.DemonHeart.1
    IF ~Global("A7Q5Tome", "GLOBAL", 1)~ DO ~SetGlobal("TellAboutCave", "A77002", 5)~ + Karim.Demilich.1
    IF ~GlobalGT("A7Q5Tome", "GLOBAL", 1)~ DO ~SetGlobal("TellAboutCave", "A77002", 5)~ + Karim.Demilich.2
  END

  IF ~~ Karim.Demilich.1
    SAY @5119 /* I feared he would ask for something like that, but you are in luck. Fortunately our investigation came up with a first clue. */
    = @5120 /* Our sources tell of an ancient fortress which contains an unknown evil of great power. The vague details of our scriptures *might* be interpreted that a powerful undead creature has taken residence there. The fortress had also been used as a hideout by a many different cults and sects over time. It is likely that the structure still contains remnants of their tomes and scriptures, maybe even the cults themselves. */
    = @5121 /* The fortress is called Watcher's Keep and lies somewhere on the southern borders of Amn. */
    + ~Global("TalkedTozGarPol1", "GLOBAL", 0)~ + @5122 /* Thanks for your information. I will go there and look for the scriptures and any demilich crossing my path. */ + Karim.Demilich.3
    + ~Global("TalkedTozGarPol1", "GLOBAL", 1) !Dead("demogor2") !Dead("demilich")~ + @5123 /* Thanks for the information, but I already know about the keep. I have yet to explore its depths however. */ + Karim.Demilich.4
    + ~!PartyHasItem("A7SKULL") Dead("demilich")~ + @5124 /* Thanks for the information, but I've been there already and defeated a demilich. Unfortunately I don't have its skull anymore. */ + Karim.Demilich.5
    + ~Dead("demogor2") !Dead("demilich")~ + @5125 /* Thanks for the information, but I've been there already. All I have found was an ancient demon lord which I have defeated. */ + Karim.DemonHeart.2
    ++ @5126 /* Thanks for the information. I will go there and look for further clues. */ + Karim.Demilich.3
    ++ @5127 /* I think this is too much trouble. I'll find another solution on my own. */ + Karim.Demilich.6
  END

  IF ~~ Karim.Demilich.2
    SAY @5128 /* I wish you success, <CHARNAME>. You seem to know already what you'll need for Malik. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~~ Karim.Demilich.3
    SAY @5129 /* I wish you success in your quest, <CHARNAME>. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6534 EXIT
  END

  IF ~~ Karim.Demilich.4
    SAY @5130 /* I suggest to look for the demilich in the darker places of the fortress. Good luck in your quest, <CHARNAME>. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6534 EXIT
  END

  IF ~~ Karim.Demilich.5
    SAY @5131 /* You must find the artifact quickly. It could be devastating in the wrong hands. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6535 EXIT
  END

  IF ~~ Karim.Demilich.6
    SAY @5132 /* Very well, I will accept your decision. But you should know that the alternatives are possibly even more dangerous. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6536 EXIT
  END

  IF ~~ Karim.DemonHeart.1
    SAY @5133 /* I wish you success in your search for a heart of a demon lord, <CHARNAME>. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6537 EXIT
  END

  IF ~~ Karim.DemonHeart.2
    SAY @5134 /* This is an impressive deed, <CHARNAME>. Did you manage to extract its heart? */
    + ~OR(2) PartyHasItem("A7HEART1") PartyHasItem("A7HEART2")~ + @5135 /* Yes, I have a demon heart in my possession. */ + Karim.DemonHeart.3
    + ~!PartyHasItem("A7HEART1") !PartyHasItem("A7HEART2")~ + @5136 /* No, I don't have a demon heart. */ + Karim.DemonHeart.4
  END

  IF ~~ Karim.DemonHeart.3
    SAY @5137 /* Very good. You should offer it to Malik. It might be as useful to him as the undead artifact. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6538 EXIT
  END

  IF ~~ Karim.DemonHeart.4
    SAY @5138 /* I suggest to find the heart of a demon lord or an undead artifact of equal power as soon as possible. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6539 EXIT
  END

  IF ~~ Karim.Misc.1
    SAY @5139 /* Then I wish you success in your next steps. */
    IF ~~ DO ~ClearActions(Myself)~ UNSOLVED_JOURNAL @6540 EXIT
  END


  // *** Generic conversation after accepting Karim's task ***
  IF ~GlobalLT("A7Quest5", "GLOBAL", 10)~ Karim.Cave.5
    SAY @5140 /* Can I help you, <GABBER>? */
    ++ @5141 /* Could you tell me again what you have found out so far? */ + Karim.Cave.6
    + ~Global("A7Quest5", "GLOBAL", 4) Global("A7Q5Artifact", "GLOBAL", 3)~ + @5142 /* Can you tell me again what options I have how to deal with Lord Malik? */ + Karim.Cave.MalikOptions.1
    ++ @5143 /* Can you help me somehow in my task? */ + Karim.Cave.Help
    + ~Global("A7Q5Protection", "GLOBAL", 0)~ + @5144 /* Please take me back to the surface. */ + Karim.BackToSurface
    ++ @5145 /* Not at the moment. */ + Karim.Cave.Bye
  END

  IF ~~ Karim.Cave.6
    SAY @5146 /* Of course. */
    = @5147 /* This cavern leads to a deeper and much bigger cave. You will need an effective protection from the heat which is emanating from the depths, as it even penetrates our innate resistances. */
    IF ~GlobalLT("TellAboutCave", "A77002", 3)~ + Karim.Cave.7
    IF ~Global("TellAboutCave", "A77002", 3)~ + Karim.Cave.8
    IF ~GlobalGT("TellAboutCave", "A77002", 3)~ + Karim.Cave.9
    //IF ~GlobalGT("TellAboutCave", "A77002", 4)~ + Karim.Cave.10
  END

  IF ~~ Karim.Cave.7
    SAY @5148 /* We are unable to tell you more because our attempts to scan this region more thoroughly are magically blocked. */
    = @5149 /* Your task is to gather as much information as you can about the threat towards our stronghold and, if possible, find a way to neutralize it. */
    IF ~~ + Karim.Cave.5
  END

  IF ~~ Karim.Cave.8
    SAY @5150 /* From what you have told me, we are targeted by an army of efreets, accompanied by fire trolls, elementals and salamanders. */
    = @5058 /* I'd advise you to continue your work for the efreets. They will see your actions as a means to earn their respect. Please inform us as soon as you learn anything else. */
    IF ~~ + Karim.Cave.5
    
  END

  IF ~~ Karim.Cave.9
    SAY @5151 /* From what you have told me, we are targeted by an army of efreets lead by the warlord Malik, accompanied by fire trolls, elementals and salamanders. */
    = @5152 /* Malik's goal is to steal the "Crown of Qadeej" from us. That artifact is a very important part of our culture and a remnant of the ancient Dawn War. */
    = @5153 /* Judging the nature of the artifact, he might consider an artifact of equal power. */
    = @5154 /* Other than that, you can always try to defeat him and his army. It will be a difficult battle however, because he is already prepared for a war. */
    IF ~~ + Karim.Cave.5
  END

  IF ~~ Karim.Cave.Help
    SAY @5155 /* I have already given you the means to call us in a time of need. Other than that we have prepared a few items you might find useful in the cabinet over at the wall. */
    IF ~~ + Karim.Cave.5
  END

  IF ~~ Karim.Cave.MalikOptions.1
    SAY @5146 /* Of course. */
    IF ~Global("A7Q5Demilich", "GLOBAL", 0) Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + Karim.Cave.MalikOptions.7
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 1) !InParty("Imoen2")~ + Karim.Cave.MalikOptions.5
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2")~ + Karim.Cave.MalikOptions.4
    IF ~Global("A7Q5DemonHeart", "GLOBAL", 1)~ + Karim.Cave.MalikOptions.3
    IF ~Global("A7Q5Demilich", "GLOBAL", 1)~ + Karim.Cave.MalikOptions.2
  END

  IF ~~ Karim.Cave.MalikOptions.2
    SAY @5156 /* You can look for the phylacteries of powerful demiliches. */
    = @5080 /* Demiliches share a permanent connection with the negative energy plane using their phylacteries, which are basically repositories used to store their souls. */
    = @5081 /* They are usually merged with their remaining body parts, that's why it is highly likely that the remains of a defeated demilich still contain their spiritual essences. */
    IF ~Global("A7Q5DemonHeart", "GLOBAL", 0) Global("A7Q5DivineEssence", "GLOBAL", 0)~ + Karim.Cave.MalikOptions.6
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 1) !InParty("Imoen2")~ + Karim.Cave.MalikOptions.5
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2")~ + Karim.Cave.MalikOptions.4
    IF ~Global("A7Q5DemonHeart", "GLOBAL", 1)~ + Karim.Cave.MalikOptions.3
  END

  IF ~~ Karim.Cave.MalikOptions.3
    SAY @5157 /* You could try to find or summon a powerful demon lord to this plane. */
    = @5090 /* Demon lords are in control over one or more layers of the Abyss. If you manage to destroy a demon lord while leaving his heart intact, you could offer it to Malik as another substitute. */
    = @5091 /* The heart contains much of the demon lord's power and, more importantly, still shares a connection to the demon's layer of the Abyss. */
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 0)~ + Karim.Cave.MalikOptions.6
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 1) !InParty("Imoen2")~ + Karim.Cave.MalikOptions.5
    IF ~Global("A7Q5DivineEssence", "GLOBAL", 1) InParty("Imoen2")~ + Karim.Cave.MalikOptions.4
  END

  IF ~~ Karim.Cave.MalikOptions.4
    SAY @5158 /* You may decide to offer parts of Imoen's or your divine soul to Malik. */
    = @5159 /* It will enable Malik to make use of it in a similar way as he would use our "Crown of Qadeej". However, you should be aware of the dangers. It might be more than you or Imoen can handle. */
    IF ~~ + Karim.Cave.MalikOptions.6
  END

  IF ~~ Karim.Cave.MalikOptions.5
    SAY @5160 /* You may decide to offer parts of your divine soul to Malik. */
    = @5161 /* It will enable Malik to make use of it in a similar way as he would use our "Crown of Qadeej". However, you should be aware of the dangers. It might be more than you can handle. */
    IF ~~ + Karim.Cave.MalikOptions.6
  END

  IF ~~ Karim.Cave.MalikOptions.6
    SAY @5162 /* There is always the option to defeat Malik and his efreets in battle. If you decide to attack him, I will repeat my offer to help you. Use the whistle I have already given you and we will appear. */
    IF ~~ + Karim.Cave.5
  END

  IF ~~ Karim.Cave.MalikOptions.7
    SAY @5163 /* Surrendering our precious artifact to the efreets is out of question, that's why their defeat is the only viable option I can give you. */
    IF ~~ + Karim.Cave.5
  END


  IF ~~ Karim.Cave.Bye
    SAY @5164 /* Very well. Remember that you can safely rest here if you need to. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END


  // *** Teleport party back to the Smuggler Cave ***
  IF ~~ Karim.BackToSurface
    SAY @5165 /* As you wish. */
    IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct3a")~ EXIT
  END


  // *** "Warcry" in A77003 after summoned by party to help fighting the efreets ***
  IF ~GlobalGT("A7Quest5", "GLOBAL", 7) GlobalLT("A7Quest5", "GLOBAL", 10) Global("SummonedAndFighting", "LOCALS", 1) AreaCheck("A77003")~ Karim.Efreets.WarCry
    SAY @5166 /* Attack, my brothers. For a bright future! */
    IF ~~ DO ~SetGlobal("SummonedAndFighting", "LOCALS", 2) ClearActions(Myself)~ EXIT
  END

  IF ~GlobalGT("A7Quest5", "GLOBAL", 7) GlobalLT("A7Quest5", "GLOBAL", 10) Global("SummonedAndFighting", "LOCALS", 2) AreaCheck("A77003")~ Karim.Efreets.1
    SAY @5167 /* I would like to chat with you, but I'm a little busy at the moment. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  // *** Talk to party in A77003 after the efreets have been defeated ***
  IF ~Global("A7Quest5", "GLOBAL", 10) AreaCheck("A77003")~ Karim.Efreets.Victory.1
    SAY @5168 /* Victory is ours. We will return to the upper cave. */
    = @5169 /* Please talk to us there. */
    IF ~~ DO ~SetGlobal("A7Q5DjinniSummoned", "GLOBAL", 2) SetGlobal("A7Q5TeleportAway", "A77003", 1)~ EXIT
  END


  // *** Talk to party in A77002 after finishing Quest 5 ***
  IF ~Global("A7Quest5", "GLOBAL", 10) Global("A7Q5Finished", "A77002", 1) AreaCheck("A77002") Global("A7Q5DjinniSummoned", "GLOBAL", 0)~ Karim.Reward.1
    SAY @5170 /* You are back safe and sound? We have worried for your safety. */
    IF ~~ + Karim.Reward.2
  END

  IF ~Global("A7Quest5", "GLOBAL", 10) Global("A7Q5Finished", "A77002", 1) AreaCheck("A77002") !Global("A7Q5DjinniSummoned", "GLOBAL", 0)~ Karim.Reward.2
    SAY @5171 /* The efreets are gone and the threat against our stronghold has been averted. */
    = @5172 /* For that we thank you. */
    IF ~True()~ + Karim.Reward.6
    IF ~Global("A7Q5DjinniSummoned", "GLOBAL", 0)~ + Karim.Reward.3
    IF ~Global("A7Q5DjinniSummoned", "GLOBAL", 2) HasItem("A7SW1H3", Myself)~ + Karim.Reward.4
    IF ~Global("A7Q5DjinniSummoned", "GLOBAL", 2) !HasItem("A7SW1H3", Myself)~ + Karim.Reward.5
  END

  IF ~~ Karim.Reward.3
    SAY @5173 /* As a token of appreciation I reward you with this magical ring. It grants you protective powers of the genie kind. */
    IF ~~ DO ~GiveItemCreate("A7RING03", LastTalkedToBy, 3, 3, 2)~ + Karim.Reward.6
  END

  IF ~~ Karim.Reward.4
    SAY @5174 /* As a token of appreciation I present to you Cloud Slasher, a powerful scimitar, forged by the master smith of the Grand Caliph himself. */
    IF ~~ DO ~GiveItem("A7SW1H3", LastTalkedToBy)~ + Karim.Reward.6
  END

  IF ~~ Karim.Reward.5
    SAY @5175 /* I wanted to present you with a token of my appreciation, but it appears you have already helped yourself. */
    IF ~~ + Karim.Reward.6
  END

  IF ~~ Karim.Reward.6
    SAY @5176 /* We will return to our home. May your future shine brightly and be assured that we will not forget what you have done for us. */
    IF ~~ DO ~SetGlobal("A7Q5Finished", "A77002", 2) AddXP2DA("A7Q5MQ5")
        EraseJournalEntry(@6502) EraseJournalEntry(@6503) EraseJournalEntry(@6504) 
        EraseJournalEntry(@6505) EraseJournalEntry(@6506) EraseJournalEntry(@6507) EraseJournalEntry(@6508) 
        EraseJournalEntry(@6509) EraseJournalEntry(@6510) EraseJournalEntry(@6511) EraseJournalEntry(@6512) 
        EraseJournalEntry(@6513) EraseJournalEntry(@6514) EraseJournalEntry(@6515) EraseJournalEntry(@6516) 
        EraseJournalEntry(@6517) EraseJournalEntry(@6518) EraseJournalEntry(@6519) EraseJournalEntry(@6520) 
        EraseJournalEntry(@6521) EraseJournalEntry(@6522) EraseJournalEntry(@6523) EraseJournalEntry(@6524) 
        EraseJournalEntry(@6525) EraseJournalEntry(@6526) EraseJournalEntry(@6527) EraseJournalEntry(@6528) 
        EraseJournalEntry(@6529) EraseJournalEntry(@6530) EraseJournalEntry(@6531) EraseJournalEntry(@6532) 
        EraseJournalEntry(@6533) EraseJournalEntry(@6534) EraseJournalEntry(@6535) EraseJournalEntry(@6536) 
        EraseJournalEntry(@6537) EraseJournalEntry(@6538) EraseJournalEntry(@6539) EraseJournalEntry(@6540) 
        EraseJournalEntry(@6541) EraseJournalEntry(@6542) EraseJournalEntry(@6543) EraseJournalEntry(@6544) 
        EraseJournalEntry(@6548)~ SOLVED_JOURNAL @6593 EXIT
  END

END
