//::///////////////////////////////////////////////
//:: FileName gc_is_druid
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 11:46:37 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's class
    int iPassed = 0;
    if(GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) >= 1)
     return TRUE;


        return FALSE;


}
