void main()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
string sItem = "QuestItem"+sQuest;
CreateItemOnObject("questnote",oPC,1,sItem+"note");
}
