void main()
{
  object oPC = GetLastPCRested();
  int iHostileRange = 30;

  // set a stack size
  // int i = 10;

  // set an object equal to the provisions on the player. This will be
  // OBJECT_INVALID if the player doesn't have any
  object oProvisions = GetItemPossessedBy(oPC, "RestProvisions");
  int i = 10 - Random(3);


if (GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED)
    {

        // Check if the PC has provisions, AND if it's a valid PC doing the resting
        // I didn't want to get involved in henchmen etc.
            if (oProvisions == OBJECT_INVALID && oPC != OBJECT_INVALID)
            {
                // didn't have provisions and is a valid PC
                AssignCommand (oPC, ClearAllActions());
                FloatingTextStringOnCreature ("You need provisions to rest", oPC);
            }
            else // player can rest
            {
                // get nearest creature check proximity hostility etc.
                object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

                    if (iHostileRange == 0 || (iHostileRange != 0 && GetDistanceToObject(oCreature) <= IntToFloat(iHostileRange)))
                    {
                        // Initiate Resting, make a Gangus bedroll
                        object oRestbedroll = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_bedrolls", GetLocation (oPC), FALSE);
                        SetLocalObject (oPC, "o_PL_Bedrollrest", oRestbedroll);

                        DestroyObject(oProvisions);
                        CreateItemOnObject("restprovisions", oPC, i);
                    }
                    else // Enemy too close for resting
                    {
                        AssignCommand (oPC, ClearAllActions());
                        FloatingTextStringOnCreature ("You can't rest with hostiles nearby", oPC);
                    }
            }
    }


    // Resting Finished or Cancelled
    if ((GetLastRestEventType() == REST_EVENTTYPE_REST_FINISHED || GetLastRestEventType() == REST_EVENTTYPE_REST_CANCELLED) && GetIsObjectValid(GetLocalObject (oPC, "o_PL_Bedrollrest")))
    {
        DestroyObject (GetLocalObject (oPC, "o_PL_Bedrollrest"), 0.0f);
        DeleteLocalObject (oPC, "o_PL_Bedrollrest");
    }


}
