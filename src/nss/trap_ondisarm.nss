void CreateObject2(int nObjectType, string sTemplate, location lLocation, int bUseAppearAnimation=FALSE);

void main()
{
    // Determine who Disarmed Trap
    object oPC = GetLastDisarmed();
    // Give XP equal to DisarmDC
    GiveXPToCreature(oPC, GetTrapDisarmDC(OBJECT_SELF));
    DelayCommand(598.0, CreateObject2(GetObjectType(OBJECT_SELF), GetResRef(OBJECT_SELF), GetLocation(OBJECT_SELF)));
    DelayCommand(600.0, DestroyObject(OBJECT_SELF));
}

void CreateObject2(int nObjectType, string sTemplate, location lLocation, int bUseAppearAnimation=FALSE)
{
    CreateObject(nObjectType, sTemplate, lLocation, bUseAppearAnimation);
    return;
}
