// *** Banters with Anomen ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterAnomen", "GLOBAL", 1)~ THEN ANOMENJ Anomen.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterAnomen", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == ANOMENJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterAnomen", "GLOBAL", 1)~ THEN ANOME25J Anomen.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterAnomen", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == ANOME25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Anomen", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterAnomen", "GLOBAL", 2)~ THEN A7AFAAQ Anomen.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterAnomen", "GLOBAL", 4)~
  == ANOMENJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Anomen", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterAnomen", "GLOBAL", 2)~ THEN A7AFAAQ Anomen.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterAnomen", "GLOBAL", 4)~
  == ANOME25J ~...~
  == A7AFAAQ ~....~
EXIT

