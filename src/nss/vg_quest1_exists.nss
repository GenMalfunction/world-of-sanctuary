int StartingConditional()
{
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest1 = GetLocalInt(oMod,"iQuest1"+sTaskMaster);
if (iQuest1!=0)
    {
    return TRUE;
    }
else return FALSE;
}
