int StartingConditional()
{
 object oPC = GetPCSpeaker();
 int nType = GetLocalInt(oPC, "CRAFT_TYPE");

 //If the item they are trying to craft is not legal show this line..
 //If the item they are trying to craft is not legal show this line..
 if(nType== BASE_ITEM_BASTARDSWORD ||
    nType== BASE_ITEM_BATTLEAXE ||
    nType== BASE_ITEM_CLUB ||
    nType== BASE_ITEM_DAGGER ||
    nType== BASE_ITEM_DIREMACE ||
    nType== BASE_ITEM_DOUBLEAXE ||
    nType== BASE_ITEM_DWARVENWARAXE ||
    nType== BASE_ITEM_GREATAXE ||
    nType== BASE_ITEM_GREATSWORD ||
    nType== BASE_ITEM_HALBERD ||
    nType== BASE_ITEM_HANDAXE ||
    nType== BASE_ITEM_HEAVYFLAIL ||
    nType== BASE_ITEM_KAMA ||
    nType== BASE_ITEM_KATANA ||
    nType== BASE_ITEM_KUKRI ||
    nType== BASE_ITEM_LIGHTFLAIL ||
    nType== BASE_ITEM_LIGHTHAMMER ||
    nType== BASE_ITEM_LIGHTMACE ||
    nType== BASE_ITEM_LONGSWORD ||
    nType== BASE_ITEM_MORNINGSTAR ||
    nType== BASE_ITEM_QUARTERSTAFF ||
    nType== BASE_ITEM_RAPIER ||
    nType== BASE_ITEM_SCIMITAR ||
    nType== BASE_ITEM_SCYTHE ||
    nType== BASE_ITEM_SHORTSPEAR ||
    nType== BASE_ITEM_SHORTSWORD ||
    nType== BASE_ITEM_SICKLE ||
    nType== BASE_ITEM_TRIDENT ||
    nType== BASE_ITEM_TWOBLADEDSWORD ||
    nType== BASE_ITEM_WARHAMMER ||
    nType== BASE_ITEM_WHIP ||
    nType== BASE_ITEM_DART ||
    nType== BASE_ITEM_SHURIKEN ||
    nType== BASE_ITEM_THROWINGAXE)
//If it's a weapon don't show the line!
 return FALSE;

 //Otherwise show them the line
 return TRUE;
}
