// mat for 2
void main()
{
    object oPlayer = GetLastUsedBy();
    object Placeable = OBJECT_SELF;

    int sitsplaced = GetLocalInt(OBJECT_SELF, "sitsplaced");

    if(sitsplaced != 1) {
        object oArea = GetArea(Placeable);
        vector loc = GetPosition(Placeable);
        float fOrient = GetFacing(Placeable) - 90;
        float fSpace = 0.65;

        location locsit1 = Location(oArea, loc + AngleToVector(fOrient + 90.0f) * fSpace, fOrient);
        location locsit2 = Location(oArea, loc + AngleToVector(fOrient - 90.0f) * fSpace, fOrient);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", locsit1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", locsit2);

        SetLocalInt(OBJECT_SELF, "sitsplaced", 1);
    }

    location loc;
    object sitting;
    int iDistance = 1;
    object sit = GetNearestObjectByTag("InvisibleObject", oPlayer, iDistance);
    while(iDistance <= 2) {
        loc = GetLocation(sit);
        sitting = GetLocalObject(sit, "sitting");
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
        iDistance++;
        object sit = GetNearestObjectByTag("InvisibleObject", oPlayer, iDistance);
    }
}
