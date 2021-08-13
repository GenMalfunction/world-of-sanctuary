              //Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

object oTarget;
oTarget = GetObjectByTag("HotDancer2");

AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0f, 30.0f));

}

