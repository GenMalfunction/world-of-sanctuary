void main()
{
    object oItem = CreateItemOnObject("sfcraft_dagger");

    SetLocalString(OBJECT_SELF, "BASE", "1d4 Piercing [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
