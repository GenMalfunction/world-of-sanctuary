void main()
{
object oPC = GetPCSpeaker();
object oMod = GetModule();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalInt(oPC,"Quest"+sQuest,2);
SetLocalInt(oMod,"Quest"+sQuest,2);
}
