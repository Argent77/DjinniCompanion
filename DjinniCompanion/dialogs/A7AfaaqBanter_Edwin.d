// *** Banters with Edwin ***
// TODO

// Banter #1
CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 1)~ THEN EDWINJ Edwin.0
  @19550 /* It must be unbearable for a proud and noble djinn to be trapped in that prison, considering that you also have to suffer the indignity to follow every foolish whim of your masters. Don't you wish to escape this prison and enjoy freedom once more? */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ @19551 /* Your concern over my well-being is touching, wizard. */
  = @19552 /* My current plight is just a temporary condition. I can allow myself to be patient since time is of no real consequence for my kind. */
  == EDWINJ @19553 /* But surely even your patience will snap eventually. The Red Wizards have considerable knowledge of enslaving creatures as well as breaking enslavements. I could be of great help to you in this matter. */
  == A7AFAAQ @19554 /* I have no doubt about your willingness to help me. However, Red Wizards are not known for their generosity. */
  == EDWINJ @19555 /* Well, of course I'm not doing it purely out of the goodness of my heart. All I desire is a small favor that should easily be within your power. What say you? */
  == A7AFAAQ @19556 /* You are not the first wizard of your order I have the misfortune to deal with. But unlike your brothers in Thay you are especially easy to read. */
  = @19557 /* My previous masters forced me to perform unimaginably cruel and hideous tasks. But they all were well aware of the consequences of their actions. I am not so sure in your case. I would rather suffer another millennium in their clutches than being bound to grant you even the smallest of favors imaginable. */
  == EDWINJ @19558 /* (How dare you!) Ahem, you wound me deeply, Afaaq. Think about it some more. I'm sure you will see the advantages of my offer. (As do I for myself.) */
EXIT

CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ THEN EDWIN25J Edwin.0
  @19550 /* It must be unbearable for a proud and noble djinn to be trapped in that prison, considering that you also have to suffer the indignity to follow every foolish whim of your masters. Don't you wish to escape this prison and enjoy freedom once more? */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ @19551 /* Your concern over my well-being is touching, wizard. */
  = @19552 /* My current plight is just a temporary condition. I can allow myself to be patient since time is of no real consequence for my kind. */
  == EDWIN25J @19553 /* But surely even your patience will snap eventually. The Red Wizards have considerable knowledge of enslaving creatures as well as breaking enslavements. I could be of great help to you in this matter. */
  == A7AFAAQ @19554 /* I have no doubt about your willingness to help me. However, Red Wizards are not known for their generosity. */
  == EDWIN25J @19555 /* Well, of course I'm not doing it purely out of the goodness of my heart. All I desire is a small favor that should easily be within your power. What say you? */
  == A7AFAAQ @19556 /* You are not the first wizard of your order I have the misfortune to deal with. But unlike your brothers in Thay you are especially easy to read. */
  = @19557 /* My previous masters forced me to perform unimaginably cruel and hideous tasks. But they all were well aware of the consequences of their actions. I am not so sure in your case. I would rather suffer another millennium in their clutches than being bound to grant you even the smallest of favors imaginable. */
  == EDWIN25J @19558 /* (How dare you!) Ahem, you wound me deeply, Afaaq. Think about it some more. I'm sure you will see the advantages of my offer. (As do I for myself.) */
EXIT


// Banter #2
CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 3)~ THEN EDWINJ Edwin.1
  @19600 /* Afaaq, please satisfy my curiosity. What was your life before your unfortunate encounters on the prime material plane? */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ @19601 /* I am certain that even the most insignificant tale from my past would vastly exceed your imagination, wizard. */
  == EDWINJ @19602 /* Oh, do I hear a hint of sadness in your voice? Or is it regret? Your past must have been glorious indeed. */
  == A7AFAAQ @19603 /* Our past is an important part of us. It shapes us and prepares for events that have not yet come to pass. Joy and sadness, anticipation and regret are all part of life. I would not have it otherwise. */
  = @19604 /* I have noticed you are exceptionally reticent when it comes to your own past, wizard. Do you regret past decisions? */
  == EDWINJ @19605 /* What nonsense! I have accomplished more than the ragtag party I'm pleasing my presence with would experience in a lifetime. My current endeavor will be just as fruitful in the end. (Even if those monkeys in Thay refuse to see it yet.) */
EXIT

CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 3) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ THEN EDWIN25J Edwin.1
  @19600 /* Afaaq, please satisfy my curiosity. What was your life before your unfortunate encounters on the prime material plane? */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ @19601 /* I am certain that even the most insignificant tale from my past would vastly exceed your imagination, wizard. */
  == EDWIN25J @19602 /* Oh, do I hear a hint of sadness in your voice? Or is it regret? Your past must have been glorious indeed. */
  == A7AFAAQ @19603 /* Our past is an important part of us. It shapes us and prepares for events that have not yet come to pass. Joy and sadness, anticipation and regret are all part of life. I would not have it otherwise. */
  = @19604 /* I have noticed you are exceptionally reticent when it comes to your own past, wizard. Do you regret past decisions? */
  == EDWIN25J @19605 /* What nonsense! I have accomplished more than the ragtag party I'm pleasing with my presence would experience in a lifetime. My current endeavor will be just as fruitful in the end. (Even if those monkeys in Thay refuse to see it yet.) */
EXIT


// Banter #3
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterEdwin", "GLOBAL", 5)~ THEN EDWINJ Edwin.3
  @19650 /* Afaaq, I would have a word with you. Alone. */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 1)~
  == A7AFAAQ @19651 /* I am sure you would. Although I must confess that my anticipation of this conversation is limited. */
  == EDWINJ @19652 /* Silence! This is very important (to me). */
  = @19653 /* Do you remember our first conversation? I promised to help you breaking the enchantment that keeps you chained to the lamp. */
  = @19659 /* In addition I can offer you riches beyond your dreams. My family is quite affluent. I know your kind appreciates gems, magical items or opulent meals. All I desire is a small service of you in return. What is your decision? */
  == A7AFAAQ @19655 /* You think yourself clever, but the desparation in your words is poorly veiled. Even if I did not have the experience of countless lifetimes of you mortals, I would be wary of your intent. Others of my race may be more tolerant in this regard, but I am not. */
  = @19656 /* My service will never be available for your kind. I do not do this out of malice or selfishness, but rather to protect you and everyone else from the mistakes that will inevitably be the result of your actions. Do not ask me of it again. */
  == EDWINJ @19657 /* So you refuse a helping hand and the opportunity to gain wealth beyond measure at the same time? You are more a fool than I expected. It is your loss, djinn. (But don't think I will give up so easily.) */
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterEdwin", "GLOBAL", 5)~ THEN EDWIN25J Edwin.3
  @19650 /* Afaaq, I would have a word with you. Alone. */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ @19651 /* I am sure you would. Although my anticipation of this conversation is limited. */
  == EDWIN25J @19652 /* Silence! This is very important (to me). */
  = @19654 /* I know your kind appreciates gems, magical items or opulent meals. My family is quite affluent. I can provide you with wealth beyond your wildest dreams. All I desire is a small service of you in return. What is your decision? */
  == A7AFAAQ @19655 /* You think yourself clever, but the desparation in your words is poorly veiled. Even if I did not have the experience of countless lifetimes of you mortals, I would be wary of your intent. Others of my race may be more tolerant in this regard, but I am not. */
  = @19656 /* My service will never be available for your kind. I do not do this out of malice or selfishness, but rather to protect you and everyone else from the mistakes that will inevitably be the result of your actions. Do not ask me of it again. */
  == EDWIN25J @19658 /* So you refuse the opportunity to gain wealth beyond measure? You are more a fool than I expected. It is your loss, djinn. */
EXIT


// Cutscene: Edwin, after a rest, attempts to bring the lamp under his control
APPEND A7AFAAQ
  // After Edwin failed to bring Afaaq under control
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7EdwinTakesControl", "GLOBAL", 3) Global("BanterActive", "LOCALS", 0)~ TalkEdwinTakesControl.1
    SAY @19700 /* I can not believe the foolishness of that wizard. He should have known that an artifact like this is protected against half-hearted attempts to break its enchantments. */
    = @19701 /* He could have easily imprisoned everyone including you, my <PRO_LADYLORD>, by his foolish actions. I hope you have a way to free him from his predicament, because he will not have the power to do it by himself anymore. */
    + ~Class(LastTalkedToBy, MAGE_ALL)~ + @19702 /* I guess he has learned his lesson now. Would a Freedom spell release him from his imprisonment? */ + TalkEdwinTakesControl.2
    + ~!Class(LastTalkedToBy, MAGE_ALL)~ + @19703 /* I think he has learned his lesson now. How exactly can I release him from his predicament? */ + TalkEdwinTakesControl.3
    ++ @19704 /* That fool is more trouble than he's worth it. Let him rot in hell, for all I care. */ + TalkEdwinTakesControl.4
  END

  IF ~~ TalkEdwinTakesControl.2
    SAY @19705 /* Yes, I think it would. But it has to be cast near the place of his imprisonment to be effective. I hope you have a spell like that ready. */
    + ~OR(2) CheckStatGT(LastTalkedToBy, 14, INT) CheckStatGT(LastTalkedToBy, 14, WIS)~ + @19708 /* Can't you grant me the wish to free Edwin from his state? */ + TalkEdwinTakesControl.5
    IF ~!CheckStatGT(LastTalkedToBy, 14, INT) !CheckStatGT(LastTalkedToBy, 14, WIS)~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL @70000 /* Free Edwin from his imprisonment */ EXIT
  END

  IF ~~ TalkEdwinTakesControl.3
    SAY @19706 /* Only a Freedom spell will release the wizard from his prison. But it has to be used near the place of his imprisonment to be effective. I hope you have a way to cast the spell. */
    + ~OR(2) CheckStatGT(LastTalkedToBy, 14, INT) CheckStatGT(LastTalkedToBy, 14, WIS)~ + @19708 /* Can't you grant me the wish to free Edwin from his state? */ + TalkEdwinTakesControl.5
    IF ~!CheckStatGT(LastTalkedToBy, 14, INT) !CheckStatGT(LastTalkedToBy, 14, WIS)~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL @70000 /* Free Edwin from his imprisonment */ EXIT
  END

  IF ~~ TalkEdwinTakesControl.4
    SAY @19707 /* ~I can not blame you if you want to leave him where he is. But if you change your mind, a Freedom spell will probably release him from his prison. It has to be cast near the place of his imprisonment to be effective, however. */
    + ~OR(2) CheckStatGT(LastTalkedToBy, 14, INT) CheckStatGT(LastTalkedToBy, 14, WIS)~ + @19708 /* Can't you grant me the wish to free Edwin from his state? */ + TalkEdwinTakesControl.5
    IF ~!CheckStatGT(LastTalkedToBy, 14, INT) !CheckStatGT(LastTalkedToBy, 14, WIS)~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL @70000 /* Free Edwin from his imprisonment */ EXIT
  END

  IF ~~ TalkEdwinTakesControl.5
    SAY @19709 /* Yes, I can grant you a wish to release someone from imprisonment. However, I can do it only a single time. Please think carefully before you make use of my offer. */
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4) SetGlobal("A7WishFreeEdwin", "MYAREA", 1)~ UNSOLVED_JOURNAL @70001 /* Free Edwin from his imprisonment */ EXIT
  END
END


APPEND EDWINP
  // After Edwin has been rescued
  IF WEIGHT #-1 ~Global("A7EdwinTakesControl", "GLOBAL", 5)~ EdwinHumiliated.1
    SAY @19750 /* It is about time that you came to my rescue. I...I thought I had to waste one of my own spells to free myself. (How very clever of me.) */
    IF ~~ DO ~SetGlobal("A7BanterEdwin", "GLOBAL", 8) SetGlobal("A7EdwinTakesControl", "GLOBAL", 10) EraseJournalEntry(@70000)~ SOLVED_JOURNAL @70002 /* Free Edwin from his imprisonment */ + EdwinHumiliated.2
  END

  IF ~~ EdwinHumiliated.2
    SAY @19751 /* Do you still need my superior intellect, <CHARNAME>? */
    ++ @19752 /* Of course. I'm sure you won't try anything stupid like that again. */ DO ~SetGlobal("KickedOut", "LOCALS", 0) JoinParty()~ EXIT
    ++ @19753 /* ~Not at the moment. I will have to think about your careless actions for a while. */ + 5
    ++ @19754 /* ~What?! After all you have done, Edwin? You should be lucky that I cared enough to free you from your predicament. */ + EdwinHumiliated.3
  END

  IF ~~ EdwinHumiliated.3
    SAY @19755 /* ~Fine, I didn't care for your presence anyway. Good riddance! */
    IF ~~ DO ~EscapeArea()~ EXIT
  END
END


APPEND EDWIN25P
  // After Edwin has been rescued
  IF WEIGHT #-1 ~Global("A7EdwinTakesControl", "GLOBAL", 5)~ EdwinHumiliated.1
    SAY @19750 /* It is about time that you came to my rescue. I...I thought I had to waste one of my own spells to free myself. (How very clever of me.) */
    IF ~~ DO ~SetGlobal("A7BanterEdwin", "GLOBAL", 8) SetGlobal("A7EdwinTakesControl", "GLOBAL", 10) EraseJournalEntry(@70000)~ SOLVED_JOURNAL @70002 /* Free Edwin from his imprisonment */ + EdwinHumiliated.2
  END

  IF ~~ EdwinHumiliated.2
    SAY @19751 /* Do you still need my superior intellect, <CHARNAME>? */
    ++ @19752 /* Of course. I'm sure you won't try anything stupid like that again. */ DO ~SetGlobal("KickedOut", "LOCALS", 0) JoinParty()~ EXIT
    + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + @19756 /* Not at the moment. I will have to think about your careless actions for a while. I'll send you back to the pocket plane. */
      DO ~SetGlobal("KickedOut", "LOCALS", 1) CreateVisualEffectObject("SPDIMNDR", Myself) Wait(2) MoveBetweenAreas("AR4500", [2552.1445], 2)~ EXIT
    + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + @19757 /* Not at the moment. I will have to think about your careless actions for a while. Just wait here for a while. */ DO ~SetGlobal("KickedOut","LOCALS",1)~ + 1
      ++ @19754 /* ~What?! After all you have done, Edwin? You should be lucky that I cared enough to free you from your predicament. */ + EdwinHumiliated.3
  END

  IF ~~ EdwinHumiliated.3
    SAY @19755 /* ~Fine, I didn't care for your presence anyway. Good riddance! */
    IF ~~ DO ~EscapeArea()~ EXIT
  END
END


// Banter #5
/*
CHAIN IF ~Name("Edwin", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterEdwin", "GLOBAL", 9)~ THEN A7AFAAQ Edwin.5
  ~(TODO: Afaaq chastises him for his thoughtless actions which has endangered everyone in the party...)~ DO ~SetGlobal("A7BanterEdwin", "GLOBAL", 10)~
  == EDWINJ ~Edwin tells him that next time he'll be successful.~
END
  ++ ~Cut it out, Edwin. Next time I won't come to your rescue.~ EXTERN EDWINJ Edwin.5.1
  ++ ~You may try if you wish. But don't expect that I show any mercy when I catch you.~ EXTERN EDWINJ Edwin.5.2

CHAIN IF ~Name("Edwin", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterEdwin", "GLOBAL", 9)~ THEN A7AFAAQ Edwin.5
  ~(TODO: Afaaq chastises him for his thoughtless actions which has endangered everyone in the party...)~ DO ~SetGlobal("A7BanterEdwin", "GLOBAL", 10)~
  == EDWIN25J ~Edwin tells him that next time he'll be successful.~
END
  ++ ~Cut it out, Edwin. Next time I won't come to your rescue.~ EXTERN EDWIN25J Edwin.5.1
  ++ ~You may try it if you wish. But don't expect that I show any mercy when I catch you.~ EXTERN EDWIN25J Edwin.5.2

APPEND EDWINJ
  IF ~~ Edwin.5.1
    SAY ~I don't need your charity. I'm powerful enough to get out of any situation on my own.~
    IF ~~ EXIT
  END

  IF ~~ Edwin.5.2
    SAY ~Oh, I'm already shaking.  Don't take me for a fool, <CHARNAME>. My talents are an easy match for the powers of a would-be godling.~
    IF ~~ EXIT
  END
END


APPEND EDWIN25J
  IF ~~ Edwin.5.1
    SAY ~I don't need your charity. I'm powerful enough to get out of any situation on my own.~
    IF ~~ EXIT
  END

  IF ~~ Edwin.5.2
    SAY ~Oh, I'm already shaking.  Don't take me for a fool, <CHARNAME>. My talents are an easy match for the powers of a would-be godling.~
    IF ~~ EXIT
  END
END
*/
