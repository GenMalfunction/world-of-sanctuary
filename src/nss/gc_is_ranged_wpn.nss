int StartingConditional()
{
 object oPC = GetPCSpeaker();

 int nType = GetLocalInt(oPC, "CRAFT_TYPE");

 //If the item they are trying to craft is not legal show this line..
 if(nType == BASE_ITEM_HEAVYCROSSBOW ||
    nType == BASE_ITEM_LIGHTCROSSBOW ||
    nType == BASE_ITEM_LONGBOW ||
    nType == BASE_ITEM_SHORTBOW ||
    nType == BASE_ITEM_SLING ||
    nType == BASE_ITEM_DART ||
    nType == BASE_ITEM_SHURIKEN ||
    nType == BASE_ITEM_THROWINGAXE)
 return TRUE;

 //Otherwise if they pass, then don't show this line
 return FALSE;
}
