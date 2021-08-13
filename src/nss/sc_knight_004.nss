//::///////////////////////////////////////////////
//:: FileName sc_hermit_001
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/11/02 23:22:23
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "KnightPersuade") != 1))
        return FALSE;

    // Make sure the player has the required skills
    if(!GetHasSkill(SKILL_PERSUADE, GetPCSpeaker()))
        return FALSE;

    return TRUE;
}
