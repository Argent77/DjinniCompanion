// *** Banters with Imoen ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterImoen", "GLOBAL", 1)~ THEN IMOEN2J Imoen2.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterImoen", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == IMOEN2J ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterImoen", "GLOBAL", 1)~ THEN IMOEN25J Imoen2.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterImoen", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == IMOEN25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Imoen2", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterImoen", "GLOBAL", 2)~ THEN A7AFAAQ Imoen2.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterImoen", "GLOBAL", 4)~
  == IMOEN2J ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Imoen2", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterImoen", "GLOBAL", 2)~ THEN A7AFAAQ Imoen2.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterImoen", "GLOBAL", 4)~
  == IMOEN25J ~...~
  == A7AFAAQ ~....~
EXIT
