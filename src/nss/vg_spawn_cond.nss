int StartingConditional()
{
object oPC = GetPCSpeaker();
object oMod = GetModule();
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
int iQuest1 = GetLocalInt(oMod,"iQuest1"+sTaskMaster);
int iQuest2 = GetLocalInt(oMod,"iQuest2"+sTaskMaster);
int iQuest3 = GetLocalInt(oMod,"iQuest3"+sTaskMaster);
int iQuest4 = GetLocalInt(oMod,"iQuest4"+sTaskMaster);
int iQuest5 = GetLocalInt(oMod,"iQuest5"+sTaskMaster);

if (iQuest1==0&&iQuest2==0&&iQuest3==0&&iQuest4==0&&iQuest5==0)
    {
    SetLocalInt(oMod,"iQuest1"+sTaskMaster,1);
    SetLocalInt(oMod,"iQuest2"+sTaskMaster,1);
    SetLocalInt(oMod,"iQuest3"+sTaskMaster,1);
    SetLocalInt(oMod,"iQuest4"+sTaskMaster,1);
    SetLocalInt(oMod,"iQuest5"+sTaskMaster,1);
    return TRUE;
    }
else return FALSE;
}
