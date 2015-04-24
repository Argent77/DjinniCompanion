// *** Dialog lines of different townsfolk about Afaaq or CHARNAME talking to his magic lamp ***
// Traified

// Note: use GlobalGT("A7TalkedToLamp", "MYAREA", 0) for lamp-related dialog

// *** City Gates ***
CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN GMTOWN02 GMTOWN02.Afaaq.1
  @11058 /* I can't wait to join the army and fight for my country. You look like a powerful man...thing? Did you ever had the chance to fight in glorious battles? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11059 /* I have, indeed. You, however, will be quite out of place on the battlefield if you do not abandon your naive notions about fame and fortune. */
EXIT


// *** Waukeen's Promenade ***
APPEND SPOILED1
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ SPOILED1.Afaaq.1
    SAY @11060 /* I've never seen a man as huge as you. I bet you come from the circus. They have weird people there, just like you. */
    IF ~~ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~ EXIT
  END
END


// *** Docks ***
CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN DSAILOR1 DSAILOR1.Afaaq.1
  @11061 /* Ye look strong as an ox to me. Care to hire on me ship and see the world? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11062 /* You will have to ask someone else to hire on, as I do no need vessels to explore the world. */
EXIT

APPEND DSAILOR1
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) PartyHasItem("A7DJLMP") GlobalGT("A7TalkedToLamp", "MYAREA", 0) RandomNum(3, 1)~ DSAILOR1.Lamp.1
    SAY @11063 /* Ye seem to have drunken too much. That bottle doesn't talk back... oh it is a lamp?! */
    ++ @11064 /* That doesn't concern you, sailor. */ + DSAILOR1.Lamp.2
    ++ @11065 /* Keep your distance. You don't appear to be much sober either. */ + DSAILOR1.Lamp.2
  END

  IF ~~ DSAILOR1.Lamp.2
    SAY @11066 /* Ah, well, my mistake. */
    IF ~~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN DSAILOR2 DSAILOR2.Afaaq.1
  @11067 /* Ho there, ye look like ye can hold yer liquor. Care t' join me on a grog or three? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11068 /* The brews of your kind do not interest me in the least. */
EXIT

APPEND DRUFF1
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ DRUFF1.Afaaq.1
    SAY @11069 /* Is it a fight ye're lookin' for?  I don't like... oh, ye're huge! I didn't...ah, I have things to do. */
    IF ~~ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1) RunAwayFrom(LastTalkedToBy, 45)~ EXIT
  END
END

APPEND DRUFF2
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ DRUFF2.Afaaq.1
    SAY @11070 /* Out of me way, ye big oaf, or ye'll feel my axe, ye will! */
    IF ~~ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN DHALF1 DHALF1.Afaaq.1
  @11071 /* You are surely not from around here. There is nothing to see, unless you like the stench of fish or the blades of muggers and thieves in the night. */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11072 /* Do not worry too much about my wellbeing, my good friend. I am able to defend myself just fine. */
EXIT

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7I_NaggingWife", "MYAREA", 0)~ THEN DMTOWN2 DMTOWN2.Afaaq.1
  @11073 /* You be the fabled genie from the stories, eh? I have heard so much about you when I was a child. */
  = @11074 /* Maybe you can grant me a wish or two? Me naggin' wife wants a new pair of shoes and me childrens always beggin' me to see the circus. */ DO ~SetGlobal("A7I_NaggingWife", "MYAREA", 1)~
  == A7AFAAQ @11075 /* I am sorry, my good man, but I do not grant wishes to everyone. */
EXIT

APPEND DFTOWN2
  IF WEIGHT #-1 ~Global("A7I_NaggingWife", "MYAREA", 1)~ DFTOWN2.Afaaq.1
    SAY @11076 /* Oh, I'm so mad today. Just this morn I found me husband sneakin' home from the tavern. */
    = @11077 /* How am I supposed to treat me a new pair of shoes if he always wastes his money in that stinkhole. And me childrens keep on and on about the circus. Ach, what do you know about such things. */
    IF ~~ DO ~SetGlobal("A7I_NaggingWife", "MYAREA", 2)~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN DHARLOT1 DHARLOT1.Afaaq.1
  @11078 /* I never seen one as you...so tall and handsome. Care t' spend some time with me, darlin'? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  //== A7AFAAQ ~I do not care much for the company of mortals. And I doubt that ...~
EXIT


// *** Slums ***
CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy)~ THEN BEGGAR2 BEGGAR2.Afaaq.1
  @11079 /* Oooh, ye're a genie, aren't you? Can't ye ease me sufferin' a little? I ha' not eaten properly in a tenday now, I beg you? */
  == A7AFAAQ @11080 /* You have a kind soul, poor man. I will grant you a boon, so that you can enjoy life once more. */
  == BEGGAR2 @11081 /* Ach ye're too kind, my lord. Lathander's praises upon you. */ 
    DO ~SetInterrupt(FALSE) 
      ActionOverride("A7Afaaq", FaceObject(LastTalkedToBy)) 
      ActionOverride("A7Afaaq", SetSequence(SEQ_CAST)) 
      SmallWait(10) 
      DisplayString(Myself, @11000) 
      CreateVisualEffectObject("SPGFLSH1", Myself) 
      SmallWait(5) 
      Polymorph(PEASANT_MAN) 
      SmallWait(15) 
      SetInterrupt(TRUE) 
      EscapeArea()~
EXIT

APPEND URCHIN2
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) PartyHasItem("A7DJLMP") GlobalGT("A7TalkedToLamp", "MYAREA", 0) Global("A7TalkedAboutGenie", "LOCALS", 0)~ URCHIN2.Lamp.1
    SAY @11082 /* I seen you talking to tha' beautiful lamp.  I bet ya hide a little ghost in there. */
    IF ~~ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ EXIT
  END
END

APPEND URCHIN3
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ URCHIN3.Afaaq.1
    SAY @11083 /* Ye are reeeaaally big, mister. When I grow up I want t' become as big as you. */
    IF ~~ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN SLUMM3 SLUMM3.Afaaq.1
  @11084 /* Oy, I've ne'er seen one of you. Do ye come from the circus? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11085 /* No, I am not. My kind seldom visits the centers of mortal men. */
EXIT

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN SLUMF2 SLUMF2.Afaaq.1
  @11086 /* Oh my, aren't ye a big man. Ye sure are not from around 'ere? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11087 /* You are right, good lady. I hail from a place farther away than you can imagine. */
EXIT

APPEND SLHALF01
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ SLHALF01.Afaaq.1
    SAY @11088 /* You are the biggest bigfolk I have seen in my life. I bet you have nothin' to fear from the thieves. Oh, I wish the thieves would leave me alone too. */
    IF ~~ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN WAYLANE WAYLANE.Afaaq.1
  @11089 /* You!  Hey you!  The tall one in the exotic garbs! */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11090 /* I take it you are talking to me? */
  == WAYLANE @11091 /* Yes, you!  See this mighty fine sphere, here?  You can have it for your very own for a mere 500 gold pieces!  I'm sure you can afford such a small sum easily? */
  == A7AFAAQ @11092 /* Your foolish attempts to make money from something you do not understand makes you a pitiful excuse even for a human. */
  == WAYLANE @11093 /* Erm...and what about 300 gold? */
  == A7AFAAQ @11094 /* Your reply merely proves my statement. */
  == WAYLANE @11095 /* Ah, thank you...I guess. Do you want the sphere now or not? 200 gold! You won't find a bargain like that anywhere else. */
  == A7AFAAQ @11096 /* My words are obviously wasted on someone like you. */
EXIT


// *** Temple District ***
APPEND POSTUL3
  IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) OR(2) Global("A7TalkedToGenie", "LOCALS", 0) RandomNum(3, 1)~ POSTUL3.Afaaq.1
    SAY @11097 /* Ooh, when even fabled creatures such as you walk the streets in plain sight, then the end of the world is nigh. We are doomed. Doomed, I say! */
    IF ~~ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN POSTUL5 POSTUL5.Afaaq.1
  @11098 /* Oh my, what an unusual visitor. Did you come to pay homage to the gods too? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11099 /* I do not care for your gods one way or another, good lady. */
  == POSTUL5 @11100 /* How dare you! The gods will surely punish you for this blasphemy, I'm sure of it. */
EXIT


// *** Bridge District ***
APPEND BURCH1
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) PartyHasItem("A7DJLMP") GlobalGT("A7TalkedToLamp", "MYAREA", 0) RandomNum(3, 1) Global("A7TalkedAboutGenie", "LOCALS", 0)~ BURCH1.Lamp.1
    SAY @11101 /* Why are you talking to shiny lamps, <PRO_SIRMAAM>? Do you hide a little man in there? */
    ++ @11102 /* I have a genie in my lamp. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + BURCH1.Lamp.2
    + ~Class(Player1, MAGE_ALL)~ + @11103 /* I'm hiding little boys in there who ask too many questions. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + BURCH1.Lamp.4
    ++ @11104 /* That doesn't concern you. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + BURCH1.Lamp.5
  END

  IF ~~ BURCH1.Lamp.2
    SAY @11105 /* Ooh, can I talk to him too? */
    ++ @11106 /* No, little boy. He is...sleeping right now. */ + BURCH1.Lamp.3
  END

  IF ~~ BURCH1.Lamp.3
    SAY @11107 /* That's too bad. Do you promise to come back when he wakes up? */
    ++ @11108 /* Yes, of course. */ EXIT
  END

  IF ~~ BURCH1.Lamp.4
    SAY @11109 /* Aaah!!! I don't want to be stuffed in there! */
    IF ~~ DO ~RunAwayFrom(LastTalkedToBy, 60)~ EXIT
  END

  IF ~~ BURCH1.Lamp.5
    SAY @11110 /* Aww, come on. Tell me please, pretty please?! */
    ++ @11111 /* Well, all right. I have a genie in my lamp. */ + BURCH1.Lamp.2
    ++ @11112 /* I said no, and I mean it. */ + BURCH1.Lamp.6
  END

  IF ~~ BURCH1.Lamp.6
    SAY @11113 /* You are real mean! */
    IF ~~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN BFTOWN1 BFTOWN1.Afaaq.1
  @11114 /* Eek!  You are surely a spawn of wicked magic from the looks it. Back into the abyss with you! */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11115 /* Please calm yourself. I mean you no harm, good lady. */ DO ~ActionOverride(LastTalkedToBy, RunAwayFrom("A7Afaaq", 60))~
EXIT

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN BSAILOR2 BSAILOR2.Afaaq.1
  @11116 /* I've seen your kind before. I think it was on one of our trips around Calimport. */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11117 /* You may be right, sailor. Some of my brethren are still at home around there. */
EXIT


// *** Government District ***
CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN GCHILD01 GCHILD01.Afaaq.1
  @11118 /* You are way bigger than my guards. I want you as my new guard, then I can brag to all my friends about you. */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11119 /* I am not for hire by you or anyone else. */
EXIT

APPEND GCHILD02
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) PartyHasItem("A7DJLMP") GlobalGT("A7TalkedToLamp", "MYAREA", 0) Global("A7TalkedAboutGenie", "LOCALS", 0)~ GCHILD02.Lamp.1
    SAY @11120 /* This lamp is so beautiful.  Why do you talk to it so often? Is it precious to you? */
    ++ @11121 /* It is very precious, because a djinni is living inside it. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + GCHILD02.Lamp.4
    ++ @11122 /* Psst! This is a magic lamp which tells me where I can find hidden treasures. Don't tell anyone. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + GCHILD02.Lamp.3
    ++ @11123 /* Get lost, child. That doesn't concern you. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + GCHILD02.Lamp.2
  END

  IF ~~ GCHILD02.Lamp.2
    SAY @11124 /* You are a mean <PRO_MANWOMAN>. I tell my father and his guards will whup your hide. */
    IF ~~ EXIT
  END

  IF ~~ GCHILD02.Lamp.3
    SAY @11125 /* Wow?  Have you found your treasures already? */
    ++ @11126 /* Not yet, but I will soon enough. */ EXIT
    ++ @11127 /* Sure, I've found many treasures already. */ EXIT
  END

  IF ~~ GCHILD02.Lamp.4
    SAY @11128 /* You are a big fat liar. Djinnis are fairy tales, I know it! */
    IF ~~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN GFTOWN01 GFTOWN01.Afaaq.1
  @11129 /* You...you don't even look human at all to me.  I'm sure that your kind is responsible for the rebellions all around us... whatever you are. */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11130 /* I can assure you that I am not in the least interested in your country, or anyone else's for that matter. */
EXIT

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN GNOBLEM2 GNOBLEM2.Afaaq.1
  @11131 /* Hmm, you remind me of my last visit to Calimport. Our host served us wonderfully exotic dishes seemingly out of thin air. He commanded someone like you, if I remember correctly. */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11132 /* (sigh) You are probably right about that. It saddens me that a great number of my kind has been degraded to serve self-centered mortal fools for their petty amusements. */
  == GNOBLEM2 @11133 /* Ah, I was right then.  You wouldn't be interested to serve me for sometime? I am a man of great influence and wealth. */
  == A7AFAAQ @11134 /* If you can not even take a broad hint, I will tell you bluntly that I have no interest to perform petty tricks for your amusement. */
  == GNOBLEM2 @11135 /* Hmm, you are a tough nut, indeed. Maybe your master is more amenable to-- */
  == A7AFAAQ @11136 /* If you do not stop bothering us further, I will teach you a lesson in humility you will not forget so easily. */
EXIT


// *** Trademeet ***
CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Dead("cefald01") Global("A7TalkedToGenie", "LOCALS", 0)~ THEN TRKID04 TRKID04.Afaaq.1
  #44421 /* ~Are you a genie?  The genies are rich and powerful, you know.~ */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11137 /* You are right, little one. But I am not as powerful as you think while I am bound to a djinni lamp. */
  == TRKID04 @11138 /* Aww, I hope you get free one day. */
  == A7AFAAQ @11139 /* Thank you, my girl.  Please accept a little present from me. */
  == TRKID04 @11140 /* Thank you, good sir. You are awfully nice for a genie. */ 
    DO ~SetInterrupt(FALSE) 
      ActionOverride("A7Afaaq", FaceObject(LastTalkedToBy)) 
      ActionOverride("A7Afaaq", SetSequence(SEQ_CAST)) 
      SmallWait(10) 
      CreateVisualEffectObject("SPRAISEI", Myself) 
      SmallWait(20) 
      DisplayString(Myself, @11001) 
      SmallWait(10) 
      SetInterrupt(TRUE)~
EXIT


// *** Amkethran ***
CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN AMBOY01 AMBOY01.Afaaq.1
  @11141 /* Wow, you are reeaally big. I bet you are a captain in Balthazar's army. */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11142 /* I have to disappoint you, little boy. I do not serve in any kind of army, neither here nor elsewhere. */
EXIT

APPEND AMGIRL01
  IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy, 0) OR(2) PartyHasItem("A7DJLMP") PartyHasItem("A7DJLMPA") Global("A7TalkedAboutGenie", "LOCALS", 0)~ AMGIRL01.Lamp.1
    SAY @11143 /* Oh, that shiny lamp looks soo beautiful.  I bet it is a magic lamp. Can I have it, <PRO_SIRMAAM>? */
    ++ @11144 /* I'm afraid not, little one. You see, that is a very special lamp, because a djinni is living inside. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 1)~ + AMGIRL01.Lamp.4
    ++ @11145 /* That isn't possible, because...this is a cursed lamp, and it will swallow little girls whole if they open the stopper. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 2)~ + AMGIRL01.Lamp.3
    ++ @11146 /* Never! And now get lost, girl! */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 3)~ + AMGIRL01.Lamp.2
  END

  IF ~~ AMGIRL01.Lamp.2
    SAY @11147 /* Eeek!!  Don't hurt me! */
    IF ~~ DO ~RunAwayFrom(LastTalkedToBy, 60)~ EXIT
  END

  IF ~~ AMGIRL01.Lamp.3
    SAY @11148 /* Noo, I don't want to be swallowed!  Especially not by shiny cursed lamps. */
    IF ~~ EXIT
  END

  IF ~~ AMGIRL01.Lamp.4
    SAY @11149 /* Really?  Mama always tells me wonderful stories about faraway places where the djinnis live. I so much want to meet a real djinni. */
    IF ~~ EXIT
  END
END

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedAboutGenie", "LOCALS", 1)~ THEN AMGIRL01 AMGIRL01.Afaaq.1
  @11150 /* You are the djinni from the lamp of the nice <PRO_LADYLORD>, aren't you?  You are really big. Can you make the bad people go away? They always push me around, and papa got hurt by one of them. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 4)~
  == A7AFAAQ @11151 /* Do not worry, little girl. Together with the nice <PRO_LADYLORD> I will make them go away very soon. */
  == AMGIRL01 @11152 /* Yay!  You are a nice man too. */
EXIT

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7TalkedAboutGenie", "LOCALS", 2)~ THEN AMGIRL01 AMGIRL01.Afaaq.2
  @11153 /* Huh?!  Did you come out of the lamp of that strange <PRO_MANWOMAN>?  I bet the lamp has swallowed you whole when you opened the stopper. */ DO ~SetGlobal("A7TalkedAboutGenie", "LOCALS", 4)~
  == A7AFAAQ @11154 /* I fear that strange <PRO_MANWOMAN> has pulled your leg, little girl. That lamp does not swallow people...usually. */
EXIT

CHAIN IF WEIGHT #-1 ~Race(LastTalkedToBy, GENIE) Name("A7Afaaq", LastTalkedToBy) Global("A7Quest5", "GLOBAL", 0) Global("A7TalkedToGenie", "LOCALS", 0)~ THEN AMMAN01 AMMAN01.Afaaq.1
  @11155 /* Are you one of them genies who visit the smugglers? */ DO ~SetGlobal("A7TalkedToGenie", "LOCALS", 1)~
  == A7AFAAQ @11156 /* I do not deal with smugglers. What are you talking about? */
  == AMMAN01 @11157 /* I heard that Esamon and his smugglers are meeting with genies and such in secret. They are surely hatching another scheme to thwart Balthazar's plans. */
  == A7AFAAQ @11158 /* I would not pay much attention to rumors and hearsay, good man. Genies do not usually deal with mortals, especially not with people of less than reputable character. */
EXIT

APPEND AMFEM01
  IF WEIGHT #-1 ~RandomNumLT(10, 4) !ReputationLT(LastTalkedToBy,7) GlobalLT("A7Quest5", "GLOBAL", 10)~ AMFEM01.Afaaq.1
    SAY @11159 /* I hear that Esamon's smugglers even deal with genies.  Do you think it's true? */
    IF ~~ EXIT
  END
END

