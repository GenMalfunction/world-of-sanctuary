void main()
{
  object riddledoor = GetObjectByTag("riddledoor");
  if (!GetIsOpen(riddledoor))
  {
     location loc = GetLocation(OBJECT_SELF);
     vector temp = GetPositionFromLocation(loc);
     vector zIndexCorrection = Vector(temp.x,temp.y,GetPositionFromLocation(GetLocation(riddledoor)).z);
     location correctedloc = Location(GetAreaFromLocation(loc),zIndexCorrection,90.0);

     object listener = CreateObject(OBJECT_TYPE_PLACEABLE,"listener",correctedloc); // remember, blueprint not tag.

     SetListenPattern(listener,"Mellon",1000); // whatever you want for a password,
     SetListening(listener,TRUE);
     int seconds;
     for (seconds = 1; seconds < 7; seconds++)
        DelayCommand(IntToFloat(seconds),SignalEvent(listener,EventUserDefined(1300)));
  }
}
