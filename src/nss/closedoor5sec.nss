//::///////////////////////////////////////////////
//:: Name :closedoor5sec
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    place this script in the OnOpen of the door
*/
//:://////////////////////////////////////////////
//:: Created By: Koen
//:: Created On:01-06-2003
//:://////////////////////////////////////////////

// Automatically closes doors 6 seconds after they have been opened
void main()
{
  // Get the door which has been opened
  object oDoor = OBJECT_SELF;

  // Wait for 6 seconds
  ActionWait(6.0);

  // Close the door
  ActionCloseDoor(oDoor);
}
