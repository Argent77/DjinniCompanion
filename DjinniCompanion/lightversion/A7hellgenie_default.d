// *** Greed Trial: Enslaved Genie (Bioware version) ***

ADD_TRANS_TRIGGER HELLGEN 10 ~!PartyHasItem("A7DJLMP")~
EXTEND_BOTTOM HELLGEN 10
  IF ~PartyHasItem("A7DJLMP")~ DO ~TakePartyItem("MISCBC") GiveItem("MISCB7",LastTalkedToBy) AddexperienceParty(20000) SetGlobal("Player1Greed","GLOBAL",1)~ + AfaaqUpgrade.1
END

ADD_STATE_TRIGGER HELLGEN 15 ~Global("A7PrepareAfaaq", "LOCALS", 0)~

APPEND HELLGEN
  IF ~~ AfaaqUpgrade.1
    SAY ~As you have helped me, I will help you too.~
    = ~You appear to have one of my own kind in your midst. By sacrificing your sword of power for my freedom, you have also given me the power to free your djinn from his shackles.~
    = ~Let me prepare the spell...~
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 1)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct2c")~ EXIT
    IF ~Global("A7AfaaqSummoned", "GLOBAL", 0)~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 1) StartCutSceneMode() StartCutScene("A7Q4ct2d")~ EXIT
  END

  IF ~Global("A7PrepareAfaaq", "LOCALS", 1)~ THEN AfaaqUpgrade.2
    SAY ~The casting will take only a moment...~ [A7SLNT_S]
    IF ~~ DO ~SetGlobal("A7PrepareAfaaq", "LOCALS", 2) TakePartyItem("A7DJLMP") ClearAllActions() StartCutSceneMode() StartCutScene("A7Q4ct3a")~ EXIT
  END

  IF ~Global("A7PrepareAfaaq", "LOCALS", 2)~ THEN AfaaqUpgrade.3
    SAY ~It is done.~ [A7SLNT_S]
    = ~I thank you again for my release. Good luck in whatever trials you are to face, my <PRO_LADYLORD>. And may your future shine brightly, Afaaq.~
    IF ~~ DO ~ActionOverride(Player1, CreateItem("A7DJLMPA", 0, 0, 0)) CreateVisualEffect("spplanar",[362.918]) Wait(2) DestroySelf()~ EXIT
  END
END
