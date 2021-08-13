void TimeOut(object chest)
{
    object item = GetFirstItemInInventory(chest);
    int cnt = GetLocalInt(chest, "cnt");
    if (cnt > 0) {
        cnt--;
        SetLocalInt(chest, "cnt", cnt);
        if (cnt == 0 && item != OBJECT_INVALID) {
            AssignCommand(chest, SpeakString("Time is up. All items left in here have been destroyed!"));
            while(item != OBJECT_INVALID) {
                DestroyObject(item, 1.0);
                item = GetNextItemInInventory(chest);
            }
        }
        if (cnt != 0) {
            DelayCommand(60.0, TimeOut(chest));
        } else {
            CreateObject(OBJECT_TYPE_PLACEABLE, GetResRef(chest), GetLocation(chest));
            DestroyObject(chest);
        }
    }
}

void main()
{
    object PC = GetLastUsedBy();
    object chest = OBJECT_SELF;
    string who = GetLocalString(OBJECT_SELF, "who");

    if (GetIsOpen(chest) == TRUE && who != GetPCPlayerName(PC)) {
        SetImmortal(PC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION,FALSE), PC, 0.0f);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), PC, 0.0f);
        return;
    }
    if (GetLocked(chest) == FALSE) return;
    if (who == "" || GetFirstItemInInventory() == OBJECT_INVALID) {
        SetLocalString(chest, "who", GetPCPlayerName(PC));
        if (GetLocalInt(OBJECT_SELF, "cnt") == 0)  {
            DelayCommand(60.0, TimeOut(OBJECT_SELF));
        }
        SetLocalInt(chest, "cnt", 6);
        SetLocked(chest, FALSE);
        AssignCommand(PC, DoPlaceableObjectAction(chest, PLACEABLE_ACTION_USE));
        DelayCommand(1.0, SetLocked(chest, TRUE));

        AssignCommand(PC, DoPlaceableObjectAction(OBJECT_SELF, PLACEABLE_ACTION_USE));
    } else if (who != GetPCPlayerName(PC)) {
        SpeakString("Only " + who + " can open this!");
    } else {
        if (GetLocalInt(OBJECT_SELF, "cnt") == 0)  {
            DelayCommand(60.0, TimeOut(OBJECT_SELF));
        }
        SetLocalInt(OBJECT_SELF, "cnt", 6);
        SetLocked(chest, FALSE);
        AssignCommand(PC, DoPlaceableObjectAction(chest, PLACEABLE_ACTION_USE));
        DelayCommand(1.0, SetLocked(chest, TRUE));
    }
    if (GetFirstItemInInventory() != OBJECT_INVALID && GetLocalInt(OBJECT_SELF, "cnt") == 0) {
        SetLocalInt(OBJECT_SELF, "cnt", 6);
    }
}
