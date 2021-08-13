void main()
{
    object PC = GetLastKiller();
    object area = GetArea(OBJECT_SELF);

    SetLocalInt(area, "kills", GetLocalInt(area, "kills") + 1);
    int monster = GetLocalInt(PC, "monster");
    int points = FloatToInt(GetChallengeRating(OBJECT_SELF)) / 10;
    SetLocalInt(PC, "monster", monster + points);
    FloatingTextStringOnCreature(IntToString(points) + " monsterpoints", PC, TRUE);
    ExecuteScript("pointeffects", OBJECT_SELF);
}
