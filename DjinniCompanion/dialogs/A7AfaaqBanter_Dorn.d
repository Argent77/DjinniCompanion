// *** Banters with Dorn ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("A7BanterDorn", "GLOBAL", 1)~ THEN DORNJ Dorn.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterDorn", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == DORNJ ~....~
EXIT

CHAIN IF ~Global("A7BanterDorn", "GLOBAL", 1)~ THEN DORN25J Dorn.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterDorn", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == DORN25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Global("A7BanterDorn", "GLOBAL", 3)~ THEN A7AFAAQ Dorn.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterDorn", "GLOBAL", 1)~
  == DORNJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Global("A7BanterDorn", "GLOBAL", 3)~ THEN A7AFAAQ Dorn.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterDorn", "GLOBAL", 1)~
  == DORN25J ~...~
  == A7AFAAQ ~....~
EXIT

