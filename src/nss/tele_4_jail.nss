// This brings the player To jail
void main()
{
  SpeakString("You will be going to jail for this!!");
  // Get the PC
  object oPC = GetLastDisturbed();
  // Get The place he has to be teleported to
  DelayCommand(3.0, AssignCommand(oPC, JumpToObject(GetWaypointByTag("deathrow_wp"))));
  ActionWait(4.0);
  {
  SendMessageToPC(oPC, "The guards have taken you in and you where send to jail");
}
  string oName = GetName(oPC);
  SendMessageToAllDMs("oName" + " got himself send to the Jail");
}
