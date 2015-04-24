// *** Generic dialog for Fire Salamander ***
// Traified

BEGIN A7Q5FS

// Generic talk
IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 1)~ A7Q5FS.Generic.1
  SAY @5830 /* This cave looks just like home. I think I'll stay for a while. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 2)~ A7Q5FS.Generic.2
  SAY @5831 /* I wish the efreets would move on quickly. They are always so single-minded about duty and honor. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 3)~ A7Q5FS.Generic.3
  SAY @5832 /* Are you a guest? Take a seat and relax for a while. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 4)~ A7Q5FS.Generic.4
  SAY @5833 /* Luckily the efreets haven't approached us yet. I have better things to do than taking part in their stupid battles. */
  IF ~~ EXIT
END

IF ~!Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 5)~ A7Q5FS.Generic.5
  SAY @5834 /* I miss my brothers in the planes. But it is unlikely they will join us soon because the efreets have strengthened their guard near the portal. */
  IF ~~ EXIT
END


// Talk about Subquest 1
IF ~Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 1)~ A7Q5FS.Subquest1.1
  SAY @5835 /* If you have business with us then talk to our boss. He's easy to recognize because of his jewelled spear he's always showing around. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 2)~ A7Q5FS.Subquest1.2
  SAY @5836 /* You want us to join the efreet's war? That's a good joke. */
  = @5837 /* You are serious about it? Well, talk to our boss. He is the one who makes the decisions around here. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 3)~ A7Q5FS.Subquest1.3
  SAY @5838 /* Talk to our boss if you have business with us. */
  ++ @5839 /* Where can I find your boss? */ + A7Q5FS.Subquest1.3.1
END

IF ~~ A7Q5FS.Subquest1.3.1
  SAY @5840 /* Just look out for a crowd. He'll most likely be at the center, showing off his jewelled spear, as usual. */
  IF ~~ EXIT
END


// Generic talk after allying with the efreets
IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 1)~ A7Q5FS.Generic2.1
  SAY @5841 /* I'd never imagined our boss would even consider working for the efreets. You must be good negotiator. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 2)~ A7Q5FS.Generic2.2
  SAY @5842 /* I'd rather sit here and enjoy my drinks instead of fighting a war. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 3)~ A7Q5FS.Generic2.3
  SAY @5843 /* Our new elemental is quite effective. I'm so tired of listening to the complains of our former servant. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(4, 4)~ A7Q5FS.Generic2.4
  SAY @5844 /* I guess we have to thank *you* to play a part in that stupid war of the efreets. */
  IF ~~ EXIT
END


// Talk after taking over the cave
IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 1)~ A7Q5FS.TookOver.1
  SAY @5845 /* Wonderful! We don't have to share the cave with the efreets anymore. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 2)~ A7Q5FS.TookOver.2
  SAY @5846 /* It's too bad that the portal has been closed. How do we find new servants now? */
  = @5847 /* Didn't you mention a settlement on the surface above our cave? */
  ++ @5848 /* Don't even think about it. */ + A7Q5FS.TookOver.2.1
  ++ @5849 /* Yes, and it's full of hard-working people who are used the heat. */ + A7Q5FS.TookOver.2.1
END

IF ~~ A7Q5FS.TookOver.2.1
  SAY @5850 /* I was just kidding. Mortals don't make good servants anyway. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 3)~ A7Q5FS.TookOver.3
  SAY @5851 /* I almost wish the efreet would come back. It's been so quiet lately. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 4)~ A7Q5FS.TookOver.4
  SAY @5852 /* Now that the efreets are gone, it has become pretty boring around here. */
  IF ~~ EXIT
END
