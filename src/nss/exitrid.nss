void main()
{
   object listener = GetObjectByTag( "listener");
   if (listener != OBJECT_INVALID)
      DestroyObject(listener); // mute check
}
