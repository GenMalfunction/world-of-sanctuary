void main()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
string sItem = "QuestItem"+sQuest;
object oItem = GetItemPossessedBy(oPC,sItem);
ActionTakeItem(oItem,oPC);
}
