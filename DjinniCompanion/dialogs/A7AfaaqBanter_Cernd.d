// *** Banters with Cernd ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterCernd", "GLOBAL", 1)~ THEN CERNDJ Cernd.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == CERNDJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterCernd", "GLOBAL", 1)~ THEN CERND25J Cernd.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == CERND25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Cernd", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterCernd", "GLOBAL", 2)~ THEN A7AFAAQ Cernd.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 4)~
  == CERNDJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Cernd", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterCernd", "GLOBAL", 2)~ THEN A7AFAAQ Cernd.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 4)~
  == CERND25J ~...~
  == A7AFAAQ ~....~
EXIT


// Banter #1 (after Cernd knows about his son)
// CHAIN IF ~Name("Cernd", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("CerndBaby", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterCernd", "GLOBAL", 0)~ THEN A7AFAAQ Cernd.0
  // ~(TODO: Afaaq wonders why Cernd is so convinced to serve nature and balance when he isn't even in tune with himself....)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 1)~
  // == BCERND ~Cernd tries to explain that it is his troubled past which has made him a follower of a more simplistic, natural and balanced life style.~
  // == A7AFAAQ ~Afaaq isn't convinced and tells Cernd that he has to consider that he will have trouble to understand his new way of life unless he comes to term with himself.~
  // == BCERND ~Cernd promises to think about Afaaq's words of wisdom and tries to finish the conversation quickly.~
// EXIT

// CHAIN IF ~Name("Cernd", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("CerndBaby", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterCernd", "GLOBAL", 0)~ THEN A7AFAAQ Cernd.0
  // ~(TODO: Afaaq wonders why Cernd is so convinced to serve nature and balance when he isn't even in tune with himself....)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 1)~
  // == BCERND25 ~Cernd tries to explain that it is his troubled past which has made him a follower of a more simplistic, natural and balanced life style.~
  // == A7AFAAQ ~Afaaq isn't convinced and tells Cernd that he has to consider that he will have trouble to understand his new way of life unless he comes to term with himself.~
  // == BCERND25 ~Cernd promises to think about Afaaq's words of wisdom and tries to finish the conversation quickly.~
// EXIT


// Banter #2
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 0) Global("A7BanterCernd", "GLOBAL", 1)~ THEN BCERND Cernd.1
  // ~(TODO: Cernd tells Afaaq that he has thought about his advice and is sure that his life as a servant of nature and balance will help him to overcome his past failures in life...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 2)~
  // == A7AFAAQ ~Afaaq wants to know more how he thinks to make amends for something which can not be made undone (hinting to his former love).~
  // == BCERND ~Cernd doesn't have an answer, but tells Afaaq that a good start would be to take care of his son.~
  // == A7AFAAQ ~Afaaq agrees that it would be a good start and urges Cernd to stay with him in the grove to look after his son personally.~
  // == BCERND ~Cernd replies evasively that he has the obligation to support <CHARNAME> in his quest.~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) Global("A7BanterCernd", "GLOBAL", 1)~ THEN BCERND25 Cernd.1
  // ~(TODO: Cernd tells Afaaq that he has thought about his advice and is sure that his life as a servant of nature and balance will help him to overcome his past failures in life...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 2)~
  // == A7AFAAQ ~Afaaq wants to know more how he thinks to make amends for something which can not be made undone (hinting to his former love).~
  // == BCERND25 ~Cernd doesn't have an answer, but tells Afaaq that a good start would be to take care of his son.~
  // == A7AFAAQ ~Afaaq agrees that it would be a good start and urges Cernd to stay with him in the grove to look after his son personally.~
  // == BCERND25 ~Cernd replies evasively that he has the obligation to support <CHARNAME> in his quest.~
// EXIT


// Banter #3 (after CHARNAME has gotten back his soul)
// CHAIN IF ~Name("Cernd", LastTalkedToBy) GlobalGT("Chapter", "GLOBAL", %bg2_chapter_7%) Global("BanterActive", "LOCALS", 1) Global("A7BanterCernd", "GLOBAL", 2)~ THEN A7AFAAQ Cernd.2
  // ~(TODO: Afaaq praises Cernd for his steadfast loyalty to <CHARNAME> during his search for <PRO_HISHER> soul, and reminds him that he shouldn't forget his own obligations for the well-being of his son...)~ DO ~SetGlobal("A7BanterCernd", "GLOBAL", 3)~
  // == BCERND25 ~Cernd thanks Afaaq for his concern, but tells him that his task isn't over until the Bhaalspawn saga hasn't been solved completely.~
  // == A7AFAAQ ~Afaaq tells him that he can't take care of everything by himself and the Bhaalspawn saga will be solved even without his active involvement. He suggests Cernd to think about it and set his priorities accordingly.~
  // == BCERND25 ~Cernd promises him to think about it.~
// EXIT


// Banter #4
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7BanterCernd", "GLOBAL", 3)~ THEN BCERND25 Cernd.3
  // ~(TODO: Cernd tells Afaaq that he has come to the conclusion that the Bhaalspawn saga is more important and he has to take an active role in it to ensure that balance is served in the end...)~
  // == A7AFAAQ ~Afaaq respects Cernds decision, but reminds him that without proper guidance, his son might repeat the failures of his father or worse.~
  // == BCERND25 ~Cernd reassures Afaaq that his raising in the druid grove will sufficiently prepare him for his life.~
// EXIT

