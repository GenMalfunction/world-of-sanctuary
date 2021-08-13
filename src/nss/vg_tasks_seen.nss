int StartingConditional()
{
object oPC = GetPCSpeaker();
int iQuestsSeen = GetLocalInt(oPC,"QuestsSeen");
if (iQuestsSeen==1)
    {
    return TRUE;
    }
else return FALSE;
}
