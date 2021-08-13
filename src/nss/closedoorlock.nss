void main()
{
  // Get the door which has been opened
  object oDoor = OBJECT_SELF;

  // Wait for 6 seconds
  ActionWait(6.0);

  // Close the door
  ActionCloseDoor(oDoor);

  SetLocked(OBJECT_SELF,TRUE);
}
