// *** Dialog for Noble Salamander ***
// Traified

BEGIN A7Q5FS01

// Generic talk
IF ~Global("A7Q5SubQuest1", "A77003", 0) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 1)~ A7Q5FS.Generic.1
  SAY @5730 /* This cave looks just like home. I think I'll stay for a while. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 2)~ A7Q5FS.Generic.2
  SAY @5731 /* I wish the efreets would move on quickly. They are always so single-minded about duty and honor. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 3)~ A7Q5FS.Generic.3
  SAY @5732 /* Are you a guest? Take a seat and relax for a while. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 4)~ A7Q5FS.Generic.4
  SAY @5733 /* Luckily the efreets haven't approached us yet. I have better things to do than taking part in their stupid battles. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 0) Global("A7Q5SalamanderAllied", "A77003", 0) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(5, 5)~ A7Q5FS.Generic.5
  SAY @5734 /* I miss my brothers in the planes. But it is unlikely they will join us soon because the efreets have strengthened their guard near the portal. */
  IF ~~ EXIT
END


// Subquest 1
IF ~Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) Global("Offended", "LOCALS", 0)~ A7Q5FS01.Subquest1.Intro.1
  SAY @5735 /* Did you come to see my enchanted spear too? It must be legendary indeed if even mortals from far and wide arrive to admire its splendor. */
  ++ @5736 /* No, I've come here on behalf of the efreets and wanted to invite you to join their campaign. */ + A7Q5FS01.Subquest1.Intro.4
  ++ @5737 /* Yes, of course. The tales of your mighty spear have reached even the most distant parts of our lands. */ + A7Q5FS01.Subquest1.Intro.2
  ++ @5738 /* Are you daft? I've come here to demand that you join the efreet campaign. */ + A7Q5FS01.Subquest1.Intro.6
END

IF ~Global("A7Q5SubQuest1", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) Global("Offended", "LOCALS", 1)~ A7Q5FS01.Subquest1.Intro.Offended
  SAY @5739 /* You again? What do you want from me this time? */
  ++ @5740 /* Are you join the efreets now or not? */ + A7Q5FS01.Subquest1.Intro.Offended.2
  ++ @5741 /* I'd like to apologize for my recent behavior. I have realized that it wasn't quite appropriate to yell at you. */ DO ~SetGlobal("Offended", "LOCALS", 0)~ + A7Q5FS01.Subquest1.Intro.Offended.1
END

IF ~~ A7Q5FS01.Subquest1.Intro.Offended.1
  SAY @5742 /* If you are really sorry, I will forgive you. */
  ++ @5743 /* Thank you. Nevertheless, I'd like to ask you again to join the campaign of the efreets. */ + A7Q5FS01.Subquest1.Intro.7
END

IF ~~ A7Q5FS01.Subquest1.Intro.Offended.2
  SAY @5744 /* I've told you that I don't want to talk to you. Begone! */
  IF ~~ EXIT
END

IF ~~ A7Q5FS01.Subquest1.Intro.2
  SAY @5745 /* I thought so. It is so good to meet like-minded individuals who can appreciate the truly important things in life. */
  = @5746 /* You have probably heard many tales about how I have defeated hordes of monsters with this particular spear. If not I would gladly share them with you. */
  ++ @5747 /* I'll gladly listen to your tales about your great spear...and you of course. */ + A7Q5FS01.Subquest1.Intro.3
  ++ @5748 /* Unfortunately I haven't the time for this. I have come on behalf of the efreets and wanted to invite you to join their campaign. */ + A7Q5FS01.Subquest1.Intro.4
  ++ @5749 /* Don't even bother. I've come here to demand that you join the efreet campaign. */ + A7Q5FS01.Subquest1.Intro.6
END

IF ~~ A7Q5FS01.Subquest1.Intro.3
  SAY @5750 /* You are really something. It has been so long that anyone of my brothers had the patience to sit down and listen to me. Hmm, where do I start... */
  ++ @5751 /* Please take your time. In the meantime I'd like to invite you to take part in the efreet's campaign. */ + A7Q5FS01.Subquest1.Intro.4
  ++ @5752 /* On second thought, I don't have the patience as well. By the way, I'd like to offer you a part in the campaign of the efreets. */ + A7Q5FS01.Subquest1.Intro.4
END

IF ~~ A7Q5FS01.Subquest1.Intro.4
  SAY @5753 /* The efreets? What a disappointment. I have told them many times before that I'm not interested in their wars. */
  = @5754 /* They weren't even interested in my tales about my jewelled spear, can you imagine? Only our servant showed some interest in my stories lately... */
  = @5755 /* I tell you what. If you can bring me a replacement for our servant, I'll consider their offer. Maybe one of their fire elementals will do. I'm sure they have one to spare, because I can see more than enough of them running around the cave doing nothing. */
  ++ @5756 /* I will try, but I can't promise anything. */ + A7Q5FS01.Subquest1.Intro.8
  ++ @5757 /* You are asking too much. Is there no other way I can convince you? */ + A7Q5FS01.Subquest1.Intro.5
END

IF ~~ A7Q5FS01.Subquest1.Intro.5
  SAY @5758 /* No, there isn't. If the efreets are seriously interested in our cooperation, they should happily spare one of their servants to our cause. */
  ++ @5759 /* Very well. I will try, but I can't promise anything. */ + A7Q5FS01.Subquest1.Intro.8
END

IF ~~ A7Q5FS01.Subquest1.Intro.6
  SAY @5760 /* How dare you? You are even worse than the efreets. Begone, I don't want to talk to you. */
  IF ~~ DO ~SetGlobal("Offended", "LOCALS", 1)~ UNSOLVED_JOURNAL @6508 EXIT
END

IF ~~ A7Q5FS01.Subquest1.Intro.7
  SAY @5761 /* You are very persistent about this matter. Let me think... */
  = @5762 /* I might consider joining their army if you can bring me one of their elemental servants. */
  ++ @5756 /* I will try, but I can't promise anything. */ + A7Q5FS01.Subquest1.Intro.8
  ++ @5757 /* You are asking too much. Is there no other way I can convince you? */ + A7Q5FS01.Subquest1.Intro.5
END

IF ~~ A7Q5FS01.Subquest1.Intro.8
  SAY @5763 /* I don't care how you do it. But I won't sign any contract as long as I don't see my very own fire elemental. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 2) EraseJournalEntry(@6508)~ UNSOLVED_JOURNAL @6509 EXIT
END


IF ~GlobalGT("A7Q5SubQuest1", "A77003", 1) GlobalLT("A7Q5SubQuest1", "A77003", 5) !Range("A7Q5FES", 15) Global("A7Q5SalamandersTakeOver", "A77003", 0)~ A7Q5FS01.Subquest1.1
  SAY @5764 /* You are back? Did you bring me my fire elemental? */
  ++ @5765 /* Not yet, I'm still working on it. */ + A7Q5FS01.Subquest1.2
  ++ @5766 /* I have decided that it's too tedious to meet your demands. */ + A7Q5FS01.Subquest1.Aborted.1
END

IF ~~ A7Q5FS01.Subquest1.2
  SAY @5767 /* Take your time. */
  IF ~~ EXIT
END

IF ~~ A7Q5FS01.Subquest1.Aborted.1
  SAY @5768 /* Are you sure? I can imagine your employers will be less than thrilled by your decision. */
  ++ @5769 /* Yes, absolutely! */ + A7Q5FS01.Subquest1.Aborted.2
  ++ @5770 /* Maybe I was too hasty in my decision. I'll try harder. */ + A7Q5FS01.Subquest1.2
END

IF ~~ A7Q5FS01.Subquest1.Aborted.2
  SAY @5771 /* It's your decision. I wish you good luck in your further dealings with the efreets, <RACE>. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 9) EraseJournalEntry(@6508) EraseJournalEntry(@6509)~ UNSOLVED_JOURNAL @6510 EXIT
END


IF ~Global("A7Q5SubQuest1", "A77003", 4) Range("A7Q5FES", 15) Global("A7Q5SalamandersTakeOver", "A77003", 0) Global("ElementalAccepted", "LOCALS", 0)~ A7Q5FS01.Subquest1.Finished.1
  SAY @5772 /* Ah, do I see a fire elemental following your trail? */
  IF ~~ DO ~SetGlobal("ElementalAccepted", "LOCALS", 1) 
      ActionOverride("A7Q5FES", ChangeAIScript("A7Q5SHT2", OVERRIDE)) 
      ActionOverride("A7Q5FES", SetGlobal("FESIgnore", "LOCALS", 1)) 
      ActionOverride("A7Q5FES", SetGlobal("FESWait", "LOCALS", 1))~ + A7Q5FS01.Subquest1.Finished.2
END

IF ~~ A7Q5FS01.Subquest1.Finished.2
  SAY @5773 /* You have fullfilled your part of our deal. Now it's time to fullfill mine. Where is your contract? */
  + ~PartyHasItem("A7MISC8")~ + @5774 /* There it is. Please sign here and here... and here too. */ + A7Q5FS01.Subquest1.Finished.3
  + ~!PartyHasItem("A7MISC8")~ + @5775 /* Please wait a moment. I seem to have misplaced it. */ + A7Q5FS01.Subquest1.Finished.4
END

IF ~~ A7Q5FS01.Subquest1.Finished.3
  SAY @5776 /* The efreets and their complicated contracts... it is done. I suggest you bring it to your master as soon as possible. */
  IF ~~ DO ~SetGlobal("A7Q5SubQuest1", "A77003", 5) 
      SetGlobal("A7Q5SalamanderAllied", "A77003", 1) 
      TakePartyItem("A7MISC8") 
      DestroyItem("A7MISC8") 
      GiveItemCreate("A7MISC8A", LastTalkedToBy, 0, 0, 0)
      EraseJournalEntry(@6508) EraseJournalEntry(@6509)~ UNSOLVED_JOURNAL @6511 EXIT
END

IF ~~ A7Q5FS01.Subquest1.Finished.4
  SAY @5767 /* Take your time. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SubQuest1", "A77003", 4) Global("ElementalAccepted", "LOCALS", 1)~ A7Q5FS01.Subquest1.Finished.5
  SAY @5777 /* Thank you again for the elemental. Do you have found your contract? */
  + ~PartyHasItem("A7MISC8")~ + @5778 /* Yes, of course. Please sign here and here... and here too. */ + A7Q5FS01.Subquest1.Finished.3
  + ~!PartyHasItem("A7MISC8")~ + @5779 /* Not yet. Please wait a moment longer. */ + A7Q5FS01.Subquest1.Finished.4
END


// Generic talk after allying with the efreets
IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 1)~ A7Q5FS.Generic2.1
  SAY @5780 /* Hello again, <RACE>. Your elemental is doing well. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 2)~ A7Q5FS.Generic2.2
  SAY @5781 /* I'm a little irritated right now. I was looking forward to tell our former servant stories about my magnificient spear, but he seems to have lost interest in it. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamanderAllied", "A77003", 1) Global("A7Q5SalamandersTakeOver", "A77003", 0) RandomNum(3, 3)~ A7Q5FS.Generic2.3
  SAY @5782 /* I'm still hoping the efreets lose interest in their little war. This is such a cozy place I don't want to leave for a while. */
  IF ~~ EXIT
END


// After taking over the cave
IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) Global("ElementalAccepted", "LOCALS", 1) RandomNum(3, 1)~ A7Q5FS01.TookOver.1
  SAY @5783 /* Welcome to my realm, <RACE>. I would give you a tour, but I'm busy right now supervising our fire elemental servant. He displayed such an erratic behavior lately. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 1)~ A7Q5FS01.TookOver.3
  SAY @5784 /* Wonderful! We don't have to share the cave with the efreets anymore. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 2)~ A7Q5FS01.TookOver.4
  SAY @5785 /* It's too bad that the portal has been closed. How do we find new servants now? */
  = @5786 /* Didn't you mention a settlement on the surface above our cave? */
  ++ @5787 /* Don't even think about it. */ + A7Q5FS01.TookOver.4.1
  ++ @5788 /* Yes, and it's full of hard-working people who are used the heat. */ + A7Q5FS01.TookOver.4.1
END

IF ~~ A7Q5FS01.TookOver.4.1
  SAY @5789 /* I was just kidding. Mortals don't make good servants anyway. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 3)~ A7Q5FS01.TookOver.5
  SAY @5790 /* I almost wish the efreet would come back. It's been so quiet lately. */
  IF ~~ EXIT
END

IF ~Global("A7Q5SalamandersTakeOver", "A77003", 1) RandomNum(4, 4)~ A7Q5FS01.TookOver.6
  SAY @5791 /* Now that the efreets are gone, it has become pretty boring around here. */
  IF ~~ EXIT
END
