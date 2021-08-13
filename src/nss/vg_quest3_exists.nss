int StartingConditional()
{
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest3 = GetLocalInt(oMod,"iQuest3"+sTaskMaster);
if (iQuest3!=0)
    {
    return TRUE;
    }
else return FALSE;
}
