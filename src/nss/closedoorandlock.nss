//:: Close and lock Door
//:://////////////////////////////////////////////
/*
    Closes the door and Locks it imediately
*/
//:://////////////////////////////////////////////
//:: Created By: Koen van LAngenhove
//:: Created On: 16-06-2003
//:://////////////////////////////////////////////
void main()
{
DelayCommand(10.0, ActionCloseDoor(OBJECT_SELF));
SetLocked(OBJECT_SELF,TRUE);
}
