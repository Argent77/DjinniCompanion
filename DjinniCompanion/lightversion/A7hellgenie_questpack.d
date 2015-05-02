// *** Greed Trial: Enslaved Genie (Questpack's "Revised Hell Trials" version) ***
// Traified

ADD_TRANS_TRIGGER HELLGEN 10 ~!PartyHasItem("A7DJLMP")~
EXTEND_BOTTOM HELLGEN 10
  IF ~PartyHasItem("A7DJLMP")~ DO ~TakePartyItem("MISCBC") GiveItem("MISCB7",LastTalkedToBy) AddexperienceParty(20000) SetGlobal("Player1Greed","GLOBAL",1)~ + AfaaqUpgrade.1
END

ADD_STATE_TRIGGER HELLGEN 15 ~Global("A7PrepareAfaaq", "LOCALS", 0)~
ADD_STATE_TRIGGER HELLGEN 20 ~!PartyHasItem("A7DJLMP")~

APPEND HELLGEN
  IF ~~ AfaaqUpgrade.1
    SAY @4180 /* As you have helped me, I will help you too. */
    = @4181 /* You appear to have one of my own kind in your midst. By sacrificing your sword of power for my freedom, you have also given me the power to free your djinn from his shackles. */
    IF ~~ + AfaaqUpgrade.3
  END

  IF ~Global("C7Geas", "GLOBAL", 2) PartyHasItem("A7DJLMP") Global("A7PrepareAfaaq", "LOCALS", 0)~ AfaaqUpgrade.2
    SAY @4182 /* It is done, my <PRO_LADYLORD>. Now that my freedom is guaranteed, I may help you too. */
    = @4183 /* You appear to have one of my own kind in your midst. If you lend me your sword of power for a moment, I can free your djinn from his shackles. Do not worry, the sword will not be damaged in the process. */
    IF ~~ DO ~GiveItem("MISCB7",LastTalkedToBy) AddexperienceParty(20000) SetGlobal("Player1Greed","GLOBAL",3)~ + AfaaqUpgrade.3
  END

  IF ~~ AfaaqUpgrade.3
    SAY @4184 /* Let me prepare the spell... */
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct2c")~ EXIT
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct2d")~ EXIT
  END

  IF ~Global("A7PrepareAfaaq", "LOCALS", 1)~ THEN AfaaqUpgrade.4
    SAY @4185 /* The casting will take only a moment... [A7SLNT_S] */
    IF ~~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 2) TakePartyItem("A7DJLMP") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct3a")~ EXIT
  END

  IF ~Global("A7PrepareAfaaq", "LOCALS", 2)~ THEN AfaaqUpgrade.5
    SAY @4186 /* It is done. [A7SLNT_S] */
    IF ~GlobalLT("C7Geas", "GLOBAL", 2)~ + AfaaqUpgrade.6
    IF ~Global("C7Geas", "GLOBAL", 2)~ DO ~SetGlobal("C7Geas","GLOBAL",3) IncrementGlobal("C7SinCounter","GLOBAL",1)~ + AfaaqUpgrade.7
  END
  
  IF ~~ THEN AfaaqUpgrade.6
    SAY @4051 /* I thank you again for my release. Good luck in whatever trials you are to face, my <PRO_LADYLORD>. And may your future shine brightly, Afaaq. */
    IF ~~ DO ~ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0)) CreateVisualEffect("spplanar",[362.918]) Wait(2) DestroySelf()~ EXIT
  END

  IF ~~ THEN AfaaqUpgrade.7
    SAY @4188 /* Good luck in whatever trials you are to face, my <PRO_LADYLORD>. And may your future shine brightly, Afaaq. */
    IF ~~ DO ~ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0)) CreateVisualEffect("spplanar",[362.918]) Wait(2) DestroySelf()~ EXIT
  END
END
