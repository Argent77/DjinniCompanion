// *** Unfinished Business: Kalah and What He Was Promised - Genie interjection ***
// Traified

I_C_T2 ~U!KGEN~ 18 A7I_UBKalahGenie  // Charname releases Genie from his imprisonment
  == A7AFAAQ IF ~InMyArea("A7Afaaq") Global("A7AfaaqSummoned", "GLOBAL", 1) Global("A7AfaaqGaseous", "GLOBAL", 0) !StateCheck("A7Afaaq", CD_STATE_NOTVALID)~
    THEN @11269 /* I appreciate your selfless act to release one of my kin from imprisonment, my <PRO_LADYLORD>. You could have just as well taken advantage of his current plight instead. */
      DO ~IncrementGlobal("A7AfaaqFriendship", "GLOBAL", 1) DisplayStringNoName(Player1, @60028)~
END
