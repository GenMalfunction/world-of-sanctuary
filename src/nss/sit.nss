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
    Seat = OBJECT_SELF;
    if (GetIsObjectValid(oPlayer)) {
        AssignCommand(oPlayer, ClearAllActions(TRUE));
        if (isSeatEmpty() == TRUE) {
            if (GetLocalInt(oPlayer, "emotesit") != 0) {
                ExecuteScript("cc_emote", oPlayer);
                DelayCommand(1.0, AssignCommand(oPlayer, ActionSit(Seat)));
            } else {
                AssignCommand(oPlayer, ActionSit(Seat));
            }
        }
    }
}

