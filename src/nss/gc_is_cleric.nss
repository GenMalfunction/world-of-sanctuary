//::///////////////////////////////////////////////
//:: FileName gc_is_cleric
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 11:46:22 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's class
    if(GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) >= 1)
    {return TRUE;  }

    else
    { return FALSE;   }
}
