// mat
void main()
{
    object oPlayer = GetLastUsedBy();
    object Placeable = OBJECT_SELF;

    int sitsplaced = GetLocalInt(OBJECT_SELF, "sitsplaced");

    if(sitsplaced != 1) {
        object oArea = GetArea(Placeable);
        vector loc = GetPosition(Placeable);
        float fOrient = GetFacing(Placeable) - 90;

        location locsit1 = Location(oArea, loc, fOrient);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", locsit1);
        SetLocalInt(OBJECT_SELF, "sitsplaced", 1);
    }

    object sit = GetNearestObjectByTag("InvisibleObject", oPlayer);
    location loc = GetLocation(sit);
    object sitting = GetLocalObject(sit, "sitting");

    if(loc != GetLocation(sitting)) {
        SetLocalObject(sit, "sitting", oPlayer);
        AssignCommand(oPlayer, ActionJumpToLocation(loc));
        if (GetLocalInt(oPlayer, "emotesit") != 0) {
            ExecuteScript("cc_emote", oPlayer);
            DelayCommand(1.0, AssignCommand(oPlayer, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,0.0f,30000.0)));
        } else {
            AssignCommand(oPlayer, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,0.0f,30000.0));
        }
        return;
    }
}
