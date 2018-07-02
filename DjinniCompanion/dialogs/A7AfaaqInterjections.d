// *** Afaaq's interjections ***
// Traified

// SoA: Celvan rhymes
CHAIN IF WEIGHT #-1 ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) RandomNumLT(66, 33) Global("A7CelvanAfaaq", "AR0300", 0)~ THEN CELVAN AfaaqCelvan
@11003 /* "There once was a djinni torn asunder,
his soul kept tight deep under
by the foes underground
he'd been chained and bound
even though he fought back like a crack of thunder." */
    DO ~SetGlobal("A7CelvanAfaaq", "AR0300", 1)~
  == A7AFAAQ @11004 /* How do you know about me? */
EXTERN CELVAN 1


// SoA: The genie in the Circus Tent
EXTEND_BOTTOM KGENIE1 3 #1
  + ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    + @11005 /* Could you help me out, Afaaq? */ EXTERN A7AFAAQ AskRiddleHelp1
END

EXTEND_BOTTOM KGENIE1 9 #1
  + ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    + @11005 /* Could you help me out, Afaaq? */ EXTERN A7AFAAQ AskRiddleHelp2
END

APPEND A7AFAAQ
  IF ~~ AskRiddleHelp1
    SAY @11006 /* Sure, why not. */
    = #15492  // The prince is 30 and the princess is 40.
    IF ~~ EXTERN KGENIE1 7
  END

  IF ~~ AskRiddleHelp2
    SAY @11006 /* Sure, why not. */
    = @11007 /* It is 'nothing', of course. */
    IF ~~ EXTERN KGENIE1 7
  END
END


// SoA: Trademeet fortuneteller
EXTEND_BOTTOM TRGYP02 2
  IF ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) GlobalLT("Chapter", "GLOBAL", %bg2_chapter_6%)~ + Gypsy.Fortune.1
END

CHAIN TRGYP02 Gypsy.Fortune.1
  @11008 /* Darkness took a vital part of you. Confront it again for your salvation, or be prepared to pay a high price instead. */
  == A7AFAAQ @11009 /* Your revelations are vague, as they should be. I will follow my chosen path nevertheless. */
EXIT


// SoA: Confrontation with Firkraag
I_C_T2 FIRKRA02 25 A7I_FirkraagChallenged    // CHARNAME challenges Firkraag to a duel
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11010 /* I admire your courage, my <PRO_LADYLORD>, and I will help you defeat the beast with all my might. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END

I_C_T FIRKRA02 32 A7I_FirkraagDeal    // CHARNAME accepts to work for Firkraag
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11011 /* You are indeed a despicable character, <CHARNAME>, sinking so low to become a tool for that evil beast. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", -2) DisplayStringNoName(Player1, @60031)~
END


// SoA: Planar Sphere Quest
I_C_T2 VALYGAR 28 A7I_PlanarSphereEvil    // CHARNAME betrays Valygar
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11012 /* You have made a poor choice today, my <PRO_LADYLORD>. Blindly following the orders of the wizards will neither gain you wealth nor influence. */
END

I_C_T2 VALYGAR 44 A7I_PlanarSphereGood    // CHARNAME works together with Valygar
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11013 /* You have made the right decision, my <PRO_LADYLORD>. I am sensing no falsehood in his explanations. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END


// SoA: Skinner Murder Case
I_C_T2 TRSKIN01 19 A7I_SkinnerRestored    // CHARNAME restores Raissa back to normal
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7WishRestoreRaissa", "GLOBAL", 0)~
    THEN @11014 /* You have done a great deed today, my <PRO_LADYLORD>. A lesser <PRO_MANWOMAN> would have abandoned her to her fate, as the spell is both expensive and very taxing on the caster. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END


// SoA: Mekrath's prize
I_C_T HAERDA 109 A7I_HaerDalisZombi    // Haer'Dalis is in a state of mindlessness
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11015 /* That man's mind is completely under control of another's. The creature who is responsible for it must be powerful indeed. */
END

I_C_T MEKRAT 25 A7I_MekrathReward    // CHARNAME frees Haer'Dalis in a non-violent manner
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11016 /* You have made a wise decision to let reason guide your actions, my <PRO_LADYLORD>. You were an intruder to Mekrath's domain after all. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END

I_C_T MEKRAT 26 A7I_MekrathReward    // CHARNAME frees Haer'Dalis in a non-violent manner
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11016 /* You have made a wise decision to let reason guide your actions, my <PRO_LADYLORD>. You were an intruder to Mekrath's domain after all. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END


// SoA: Brynnlaw - The Cowled Wizard Perth the Adept
I_C_T PPCOWLED 1 A7I_BrynnlawCowled
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11017 /* This human is not in control of himself. A stronger mind leads his actions. */
END


// SoA: The Assylum Tour
I_C_T PPDILI 6 A7I_SpellholdDili
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11018 /* A wonderous ability such as this needs sympathy and guidance. Here she will receive neither. */
END

I_C_T PPAPHRIL 0 A7I_SpellholdAphril
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11019 /* A mortal mind which is not prepared for the supernatural will break easily. There are numerous beings out there which cause maddening pain even by catching a glimpse of their presence. */
END


// SoA: Yoshimo's betrayal in Spellhold
I_C_T YOSHJ 113 A7I_YoshimoBetrayal
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11020 /* Despite what everyone else might think, I can only pity you for your weak mind. You have carelessly forfeit the well-being of your immortal soul. */
  = @11021 /* All that awaits you now is eternal torment and endless regret. */
END


// SoA: CHARNAME transformed into Slayer after rest
EXTEND_BOTTOM PLAYER1 5    // If CHARNAME is not alone
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ EXTERN A7AFAAQ SlayerChange.1
END

EXTEND_BOTTOM PLAYER1 6    // If CHARNAME is alone
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ EXTERN A7AFAAQ SlayerChange.2
END

APPEND A7AFAAQ
  IF ~~ SlayerChange.1
    SAY @11022 /* My <PRO_LADYLORD>, what has happened to you?! The sheer power and malice almost overwhelmed my senses. */
    = @11023 /* You need to join with your soul quickly or you will lose yourself eventually to the darkness within. */
    COPY_TRANS PLAYER1 5
  END

  IF ~~ SlayerChange.2
    SAY @11022 /* My <PRO_LADYLORD>, what has happened to you?! The sheer power and malice almost overwhelmed my senses. */
    = @11023 /* You need to join with your soul quickly or you will lose yourself eventually to the darkness within. */
    COPY_TRANS PLAYER1 6
  END
END


// SoA: Freeing the enslaved humans in Ust Natha
I_C_T DASLAVE1 6 A7I_DrowSlavesHunt    // CHARNAME decides to hunt down the released human slaves
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11024 /* What are you doing, <CHARNAME>!? Your actions are as despicable as those of the drow. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", -1) DisplayStringNoName(Player1, @60030)~
END

I_C_T DASLAVE1 7 A7I_DrowSlavesEquippedFree    // CHARNAME decides to fully equip and free the human slaves
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11025 /* You have done a noble task, my <PRO_LADYLORD>. They will surely find a way to the surface. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END

I_C_T DASLAVE1 8 A7I_DrowSlavesFree    // CHARNAME decides to free the human slaves without equipment
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11026 /* Although I am glad to see them released from their drow captivity, I doubt they will see the sunlight ever again. */
END

I_C_T DASLAVE1 10 A7I_DrowSlavesAbandon    // CHARNAME abandons the slaves in the city without equipment
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11027 /* What a cruel joke are you playing with them? The humans will be dead within minutes! */
      DO ~SetGlobal("SlaveResult", "GLOBAL", 4) IncrementGlobal("A7AfaaqFriendship", "GLOBAL", -1) DisplayStringNoName(Player1, @60030)~
END

I_C_T DASLAVE1 11 A7I_DrowSlavesSacrifice    // CHARNAME intends to sacrifice the human slaves
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11024 /* What are you doing, <CHARNAME>!? Your actions are as despicable as those of the drow. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", -1) DisplayStringNoName(Player1, @60030)~
END


// SoA: Visaj in Ust Natha (Jarlaxle quest)
ADD_TRANS_TRIGGER BREG01 7 ~OR(4) !InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 0) Global("A7AfaaqGaseous", "GLOBAL", 1) StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
EXTEND_TOP BREG01 7 #1
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) GlobalLT("A7Quest3", "GLOBAL", 2)~ EXTERN A7AFAAQ JarlaxleKnown.1
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) GlobalGT("A7Quest3", "GLOBAL", 1)~ EXTERN A7AFAAQ JarlaxleKnown.2
END

APPEND A7AFAAQ
  IF ~~ JarlaxleKnown.1
    SAY @11028 /* I have heard of him, <CHARNAME>. He is an infamous mercenary, both feared and admired by the drow. */
    IF ~~ EXTERN BREG01 8
  END

  IF ~~ JarlaxleKnown.2
    SAY @11029 /* I know of him because my former master Tathas Melarn had been humiliated by him and his band, the Bregan D'aerthe, more than once. */
    = @11030 /* He is an infamous mercenary, both feared and admired by the drow. */
    IF ~~ EXTERN BREG01 8
  END
END


// SoA: Silver dragon interjections
I_C_T UDSILVER 53 A7I_AdalonDisguise  // CHARNAME is disguised as a drow
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11031 /* I am feeling uneasy about the choice you have made. My past experiences with the drow were rather...unpleasant. */
  = @11032 /* I hope we can finish our task without major difficulties. */
END

I_C_T2 UDSILVER 41 A7I_AdalonEggs    // CHARNAME returned Silver Dragon eggs unharmed
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11033 /* That was quite a task we have accomplished. I am truly impressed by your resourcefulness, my <PRO_LADYLORD>. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END


I_C_T UDSILVER 49 A7I_AdalonEggs    // CHARNAME returned tainted Silver Dragon eggs
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11034 /* You have committed a grave evil today, my <PRO_LADYLORD>. A greater evil than you would likely know. I see no difference between you and the drow we are fleeing from anymore. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", -2) DisplayStringNoName(Player1, @60031)~
END


// SoA: Tree of Life interjection (before entering the Tree itself)
EXTEND_BOTTOM PLAYER1 33
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7Q1AfaaqRewarded", "GLOBAL", 0) Global("A7AfaaqToL", "GLOBAL", 0)~ THEN
    DO ~SetGlobal("A7AfaaqToL", "GLOBAL", 1)~ GOTO ToL.1
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7Q1AfaaqRewarded", "GLOBAL", 1) Global("A7AfaaqToL", "GLOBAL", 0)~ THEN
    DO ~SetGlobal("A7AfaaqToL", "GLOBAL", 1)~ GOTO ToL.2
END

APPEND PLAYER1
  IF ~~ ToL.1
    SAY @11035 /* Afaaq, the djinni you have freed from his captors, who has supported your actions in your travels without complains. */
    ++ @11036 /* Afaaq, you probably know better than anyone else what awaits us. If I fall you will likely have to serve Irenicus forever. I could ask the elves to keep you safe from any harm if you want to. */ EXTERN A7AFAAQ ToL.Friendly.1
    ++ @11037 /* Afaaq, you know what awaits us down there. Irenicus might even harm you despite your binding to the lamp. You don't have to fight with me if you don't want to. */ EXTERN A7AFAAQ ToL.Friendly.1
    ++ @11038 /* Are you ready for the big fight, Afaaq? Irenicus is a powerful mage as you well know. */ EXTERN A7AFAAQ ToL.Demanding.1
  END

  IF ~~ ToL.2
    SAY @11039 /* Afaaq, the djinni you have been rewarded by the rakshasas, who has supported your actions in your travels without complains. */
    ++ @11036 /* Afaaq, you probably know better than anyone else what awaits us. If I fall you will likely have to serve Irenicus forever. I could ask the elves to keep you safe from any harm if you want to. */ EXTERN A7AFAAQ ToL.Friendly.1
    ++ @11037 /* Afaaq, you know what awaits us down there. Irenicus might even harm you despite your binding to the lamp. You don't have to fight with me if you don't want to. */ EXTERN A7AFAAQ ToL.Friendly.1
    ++ @11038 /* Are you ready for the big fight, Afaaq? Irenicus is a powerful mage as you well know. */ EXTERN A7AFAAQ ToL.Demanding.1
  END
END

APPEND A7AFAAQ
  IF ~~ ToL.Friendly.1
    SAY @11040 /* I have seen many evil and power-hungry wizards in my life, but only very few of them have shown such a destructive and ruthless behavior as this one. No, <CHARNAME>, I will fight with you until the end. */
    = @11041 /* I am confident that you will be victorious, as the consequences for you would be much more severe than for myself, otherwise. */
    COPY_TRANS PLAYER1 33
  END
  IF ~~ ToL.Demanding.1
    SAY @11042 /* I have seen many times already what wizards are able to do if they fall prey to their ambitions. There is only one choice to take and I am ready to do so. */
    COPY_TRANS PLAYER1 33
  END
END


// SoA: Hell interjection (when arriving in hell)
I_C_T PLAYER1 25 A7I_SoAHellArrived
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11043 /* I see we have left the prime material plane. It appears that your special nature has saved you from a fate every mortal would face eventually. Whether this is a good sign or not has to be seen yet. Nevertheless, I can already feel a strange link between you and this place, and it is growing. */
END


// SoA: Hell interjection (final confrontation with Irenicus)
I_C_T HELLJON 7 A7I_SoAHellIrenicus
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1)~
    THEN @11044 /* You have no place to hide or run anymore, wizard! Already I can feel your influence over this place waning. And now you will face the unrestricted power of the djinn kind. */
END

I_C_T HELLJON 8 A7I_SoAHellIrenicus
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1)~
    THEN @11044 /* You have no place to hide or run anymore, wizard! Already I can feel your influence over this place waning. And now you will face the unrestricted power of the djinn kind. */
END

I_C_T HELLJON 9 A7I_SoAHellIrenicus
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1)~
    THEN @11044 /* You have no place to hide or run anymore, wizard! Already I can feel your influence over this place waning. And now you will face the unrestricted power of the djinn kind. */
END

I_C_T HELLJON 10 A7I_SoAHellIrenicus
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1)~
    THEN @11044 /* You have no place to hide or run anymore, wizard! Already I can feel your influence over this place waning. And now you will face the unrestricted power of the djinn kind. */
END


// ToB: Volo's praise
EXTEND_BOTTOM SARVOLO 9 #1
  + ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0)~
    + @11045 /* Tell me about Afaaq. */ + VoloAboutAfaaq.1
END

APPEND SARVOLO
  IF ~~ VoloAboutAfaaq.1
    SAY @11046 /* Afaaq, the noble and courageous warrior mage, belongs to the race of djinn, respected and admired by the common folk for their wish-granting ability. His devotion to liberate the imprisoned, free the enslaved and help the downtrodden is legendary even by his own kin. */
    IF ~~ EXTERN A7AFAAQ VoloAboutAfaaq.2
  END
END

APPEND A7AFAAQ
  IF ~~ VoloAboutAfaaq.2
    SAY @11047 /* I do not mind you to share rumors about me unto your own kind, but I doubt that my people care much about my deeds on this plane. */
    IF ~~ EXTERN SARVOLO 9
  END
END


// ToB: Marlowe and Vongoethe
I_C_T MARLOWE 17 A7I_MarloweUndead
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0)~
    THEN @11263 /* The undead usually do not bother the living unless there is a very good reason. */
END


// ToB: CHARNAME's decision whether accepting godhood or not
EXTEND_BOTTOM FINSOL01 27
  IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 0)~ EXTERN A7AFAAQ ToBGodhoodDecision.1
END

APPEND A7AFAAQ
  IF ~~ ToBGodhoodDecision.1
    SAY @11048 /* You have reached a fork in your path, my <PRO_LADYLORD>. Whatever choice you make, it will be an irreversible one. */
    = @11049 /* I can give you only one piece of advice. Whether you choose to become a power unto the gods or return to a mortal life, you need to stay true to yourself. If you choose wrongly you will regret it for you whole life...or an eternity. */
    = @11050 /* Nevertheless, I will always think of you fondly, as you have helped my when I needed it the most. */
    COPY_TRANS FINSOL01 27
  END
END


// Watcher's Keep: Guardian ghost on 4th floor
I_C_T FSSPIR2 1 A7I_WKGuardian
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11051 /* A guardian compelled to carry out his duty unconditionally? I know that feeling well. */
END


// Watcher's Keep: Riddle Imp
EXTEND_BOTTOM FSRIDD 3 4
  + ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) CheckStatLT(Player1, 15, INT) Global("A7AfaaqEnslaved", "GLOBAL", 0)~
    + @11005 /* Could you help me out, Afaaq? */ EXTERN A7AFAAQ WKImpRiddleHelp1
END
EXTEND_BOTTOM FSRIDD 8
  + ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0)~
    + @11052 /* Afaaq, the game is yours! */ EXTERN A7AFAAQ WKImpRiddleHelp2
END

APPEND A7AFAAQ
  IF ~~ WKImpRiddleHelp1
    SAY @11053 /* Very well, <CHARNAME>. The riddle is simple enough. */
    = @11054 /* The correct answer is 'seven'. */
    IF ~~ EXTERN FSRIDD 6
  END
END

CHAIN A7AFAAQ WKImpRiddleHelp2
  @11055 /* Sure, why not? The game is easy enough to play. */
  = @11056 /* First, I will take 2 coins. */
  == FSRIDD #62527  // Well played.  I will take 1 coin.  There are 8 left, and it is your move.
  == A7AFAAQ #62544  // I will take 3 coins.
  == FSRIDD #62545  // Damn - you are smarter than you look.  Or sound.  Or act.  Fine, I will take 3 coins and leave just 2.  Try not to sprain anything figuring this out.
  == A7AFAAQ #62546  // I will take 1 and leave the last coin for you, imp! The victory is mine!
EXTERN FSRIDD 22


// Watcher's Keep: Demogorgon
I_C_T GORDEMO 1 A7I_WKDemogorgon
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11057 /* There is a presence in this room for sure. Is it evil? I can not say. It is very powerful however. */
END

