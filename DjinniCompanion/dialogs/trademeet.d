// *** Dialog portions for Lord Logan Coprith ***
// Traified

ADD_TRANS_TRIGGER ~CELOGAN~ 64 ~GlobalLT("A7Q1DaoTrapped", "GLOBAL", 2)~ DO 2 4
EXTEND_BOTTOM ~CELOGAN~ 64 #1
  + ~Global("A7Q1DaoTrapped", "GLOBAL", 2)~ + @1420 + 69    /* I have taken care of the problem for you... I have imprisoned their leader and taken care of the remaining genies. */
END

// Add an additional variable check to specific transitions
ADD_TRANS_TRIGGER ~CELOGAN~ 67 ~GlobalLT("A7Q1DaoTrapped", "GLOBAL", 2)~ DO 0 2
EXTEND_BOTTOM ~CELOGAN~ 67 #2
  + ~Global("A7Q1DaoTrapped", "GLOBAL", 2)~ + @1421 + 69    /* Yes.  It was difficult, but I have imprisoned their leader and taken care of the remaining genies. */
END


// *** Dialog portions for Guildmistress Busya ***

ADD_TRANS_TRIGGER ~TRHMER01~ 33 ~GlobalLT("A7Q1DaoTrapped", "GLOBAL", 2)~ DO 0 2
EXTEND_BOTTOM ~TRHMER01~ 33 #3
  + ~Global("A7Q1DaoTrapped", "GLOBAL", 2)~ + @1400 + 34    /* I have imprisoned their leader and taken care of the remaining genies... they will bother you no further. */
END


// *** Khan Zahraa (Dao) ***

APPEND ~TRGENI01~
  IF WEIGHT #-1 ~Global("A7AfaaqDetected", "LOCALS", 1)~ KhaanZahraa.1
    SAY @1450   /* You dare to sully our presence with one of those djinn, mortal? */
    = @1451   /* Ah, I see. He is your personal slave. Please keep your pet under control to avoid unnecessary distractions. */
    IF ~~ DO ~SetGlobal("A7AfaaqDetected", "LOCALS", 2)~ EXIT
    IF ~!StateCheck("A7Afaaq", CD_STATE_NOTVALID)~ DO ~SetGlobal("A7AfaaqDetected", "LOCALS", 2)~ EXTERN A7AFAAQ Afaaq.KhaanZahraa.1
  END

  IF ~~ KhaanZahraa.2
    SAY @1452   /* You are too much beneath us to provoke a hostile reaction from me. Repeat it, however, and I will not hold back my wrath. */
    IF ~~ EXIT
  END

  IF ~~ KhaanZahraa.3
    SAY @1453   /* I will show you the difference between us by destroying you and your pathetic master! */
    IF ~~ DO ~Shout(89) Enemy()~ EXIT
  END
END

APPEND ~A7AFAAQ~
  IF ~~ Afaaq.KhaanZahraa.1
    SAY @1454   /* Your taunts will have no effect on me, dao, as I sense that you are bound to service as well. Whether it is by magic or contract, is merely a question of semantics. */
    ++ @1455 EXTERN TRGENI01 KhaanZahraa.2    /* Please calm down, you two! There is no need for hostility. */
    ++ @1456 EXTERN TRGENI01 KhaanZahraa.3    /* This might be getting interesting. Don't lose to him, Afaaq! */
  END
END


// *** Taquee (The Dao in front of the tent) ***

APPEND ~TRGENI02~
  IF WEIGHT #-1 ~Name("A7Afaaq", LastTalkedToBy) RandomNum(2, 1)~ Taquee.1
    SAY @1457   /* Get out of my sight, djinni. */
    IF ~~ EXIT
  END

  IF WEIGHT #-1 ~Name("A7Afaaq", LastTalkedToBy) RandomNum(2, 2)~ Taquee.2
    SAY @1458   /* You kind is not welcome here. Begone! */
    IF ~~ EXIT
  END

  IF WEIGHT #-1 ~!Name("A7Afaaq", LastTalkedToBy) See("A7Afaaq") RandomNum(3, 1)~ Taquee.3
    SAY @1459 /* Please keep your djinni pet on a short leash to avoid unnecessary distractions, mortal! */
    IF ~~ EXIT
  END
END


// *** Amac (boy) ***

APPEND ~TRKID02~
  IF WEIGHT #-1 ~See("A7Afaaq") Global("geniesgone", "GLOBAL", 0) RandomNum(2, 1)~ TrKid02.1
    SAY @1500   /* Ahhh! It's the genies from the tent! Ahhh! */
    IF ~~ DO ~RunAwayFrom("A7Afaaq", 75)~ EXIT
  END
END


// *** Female halfling ***

APPEND ~TRFTOW04~
  IF WEIGHT #-1 ~Name("A7Afaaq", LastTalkedToBy) See("A7Afaaq") Global("geniesgone", "GLOBAL", 0) RandomNum(2, 1)~ TrFTow04.1
    SAY @1501   /* Eek! You are one of the genies! Please don't hurt me! */
    IF ~~ DO ~RunAwayFrom("A7Afaaq", 90)~ EXIT
  END

  IF WEIGHT #-1 ~!Name("A7Afaaq", LastTalkedToBy) See("A7Afaaq") Global("geniesgone", "GLOBAL", 0) RandomNum(2, 1)~ TrFTow04.2
    SAY @1502   /* Eek! Is that one of the genies? Please don't hurt me! */
    IF ~~ DO ~RunAwayFrom("A7Afaaq", 90)~ EXIT
  END
END


// *** Male human ***

APPEND ~TRMTOW04~
  IF WEIGHT #-1 ~!Name("A7Afaaq", LastTalkedToBy) See("A7Afaaq") Global("geniesgone", "GLOBAL", 0) RandomNum(2, 1)~ TrMTow04.1
    SAY @1503   /* Why hasn't Lord Logan chased those damn genies away already. If I had my way... */
    = @1504   /* Ahh! There is one of them! I was only kidding. Please excuse me. */
    IF ~~ DO ~RunAwayFrom("A7Afaaq", 75)~ EXIT
  END
END


// *** Skin dancer Quest ***

EXTEND_BOTTOM ~TRSKIN01~ 10
  + ~Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) Global("A7AfaaqToldAboutHimself", "GLOBAL", 1) !GlobalTimerNotExpired("A7AfaaqWish", "GLOBAL")~ 
    + @11264 /* Maybe Afaaq can help you with a wish... */ EXTERN ~A7AFAAQ~ Afaaq.Raissa.1
END

APPEND ~A7AFAAQ~
  IF ~~ Afaaq.Raissa.1
    SAY @11265 /* I might indeed help you to remove the curse by granting you a wish, if <CHARNAME> is willing. */
    IF ~~ EXTERN ~TRSKIN01~ 13
  END
END
