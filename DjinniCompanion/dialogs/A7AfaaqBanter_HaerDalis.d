// *** Banters with Haer'Dalis ***
// TODO

// Banter #1
CHAIN IF ~Global("A7BanterHaerDalis", "GLOBAL", 1)~ THEN HAERDAJ HaerDalis.0
  ~(TODO: HaerDalis inquires from Afaaq what he thinks of the prime material plane, as he has seen much more of it by now...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 2)~
  == A7AFAAQ ~Afaaq tells him that on the one hand ..., but on the other hand ...~
  == HAERDAJ ~HaerDalis is fascinated by Afaaq's impressions and likes the wonderfully chaotic nature of this world already. He agrees that this plane has piqued his interest as well.~
EXIT

CHAIN IF ~Global("A7BanterHaerDalis", "GLOBAL", 1)~ THEN HAERD25J HaerDalis.0
  ~(TODO: HaerDalis inquires from Afaaq what he thinks of the prime material plane, as he has seen much more of it by now...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 2)~
  == A7AFAAQ ~Afaaq tells him that on the one hand ..., but on the other hand ...~
  == HAERD25J ~HaerDalis is fascinated by Afaaq's impressions and likes the wonderfully chaotic nature of this world already. He agrees that this plane has piqued his interest as well.~
EXIT


// Banter #2
// CHAIN IF ~Name("HaerDalis", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterHaerDalis", "GLOBAL", 2)~ THEN A7AFAAQ HaerDalis.1
  // ~(TODO: Afaaq inquires whether HaerDalis has visited his home plane, the Elemental Plane of Air, as he has seen many different planes already...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 4)~
  // == HAERDAJ ~HaerDalis tells him that the closest plane he has visited matching his homeworld was the Quasielemental Plane of Dust, and he has bad memories about that one.~
  // == A7AFAAQ ~Afaaq wonders why he had bad memories.~
  // == HAERDAJ ~HaerDalis reluctantly tells him that he was part of a war party led by a powerful Baalor. And he tells in his usual enigmatic way that his life wasn't really safe during that time.~
  // == A7AFAAQ ~Afaaq can imagine that it was so, considering the chaotic evil nature of those demons.~
// EXIT

// CHAIN IF ~Name("HaerDalis", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterHaerDalis", "GLOBAL", 2)~ THEN A7AFAAQ HaerDalis.1
  // ~(TODO: Afaaq inquires whether HaerDalis has visited his home plane, the Elemental Plane of Air, as he has seen many different planes already...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 4)~
  // == HAERD25J ~HaerDalis tells him that the closest plane he has visited matching his homeworld was the Quasielemental Plane of Dust, and he has bad memories about that one.~
  // == A7AFAAQ ~Afaaq wonders why he had bad memories.~
  // == HAERD25J ~HaerDalis reluctantly tells him that he was part of a war party led by a powerful Baalor. And he tells in his usual enigmatic way that his life wasn't really safe during that time.~
  // == A7AFAAQ ~Afaaq can imagine that it was so, considering the chaotic evil nature of those demons.~
// EXIT


// Banter #3
// CHAIN IF ~Global("A7BanterHaerDalis", "GLOBAL", 5)~ THEN HAERDAJ HaerDalis.2
  // ~(TODO: HaerDalis cites a poem...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 6)~
  // == A7AFAAQ ~Afaaq tells him that it is somewhat familiar to him and asks where he picked it up.~
  // == HAERDAJ ~HaerDalis tells him that he once watched a wonderous play about an intrigue happening on some court. The play has been performed in a certain drinking esteblishment in Sigil by a troupe of genies and genasi. ~
  // == A7AFAAQ ~Afaaq tells him that schemes and intrigues are a tolerated way to increase once influence on the courts of noble djinn, as the laws are very strict and advancement to higher stations take a long time otherwise.~
  // == HAERDAJ ~HaerDalis finds it intriguing and wonders why they have such strict laws in the first place.~
  // == A7AFAAQ ~Afaaq can't give him a satisfactory answer except that it is an ancient tradition from the dawn of the djinn race.~
  // == HAERDAJ ~HaerDalis is musing over the fact that a people born out of the chaotic elements is shackled by a regiment of strict laws of order. That makes an interesting idea for a new play.~
// EXIT

// CHAIN IF ~Global("A7BanterHaerDalis", "GLOBAL", 5)~ THEN HAERD25J HaerDalis.2
  // ~(TODO: HaerDalis cites a poem...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 6)~
  // == A7AFAAQ ~Afaaq tells him that it is somewhat familiar to him and asks where he picked it up.~
  // == HAERD25J ~HaerDalis tells him that he once watched a wonderous play about an intrigue happening on some court. The play has been performed in a certain drinking esteblishment in Sigil by a troupe of genies and genasi. ~
  // == A7AFAAQ ~Afaaq tells him that schemes and intrigues are a tolerated way to increase once influence on the courts of noble djinn, as the laws are very strict and advancement to higher stations take a long time otherwise.~
  // == HAERD25J ~HaerDalis finds it intriguing and wonders why they have such strict laws in the first place.~
  // == A7AFAAQ ~Afaaq can't give him a satisfactory answer except that it is an ancient tradition from the dawn of the djinn race.~
  // == HAERD25J ~HaerDalis is musing over the fact that a people born out of the chaotic elements is shackled by a regiment of strict laws of order. That makes an interesting idea for a new play.~
// EXIT


// Banter #4
// CHAIN IF ~Name("HaerDalis", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterHaerDalis", "GLOBAL", 6)~ THEN A7AFAAQ HaerDalis.3
  // ~(TODO: Afaaq cites a poem which was popular at the court of a certain caliph he served some time ago...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 8)~
  // == HAERDAJ ~HaerDalis finishes the poem and tells him that he knows about it, as he has heard it somewhere in Sigil.~
  // == A7AFAAQ ~Afaaq is surprised and intrigued about Sigil, as this place appears to house creatures from many places and planes.~
  // == HAERDAJ ~HaerDalis: cites another poem which Afaaq might have heard.~
  // == A7AFAAQ ~Afaaq knows this one well and compliments HaerDalis for his knowledge about his culture.~
// EXIT

// CHAIN IF ~Name("HaerDalis", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterHaerDalis", "GLOBAL", 6)~ THEN A7AFAAQ HaerDalis.3
  // ~(TODO: Afaaq cites a poem which was popular at the court of a certain caliph he served some time ago...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 8)~
  // == HAERD25J ~HaerDalis finishes the poem and tells him that he knows about it, as he has heard it somewhere in Sigil.~
  // == A7AFAAQ ~Afaaq is surprised and intrigued about Sigil, as this place appears to house creatures from many places and planes.~
  // == HAERD25J ~HaerDalis: cites another poem which Afaaq might have heard.~
  // == A7AFAAQ ~Afaaq knows this one well and compliments HaerDalis for his knowledge about his culture.~
// EXIT


// Banter #5
// CHAIN IF ~Name("HaerDalis", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterHaerDalis", "GLOBAL", 9)~ THEN A7AFAAQ HaerDalis.4
  // ~(TODO: Afaaq: wants to know more about Sigil...)~ DO ~SetGlobal("A7BanterHaerDalis", "GLOBAL", 10)~
  // == HAERD25J ~HaerDalis happily tells him of his own adventures in the city and also mentions his half-sister briefly...~
  // == A7AFAAQ ~Afaaq inquires more about his half-sister.~
  // == HAERD25J ~HaerDalis doesn't want to talk about her however. He continues to tell about how he joined Raelis Shai and her troupe and how they were forced to flee Sigil after performing a certain play which led them onto this plane.~
  // == A7AFAAQ ~Promises to visit that place one day.~
// EXIT



// Haer'Dalis' reaction to CHARNAME repeatedly talking to the djinni lamp
// APPEND HAERDAJ
  // IF ~See(Player1) !StateCheck(Player1, CD_STATE_NOTVALID) Global("A7HaerDalisLampTalk", "LOCALS", 1)~ HaerDalis.LampReaction
    // SAY ~(TODO: Haer'Dalis make fun of the curious glances from bypassers...)~
    // IF ~~ DO ~SetGlobal("A7HaerDalisLampTalk", "LOCALS", 2)~ EXIT
  // END
// END

// APPEND HAERD25J
  // IF ~See(Player1) !StateCheck(Player1, CD_STATE_NOTVALID) Global("A7HaerDalisLampTalk", "LOCALS", 1)~ HaerDalis.LampReaction
    // SAY ~(TODO: Haer'Dalis make fun of the curious glances from bypassers...)~
    // IF ~~ DO ~SetGlobal("A7HaerDalisLampTalk", "LOCALS", 2)~ EXIT
  // END
// END
