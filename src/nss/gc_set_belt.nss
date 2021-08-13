void main()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_BELT,GetPCSpeaker());
    nType = GetBaseItemType(oItem);
    int nSlot = INVENTORY_SLOT_BELT;
    SetLocalInt(GetPCSpeaker(), "CRAFT_SLOT", nSlot);
    SetLocalInt(GetPCSpeaker(), "CRAFT_TYPE", nType);

}
