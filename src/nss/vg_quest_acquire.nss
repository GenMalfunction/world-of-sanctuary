void main()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
string sItem = "QuestItem"+sQuest;

if (GetItemPossessedBy(oPC,sItem+"note")!=OBJECT_INVALID)
    {
    object oNote = GetObjectByTag(sItem+"note");
    ActionTakeItem(oNote,oPC);
    }

object oItem = GetItemPossessedBy(OBJECT_SELF,sItem);
ActionGiveItem(oItem,oPC);
}
