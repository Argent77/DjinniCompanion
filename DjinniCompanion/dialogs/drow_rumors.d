// *** Rumors for bartender in Ust Natha's tavern ***
// Traified

APPEND ~RUMORU~
  IF WEIGHT #-1 ~RandomNum(3,3)~ A7Quest3.1
    SAY @3987 /* It appears that House Arabani has fallen on hard times. They were even forced to form an alliance with House Jae'llat to survive. */
    IF ~~ EXIT
  END
END
