//::///////////////////////////////////////////////
//:: FileName gc_is_ammy
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 12:44:41 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables(Only these types can have damage immunity..
    if(GetLocalInt(GetPCSpeaker(), "CRAFT_SLOT") == INVENTORY_SLOT_CLOAK)
        return TRUE;

    return FALSE;
}
