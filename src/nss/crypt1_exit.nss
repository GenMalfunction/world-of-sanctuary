//::///////////////////////////////////////////////
//:: FileName sc_level_2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/4/04 9:55:00 PM
//:://////////////////////////////////////////////
void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);
if (GetHitDice(GetClickingObject()) >= 2)
    {
        AssignCommand(oClicker,JumpToLocation(lLoc));
    }
    else
    {
        SpeakString( "You aren't able to enter, yet.");
    }
}
