void main()
{
object oSpawnMaster;
{
    object PC = GetLastKiller();
    object area = GetArea(OBJECT_SELF);

    SpeakString(GetName(PC) + "... killed me!", TALKVOLUME_SHOUT);
    SetLocalInt(area, "kills", GetLocalInt(area, "kills") + 1);
    int monster = GetLocalInt(PC, "monster");
    int points = FloatToInt(GetChallengeRating(OBJECT_SELF)) / 10;
    SetLocalInt(PC, "monster", monster + points);
    FloatingTextStringOnCreature(IntToString(points) + " monsterpoints", PC, TRUE);
    ExecuteScript("pointeffects", OBJECT_SELF);
    AddJournalQuestEntry("Souls for Trade", 2, PC, TRUE, FALSE);
    AddJournalQuestEntry("The Dark Way", 1, PC, TRUE, FALSE);
}
}
