void main()
{
object oPC = GetPCSpeaker();
AssignCommand(oPC, JumpToObject(GetWaypointByTag("DOCK1")));
DelayCommand(120.0, AssignCommand(oPC, JumpToObject(GetWaypointByTag("DOCK2"))));
}
