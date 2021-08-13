int StartingConditional()
{
object oMod = GetModule();
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
int iQuestStatus = GetLocalInt(oMod,"Quest"+sQuest);
int iQuestStatusPC = GetLocalInt(oPC,"Quest"+sQuest);
if ((iQuestStatus > 1)&&(iQuestStatusPC < 2))
    {
    return TRUE;
    }
else return FALSE;
}
