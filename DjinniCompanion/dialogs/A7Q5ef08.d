// *** Quest 5: Dialog for Efreeti Guard ***
// Traified

BEGIN A7Q5EF08

// *** Introduction ***
IF ~NumTimesTalkedTo(0) Global("A7Q5MeetCommander", "A77003", 0)~ A7Q5EF08.Intro
  SAY @5640 /* Stop! */
  IF ~!See("A7Afaaq")~ + A7Q5EF08.Intro.1
  IF ~See("A7Afaaq")~ + A7Q5EF08.Hostile.1
END

IF ~~ A7Q5EF08.Intro.1
  SAY @5641 /* Who enters our domain uninvited? */
  ++ @5642 /* My name is <GABBER>, an adventurer from above. I come in peace. */ + A7Q5EF08.Intro.3
  ++ @5643 /* My name is not important. Who are you and what do you do here? */ + A7Q5EF08.Intro.2
  ++ @5644 /* I've been hired by the djinn to find out who is behind the attacks on their stronghold. */ + A7Q5EF08.Hostile.1
  ++ @5645 /* I am your death if you don't let me pass. */ + A7Q5EF08.Hostile.2
END


IF ~~ A7Q5EF08.Intro.2
  SAY @5646 /* I can't let you pass as long as you don't identify yourself. So I ask again, who are you? */
  ++ @5642 /* My name is <GABBER>, an adventurer from above. I come in peace. */ + A7Q5EF08.Intro.3
  ++ @5644 /* I've been hired by the djinn to find out who is behind the attacks on their stronghold. */ + A7Q5EF08.Hostile.1
  ++ @5645 /* I am your death if you don't let me pass. */ + A7Q5EF08.Hostile.2
END

IF ~~ A7Q5EF08.Intro.3
  SAY @5647 /* You are a mortal from the surface? This is rather unexpected. Why did you come down to this place? */
  ++ @5648 /* I'm looking for the cause of the mysterious earthquakes which plague the town above for some time. */ + A7Q5EF08.Intro.6
  + ~CheckStatLT(LastTalkedToBy, 15, CHR)~ + @5649 /* I'd rather talk about it with your leader. */ + A7Q5EF08.Intro.5
  + ~CheckStatGT(LastTalkedToBy, 14, CHR)~ + @5650 /* It is a matter of utmost importance which I'd like to discuss with your leader face to face. */ + A7Q5EF08.Intro.4
  ++ @5651 /* I refuse to be questioned any further by the likes of you. */ + A7Q5EF08.Hostile.3
END

IF ~~ A7Q5EF08.Intro.4
  SAY @5652 /* Hmm, very well. You strike me a trustworthy <RACE>. I will guide you to our first commander. He will decide what to do with you. */
  IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct3c")~ UNSOLVED_JOURNAL @6502 EXIT
END

IF ~~ A7Q5EF08.Intro.5
  SAY @5653 /* Your manners leave a lot to be desired, <RACE>. You are a guest in our domain and should act accordingly. */
  = @5654 /* Unless you give me a good reason why you are here, I won't let you pass. */
  ++ @5648 /* I'm looking for the cause of the mysterious earthquakes which plague the town above for some time. */ + A7Q5EF08.Intro.6
  ++ @5644 /* I've been hired by the djinn to find out who is behind the attacks on their stronghold. */ + A7Q5EF08.Hostile.1
  ++ @5651 /* I refuse to be questioned any further by the likes of you. */ + A7Q5EF08.Hostile.3
END

IF ~~ A7Q5EF08.Intro.6
  SAY @5655 /* So our presence here has already been detected? I will guide you to our first commander. He will decide how to deal with your lot. */
  = @5656 /* Don't make any wrong move and do not tarry. You are closely watched while you're here. */
  IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("A7Q5ct3c")~ UNSOLVED_JOURNAL @6502 EXIT
END


IF ~~ A7Q5EF08.Hostile.1
  SAY @5657 /* The enemy has found us out? Our commander must know about this immediately. */
  = @5658 /* Servants, attack the intruders! */
  IF ~~ DO ~SetGlobal("A7Q5EfreetiAttacked", "GLOBAL", 1) 
      ClearAllActions() 
      StartCutSceneMode() 
      CreateVisualEffectObject("SPPLANAR", Myself) Wait(2) JumpToPoint([2195.1637]) Face(3) 
      EndCutSceneMode()~ UNSOLVED_JOURNAL @6503 EXIT
END

IF ~~ A7Q5EF08.Hostile.2
  SAY @5659 /* The stupidity of you mortals never cease to amaze me. */
  IF ~~ DO ~SetGlobal("A7Q5EfreetiAttacked", "GLOBAL", 1) Enemy()~ UNSOLVED_JOURNAL @6504 EXIT
END

IF ~~ A7Q5EF08.Hostile.3
  SAY @5660 /* Your hostile attitude will only lead to a quick death. I ask you one last time, why did you intrude into our domain? */
  ++ @5648 /* I'm looking for the cause of the mysterious earthquakes which plague the town above for some time. */ + A7Q5EF08.Intro.6
  ++ @5661 /* I call your bluff. Give me your best shot! */ + A7Q5EF08.Hostile.2
END


// *** Talk after meeting the commander ***
IF ~Global("A7Q5MeetCommander", "A77003", 1) RandomNum(3, 1)~ A7Q5EF08.Generic.1
  SAY @5662 /* Our commander has given you the opportunity to earn our respect. Don't waste this chance. */
  IF ~~ EXIT
END

IF ~Global("A7Q5MeetCommander", "A77003", 1) RandomNum(3, 2)~ A7Q5EF08.Generic.2
  SAY @5663 /* You are free to explore our domain if you like. But watch out for the beasts that make it their home. */
  IF ~~ EXIT
END

IF ~Global("A7Q5MeetCommander", "A77003", 1) RandomNum(3, 3)~ A7Q5EF08.Generic.3
  SAY @5664 /* Our fire elementals will take care of anyone they perceive as a threat. I'm here to deal with the ambiguous cases like you. */
  IF ~~ EXIT
END

