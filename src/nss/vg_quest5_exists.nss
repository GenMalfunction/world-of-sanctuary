int StartingConditional()
{
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest5 = GetLocalInt(oMod,"iQuest5"+sTaskMaster);
if (iQuest5!=0)
    {
    return TRUE;
    }
else return FALSE;
}
