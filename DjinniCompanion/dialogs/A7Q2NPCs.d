// *** NPC dialog portions during Quest 2 ***
// Traified

// Jaheira comments the new jungle location
APPEND JAHEIRAJ
  IF ~AreaCheck("A77004") Global("A7Q2JungleComment", "LOCALS", 1)~ JungleQ2.1
    SAY @2204 /* It appears we have been transported far away from Amn. The climate and vegetation doesn't match anything found on the Sword Coast. */
    = @2205 /* I haven't visited places that far to the south yet, but I believe this forest belongs to the Jungles of Chult. */
    IF ~True()~ DO ~SetGlobal("A7Q2JungleComment", "LOCALS", 2)~ EXIT
    IF ~InParty("Cernd") !StateCheck("Cernd", CD_STATE_NOTVALID)~ DO ~SetGlobal("A7Q2JungleComment", "LOCALS", 2)~ EXTERN CERNDJ JungleQ2.Jaheira.1
  END
END

// Cernd comments the new jungle location
APPEND CERNDJ
  IF ~!InParty("jaheira") AreaCheck("A77004") Global("A7Q2JungleComment", "LOCALS", 1)~ JungleQ2.1
    SAY @2206 /* The sorcerous magics of the rakshasi have brought us far to the south. */
    = @2207 /* I recognize some of the plants from my studies, and the sound of the birds remind me of species I have observed during my visit of a druid grove to the south. */
    = @2208 /* The specimen to your far left is a coyol palm, easily recognizable by their sharp spines jutting out from the trunk. It-- */
    ++ @2209 /* Thank you Cernd, but I'm currently not in the mood to discuss the wonders of nature. Don't forget we are here to rescue Afaaq. */ + JungleQ2.2
    ++ @2210 /* Don't you have anything better to do than lecturing me about trees and bushes? We are here to get back the djinni lamp from the rakshasas. */ + JungleQ2.2
  END

  IF ~~ JungleQ2.2
    SAY @2211 /* It is never a waste of time to learn more about nature's beauty. But you are right, all in good time. We should move on carefully and remind the rakshasi about the value of balance. */
    IF ~~ DO ~SetGlobal("A7Q2JungleComment", "LOCALS", 2)~ EXIT
  END

  IF ~~ JungleQ2.Jaheira.1
    SAY @2212 /* You may be right, Jaheira. I recognize some of the plants from my studies, and the sound of the birds remind me of species I have observed during my visit of a druid grove to the south. */
    IF ~~ EXIT
  END
END
