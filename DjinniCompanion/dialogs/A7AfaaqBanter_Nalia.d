// *** Banters with Nalia ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterNalia", "GLOBAL", 1)~ THEN NALIAJ Nalia.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterNalia", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == NALIAJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterNalia", "GLOBAL", 1)~ THEN NALIA25J Nalia.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterNalia", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == NALIA25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Nalia", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterNalia", "GLOBAL", 2)~ THEN A7AFAAQ Nalia.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterNalia", "GLOBAL", 4)~
  == NALIAJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Nalia", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterNalia", "GLOBAL", 2)~ THEN A7AFAAQ Nalia.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterNalia", "GLOBAL", 4)~
  == NALIA25J ~...~
  == A7AFAAQ ~....~
EXIT

