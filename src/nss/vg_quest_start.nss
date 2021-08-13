int StartingConditional()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
int iQuestStatus = GetLocalInt(oPC,"Quest"+sQuest);
if (iQuestStatus < 2)
        {
        return TRUE;
        }
else return FALSE;
}
