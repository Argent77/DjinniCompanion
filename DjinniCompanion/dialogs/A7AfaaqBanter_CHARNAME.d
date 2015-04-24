// *** Banters with CHARNAME (continued #2) ***
// Traified

// *** Regular banters after introduction ***
APPEND A7AFAAQ
  // Heritage #1
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCHeritage", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCHeritage.1
    SAY @12200 /* My <PRO_LADYLORD>, I am sensing something unusual from you. A restless, malevolent aura. */
    IF ~Alignment(Player1, MASK_EVIL)~ + PCHeritage.1.1
    IF ~!Alignment(Player1, MASK_EVIL)~ + PCHeritage.1.2
  END

  IF ~~ PCHeritage.1.1
    SAY @12201 /* Although I have witnessed your cruel character already, this kind of evil does not feel natural. It is almost as if there is a duality within your soul. */
    ++ @12202 /* This isn't too far from the truth, Afaaq. I am harboring the divine essence of a dead god within me. */ + PCHeritage.1.4
    ++ @12203 /* Hehe, maybe this is a side you don't know about me yet. */ + PCHeritage.1.3
    ++ @12204 /* What are you talking about? This is my true self, you have already seen what I am capable of. */ + PCHeritage.1.3
  END

  IF ~~ PCHeritage.1.2
    SAY @12205 /* But it does not fit your character at all, as I can sense your benevolent nature as well. It is almost as if there is a duality within your soul. */
    ++ @12202 /* This isn't too far from the truth, Afaaq. I am harboring the divine essence of a dead god within me. */ + PCHeritage.1.4
    ++ @12206 /* Really? Maybe this is a side of me you haven't seen yet. */ + PCHeritage.1.3
    ++ @12207 /* I don't know what you are talking about? I am me and nothing else. */ + PCHeritage.1.3
  END

  IF ~~ PCHeritage.1.3
    SAY @12208 /* If you say so?  However, my senses usually do not let me down. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCHeritage.1.4
    SAY @12209 /* I suspected something like this. Do you mind telling me more about it? */
    + ~Alignment(Player1, MASK_EVIL)~ + @12210 /* Why not? It hasn't been a real secret anyway for quite some time now. I am a child of the dead god Bhaal. He somehow foresaw his own death during the Time of Troubles and took precautions to make sure that his death wouldn't be permanent. I am one of his 'precautions'. */ + PCHeritage.1.5
    + ~!Alignment(Player1, MASK_EVIL)~ + @12210 /* Why not? It hasn't been a real secret anyway for quite some time now. I am a child of the dead god Bhaal. He somehow foresaw his own death during the Time of Troubles and took precautions to make sure that his death wouldn't be permanent. I am one of his 'precautions'. */ + PCHeritage.1.6
  END

  IF ~~ PCHeritage.1.5
    SAY @12211 /* I see.  Your soul has been tainted by the divine essence of an evil god, and it has turned you into a pale reflection of its former self. */
    + ~CheckStatLT(Player1, 13, WIS)~ + @12212 /* Watch your mouth, genie! Bhaal's power is under MY control and I will use it to become even more powerful. */ + PCHeritage.1.7
    + ~CheckStatGT(Player1, 12, WIS)~ + @12213 /* You don't know anything about me! I will learn how to use Bhaal's power to my advantage. */ + PCHeritage.1.7
    + ~OR(2) Global("A7AfaaqUpgraded", "GLOBAL", 0) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ + @12214 /* Don't talk like that! You are MY servant now and have to act accordingly. */ + PCHeritage.1.8
    ++ @12215 /* I don't care for your conclusions. How I'm living my life is my own affair.  */ + PCHeritage.1.8
  END

  IF ~~ PCHeritage.1.6
    SAY @12216 /* I see.  And although your soul has been tainted by the divine essence of an evil god, you have retained enough willpower to resist its temptations. That is most impressive. */
    ++ @12217 /* Thank you. But I couldn't have done it without the support of my friends and family. */ + PCHeritage.1.9
    ++ @12218 /* It probably helped a lot that I grew up in a stable and sheltered environment. */ + PCHeritage.1.9
    + ~CheckStatGT(Player1, 14, WIS)~ + @12219 /* That may be. However, my true challenges lie before me yet. */ + PCHeritage.1.10
    ++ @12220 /* I don't really want to talk about it. */ + PCHeritage.1.8
  END

  IF ~~ PCHeritage.1.7
    SAY @12221 /* Are you not deceiving yourself? Bhaal's essence is not an alien force you can push aside or tap for its powers. It is part of you and you are part of 'it'. */
    ++ @12222 /* I'll take the risks if it means becoming a power by myself. */ + PCHeritage.1.11
    ++ @12223 /* It doesn't matter to me, as long as it serves its purpose. */ + PCHeritage.1.11
    + ~OR(2) Global("A7AfaaqUpgraded", "GLOBAL", 0) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ + @12214 /* Don't talk like that! You are MY servant now and have to act accordingly. */ + PCHeritage.1.8
    ++ @12215 /* I don't care for your conclusions. How I'm living my life is my own affair.  */ + PCHeritage.1.8
  END

  IF ~~ PCHeritage.1.8
    SAY @12224 /* As you wish. I thank you nonetheless that you have taken me into your confidence. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 4) SetGlobal("PCToldAboutHeritage", "LOCALS", 1)~ EXIT
  END

  IF ~~ PCHeritage.1.9
    SAY @12225 /* But even if you had some guidance in the past, it still takes a strong and steadfast character to come as far as you have without showing signs of corruption. */
    = @12226 /* Wherever your path will take you, I am certain that you will prevail in the end. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 4) SetGlobal("PCToldAboutHeritage", "LOCALS", 1)~ EXIT
  END

  IF ~~ PCHeritage.1.10
    SAY @12227 /* Life is a continuous succession of challenges. You have come far and I can not see any signs of corruption darkening your soul yet. */
    = @12226 /* Wherever your path will take you, I am certain that you will prevail in the end. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 4) SetGlobal("PCToldAboutHeritage", "LOCALS", 1)~ EXIT
  END

  IF ~~ PCHeritage.1.11
    SAY @12228 /* You do not need to justify yourself, as it is your life in the end which is at stake. If you have no regrets about the path you have taken, then I have no right to interfere. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 4) SetGlobal("PCToldAboutHeritage", "LOCALS", 1)~ EXIT
  END


  // Afaaq.Rakshasa
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCRakshasa", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCRakshasa.1
    SAY @12229 /* I have not really thanked you for my release from those rakshasa. */
    ++ @12230 /* Don't mention it. I will always help a friend of mine in need. */ + PCRakshasa.1.1
    ++ @12231 /* I'm certain you will find a way to thank me properly. */ + PCRakshasa.1.2
  END

  IF ~~ PCRakshasa.1.1
    SAY @12232 /* I am honored by your words, my <PRO_LADYLORD>. */
    IF ~~ + PCRakshasa.1.3
  END

  IF ~~ PCRakshasa.1.2
    SAY @12233 /* Be assured that I will pay back my debt when the time comes. */
    IF ~~ + PCRakshasa.1.3
  END

  IF ~~ PCRakshasa.1.3
    SAY @12234 /* My captors belonged to a cult that worshipped Ravanna, one of their god kings. I have rarely seen such fanaticism as in their high priest. */
    = @12235 /* He was responsible for binding me to the lamp. Even though I had been in a weakened state at that time, the rakshasa was no match for me... Until he called forth the powers of Ravanna. */
    ++ @12236 /* What happened then? */ + PCRakshasa.1.4
    ++ @12237 /* To tell the truth, I'd rather not hear the gruesome details of your defeat. */ + PCRakshasa.1.5
  END

  IF ~~ PCRakshasa.1.4
    SAY @12238 /* The summoned creature was a nightmare in appearance. His gaze alone would have instilled panic into the strongest of men. */
    = @12239 /* My magic did not work against that beast and the damage caused by my physical attacks healed before I could seriously wound it. */
    = @12240 /* His attacks were ferocious. I had to parry his physical attacks and evade his dark magic at the same time. But I was not fast enough in the end. */
    = @12241 /* I can barely remember what hit me. It enshrouded me in a dark and cold aura of despair and my consciousness slipped away. */
    = @12242 /* When I awakened, I was tightly held by the shackles of the lamp, only allowed to act as the rakshasa wished it. */
    IF ~~ + PCRakshasa.1.6
  END

  IF ~~ PCRakshasa.1.5
    SAY @12243 /* I can understand you. Just thinking about it still pains my soul. */
    = @12244 /* As you can see by my current state, I was no match afterwards. */
    IF ~~ + PCRakshasa.1.6
  END

  IF ~~ PCRakshasa.1.6
    SAY @12245 /* Telling you this was not easy for me, but I am deeply indebted to you for my rescue. */
    = @12246 /* With the death of their high priest, however, I do not expect any more attacks from the remaining members of their cult. */
    IF ~~ DO ~SetGlobal("BanterPCRakshasa", "LOCALS", 2)~ EXIT
  END


  // Heritage #2
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCHeritage", "LOCALS", 3) Global("BanterActive", "LOCALS", 1)~ PCHeritage.2
    SAY @12247 /* My <PRO_LADYLORD>, you show exceptional skill and power in your dealings with obstacles thrown in your path. I haven't seen many mortals who have developed themselves so rapidly. It is most impressive and very difficult to accomplish without additional help. */
    ++ @12248 /* If you must know, I had indeed additional help. I am harboring the divine essence of a dead god within me. */ + PCHeritage.1.4
    ++ @12249 /* Do you know the human proverb 'Curiosity killed the cat', Afaaq? */ + PCHeritage.2.1
  END

  IF ~~ PCHeritage.2.1
    SAY @12250 /* Very well. I will not inquire further if you are not willing to take me into your confidence. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 6)~ EXIT
  END


  // Heritage #3
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCHeritage", "LOCALS", 5) Global("BanterActive", "LOCALS", 1)~ PCHeritage.3
    SAY @12251 /* I have thought about what you told me about your heritage. */
    = @12252 /* Since you mentioned that it is not a real secret anymore, am I right in thinking that you already had to deal with your special nature in the past? */
    ++ @12253 /* I'm afraid so. Another Bhaalspawn by the name of Sarevok planned to ascend to godhood by throwing a whole region into chaos and terror. He killed my stepfather Gorion and attempted to murder me as well. */ + PCHeritage.3.2
    ++ @12254 /* Yes, you are. But I'm not in the mood to talk about it. */ + PCHeritage.3.1
  END

  IF ~~ PCHeritage.3.1
    SAY @12255 /* Then I apologize for my inquisitive behavior. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 6)~ EXIT
  END

  IF ~~ PCHeritage.3.2
    SAY @12256 /* I am sorry to hear. It must have been a traumatic experience. */
    + ~!Alignment(Player1, MASK_EVIL)~ + @12257 /* It was. The loss of Gorion had a great impact on my life. Fortunately I was able to stop Sarevok's plans in the end and avenge Gorion's death. */ + PCHeritage.3.3
    + ~Alignment(Player1, MASK_EVIL)~ + @12258 /* Not at all. His actions gave me the chance to break out of the monotony of Candlekeep and follow my own path. */ + PCHeritage.3.4
    ++ @12259 /* That's right. But then again without his interference I'd still be sitting in Candlekeep, doing nothing but the same routine day after day. */ + PCHeritage.3.5
    ++ @12260 /* Yes, it was. I'm sorry, but I can't talk about it. */ + PCHeritage.3.1
  END

  IF ~~ PCHeritage.3.3
    SAY @12261 /* The incident caused you much pain, but it also forced you take responsibility for your own life and set you on the path you have been walking up until now. */
    IF ~~ + PCHeritage.3.6
  END

  IF ~~ PCHeritage.3.4
    SAY @12262 /* You may have followed a path, but I am not certain whether it was your own. */
    IF ~~ + PCHeritage.3.6
  END

  IF ~~ PCHeritage.3.5
    SAY @12263 /* Taking a practical view on your life is not the worst thing to do. */
    IF ~~ + PCHeritage.3.6
  END

  IF ~~ PCHeritage.3.6
    SAY @12264 /* Nevertheless, you have accomplished great things by destroying your sibling and undoing the chaos he brought. That is what you will be remembered for, regardless of your motives behind it. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 6)~ EXIT
  END


  // Heritage #4
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCHeritage", "LOCALS", 7) Global("BanterActive", "LOCALS", 1)~ PCHeritage.4
    SAY @12265 /* My <PRO_LADYLORD>, I have watched you most carefully after your horrible treatment by Irenicus and I am impressed that you have not given up despite your current state. */
    + ~OR(3) !InParty("Imoen2") StateCheck("Imoen2", CD_STATE_NOTVALID) !InMyArea("Imoen2")~ + 
      @12266 /* Thank you. But honestly I'm not sure if I can go on like this much longer. */ + PCHeritage.4.2
    + ~InParty("Imoen2") !StateCheck("Imoen2", CD_STATE_NOTVALID) InMyArea("Imoen2")~ + 
      @12266 /* Thank you. But honestly I'm not sure if I can go on like this much longer. */ EXTERN BIMOEN2 PCHeritage.4.Imoen.1
    ++ @12267 /* Do I have another choice? */ + PCHeritage.4.3
    ++ @12268 /* I'm really not in the mood to discuss my current predicament with you. */ + PCHeritage.4.1
  END

  IF ~~ PCHeritage.4.1
    SAY @12269 /* As you wish. It is not my intention to trouble you further with my questions. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 8)~ EXIT
  END

  IF ~~ PCHeritage.4.2
    SAY @12270 /* We have been travelling together for some time already. You have overcome many obstacles, even though the odds did not favor you all the time. */
    = @12271 /* Your will to live on is much stronger than you admit to yourself. */
    IF ~~ + PCHeritage.4.4
  END

  IF ~~ PCHeritage.4.3
    SAY @12272 /* Not really. But in the time we have been travelling together I have witnessed your strong will to live on, even though the odds did not favor you all the time. */
    IF ~~ + PCHeritage.4.4
  END

  IF ~~ PCHeritage.4.4
    SAY @12273 /* Even with the loss of your soul you have come far. I am certain that you will catch up with Irenicus sooner or later and overcome this trial as well. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 8)~ EXIT
  END
END

APPEND BIMOEN2
  IF ~~ PCHeritage.4.Imoen.1
    SAY @12274 /* Don't be so down. We've been through worse situations. Okay, not really. But together we can catch up with Irenicus and make him pay. */
    IF ~~ EXTERN A7AFAAQ PCHeritage.4.2
  END
END


APPEND A7AFAAQ
  // StolenSoul
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCSoul", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCSoul.1
    SAY @12275 /* My <PRO_LADYLORD>, I share your grief about the loss of your soul. */
    = @12276 /* Although I am hesitant to speak about it, I can understand your current predicament better than you might think. */
    ++ @12277 /* Really? Tell me more! */ + PCSoul.1.2
    ++ @12278 /* Thanks, but I don't want to hear more about it right now. */ + PCSoul.1.1
  END

  IF ~~ PCSoul.1.1
    SAY @12279 /* As you wish. */
    IF ~~ DO ~SetGlobal("BanterPCSoul", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCSoul.1.2
    SAY @12280 /* I too have lost parts of my spiritual essence. It happened long ago, but the effect is still as prevalent as back then. */
    ++ @12281 /* Why didn't you mention it before? */ + PCSoul.1.3
    ++ @12282 /* How did that happen? */ + PCSoul.1.4
  END

  IF ~~ PCSoul.1.3
    SAY @12283 /* It is not my way to freely talk about matters that might be used against me. But the situation changed after you lost your soul as well. */
    IF ~~ + PCSoul.1.4
  END

  IF ~~ PCSoul.1.4
    SAY @12284 /* I am loath to tell you specifics. It happened centuries ago when I walked the prime material plane after a long time of absence. */
    = @12285 /* I was ambushed by a drow party at night. Their attack came seemingly out of nowhere and was carried out with utmost precision. Even though I was able to set up my defences, the enemy had the means to penetrate them without difficulties. The fight was decided in a matter of seconds. */
    = @12286 /* My opponents knew exactly who I was and what to expect from me. My suspicions were confirmed later by my captor. */
    + ~GlobalLT("A7Quest3", "GLOBAL", 2)~ + @12287 /* Who was able to catch you so easily? */ + PCSoul.1.5
    + ~GlobalGT("A7Quest3", "GLOBAL", 1)~ + @12288 /* You are talking about Tathas Melarn, aren't you? */ + PCSoul.1.6
  END

  IF ~~ PCSoul.1.5
    SAY @12289 /* I will not tell you the name of my captor, to avoid putting you into unnecessary danger. */
    = @12290 /* My captor performed a dark ritual that ripped a part of my spiritual essence out and locked it away into a magical crystal. */
    IF ~~ + PCSoul.1.7
  END

  IF ~~ PCSoul.1.6
    SAY @12291 /* Yes, I am. He is apparently a collector of sorts, specialized in exotic and powerful beings that he manages to bring under his control. */
    = @12292 /* He performed a dark ritual that ripped a part of my spiritual essence out and locked it away into a magical crystal. */
    IF ~~ + PCSoul.1.7
  END

  IF ~~ PCSoul.1.7
    SAY @12293 /* I was able to flee eventually, but in my weakened state I was an easy target for the rakshasa who crossed my path several years ago. */
    = @12294 /* Even now I can feel the loss of my soul as intense as at the moment it was forcibly removed. */
    ++ @12295 /* And I thought your binding to the lamp is bad enough. Compared to your predicament, my current state doesn't sound so bad anymore. */ + PCSoul.1.8
    ++ @12296 /* So your situation is even worse than my own? I'm sorry to hear. */ + PCSoul.1.8
  END

  IF ~~ PCSoul.1.8
    SAY @12297 /* It is bad, but I have learned to be patient. Everything will be solved sooner or later as long as you do not give up. */
    IF ~~ DO ~SetGlobal("BanterPCSoul", "LOCALS", 2)~ EXIT
  END


  // Heritage #5
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterIrenicusPlans", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCHeritage.5
    SAY @12298 /* I have been thinking about recent events lately. If Irenicus made a deal with the drow, his plans must involve much more than stealing your divine soul. */
    ++ @12299 /* You may be right. He mentioned something about settling an old score. */ + PCHeritage.5.3
    ++ @12300 /* Dealing with drow is always dangerous. Maybe he needs them because he isn't as powerful as he wants us to believe. */ + PCHeritage.5.2
    ++ @12301 /* I don't know and I don't want to waste my time with speculations that lead to nothing. */ + PCHeritage.5.1
  END

  IF ~~ PCHeritage.5.1
    SAY @12302 /* It is your decision. But I want to point out that you have been caught in his traps once. Do not make the same mistake a second time. */
    IF ~~ DO ~SetGlobal("BanterIrenicusPlans", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCHeritage.5.2
    SAY @12303 /* He might have been in the past, but right now he has access to your portion of Bhaal's divine essence in addition to his own power. */
    = @12304 /* His plans worked out frighteningly accurate, despite some improvisations. */
    IF ~~ + PCHeritage.5.4
  END

  IF ~~ PCHeritage.5.3
    SAY @12305 /* Revenge is a strong motivating factor. He took high risks by capturing you and even allowed himself to be captured by the Cowled Wizards. */
    = @12306 /* His desire for vengeance must be great indeed to take such risks. Even though not all went according to his plans, he appears to have reached his goal. */
    IF ~~ + PCHeritage.5.4
  END

  IF ~~ PCHeritage.5.4
    SAY @12307 /* Your escape however was unexpected. I wonder if it has any impact on his current plans? */
    ++ @12308 /* He acted very arrogantly in my presence. I don't think he wastes any thoughts on me at all. */ + PCHeritage.5.5
    ++ @12309 /* If he continues his plans as carefully as in the past, I have to expect another trap. I must proceed carefully. */ + PCHeritage.5.6
    ++ @12310 /* Right now I don't care what he plans. All I can think of is getting my soul back. */ + PCHeritage.5.7
  END

  IF ~~ PCHeritage.5.5
    SAY @12311 /* Arrogance can cloud a person's judgement. */
    = @12312 /* He underestimated you in your final confrontation in Spellhold, but at that time we had help from the prison's inmates. */
    = @12313 /* Now we are on our own and Irenicus knows this. It might give us an advantage in our next confrontation. */
    IF ~~ + PCHeritage.5.8
  END

  IF ~~ PCHeritage.5.6
    SAY @12314 /* I agree that his plans were laid out very carefully, but he is also convinced of his superiority. We can use this overconfidence of his to our advantage. */
    IF ~~ + PCHeritage.5.8
  END

  IF ~~ PCHeritage.5.7
    SAY @12315 /* Do not let desperation lead your actions. An opponent as powerful as he will have ways to stop you even if you manage to surprise him. */
    IF ~~ + PCHeritage.5.8
  END

  IF ~~ PCHeritage.5.8
    SAY @12316 /* Nevertheless, I will follow your lead wherever you go. I am hopeful that together we will succeed in the end. */
    IF ~~ DO ~SetGlobal("BanterIrenicusPlans", "LOCALS", 2)~ EXIT
  END


  // Afaaq.TathasMelarn
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCSoul", "LOCALS", 0) Global("BanterPCTathasMelarn", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCTathasMelarn.1a
    SAY @12317 /* I can imagine that you are wondering about my past in the presence of the drow sorcerer Tathas Melarn. */
    = @12318 /* He might have mentioned bits and pieces about me in his dealings with you. But I am certain that he told you nothing about how I was able to flee from his immediate grasp. */
    ++ @12319 /* No he hasn't. Please tell me more! */ + PCTathasMelarn.1.2
    ++ @12320 /* Another story about you? I'm not interested. */ + PCTathasMelarn.1.1
  END

  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCSoul", "LOCALS", 2) Global("BanterPCTathasMelarn", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCTathasMelarn.1b
    SAY @12321 /* I have told you that the drow sorcerer Tathas Melarn captured me and locked parts of my spiritual essence away. I have not told you, however, how I was able to flee from his immediate grasp. */
    ++ @12322 /* Please tell me more! */ + PCTathasMelarn.1.2
    ++ @12320 /* Another story about you? I'm not interested. */ + PCTathasMelarn.1.1
  END

  IF ~~ PCTathasMelarn.1.1
    SAY @12323 /* I am disappointed by your lack of interest, but I will comply with your wishes. */
    IF ~~ DO ~SetGlobal("BanterPCTathasMelarn", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCTathasMelarn.1.2
    SAY @12324 /* We genies are used to being in service to powerful mortals for a limited span of time. In many cases both sides benefit from the relation. */
    = @12325 /* In my case with the drow sorcerer it was different. He forced me into servitude without giving me a chance to negotiate any form of contract. */
    = @12326 /* By sealing away portions of my spiritual essence I was not in a position to complain anymore. */
    ++ @12327 /* So you had to perform all his tasks unconditionally? */ + PCTathasMelarn.1.3
  END

  IF ~~ PCTathasMelarn.1.3
    SAY @12328 /* Yes, and many of his tasks went against my basic nature. */
    = @12329 /* I do not want to burden you with gruesome details, but in that time I learned the daily horror of surviving in a society that is dominated by a ruthless religion and based on power play of the worst kind. */
    = @12330 /* It is a bitter irony that the worst excesses of that society saved me and many others in the end. */
    ++ @12331 /* What happened? */ + PCTathasMelarn.1.4
  END

  IF ~~ PCTathasMelarn.1.4
    SAY @12332 /* My former master was an expert in espionage and infiltration. His talents allowed him to assimilate smaller houses without significant losses and at the same time he managed to keep the more dangerous rivals at bay. */
    = @12333 /* His latest campaign went not as smoothly as he calculated. Despite his precautions he was ambushed and captured by a rival house. Fearful of his might, they attempted to cut off his connection to the magical weave. They failed, but for a short moment all magical connections were severed, including the links to his thralls. */
    = @12334 /* We took advantage of that short moment of freedom and removed our magical collars that kept us under control. */
    = @12335 /* Not all of us managed to escape however. His magic returned very quickly and we had no time to stay and help the remaining slaves. */
    = @12336 /* Even though I was able to flee, my spiritual essence did not return to me. I was condemned to stay on the prime material plane all the long years, weakened and vulnerable. */
    ++ @12337 /* Did you try to reclaim your essence? */ + PCTathasMelarn.1.5
    ++ @12338 /* Now I understand why you were captured so easily by the rakshasa. */ + PCTathasMelarn.1.6
  END

  IF ~~ PCTathasMelarn.1.5
    SAY @12339 /* I have seriously considered it. Since my chances of success were minimal, I refrained from it in the end. */
    = @12340 /* Instead I studied alternate methods to overcome my weakened state. I travelled from one place to another, following even the vaguest hints. */
    IF ~~ + PCTathasMelarn.1.6
  END

  IF ~~ PCTathasMelarn.1.6
    SAY @12341 /* About thirty years ago I must have drawn the attention of a certain group of rakshasa. They followed me undetected, and studied me and my weaknesses before they took the initiative. */
    = @12342 /* Unable to retreat into the Plane of Air and with many of my powers sealed away I was an easy prey for their priests. */
    ++ @12343 /* That was some story. The life of a genie is not as easy as I thought. */ + PCTathasMelarn.1.7
    ++ @12344 /* You have suffered a long time. No wonder you are so gloomy all the time. */ + PCTathasMelarn.1.7
    + ~PartyHasItem("A7MISC6")~ + @12345 /* I wish I could do more to help you. */ + PCTathasMelarn.1.8
    + ~!PartyHasItem("A7MISC6")~ + @12345 /* I wish I could do more to help you. */ + PCTathasMelarn.1.9
  END

  IF ~~ PCTathasMelarn.1.7
    SAY @12346 /* My current plight is just another trial in life I have to endure. */
    IF ~~ + PCTathasMelarn.1.9
  END

  IF ~~ PCTathasMelarn.1.8
    SAY @12347 /* You have helped me more than you can imagine by reclaiming my soulcage from Tathas Melarn. Even though I have not the power to break its seal at the moment, I can finally see a glimpse of hope. */
    IF ~~ DO ~SetGlobal("BanterPCTathasMelarn", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCTathasMelarn.1.9
    SAY @12348 /* I have learned to be patient in past ages. Whether it takes me another three or three hundred centuries, I will survive in one way or another. Unlike for you mortals, time is of little importance for my kind. */
    IF ~~ DO ~SetGlobal("BanterPCTathasMelarn", "LOCALS", 2)~ EXIT
  END


  // Afaaq.AboutGenies
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCAboutGenies", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCPlane.1
    SAY @12349 /* Have you ever met one of my kind outside of ritual bindings? */
    + ~!Global("zahraajob", "GLOBAL", 0)~ + @12350 /* I had some dealings with the dao genies in Trademeet. */ + PCPlane.1.2
    + ~Global("zahraajob", "GLOBAL", 0)~ + @12351 /* I think I had, but I don't remember where. */ + PCPlane.1.2
    ++ @12352 /* I don't think so. */ + PCPlane.1.2
    ++ @12353 /* No, and I don't care. */ + PCPlane.1.1
  END

  IF ~~ PCPlane.1.1
    SAY @12354 /* That is unfortunate, but I do not want to engage you in conversation against your will. */
    IF ~~ DO ~SetGlobal("BanterPCAboutGenies", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCPlane.1.2
    SAY @12355 /* I have realized that many mortals do not distinguish between the different clans of genies. The djinns, dao or efreets for example. */
    = @12356 /* It is a very important distinction for us and we do not take kindly that kind of generalization. You might be similarly offended if we throw humans, elves, duergar and orcs together. */
    + ~CheckStatLT(Player1, 9, INT)~ + @12357 /* That's right. I have to admit that I don't know anything about it either. */ + PCPlane.1.3
    + ~CheckStatGT(Player1, 8, INT) CheckStatLT(Player1, 15, INT)~ + @12358 /* That's right. I have heard the terms djinn, dao or efreet before, but nothing specific. */ + PCPlane.1.3
    + ~CheckStatGT(Player1, 14, INT)~ + @12359 /* That's right. I however have learned much about your kind and can understand why you don't feel comfortable when people aren't able to tell djinns and dao apart. */ + PCPlane.1.4
    ++ @12360 /* It doesn't really matter as far as I'm concerned. But others might be offended. */ + PCPlane.1.5
  END

  IF ~~ PCPlane.1.3
    SAY @12361 /* You do not need to be embarrassed. We rarely give outsiders an insight into our social structures. */
    = @12362 /* The few bits and pieces known to men are most likely accumulated over generations of wizards dealing with our kind. */
    IF ~~ + PCPlane.1.5
  END

  IF ~~ PCPlane.1.4
    SAY @12363 /* You continue to surprise me, my <PRO_LADYLORD>. That knowledge is surely not easy to come by for outsiders. */
    IF ~~ + PCPlane.1.5
  END

  IF ~~ PCPlane.1.5
    SAY @12364 /* I am a djinni, as you have surely realized by now. Our kind is born out of the chaotic elements of air. */
    = @12365 /* We are not the only clan of genies in the planes however. Our mortal enemies, the dao and the efreets, are there as well. They rarely cross our paths, but when it happens it almost always results in violence. */
    ++ @12366 /* Can't you find ways for a peaceful coexistence? */ + PCPlane.1.6
    ++ @12367 /* Please go on. */ + PCPlane.1.7
  END

  IF ~~ PCPlane.1.6
    SAY @12368 /* Do not ask for the impossible. Their existence alone is a grave offence by itself. The dao or efreets surely view our kind similarly. */
    = @12369 /* I can imagine this fact is difficult for a mortal to comprehend. But this is our way. */
    IF ~~ + PCPlane.1.7
  END

  IF ~~ PCPlane.1.7
    SAY @12370 /* Not all of our clans are hostile to each other. Although we do not have much contact with the marids, their kind is not unwelcome in our midst. */
    IF ~CheckStatGT(Player1, 14, INT)~ + PCPlane.1.9
    + ~CheckStatLT(Player1, 15, INT)~ + @12371 /* Marids? */ + PCPlane.1.8
  END

  IF ~~ PCPlane.1.8
    SAY @12372 /* Marids are genies born out of the capricious element of water. They rarely mingle with mortals however, so I can understand your ignorance. */
    IF ~~ + PCPlane.1.9
  END

  IF ~~ PCPlane.1.9
    SAY @12373 /* There are other clans such as the jann, khayal or qorrash, but we either avoid their kind or maintain distant relations with them. */
    + ~CheckStatLT(Player1, 15, INT)~ + @12374 /* Very interesting. That was a unique insight into your culture. */ + PCPlane.1.10
    + ~CheckStatGT(Player1, 14, INT)~ + @12375 /* Very interesting. Even I didn't know everything you've told me. */ + PCPlane.1.10
    ++ @12376 /* Thanks for sharing your knowledge with me, Afaaq. */ + PCPlane.1.10
  END

  IF ~~ PCPlane.1.10
    SAY @12377 /* Consider yourself fortunate, my <PRO_LADYLORD>. We usually do not tell outsiders about us as freely as I have. */
    IF ~~ DO ~SetGlobal("BanterPCAboutGenies", "LOCALS", 2)~ EXIT
  END


  // Heritage #6
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCHeritage", "LOCALS", 9) Global("BanterActive", "LOCALS", 1)~ PCHeritage.6
    SAY @12378 /* I am just recalling how we first met. Much has changed since you decided to take me with you. */
    = @12379 /* You have changed. */
    IF ~!Alignment(Player1, MASK_EVIL)~ + PCHeritage.6.2
    IF ~Alignment(Player1, MASK_EVIL)~ + PCHeritage.6.1
  END

  IF ~~ PCHeritage.6.1
    SAY @12380 /* The trials in hell have given you power, but Bhaal's influence over you now is greater than ever. */
    ++ @12381 /* So what. Power is everything. I will overcome Bhaal's influence over me eventually and become a god in my own right. */ + PCHeritage.6.5
    ++ @12382 /* It doesn't matter. Instead of fighting the taint and becoming weaker in the process I will take advantage of it. */ + PCHeritage.6.5
    ++ @12383 /* What does it have to do with you? */ + PCHeritage.6.4
    ++ @12384 /* I have no desire to talk about it. */ + PCHeritage.6.3
  END

  IF ~~ PCHeritage.6.2
    SAY @12385 /* I have watched you most carefully during your trials in hell. Even the most tempting offer could not sway you to leave your chosen path. I am most impressed, my <PRO_LADYLORD>. */
    + ~Class(Player1, PALADIN)~ + @12386 /* It is my duty to fight evil in any form. As a paladin I can do no other. */ + PCHeritage.6.9
    + ~!Class(Player1, PALADIN)~ + @12387 /* Fighting Bhaal's evil taint is very taxing, but I have to do what is right. */ + PCHeritage.6.9
    ++ @12388 /* The dreams are tempting sometimes, but I know in my heart that I'll lose myself in the end if I listen to them. */ + PCHeritage.6.8
    ++ @12389 /* It might look easy from the outside, but every single moment I have to fight hard not to fall for the promises whispered in my dreams. */ + PCHeritage.6.8
    ++ @12390 /* Thank you, but I have no desire to talk about it. */ + PCHeritage.6.3
  END

  IF ~~ PCHeritage.6.3
    SAY @12279 /* As you wish. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 10)~ EXIT
  END

  IF ~~ PCHeritage.6.4
    SAY @12391 /* I am simply curious. As your travelling companion I have an interest in the path you are following. */
    IF ~~ + PCHeritage.6.6
  END

  IF ~~ PCHeritage.6.5
    SAY @12392 /* You are treading a dangerous path, my <PRO_LADYLORD>. Gods are not known to share their power, much less leave it in the care of others. */
    IF ~~ + PCHeritage.6.6
  END

  IF ~~ PCHeritage.6.6
    SAY @12393 /* My people do not care much for the affairs of the gods nowadays. In our distant past however we had to deal with them in one way or another. They do not take it lightly if anyone questions their authority or stands in their way. */
    ++ @12394 /* Even if I wanted to change my ways, it is too late now. I have walked my current path for too long already. */ + PCHeritage.6.7
    ++ @12395 /* Don't lecture me again. I've made my decision and you can't dissuade me from it. */ + PCHeritage.6.7
  END

  IF ~~ PCHeritage.6.7
    SAY @12396 /* All I am doing is giving you food for thought. It is ultimately your decision how to act on it. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 10)~ EXIT
  END

  IF ~~ PCHeritage.6.8
    SAY @12397 /* Fighting against a power you are unable to understand is always difficult. */
    IF ~~ + PCHeritage.6.10
  END

  IF ~~ PCHeritage.6.9
    SAY @12398 /* That is a laudable attitude.  */
    IF ~~ + PCHeritage.6.10
  END

  IF ~~ PCHeritage.6.10
    SAY @12399 /* You have prevailed against it even in the most difficult situations, when the whole world conspired against you and even fate did not favor your chosen path. I do not see the danger that you will lose to it anytime soon. */
    = @12400 /* Whether you are aware of it or not, I can already sense the duality of your soul losing its significance. Your own soul has become the dominant part of your being and Bhaal's taint is already struggling to survive. */
    ++ @12401 /* It doesn't really feel that way. It is still taunting me and playing with my self-doubts. */ + PCHeritage.6.12
    ++ @12402 /* That's a reassuring thought. I'm already tired fighting against it continuously. */ + PCHeritage.6.11
    ++ @12403 /* There is nothing I would rather hear. Finally I can ease my fight against the taint a bit. */ + PCHeritage.6.11
  END

  IF ~~ PCHeritage.6.11
    SAY @12404 /* This is a dangerous attitude. The balance of your two souls is not set in stone. It is an ever changing process and Bhaal's side will never cease its efforts to pull you into darkness. */
    ++ @12405 /* Thank you for your wise words. I will think about them in time. */ + PCHeritage.6.13
    ++ @12406 /* It is my decision in the end how I'm living my life. */ + PCHeritage.6.13
    ++ @12407 /* No offence, but I'd prefer to choose how to proceed on my own. */ + PCHeritage.6.13
  END

  IF ~~ PCHeritage.6.12
    SAY @12408 /* Yes, it is. And it will continue to do so until the very end. Realizing this will give you the necessary strength to continue your fight against Bhaal's taint, my <PRO_LADYLORD>. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 10)~ EXIT
  END

  IF ~~ PCHeritage.6.13
    SAY @12409 /* It is not my intention to tell you what to do, my <PRO_LADYLORD>. I am sharing my thoughts with you out of friendship. It is ultimately your decision how to act on it. */
    IF ~~ DO ~SetGlobal("BanterPCHeritage", "LOCALS", 10)~ EXIT
  END


  // Afaaq.TrueAge
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCTrueAge", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCTrueAge.1
    SAY @12410 /* I have witnessed great events unfolding before my eyes and taken part in battles that passed into legends countless ages ago, but I have yet to see a divine prophecy coming true. */
    ++ @12411 /* How old are you anyway? */ + PCTrueAge.1.2
    ++ @12412 /* That's nice to know, but I haven't the time to discuss it. */ + PCTrueAge.1.1
  END

  IF ~~ PCTrueAge.1.1
    SAY @12413 /* Even so I am honored to be on your side, my <PRO_LADYLORD>, while this event unfolds. */
    IF ~~ DO ~SetGlobal("BanterPCTrueAge", "LOCALS", 10)~ EXIT
  END

  IF ~~ PCTrueAge.1.2
    SAY @12414 /* Answering this question is more difficult than you can imagine. */
    = @12415 /* Time flows differently on the planes. The nature of the planes themselves influences our own perception of time and space. */
    = @12416 /* My own home, the Elemental Plane of Air, is ever chaotic, ever changing. But at the same time it does not age the same way as the prime material plane does. You can live there for ages without noticing the flow of time. */
    = @12417 /* I was already old when humans became sentient. I have seen the birth of gods and their demise and taken part in battles long before your world was given a name. */
    ++ @12418 /* Fascinating. Can you tell me more of that time? */ + PCTrueAge.1.4
    ++ @12419 /* You are surely exaggerating. No one can live forever. */ + PCTrueAge.1.3
    ++ @12420 /* I can't believe it. It boggles my mind just to think about you witnessing the birth of our world. */ + PCTrueAge.1.3
  END

  IF ~~ PCTrueAge.1.3
    SAY @12421 /* It is not so much beyond belief if you take into account that I am an immortal spirit born out of the chaotic elements of air. */
    = @12422 /* But even I have a beginning and an end. My current form will cease to exist eventually, only to be reborn again. */
    ++ @12423 /* So you really took part in events ages ago. Can you tell me stories of that time? */ + PCTrueAge.1.4
  END

  IF ~~ PCTrueAge.1.4
    SAY @12424 /* I can tell you a little. But I will not reveal too much, as some events should remain buried in the mist of time. */
    = @12425 /* My first visit to your world happened over nine millenia ago in the entourage of our great leader Calim. I may talk about it later in detail if we have the time and you are willing to listen. */
    = @12426 /* Before that time I served mostly as a soldier in the service of Caliph Hasib. Back then I was not the same djinni as you see before you now. I was fiercely loyal to my clan and would have given my life to defend it. */
    = @12427 /* Our tasks included the defence of our strongholds and small skirmishes against rivals and the occasional intruder. It was rather peaceful compared to the turmoils of ancient times. */
    ++ @12428 /* What turmoils are you talking about? */ + PCTrueAge.1.5
    ++ @12429 /* Can you tell me more of your time in the service of that caliph? */ + PCTrueAge.1.6
  END

  IF ~~ PCTrueAge.1.5
    SAY @12430 /* I was talking about the grand conflict between gods and primordials in ancient times. You may have heard about it as the Dawn War, but do not ask for details. This dark chapter of my life is better off to pass into oblivion forever. */
    = @12431 /* I can tell you more about my time in the service of Caliph Hasib instead. */
    ++ @12432 /* Yes, please do. */ + PCTrueAge.1.6
    ++ @12433 /* No, thanks. You've already told me more than I wanted to know. */ + PCTrueAge.1.8
  END

  IF ~~ PCTrueAge.1.6
    SAY @12434 /* My time at the court of Caliph Hasib is probably the most memorable chapter of my life. */
    = @12435 /* As I have already mentioned before, we were mainly busy defending our stronghold against rivals and the occasional intruder. But there were exceptions. */
    = @12436 /* At one time our scouts reported a mysterious change in the cloud formations of a certain region near our stronghold. Our unit had been chosen to investigate this matter more thoroughly. */
    = @12437 /* We carefully approached the target area. All we could make out was an oddly formed cloud formation before us. Just as we decided to take a closer look, we were ambushed by a cluster of air elementals and servants. */
    = @12438 /* We were unable to sense them before, as they were concealed by a magical curtain. They had already surrounded us and we had to act quickly. Our commander decided to wait and see what our opponents were up to. */
    = @12439 /* His risky decision turned out to be right. We were so distracted by the perceived danger that we did not notice the true scenery before us. The magical curtain concealed a majestic castle of magical beauty, built on a plateau of clouds and mist. */
    = @12440 /* The residents of that place turned out to be Cloud Giants. They knew all about us and had prepared the whole situation as some kind of test. Our decision to act calmly and wait for our opponents to make the first move told them much of our true intentions. They offered an alliance with our ruler. */
    = @12441 /* Caliph Hasib was impressed by their tactical abilities as well as of our judicous way to deal with the situation and rewarded us appropriately. */
    ++ @12442 /* What a wonderful tale. */ + PCTrueAge.1.7
    ++ @12443 /* Very long-winded, but interesting nonetheless. */ + PCTrueAge.1.7
  END

  IF ~~ PCTrueAge.1.7
    SAY @12444 /* Unfortunately, events such as this are only few and far between. More often than not encounters with foreigners end in violence and chaos, as I had to find out the hard way over and over. */
    IF ~~ DO ~SetGlobal("BanterPCTrueAge", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCTrueAge.1.8
    SAY @12445 /* It is your loss. But let us continue our journey. */
    IF ~~ DO ~SetGlobal("BanterPCTrueAge", "LOCALS", 2)~ EXIT
  END


  // Afaaq.Calim #1
  // TODO: Afaaq talks about the disembodiment of Calim and Memnon by the elves, his feelings about it and why he didn't hate the elves for it because they did what they did to protect their home...
  // IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCCalim", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCCalim.1
    // SAY ~You surely remember me telling you that I visited this plane for the first time in the entourage of our great leader Calim.~
    // ++ ~Yes, you have mentioned it briefly.~ + PCCalim.1.3
    // ++ ~Not really...~ + PCCalim.1.2
    // ++ ~Maybe, but I'm not interested in yet another story of your past.~ + PCCalim.1.1
  // END

  // IF ~~ PCCalim.1.1
    // SAY ~A pity. But I will not bother you further.~
    // IF ~~ DO ~SetGlobal("BanterPCCalim", "LOCALS", 2)~ EXIT
  // END

  // IF ~~ PCCalim.1.2
    // SAY ~It is not important anyway.~
    // IF ~~ + PCCalim.1.3
  // END

  // IF ~~ PCCalim.1.3
    // SAY ~~
  // END

  // IF ~~ PCCalim.1.X
    // SAY ~...~
    // IF ~~ DO ~SetGlobal("BanterPCCalim", "LOCALS", 2)~ EXIT
  // END


  // Afaaq.Calim #2
  // TODO: Afaaq talks about his personal crisis after that event, his restlessness and his search for an answer...
  // IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCCalim", "LOCALS", 3) Global("BanterActive", "LOCALS", 1)~ PCCalim.2
    // SAY ~Topic: Calim #2~
    // IF ~~ DO ~SetGlobal("BanterPCCalim", "LOCALS", 4)~ EXIT
  // END


  // Future plans
  IF ~InPartySlot(LastTalkedToBy, 0) Global("BanterPCPlans", "LOCALS", 1) Global("BanterActive", "LOCALS", 1)~ PCPlans.1
    SAY @12446 /* Your path draws to a close, my <PRO_LADYLORD>. */
    IF ~!Alignment(Player1, MASK_EVIL)~ + PCPlans.1.2
    IF ~Alignment(Player1, MASK_EVIL)~ + PCPlans.1.1
  END

  IF ~~ PCPlans.1.1
    SAY @12447 /* In the course of your journey you have gained incredible power, destroyed everyone in your path and embraced the taint of your father. Everything seems to unfold according to your wishes. */
    = @12448 /* You will probably have to make the hardest decision of your life sometime soon. Looking back to the beginnings of your journey, did you ever imagine that it would come to this? */
    ++ @12449 /* Questions such as these are never difficult to answer. I may not have known what I could become back in those days, but I always knew it would be grand. */ + PCPlans.1.5
    ++ @12450 /* Honestly, I didn't know what to expect. But in the course of my journey, when I gradually became aware of my true heritage, I knew what I had to do. */ + PCPlans.1.5
    ++ @12451 /* My life has mostly consisted of choices and consequences. This is just another choice and I will bear the consequences just as well. */ + PCPlans.1.4
    ++ @12452 /* I didn't imagine it in the least back then, and even today I'm not yet sure what to make of it. I'll decide when the time comes. */ + PCPlans.1.4
    ++ @12453 /* I don't want to answer that question just yet. What about you? What do you plan to do when our journey comes to an end? */ + PCPlans.1.7
    ++ @12454 /* Don't bother me again with useless questions, Afaaq. */ + PCPlans.1.3
  END

  IF ~~ PCPlans.1.2
    SAY @12455 /* In the course of your journey you have become stronger, more experienced and perhaps a bit wiser. You have dealt with your adversaries appropriately and fought against the dark taint of your father. */
    = @12456 /* You have an opportunity at hand that has only been shared by very few mortals in history. Looking back to the beginnings of your journey, did you ever imagine that it would come to this? */
    + ~Alignment(Player1, LAWFUL_GOOD)~ + @12457 /* I have followed my own path from the beginning and did not waver no matter how difficult the trials. Even if I didn't know about my fate back in those days, I always knew that I would follow the path of righteousness. */ + PCPlans.1.6
    + ~!Alignment(Player1, LAWFUL_GOOD) OR(2) Alignment(Player1, MASK_GOOD) ReputationGT(Player1, 17)~ + @12458 /* Honestly, I didn't know what to expect. But in the course of my journey, when I gradually became aware of my true heritage, I knew that I had to hold on to my own ideals. Otherwise I would have become Bhaal's puppet as Sarevok and all the others I had to fight. */ + PCPlans.1.6
    ++ @12459 /* I didn't know back then and even today I have trouble understanding it all. But I have lived every moment of my own life to the fullest and I will continue to do so until the very end. */ + PCPlans.1.4
    ++ @12451 /* My life has mostly consisted of choices and consequences. This is just another choice and I will bear the consequences just as well. */ + PCPlans.1.4
    ++ @12452 /* I didn't imagine it in the least back then, and even today I'm not yet sure what to make of it. I'll decide when the time comes. */ + PCPlans.1.4
    ++ @12453 /* I don't want to answer that question just yet. What about you? What do you plan to do when our journey comes to an end? */ + PCPlans.1.7
    ++ @12460 /* I don't want to talk about it, Afaaq. */ + PCPlans.1.3
  END

  IF ~~ PCPlans.1.3
    SAY @12461 /* I am aware that I am inquiring about a very sensitive matter, especially for someone who carries such a great burden. Be assured that I will honor your privacy in the future. */
    IF ~~ DO ~SetGlobal("BanterPCPlans", "LOCALS", 2)~ EXIT
  END

  IF ~~ PCPlans.1.4
    SAY @12462 /* Even if it was only for a short time, I have seen how you have followed the path you have taken. How you have dealt with obstacles put in your way and how you reacted to temptations offered from the outside and from within. */
    = @12463 /* You have never given in or ignored the truth of what you are and who you are. All in all I have seen very mortal qualities and you can be proud of them. */
    ++ @12464 /* And what about you? What do you plan to do when our journey comes to an end? */ + PCPlans.1.7
  END

  IF ~~ PCPlans.1.5
    SAY @12465 /* I have known you only for a short time, but from what I have seen you never had a choice what path to follow after giving in to Bhaal's taint. You have deceived yourself all the time even though you are nothing but a tool for higher powers. */
    = @12466 /* But on the other hand, mortals have never given in to the will of others for long. Someday you might have the power to free yourself from Bhaal's influence and forge your own future. */
    ++ @12464 /* And what about you? What do you plan to do when our journey comes to an end? */ + PCPlans.1.7
  END

  IF ~~ PCPlans.1.6
    SAY @12467 /* I have travelled with you only for a short time, but I am genuinely impressed with how you have managed to resist all the temptations, be it from the outside or from within, that attempted to pull you into darkness. */
    = @12468 /* You have stayed true to yourself all this time - even now, as the time prophesied by Alaundo draws near. All in all a very mortal quality, but at the same time as pure as of divine origin. You have made a lasting impression on me, even though I have seen much in my life already. */
    ++ @12464 /* And what about you? What do you plan to do when our journey comes to an end? */ + PCPlans.1.7
  END

  IF ~~ PCPlans.1.7
    SAY @12469 /* Me? I have not given much thought to this matter yet. After centuries forced to walk this plane I will surely return back home for some time. */
    = @12470 /* But to be honest, I am tired of this life. I already was long before I was abused by the rakshasa or captured by the drow. */
    ++ @12471 /* But why... */ + PCPlans.1.8
  END

  IF ~~ PCPlans.1.8
    SAY @12472 /* I have seen too much and suffered too much in ages past. If the time comes to bring this cycle of life to a close I will gladly accept my fate. */
    = @12473 /* But now is not the time for gloomy thoughts. You have an appointment with your own fate and I do not want to delay it needlessly. */
    IF ~~ DO ~SetGlobal("BanterPCPlans", "LOCALS", 2)~ EXIT
  END
END
