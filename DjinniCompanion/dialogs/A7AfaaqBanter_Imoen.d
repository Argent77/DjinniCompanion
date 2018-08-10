// *** Banters with Imoen ***
// Traified

// Banter #1
CHAIN IF ~Global("A7BanterImoen", "GLOBAL", 1)~ THEN IMOEN2J Imoen2.0
  @14500 /* Hey Afaaq! Do you have any good stories to tell? */ DO ~IncrementGlobal("A7BanterImoen", "GLOBAL", 1)~
  == A7AFAAQ @14501 /* I have seen many events since I arrived on this plane and even took part in some of them. Not all were pleasant, and some should be buried in oblivion forever. However, I can give you an account of my time in the service of Caliph Hasib if you desire. */
  == IMOEN2J @14502 /* No, Afaaq. I want you to tell me a story. Something exciting or funny, or even romantic. The way you talk about your past sounds always so gloomy. */
  == A7AFAAQ @14503 /* I think I understand your concern. Then let me tell you the tale of the Mystic Gardens of Almraiven. */
  == IMOEN2J @14504 /* That sounds much better. But we shouldn't keep <CHARNAME> waiting too long. I'd love to listen to your tale when we set up camp tonight. */
  == A7AFAAQ @14505 /* You are right, Imoen. The tale is quite deep and requires patience as well as a sharp mind to understand all the intricacies of its underlying philosophy. */
  == IMOEN2J @14506 /* Afaaq?! */
  == A7AFAAQ @14507 /* Oh, do not worry too much. You will enjoy the tale nonetheless. */
EXIT

CHAIN IF ~Global("A7BanterImoen", "GLOBAL", 1)~ THEN IMOEN25J Imoen2.0
  @14500 /* Hey Afaaq! Do you have any good stories to tell? */ DO ~IncrementGlobal("A7BanterImoen", "GLOBAL", 1)~
  == A7AFAAQ @14501 /* I have seen many events since I arrived on this plane and even took part in some of them. Not all were pleasant, and some should be buried in oblivion forever. However, I can give you an account of my time in the service of Caliph Hasib if you desire. */
  == IMOEN25J @14502 /* No, Afaaq. I want you to tell me a story. Something exciting or funny, or even romantic. The way you talk about your past sounds always so gloomy. */
  == A7AFAAQ @14503 /* I think I understand your concern. Then let me tell you the tale of the Mystic Gardens of Almraiven. */
  == IMOEN25J @14504 /* That sounds much better. But we shouldn't keep <CHARNAME> waiting too long. I'd love to listen to your tale when we set up camp tonight. */
  == A7AFAAQ @14505 /* You are right, Imoen. The tale is quite deep and requires patience as well as a sharp mind to understand all the intricacies of its underlying philosophy. */
  == IMOEN25J @14506 /* Afaaq?! */
  == A7AFAAQ @14507 /* Oh, do not worry too much. You will enjoy the tale nonetheless. */
EXIT


// Banter #2
CHAIN IF ~Global("A7BanterImoen", "GLOBAL", 3)~ THEN IMOEN25J Imoen2.1
  @14550 /* Do you miss your home sometimes? */ DO ~IncrementGlobal("A7BanterImoen", "GLOBAL", 1)~
  == A7AFAAQ @14551 /* I am not yet so long away from my home plane in djinni terms. We are solitary creatures by nature. It is not unusual for a djinn to journey alone for an age or two. */
  = @14552 /* Do you have something on your mind? */
  == IMOEN25J @14553 /* No, not really. I've been thinking about my home in Candlekeep recently. About what would have happened if I had not followed <CHARNAME> when <PRO_HESHE> left with Gorion. I would certainly not have been through all this torture from Irenicus, and more. */
  == A7AFAAQ @14554 /* Having regrets about past decisions is a mortal quality. You have made your choices and were able to follow them through until now. Hardship is part of the journey. It molds your character and lets you become stronger and more experienced. */
  == IMOEN25J @14555 /* I guess so. If I had stayed in Candlekeep then I would have had to flee from other Bhaalspawns eventually. I might have even ended in Saradush with all the others. A horrible thought. */
  == A7AFAAQ @14556 /* That would have been one of countless paths you could have taken. Never forget that you can follow different branches at any given time. Having stayed at home would have as many possible outcomes as travelling with <CHARNAME>. */
  == IMOEN25J @14557 /* Yeah, but many times I feel as if I have little choice in what to do or where to go. Being a Bhaalspawn is pretty inconvenient at times. */
  == A7AFAAQ @14558 /* Your observation is not completely wrong. Many choices are made unconsciously, and sometimes they are influenced by other forces. Especially when your heritage comes into play. */
  = @14559 /* We djinn strongly believe in Fate, the grand plan of the universe that guides and sometimes forces us to follow a certain direction. But that doesn't mean you have no control over the choices you make in life. On the contrary, it is up to you which path you will take and the universe will follow suit. */
  == IMOEN25J @14560 /* That sounds really weird. But thank you anyway, Afaaq. I try to remember your words when I'm about to make another stupid choice. */
EXIT
