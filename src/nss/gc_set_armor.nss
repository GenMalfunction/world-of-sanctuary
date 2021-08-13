void main()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker());
    nType = GetBaseItemType(oItem);
    int nSlot = INVENTORY_SLOT_CHEST;
    SetLocalInt(GetPCSpeaker(), "CRAFT_SLOT", nSlot);
    SetLocalInt(GetPCSpeaker(), "CRAFT_TYPE", nType);
}
