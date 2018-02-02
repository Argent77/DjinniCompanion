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
  @19600 /* Afaaq, please satisfy my curiosity. What was your life before your unfortunate encounters on the prime material plane? */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 1)~
  == A7AFAAQ @19601 /* I am certain that even the most insignificant tale from my past would vastly exceed your imagination, wizard. */
  == EDWINJ @19602 /* Oh, do I hear a hint of sadness in your voice? Or is it regret? Your past must have been glorious indeed. I could help you regain the opportunity to taste freedom once more. */
  == A7AFAAQ @19603 /* You do seem to seriously believe in your own superior abilities? However, even a fool can see through your poorly disguised "sympathy". The powers that you so much crave for would certainly destroy you. I am not fool enough to even think about your offer. */
  == EDWINJ @19604 /* So you refuse a helping hand that would allow you to leave your pitiable condition behind? You are more a fool than I expected. It is your loss, djinn. (But don't think I will give up so easily.) */
EXIT

CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 3) Global("A7AfaaqEnslaved", "GLOBAL", 1)~ THEN EDWIN25J Edwin.1
  @19600 /* Afaaq, please satisfy my curiosity a bit. What was your life before your unfortunate encounters on the prime material plane? */ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 1)~
  == A7AFAAQ @19601 /* I am certain that even the most insignificant tale from my past would vastly exceed your imagination, wizard. */
  == EDWINJ @19602 /* Oh, do I hear a hint of sadness in your voice? Or is it regret? Your past must have been glorious indeed. I could help you regain the opportunity to taste freedom once more. */
  == A7AFAAQ @19603 /* You do seem to seriously believe in your own superior abilities? However, even a fool can see through your poorly disguised "sympathy". The powers that you so much crave for would certainly destroy you. I am not fool enough to even think about your offer. */
  == EDWINJ @19604 /* So you refuse a helping hand that would allow you to leave your pitiable condition behind? You are more a fool than I expected. It is your loss, djinn. (But don't think I will give up so easily.) */
EXIT


// Banter #3
/*
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterEdwin", "GLOBAL", 5)~ THEN EDWINJ Edwin.3
  ~(TODO: Edwin becomes impatient and openly threats Afaaq to grant him a wish now or he would experience the frightening powers of the Red Wizards of Thay....)~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 1)~
  == A7AFAAQ ~Afaaq calls his bluff and is both mildly amused and slightly annoyed by Edwin's empty threats.~
  == EDWINJ ~Edwin loses his temper for only a moment before gaining self-control and tells Afaaq that he always gets what he wants.~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterEdwin", "GLOBAL", 5)~ THEN EDWIN25J Edwin.3
  ~(TODO: Edwin becomes impatient and openly threats Afaaq to grant him a wish now or he would experience the frightening powers of the Red Wizards of Thay....)~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 1)~
  == A7AFAAQ ~Afaaq calls his bluff and is both mildly amused and slightly annoyed by Edwin's empty threats.~
  == EDWIN25J ~Edwin loses his temper for only a moment before gaining self-control and tells Afaaq that he always gets what he wants.~
EXIT
*/


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
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL @70000 /* Free Edwin from his imprisonment */ EXIT
  END

  IF ~~ TalkEdwinTakesControl.3
    SAY @19706 /* Only a Freedom spell will release the wizard from his prison. But it has to be used near the place of his imprisonment to be effective. I hope you have a way to cast the spell. */
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL @70000 /* Free Edwin from his imprisonment */ EXIT
  END

  IF ~~ TalkEdwinTakesControl.4
    SAY @19707 /* ~I can not blame you if you want to leave him where he is. But if you change your mind, a Freedom spell will probably release him from his prison. It has to be cast near the place of his imprisonment to be effective, however. */
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL @70000 /* Free Edwin from his imprisonment */ EXIT
  END
END


APPEND EDWINP
  // After Edwin has been rescued
  IF WEIGHT #-1 ~Global("A7EdwinTakesControl", "GLOBAL", 5)~ EdwinHumiliated.1
    SAY @19750 /* It is about time that you came to my rescue. I...I thought I had to waste one of my own spells to free myself. (How very clever of me.) */
    IF ~~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 10) EraseJournalEntry(@70000)~ SOLVED_JOURNAL @70001 /* Free Edwin from his imprisonment */ + EdwinHumiliated.2
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
    IF ~~ DO ~SetGlobal("A7BanterEdwin", "GLOBAL", 8) SetGlobal("A7EdwinTakesControl", "GLOBAL", 10) EraseJournalEntry(@70000)~ SOLVED_JOURNAL @70001 /* Free Edwin from his imprisonment */ + EdwinHumiliated.2
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

CHAIN IF ~Name("Edwin", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterEdwin", "GLOBAL", 11)~ THEN A7AFAAQ Edwin.5
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
