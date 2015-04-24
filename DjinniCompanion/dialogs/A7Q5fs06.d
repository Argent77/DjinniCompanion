// *** Dialog for Fire Salamander Servant ***
// Traified

BEGIN A7Q5FS06

// Generic talk
IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 1)~ A7Q5FS06.Generic.1
  SAY @5800 /* Wait your turn. I'll serve you when I have finished my rounds. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 2)~ A7Q5FS06.Generic.2
  SAY @5801 /* I'll be with you in a moment. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 3)~ A7Q5FS06.Generic.3
  SAY @5802 /* I don't have the time to chat with you. Can't you see I'm busy? */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 4)~ A7Q5FS06.Generic.4
  SAY @5803 /* (sigh) So much to do and so little time. */
  IF ~~ EXIT
END


// Talk about Subquest 1
IF ~Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0)~ A7Q5FS06.Subquest1.1
  SAY @5804 /* I'm busy at the moment. Talk to our boss if you need something. */
  ++ @5805 /* Who is your boss? */ + A7Q5FS06.Subquest1.1.1
END

IF ~~ A7Q5FS06.Subquest1.1.1
  SAY @5806 /* Ask someone else, I have to finish my rounds. */
  IF ~~ EXIT
END


// Generic talk after allying with the efreets
IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 1)~ A7Q5FS01.Generic2.1
  SAY @5807 /* Are you a guest? Take a seat and relax for a while. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 2)~ A7Q5FS02.Generic2.2
  SAY @5808 /* Ah, I can finally relax. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 3)~ A7Q5FS03.Generic2.3
  SAY @5809 /* I guess I have to thank *you* to take my well-earned break. */
  = @5810 /* But for some reason our boss wants to talk about his boring spear with me. */
  IF ~~ EXIT
END


// Talk after taking over the cave
IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) RandomNum(2, 1)~ A7Q5FS.TookOver.1
  SAY @5811 /* (grumble) Now I have to walk all over the place to serve my brothers. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) RandomNum(2, 2)~ A7Q5FS.TookOver.2
  SAY @5812 /* My feet are killing me. Don't you want to take over? */
  ++ @5813 /* Sure, why not? If it pays well? */ + A7Q5FS.TookOver.2.1
  ++ @5814 /* No, thank you. */ + A7Q5FS.TookOver.2.1
END

IF ~~ A7Q5FS.TookOver.2.1
  SAY @5815 /* I'm just kidding. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 1) RandomNum(2, 1)~ A7Q5FS.TookOver.3
  SAY @5816 /* Wonderful! We don't have to share the cave with the efreets anymore. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 1) RandomNum(2, 2)~ A7Q5FS.TookOver.4
  SAY @5817 /* I'm glad to be relieved of work. Our elemental is much better suited to do all the dirty work. */
  IF ~~ EXIT
END

