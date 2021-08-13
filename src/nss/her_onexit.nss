void main()
{
    float cleanupdelay = 30.0;

    if(!GetIsPC(GetExitingObject()) ) {
        return; }
    object oPC = GetExitingObject();
    if (!GetIsPC(oPC))
        return;
    oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (OBJECT_SELF == GetArea(oPC))
            return;
        else oPC = GetNextPC();
    }
    DelayCommand(cleanupdelay, ExecuteScript("areacleanup", OBJECT_SELF));
    ExecuteScript("despawnroom", OBJECT_SELF);
}
