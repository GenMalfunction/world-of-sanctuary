int StartingConditional()
{
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest1 = GetLocalInt(oMod,"iQuest1"+sTaskMaster);
int iQuest2 = GetLocalInt(oMod,"iQuest2"+sTaskMaster);
int iQuest3 = GetLocalInt(oMod,"iQuest3"+sTaskMaster);
int iQuest4 = GetLocalInt(oMod,"iQuest4"+sTaskMaster);
int iQuest5 = GetLocalInt(oMod,"iQuest5"+sTaskMaster);
int iCountJobs = 0;

if (iQuest1!=0)
    {
    iCountJobs++;
    }
if (iQuest2!=0)
    {
    iCountJobs++;
    }
if (iQuest3!=0)
    {
    iCountJobs++;
    }
if (iQuest4!=0)
    {
    iCountJobs++;
    }
if (iQuest5!=0)
    {
    iCountJobs++;
    }
string sCountJobs = IntToString(iCountJobs);
SetCustomToken(50026, sCountJobs);
return TRUE;
}
