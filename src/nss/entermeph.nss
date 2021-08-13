void main()
{
object oPC = GetPCSpeaker();
AssignCommand(oPC, JumpToObject(GetWaypointByTag("entermeph")));
}
