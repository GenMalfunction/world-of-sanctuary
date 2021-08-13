void main()
{
object oPC = GetPCSpeaker();
// We need to identify the quest number of the NPCs
// involved so we can work with the objects as needed
string sQuest = GetStringRight(GetTag(OBJECT_SELF),5);
// This is the kidnap victims tag
string sKNVictim = "QuestKNVictim"+sQuest;
// Lets make the kidnapping victim follow the PC
AssignCommand(GetObjectByTag(sKNVictim),ClearAllActions());
AssignCommand(GetObjectByTag(sKNVictim),ActionForceFollowObject(oPC,1.0));
}
