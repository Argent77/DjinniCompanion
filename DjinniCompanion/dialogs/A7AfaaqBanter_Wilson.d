// *** Banters with Wilson ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("A7BanterWilson", "GLOBAL", 1)~ THEN WILSONJ Wilson.0
  ~(TODO: Dummy banter #1...)~ DO ~IncrementGlobal("A7BanterWilson", "GLOBAL", 1)~
  == A7AFAAQ ~...~
  == WILSONJ ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Global("A7BanterWilson", "GLOBAL", 3)~ THEN A7AFAAQ Wilson.1
  ~(TODO: Dummy banter #2...)~ DO ~IncrementGlobal("A7BanterWilson", "GLOBAL", 1)~
  == WILSONJ ~...~
  == A7AFAAQ ~....~
EXIT

