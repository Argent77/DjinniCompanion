// *** Banters with Keldorn ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterKeldorn", "GLOBAL", 1)~ THEN KELDORJ Keldorn.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterKeldorn", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == KELDORJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterKeldorn", "GLOBAL", 1)~ THEN KELDO25J Keldorn.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterKeldorn", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == KELDO25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Keldorn", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterKeldorn", "GLOBAL", 2)~ THEN A7AFAAQ Keldorn.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterKeldorn", "GLOBAL", 4)~
  == KELDORJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Keldorn", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterKeldorn", "GLOBAL", 2)~ THEN A7AFAAQ Keldorn.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterKeldorn", "GLOBAL", 4)~
  == KELDO25J ~...~
  == A7AFAAQ ~....~
EXIT

