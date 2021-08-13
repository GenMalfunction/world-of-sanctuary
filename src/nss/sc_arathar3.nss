//::///////////////////////////////////////////////
//:: FileName sc_arathar3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 29/07/02 15:23:23
//:://////////////////////////////////////////////
int StartingConditional()
{
   if(!(GetLocalInt(GetPCSpeaker(), "nAratharPers") == 0))
        return FALSE;
    // Make sure the player has the required skills
   if(!GetHasSkill(SKILL_PERSUADE, GetPCSpeaker()))
        return FALSE;

    return TRUE;
}
