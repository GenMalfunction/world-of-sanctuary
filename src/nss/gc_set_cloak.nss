void main()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK,GetPCSpeaker());
    nType = GetBaseItemType(oItem);
    int nSlot = INVENTORY_SLOT_CLOAK;
    SetLocalInt(GetPCSpeaker(), "CRAFT_SLOT", nSlot);
    SetLocalInt(GetPCSpeaker(), "CRAFT_TYPE", nType);

}
