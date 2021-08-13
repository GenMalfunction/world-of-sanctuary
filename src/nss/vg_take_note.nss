void main()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
string sItem = "QuestItem"+sQuest;
object oNote = GetObjectByTag(sItem+"note");
ActionTakeItem(oNote,oPC);
}
