//::///////////////////////////////////////////////
//:: FileName gc_dr_item_ok
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 12:44:41 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

//We don't want to allow stacking of Damage Reduction!
//So it can only go on the Boots / Shields / Helms

int nType = GetLocalInt(GetPCSpeaker(), "CRAFT_TYPE");

    if(nType == BASE_ITEM_LARGESHIELD ||
       nType == BASE_ITEM_SMALLSHIELD ||
       nType == BASE_ITEM_TOWERSHIELD ||
       nType == BASE_ITEM_BOOTS ||
       nType == BASE_ITEM_HELMET)
        return TRUE;

    return FALSE;
}
