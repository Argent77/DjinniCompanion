// *** Banters with Aerie ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterAerie", "GLOBAL", 1)~ THEN AERIEJ Aerie.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterAerie", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == AERIEJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterAerie", "GLOBAL", 1)~ THEN AERIE25J Aerie.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterAerie", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == AERIE25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Aerie", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterAerie", "GLOBAL", 2)~ THEN A7AFAAQ Aerie.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterAerie", "GLOBAL", 4)~
  == AERIEJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Aerie", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterAerie", "GLOBAL", 2)~ THEN A7AFAAQ Aerie.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterAerie", "GLOBAL", 4)~
  == AERIE25J ~...~
  == A7AFAAQ ~....~
EXIT


// Aerie's reaction to CHARNAME talking to the djinni lamp in public
// APPEND BAERIE
  // IF ~See(Player1) !StateCheck(Player1, CD_STATE_NOTVALID) Global("A7AerieLampTalk", "LOCALS", 1)~ Aerie.LampReaction
    // SAY ~Must you always talk with the lamp in public, <CHARNAME>? It's so embarrassing.~
    // IF ~~ DO ~SetGlobal("A7AerieLampTalk", "LOCALS", 2)~ EXIT
  // END
// END

// APPEND BAERIE25
  // IF ~See(Player1) !StateCheck(Player1, CD_STATE_NOTVALID) Global("A7AerieLampTalk", "LOCALS", 1)~ Aerie.LampReaction
    // SAY ~Must you always talk with the lamp in public, <CHARNAME>? It's so embarrassing.~
    // IF ~~ DO ~SetGlobal("A7AerieLampTalk", "LOCALS", 2)~ EXIT
  // END
// END

