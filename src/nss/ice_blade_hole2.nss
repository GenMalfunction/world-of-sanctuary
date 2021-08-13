string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
void main()
{
object oPC = GetClickingObject();
sSayThis = "This is where I slid down here.  It is too slippery to climb back up.";
AssignCommand(oPC, ClearAllActions(TRUE));
AssignCommand(oPC, ActionSpeakString(sSayThis, iTalkVolume));
}
