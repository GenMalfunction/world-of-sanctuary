void main()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,GetPCSpeaker());
    nType = GetBaseItemType(oItem);
    int nSlot = INVENTORY_SLOT_RIGHTHAND;
    SetLocalInt(GetPCSpeaker(), "CRAFT_SLOT", nSlot);
    SetLocalInt(GetPCSpeaker(), "CRAFT_TYPE", nType);

}
