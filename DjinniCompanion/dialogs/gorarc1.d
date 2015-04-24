// Dialog lines for archivist spirit in Watcher's Keep Level 1
// Traified


ADD_STATE_TRIGGER ~GORARC1~ 8 ~OR(2) !Global("A7Q5Tome", "GLOBAL", 1) Global("A7TalkedAboutTome", "LOCALS", 1)~

EXTEND_BOTTOM ~GORARC1~ 0
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 1)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.1
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 2)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.1
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 3)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.2
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 4)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.2
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 5)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.3
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 6)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.4
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 7)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.4
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 8)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.5
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 9)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.6
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 10)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.6
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 11)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.7
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 12)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.7
  + ~Global("A7Q5Tome", "GLOBAL", 2) Global("A7CreateTome", "AR3001", 13)~ + @5880 /* Could you tell me again where you have seen the ritual tome? */ + Archivist.Warm.2.8
END

EXTEND_BOTTOM ~GORARC1~ 0
  + ~NumTimesTalkedToGT(1) Global("A7Q5Tome", "GLOBAL", 1)~ + @5881 /* I'm looking for a tome of undead rituals. Do you have something like that in your library? */ + Archivist.Warm.1
END

EXTEND_BOTTOM ~GORARC1~ 3 #1
  + ~Global("A7Q5Tome", "GLOBAL", 1)~ + @5881 /* I'm looking for a tome of undead rituals. Do you have something like that in your library? */ + Archivist.Warm.1
END

APPEND ~GORARC1~
  IF ~Global("LightTheFire","GLOBAL",0) Global("A7Q5Tome", "GLOBAL", 1) Global("A7TalkedAboutTome", "LOCALS", 0)~ Archivist.Cold
    SAY #63955 /* ~Cold, so very cold...~ */
    ++ @5882 /* May I ask you a question? */ + Archivist.Cold.First
  END

  IF ~~ Archivist.Cold.First
    SAY @5883 /* Who are you? Did you come from the outside world? */
    ++ @5884 /* My name is <GABBER>. I'm looking for a specific tome. */ + Archivist.Cold.1
    ++ @5885 /* Greetings, I'm looking for a tome of undead rituals. */ + Archivist.Cold.1
  END

  IF ~~ Archivist.Cold.1
    SAY @5886 /* A tome... yes we have many tomes and scriptures. But I am the only one left to take care of them. */
    = @5887 /* They have become so dusty and cold... so cold. Oh how I long for a warm fire. It has become so cold in these halls lately. */
    ++ @5888 /* About the tome... */ + Archivist.Cold.Bye
  END

  IF ~~ Archivist.Cold.Bye
    SAY @5889 /* So cold... */
    IF ~~ THEN DO ~SetGlobal("A7TalkedAboutTome", "LOCALS", 1) SetNumTimesTalkedTo(0)~ UNSOLVED_JOURNAL @6546 EXIT
  END

  IF ~~ Archivist.Warm.1
    SAY @5890 /* We have a wide variety of tomes and scriptures in our library. Unfortunately I am the only one left to take care of them. */
    IF ~RandomNum(13, 1)~ DO ~SetGlobal("A7CreateTome", "AR3001", 1)~ + Archivist.Warm.1.1
    IF ~RandomNum(13, 2)~ DO ~SetGlobal("A7CreateTome", "AR3001", 2)~ + Archivist.Warm.1.1
    IF ~RandomNum(13, 3)~ DO ~SetGlobal("A7CreateTome", "AR3001", 3)~ + Archivist.Warm.1.2
    IF ~RandomNum(13, 4)~ DO ~SetGlobal("A7CreateTome", "AR3001", 4)~ + Archivist.Warm.1.2
    IF ~RandomNum(13, 5)~ DO ~SetGlobal("A7CreateTome", "AR3001", 5)~ + Archivist.Warm.1.3
    IF ~RandomNum(13, 6)~ DO ~SetGlobal("A7CreateTome", "AR3001", 6)~ + Archivist.Warm.1.4
    IF ~RandomNum(13, 7)~ DO ~SetGlobal("A7CreateTome", "AR3001", 7)~ + Archivist.Warm.1.4
    IF ~RandomNum(13, 8)~ DO ~SetGlobal("A7CreateTome", "AR3001", 8)~ + Archivist.Warm.1.5
    IF ~RandomNum(13, 9)~ DO ~SetGlobal("A7CreateTome", "AR3001", 9)~ + Archivist.Warm.1.6
    IF ~RandomNum(13, 10)~ DO ~SetGlobal("A7CreateTome", "AR3001", 10)~ + Archivist.Warm.1.6
    IF ~RandomNum(13, 11)~ DO ~SetGlobal("A7CreateTome", "AR3001", 11)~ + Archivist.Warm.1.7
    IF ~RandomNum(13, 12)~ DO ~SetGlobal("A7CreateTome", "AR3001", 12)~ + Archivist.Warm.1.7
    IF ~RandomNum(13, 13)~ DO ~SetGlobal("A7CreateTome", "AR3001", 13)~ + Archivist.Warm.1.8
  END

  IF ~~ Archivist.Warm.1.1
    SAY @5891 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was somewhere near the entrance. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.2
    SAY @5892 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was somewhere in the western wing of our library. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.3
    SAY @5893 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was somewhere in the exhibition room. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.4
    SAY @5894 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself. It was in the kitchen if I remember correctly. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.5
    SAY @5895 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was even in my own private chambers. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.6
    SAY @5896 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was somewhere in the eastern wing of our library. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.7
    SAY @5897 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was in the antechamber of the study to the south. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END

  IF ~~ Archivist.Warm.1.8
    SAY @5898 /* But I think I can help you. Not too long ago I came across a tome about rituals. Maybe you have a look for yourself, I think it was in the study to the south. */
    IF ~~ DO ~SetGlobal("A7Q5Tome", "GLOBAL", 2) EraseJournalEntry(@6546)~ UNSOLVED_JOURNAL @6547 + 2
  END


  IF ~~ Archivist.Warm.2.1
    SAY @5899 /* Of course. It was in one of the bookshelves near the entrance, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.2
    SAY @5901 /* Of course. It was somewhere in the western wing of our library, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.3
    SAY @5902 /* Of course. It was somewhere in the exhibition room, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.4
    SAY @5903 /* Of course. It was in the kitchen, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.5
    SAY @5904 /* Of course. It was somewhere in my private chambers, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.6
    SAY @5905 /* Of course. It was somewhere in the eastern wing of our library, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.7
    SAY @5906 /* Of course. It was in the antechamber of the study to the south, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END

  IF ~~ Archivist.Warm.2.8
    SAY @5907 /* Of course. It was in in the study to the south, if I remember right. */
    ++ @5900 /* Thank you, again. */ + 2
  END
END
