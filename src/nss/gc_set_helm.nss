void main()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_HEAD,GetPCSpeaker());
    nType = GetBaseItemType(oItem);
    int nSlot = INVENTORY_SLOT_HEAD;
    SetLocalInt(GetPCSpeaker(), "CRAFT_SLOT", nSlot);
    SetLocalInt(GetPCSpeaker(), "CRAFT_TYPE", nType);

}
