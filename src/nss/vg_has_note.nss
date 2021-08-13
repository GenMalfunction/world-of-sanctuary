int StartingConditional()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
string sItem = "QuestItem"+sQuest;
string sNoteTag = sItem+"note";
object oItem = GetItemPossessedBy(oPC,sNoteTag);
if (oItem == OBJECT_INVALID)
    {
    return FALSE;
    }
else return TRUE;
}
