// *** Dialog addition for Illasera ***

// Adds the djinni lamp to Illasera's inventory if the player has started a new TOB game
ADD_TRANS_TRIGGER ILLASERA 8 ~Global("A7AfaaqTOBOnly", "GLOBAL", 0)~
EXTEND_BOTTOM ILLASERA 8
  IF ~!Global("A7AfaaqTOBOnly", "GLOBAL", 0)~
    // A7DUMMY: stupid workaround for a buggy CreateItem() action
    DO ~CreateItem("A7DUMMY", 1, 0, 0) CreateItem("A7DJLMPA", 0, 0, 0) DestroyItem("A7DUMMY") SetGlobal("IllaseraHostile", "GLOBAL", 1) Enemy()~ EXIT
END

