// Counting the actual date from Year0 Month0 Day0 Hour0 in hours
int GetHourTimeZero(int iYear = 99999, int iMonth = 99, int iDay = 99, int iHour = 99)
{
  // Check if a specific Date/Time is forwarded to the function.
  // If no or invalid values are forwarded to the function, the current Date/Time will be used
  if (iYear > 30000)
    iYear = GetCalendarYear();
  if (iMonth > 12)
    iMonth = GetCalendarMonth();
  if (iDay > 28)
    iDay = GetCalendarDay();
  if (iHour > 23)
    iHour = GetTimeHour();
  //Calculate and return the "HourTimeZero"-TimeIndex
  int iHourTimeZero = (iYear)*12*28*24 + (iMonth-1)*28*24 + (iDay-1)*24 + iHour;
  return iHourTimeZero;
}
void main()
{
  // Script Settings (Variable Declaration)
  int iLevelAffected = 6;   // The min. PC Level at which the Rest-restrictions will be applied (1-20; default=2)
  int iRestDelay = 4;       // The ammount of hours a player must wait between Rests (Default = 8 hours)
  int iHostileRange = 10;   // The radius around the players that must be free of hostiles in order to rest.
                            // iHostileRange = 0: Hostile Check disabled
                            // iHostileRange = x; Radius of Hostile Check (x meters)
                            // This can be abused as some sort of "monster radar".
  // Variable Declarations
  object oPC = GetLastPCRested(); // This Script only affects Player Characters. Familiars, summoned creatures and probably henchmen WILL rest!
  if (GetHitDice (oPC) >= iLevelAffected) // Check if the rest-restrictions will be applied to the player
  {
    // ---------- Rest Event started ----------
    if (GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED)
    {
      // Check if since the last rest more than <iRestDelay> hours have passed.
      if (GetHourTimeZero() < GetLocalInt (oPC, "i_TI_LastRest") + iRestDelay) // i_TI_LastRest is 0 when the player enters the module
      {    // Resting IS NOT allowed
        AssignCommand (oPC, ClearAllActions()); // Prevent Resting
        SendMessageToPC (oPC, "You must wait " + IntToString (iRestDelay - (GetHourTimeZero() - GetLocalInt (oPC, "i_TI_LastRest"))) + " hour(s) before resting again.");
      }
      else // Resting IS possible
      {
        object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        if (iHostileRange == 0 || (iHostileRange != 0 && GetDistanceToObject(oCreature) <= IntToFloat(iHostileRange)))
        { // If Hostile Check disabled or no Hostiles within Hostile Radius: Initiate Resting
          object oRestbedroll = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_bedrolls", GetLocation (oPC), FALSE); // Place a static bedroll under the player
          SetLocalObject (oPC, "o_PL_Bedrollrest", oRestbedroll); // Temporary "global" variable. Gets deleted after deletion of the bedroll.
          SetLocalInt (oPC, "i_TI_LastRest", GetHourTimeZero()); // Set Last Rest Time
        }
        else
        { // Resting IS NOT allowed
          AssignCommand (oPC, ClearAllActions()); // Prevent Resting
          SendMessageToPC (oPC, "You can't rest. Hostiles nearby");
        }
      }
    }

    // ---------- Rest Event finished or aborted ----------
    if ((GetLastRestEventType() == REST_EVENTTYPE_REST_FINISHED || GetLastRestEventType() == REST_EVENTTYPE_REST_CANCELLED) && GetIsObjectValid(GetLocalObject (oPC, "o_PL_Bedrollrest")))
    { // If a bedroll was placed under the player: Delete it
     DestroyObject (GetLocalObject (oPC, "o_PL_Bedrollrest"), 0.0f);
     DeleteLocalObject (oPC, "o_PL_Bedrollrest");
    }
  }
}
