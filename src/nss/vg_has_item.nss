int StartingConditional()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
string sItem = "QuestItem"+sQuest;
object oItem = GetItemPossessedBy(oPC,sItem);
if (oItem == OBJECT_INVALID)
    {
    return FALSE;
    }
else return TRUE;
}
