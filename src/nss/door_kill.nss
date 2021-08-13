void main()
{
//    SpeakString(IntToString(GetLocalInt(GetArea(OBJECT_SELF), "kills")));
    if (GetLocalInt(GetArea(OBJECT_SELF), "kills") >= 4) {
        SetLocked(OBJECT_SELF, FALSE);
        ActionOpenDoor(OBJECT_SELF);
        SetLocalInt(GetArea(OBJECT_SELF), "kills", 0);
    } else {
        if (GetLocked(OBJECT_SELF) == TRUE) {
            SpeakString("You must kill the monsters before I will open!");
        }
    }
}
