// Dialog of Tathas Melarn (Quest 3)
// Traified

BEGIN A7TATHAS

// *** Introduction talk to Tathas Melarn ***
IF ~StateCheck(Myself, STATE_CHARMED) AreaCheck("A77005")~ Tathas.Charmed
  SAY @3226 /* It is so good to see you, my friend. I feared that you might have been hurt by the less civilized inhabitants of the Underdark. */
  IF ~PartyHasItem("A7DJLMP") Detect("A7Afaaq")~ + Tathas.Charmed.1
  IF ~PartyHasItem("A7DJLMP") !Detect("A7Afaaq")~ + Tathas.Charmed.2
  IF ~!PartyHasItem("A7DJLMP")~ + Tathas.Charmed.3
END

CHAIN A7TATHAS Tathas.Charmed.1
  @3227 /* Especially since I caused your companion Afaaq so much trouble by robbing him of his powers and leaving him in that vulnerable state. */
  = @3228 /* I'd like to make amends for my imprudent actions in the past. */
  == A7AFAAQ @3229 /* Prove your intent and return my stolen powers. */
  == A7TATHAS @3230 /* Certainly, my friend. As chance would have it I still have the container with your sealed essence in my possession. Please take it back and restore yourself when you have the opportunity. */
  = @3231 /* To unseal... */
    DO ~CreateItem("A7MISC6", 0, 0, 0)
        GiveItem("A7MISC6", LastTalkedToBy)~
END A7Q3DHM Tathas.Charmed.4

APPEND A7TATHAS
  IF ~~ Tathas.Charmed.2
    SAY @3227 /* Especially since I caused your companion Afaaq so much trouble by robbing him of his powers and leaving him in that vulnerable state. */
    = @3232 /* As chance would have it I still have the container with Afaaq's essence in my possession. Please take it and restore your friend when you have the opportunity. */
    = @3231 /* To unseal... */
    IF ~~ DO ~CreateItem("A7MISC6", 0, 0, 0)
              GiveItem("A7MISC6", LastTalkedToBy)~ EXTERN A7Q3DHM Tathas.Charmed.4
  END

  IF ~~ Tathas.Charmed.3
    SAY @3233 /* As a token of our friendship I'd like to present you with a gift that will hopefully make some encounters less difficult. */
    IF ~~ DO ~CreateItem("A7RING02", 3, 0, 0)
              GiveItem("A7RING02", LastTalkedToBy)~ EXTERN A7Q3DHM Tathas.Charmed.4
  END
END

CHAIN A7Q3DHM Tathas.Charmed.4
  @3234 /* Come to your senses, commander! This <PRO_BOYGIRL> is a <PRO_RACE> in disguise, and not to be trusted. */
  == A7TATHAS @3235 /* I commend you that you managed to deceive me. But now face the consequences of your actions. */
    DO ~SetGlobal("A7Quest3", "GLOBAL", 10) 
        SetGlobal("A7TathasAttacked", "GLOBAL", 1)
        AddXP2DA("A7Q3MQ2")
        ApplySpellRES("A7DISPEL", Myself)
        DestroyItem("A7MISC5")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~
END A7TATHAS Tathas.Charmed.5

APPEND A7TATHAS
  IF ~~ Tathas.Charmed.5
    SAY @3236 /* Dispatch of them quickly! They are not allowed to reveal our presence. */
    IF ~PartyHasItem("A7DJLMP")~ DO ~Enemy()~ SOLVED_JOURNAL @3852 EXIT    // My attempt to charm Tathas Melarn was only partly successful...
    IF ~!PartyHasItem("A7DJLMP")~ DO ~Enemy()~ SOLVED_JOURNAL @3853 EXIT   // My attempt to charm Tathas Melarn was only partly successful...
  END


  IF ~NumTimesTalkedTo(0) Global("PlayerLooksLikeDrow", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 2)~ Tathas.Intro
    SAY @3100 /* What have we here? */
    = @3101 /* You come from the city of Ust Natha, no? */
    IF ~True()~ DO ~SetGlobal("TathasMet", "A77005", 1) SetGlobal("A7TalkAboutDrow", "GLOBAL", 2)~ + Tathas.Intro.1a
    IF ~InParty("Viconia") !StateCheck("Viconia", CD_STATE_NOTVALID) Gender(Player1, MALE)~ DO ~SetGlobal("TathasMet", "A77005", 1) SetGlobal("A7TalkAboutDrow", "GLOBAL", 2)~ + Tathas.Intro.1b
  END

  IF ~~ Tathas.Intro.1a
    SAY @3102 /* Identify yourself! */
    ++ @3103 /* My name is Veldrin. I hail from Ched Nasad and arrived in Ust Natha several days ago. */ + Tathas.Intro.2
    ++ @3104 /* My name is <GABBER> and I come from Adalon's lair. */ + Tathas.Intro.ToldTruth
    ++ @3105 /* I am your death if you don't let us go. */ + Tathas.Intro.Hostile
  END
END

CHAIN A7TATHAS Tathas.Intro.1b
  @3102 /* Identify yourself! */
  == VICONIJ @3106 /* (Let me take care of it, <CHARNAME>, I have seen his house insignia somewhere before.) */
  = @3107 /* We are agents of House Maerret from Ched Nasad, led by our commander Veldrin. You would be well advised not to dig deeper in this matter, Malla Qu'el'faeruk, even if you are an ally of our house. */
END A7TATHAS Tathas.Intro.6b

APPEND A7TATHAS
  IF ~~ Tathas.Intro.2
    SAY @3108 /* So, you come from Ched Nasad? I don't see your insignia, which house do you belong to? */
    + ~CheckStatLT(Player1, 13, INT)~ + @3109 /* I don't belong to any house. I'm a rogue drow. */ + Tathas.Intro.3
    + ~CheckStatGT(Player1, 8, INT) CheckStatLT(Player1, 16, INT)~ + @3110 /* I hail from House Do'Urden. */ + Tathas.Intro.4
    + ~CheckStatGT(Player1, 15, INT)~ + @3111 /* I am a member of House Maerret. */ + Tathas.Intro.5
    + ~CheckStatLT(Player1, 16, INT) CheckStatLT(Player1, 16, CHR)~ + @3112 /* I am not allowed to speak about it while I'm working for Ust Natha. */ + Tathas.Intro.6a
    + ~OR(2) CheckStatGT(Player1, 15, INT) CheckStatGT(Player1, 15, CHR)~ + @3113 /* I'm on a mission of secrecy and may not even tell a distinguished member of Sorcere about it. */ + Tathas.Intro.6b
    ++ @3114 /* I refuse to be interrogated by you or anyone else. */ + Tathas.Intro.Hostile
  END
END

CHAIN A7TATHAS Tathas.Intro.3
  @3115 /* You are a rogue drow? Don't tell me such a simplistic lie, wael. You wouldn't have left Ched Nasad alive without the support of a house. */
  = @3116 /* If you'd know anything about the life as a drow, you wouldn't have told me such nonsense. I guess you aren't even drow to begin with, or what do you say, noble Iraedril... */
  == A7Q3DHM @3117 /* You are perceptive as always. My divinations reveal, this creature is a surface <PRO_RACE>. */
END A7TATHAS Tathas.Intro.7

CHAIN A7TATHAS Tathas.Intro.4
  @3118 /* So, you are a Nasadran of House Do'Urden. I bet next time you tell me your real name is Drizzt? */
  = @3119 /* There is no House Do'Urden in Ched Nasad. You are either exeptionally dimwitted or not even a drow to begin with. What do you say, noble Iraedril... */
  == A7Q3DHM @3117 /* You are perceptive as always. My divinations reveal, this creature is a surface <PRO_RACE>. */
END A7TATHAS Tathas.Intro.7

CHAIN A7TATHAS Tathas.Intro.5
  @3120 /* A member of House Maerret then. I greet you, Veldrin Maerret. My name is Tathas Melarn of House Melarn, and a high-standing member of Sorcere... */
  == A7Q3DHM @3121 /* If I may interrupt you. My divinations have revealed <PRO_HISHER> true identity. */
  = @3122 /* The creature before you is a surface <PRO_RACE>. */
END A7TATHAS Tathas.Intro.8b

CHAIN A7TATHAS Tathas.Intro.6a
  @3123 /* I commend your for your obedience to your house. */
  = @3124 /* Your lack of persuasiveness, however, suggests that you may be too inexperienced for your duties. */
  == A7Q3DHM @3121 /* If I may interrupt you. My divinations have revealed <PRO_HISHER> true identity. */
  = @3122 /* The creature before you is a surface <PRO_RACE>. */
END A7TATHAS Tathas.Intro.8a

CHAIN A7TATHAS Tathas.Intro.6b
  @3125 /* Then I will respect your decision for now. My name is Tathas Melarn of House Melarn, a high-standing member of Sorcere... */
  == A7Q3DHM @3121 /* If I may interrupt you. My divinations have revealed <PRO_HISHER> true identity. */
  = @3122 /* The creature before you is a surface <PRO_RACE>. */
END A7TATHAS Tathas.Intro.8b

APPEND A7TATHAS
  IF ~~ Tathas.Intro.7
    SAY @3126 /* It is as I thought. Only a surface creature shows such a moronic behavior. */
    = @3127 /* But you are cleverly disguised as a drow, which means a powerful mind guides your actions. You may be useful to me after all. */
    IF ~~ + Tathas.Intro.9
  END

  IF ~~ Tathas.Intro.8a
    SAY @3128 /* You are a <PRO_RACE>? That explains your unrefined manners. */
    = @3129 /* But your true identity hasn't been discovered yet, which is promising. You may be useful to me after all. */
    IF ~~ + Tathas.Intro.9
  END

  IF ~~ Tathas.Intro.8b
    SAY @3130 /* Is that so? This is unexpected. You have deceived me cleverly, which speaks well of you. */
    = @3131 /* If you continue to play your part so well, you may have some use for me. */
    IF ~~ + Tathas.Intro.9
  END

  IF ~~ Tathas.Intro.9
    SAY @3132 /* Me and my entourage have arrived from Ched Nasad not long ago. */
    = @3133 /* We have learned that Ust Natha is preparing for war with the surface elves. A war of this scale has not happened for a long time in this region of the Underdark, so we will take advantage of this opportunity and expand our influence a little bit. */
    = @3134 /* Our house had ties with House Arabani a long time ago, before Ched Nasad even had been founded. I want to... revive those ties and you may help me realizing it. */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1) Detect("A7Afaaq")~ DO ~EraseJournalEntry(@3802) SetGlobal("TathasDjinni", "LOCALS", 1)~ + Tathas.Intro.10
    IF ~!Detect("A7Afaaq") PartyHasItem("A7DJLMP")~ DO ~EraseJournalEntry(@3802) SetGlobal("TathasDjinni", "LOCALS", 1)~ + Tathas.Intro.11
    IF ~!Detect("A7Afaaq") !PartyHasItem("A7DJLMP")~ DO ~EraseJournalEntry(@3802)~ + Tathas.Intro.12
  END
END

CHAIN A7TATHAS Tathas.Intro.10
  @3135 /* It will be profitable for you as well. I sensed a familiar presence when you entered and the djinni standing before me proved it. */
  = @3136 /* How are you doing, Afaaq? Do you enjoy your stay on the prime material plane so far? */
  == A7AFAAQ @3137 /* You should know that better than anyone else. My life since has been a never-ending nightmare of loss and torment, and I owe it all to you. */
  = @3138 /* But I am not surprised to see you again. You were always driven by your desire for power and influence, and a situation like this is a tempting opportunity for the likes of you. */
  == A7TATHAS @3139 /* You are still as boring as you were ages ago. That's why I didn't bother to track you down. */
  = @3140 /* You sense it, don't you? Your essence is still part of my collection. */
END A7TATHAS Tathas.Intro.15

APPEND A7TATHAS
  IF ~~ Tathas.Intro.11
    SAY @3141 /* It will be profitable for you as well. I can sense a familiar presence in your possession which I haven't felt in ages. */
    = @3142 /* You have an old "acquaintance" of mine with you, haven't you? Yes, I sense the djinni Afaaq somewhere around. */
    ++ @3143 /* Yes, he is bound to a magical lamp which I have in my possession. */ + Tathas.Intro.13
    ++ @3144 /* That doesn't concern you, Tathas. */ + Tathas.Intro.14
  END

  IF ~~ Tathas.Intro.12
    SAY @3145 /* You will profit from it too. As a member of Sorcere I have access to powerful and unique magic spells. I may share a copy or two with you. */
    IF ~~ + Tathas.Intro.16
  END

  IF ~~ Tathas.Intro.13
    SAY @3146 /* That is... unique. Whether you believe me or not, but he was in my company ages ago, before I lost sight of him. */
    = @3147 /* Most of his powers are in my possession still, which I've made use of once in a while. */
    IF ~~ + Tathas.Intro.15
  END

  IF ~~ Tathas.Intro.14
    SAY @3148 /* You don't need to tell me anything, but my senses have never led me wrong. */
    = @3149 /* He was in my company ages ago, before I lost sight of him. The greater part of his power is still in my possession, which I've made use of once in a while. */
    IF ~~ + Tathas.Intro.15
  END

  IF ~~ Tathas.Intro.15
    SAY @3150 /* I will reward you with Afaaq's soulcage if you agree to do some work for me, Veldrin. Have I piqued your interested? */
    ++ @3151 /* I'd like to know what is required of me, first. */ + Tathas.Intro.17
    ++ @3152 /* Yes, I'll work for you. */ + Tathas.AgreeOffer
    ++ @3153 /* You have enslaved Afaaq for ages! I'll never work for you. */ + Tathas.RefuseOffer
    ++  @3154 /* Please give me a while to think about it. */ + Tathas.UndecidedOffer
  END

  IF ~~ Tathas.Intro.16
    SAY @3155 /* Have I piqued your interest? */
    ++ @3151 /* I'd like to know what is required of me, first. */ + Tathas.Intro.17
    ++ @3156 /* Yes, I agree to your offer. */ + Tathas.AgreeOffer
    ++ @3157 /* No, I'm not interested to play a part in your schemes. */ + Tathas.RefuseOffer
    ++ @3158 /* I need some time to think it over. */ + Tathas.UndecidedOffer
  END

  IF ~~ Tathas.Intro.17
    SAY @3159 /* That I cannot do before you pledge yourself to us. I have told you enough of my plans already. Are you interested? */
    ++ @3152 /* Yes, I'll work for you. */ + Tathas.AgreeOffer
    ++ @3160 /* No, I'm not interested to work for you. */ + Tathas.RefuseOffer
    ++ @3158 /* I need some time to think it over. */ + Tathas.UndecidedOffer
  END

  IF ~~ Tathas.Intro.Hostile
    SAY @3161 /* What a disappointment you turn out to be. Let's dispose of you quickly, I have more important things to do. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10) 
        SetGlobal("A7TathasAttacked", "GLOBAL", 1) 
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)
        Enemy()~ SOLVED_JOURNAL @3820 EXIT    // Tathas Melarn and his drow retinue turned hostile and attacked me...
  END


  // *** Subsequent talks to Tathas Melarn before deciding on his mission ***
  IF ~NumTimesTalkedToGT(0) GlobalLT("A7Quest3", "GLOBAL", 2)~ Tathas.1
    SAY @3162 /* Greeting Veldrin, we meet again. Seeing you still alive, have you come to a decision yet? */
    ++ @3152 /* Yes, I'll work for you. */ + Tathas.AgreeOffer
    ++ @3160 /* No, I'm not interested to work for you. */ + Tathas.RefuseOffer
    ++ @3163 /* I still need time to think it over. */ + Tathas.UndecidedOffer
  END

  IF ~~ Tathas.UndecidedOffer
    SAY @3164 /* I'll still be here for a short while, but don't take too long to decide. */
    IF ~Global("TathasDjinni", "LOCALS", 0)~ DO ~EraseJournalEntry(@3804)~ UNSOLVED_JOURNAL @3803 EXIT
    IF ~Global("TathasDjinni", "LOCALS", 1)~ DO ~EraseJournalEntry(@3803)~ UNSOLVED_JOURNAL @3804 EXIT
  END

  IF ~~ Tathas.RefuseOffer
    SAY @3165 /* That is unfortunate. It also means that you've become an obstacle to my plans. Don't worry, this will be short and painful. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10) 
        SetGlobal("A7TathasAttacked", "GLOBAL", 1) 
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)
        Enemy()~ SOLVED_JOURNAL @3821 EXIT
  END

  IF ~~ Tathas.Intro.ToldTruth
    SAY @3166 /* You are undoubtedly a dimwitted moron, telling me of your true background while disguised as one of us. */
    = @3167 /* I'll do you a favor and release you from your pathetic life. Believe me, this is for the best of us all. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10) 
        SetGlobal("A7TathasAttacked", "GLOBAL", 1) 
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)
        Enemy()~ SOLVED_JOURNAL @3822 EXIT
  END

  IF ~~ Tathas.AgreeOffer
    SAY @3168 /* You have made a wise decision. This is my plan, so listen closely. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 2)~ UNSOLVED_JOURNAL @3805 + Tathas.AgreeOffer.2
  END

  IF ~~ Tathas.AgreeOffer.2
    SAY @3169 /* Being disguised as one of us for such a short time, you likely don't have close ties to the great houses of Ust Natha yet. */
    = @3170 /* Find a way to pass the protective wards of the Arabani House. It will likely be guarded, but you look strong enough to deal with them. */
    = @3171 /* Once you have passed the wards, find the residing Matron Mother Xunvrae d'Arabani and kill her. Return with her House Insignia and receive your reward. */
    + ~PartyHasItem("A7MISC4")~ + ~Actually, I have her House Insignia already in my possession.~ + Tathas.3.4.1
    + ~!PartyHasItem("A7MISC4")~ + @3172 /* Do you know where I might find her House Insignia? */ + Tathas.AgreeOffer.3
    + ~!PartyHasItem("A7MISC4")~ + @3173 /* I will do it at once. */ + Tathas.AgreeOffer.4
    ++ @3174 /* On second thought, I have decided to refuse your offer. */ + Tathas.RefuseOffer
  END

  IF ~~ Tathas.AgreeOffer.3
    SAY @3175 /* If I knew where it is, I wouldn't ask you to retrieve the item. It is likely somewhere in her immediate vicinity, or secured in her private chambers. */
    ++ @3173 /* I will do it at once. */ + Tathas.AgreeOffer.4
    ++ @3174 /* On second thought, I have decided to refuse your offer. */ + Tathas.RefuseOffer
  END

  IF ~~ Tathas.AgreeOffer.4
    SAY @3176 /* Very good. Don't fail me, Veldrin, or no power of any house will protect you from the the wrath of House Melarn. */
    = @3177 /* The sooner you are back, the sooner you will have your reward. */
    IF ~~ EXIT
  END


  // *** Subsequent talks to Tathas Melarn after agreeing to his mission ***
  IF ~GlobalGT("A7Quest3", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 4) !PartyHasItem("A7MISC4") !PartyHasItem("A7MISC7")~ Tathas.2
    SAY @3178 /* Do you still have questions about your task? */
    ++ @3179 /* Could you please repeat your task for me again? */ + Tathas.2.1
    ++ @3172 /* Do you know where I might find her House Insignia? */ + Tathas.2.3
    ++ @3180 /* No, I will carry it out immediately. */ + Tathas.2.2
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END

  IF ~~ Tathas.2.1
    SAY @3182 /* You should really take note when I tell you something as important as this. */
    = @3170 /* Find a way to pass the protective wards of the Arabani House. It will likely be guarded, but you look strong enough to deal with them. */
    = @3171 /* Once you have passed the wards, find the residing Matron Mother Xunvrae d'Arabani and kill her. Return with her House Insignia and receive your reward. */
    ++ @3173 /* I will do it at once. */ + Tathas.2.2
    ++ @3172 /* Do you know where I might find her House Insignia? */ + Tathas.2.3
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END

  IF ~~ Tathas.2.2
    SAY @3183 /* Yes, do that and I will be pleased. */
    IF ~~ EXIT
  END

  IF ~~ Tathas.2.3
    SAY @3184 /* It is likely somewhere in her immediate vicinity, or secured in her private chambers. */
    ++ @3173 /* I will do it at once. */ + Tathas.2.2
    ++ @3179 /* Could you please repeat your task for me again? */ + Tathas.2.1
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END


  // *** Party has returned with Arabani Insignia ***
  IF ~GlobalGT("A7Quest3", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 4) PartyHasItem("A7MISC4") InPartySlot(LastTalkedToBy, 0)~ Tathas.3
    SAY @3185 /* Welcome back, Veldrin. Do you have good news to report? */
    ++ @3186 /* Yes, I have brought you the Insignia of House Arabani. */ + Tathas.3.4
    ++ @3187 /* I still need some time to acquire the insignia. */ + Tathas.3.3
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END

  IF ~GlobalGT("A7Quest3", "GLOBAL", 1) GlobalLT("A7Quest3", "GLOBAL", 4) PartyHasItem("A7MISC4") !InPartySlot(LastTalkedToBy, 0)~ Tathas.3.1
    SAY @3188 /* Welcome back, <GABBER>. Do you have good news to report? */
    ++ @3189 /* Yes, I have brought back the Insignia of House Arabani. */ + Tathas.3.4
    ++ @3187 /* I still need some time to acquire the insignia. */ + Tathas.3.3
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END

  IF ~~ Tathas.3.3
    SAY @3190 /* Make haste! We cannot afford to stay in this place for too long or we will be discovered sooner or later. */
    IF ~~ EXIT
  END

  IF ~~ Tathas.3.4
    SAY @3191 /* This is very good news indeed. May I have it? */
    IF ~HasItem("A7MISC4", Player1)~ DO ~ActionOverride(Player1, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player2)~ DO ~ActionOverride(Player2, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player3)~ DO ~ActionOverride(Player3, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player4)~ DO ~ActionOverride(Player4, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player5)~ DO ~ActionOverride(Player5, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player6)~ DO ~ActionOverride(Player6, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
  END

  IF ~~ Tathas.3.4.1
    SAY @3224   /* This is unexpected, Veldrin. You are more resourceful than even I imagined. */
    = @3225   /* May I have it? */
    IF ~HasItem("A7MISC4", Player1)~ DO ~ActionOverride(Player1, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player2)~ DO ~ActionOverride(Player2, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player3)~ DO ~ActionOverride(Player3, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player4)~ DO ~ActionOverride(Player4, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player5)~ DO ~ActionOverride(Player5, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
    IF ~HasItem("A7MISC4", Player6)~ DO ~ActionOverride(Player6, GiveItem("A7MISC4", "A7Tathas"))~ + Tathas.3.5
  END

  IF ~~ Tathas.3.5
    SAY @3192 /* You have been very useful to me, but I regret that my hospitality comes to an end now. */
    = @3193 /* I cannot allow you to walk free and talk to everyone about our business. Don't worry, this will be short and painful. */
    IF ~~ DO ~DestroyItem("A7MISC4")
        SetGlobal("A7TathasAttacked", "GLOBAL", 1)
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)
        Enemy()~ SOLVED_JOURNAL @3823 EXIT
  END


  // *** Party returns with Anchor Stone of Xunvrae d'Arabani ***
  IF ~Global("A7Quest3", "GLOBAL", 3) !Dead("A7ARAB01") PartyHasItem("A7MISC7") InPartySlot(LastTalkedToBy, 0)~ Tathas.4.1
    SAY @3185 /* Welcome back, Veldrin. Do you have good news to report? */
    ++ @3194 /* I think so. I was able to convince Xunvrae d'Arabani to give me an anchor stone of her house which I was ordered to use on you. It is yours to do as you please. */ + Tathas.4.3
    ++ @3187 /* I still need some time to acquire the insignia. */ + Tathas.3.3
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END

  IF ~Global("A7Quest3", "GLOBAL", 3) !Dead("A7ARAB01") PartyHasItem("A7MISC7") !InPartySlot(LastTalkedToBy, 0)~ Tathas.4.2
    SAY @3188 /* Welcome back, <GABBER>. Do you have good news to report? */
    ++ @3194 /* I think so. I was able to convince Xunvrae d'Arabani to give me an anchor stone of her house which I was ordered to use on you. It is yours to do as you please. */ + Tathas.4.3
    ++ @3187 /* I still need some time to acquire the insignia. */ + Tathas.3.3
    ++ @3181 /* On second thought, I've decided to break up our cooperation. */ + Tathas.RefuseOffer
  END

  IF ~~ Tathas.4.3
    SAY @3195 /* You have done well. With it I will advance even faster than I have anticipated. Give it to me. */
    IF ~HasItem("A7MISC7", Player1)~ DO ~ActionOverride(Player1, GiveItem("A7MISC7", "A7Tathas"))~ + Tathas.4.4
    IF ~HasItem("A7MISC7", Player2)~ DO ~ActionOverride(Player2, GiveItem("A7MISC7", "A7Tathas"))~ + Tathas.4.4
    IF ~HasItem("A7MISC7", Player3)~ DO ~ActionOverride(Player3, GiveItem("A7MISC7", "A7Tathas"))~ + Tathas.4.4
    IF ~HasItem("A7MISC7", Player4)~ DO ~ActionOverride(Player4, GiveItem("A7MISC7", "A7Tathas"))~ + Tathas.4.4
    IF ~HasItem("A7MISC7", Player5)~ DO ~ActionOverride(Player5, GiveItem("A7MISC7", "A7Tathas"))~ + Tathas.4.4
    IF ~HasItem("A7MISC7", Player6)~ DO ~ActionOverride(Player6, GiveItem("A7MISC7", "A7Tathas"))~ + Tathas.4.4
  END

  IF ~~ Tathas.4.4
    SAY @3196 /* Yes, I feel its enchantments... */
    = @3197 /* I think I can use it to my advantage. The venerable matron mother of House Arabani will receive her prize, but it will be to my terms. Hahaha. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 5) 
        DestroyItem("A7MISC7") 
        StartCutSceneMode() 
        StartCutScene("A7Q3ct5")~ EXIT
  END
END

// *** Tathas speaks with Xunvrae d'Arabani ***
// IF ~Global("A7Quest3", "GLOBAL", 5) Name(#56926, LastTalkedToBy)~
CHAIN IF ~Global("A7Quest3", "GLOBAL", 5) IsGabber("A7ARAB01")~ THEN A7TATHAS Tathas.Xunvrae.1
  @3198 /* I greet you, Matron Mother Xunvrae d'Arabani. I am Tathas Melarn of House Melarn. */
  == A7ARAB01 @3199 /* WHAT? How did you get past my wards? */
  = @3200 /* Ah, I see. You have warped my enchantments on the anchor stone. But you will not succeed. */
  == A7TATHAS @3201 /* We shall see. */ DO ~SetGlobal("A7Quest3", "GLOBAL", 6) AddJournalEntry(@3806, QUEST)~
EXIT

APPEND A7TATHAS
  // *** Talk to Tathas after teleporting into House Arabani ***
  IF ~Global("A7Quest3", "GLOBAL", 6) ActuallyInCombat() RandomNum(2, 1)~ Tathas.5.1
    SAY @3202 /* I'm a little busy right now. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END

  IF ~Global("A7Quest3", "GLOBAL", 6) ActuallyInCombat() RandomNum(2, 2)~ Tathas.5.2
    SAY @3203 /* Please, don't interrupt my concentration. */
    IF ~~ DO ~ClearActions(Myself)~ EXIT
  END


  // *** Talk to Tathas after defeating House Arabani (when I didn't help defeat Arabani) ***
  IF ~GlobalGT("A7Quest3", "GLOBAL", 6) GlobalLT("A7Quest3", "GLOBAL", 10) Global("A7ArabaniAttacked", "GLOBAL", 0) !InPartySlot(LastTalkedToBy, 0) !ActuallyInCombat()~ Tathas.6.0
    SAY @3204 /* I would like to speak to Veldrin. */
    IF ~~ EXIT
  END

  IF ~GlobalGT("A7Quest3", "GLOBAL", 6) GlobalLT("A7Quest3", "GLOBAL", 10) Global("A7ArabaniAttacked", "GLOBAL", 0) InPartySlot(LastTalkedToBy, 0) !ActuallyInCombat()~ Tathas.6.1
    SAY @3205 /* It is done, Veldrin. */
    = @3206 /* Without your help, it would have taken much more time and resources to overthrow House Arabani. */
    = @3207 /* Therefore you may have the first spoils of my little operation. */
    IF ~Global("TathasDjinni", "LOCALS", 0) !See("A7Afaaq") !Class(Player1, MAGE_ALL)~ + Tathas.6.2
    IF ~Global("TathasDjinni", "LOCALS", 0) !See("A7Afaaq") Class(Player1, MAGE_ALL)~ + Tathas.6.3
    IF ~Global("TathasDjinni", "LOCALS", 0) See("A7Afaaq")~ + Tathas.6.4
    IF ~Global("TathasDjinni", "LOCALS", 1)~ + Tathas.6.5
  END

  // Receive a magical ring
  IF ~~ Tathas.6.2
    SAY @3208 /* This is a ring which I have used regularly in the past. It will temporarily bring any creature of elemental origin under your control. It is yours now. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        CreateItem("A7RING02", 3, 0, 0)
        GiveItem("A7RING02", LastTalkedToBy)
        AddXP2DA("A7Q3MQ1")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3824 EXIT
  END

  // Receive a high-level mage scroll
  IF ~~ Tathas.6.3
    SAY @3210 /* This is a powerful scroll which only respected members of Sorcere have access to. It is yours now. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        GiveItem("SCRL9R", LastTalkedToBy)
        AddXP2DA("A7Q3MQ1")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3824 EXIT
  END
END

// Receive Afaaq's soulcage
CHAIN A7TATHAS Tathas.6.4
  @3211 /* I sensed it already during our last battle. You have an old... acquaintance of mine with you. */
  = @3212 /* How are you doing, Afaaq? */
  == A7AFAAQ @3213 /* You should know that better than anyone else. My life has been a never-ending nightmare of loss and torment, and I owe it all to you. */
  == A7TATHAS @3214 /* Yes, I haven't forgotten. And you have felt it already, haven't you? */
END A7TATHAS Tathas.6.4.1

APPEND A7TATHAS
  IF ~~ Tathas.6.4.1
    SAY @3215 /* I still have your soulcage in my possession. It is yours now. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        CreateItem("A7MISC6", 0, 0, 0)
        GiveItem("A7MISC6", LastTalkedToBy)
        AddXP2DA("A7Q3MQ2")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3825 EXIT
  END

  // Receive Afaaq's soulcage
  IF ~~ Tathas.6.5
    SAY @3216 /* I will give you Afaaq's soulcage as a reward. It's a powerful item, and it is up to you how to use it. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        CreateItem("A7MISC6", 0, 0, 0)
        GiveItem("A7MISC6", LastTalkedToBy)
        AddXP2DA("A7Q3MQ2")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3825 EXIT
  END


  // *** Talk to Tathas after defeating House Arabani (when I helped defeat Arabani) ***
  IF ~GlobalGT("A7Quest3", "GLOBAL", 6) GlobalLT("A7Quest3", "GLOBAL", 10) Global("A7ArabaniAttacked", "GLOBAL", 1) !InPartySlot(LastTalkedToBy, 0) !ActuallyInCombat()~ Tathas.7.0
    SAY @3204 /* I would like to speak to Veldrin. */
    IF ~~ EXIT
  END

  IF ~GlobalGT("A7Quest3", "GLOBAL", 6) GlobalLT("A7Quest3", "GLOBAL", 10) Global("A7ArabaniAttacked", "GLOBAL", 1) InPartySlot(LastTalkedToBy, 0) !ActuallyInCombat()~ Tathas.7.1
    SAY @3205 /* It is done, Veldrin. */
    = @3206 /* Without your help, it would have taken much more time and resources to overthrow House Arabani. */
    = @3207 /* Therefore you may have the first spoils of my little operation. */
    IF ~Global("TathasDjinni", "LOCALS", 0) !See("A7Afaaq") !Class(Player1, MAGE_ALL)~ + Tathas.7.2
    IF ~Global("TathasDjinni", "LOCALS", 0) !See("A7Afaaq") Class(Player1, MAGE_ALL)~ + Tathas.7.3
    IF ~Global("TathasDjinni", "LOCALS", 0) See("A7Afaaq")~ + Tathas.7.4
    IF ~Global("TathasDjinni", "LOCALS", 1)~ + Tathas.7.5
  END

  // Receive a magical ring and some money
  IF ~~ Tathas.7.2
    SAY @3217 /* This is a ring which I have used regularly in the past. It will temporarily bring any creature of elemental origin under your control. Here is also a little money for your help in the last battle. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        CreateItem("A7RING02", 3, 0, 0)
        GiveItem("A7RING02", LastTalkedToBy) 
        GiveGoldForce(2000)
        AddXP2DA("A7Q3MQ1")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3824 EXIT
  END

  // Receive two high-level mage scrolls
  IF ~~ Tathas.7.3
    SAY @3218 /* These are powerful scrolls which only respected members of Sorcere have access to. They are yours now. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        GiveItem("SCRLB4", LastTalkedToBy)
        GiveItem("SCRL9R", LastTalkedToBy)
        AddXP2DA("A7Q3MQ1")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3824 EXIT
  END
END

// Receive Afaaq's soulcage
CHAIN A7TATHAS Tathas.7.4
  @3211 /* I sensed it already during our last battle. You have an old... acquaintance of mine with you. */
  = @3212 /* How are you doing, Afaaq? */
  == A7AFAAQ @3213 /* You should know that better than anyone else. My life has been a never-ending nightmare of loss and torment, and I owe it all to you. */
  == A7TATHAS @3214 /* Yes, I haven't forgotten. And you have felt it already, haven't you? */
END A7TATHAS Tathas.7.4.1

APPEND A7TATHAS
  // Receive Afaaq's soulcage and a high-level mage scroll
  IF ~~ Tathas.7.4.1
    SAY @3219 /* I still have your soulcage in my possession. It is yours now. And for your aid in the last battle I will add a little bonus to it. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        CreateItem("A7MISC6", 0, 0, 0)
        GiveItem("A7MISC6", LastTalkedToBy)
        GiveItem("SCRL9R", LastTalkedToBy)
        AddXP2DA("A7Q3MQ2")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3825 EXIT
  END

  // Receive Afaaq's soulcage and a high-level mage scroll
  IF ~~ Tathas.7.5
    SAY @3220 /* I will give you Afaaq's soulcage as a reward. It's a powerful item, and it is up to you how to use it. And for your aid in the last battle I will also add a little bonus to it. */
    = @3209 /* You may continue your business in this city, I care not. As long as you do not breathe a word about this incident. */
    IF ~~ DO ~SetGlobal("A7Quest3", "GLOBAL", 10)
        DestroyItem("A7MISC5")
        CreateItem("A7MISC6", 0, 0, 0)
        GiveItem("A7MISC6", LastTalkedToBy)
        GiveItem("SCRL9R", LastTalkedToBy)
        AddXP2DA("A7Q3MQ2")
        EraseJournalEntry(@3800)
        EraseJournalEntry(@3803)
        EraseJournalEntry(@3804)
        EraseJournalEntry(@3805)
        EraseJournalEntry(@3806)
        EraseJournalEntry(@3807)
        EraseJournalEntry(@3808)~ SOLVED_JOURNAL @3825 EXIT
  END

  // *** Talk to Tathas after quest is over ***
  IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(3, 1)~ Tathas.8.1
    SAY @3221 /* I am busy right now. Please talk to me later. */
    IF ~~ EXIT
  END

  IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(3, 2)~ Tathas.8.2
    SAY @3222 /* Good day to you. How are you doing? */
    IF ~~ EXIT
  END

  IF ~Global("A7Quest3", "GLOBAL", 10) RandomNum(3, 3)~ Tathas.8.3
    SAY @3223 /* We are still busy removing all traces of the Arabani family. */
    IF ~~ EXIT
  END
END
