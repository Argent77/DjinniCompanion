// *** Banters with Viconia ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterViconia", "GLOBAL", 1)~ THEN VICONIJ Viconia.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == VICONIJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterViconia", "GLOBAL", 1)~ THEN VICON25J Viconia.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == VICON25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Viconia", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterViconia", "GLOBAL", 2)~ THEN A7AFAAQ Viconia.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 4)~
  == VICONIJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Viconia", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterViconia", "GLOBAL", 2)~ THEN A7AFAAQ Viconia.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 4)~
  == VICON25J ~...~
  == A7AFAAQ ~....~
EXIT



// Banter #1
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 0) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterViconia", "GLOBAL", 0)~ THEN BVICONI Viconia.0
  // ~(TODO: Viconia remembers that her house once put genies into service too, who were quite effective...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 1)~
  // == A7AFAAQ IF ~GlobalLT("A7Quest3", "GLOBAL", 2)~ ~Afaaq returns that he already knows what kind of service is expected from the drow (vaguely if before Quest 3)~
  // == A7AFAAQ IF ~GlobalGT("A7Quest3", "GLOBAL", 1)~ ~Afaaq returns that he already knows what kind of service is expected from the drow (more specific during or after Quest 3)~
  // == BVICONI ~Viconia replies that he should rather feel lucky, as what doesn't kill one makes one stronger.~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterViconia", "GLOBAL", 0)~ THEN BVICON25 Viconia.0
  // ~(TODO: Viconia remembers that her house once put genies into service too, who were quite effective...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 1)~
  // == A7AFAAQ IF ~GlobalLT("A7Quest3", "GLOBAL", 2)~ ~Afaaq returns that he already knows what kind of service is expected from the drow (vaguely if before Quest 3)~
  // == A7AFAAQ IF ~GlobalGT("A7Quest3", "GLOBAL", 1)~ ~Afaaq returns that he already knows what kind of service is expected from the drow (more specific during or after Quest 3)~
  // == BVICON25 ~Viconia replies that he should rather feel lucky, as what doesn't kill one makes one stronger.~
// EXIT


// Banter #2
// CHAIN IF ~Name("Viconia", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterViconia", "GLOBAL", 1)~ THEN A7AFAAQ Viconia.1
  // ~(TODO: Afaaq reminds her that she too would either not survive or being held as slave if she decided to return to the drow....)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 2)~
  // == BVICONI ~Viconia bluffs that she knows ways to avoid enslavement.~
  // == A7AFAAQ ~Afaaq calls her bluff and tells her not to fool herself. She know that without Lolth's support she has not even a slight chance.~
  // == BVICONI ~Viconia returns a vicious remark and cuts off the conversation.~
// EXIT

// CHAIN IF ~Name("Viconia", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterViconia", "GLOBAL", 1)~ THEN A7AFAAQ Viconia.1
  // ~(TODO: Afaaq reminds her that she too would either not survive or being held as slave if she decided to return to the drow....)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 2)~
  // == BVICON25 ~Viconia bluffs that she knows ways to avoid enslavement.~
  // == A7AFAAQ ~Afaaq calls her bluff and tells her not to fool herself. She know that without Lolth's support she has not even a slight chance.~
  // == BVICON25 ~Viconia returns a vicious remark and cuts off the conversation.~
// EXIT


// Banter #3
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("A7BanterViconia", "GLOBAL", 2)~ THEN BVICON25 Viconia.2
  // ~(TODO: Viconia: tells Afaaq that she wouldn't have released him from his enslavement if she was in <CHARNAME>'s place and hints to the services she would have required of Afaaq...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 3)~
  // == A7AFAAQ ~Afaaq counters that no captivity would last eternally and genies aren't known to forgive mistreatments.~
// EXIT

