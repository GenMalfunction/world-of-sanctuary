void main()
{
object oPC = GetPCSpeaker();
object oMod = GetModule();
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
SetLocalInt(oPC,"Quest"+sQuest,4);
SetLocalInt(oMod,"iQuest"+sQuest,0);
}
