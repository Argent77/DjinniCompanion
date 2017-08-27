// *** Banters with Mazzy ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("A7BanterMazzy", "GLOBAL", 1)~ THEN MAZZYJ Mazzy.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterMazzy", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == MAZZYJ ~....~
EXIT

CHAIN IF ~Global("A7BanterMazzy", "GLOBAL", 1)~ THEN MAZZY25J Mazzy.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterMazzy", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == MAZZY25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Mazzy", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterMazzy", "GLOBAL", 3)~ THEN A7AFAAQ Mazzy.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterMazzy", "GLOBAL", 1)~
  == MAZZYJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Mazzy", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterMazzy", "GLOBAL", 3)~ THEN A7AFAAQ Mazzy.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterMazzy", "GLOBAL", 1)~
  == MAZZY25J ~...~
  == A7AFAAQ ~....~
EXIT

