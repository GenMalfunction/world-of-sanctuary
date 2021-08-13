int StartingConditional()
{
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest4 = GetLocalInt(oMod,"iQuest4"+sTaskMaster);
if (iQuest4!=0)
    {
    return TRUE;
    }
else return FALSE;
}
