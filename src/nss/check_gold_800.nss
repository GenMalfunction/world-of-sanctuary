//::///////////////////////////////////////////////
//:: Name check gold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    this script checks if the player has enough money
*/
//:://////////////////////////////////////////////
//:: Created By: Koen
//:: Created On: 26/07/2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    // Get the player "talking" the phase priest
    object oPC = GetPCSpeaker();

    // cheking the players gold now
    int oGold = GetGold(oPC);
    // if enough money return true
    if (oGold >= 80000)
      {
        // The player has enough money
        return TRUE;
      }

    // The player hasn't enough money
    return FALSE;
}
