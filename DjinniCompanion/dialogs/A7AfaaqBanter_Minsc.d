// *** Banters with Minsc ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterMinsc", "GLOBAL", 1)~ THEN MINSCJ Minsc.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterMinsc", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == MINSCJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterMinsc", "GLOBAL", 1)~ THEN MINSC25J Minsc.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterMinsc", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == MINSC25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Minsc", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterMinsc", "GLOBAL", 2)~ THEN A7AFAAQ Minsc.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterMinsc", "GLOBAL", 4)~
  == MINSCJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Minsc", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterMinsc", "GLOBAL", 2)~ THEN A7AFAAQ Minsc.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterMinsc", "GLOBAL", 4)~
  == MINSC25J ~...~
  == A7AFAAQ ~....~
EXIT





// Minsc's reaction to CHARNAME repeatedly talking to the djinni lamp
// APPEND BMINSC
  // IF ~See(Player1) !StateCheck(Player1, CD_STATE_NOTVALID) Global("A7MinscLampTalk", "LOCALS", 1)~ Minsc.LampReaction
    // SAY ~(TODO: Minsc wonders why you talk to your djinni lamp so often...)~
    // IF ~~ DO ~SetGlobal("A7MinscLampTalk", "LOCALS", 2)~ EXIT
  // END
// END

// APPEND BMINSC25
  // IF ~See(Player1) !StateCheck(Player1, CD_STATE_NOTVALID) Global("A7MinscLampTalk", "LOCALS", 1)~ Minsc.LampReaction
    // SAY ~(TODO: Minsc wonders why you talk to your djinni lamp so often...)~
    // IF ~~ DO ~SetGlobal("A7MinscLampTalk", "LOCALS", 2)~ EXIT
  // END
// END

