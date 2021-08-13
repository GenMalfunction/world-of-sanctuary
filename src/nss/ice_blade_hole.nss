void main()
{
if (GetIsOpen(OBJECT_SELF)){
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, JumpToObject(GetWaypointByTag("ICE_CAVE")));}
else {
    ActionOpenDoor(OBJECT_SELF);
    PlayAnimation(ANIMATION_PLACEABLE_OPEN);
    DelayCommand(10.0, ActionCloseDoor( OBJECT_SELF));
    DelayCommand(10.0, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
}
}
