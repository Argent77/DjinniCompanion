// *** BG2EE-specific NPC dialog portions during Quest 2 ***
// Traified

// Hexxat comments the new jungle location
APPEND HEXXATJ
  IF ~AreaCheck("A77004") Global("A7Q2JungleComment", "LOCALS", 1)~ JungleQ2.1
    SAY @2213 /* This jungle looks vaguely familiar to me. Like a dim memory or dream from a life very long time ago. It wouldn't surprise me if the stone teleported us to the Jungle of Chult, or maybe the Black Jungles. */
    = @2214 /* Either way it will be an interesting diversion. Am I right, <CHARNAME>? */
    IF ~~ DO ~SetGlobal("A7Q2JungleComment", "LOCALS", 2)~ EXIT
  END
END
