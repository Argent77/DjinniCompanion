// *** Banters with Sarevok ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterSarevok", "GLOBAL", 1)~ THEN SAREV25J Sarevok.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterSarevok", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == SAREV25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Sarevok", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterSarevok", "GLOBAL", 3)~ THEN A7AFAAQ Sarevok.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterSarevok", "GLOBAL", 1)~
  == SAREV25J ~...~
  == A7AFAAQ ~....~
EXIT

