// *** Banters with Jaheira ***
// TODO

// Dummy banter #1
CHAIN IF ~Global("InToB", "GLOBAL", 0) Global("A7BanterJaheira", "GLOBAL", 1)~ THEN JAHEIRAJ Jaheira.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == JAHEIRAJ ~....~
EXIT

CHAIN IF ~Global("InToB", "GLOBAL", 1) Global("A7BanterJaheira", "GLOBAL", 1)~ THEN JAHEI25J Jaheira.0
  ~(TODO: Dummy banter #1...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 2)~
  == A7AFAAQ ~...~
  == JAHEI25J ~....~
EXIT


// Dummy banter #2
CHAIN IF ~Name("Jaheira", LastTalkedToBy) Global("InToB", "GLOBAL", 0) Global("BanterActive", "LOCALS", 1) Global("A7BanterJaheira", "GLOBAL", 2)~ THEN A7AFAAQ Jaheira.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 4)~
  == JAHEIRAJ ~...~
  == A7AFAAQ ~....~
EXIT

CHAIN IF ~Name("Jaheira", LastTalkedToBy) Global("InToB", "GLOBAL", 1) Global("BanterActive", "LOCALS", 1) Global("A7BanterJaheira", "GLOBAL", 2)~ THEN A7AFAAQ Jaheira.1
  ~(TODO: Dummy banter #2...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 4)~
  == JAHEI25J ~...~
  == A7AFAAQ ~....~
EXIT



// Banter #1
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterJaheira", "GLOBAL", 0)~ THEN BJAHEIR Jaheira.0
  // ~(TODO: Jaheira inquires whether Afaaq hails from Calimshan, as most djinn on this plane call that region their home...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 1)~
  // == A7AFAAQ ~Afaaq tells her that he did live in Calimshan a long time ago...~
  // == BJAHEIR ~Jaheira reminds Calimshan of her deceased husband Khalid.~
  // = ~She tells him that she has unpleasant memories of that place because of its active slave trade in humans and other creatures.~
  // = ~That particular cultural aspect was always very strong there, that's why she took an active role to battle against it.~
  // == A7AFAAQ ~Afaaq tells her that this trait is very deeply grounded in the culture of the Calimshan people even a long time ago as most human tribes were nomadic in nature.~
  // == BJAHEIR ~Jaheira replies that she doesn't let it intimidate her and she will fight it as long as there is life in her bones.~
  // == A7AFAAQ ~Afaaq respects her resolve and tells her that he shares a similar belief.~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) GlobalGT("A7BanterIntro", "GLOBAL", 0) Global("A7BanterJaheira", "GLOBAL", 0)~ THEN BJAHEI25 Jaheira.0
  // ~(TODO: Jaheira inquires whether Afaaq hails from Calimshan, as most djinn on this plane call that region their home...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 1)~
  // == A7AFAAQ ~Afaaq tells her that he did live in Calimshan a long time ago...~
  // == BJAHEI25 ~Jaheira reminds Calimshan of her deceased husband Khalid.~
  // = ~She tells him that she has unpleasant memories of that place because of its active slave trade in humans and other creatures.~
  // = ~That particular cultural aspect was always very strong there, that's why she took an active role to battle against it.~
  // == A7AFAAQ ~Afaaq tells her that this trait is very deeply grounded in the culture of the Calimshan people even a long time ago as most human tribes were nomadic in nature.~
  // == BJAHEI25 ~Jaheira replies that she doesn't let it intimidate her and she will fight it as long as there is life in her bones.~
  // == A7AFAAQ ~Afaaq respects her resolve and tells her that he shares a similar belief.~
// EXIT


// Banter #2 (after Jaheira 'lured' CHARNAME into the Harper Stronghold)
// CHAIN IF ~Name("Jaheira", LastTalkedToBy) Global("BanterActive", "LOCALS", 1) Global("A7BanterJaheiraHarper", "GLOBAL", 0) Global("JaheiraTraitor", "GLOBAL", 1) Global("InToB", "GLOBAL", 0)~ THEN A7AFAAQ Jaheira.1
  // ~(TODO: Afaaq asks why she has joined the Harpers, as their nature is to stay in the background and deal with events their own way...)~ DO ~SetGlobal("A7BanterJaheiraHarper", "GLOBAL", 1)~
  // = ~While she is strong and forthcoming, acting without hesitation even if considerable danger is involved.~
  // == BJAHEIR ~Jaheira replies that both positions aren't mutually exclusive in any event. Sometimes it is better to stay your hands to serve the greater good. Even though it isn't always easy to do it, as she admitted truthfully.~
  // == A7AFAAQ ~Afaaq asks her what she personally thinks about the events in the Harper's Stronghold in Athkatla.~
  // == BJAHEIR ~Jaheira is convinced that there is a legitimate reason to act in regard of <CHARNAME>'s unique background, but she didn't like the methods used by Galvarey and his Harper friends.~
  // == A7AFAAQ ~Afaaq shares Jaheira's sentiment, but also mentions that mortals often tend to follow their own selfish interests, as he already experienced several times in the past.~
// EXIT

// CHAIN IF ~Name("Jaheira", LastTalkedToBy) Global("BanterActive", "LOCALS", 1) Global("A7BanterJaheiraHarper", "GLOBAL", 0) Global("JaheiraTraitor", "GLOBAL", 1) Global("InToB", "GLOBAL", 1)~ THEN A7AFAAQ Jaheira.1
  // ~(TODO: Afaaq asks why she has joined the Harpers, as their nature is to stay in the background and deal with events their own way...)~ DO ~SetGlobal("A7BanterJaheiraHarper", "GLOBAL", 1)~
  // = ~While she is strong and forthcoming, acting without hesitation even if considerable danger is involved.~
  // == BJAHEI25 ~Jaheira replies that both positions aren't mutually exclusive in any event. Sometimes it is better to stay your hands to serve the greater good. Even though it isn't always easy to do it, as she admitted truthfully.~
  // == A7AFAAQ ~Afaaq asks her what she personally thinks about the events in the Harper's Stronghold in Athkatla.~
  // == BJAHEI25 ~Jaheira is convinced that there is a legitimate reason to act in regard of <CHARNAME>'s unique background, but she didn't like the methods used by Galvarey and his Harper friends.~
  // == A7AFAAQ ~Afaaq shares Jaheira's sentiment, but also mentions that mortals often tend to follow their own selfish interests, as he already experienced several times in the past.~
// EXIT


// Banter #3 (after defeating Baron Ployer)
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7BanterJaheiraPloyer", "GLOBAL", 0) Global("JaheiraCursed", "GLOBAL", 10)~ THEN BJAHEIR Jaheira.2
  // ~(TODO: Jaheira curses Ployer for his thirst for revenge. She tells Afaaq how she together with Khalid and other members of the Harpers uncovered the crimes of Ployer, who was a powerful slave trader down in Calimshan. She was especially infuriated about the fact that the local authorities didn't really care about his business, as slave trade was a common activity in that region. She would have taken care of Ployer herself, but that would have meant to betray her own ideals and go against the principles of the Harpers to serve balance, instead of revenge...)~ DO ~SetGlobal("A7BanterJaheiraPloyer", "GLOBAL", 1)~
  // = ~Considering the recent events, however she wished that she would have done it back then regardless the consequences.~
  // == A7AFAAQ ~Afaaq notices the tears when she mentioned Khalid and asks about him.~
  // == BJAHEIR ~Jaheira tells him that he was her great love, and how she met him in Calimshan under less than fortunate circumstances, and tells angrily that she will take revenge on Irenicus for his death.~
  // == A7AFAAQ ~Afaaq shares her grief and remind her not to lose herself into revenge, as Khalid wouldn't like that.~
  // == BJAHEIR ~Jaheira snaps back to mind his own business, and shortly after apologizes for her rude behavior.~
// EXIT

// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7BanterJaheiraPloyer", "GLOBAL", 0) Global("JaheiraCursed", "GLOBAL", 10)~ THEN BJAHEI25 Jaheira.2
  // ~(TODO: Jaheira curses Ployer for his thirst for revenge. She tells Afaaq how she together with Khalid and other members of the Harpers uncovered the crimes of Ployer, who was a powerful slave trader down in Calimshan. She was especially infuriated about the fact that the local authorities didn't really care about his business, as slave trade was a common activity in that region. She would have taken care of Ployer herself, but that would have meant to betray her own ideals and go against the principles of the Harpers to serve balance, instead of revenge...)~ DO ~SetGlobal("A7BanterJaheiraPloyer", "GLOBAL", 1)~
  // = ~Considering the recent events, however she wished that she would have done it back then regardless the consequences.~
  // == A7AFAAQ ~Afaaq notices the tears when she mentioned Khalid and asks about him.~
  // == BJAHEI25 ~Jaheira tells him that he was her great love, and how she met him in Calimshan under less than fortunate circumstances, and tells angrily that she will take revenge on Irenicus for his death.~
  // == A7AFAAQ ~Afaaq shares her grief and remind her not to lose herself into revenge, as Khalid wouldn't like that.~
  // == BJAHEI25 ~Jaheira snaps back to mind his own business, and shortly after apologizes for her rude behavior.~
// EXIT


// Banter #4 (Note: "ZIJaheiraTalk" is part of a Khalid restoration mod. It doesn't make sense to fire this dialog if he's still alive and kicking)
// CHAIN IF ~Name("Jaheira", LastTalkedToBy) Global("BanterActive", "LOCALS", 1) Global("A7BanterJaheira", "GLOBAL", 1) Global("InToB", "GLOBAL", 1) Global("ZIJaheiraTalk", "GLOBAL", 0)~ THEN A7AFAAQ Jaheira.3
  // ~(TODO: Afaaq (in ToB) asks her how she feels to have avenged Khalid's death by defeating Irenicus...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 2)~
  // == BJAHEI25 ~Jaheira tells him that she acted first and foremost as a Harper and a fighter for balance to prevent any more harm to the elven community of Suldanessalar. But she also admits that she feels satisfied to have brought the murderer of Khalid to justice.~
  // == A7AFAAQ ~Afaaq is sure that his spirit will rest easy now, seeing how everything worked out.~
  // == BJAHEI25 IF ~Global("JaheiraRomanceActive", "GLOBAL", 2)~ THEN ~Jaheira blushes a bit and tells Afaaq that she is sure that Khalid would understand.~
  // == BJAHEI25 IF ~!Global("JaheiraRomanceActive", "GLOBAL", 2)~ THEN ~Jaheira agrees with Afaaq.~
// EXIT


// Banter #5 (if romancing, after Khalid illusion in abandoned temple of bhaal)
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) AreaType(OUTDOOR) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("A7BanterJaheira", "GLOBAL", 2) Global("LovedOne", "GLOBAL", 2) Global("A7Q5AfaaqAppears", "GLOBAL", 0) Global("JaheiraRomanceActive", "GLOBAL", 2) ~ THEN BJAHEI25 Jaheira.4
  // ~(TODO: Jaheira is infuriated about the foul spectre to impersonate Khalid. She is very agitated, but doesn't understand why...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 3)~
  // == A7AFAAQ ~Afaaq believes that her discomfort comes from the fact that she wasn't able to say a proper farewell to Khalid, as he has been ripped from her side unexpectedly.~
  // == BJAHEI25 ~Jaheira admits that he is right and tell Afaaq how she wished to tell him her thoughts a last time.~
  // == A7AFAAQ ~Afaaq is deeply moved by Jaheira's sentiments and offers her to make a wish for seeing him a last time.~
  // == BJAHEI25 ~Jaheira is emotionally overwhelmed by Afaaq's offer and wishes to see Khalid, so she can finally move on without guilt.~
    // // Cutscene: summoning animation, Khalid appears from a visual effects grave
    // DO ~ClearAllActions()
      // StartCutSceneMode()
      // StartCutScene("A7CUT04A")~
// EXIT

// Talk between Khalid and Jaheira
// BEGIN A7KHALID
// CHAIN IF ~InParty("Jaheira") Global("A7BanterJaheira", "GLOBAL", 3) Global("A7KhalidFarewell", "GLOBAL", 0)~ THEN A7KHALID Khalid.Farewell.1
  // ~(TODO: Khalid addresses Jaheira...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 4) SetGlobal("A7KhalidFarewell", "GLOBAL", 1)~
  // == BJAHEI25 ~Jaheira talks about something~
  // == A7KHALID ~Khalid replies to Jaheira's talk~
  // == BJAHEI25 ~Jaheira talks a bit more...~
  // == A7KHALID ~Khalid a last comment from Khalid and a farewell~
  // == BJAHEI25 ~Jaheira doesn't want him to let him go just yet~
  // == A7KHALID ~Khalid wishes her all the best and leaves forever (disappears using some visual effects)~
    // // Cutscene: Khalid disappears using some visual effects, setting global timer for next banter with Afaaq
    // DO ~RealSetGlobalTimer("A7BanterJaheiraTimer", "GLOBAL", 120)
      // ClearAllActions()
      // StartCutSceneMode()
      // StartCutScene("A7CUT04B")~
// EXIT


// Banter #6
// CHAIN IF ~See("A7Afaaq") !StateCheck("A7Afaaq", CD_STATE_NOTVALID) Global("A7AfaaqEnslaved", "GLOBAL", 0) Global("A7AfaaqUpgraded", "GLOBAL", 1) Global("A7BanterJaheira", "GLOBAL", 4) Global("A7KhalidFarewell", "GLOBAL", 1)~ THEN BJAHEI25 Jaheira.5
  // ~(TODO: Jaheira thanks Afaaq for this chance to break free from her guilt and self-doubt...)~ DO ~SetGlobal("A7BanterJaheira", "GLOBAL", 5)~
  // == A7AFAAQ ~Replies to Jaheira...~
// EXIT
