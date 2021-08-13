// 3 player unbreakable seat

object Seat;

int isSeatEmpty()
{
    object PC = GetSittingCreature(Seat);
    if (PC != OBJECT_INVALID) {
        if (GetCurrentAction(PC) != 37) {
            location loc = GetLocation(Seat);
            string ref = GetResRef(Seat);
            DestroyObject(Seat);
            Seat = CreateObject(OBJECT_TYPE_PLACEABLE, ref, loc);
            return TRUE;
        }
    } else {
        return TRUE;
    }
    return FALSE;
}

void main()
{
    object oPlayer = GetLastUsedBy();
    object Placeable = OBJECT_SELF;
    int sitsplaced = GetLocalInt(OBJECT_SELF, "sitsplaced");

    if(sitsplaced != 1) {
        object oArea = GetArea(Placeable);
        vector locBench = GetPosition(Placeable);
        float fOrient = GetFacing(Placeable);
        float fSpace = 0.6;
        location locsit1 = Location(oArea, locBench + AngleToVector(fOrient + 90.0f) * fSpace, fOrient);
        location locsit2 = Location(oArea, locBench + AngleToVector(fOrient - 90.0f) * fSpace, fOrient);
        location locsit3 = Location(oArea, locBench, fOrient);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", locsit1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", locsit2);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", locsit3);
        SetLocalInt(OBJECT_SELF, "sitsplaced", 1);
    }

    int iDistance = 1;
    Seat = GetNearestObjectByTag("InvisibleObject", oPlayer, iDistance);
    while(GetIsObjectValid(Seat) || iDistance <= 3) {
        if(isSeatEmpty()) {
            if (GetLocalInt(oPlayer, "emotesit") != 0) {
                ExecuteScript("cc_emote", oPlayer);
                DelayCommand(1.0, AssignCommand (oPlayer, ActionSit(Seat)));
            } else {
                AssignCommand (oPlayer, ActionSit(Seat));
            }
            return;
        }
        iDistance = iDistance + 1;
        Seat = GetNearestObjectByTag("InvisibleObject", oPlayer, iDistance);
    }
}
