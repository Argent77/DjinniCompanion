// *** Banters with Keldorn ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("A7BanterKeldorn", "GLOBAL", 1)~ THEN KELDORJ Keldorn.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterKeldorn", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == KELDORJ ~....~
EXIT

CHAIN IF ~Global("A7BanterKeldorn", "GLOBAL", 1)~ THEN KELDO25J Keldorn.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterKeldorn", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == KELDO25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Keldorn", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterKeldorn", "GLOBAL", 3)~ THEN A7AFAAQ Keldorn.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterKeldorn", "GLOBAL", 1)~
  == KELDORJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Keldorn", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterKeldorn", "GLOBAL", 3)~ THEN A7AFAAQ Keldorn.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterKeldorn", "GLOBAL", 1)~
  == KELDO25J ~...~
  == A7AFAAQ ~....~
EXIT

