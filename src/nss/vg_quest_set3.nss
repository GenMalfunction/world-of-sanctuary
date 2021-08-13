void main()
{
object oPC = GetPCSpeaker();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalInt(oPC,"Quest"+sQuest,3);
}
