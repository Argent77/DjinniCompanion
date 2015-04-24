// *** Banters with Jan ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterJan", "GLOBAL", 1)~ THEN JANJ Jan.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == JANJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterJan", "GLOBAL", 1)~ THEN JAN25J Jan.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == JAN25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Jan", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterJan", "GLOBAL", 2)~ THEN A7AFAAQ Jan.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 4)~
  == JANJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Jan", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterJan", "GLOBAL", 2)~ THEN A7AFAAQ Jan.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 4)~
  == JAN25J ~...~
  == A7AFAAQ ~....~
EXIT



// Banter #1
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 0) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterJan", "GLOBAL", 0)~ THEN BJAN Jan.0
  // ~(TODO: Jan tells that Afaaq reminds him of his cousin twice removed, who is famous wide and far as Jimmy al-Huzzah (at least in gnome circles), who lives down there in Calimport as a fish monger and part-time travel guide...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 1)~
  // = ~...and he tells a long-winded story...~
  // == A7AFAAQ ~Afaaq tries very politely to finish the conversation.~
  // == BJAN ~...continues his story...~
  // == A7AFAAQ ~Afaaq tries more insistently to finish the conversation.~
  // == BJAN ~...agrees that they should catch up with <CHARNAME> and promises him to continue the story later.~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterJan", "GLOBAL", 0)~ THEN BJAN25 Jan.0
  // ~(TODO: Jan tells that Afaaq reminds him of his cousin twice removed, who is famous wide and far as Jimmy al-Huzzah (at least in gnome circles), who lives down there in Calimport as a fish monger and part-time travel guide...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 1)~
  // = ~...and he tells a long-winded story...~
  // == A7AFAAQ ~Afaaq tries very politely to finish the conversation.~
  // == BJAN25 ~...continues his story...~
  // == A7AFAAQ ~Afaaq tries more insistently to finish the conversation.~
  // == BJAN25 ~...agrees that they should catch up with <CHARNAME> and promises him to continue the story later.~
// EXIT


// Banter #2
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 0) Global("A7BanterJan", "GLOBAL", 1)~ THEN BJAN Jan.1
  // ~(TODO: Jan attempts to continue his interrupted story about the Calimshan cousin...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 2)~
  // == A7AFAAQ ~Afaaq becomes slightly desperate in Jan's presence and pledges to finish the story already.~
  // == BJAN ~...but Jan reassures him that he needs to hear the moral of the story. He continues his tale and finishes it eventually.~ 
  // == A7AFAAQ ~Afaaq sighs with relief that it's already over.~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) Global("A7BanterJan", "GLOBAL", 1)~ THEN BJAN25 Jan.1
  // ~(TODO: Jan attempts to continue his interrupted story about the Calimshan cousin...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 2)~
  // == A7AFAAQ ~Afaaq becomes slightly desperate in Jan's presence and pledges to finish the story already.~
  // == BJAN25 ~...but Jan reassures him that he needs to hear the moral of the story. He continues his tale and finishes it eventually.~ 
  // == A7AFAAQ ~Afaaq sighs with relief that it's already over.~
// EXIT


// Banter #3
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 0) Global("A7BanterJan", "GLOBAL", 2)~ THEN BJAN Jan.2
  // ~(TODO: Jan tells Afaaq that he's taken a special liking to him because he patiently listens to his stories like no other and promises him to tell him about his other 268 aunts, uncles, brothers, sisters, cousins once, twice and three times removed, and their better and worse halves as a token of his eternal friendship with Afaaq...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 3)~
  // == A7AFAAQ ~Afaaq tells CHARNAME that he is doomed and Jan's presence is almost worse than his enslavements he has endured in the past (in a not too serious way).~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) Global("A7BanterJan", "GLOBAL", 2)~ THEN BJAN25 Jan.2
  // ~(TODO: Jan tells Afaaq that he's taken a special liking to him because he patiently listens to his stories like no other and promises him to tell him about his other 268 aunts, uncles, brothers, sisters, cousins once, twice and three times removed, and their better and worse halves as a token of his eternal friendship with Afaaq...)~ DO ~SetGlobal("A7BanterJan", "GLOBAL", 3)~
  // == A7AFAAQ ~Afaaq tells CHARNAME that he is doomed and Jan's presence is almost worse than his enslavements he has endured in the past (in a not too serious way).~
// EXIT

