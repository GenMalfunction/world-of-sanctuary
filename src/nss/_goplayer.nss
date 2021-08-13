          //Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0f, 30.0f));

}
