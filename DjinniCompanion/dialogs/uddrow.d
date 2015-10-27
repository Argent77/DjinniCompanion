// *** Drow dialog related to Quest 3 ***
// Traified

// Rumors for bartender in Ust Natha's tavern
APPEND ~RUMORU~
  IF WEIGHT #-1 ~GlobalGT("A7Quest3", "GLOBAL", 1) RandomNum(3,3)~ RUMORU.1
    SAY @3015 /* It appears that House Arabani has fallen on hard times. They were even forced to form an alliance with House Jae'llat to survive. */
    IF ~~ EXIT
  END
END


// Lines for drow commoners about House Arabani
APPEND ~UDCOM02~
  IF WEIGHT #-1 ~GlobalGT("A7Quest3", "GLOBAL", 1) RandomNum(3, 1)~ UDCOM02.1
    SAY @3016 /* House Arabani was once our prime customer. Too bad that they have fallen on hard times. And now with House Jae'llat having a foot in their door, their future looks dire indeed. */
    IF ~~ UNSOLVED_JOURNAL @3808 EXIT
  END
END

// Story about House Arabani from the tavern guests
EXTEND_BOTTOM ~UDDROW10~ 3 #1
  + ~GlobalGT("A7Quest3", "GLOBAL", 1)~
    + @3017 /* Tell me of House Arabani. */ + UDDROW10.1
END

APPEND ~UDDROW10~
  IF ~~ UDDROW10.1
    SAY @3018 /* Ah, noble House Arabani. A strong House, once, and a very promising one. But Mother Lolth can be fickle. They gambled high to gain control over the city and lost to House Despana. */
    = @3019 /* They were forced to ally themselves with House Jae'llat to survive. However, House Arabani has not lost its pride and may rise again in the future. As I said, Mother Lolth can be fickle. */
    IF ~~ UNSOLVED_JOURNAL @3808 + 3
  END
END
