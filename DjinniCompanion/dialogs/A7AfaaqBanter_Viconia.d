// *** Banters with Viconia ***
// Traified

APPEND ~A7AFAAQ~
  // Banter #1
  IF ~~ AfaaqViconia.0
    SAY @20001 /* The path of life does not always follow a straight line, just as air can be felt as a light breeze at one time or a violent storm at another. I am merely weathering it out like I did countless times before. */
    IF ~Global("InToB", "GLOBAL", 0)~ EXTERN VICONIJ ViconiaAfaaq.1
    IF ~!Global("InToB", "GLOBAL", 0)~ EXTERN VICON25J ViconiaAfaaq.1
  END

  IF ~~ AfaaqViconia.1
    SAY @20005 /* False pride may cause more damage in the long term. You above all should know very well what I am talking about. */
    IF ~Global("InToB", "GLOBAL", 0) GlobalLT("A7Quest3", "GLOBAL", 2)~ EXTERN VICONIJ ViconiaAfaaq.2a
    IF ~Global("InToB", "GLOBAL", 0) GlobalGT("A7Quest3", "GLOBAL", 1)~ EXTERN VICONIJ ViconiaAfaaq.2b
    IF ~!Global("InToB", "GLOBAL", 0) GlobalLT("A7Quest3", "GLOBAL", 2)~ EXTERN VICON25J ViconiaAfaaq.2a
    IF ~!Global("InToB", "GLOBAL", 0) GlobalGT("A7Quest3", "GLOBAL", 1)~ EXTERN VICON25J ViconiaAfaaq.2b
  END

  IF ~~ AfaaqViconia.2
    SAY @20008 /* Only time will tell if you made the right choice. */
    IF ~~ EXIT
  END
END


APPEND ~VICONIJ~
  // Banter #1
  IF ~Global("A7BanterViconia", "GLOBAL", 1)~ ViconiaAfaaq.0
    SAY @20000 /* Afaaq, you are rather glum and submissive for a djinn. Has life broken you that much already? */
    IF ~~ DO ~IncrementGlobal("A7BanterViconia", "GLOBAL", 1)~ EXTERN A7AFAAQ AfaaqViconia.0
  END

  IF ~~ ViconiaAfaaq.1
    SAY @20002 /* You are truly a disgrace to your kind, given that you have powers at your fingertips that would make every mortal green with envy. */
    IF ~GlobalLT("A7Quest3", "GLOBAL", 2)~ + ViconiaAfaaq.1a
    IF ~GlobalGT("A7Quest3", "GLOBAL", 1)~ + ViconiaAfaaq.1b
  END

  IF ~~ ViconiaAfaaq.1a
    SAY @20003 /* My House had once put genies into service. Despite our best efforts we could never break their will nor abate their pride. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.1
  END

  IF ~~ ViconiaAfaaq.1b
    SAY @20004 /* My House had once put genies into service. Despite our best efforts we could never break their will nor abate their pride. Obviously someone else was more successful with you. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.1
  END

  IF ~~ ViconiaAfaaq.2a
    SAY @20006 /* Pride allowed me to survive and made me stronger. If I had displayed such a meek behavior at that time I would have shared the fate of everyone else of my House. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.2
  END

  IF ~~ ViconiaAfaaq.2b
    SAY @20007 /* Pride allowed me to survive and made me stronger. If I had displayed such a meek behavior at that time I would have shared the fate of everyone else of my House. You above all should know about Drow society. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.2
  END
END


APPEND ~VICON25J~
  // Banter #1
  IF ~Global("A7BanterViconia", "GLOBAL", 1)~ ViconiaAfaaq.0
    SAY @20000 /* Afaaq, you are rather glum and submissive for a djinn. Has life broken you that much already? */
    IF ~~ DO ~IncrementGlobal("A7BanterViconia", "GLOBAL", 1)~ EXTERN A7AFAAQ AfaaqViconia.0
  END

  IF ~~ ViconiaAfaaq.1
    SAY @20002 /* You are truly a disgrace to your kind, given that you have powers at your fingertips that would make every mortal green with envy. */
    IF ~GlobalLT("A7Quest3", "GLOBAL", 2)~ + ViconiaAfaaq.1a
    IF ~GlobalGT("A7Quest3", "GLOBAL", 1)~ + ViconiaAfaaq.1b
  END

  IF ~~ ViconiaAfaaq.1a
    SAY @20003 /* My House had once put genies into service. Despite our best efforts we could never break their will nor abate their pride. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.1
  END

  IF ~~ ViconiaAfaaq.1b
    SAY @20004 /* My House had once put genies into service. Despite our best efforts we could never break their will nor abate their pride. Obviously someone else was more successful with you. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.1
  END

  IF ~~ ViconiaAfaaq.2a
    SAY @20006 /* Pride allowed me to survive and made me stronger. If I had displayed such a meek behavior at that time I would have shared the fate of everyone else of my House. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.2
  END

  IF ~~ ViconiaAfaaq.2b
    SAY @20007 /* Pride allowed me to survive and made me stronger. If I had displayed such a meek behavior at that time I would have shared the fate of everyone else of my House. You above all should know about Drow society. */
    IF ~~ EXTERN A7AFAAQ AfaaqViconia.2
  END
END


// Banter #2
// CHAIN IF ~Name("Viconia", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterViconia", "GLOBAL", 1)~ THEN A7AFAAQ Viconia.1
  // ~(TODO: Afaaq reminds her that she too would either not survive or being held as slave if she decided to return to the drow....)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 2)~
  // == VICONIJ ~Viconia bluffs that she knows ways to avoid enslavement.~
  // == A7AFAAQ ~Afaaq calls her bluff and tells her not to fool herself. She know that without Lolth's support she has not even a slight chance.~
  // == VICONIJ ~Viconia returns a vicious remark and cuts off the conversation.~
// EXIT

// CHAIN IF ~Name("Viconia", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterViconia", "GLOBAL", 1)~ THEN A7AFAAQ Viconia.1
  // ~(TODO: Afaaq reminds her that she too would either not survive or being held as slave if she decided to return to the drow....)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 2)~
  // == VICON25J ~Viconia bluffs that she knows ways to avoid enslavement.~
  // == A7AFAAQ ~Afaaq calls her bluff and tells her not to fool herself. She know that without Lolth's support she has not even a slight chance.~
  // == VICON25J ~Viconia returns a vicious remark and cuts off the conversation.~
// EXIT


// Banter #3
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("InToB", "GLOBAL", 1) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("A7BanterViconia", "GLOBAL", 2)~ THEN VICON25J Viconia.2
  // ~(TODO: Viconia: tells Afaaq that she wouldn't have released him from his enslavement if she was in <CHARNAME>'s place and hints to the services she would have required of Afaaq...)~ DO ~SetGlobal("A7BanterViconia", "GLOBAL", 3)~
  // == A7AFAAQ ~Afaaq counters that no captivity would last eternally and genies aren't known to forgive mistreatments.~
// EXIT

