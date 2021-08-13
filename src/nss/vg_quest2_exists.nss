int StartingConditional()
{
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest2 = GetLocalInt(oMod,"iQuest2"+sTaskMaster);
if (iQuest2!=0)
    {
    return TRUE;
    }
else return FALSE;
}
