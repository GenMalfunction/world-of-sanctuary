void main()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING,GetPCSpeaker());
    nType = GetBaseItemType(oItem);
    int nSlot = INVENTORY_SLOT_LEFTRING;
    SetLocalInt(GetPCSpeaker(), "CRAFT_SLOT", nSlot);
    SetLocalInt(GetPCSpeaker(), "CRAFT_TYPE", nType);

}
