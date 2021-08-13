void CreateIt(int typ, string id, location loc, object PC)
{
// SpeakString("Create " + typ);
    object oCreat = CreateObject(typ, id, loc, TRUE);
    SetLocalLocation(oCreat, "start", loc);
    if (GetIsPC(PC) == TRUE) AdjustReputation(PC, oCreat, 50-GetReputation(oCreat, PC));
}

void main()
{
    string ref = GetResRef(OBJECT_SELF);
    location loc = GetLocation(OBJECT_SELF);
    object PC = GetLastAttacker();
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(10.0, CreateIt(OBJECT_TYPE_CREATURE, ref, loc, PC)));
//    ClearPersonalReputation(PC);
    AssignCommand(GetLastAttacker(), ClearAllActions(TRUE));
}
