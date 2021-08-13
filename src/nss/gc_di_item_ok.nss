//::///////////////////////////////////////////////
//:: FileName gc_di_item_ok
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 12:44:41 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables(Only these types can have damage immunity..
    if(GetLocalInt(GetPCSpeaker(), "CRAFT_TYPE") == BASE_ITEM_AMULET ||
       GetLocalInt(GetPCSpeaker(), "CRAFT_TYPE") == BASE_ITEM_CLOAK ||
       GetLocalInt(GetPCSpeaker(), "CRAFT_TYPE") == BASE_ITEM_BELT)
        return TRUE;

    return FALSE;
}
