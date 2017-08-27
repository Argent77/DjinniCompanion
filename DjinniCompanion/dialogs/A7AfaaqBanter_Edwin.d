// *** Banters with Edwin ***
// TODO

// Banter #1
CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 1)~ THEN EDWINJ Edwin.0
  ~(TODO: Edwin tries hard to persuade Afaaq to change sides and work for him by promising him power, wealth and influence...)~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ ~Afaaq politely tells Edwin that he has no interest in it.~
  == EDWINJ ~Edwin is slightly offended by Afaaq's answer.~
EXIT

CHAIN IF ~Global("A7BanterEdwin", "GLOBAL", 1)~ THEN EDWIN25J Edwin.0
  ~(TODO: Edwin tries hard to persuade Afaaq to change sides and work for him by promising him power, wealth and influence...)~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ ~Afaaq politely tells Edwin that he has no interest in it.~
  == EDWIN25J ~Edwin is slightly offended by Afaaq's answer.~
EXIT


// Banter #2
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterEdwin", "GLOBAL", 3)~ THEN EDWINJ Edwin.1
  ~(TODO: Edwin attempts to find a weakness in Afaaq by asking him about his dreams and ambitions...)~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ ~Afaaq sees right through him and tells him that it is impossible to find what he's looking for.~
  == EDWINJ ~This answer infuriates Edwin for a moment before regaining his self-control and muttering to himself.~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterEdwin", "GLOBAL", 3)~ THEN EDWIN25J Edwin.1
  ~(TODO: Edwin attempts to find a weakness in Afaaq by asking him about his dreams and ambitions...)~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1)~
  == A7AFAAQ ~Afaaq sees right through him and tells him that it is impossible to find what he's looking for.~
  == EDWIN25J ~This answer infuriates Edwin for a moment before regaining his self-control and muttering to himself.~
EXIT


// Banter #3
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


// Cutscene: Edwin, after a rest, attempts to bring the lamp under his control
APPEND A7AFAAQ
  // After Edwin failed to bring Afaaq under control
  IF ~InPartySlot(LastTalkedToBy, 0) Global("A7EdwinTakesControl", "GLOBAL", 3) Global("BanterActive", "LOCALS", 0)~ TalkEdwinTakesControl.1
    SAY ~I can not believe the foolishness of that wizard. He should have known that an artifact like this is protected against half-hearted attempts to break its enchantments.~
    = ~That mage could have easily imprisoned everyone including you, my <PRO_LADYLORD>, by his foolish actions. I hope you have a way to free him from his predicament, because he will not have the power to do it by himself anymore.~
    + ~Class(LastTalkedToBy, MAGE_ALL)~ + ~I guess he has learned his lesson now. Would a Freedom spell release him from his imprisonment?~ + TalkEdwinTakesControl.2
    + ~!Class(LastTalkedToBy, MAGE_ALL)~ + ~I think he has learned his lesson now. How exactly can I release him from his predicament?~ + TalkEdwinTakesControl.3
    ++ ~That fool is more trouble than he's worth it. Let him rot in hell, for all I care.~ + TalkEdwinTakesControl.4
  END

  IF ~~ TalkEdwinTakesControl.2
    SAY ~Yes, I think it would. But it has to be cast in this area to be effective. I hope you have a spell like that ready.~
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL ~Free Edwin from his imprisonment.~ EXIT
  END

  IF ~~ TalkEdwinTakesControl.3
    SAY ~Only a Freedom spell will release the wizard from his prison. But it has to be used in this area to be effective. I hope you have a way to cast the spell.~
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL ~Free Edwin from his imprisonment.~ EXIT
  END

  IF ~~ TalkEdwinTakesControl.4
    SAY ~I will not blame you if you want to leave him where he is. But if you change your mind, a Freedom spell will probably release him from his prison. It has to be cast in this area however, to be effective.~
    IF ~~ DO ~SetGlobal("A7EdwinTakesControl", "GLOBAL", 4)~ UNSOLVED_JOURNAL ~Free Edwin from his imprisonment.~ EXIT
  END
END


APPEND EDWINP
  // After Edwin has been rescued
  IF WEIGHT #-1 ~Global("A7EdwinTakesControl", "GLOBAL", 5)~ EdwinHumiliated.1
    SAY ~It is about time that you came to my rescue. I...I thought I had to waste one of my own spells to free myself. (How very clever of me.)~
    IF ~~ DO ~IncrementGlobal("A7BanterEdwin", "GLOBAL", 1) SetGlobal("A7EdwinTakesControl", "GLOBAL", 10)~ + EdwinHumiliated.2
  END

  IF ~~ EdwinHumiliated.2
    SAY ~Do you still need my superior intellect, <CHARNAME>?~
    ++ ~Of course. I'm sure you won't try anything stupid like that again.~ DO ~SetGlobal("KickedOut", "LOCALS", 0) JoinParty()~ EXIT
    ++ ~Not at the moment. I will have to think about your careless actions for a while.~ + 5
    ++ ~What?! After all you have done, Edwin? You should be lucky that I cared enough to free you from your predicament.~ + EdwinHumiliated.3
  END

  IF ~~ EdwinHumiliated.3
    SAY ~Fine, I didn't care for your presence anyway. Good riddance!~
    IF ~~ DO ~EscapeArea()~ EXIT
  END
END


APPEND EDWIN25P
  // After Edwin has been rescued
  IF WEIGHT #-1 ~Global("A7EdwinTakesControl", "GLOBAL", 5)~ EdwinHumiliated.1
    SAY ~It is about time that you came to my rescue. I...I thought I had to waste one of my own spells to free myself. (How very clever of me.)~
    IF ~~ DO ~SetGlobal("A7BanterEdwin", "GLOBAL", 8) SetGlobal("A7EdwinTakesControl", "GLOBAL", 10)~ + EdwinHumiliated.2
  END

  IF ~~ EdwinHumiliated.2
    SAY ~Do you still need my superior intellect, <CHARNAME>?~
    ++ ~Of course. I'm sure you won't try anything stupid like that again.~ DO ~SetGlobal("KickedOut", "LOCALS", 0) JoinParty()~ EXIT
    + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + ~Not at the moment. I will have to think about your careless actions for a while. I'll send you back to the pocket plane.~ 
      DO ~SetGlobal("KickedOut", "LOCALS", 1) CreateVisualEffectObject("SPDIMNDR", Myself) Wait(2) MoveBetweenAreas("AR4500", [2552.1445], 2)~ EXIT
    + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + ~Not at the moment. I will have to think about your careless actions for a while. Just wait here for a while.~ DO ~SetGlobal("KickedOut","LOCALS",1)~ + 1
      ++ ~What?! After all you have done, Edwin? You should be lucky that I cared enough to free you from your predicament.~ + EdwinHumiliated.3
  END

  IF ~~ EdwinHumiliated.3
    SAY ~Fine, I didn't care for your presence anyway. Good riddance!~
    IF ~~ DO ~EscapeArea()~ EXIT
  END
END


// Banter #5
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

